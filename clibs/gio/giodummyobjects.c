// Copyright 2014 The GTK+Android Developers. See the COPYRIGHT
// file at the top-level directory of this distribution and at
// https://github.com/eugals/GTKAndroid/wiki/COPYRIGHT.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.
//
// Author(s): Evgeny Sologubov
//
// Various dummy classes/functions to shut the linker up

#include "config.h"

#include "gunixvolumemonitor.h"
#include "gunixmounts.h"
#include "giomodule-priv.h"
#include "gfile.h"
#include "gportalsupport.h"
#include "gopenuriportal.h"

///////////////////////////////////////////////////////////////////////////////////////
// unix mounts

struct _GUnixMountEntry {
    char *mount_path;
    char *device_path;
    char *filesystem_type;
    gboolean is_read_only;
    gboolean is_system_internal;
};

gboolean g_unix_mounts_changed_since(guint64 time)
{
    return FALSE;
}

GUnixMountEntry *g_unix_mount_at(const char *mount_path, guint64 *time_read)
{
    return NULL;
}

gboolean g_unix_mount_is_readonly(GUnixMountEntry *mount_entry)
{
    return FALSE;
}

void g_unix_mount_free(GUnixMountEntry *mount_entry)
{
    g_return_if_fail(mount_entry != NULL);

    g_free(mount_entry->mount_path);
    g_free(mount_entry->device_path);
    g_free(mount_entry->filesystem_type);
    g_free(mount_entry);
}

///////////////////////////////////////////////////////////////////////////////////////
// GUnixVolumeMonitor

struct _GUnixVolumeMonitor {
    GNativeVolumeMonitor parent;
};

G_DEFINE_TYPE(GUnixVolumeMonitor, _g_unix_volume_monitor, G_TYPE_UNIX_VOLUME_MONITOR)

static void _g_unix_volume_monitor_class_init(GUnixVolumeMonitorClass *klass)
{
}

static void _g_unix_volume_monitor_init(GUnixVolumeMonitor *obj)
{
}

/* XDG Stuff */
int glib_should_use_portal() {
	return 0;
}

gboolean
g_openuri_portal_open_uri (const char  *uri,
                           const char  *parent_window,
                           GError     **error)
{
	return FALSE;
}

void
g_openuri_portal_open_uri_async (const char          *uri,
                                 const char          *parent_window,
                                 GCancellable        *cancellable,
                                 GAsyncReadyCallback  callback,
                                 gpointer             user_data)
{
}

gboolean
g_openuri_portal_open_uri_finish (GAsyncResult  *result,
                                  GError       **error)
{
  return FALSE;
}

GType g_portal_notification_backend_get_type (void)
{
	return G_TYPE_INVALID;
}

GType g_proxy_resolver_portal_get_type (void)
{
	return G_TYPE_INVALID;
}

GType g_network_monitor_portal_get_type (void)
{
	return G_TYPE_INVALID;
}

GList * g_document_portal_add_documents (GList       *uris,
                                         const char  *app_id,
                                         GError     **error)
{
	return NULL;
}

GUnixMountMonitor *
g_unix_mount_monitor_get (void)
{
  return NULL;
}
