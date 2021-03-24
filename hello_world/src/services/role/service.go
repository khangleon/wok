package role

import (
	"context"
	"review/pt"
	"review/src/models"

	"google.golang.org/protobuf/types/known/emptypb"
	"suntech.com.vn/skylib/skyutl.git/skyutl"
)

type Service struct {
	store RoleStore
}

func DefaultService() Service {
	return Service{store: DefaultStoreDB()}
}

func (service Service) FindHandler(ctx context.Context, req *pt.FindRoleRequest) (*pt.FindRoleResponse, error) {
	return service.store.Find(req.FilterText)
}

func (service Service) UpsertHandler(ctx context.Context, req *pt.Role) (*pt.Role, error) {
	var mdRole models.Role

	if err := skyutl.ProtoStructConvert(req, &mdRole); err != nil {
		return req, err
	}
	mdRoleOut, err := service.store.Upsert(&mdRole)
	if err != nil {
		return req, err
	}
	var ptRole pt.Role
	if err := skyutl.ProtoStructConvert(mdRoleOut, &ptRole); err != nil {
		return req, err
	}

	return &ptRole, nil
}

func (service Service) DeleteHandler(ctx context.Context, req *pt.DeleteRoleRequest) (*emptypb.Empty, error) {
	if err := service.store.Remove(req.Id); err != nil {
		return nil, err
	}
	return &emptypb.Empty{}, nil
}

func (service Service) GetHandler(ctx context.Context, req *pt.GetRoleRequest) (*pt.Role, error) {
	return service.store.GetOne(req.Id)
}
