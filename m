Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c752910esm65449005e9.28.2025.01.16.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:03:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2E62060866;
	Thu, 16 Jan 2025 16:03:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 08/37] system/vl: more error exit into config enumeration code
Date: Thu, 16 Jan 2025 16:02:37 +0000
Message-Id: <20250116160306.1709518-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QunODxJ/pis+

All of the failures to configure devices will result in QEMU exiting
with an error code. In preparation for passing Error * down the chain
re-name the iterator to foreach_device_config_or_exit and exit using
&error_fatal instead of returning a failure indication.

Message-Id: <20250109170619.2271193-9-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

---
v3
  - split overly long line
---
 system/vl.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index be029c52ef..22c1444da4 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1307,7 +1307,15 @@ static void add_device_config(int type, const char *cmdline)
     QTAILQ_INSERT_TAIL(&device_configs, conf, next);
 }
 
-static int foreach_device_config(int type, int (*func)(const char *cmdline))
+/**
+ * foreach_device_config_or_exit(): process per-device configs
+ * @type: device_config type
+ * @func: device specific config function, returning pass/fail
+ *
+ * Any failure is fatal and we exit with an error message.
+ */
+static void foreach_device_config_or_exit(int type,
+                                          int (*func)(const char *cmdline))
 {
     struct device_config *conf;
     int rc;
@@ -1319,10 +1327,10 @@ static int foreach_device_config(int type, int (*func)(const char *cmdline))
         rc = func(conf->cmdline);
         loc_pop(&conf->loc);
         if (rc) {
-            return rc;
+            error_setg(&error_fatal, "failed to configure: %s", conf->cmdline);
+            exit(1);
         }
     }
-    return 0;
 }
 
 static void qemu_disable_default_devices(void)
@@ -2044,12 +2052,9 @@ static void qemu_create_late_backends(void)
     qemu_opts_foreach(qemu_find_opts("mon"),
                       mon_init_func, NULL, &error_fatal);
 
-    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
-        exit(1);
-    if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
-        exit(1);
-    if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
-        exit(1);
+    foreach_device_config_or_exit(DEV_SERIAL, serial_parse);
+    foreach_device_config_or_exit(DEV_PARALLEL, parallel_parse);
+    foreach_device_config_or_exit(DEV_DEBUGCON, debugcon_parse);
 
     /* now chardevs have been created we may have semihosting to connect */
     qemu_semihosting_chardev_init();
@@ -2667,8 +2672,7 @@ static void qemu_create_cli_devices(void)
 
     /* init USB devices */
     if (machine_usb(current_machine)) {
-        if (foreach_device_config(DEV_USB, usb_parse) < 0)
-            exit(1);
+        foreach_device_config_or_exit(DEV_USB, usb_parse);
     }
 
     /* init generic devices */
@@ -2715,10 +2719,8 @@ static bool qemu_machine_creation_done(Error **errp)
         exit(1);
     }
 
-    if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
-        error_setg(errp, "could not start gdbserver");
-        return false;
-    }
+    foreach_device_config_or_exit(DEV_GDB, gdbserver_start);
+
     if (!vga_interface_created && !default_vga &&
         vga_interface_type != VGA_NONE) {
         warn_report("A -vga option was passed but this machine "
-- 
2.39.5
