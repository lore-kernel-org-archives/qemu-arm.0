Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b5asm238633f8f.21.2025.01.16.08.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:12:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B1806608D2;
	Thu, 16 Jan 2025 16:03:08 +0000 (GMT)
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
Subject: [PATCH v3 23/37] win32: remove usage of attribute gcc_struct
Date: Thu, 16 Jan 2025 16:02:52 +0000
Message-Id: <20250116160306.1709518-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5JJ60vM3hinP

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This attribute is not recognized by clang.

An investigation has been performed to ensure this attribute has no
effect on layout of structures we use in QEMU [1], so it's safe to
remove now.

In the future, we'll forbid introducing new bitfields in packed struct,
as they are the one potentially impacted by this change.

[1] https://lore.kernel.org/qemu-devel/66c346de-7e20-4831-b3eb-1cda83240af9@linaro.org/

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Stefan Weil <sw@weilnetz.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20250110203401.178532-2-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                               | 5 -----
 include/qemu/compiler.h                   | 7 +------
 scripts/cocci-macro-file.h                | 6 +-----
 subprojects/libvhost-user/libvhost-user.h | 6 +-----
 4 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/meson.build b/meson.build
index d06f59095c..da279cc112 100644
--- a/meson.build
+++ b/meson.build
@@ -377,11 +377,6 @@ elif host_os == 'sunos'
   qemu_common_flags += '-D__EXTENSIONS__'
 elif host_os == 'haiku'
   qemu_common_flags += ['-DB_USE_POSITIVE_POSIX_ERRORS', '-D_BSD_SOURCE', '-fPIC']
-elif host_os == 'windows'
-  if not compiler.compiles('struct x { int y; } __attribute__((gcc_struct));',
-                           args: '-Werror')
-    error('Your compiler does not support __attribute__((gcc_struct)) - please use GCC instead of Clang')
-  endif
 endif
 
 # Choose instruction set (currently x86-only)
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c06954ccb4..d904408e5e 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -22,12 +22,7 @@
 #define QEMU_EXTERN_C extern
 #endif
 
-#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
-# define QEMU_PACKED __attribute__((gcc_struct, packed))
-#else
-# define QEMU_PACKED __attribute__((packed))
-#endif
-
+#define QEMU_PACKED __attribute__((packed))
 #define QEMU_ALIGNED(X) __attribute__((aligned(X)))
 
 #ifndef glue
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index d247a5086e..c64831d540 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -23,11 +23,7 @@
 #define G_GNUC_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define G_GNUC_NULL_TERMINATED __attribute__((sentinel))
 
-#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
-# define QEMU_PACKED __attribute__((gcc_struct, packed))
-#else
-# define QEMU_PACKED __attribute__((packed))
-#endif
+#define QEMU_PACKED __attribute__((packed))
 
 #define cat(x,y) x ## y
 #define cat2(x,y) cat(x,y)
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index deb40e77b3..2ffc58c11b 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -186,11 +186,7 @@ typedef struct VhostUserShared {
     unsigned char uuid[UUID_LEN];
 } VhostUserShared;
 
-#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
-# define VU_PACKED __attribute__((gcc_struct, packed))
-#else
-# define VU_PACKED __attribute__((packed))
-#endif
+#define VU_PACKED __attribute__((packed))
 
 typedef struct VhostUserMsg {
     int request;
-- 
2.39.5
