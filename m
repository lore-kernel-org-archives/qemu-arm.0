Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d4d04000000b00314398e4dd4sm2503902wrt.54.2023.08.10.08.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:36:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8AA4E1FFC2;
	Thu, 10 Aug 2023 16:36:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Subject: [PATCH 7/8] gdbstub: more fixes for client Ctrl-C handling
Date: Thu, 10 Aug 2023 16:36:39 +0100
Message-Id: <20230810153640.1879717-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810153640.1879717-1-alex.bennee@linaro.org>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PtCpxvSwykKP

The original fix caused problems with spurious characters on other
system emulation. So:

  - instead of spamming output make the warning a trace point
  - ensure we only allow a stop reply if it was 0x3

Suggested-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <456ed3318421dd7946bdfb5ceda7e05332da368c.1690910333.git.quic_mathbern@quicinc.com>
---
 gdbstub/gdbstub.c    | 5 +++--
 gdbstub/trace-events | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e74ecc78cc..20b6fe03fb 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -2059,9 +2059,10 @@ void gdb_read_byte(uint8_t ch)
          * here, but it does expect a stop reply.
          */
         if (ch != 0x03) {
-            warn_report("gdbstub: client sent packet while target running\n");
+            trace_gdbstub_err_unexpected_runpkt(ch);
+        } else {
+            gdbserver_state.allow_stop_reply = true;
         }
-        gdbserver_state.allow_stop_reply = true;
         vm_stop(RUN_STATE_PAUSED);
     } else
 #endif
diff --git a/gdbstub/trace-events b/gdbstub/trace-events
index 0c18a4d70a..b383bf8d29 100644
--- a/gdbstub/trace-events
+++ b/gdbstub/trace-events
@@ -26,6 +26,7 @@ gdbstub_err_invalid_repeat(uint8_t ch) "got invalid RLE count: 0x%02x"
 gdbstub_err_invalid_rle(void) "got invalid RLE sequence"
 gdbstub_err_checksum_invalid(uint8_t ch) "got invalid command checksum digit: 0x%02x"
 gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got command packet with incorrect checksum, expected=0x%02x, received=0x%02x"
+gdbstub_err_unexpected_runpkt(uint8_t ch) "unexpected packet (%c) while target running"
 
 # softmmu.c
 gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
-- 
2.39.2
