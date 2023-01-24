Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id az41-20020a05600c602900b003dab77aa911sm14298103wmb.23.2023.01.24.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7E6351FFCB;
	Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH v2 23/35] semihosting: Write back semihosting data before completion callback
Date: Tue, 24 Jan 2023 18:01:15 +0000
Message-Id: <20230124180127.1881110-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: H2dN+EtZCZZr

From: Keith Packard <keithp@keithp.com>

'lock_user' allocates a host buffer to shadow a target buffer,
'unlock_user' copies that host buffer back to the target and frees the
host memory. If the completion function uses the target buffer, it
must be called after unlock_user to ensure the data are present.

This caused the arm-compatible TARGET_SYS_READC to fail as the
completion function, common_semi_readc_cb, pulled data from the target
buffer which would not have been gotten the console data.

I decided to fix all instances of this pattern instead of just the
console_read function to make things consistent and potentially fix
bugs in other cases.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221012014822.1242170-1-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/syscalls.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 5893c760c5..ba28194b59 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -319,11 +319,11 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     ret = RETRY_ON_EINTR(read(gf->hostfd, ptr, len));
     if (ret == -1) {
-        complete(cs, -1, errno);
         unlock_user(ptr, buf, 0);
+        complete(cs, -1, errno);
     } else {
-        complete(cs, ret, 0);
         unlock_user(ptr, buf, ret);
+        complete(cs, ret, 0);
     }
 }
 
@@ -339,8 +339,8 @@ static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = write(gf->hostfd, ptr, len);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -426,8 +426,8 @@ static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
             ret = -1;
         }
     }
-    complete(cs, ret, err);
     unlock_user(name, fname, 0);
+    complete(cs, ret, err);
 }
 
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -444,8 +444,8 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = remove(p);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(p, fname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -469,9 +469,9 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = rename(ostr, nstr);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(ostr, oname, 0);
     unlock_user(nstr, nname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -488,8 +488,8 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = system(p);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(p, cmd, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -554,8 +554,8 @@ static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     memcpy(ptr, gf->staticfile.data + gf->staticfile.off, len);
     gf->staticfile.off += len;
-    complete(cs, len, 0);
     unlock_user(ptr, buf, len);
+    complete(cs, len, 0);
 }
 
 static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -608,8 +608,8 @@ static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_read(cs, ptr, len);
-    complete(cs, ret, 0);
     unlock_user(ptr, buf, ret);
+    complete(cs, ret, 0);
 }
 
 static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -624,8 +624,8 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_write(ptr, len);
-    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-- 
2.34.1
