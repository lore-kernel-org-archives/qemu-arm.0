Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fbc90e030csm1682204wmc.37.2023.06.30.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9EDD21FFD7;
	Fri, 30 Jun 2023 19:04:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 32/38] linux-user: Add "safe" parameter to do_guest_openat()
Date: Fri, 30 Jun 2023 19:04:17 +0100
Message-Id: <20230630180423.558337-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: H9gn+ezl5M/J

From: Ilya Leoshkevich <iii@linux.ibm.com>

gdbstub cannot meaningfully handle QEMU_ERESTARTSYS, and it doesn't
need to. Add a parameter to do_guest_openat() that makes it use
openat() instead of safe_openat(), so that it becomes usable from
gdbstub.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230621203627.1808446-3-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/qemu.h    |  2 +-
 linux-user/syscall.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index a5830ec239..9b8e0860d7 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -166,7 +166,7 @@ typedef struct TaskState {
 
 abi_long do_brk(abi_ulong new_brk);
 int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
-                    int flags, mode_t mode);
+                    int flags, mode_t mode, bool safe);
 ssize_t do_guest_readlink(const char *pathname, char *buf, size_t bufsiz);
 
 /* user access */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index fa83737192..ecd9f5e23d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8449,7 +8449,7 @@ static int open_hardware(CPUArchState *cpu_env, int fd)
 #endif
 
 int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
-                    int flags, mode_t mode)
+                    int flags, mode_t mode, bool safe)
 {
     struct fake_open {
         const char *filename;
@@ -8476,7 +8476,11 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        return safe_openat(dirfd, exec_path, flags, mode);
+        if (safe) {
+            return safe_openat(dirfd, exec_path, flags, mode);
+        } else {
+            return openat(dirfd, exec_path, flags, mode);
+        }
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
@@ -8518,7 +8522,11 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
         return fd;
     }
 
-    return safe_openat(dirfd, path(pathname), flags, mode);
+    if (safe) {
+        return safe_openat(dirfd, path(pathname), flags, mode);
+    } else {
+        return openat(dirfd, path(pathname), flags, mode);
+    }
 }
 
 ssize_t do_guest_readlink(const char *pathname, char *buf, size_t bufsiz)
@@ -9027,7 +9035,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return -TARGET_EFAULT;
         ret = get_errno(do_guest_openat(cpu_env, AT_FDCWD, p,
                                   target_to_host_bitmask(arg2, fcntl_flags_tbl),
-                                  arg3));
+                                  arg3, true));
         fd_trans_unregister(ret);
         unlock_user(p, arg1, 0);
         return ret;
@@ -9037,7 +9045,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return -TARGET_EFAULT;
         ret = get_errno(do_guest_openat(cpu_env, arg1, p,
                                   target_to_host_bitmask(arg3, fcntl_flags_tbl),
-                                  arg4));
+                                  arg4, true));
         fd_trans_unregister(ret);
         unlock_user(p, arg2, 0);
         return ret;
-- 
2.39.2
