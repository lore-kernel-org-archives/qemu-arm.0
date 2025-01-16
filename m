Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275562sm205033f8f.66.2025.01.16.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:03:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 966B56083E;
	Thu, 16 Jan 2025 16:03:06 +0000 (GMT)
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
Subject: [PATCH v3 02/37] semihosting/uaccess: Briefly document returned values
Date: Thu, 16 Jan 2025 16:02:31 +0000
Message-Id: <20250116160306.1709518-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5KfzvrJB982i

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since it is not obvious the get/put_user*() methods
can return an error, add brief docstrings about it.
Also remind to use *unlock_user() when appropriate.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20241212115413.42109-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/semihosting/uaccess.h | 55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/semihosting/uaccess.h b/include/semihosting/uaccess.h
index c2fa5a655d..6bc90b12d6 100644
--- a/include/semihosting/uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -19,41 +19,96 @@
 #include "exec/tswap.h"
 #include "exec/page-protection.h"
 
+/**
+ * get_user_u64:
+ *
+ * Returns: 0 on success, -1 on error.
+ */
 #define get_user_u64(val, addr)                                         \
     ({ uint64_t val_ = 0;                                               \
        int ret_ = cpu_memory_rw_debug(env_cpu(env), (addr),             \
                                       &val_, sizeof(val_), 0);          \
        (val) = tswap64(val_); ret_; })
 
+/**
+ * get_user_u32:
+ *
+ * Returns: 0 on success, -1 on error.
+ */
 #define get_user_u32(val, addr)                                         \
     ({ uint32_t val_ = 0;                                               \
        int ret_ = cpu_memory_rw_debug(env_cpu(env), (addr),             \
                                       &val_, sizeof(val_), 0);          \
        (val) = tswap32(val_); ret_; })
 
+/**
+ * get_user_u8:
+ *
+ * Returns: 0 on success, -1 on error.
+ */
 #define get_user_u8(val, addr)                                          \
     ({ uint8_t val_ = 0;                                                \
        int ret_ = cpu_memory_rw_debug(env_cpu(env), (addr),             \
                                       &val_, sizeof(val_), 0);          \
        (val) = val_; ret_; })
 
+/**
+ * get_user_ual:
+ *
+ * Returns: 0 on success, -1 on error.
+ */
 #define get_user_ual(arg, p) get_user_u32(arg, p)
 
+/**
+ * put_user_u64:
+ *
+ * Returns: 0 on success, -1 on error.
+ */
 #define put_user_u64(val, addr)                                         \
     ({ uint64_t val_ = tswap64(val);                                    \
        cpu_memory_rw_debug(env_cpu(env), (addr), &val_, sizeof(val_), 1); })
 
+/**
+ * put_user_u32:
+ *
+ * Returns: 0 on success, -1 on error.
+ */
 #define put_user_u32(val, addr)                                         \
     ({ uint32_t val_ = tswap32(val);                                    \
        cpu_memory_rw_debug(env_cpu(env), (addr), &val_, sizeof(val_), 1); })
 
+/**
+ * put_user_ual:
+ *
+ * Returns: 0 on success, -1 on error.
+ */
 #define put_user_ual(arg, p) put_user_u32(arg, p)
 
+/**
+ * uaccess_lock_user:
+ *
+ * The returned pointer should be freed using uaccess_unlock_user().
+ */
 void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
                         target_ulong len, bool copy);
+/**
+ * lock_user:
+ *
+ * The returned pointer should be freed using unlock_user().
+ */
 #define lock_user(type, p, len, copy) uaccess_lock_user(env, p, len, copy)
 
+/**
+ * uaccess_lock_user_string:
+ *
+ * The returned string should be freed using uaccess_unlock_user().
+ */
 char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr);
+/**
+ * uaccess_lock_user_string:
+ *
+ * The returned string should be freed using unlock_user().
+ */
 #define lock_user_string(p) uaccess_lock_user_string(env, p)
 
 void uaccess_unlock_user(CPUArchState *env, void *p,
-- 
2.39.5
