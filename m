Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id y4-20020adfd084000000b0028e55b44a99sm2366949wrh.17.2023.01.24.10.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 959431FFCC;
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
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 24/35] semihosting: add O_BINARY flag in host_open for NT compatibility
Date: Tue, 24 Jan 2023 18:01:16 +0000
Message-Id: <20230124180127.1881110-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: y6XRZbud4ESL

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

Windows open(2) implementation opens files in text mode by default and
needs a Windows-only O_BINARY flag to open files as binary. QEMU already
knows about that flag in osdep and it is defined to 0 on non-Windows,
so we can just add it to the host_flags for better compatibility.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/syscalls.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index ba28194b59..e89992cf90 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -253,7 +253,7 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
 {
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
     char *p;
-    int ret, host_flags;
+    int ret, host_flags = O_BINARY;
 
     ret = validate_lock_user_string(&p, cs, fname, fname_len);
     if (ret < 0) {
@@ -262,11 +262,11 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     if (gdb_flags & GDB_O_WRONLY) {
-        host_flags = O_WRONLY;
+        host_flags |= O_WRONLY;
     } else if (gdb_flags & GDB_O_RDWR) {
-        host_flags = O_RDWR;
+        host_flags |= O_RDWR;
     } else {
-        host_flags = O_RDONLY;
+        host_flags |= O_RDONLY;
     }
     if (gdb_flags & GDB_O_CREAT) {
         host_flags |= O_CREAT;
-- 
2.34.1
