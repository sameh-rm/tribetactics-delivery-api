-- Roles
INSERT INTO public.role(title) VALUES ( 'ADMIN');
INSERT INTO public.role(title) VALUES ( 'RESTAURANT');
INSERT INTO public.role(title) VALUES ( 'CUSTOMER');

-- Permissions
INSERT INTO public.permission(title) VALUES ('can-get:user');
INSERT INTO public.permission(title) VALUES ('can-getall:user');
INSERT INTO public.permission(title) VALUES ('can-create:user');
INSERT INTO public.permission(title) VALUES ('can-update:user');
INSERT INTO public.permission(title) VALUES ('can-delete:user');
INSERT INTO public.permission(title) VALUES ('can-get:restaurant');
INSERT INTO public.permission(title) VALUES ('can-getall:restaurant');
INSERT INTO public.permission(title) VALUES ('can-create:restaurant');
INSERT INTO public.permission(title) VALUES ('can-update:restaurant');
INSERT INTO public.permission(title) VALUES ('can-delete:restaurant');
INSERT INTO public.permission(title) VALUES ('can-get:foodmenu');
INSERT INTO public.permission(title) VALUES ('can-getall:foodmenu');
INSERT INTO public.permission(title) VALUES ('can-create:foodmenu');
INSERT INTO public.permission(title) VALUES ('can-update:foodmenu');
INSERT INTO public.permission(title) VALUES ('can-delete:foodmenu');
INSERT INTO public.permission(title) VALUES ('can-get:fooditem');
INSERT INTO public.permission(title) VALUES ('can-getall:fooditem');
INSERT INTO public.permission(title) VALUES ('can-create:fooditem');
INSERT INTO public.permission(title) VALUES ('can-update:fooditem');
INSERT INTO public.permission(title) VALUES ('can-delete:fooditem');
INSERT INTO public.permission(title) VALUES ('can-get:order');
INSERT INTO public.permission(title) VALUES ('can-getall:order');
INSERT INTO public.permission(title) VALUES ('can-create:order');
INSERT INTO public.permission(title) VALUES ('can-update:order');
INSERT INTO public.permission(title) VALUES ('can-delete:order');

-- Role Permissions
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 1);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 4);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 6);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 7);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 9);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 11);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 12);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 13);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 14);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 15);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 16);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 17);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 18);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 19);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 20);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 21);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 22);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (2, 24);

-- permissions
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 1);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 4);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 6);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 7);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 11);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 12);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 16);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 17);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 21);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 22);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 23);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 24);
INSERT INTO public.role_permissions(role_id, permission_id)
VALUES (3, 25);