Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c2e8800b003e2066a6339sm404744wmn.5.2023.03.02.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 679A51FFC2;
	Thu,  2 Mar 2023 19:08:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Laurent Vivier <laurent@vivier.eu>,
	nicolas.eder@lauterbach.com,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	qemu-s390x@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Marek Vasut <marex@denx.de>,
	Greg Kurz <groug@kaod.org>,
	Song Gao <gaosong@loongson.cn>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	mads@ynddal.dk,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 13/26] gdbstub: abstract target specific details from gdb_put_packet_binary
Date: Thu,  2 Mar 2023 19:08:33 +0000
Message-Id: <20230302190846.2593720-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DR4Q+B03XGIv

We unfortunately handle the checking of packet acknowledgement
differently for user and softmmu modes. Abstract the user mode stuff
behind gdb_got_immediate_ack with a stub for softmmu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 15 +++++++++++++++
 gdbstub/gdbstub.c   | 10 ++--------
 gdbstub/softmmu.c   |  8 ++++++++
 gdbstub/user.c      | 19 +++++++++++++++++++
 4 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 6bd6a05657..6534e373cb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -110,6 +110,21 @@ void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
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
index 6907bdc99c..0476ee7039 100644
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
index 6796761fd9..04e75449a2 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -55,6 +55,14 @@ int gdb_get_cpu_index(CPUState *cpu)
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
index 23b2e726f6..0c8cd028b1 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -54,6 +54,25 @@ int gdb_get_char(void)
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
2.39.2
