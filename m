Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp413534ejs;
        Wed, 16 Aug 2023 07:53:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a56:b0:641:3bf8:6514 with SMTP id h22-20020a056a001a5600b006413bf86514mr2204228pfv.10.1692197632511;
        Wed, 16 Aug 2023 07:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197632; cv=none;
        d=google.com; s=arc-20160816;
        b=EQVIAjvyGQLawnOSyZKMo/f/dx2piWXepsSqZgvYF9SOGToWOCgMVEE0yeVIJaTQ6r
         IVYk1Q0je2P7jWfPoXisxTZEYasqPUXeARiUuYrVbsFaPHTl9K1Ay53UVzX4D2vCunim
         NWA45gO0vkUEMRPFth597RcSXLNZBQlLMZkEpeYX4h8wcKtNiG3JvewTQURshIvlhImd
         h4d2UQ8mECmHrUnahDfaMNfAxXHpy362IagoRjNz3w6IXMaOTlo1eIfXZKQMaSbhp4HF
         e2YN5nPYDt94t0PZEmOp6y3dvDEiYLntXBo4FUxX+ZJzSr8/n7gEt5ms+H4iK72WwoTX
         J8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KFJeOlUoAVVZiQ1qte2B9EXE3G1/GABPnVcBdJPoN+Y=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=WMyPGOLafIZ5msmOoe6zwFIO5ooTUlKsPm/NOz0zLq3h00+PFJVVJua5lp/wjlORRo
         SFTI/9lW5IcLt1IZOF1ASe5tpZBuCaq81i0bmNfG6ieLgtqDMmJ1vPqBrBj86mqqgd3w
         MYSHoQ70SSZXKmm9dj/ehMDZfk3Jz5+o0CCzHvcmaWQ4e2WRZc8dXTmTJl9U0H+sH9UD
         fWRUxUDOD7ARBgDBoAvnrkBXFBE5FyPZZFTBrdiWxJeVdy8eewjFcNyZFT8N22g69q4O
         y+i8mkvWtkAES2nfLKpY/oC3NTwCTE5Q7SOeKUnGj8iqU8GKsrVm1U8XXZUU0R2xqJ5y
         jh1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=vY30qZfe;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x23-20020aa79417000000b00687ae61e6ebsor11705481pfo.4.2023.08.16.07.53.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:53:52 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=vY30qZfe;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197632; x=1692802432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFJeOlUoAVVZiQ1qte2B9EXE3G1/GABPnVcBdJPoN+Y=;
        b=vY30qZfeyDncbmANt3wuXXEplqvjyz2VG86gC9yGGgSga+bT4bQbISEfw6nyZeWHYO
         B3BMpJgwPN7OS9wqIqSGIvzoXD5093/4uKSYzZfQvsjXl84Bb81O2SllOoYtAWS3Gulh
         qOGYa3YpLlYlUrzcmO6tYOtCE+ZZq4nvE+JnISlGMJsnRXqjxpeyeXsRo1wSrpt9W0dj
         tfbtCgu/UyOIZHWsq0IOyd0MXMl39XmMfBYpDkTlHK0Fg3OcUDAUXNn+UBd6kUFvVBhU
         EjSg2Zle6UO4TscKKt1A4q4vBdoDblEwDMM/henz1IdIghrXyVUczgzYjgVCx65Ak7LB
         X4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197632; x=1692802432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFJeOlUoAVVZiQ1qte2B9EXE3G1/GABPnVcBdJPoN+Y=;
        b=LWVX2rPsh+8YHNXPRbFhZVFGxRdkfSutNFydafXp5muXcMi/aKAzewGzVdMZWetlVm
         oy2dHj40PIr4BD4oiORrfigygk68eQ9fnM4i83vzP+ZXkquIjjW1Wppzlm/Oz4c6KzNT
         xa30uSRCEyg4tOmi8bfituLjIZc47JOCHVeqWC5HaRJtyvp3B4nqBkr4FkSR2OsG4lrc
         jxAGp8vasE+RDwp8ilf1qO/zbXdqqB5/ZrbsZPlFbwTPbbzl1k2HQbwnWAFEmptJUYaB
         sopjZ/q5/0ZZQTlfBrYk8pNIiF2o1l+aH2ITHV/cLfDiM685KZYTB3/u5mZ6Kl9IkpWE
         fNGg==
X-Gm-Message-State: AOJu0Yzbz0s+V3Of/g9YDWpr+VE5PdwJ9t02+eDbl6LIqESVCNtKbBXU
	QiVqThQ43hhOtDN0U7ahggVf5A==
X-Google-Smtp-Source: AGHT+IEQq3EvaycYEIMAWHJ2guJpdhzlUdWPiJzCrsy2FVTqEnGNKmiIPrAXAmST6DwnZI0CMidbrQ==
X-Received: by 2002:a05:6a00:b56:b0:687:82f9:3d89 with SMTP id p22-20020a056a000b5600b0068782f93d89mr2326707pfo.24.1692197631904;
        Wed, 16 Aug 2023 07:53:51 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:53:51 -0700 (PDT)
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
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
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
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 10/25] target/riscv: Use GDBFeature for dynamic XML
Date: Wed, 16 Aug 2023 23:51:31 +0900
Message-ID: <20230816145155.21049-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 31OszFNTNEDt

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/cpu.h     |  4 +--
 target/riscv/cpu.c     |  4 +--
 target/riscv/gdbstub.c | 75 +++++++++++++++++-------------------------
 3 files changed, 35 insertions(+), 48 deletions(-)

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
index 524bede865..fb8d92bcbe 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -212,12 +212,13 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    GString *s = g_string_new(NULL);
+    GDBFeatureBuilder builder;
     riscv_csr_predicate_fn predicate;
+    const char *name;
     int bitsize = 16 << env->misa_mxl_max;
     int i;
 
@@ -230,9 +231,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         bitsize = 64;
     }
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_csr_feature,
+                             "org.gnu.gdb.riscv.csr", "riscv-csr.xml");
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
         if (env->priv_ver < csr_ops[i].min_priv_ver) {
@@ -240,72 +240,61 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            if (csr_ops[i].name) {
-                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
-            } else {
-                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
+            name = csr_ops[i].name;
+            if (!name) {
+                name = g_strdup_printf("csr%03x", i);
             }
-            g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
+
+            gdb_feature_builder_append_reg(&builder, name, bitsize,
+                                           "int", NULL);
         }
     }
 
-    g_string_append_printf(s, "</feature>");
-
-    cpu->dyn_csr_xml = g_string_free(s, false);
+    gdb_feature_builder_end(&builder);
 
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = false;
 #endif
 
-    return CSR_TABLE_SIZE;
+    return &cpu->dyn_csr_feature;
 }
 
-static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-    GString *s = g_string_new(NULL);
-    g_autoptr(GString) ts = g_string_new("");
+    GDBFeatureBuilder builder;
     int reg_width = cpu->cfg.vlen;
-    int num_regs = 0;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.vector\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_vreg_feature,
+                             "org.gnu.gdb.riscv.vector", "riscv-vector.xml");
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
         int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "%s", vec_lanes[i].id);
-        g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
+        gdb_feature_builder_append_tag(
+            &builder, "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+            vec_lanes[i].id, vec_lanes[i].gdb_type, count);
     }
 
     /* Define unions */
-    g_string_append_printf(s, "<union id=\"riscv_vector\">");
+    gdb_feature_builder_append_tag(&builder, "<union id=\"riscv_vector\">");
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"%s\"/>",
-                               vec_lanes[i].suffix,
-                               vec_lanes[i].id);
+        gdb_feature_builder_append_tag(&builder,
+                                       "<field name=\"%c\" type=\"%s\"/>",
+                                       vec_lanes[i].suffix, vec_lanes[i].id);
     }
-    g_string_append(s, "</union>");
+    gdb_feature_builder_append_tag(&builder, "</union>");
 
     /* Define vector registers */
     for (i = 0; i < 32; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"v%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"riscv_vector\"/>",
-                               i, reg_width, base_reg++);
-        num_regs++;
+        gdb_feature_builder_append_reg(&builder, g_strdup_printf("v%d", i),
+                                       reg_width, "riscv_vector", "vector");
     }
 
-    g_string_append_printf(s, "</feature>");
+    gdb_feature_builder_end(&builder);
 
-    cpu->dyn_vreg_xml = g_string_free(s, false);
-    return num_regs;
+    return &cpu->dyn_vreg_feature;
 }
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
@@ -320,10 +309,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
+                                 ricsv_gen_dynamic_vector_feature(cs)->num_regs,
                                  "riscv-vector.xml", 0);
     }
     switch (env->misa_mxl_max) {
@@ -343,9 +331,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     if (cpu->cfg.ext_icsr) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 riscv_gen_dynamic_csr_feature(cs)->num_regs,
                                  "riscv-csr.xml", 0);
     }
 }
-- 
2.41.0
