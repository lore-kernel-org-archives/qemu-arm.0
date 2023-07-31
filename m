Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025635ejb;
        Mon, 31 Jul 2023 01:45:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:1596:b0:13d:bd0e:33d9 with SMTP id h22-20020a056a20159600b0013dbd0e33d9mr2264952pzj.47.1690793136627;
        Mon, 31 Jul 2023 01:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793136; cv=none;
        d=google.com; s=arc-20160816;
        b=B9EXEagJ/+01TlS5KgK68DK6z3guP0O+vyfXSaK+y2/DEGWjF3LOgf04hC7E/y2BRE
         LvlhdNlIF4qfaGcVQEk+FTYfRGle/edoAqoiJBufk8gB4RbRBxcYESwwrmM9XN/4rluH
         7WQWBWibg6yYD9r4zjoZSBgUxkls40wD0XLXARkXdmlwl8qyRqKOcWWJWW1uAlwFyidW
         CmsDux5Kc3iSOMd0rzf9ycz1tuN051SKEfWSk9hHezlKol0XV9D3sqkCVdyDZbD5Bz8m
         e8DQg4SDI+MbyaVB2iB/1Tc10j341HQgzi+JzdosX/78LEKxVGyXGAyRciaMe9irAfla
         ObOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UroyotoWH93LMRAYzk+jFEmO3Lkc/QezRKtbBAIRdSQ=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=wRt78Jj8ipCde4+a5Z7OpTLxCdSYxGi+m8iV50Qg+la6ktI0mMy1v5n4tg1kDDBMyl
         DXmfDAeQ+5jressOrqrUfMWxkdI2xlsSWsu+gf/pQcg2TiNrr3MIQpzWR/xNrOWaIrkd
         ZpMd9hZurOKOaaS4uglr7/CY5AbbtzNKolYuoLnvZDN1JqqznTB4CsbvsFQTj2BDAjsv
         gA9ecU/TGOJn2/IobxuHF9pz0sEmtXv9ldQDlsgVnYVLpusoaRgc7CO/PafT9siMCFYI
         GFbLaOIhJDVBbtXUFwXGcvkOzuwNEzNIw5fb8jbrMMioVDwBxJ5pZKnZpyi6cMgchXAK
         k9PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=ndFNlVP1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a67-20020a624d46000000b006871f41854dsor1256884pfb.11.2023.07.31.01.45.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:45:36 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=ndFNlVP1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793136; x=1691397936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UroyotoWH93LMRAYzk+jFEmO3Lkc/QezRKtbBAIRdSQ=;
        b=ndFNlVP1Oseovmo4Onh09EjdRmVe9n8ooDptnTyN9WMIorGrh2zddhysLDBdzqR8S2
         cd+UUaBVgwFJq4YjGJtc4TeW1eZggL9TicD8RjlcK5BJkQJIY+Rdjx3i5M/y3Q9/HaKP
         CFXkcAWAiitXj33lUWcSir0PLvlfv0DqWkOAVWXT4T/em8pEqL5d514mBxgig7/eWzzE
         yZ5Jtu8EiG4FoYKshg/icNcD+xyziaYii3LygS1aMuuBYWalUn1GyQVSe334SUzDAIrs
         EBtYQPWfPI0BVyzjqok4Y7QDYe3jHEW0vTR1qRy2dP4mUh6mhYbfnTWqhmQF5LuYuF1g
         YbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793136; x=1691397936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UroyotoWH93LMRAYzk+jFEmO3Lkc/QezRKtbBAIRdSQ=;
        b=ah+Y2AuUrVfq5lrpJr23Zl4jnxrhHz9Yka/mcPedDCFSJyQApiFiVG6alwjge0DBfm
         uId2rKNeQSKiT+GjM6etdJRmuCGBoNscuwet8iKwNVmif8G0qLdsi1HK8YfMJjRWgm5O
         EXmm1xTOepg97pGkx8VDbYDuTJFsiGSpmqa8xd3bhf+zhmkTBC5dTUgY408/+ZRODJZ2
         gz/2dVkgL22g7nlWR/XpoAuLln6eoXaXL/ckSpEmyuaA1Tgzehp0eZb+7uxLCet3mCkp
         XYFmsZFl12uunqhoRFwg+g6ITZG+6WhgWmjVgWkguE0YaNhQREHRMxlv/srRfY9Qapsf
         JQFw==
X-Gm-Message-State: ABy/qLZpNQKa+4mblR+SUhx6hIznBvXv2cRI99ftGf1oozArDKUjxOLE
	ZFiBBmphEe4CBQfuviqBUQCI4A==
X-Google-Smtp-Source: APBJJlE2cCnFvnW+SATj2mGdDUIaxvAcWVYgvebFHl+oLYZXGSWELvqKormbsZGZHW/0jNvMXcMG2Q==
X-Received: by 2002:aa7:88c3:0:b0:687:20d6:faea with SMTP id k3-20020aa788c3000000b0068720d6faeamr6259176pff.15.1690793136092;
        Mon, 31 Jul 2023 01:45:36 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:45:35 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 09/24] target/riscv: Use GDBFeature for dynamic XML
Date: Mon, 31 Jul 2023 17:43:36 +0900
Message-ID: <20230731084354.115015-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VbU6U1TIm4Tu

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/cpu.h     |  4 ++--
 target/riscv/cpu.c     |  4 ++--
 target/riscv/gdbstub.c | 25 ++++++++++++++-----------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6ea22e0eea..f67751d5b7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -391,8 +391,8 @@ struct ArchCPU {
     CPUNegativeOffsetState neg;
     CPURISCVState env;
 
-    char *dyn_csr_xml;
-    char *dyn_vreg_xml;
+    GDBFeature dyn_csr_feature;
+    GDBFeature dyn_vreg_feature;
 
     /* Configuration Settings */
     RISCVCPUConfig cfg;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 36de35270d..ceca40cdd9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1962,9 +1962,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     RISCVCPU *cpu = RISCV_CPU(cs);
 
     if (strcmp(xmlname, "riscv-csr.xml") == 0) {
-        return cpu->dyn_csr_xml;
+        return cpu->dyn_csr_feature.xml;
     } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
-        return cpu->dyn_vreg_xml;
+        return cpu->dyn_vreg_feature.xml;
     }
 
     return NULL;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 524bede865..70c60ad8b1 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -212,7 +212,7 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -252,24 +252,27 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
 
     g_string_append_printf(s, "</feature>");
 
-    cpu->dyn_csr_xml = g_string_free(s, false);
+    cpu->dyn_csr_feature.num_regs = CSR_TABLE_SIZE;
+    cpu->dyn_csr_feature.xmlname = "riscv-csr.xml";
+    cpu->dyn_csr_feature.xml = g_string_free(s, false);
 
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = false;
 #endif
 
-    return CSR_TABLE_SIZE;
+    return &cpu->dyn_csr_feature;
 }
 
-static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     GString *s = g_string_new(NULL);
     g_autoptr(GString) ts = g_string_new("");
     int reg_width = cpu->cfg.vlen;
-    int num_regs = 0;
     int i;
 
+    cpu->dyn_vreg_feature.num_regs = 32;
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.vector\">");
@@ -293,19 +296,19 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
     g_string_append(s, "</union>");
 
     /* Define vector registers */
-    for (i = 0; i < 32; i++) {
+    for (i = 0; i < cpu->dyn_vreg_feature.num_regs; i++) {
         g_string_append_printf(s,
                                "<reg name=\"v%d\" bitsize=\"%d\""
                                " regnum=\"%d\" group=\"vector\""
                                " type=\"riscv_vector\"/>",
                                i, reg_width, base_reg++);
-        num_regs++;
     }
 
     g_string_append_printf(s, "</feature>");
 
-    cpu->dyn_vreg_xml = g_string_free(s, false);
-    return num_regs;
+    cpu->dyn_vreg_feature.xmlname = "riscv-vector.xml";
+    cpu->dyn_vreg_feature.xml = g_string_free(s, false);
+    return &cpu->dyn_vreg_feature;
 }
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
@@ -323,7 +326,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
+                                 ricsv_gen_dynamic_vector_feature(cs, base_reg)->num_regs,
                                  "riscv-vector.xml", 0);
     }
     switch (env->misa_mxl_max) {
@@ -345,7 +348,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     if (cpu->cfg.ext_icsr) {
         int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 riscv_gen_dynamic_csr_feature(cs, base_reg)->num_regs,
                                  "riscv-csr.xml", 0);
     }
 }
-- 
2.41.0
