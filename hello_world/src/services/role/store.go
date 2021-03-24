package role

import (
	"review/pt"
	"review/src/models"

	"suntech.com.vn/skylib/skydba.git/skydba"
)

type RoleStore interface {
	Find(filterText string) (*pt.FindRoleResponse, error)
	Upsert(role *models.Role) (*models.Role, error)
	GetOne(id int64) (*pt.Role, error)
	Remove(id int64) error
}

type StoreDB struct {
	queryManager *skydba.Q
}

func DefaultStoreDB() StoreDB {
	return StoreDB{queryManager: skydba.DefaultQuery()}
}

func (store StoreDB) Find(filterText string) (*pt.FindRoleResponse, error) {
	const sql = `
		SELECT id, code, name
		FROM role
		WHERE document LIKE $1
		ORDER BY name
	`

	param := []interface{}{filterText}

	var roles []*pt.Role
	if err := store.queryManager.Query(sql, param, &roles); err != nil {
		return nil, err
	}

	return &pt.FindRoleResponse{
		Data: roles,
	}, nil
}

func (store StoreDB) Upsert(role *models.Role) (*models.Role, error) {
	beforeID := role.Id
	after, err := store.queryManager.UpsertWithID(role)
	if err != nil {
		return role, err
	}

	if beforeID == 0 { //insert
		return after.(*models.Role), nil
	} else { // update
		return role, nil
	}
}

func (store StoreDB) GetOne(id int64) (*pt.Role, error) {
	role := pt.Role{Id: id}
	if err := store.queryManager.ReadWithID(&role); err != nil {
		return nil, err
	}

	return &role, nil
}

func (store StoreDB) Remove(id int64) error {
	if _, err := store.queryManager.Remove(pt.Role{Id: id}); err != nil {
		return err
	}

	return nil
}
