Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e15sm27711843wrx.86.2020.12.14.07.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:30:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1B1131FF90;
	Mon, 14 Dec 2020 15:30:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 4/6] gdbstub: drop CPUEnv from gdb_exit()
Date: Mon, 14 Dec 2020 15:30:10 +0000
Message-Id: <20201214153012.12723-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214153012.12723-1-alex.bennee@linaro.org>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DVkJe+rVqEYm

gdb_exit() has never needed anything from env and I doubt we are going
to start now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h    | 2 +-
 bsd-user/syscall.c        | 6 +++---
 gdbstub.c                 | 2 +-
 linux-user/exit.c         | 2 +-
 target/arm/arm-semi.c     | 2 +-
 target/m68k/m68k-semi.c   | 2 +-
 target/nios2/nios2-semi.c | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 94d8f83e92..492db0f512 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -46,7 +46,7 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
 void gdb_set_stop_cpu(CPUState *cpu);
-void gdb_exit(CPUArchState *, int);
+void gdb_exit(int);
 #ifdef CONFIG_USER_ONLY
 /**
  * gdb_handlesig: yield control to gdb
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index d38ec7a162..adc3d21b54 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -333,7 +333,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
-        gdb_exit(cpu_env, arg1);
+        gdb_exit(arg1);
         qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
@@ -435,7 +435,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
-        gdb_exit(cpu_env, arg1);
+        gdb_exit(arg1);
         qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
@@ -514,7 +514,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
-        gdb_exit(cpu_env, arg1);
+        gdb_exit(arg1);
         qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
diff --git a/gdbstub.c b/gdbstub.c
index ec8daa002b..f6566c7b82 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3068,7 +3068,7 @@ static void gdb_read_byte(uint8_t ch)
 }
 
 /* Tell the remote gdb that the process has exited.  */
-void gdb_exit(CPUArchState *env, int code)
+void gdb_exit(int code)
 {
   char buf[4];
 
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 1594015444..70b344048c 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -34,6 +34,6 @@ void preexit_cleanup(CPUArchState *env, int code)
 #ifdef CONFIG_GCOV
         __gcov_dump();
 #endif
-        gdb_exit(env, code);
+        gdb_exit(code);
         qemu_plugin_atexit_cb();
 }
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index c892e0e674..5d5654bec0 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -1100,7 +1100,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
              */
             ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
         }
-        gdb_exit(env, ret);
+        gdb_exit(ret);
         exit(ret);
     case TARGET_SYS_SYNCCACHE:
         /*
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 8e5fbfc8fa..6230a789b6 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -194,7 +194,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
     args = env->dregs[1];
     switch (nr) {
     case HOSTED_EXIT:
-        gdb_exit(env, env->dregs[0]);
+        gdb_exit(env->dregs[0]);
         exit(env->dregs[0]);
     case HOSTED_OPEN:
         GET_ARG(0);
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index d7a80dd303..e508b2fafc 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -215,7 +215,7 @@ void do_nios2_semihosting(CPUNios2State *env)
     args = env->regs[R_ARG1];
     switch (nr) {
     case HOSTED_EXIT:
-        gdb_exit(env, env->regs[R_ARG0]);
+        gdb_exit(env->regs[R_ARG0]);
         exit(env->regs[R_ARG0]);
     case HOSTED_OPEN:
         GET_ARG(0);
-- 
2.20.1
