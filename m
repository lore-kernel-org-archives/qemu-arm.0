Received: by 10.25.208.211 with SMTP id h202csp1719571lfg;
        Tue, 1 Mar 2016 08:33:19 -0800 (PST)
X-Received: by 10.140.132.149 with SMTP id 143mr27836206qhe.7.1456849999508;
        Tue, 01 Mar 2016 08:33:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si3043699qge.40.2016.03.01.08.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 08:33:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aanEc-0000gU-Vg
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 11:33:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aanEX-0000Zu-KV
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 11:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aanER-0000Lz-LS
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 11:33:13 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aanEO-0000L5-Hp; Tue, 01 Mar 2016 11:33:04 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aanEM-0005od-UQ; Tue, 01 Mar 2016 16:33:02 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 16:33:02 +0000
Message-Id: <1456849982-16445-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH] linux-user: Use direct syscalls for setuid(), etc
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t0nx4ps29Yyv

On Linux the setuid(), setgid(), etc system calls have different semantics
from the libc functions. The libc functions follow POSIX and update the
credentials for all threads in the process; the system calls update only
the thread which makes the call. (This impedance mismatch is worked around
in libc by signalling all threads to tell them to do a syscall, in a
byzantine and fragile way; see http://ewontfix.com/17/.)

Since in linux-user we are trying to emulate the system call semantics,
we must implement all these syscalls to directly call the underlying
host syscall, rather than calling the host libc function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
You can't really make much use of this bug fix at the moment,
because the glibc "update all threads" code running in the guest
will hit one of our signal handling races and deadlock, so trying
setuid() etc in a multithreaded program still won't work even with 
this patch. Still, this is the right thing and maybe one day we'll
sort out the race conditions... 

PS: note that setfsuid and setfsgid are different and don't have
"apply this to all threads" behaviour in libc, so no need to change those.

 linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9517531..00278f1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5032,6 +5032,40 @@ static inline int tswapid(int id)
 
 #endif /* USE_UID16 */
 
+/* We must do direct syscalls for setting UID/GID, because we want to
+ * implement the Linux system call semantics of "change only for this thread",
+ * not the libc/POSIX semantics of "change for all threads in process".
+ * (See http://ewontfix.com/17/ for more details.)
+ * We use the 32-bit version of the syscalls if present; if it is not
+ * then either the host architecture supports 32-bit UIDs natively with
+ * the standard syscall, or the 16-bit UID is the best we can do.
+ */
+#ifdef __NR_setuid32
+#define __NR_sys_setuid __NR_setuid32
+#else
+#define __NR_sys_setuid __NR_setuid
+#endif
+#ifdef __NR_setgid32
+#define __NR_sys_setgid __NR_setgid32
+#else
+#define __NR_sys_setgid __NR_setgid
+#endif
+#ifdef __NR_setresuid32
+#define __NR_sys_setresuid __NR_setresuid32
+#else
+#define __NR_sys_setresuid __NR_setresuid
+#endif
+#ifdef __NR_setresgid32
+#define __NR_sys_setresgid __NR_setresgid32
+#else
+#define __NR_sys_setresgid __NR_setresgid
+#endif
+
+_syscall1(int, sys_setuid, uid_t, uid)
+_syscall1(int, sys_setgid, gid_t, gid)
+_syscall3(int, sys_setresuid, uid_t, ruid, uid_t, euid, uid_t, suid)
+_syscall3(int, sys_setresgid, gid_t, rgid, gid_t, egid, gid_t, sgid)
+
 void syscall_init(void)
 {
     IOCTLEntry *ie;
@@ -8738,9 +8772,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_setresuid
     case TARGET_NR_setresuid:
-        ret = get_errno(setresuid(low2highuid(arg1),
-                                  low2highuid(arg2),
-                                  low2highuid(arg3)));
+        ret = get_errno(sys_setresuid(low2highuid(arg1),
+                                      low2highuid(arg2),
+                                      low2highuid(arg3)));
         break;
 #endif
 #ifdef TARGET_NR_getresuid
@@ -8759,9 +8793,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_getresgid
     case TARGET_NR_setresgid:
-        ret = get_errno(setresgid(low2highgid(arg1),
-                                  low2highgid(arg2),
-                                  low2highgid(arg3)));
+        ret = get_errno(sys_setresgid(low2highgid(arg1),
+                                      low2highgid(arg2),
+                                      low2highgid(arg3)));
         break;
 #endif
 #ifdef TARGET_NR_getresgid
@@ -8787,10 +8821,10 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
         break;
 #endif
     case TARGET_NR_setuid:
-        ret = get_errno(setuid(low2highuid(arg1)));
+        ret = get_errno(sys_setuid(low2highuid(arg1)));
         break;
     case TARGET_NR_setgid:
-        ret = get_errno(setgid(low2highgid(arg1)));
+        ret = get_errno(sys_setgid(low2highgid(arg1)));
         break;
     case TARGET_NR_setfsuid:
         ret = get_errno(setfsuid(arg1));
@@ -9072,7 +9106,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_setresuid32
     case TARGET_NR_setresuid32:
-        ret = get_errno(setresuid(arg1, arg2, arg3));
+        ret = get_errno(sys_setresuid(arg1, arg2, arg3));
         break;
 #endif
 #ifdef TARGET_NR_getresuid32
@@ -9091,7 +9125,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_setresgid32
     case TARGET_NR_setresgid32:
-        ret = get_errno(setresgid(arg1, arg2, arg3));
+        ret = get_errno(sys_setresgid(arg1, arg2, arg3));
         break;
 #endif
 #ifdef TARGET_NR_getresgid32
@@ -9118,12 +9152,12 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_setuid32
     case TARGET_NR_setuid32:
-        ret = get_errno(setuid(arg1));
+        ret = get_errno(sys_setuid(arg1));
         break;
 #endif
 #ifdef TARGET_NR_setgid32
     case TARGET_NR_setgid32:
-        ret = get_errno(setgid(arg1));
+        ret = get_errno(sys_setgid(arg1));
         break;
 #endif
 #ifdef TARGET_NR_setfsuid32
-- 
1.9.1

