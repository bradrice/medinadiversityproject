CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "last_name" varchar(150) NOT NULL);
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "wagtailcore_site" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "hostname" varchar(255) NOT NULL, "port" integer NOT NULL, "is_default_site" bool NOT NULL, "root_page_id" integer NOT NULL REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED, "site_name" varchar(255) NULL);
CREATE UNIQUE INDEX "wagtailcore_site_hostname_port_2c626d70_uniq" ON "wagtailcore_site" ("hostname", "port");
CREATE INDEX "wagtailcore_site_hostname_96b20b46" ON "wagtailcore_site" ("hostname");
CREATE INDEX "wagtailcore_site_root_page_id_e02fb95c" ON "wagtailcore_site" ("root_page_id");
CREATE TABLE IF NOT EXISTS "wagtailcore_collection" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "path" varchar(255) NOT NULL UNIQUE, "depth" integer unsigned NOT NULL CHECK ("depth" >= 0), "numchild" integer unsigned NOT NULL CHECK ("numchild" >= 0), "name" varchar(255) NOT NULL);
CREATE TABLE IF NOT EXISTS "wagtailcore_groupcollectionpermission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "collection_id" integer NOT NULL REFERENCES "wagtailcore_collection" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "wagtailcore_groupcollectionpermission_group_id_collection_id_permission_id_a21cefe9_uniq" ON "wagtailcore_groupcollectionpermission" ("group_id", "collection_id", "permission_id");
CREATE INDEX "wagtailcore_groupcollectionpermission_collection_id_5423575a" ON "wagtailcore_groupcollectionpermission" ("collection_id");
CREATE INDEX "wagtailcore_groupcollectionpermission_group_id_05d61460" ON "wagtailcore_groupcollectionpermission" ("group_id");
CREATE INDEX "wagtailcore_groupcollectionpermission_permission_id_1b626275" ON "wagtailcore_groupcollectionpermission" ("permission_id");
CREATE TABLE IF NOT EXISTS "wagtailcore_pagerevision" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "submitted_for_moderation" bool NOT NULL, "content_json" text NOT NULL, "approved_go_live_at" datetime NULL, "page_id" integer NOT NULL REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "created_at" datetime NOT NULL);
CREATE INDEX "wagtailcore_pagerevision_submitted_for_moderation_c682e44c" ON "wagtailcore_pagerevision" ("submitted_for_moderation");
CREATE INDEX "wagtailcore_pagerevision_page_id_d421cc1d" ON "wagtailcore_pagerevision" ("page_id");
CREATE INDEX "wagtailcore_pagerevision_user_id_2409d2f4" ON "wagtailcore_pagerevision" ("user_id");
CREATE INDEX "wagtailcore_pagerevision_created_at_66954e3b" ON "wagtailcore_pagerevision" ("created_at");
CREATE TABLE IF NOT EXISTS "wagtailcore_pageviewrestriction" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "page_id" integer NOT NULL REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED, "restriction_type" varchar(20) NOT NULL, "password" varchar(255) NOT NULL);
CREATE INDEX "wagtailcore_pageviewrestriction_page_id_15a8bea6" ON "wagtailcore_pageviewrestriction" ("page_id");
CREATE TABLE IF NOT EXISTS "wagtailcore_grouppagepermission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "page_id" integer NOT NULL REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_type" varchar(20) NOT NULL);
CREATE UNIQUE INDEX "wagtailcore_grouppagepermission_group_id_page_id_permission_type_0898bdf8_uniq" ON "wagtailcore_grouppagepermission" ("group_id", "page_id", "permission_type");
CREATE INDEX "wagtailcore_grouppagepermission_group_id_fc07e671" ON "wagtailcore_grouppagepermission" ("group_id");
CREATE INDEX "wagtailcore_grouppagepermission_page_id_710b114a" ON "wagtailcore_grouppagepermission" ("page_id");
CREATE TABLE IF NOT EXISTS "wagtailcore_collectionviewrestriction" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "restriction_type" varchar(20) NOT NULL, "password" varchar(255) NOT NULL, "collection_id" integer NOT NULL REFERENCES "wagtailcore_collection" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "wagtailcore_collectionviewrestriction_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "collectionviewrestriction_id" integer NOT NULL REFERENCES "wagtailcore_collectionviewrestriction" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "wagtailcore_pageviewrestriction_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "pageviewrestriction_id" integer NOT NULL REFERENCES "wagtailcore_pageviewrestriction" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "wagtailcore_collectionviewrestriction_collection_id_761908ec" ON "wagtailcore_collectionviewrestriction" ("collection_id");
CREATE UNIQUE INDEX "wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_group_id_988995ae_uniq" ON "wagtailcore_collectionviewrestriction_groups" ("collectionviewrestriction_id", "group_id");
CREATE INDEX "wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_47320efd" ON "wagtailcore_collectionviewrestriction_groups" ("collectionviewrestriction_id");
CREATE INDEX "wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3" ON "wagtailcore_collectionviewrestriction_groups" ("group_id");
CREATE UNIQUE INDEX "wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_group_id_d23f80bb_uniq" ON "wagtailcore_pageviewrestriction_groups" ("pageviewrestriction_id", "group_id");
CREATE INDEX "wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_f147a99a" ON "wagtailcore_pageviewrestriction_groups" ("pageviewrestriction_id");
CREATE INDEX "wagtailcore_pageviewrestriction_groups_group_id_6460f223" ON "wagtailcore_pageviewrestriction_groups" ("group_id");
CREATE TABLE IF NOT EXISTS "wagtailcore_page" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "path" varchar(255) NOT NULL UNIQUE, "depth" integer unsigned NOT NULL CHECK ("depth" >= 0), "numchild" integer unsigned NOT NULL CHECK ("numchild" >= 0), "title" varchar(255) NOT NULL, "slug" varchar(255) NOT NULL, "live" bool NOT NULL, "has_unpublished_changes" bool NOT NULL, "url_path" text NOT NULL, "seo_title" varchar(255) NOT NULL, "show_in_menus" bool NOT NULL, "search_description" text NOT NULL, "go_live_at" datetime NULL, "expire_at" datetime NULL, "expired" bool NOT NULL, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "owner_id" integer NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "locked" bool NOT NULL, "latest_revision_created_at" datetime NULL, "first_published_at" datetime NULL, "live_revision_id" integer NULL REFERENCES "wagtailcore_pagerevision" ("id") DEFERRABLE INITIALLY DEFERRED, "last_published_at" datetime NULL, "draft_title" varchar(255) NOT NULL);
CREATE INDEX "wagtailcore_page_slug_e7c11b8f" ON "wagtailcore_page" ("slug");
CREATE INDEX "wagtailcore_page_content_type_id_c28424df" ON "wagtailcore_page" ("content_type_id");
CREATE INDEX "wagtailcore_page_owner_id_fbf7c332" ON "wagtailcore_page" ("owner_id");
CREATE INDEX "wagtailcore_page_first_published_at_2b5dd637" ON "wagtailcore_page" ("first_published_at");
CREATE INDEX "wagtailcore_page_live_revision_id_930bd822" ON "wagtailcore_page" ("live_revision_id");
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE TABLE IF NOT EXISTS "taggit_tag" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL UNIQUE, "slug" varchar(100) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "taggit_taggeditem" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" integer NOT NULL, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "tag_id" integer NOT NULL REFERENCES "taggit_tag" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "taggit_taggeditem_object_id_e2d7d1df" ON "taggit_taggeditem" ("object_id");
CREATE INDEX "taggit_taggeditem_content_type_id_9957a03c" ON "taggit_taggeditem" ("content_type_id");
CREATE INDEX "taggit_taggeditem_tag_id_f4f5b767" ON "taggit_taggeditem" ("tag_id");
CREATE INDEX "taggit_taggeditem_content_type_id_object_id_196cc965_idx" ON "taggit_taggeditem" ("content_type_id", "object_id");
CREATE TABLE IF NOT EXISTS "wagtaildocs_document" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(255) NOT NULL, "file" varchar(100) NOT NULL, "created_at" datetime NOT NULL, "uploaded_by_user_id" integer NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "collection_id" integer NOT NULL REFERENCES "wagtailcore_collection" ("id") DEFERRABLE INITIALLY DEFERRED, "file_size" integer unsigned NULL CHECK ("file_size" >= 0), "file_hash" varchar(40) NOT NULL);
CREATE INDEX "wagtaildocs_document_uploaded_by_user_id_17258b41" ON "wagtaildocs_document" ("uploaded_by_user_id");
CREATE INDEX "wagtaildocs_document_collection_id_23881625" ON "wagtaildocs_document" ("collection_id");
CREATE TABLE IF NOT EXISTS "wagtailembeds_embed" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "url" varchar(200) NOT NULL, "max_width" smallint NULL, "type" varchar(10) NOT NULL, "html" text NOT NULL, "title" text NOT NULL, "author_name" text NOT NULL, "provider_name" text NOT NULL, "width" integer NULL, "height" integer NULL, "last_updated" datetime NOT NULL, "thumbnail_url" varchar(255) NULL);
CREATE UNIQUE INDEX "wagtailembeds_embed_url_max_width_8a2922d8_uniq" ON "wagtailembeds_embed" ("url", "max_width");
CREATE TABLE IF NOT EXISTS "wagtailforms_formsubmission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "form_data" text NOT NULL, "page_id" integer NOT NULL REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED, "submit_time" datetime NOT NULL);
CREATE INDEX "wagtailforms_formsubmission_page_id_e48e93e7" ON "wagtailforms_formsubmission" ("page_id");
CREATE TABLE IF NOT EXISTS "wagtailimages_image" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(255) NOT NULL, "file" varchar(100) NOT NULL, "width" integer NOT NULL, "height" integer NOT NULL, "created_at" datetime NOT NULL, "focal_point_x" integer unsigned NULL CHECK ("focal_point_x" >= 0), "focal_point_y" integer unsigned NULL CHECK ("focal_point_y" >= 0), "focal_point_width" integer unsigned NULL CHECK ("focal_point_width" >= 0), "focal_point_height" integer unsigned NULL CHECK ("focal_point_height" >= 0), "uploaded_by_user_id" integer NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "file_size" integer unsigned NULL CHECK ("file_size" >= 0), "collection_id" integer NOT NULL REFERENCES "wagtailcore_collection" ("id") DEFERRABLE INITIALLY DEFERRED, "file_hash" varchar(40) NOT NULL);
CREATE TABLE IF NOT EXISTS "wagtailimages_rendition" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "file" varchar(100) NOT NULL, "width" integer NOT NULL, "height" integer NOT NULL, "focal_point_key" varchar(16) NOT NULL, "filter_spec" varchar(255) NOT NULL, "image_id" integer NOT NULL REFERENCES "wagtailimages_image" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "wagtailimages_rendition_image_id_filter_spec_focal_point_key_323c8fe0_uniq" ON "wagtailimages_rendition" ("image_id", "filter_spec", "focal_point_key");
CREATE INDEX "wagtailimages_image_created_at_86fa6cd4" ON "wagtailimages_image" ("created_at");
CREATE INDEX "wagtailimages_image_uploaded_by_user_id_5d73dc75" ON "wagtailimages_image" ("uploaded_by_user_id");
CREATE INDEX "wagtailimages_image_collection_id_c2f8af7e" ON "wagtailimages_image" ("collection_id");
CREATE INDEX "wagtailimages_rendition_filter_spec_1cba3201" ON "wagtailimages_rendition" ("filter_spec");
CREATE INDEX "wagtailimages_rendition_image_id_3e1fd774" ON "wagtailimages_rendition" ("image_id");
CREATE TABLE IF NOT EXISTS "wagtailredirects_redirect" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "old_path" varchar(255) NOT NULL, "is_permanent" bool NOT NULL, "redirect_page_id" integer NULL REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED, "site_id" integer NULL REFERENCES "wagtailcore_site" ("id") DEFERRABLE INITIALLY DEFERRED, "redirect_link" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "wagtailredirects_redirect_old_path_site_id_783622d7_uniq" ON "wagtailredirects_redirect" ("old_path", "site_id");
CREATE INDEX "wagtailredirects_redirect_old_path_bb35247b" ON "wagtailredirects_redirect" ("old_path");
CREATE INDEX "wagtailredirects_redirect_redirect_page_id_b5728a8f" ON "wagtailredirects_redirect" ("redirect_page_id");
CREATE INDEX "wagtailredirects_redirect_site_id_780a0e1e" ON "wagtailredirects_redirect" ("site_id");
CREATE TABLE IF NOT EXISTS "wagtailsearch_query" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "query_string" varchar(255) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "wagtailsearch_querydailyhits" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "date" date NOT NULL, "hits" integer NOT NULL, "query_id" integer NOT NULL REFERENCES "wagtailsearch_query" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq" ON "wagtailsearch_querydailyhits" ("query_id", "date");
CREATE INDEX "wagtailsearch_querydailyhits_query_id_2185994b" ON "wagtailsearch_querydailyhits" ("query_id");
CREATE TABLE IF NOT EXISTS "wagtailsearch_editorspick" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "sort_order" integer NULL, "description" text NOT NULL, "query_id" integer NOT NULL REFERENCES "wagtailsearch_query" ("id") DEFERRABLE INITIALLY DEFERRED, "page_id" integer NOT NULL REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "wagtailsearch_editorspick_query_id_c6eee4a0" ON "wagtailsearch_editorspick" ("query_id");
CREATE INDEX "wagtailsearch_editorspick_page_id_28cbc274" ON "wagtailsearch_editorspick" ("page_id");
CREATE TABLE IF NOT EXISTS "wagtailusers_userprofile" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "submitted_notifications" bool NOT NULL, "approved_notifications" bool NOT NULL, "rejected_notifications" bool NOT NULL, "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "preferred_language" varchar(10) NOT NULL, "current_time_zone" varchar(40) NOT NULL, "avatar" varchar(100) NOT NULL);
CREATE TABLE IF NOT EXISTS "home_homepage" ("page_ptr_id" integer NOT NULL PRIMARY KEY REFERENCES "wagtailcore_page" ("id") DEFERRABLE INITIALLY DEFERRED, "banner_image_id" integer NULL REFERENCES "wagtailimages_image" ("id") DEFERRABLE INITIALLY DEFERRED, "banner_title" varchar(100) NULL, "left_col" text NOT NULL, "right_col" text NOT NULL);
CREATE INDEX "home_homepage_banner_image_id_ccdec6a2" ON "home_homepage" ("banner_image_id");