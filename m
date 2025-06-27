Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm77901285e9.5.2025.06.27.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:25:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 751FF5F889;
	Fri, 27 Jun 2025 12:25:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 03/15] semihosting/uaccess: Remove uses of target_ulong type
Date: Fri, 27 Jun 2025 12:24:59 +0100
Message-ID: <20250627112512.1880708-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627112512.1880708-1-alex.bennee@linaro.org>
References: <20250627112512.1880708-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p7fc/VGO9ksB

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Replace target_ulong by vaddr or size_t types to match
cpu_memory_rw_debug() prototype in "exec/cpu-common.h":

 >  int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 >                          void *ptr, size_t len,
 >                          bool is_write);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20250526095213.14113-2-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/semihosting/uaccess.h | 12 ++++++------
 semihosting/uaccess.c         | 10 +++++-----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/semihosting/uaccess.h b/include/semihosting/uaccess.h
index 6bc90b12d6..2093a49827 100644
--- a/include/semihosting/uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -15,9 +15,9 @@
 #endif
 
 #include "exec/cpu-common.h"
-#include "exec/cpu-defs.h"
 #include "exec/tswap.h"
 #include "exec/page-protection.h"
+#include "exec/vaddr.h"
 
 /**
  * get_user_u64:
@@ -89,8 +89,8 @@
  *
  * The returned pointer should be freed using uaccess_unlock_user().
  */
-void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
-                        target_ulong len, bool copy);
+void *uaccess_lock_user(CPUArchState *env, vaddr addr,
+                        size_t len, bool copy);
 /**
  * lock_user:
  *
@@ -103,7 +103,7 @@ void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
  *
  * The returned string should be freed using uaccess_unlock_user().
  */
-char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr);
+char *uaccess_lock_user_string(CPUArchState *env, vaddr addr);
 /**
  * uaccess_lock_user_string:
  *
@@ -112,10 +112,10 @@ char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr);
 #define lock_user_string(p) uaccess_lock_user_string(env, p)
 
 void uaccess_unlock_user(CPUArchState *env, void *p,
-                         target_ulong addr, target_ulong len);
+                         vaddr addr, size_t len);
 #define unlock_user(s, args, len) uaccess_unlock_user(env, s, args, len)
 
-ssize_t uaccess_strlen_user(CPUArchState *env, target_ulong addr);
+ssize_t uaccess_strlen_user(CPUArchState *env, vaddr addr);
 #define target_strlen(p) uaccess_strlen_user(env, p)
 
 #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 4554844e15..ff944d8c2f 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -14,8 +14,8 @@
 #include "exec/tlb-flags.h"
 #include "semihosting/uaccess.h"
 
-void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
-                        target_ulong len, bool copy)
+void *uaccess_lock_user(CPUArchState *env, vaddr addr,
+                        size_t len, bool copy)
 {
     void *p = malloc(len);
     if (p && copy) {
@@ -27,7 +27,7 @@ void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
     return p;
 }
 
-ssize_t uaccess_strlen_user(CPUArchState *env, target_ulong addr)
+ssize_t uaccess_strlen_user(CPUArchState *env, vaddr addr)
 {
     int mmu_idx = cpu_mmu_index(env_cpu(env), false);
     size_t len = 0;
@@ -75,7 +75,7 @@ ssize_t uaccess_strlen_user(CPUArchState *env, target_ulong addr)
     }
 }
 
-char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr)
+char *uaccess_lock_user_string(CPUArchState *env, vaddr addr)
 {
     ssize_t len = uaccess_strlen_user(env, addr);
     if (len < 0) {
@@ -85,7 +85,7 @@ char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr)
 }
 
 void uaccess_unlock_user(CPUArchState *env, void *p,
-                         target_ulong addr, target_ulong len)
+                         vaddr addr, size_t len)
 {
     if (len) {
         cpu_memory_rw_debug(env_cpu(env), addr, p, len, 1);
-- 
2.47.2
