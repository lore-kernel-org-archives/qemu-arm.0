Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b004101543e843sm20823499wmq.10.2024.03.05.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:18:43 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 239F45FA03;
	Tue,  5 Mar 2024 12:10:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brad Smith <brad@comstyle.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Brian Cain <bcain@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Beraldo Leal <bleal@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	David Hildenbrand <david@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Warner Losh <imp@bsdimp.com>,
	qemu-riscv@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 29/29] target/riscv: honour show_opcodes when disassembling
Date: Tue,  5 Mar 2024 12:10:05 +0000
Message-Id: <20240305121005.3528075-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lmk0H0W8P4r4

This makes the output suitable when used for plugins.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 disas/riscv.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 8a546d5ea53..9dec8fa966f 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5192,19 +5192,21 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
         }
     }
 
-    switch (len) {
-    case 2:
-        (*info->fprintf_func)(info->stream, INST_FMT_2, inst);
-        break;
-    case 4:
-        (*info->fprintf_func)(info->stream, INST_FMT_4, inst);
-        break;
-    case 6:
-        (*info->fprintf_func)(info->stream, INST_FMT_6, inst);
-        break;
-    default:
-        (*info->fprintf_func)(info->stream, INST_FMT_8, inst);
-        break;
+    if (!info->show_opcodes) {
+        switch (len) {
+        case 2:
+            (*info->fprintf_func)(info->stream, INST_FMT_2, inst);
+            break;
+        case 4:
+            (*info->fprintf_func)(info->stream, INST_FMT_4, inst);
+            break;
+        case 6:
+            (*info->fprintf_func)(info->stream, INST_FMT_6, inst);
+            break;
+        default:
+            (*info->fprintf_func)(info->stream, INST_FMT_8, inst);
+            break;
+        }
     }
 
     disasm_inst(buf, sizeof(buf), isa, memaddr, inst,
-- 
2.39.2
