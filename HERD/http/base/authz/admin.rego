package http.base.authz
import input

allow {
  input.account == "minioadmin"
}

# Make members of IAM groud s3admins the admins
allow {
  grp := input.claims.groups
  grp[_] == data.roles.permissions.admin_groups[_]
  startswith(input.claims.iss, data.roles.permissions.issuer)
}