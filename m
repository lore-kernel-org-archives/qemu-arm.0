Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm3432195wmb.42.2023.01.05.08.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:43:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2FC341FFC4;
	Thu,  5 Jan 2023 16:43:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Greg Kurz <groug@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 12/21] gdbstub: abstract target specific details from gdb_put_packet_binary
Date: Thu,  5 Jan 2023 16:43:11 +0000
Message-Id: <20230105164320.2164095-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CuisgGhGrxH8

We unfortunately handle the checking of packet acknowledgement
differently for user and softmmu modes. Abstract the user mode stuff
behind gdb_got_immediate_ack with a stub for softmmu.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 15 +++++++++++++++
 gdbstub/gdbstub.c   | 10 ++--------
 gdbstub/softmmu.c   |  8 ++++++++
 gdbstub/user.c      | 19 +++++++++++++++++++
 4 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 568b432220..8d260e2481 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -106,6 +106,21 @@ void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
 void gdb_memtox(GString *buf, const char *mem, int len);
 void gdb_read_byte(uint8_t ch);
 
+/*
+ * Packet acknowledgement - we handle this slightly differently
+ * between user and softmmu mode, mainly to deal with the differences
+ * between the flexible chardev and the direct fd approaches.
+ *
+ * We currently don't support a negotiated QStartNoAckMode
+ */
+
+/**
+ * gdb_got_immediate_ack() - check ok to continue
+ *
+ * Returns true to continue, false to re-transmit for user only, the
+ * softmmu stub always returns true.
+ */
+bool gdb_got_immediate_ack(void);
 /* utility helpers */
 CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 4bf99783a6..76c24b7cb6 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -239,15 +239,9 @@ int gdb_put_packet_binary(const char *buf, int len, bool dump)
         gdb_put_buffer(gdbserver_state.last_packet->data,
                    gdbserver_state.last_packet->len);
 
-#ifdef CONFIG_USER_ONLY
-        i = gdb_get_char();
-        if (i < 0)
-            return -1;
-        if (i == '+')
+        if (gdb_got_immediate_ack()) {
             break;
-#else
-        break;
-#endif
+        }
     }
     return 0;
 }
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index ee5daad0cf..534370081d 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -58,6 +58,14 @@ int gdb_get_cpu_index(CPUState *cpu)
     return cpu->cpu_index + 1;
 }
 
+/*
+ * We check the status of the last message in the chardev receive code
+ */
+bool gdb_got_immediate_ack(void)
+{
+    return true;
+}
+
 /*
  * GDB Connection management. For system emulation we do all of this
  * via our existing Chardev infrastructure which allows us to support
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 4898f16c90..fa19ec5263 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -57,6 +57,25 @@ int gdb_get_char(void)
     return ch;
 }
 
+bool gdb_got_immediate_ack(void)
+{
+    int i;
+
+    i = gdb_get_char();
+    if (i < 0) {
+        /* no response, continue anyway */
+        return true;
+    }
+
+    if (i == '+') {
+        /* received correctly, continue */
+        return true;
+    }
+
+    /* anything else, including '-' then try again */
+    return false;
+}
+
 void gdb_put_buffer(const uint8_t *buf, int len)
 {
     int ret;
-- 
2.34.1
