Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t3-20020a5d4603000000b002bfd524255esm5807542wrq.43.2023.02.21.14.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 14:52:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2B2291FFB7;
	Tue, 21 Feb 2023 22:52:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	nicolas.eder@lauterbach.com,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	mads@ynddal.dk,
	Marek Vasut <marex@denx.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bin.meng@windriver.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Chris Wulff <crwulff@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	David Hildenbrand <david@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 07/24] gdbstub: move fromhex/tohex routines to internals
Date: Tue, 21 Feb 2023 22:52:10 +0000
Message-Id: <20230221225227.3735319-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0DdHn8rJssAF

These will be needed from multiple places in the code. They are
declared as inline so move to the header and fix up to modern coding
style.

The only other place that messes with hex stuff at the moment is the
URI handling in utils but that would be more code churn so leave for
now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 27 +++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 20 --------------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index de56328a2c..6be05fac9f 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -55,6 +55,33 @@ typedef struct GDBState {
     int supported_sstep_flags;
 } GDBState;
 
+
+/*
+ * Inline utility function, convert from int to hex and back
+ */
+
+static inline int fromhex(int v)
+{
+    if (v >= '0' && v <= '9') {
+        return v - '0';
+    } else if (v >= 'A' && v <= 'F') {
+        return v - 'A' + 10;
+    } else if (v >= 'a' && v <= 'f') {
+        return v - 'a' + 10;
+    } else {
+        return 0;
+    }
+}
+
+static inline int tohex(int v)
+{
+    if (v < 10) {
+        return v + '0';
+    } else {
+        return v - 10 + 'a';
+    }
+}
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index d8bf90361e..4407706aa3 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -546,26 +546,6 @@ static void put_buffer(const uint8_t *buf, int len)
 #endif
 }
 
-static inline int fromhex(int v)
-{
-    if (v >= '0' && v <= '9')
-        return v - '0';
-    else if (v >= 'A' && v <= 'F')
-        return v - 'A' + 10;
-    else if (v >= 'a' && v <= 'f')
-        return v - 'a' + 10;
-    else
-        return 0;
-}
-
-static inline int tohex(int v)
-{
-    if (v < 10)
-        return v + '0';
-    else
-        return v - 10 + 'a';
-}
-
 /* writes 2*len+1 bytes in buf */
 static void memtohex(GString *buf, const uint8_t *mem, int len)
 {
-- 
2.39.1
