Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q15-20020adff50f000000b00332eaede976sm1822881wro.86.2023.11.30.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:33:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 869325FB4F;
	Thu, 30 Nov 2023 15:33:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Luis Machado <luis.machado@arm.com>
Subject: [PATCH 1/3] gdbstub: use a better signal when we halt for IO reasons
Date: Thu, 30 Nov 2023 15:33:31 +0000
Message-Id: <20231130153333.2424775-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130153333.2424775-1-alex.bennee@linaro.org>
References: <20231130153333.2424775-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IZ1XCvuXpZd7

The gdb description GDB_SIGNAL_IO is "I/O possible" and by default gdb
will try and restart the guest, getting us nowhere. Report
GDB_SIGNAL_STOP instead which should at least halt the session at the
failure point.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Luis Machado <luis.machado@arm.com>
Message-Id: <20231123131905.2640498-1-alex.bennee@linaro.org>
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
