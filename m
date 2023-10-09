Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id x11-20020a05600c21cb00b00405bbfd5d16sm11774930wmj.7.2023.10.09.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 82E6B1FFCC;
	Mon,  9 Oct 2023 17:41:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Brad Smith <brad@comstyle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	David Hildenbrand <david@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/25] accel/tcg: Add plugin_enabled to DisasContextBase
Date: Mon,  9 Oct 2023 17:40:59 +0100
Message-Id: <20231009164104.369749-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +C+66eVtPGAe

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230824181233.1568795-2-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/translator.h | 2 ++
 accel/tcg/translator.c    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 9d9e980819..6d3f59d095 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -73,6 +73,7 @@ typedef enum DisasJumpType {
  * @max_insns: Maximum number of instructions to be translated in this TB.
  * @singlestep_enabled: "Hardware" single stepping enabled.
  * @saved_can_do_io: Known value of cpu->neg.can_do_io, or -1 for unknown.
+ * @plugin_enabled: TCG plugin enabled in this TB.
  *
  * Architecture-agnostic disassembly context.
  */
@@ -85,6 +86,7 @@ typedef struct DisasContextBase {
     int max_insns;
     bool singlestep_enabled;
     int8_t saved_can_do_io;
+    bool plugin_enabled;
     void *host_addr[2];
 } DisasContextBase;
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index e7abcd86c1..c5da7b32a5 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -158,6 +158,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     } else {
         plugin_enabled = plugin_gen_tb_start(cpu, db, false);
     }
+    db->plugin_enabled = plugin_enabled;
 
     while (true) {
         *max_insns = ++db->num_insns;
-- 
2.39.2
