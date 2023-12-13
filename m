Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431027ejo;
        Tue, 12 Dec 2023 22:41:48 -0800 (PST)
X-Received: by 2002:a6b:dd19:0:b0:7b7:1db4:be12 with SMTP id f25-20020a6bdd19000000b007b71db4be12mr8625952ioc.27.1702449708683;
        Tue, 12 Dec 2023 22:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449708; cv=none;
        d=google.com; s=arc-20160816;
        b=iVJ+cIv+kWkIfgUEVBRvFVUbmEfQtyv+xSLC4CM7JsLxFG3R3UW6YhSUjIFJ6lDZMS
         5YmxGsB6k0U616vWtlky1dXxcBVgnUAeNFLXk7SqGwMC32Mq4T/s+z0yXd6nZ16KJrz5
         1BXuUpgxJb3khvXaOyOTTrDTmdWz5d019hGFN1csCcrpkUpsEGgVmW8vKpfb1MokT5X5
         iOpqT3Ynyx8i77tqrzzJ2hEJZJigtztjbOIM5iJaQIusUmtkb3vypPFSyhVNOjSXiw60
         HJJuT32oYLOeC8+X7fNmCRhuz1XMWtOx0Eo+lFu460UtJ604ICSgzIQO9m5nbfgA08nq
         Xv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=Y7i/8o0Wx2acDjqQpzIxXLGKG6zQqXSVPKewbE+roCo=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=uycX4A3W+blp0Mblujyl2YFovH1vw4bQS9LN1FYSv60wXHT9CA8yHpo4Y5vR7FA/ft
         Mdnu4dsbH0Ci7a5fei1s2cTOjq+4xLeSJjuBpQOqQoG+Cpdoh9IxQoarmN01fVrbYyKJ
         +GqtsFUXQGRyp2PvCP3hko2S6wjXElzaUkk8igtTHkUOnL80qqNmXzGYqg5SjgSkjQvV
         iBsvU6dkNQo42lcJjamsIJa5HanfxEjXkAo2xplOAlnIAQpD5OMWarUcEBDdot/6H8b5
         9XckJ3SyfVklMjGwtfUI87keBJecoYMikqfiU+zog81YL/cONqxbE+O6/re2YExEBkai
         lQLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=BA5tmjwL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g35-20020a028526000000b0046938e1ae8asor5166373jai.4.2023.12.12.22.41.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:41:48 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=BA5tmjwL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449708; x=1703054508; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7i/8o0Wx2acDjqQpzIxXLGKG6zQqXSVPKewbE+roCo=;
        b=BA5tmjwLHcP3I9lOnCW5Lyi3Ectr6WMQ1pmUL7quKTm6NUrM89xZukjjD1mESlsZ8L
         yMhshC1wpDpNPfy1Lk/7sCeR8caWIw46emwnOBO5Cg+W2L2TKaST71pSGaKQk3J9tB+a
         NKawZ8nSp4Q/v4m8kfzDlierORM9DK+ENBFwUh7I1e6fgvWhq6B/QohXthR/ypCsTBv9
         hXAkNERlI+dYlf2q2PPSy++X/PIXzp3k2eP/AUtFcksQ5R6AvZky0wnC+EpX0LjaD76s
         84P7K9bv5+taLd280xq+mwdu0lyZekp6rHYjZXHmb/eUfmQqn4nFD5Szs5Lgx6X7uOPf
         7tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449708; x=1703054508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7i/8o0Wx2acDjqQpzIxXLGKG6zQqXSVPKewbE+roCo=;
        b=bUGHEnKoz1QHZ/NBxyfj4FqqzhzUzp7cDJZI8D67yr9bN5HJhH4OH9sUFGdGcGxKAG
         VwA+U31PWSKx6NGFLBgCV0bWA8FOg/iJdPXTUVC/1ZuFj5yKwVaAxmqToxN6iNgfB5Sc
         NQKoBduMqf+jmigC57rNLdj/5IMlHzgqLurT1YPcWMtunqt1rr8t1ayV/MeL7VyHiu9T
         X8uWNEAFlNQzfIsg+F6uxr/X3ZNsuClj7z0tWxKV4Tq7bP3SLysUIgFuDbnkyCrTgemq
         lh5xEbyLt7mD9ptrRaAPJWrJotjbkHDVwhiX9PGvKdci6Nzq93+7mFMwHokemP5P0vhl
         pLPA==
X-Gm-Message-State: AOJu0Yw7OBIi3aO2k1r6Tygka4rFN8Q0c8xx5G4AC4II37kj0EU66TIW
	a8+H3zZnruAf2su2o76gbnyguA==
X-Google-Smtp-Source: AGHT+IE+an7XxdzkxX+W3EI2IxHfSqofuh7LdfAxngMyUpiNhX9Tf+z6Eaq/ds1LADbxQpmCLOMZfQ==
X-Received: by 2002:a05:6e02:1c8b:b0:35d:a8a7:ba08 with SMTP id w11-20020a056e021c8b00b0035da8a7ba08mr11315195ill.86.1702449708215;
        Tue, 12 Dec 2023 22:41:48 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id c11-20020a170902d48b00b001d0c0848977sm9713449plg.49.2023.12.12.22.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:41:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:02 +0900
Subject: [PATCH v17 03/14] target/riscv: Use GDBFeature for dynamic XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-3-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: U6b5j8bfRifa

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/cpu.h     |  5 ++--
 target/riscv/cpu.c     |  4 +--
 target/riscv/gdbstub.c | 79 ++++++++++++++++++++++----------------------------
 3 files changed, 40 insertions(+), 48 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 060b7f69a743..ad7236d75477 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -24,6 +24,7 @@
 #include "hw/registerfields.h"
 #include "hw/qdev-properties.h"
 #include "exec/cpu-defs.h"
+#include "exec/gdbstub.h"
 #include "qemu/cpu-float.h"
 #include "qom/object.h"
 #include "qemu/int128.h"
@@ -424,8 +425,8 @@ struct ArchCPU {
 
     CPURISCVState env;
 
-    char *dyn_csr_xml;
-    char *dyn_vreg_xml;
+    GDBFeature dyn_csr_feature;
+    GDBFeature dyn_vreg_feature;
 
     /* Configuration Settings */
     RISCVCPUConfig cfg;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b799f1336041..673e937a5d82 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1534,9 +1534,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
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
index 365040228a12..76b72a959549 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -214,13 +214,14 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    GString *s = g_string_new(NULL);
+    GDBFeatureBuilder builder;
     riscv_csr_predicate_fn predicate;
+    const char *name;
     int bitsize = 16 << mcc->misa_mxl_max;
     int i;
 
@@ -233,9 +234,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         bitsize = 64;
     }
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_csr_feature,
+                             "org.gnu.gdb.riscv.csr", "riscv-csr.xml",
+                             base_reg);
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
         if (env->priv_ver < csr_ops[i].min_priv_ver) {
@@ -243,72 +244,64 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            if (csr_ops[i].name) {
-                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
-            } else {
-                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
+            g_autofree char *dynamic_name = NULL;
+            name = csr_ops[i].name;
+            if (!name) {
+                dynamic_name = g_strdup_printf("csr%03x", i);
+                name = dynamic_name;
             }
-            g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
+
+            gdb_feature_builder_append_reg(&builder, name, bitsize, i,
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
+static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
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
+                             "org.gnu.gdb.riscv.vector", "riscv-vector.xml",
+                             base_reg);
 
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
+                                       reg_width, i, "riscv_vector", "vector");
     }
 
-    g_string_append_printf(s, "</feature>");
+    gdb_feature_builder_end(&builder);
 
-    cpu->dyn_vreg_xml = g_string_free(s, false);
-    return num_regs;
+    return &cpu->dyn_vreg_feature;
 }
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
@@ -324,10 +317,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
+                                 ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs)->num_regs,
                                  "riscv-vector.xml", 0);
     }
     switch (mcc->misa_mxl_max) {
@@ -347,9 +339,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     if (cpu->cfg.ext_zicsr) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs)->num_regs,
                                  "riscv-csr.xml", 0);
     }
 }

-- 
2.43.0
