Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d6092000000b003142e438e8csm3690050wrt.26.2023.12.01.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:36:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 015925FB61;
	Fri,  1 Dec 2023 09:36:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Auger <eric.auger@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Cleber Rosa <crosa@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Luis Machado <luis.machado@arm.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/7] gdbstub: use a better signal when we halt for IO reasons
Date: Fri,  1 Dec 2023 09:36:27 +0000
Message-Id: <20231201093633.2551497-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201093633.2551497-1-alex.bennee@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: v6qKSf53l9fQ

The gdb description GDB_SIGNAL_IO is "I/O possible" and by default gdb
will try and restart the guest, getting us nowhere. Report
GDB_SIGNAL_STOP instead which should at least halt the session at the
failure point.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Machado <luis.machado@arm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/internals.h | 1 +
 gdbstub/system.c    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 465c24b36e..5c0c725e54 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -24,6 +24,7 @@ enum {
     GDB_SIGNAL_TRAP = 5,
     GDB_SIGNAL_ABRT = 6,
     GDB_SIGNAL_ALRM = 14,
+    GDB_SIGNAL_STOP = 17,
     GDB_SIGNAL_IO = 23,
     GDB_SIGNAL_XCPU = 24,
     GDB_SIGNAL_UNKNOWN = 143
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 783ac140b9..83fd452800 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -183,7 +183,7 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         break;
     case RUN_STATE_IO_ERROR:
         trace_gdbstub_hit_io_error();
-        ret = GDB_SIGNAL_IO;
+        ret = GDB_SIGNAL_STOP;
         break;
     case RUN_STATE_WATCHDOG:
         trace_gdbstub_hit_watchdog();
-- 
2.39.2
