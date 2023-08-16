Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp364654ejs;
        Wed, 16 Aug 2023 06:41:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:c94:b0:688:11cc:ed98 with SMTP id a20-20020a056a000c9400b0068811cced98mr1972603pfv.32.1692193303518;
        Wed, 16 Aug 2023 06:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193303; cv=none;
        d=google.com; s=arc-20160816;
        b=BembTmYqeOtl0L6kNXP1R7R0bP3kCXUDwvy8kdiIpIg+q/9kBfWBwLR3mzMbAlgL69
         RWt3lsaLxT9ZMhpSMNNVscicXs8Yc995fZ+ssCiEzww2eigMju8KQQ+cpDSWgsMKqOHu
         OFROTO2Tmw1HWFFLes/EMY1zC4vvcSzY0ZLWlURpuHcDy+DEmq5ZZfI7fCfHbz84YTlx
         Yv14o/kPYZ9W/i1O3w6TVHCnBbus+06r/F4nTgb6m0RXuEnp6jZ5erVAhpLh3SfjwvnA
         zf0U2lF1yIUK7FIePdzgBhMTHgJ8i7YEikqTFFIoW8Yz4JNvss76V/AcOLEg1YxzpamN
         8oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KFJeOlUoAVVZiQ1qte2B9EXE3G1/GABPnVcBdJPoN+Y=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=JgzgWuQhvq6XCC3ingSfDpcYk3+bGGmnhlN4VcoRGEMwG+zWyPeHLo6Tf1iRHM9Kof
         n8eaxlhyVWt5VEBnBpUrQGfa1DyKog2/PFDjjEHPJfheYLX2AeFJHccrwqUjlAB2TcWn
         ehcpu1qnlqx3UBpRXuzK2X7ldkU5YXhOvBSraQfGXb4HJruftndi47aUMPCq288km/zB
         MOEvCrJbIMzfZPA3wKLWl2czLmZgnCIKORoz/1ygWXwin7FbkwvVbl1vOFdmn8gVIy/W
         sQhRIVpfKrqGuXaUfCbM89NpERwoSsUndKL2zy1AE/dSVULZtX8UuFYSsfbRQo6eHgjS
         0Hvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="b53WH+N/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b28-20020aa78edc000000b006825cd87f9bsor8624952pfr.7.2023.08.16.06.41.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:41:43 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="b53WH+N/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193303; x=1692798103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFJeOlUoAVVZiQ1qte2B9EXE3G1/GABPnVcBdJPoN+Y=;
        b=b53WH+N/IkEDYOl+KFUVBjqYd1hN923hhGmur2TH966akayL4l2GOlpNHcKriT4boA
         GEBdQ2q+HOZ7OwoY6iTlEL/0prKqHl8QN+kkohbMPs6L+lkQHs4rKDgGqqioyeEMMrUc
         ZYtx/tEWdnBp7hoAD8Mao8wSW/iUkPhSRn2xCuiwcp7AaeoTX7uNwY4GD+z6Hcl/93JO
         DHZcxgIRwv7QsfKkBZWGYVOEEBmFS/kyzxrsBeJHRUZxbBNbHVNV+DXSNtqXVW3avogM
         VbZ1yWR0GHGrea2y0GioxikDafAklvZzHyQkOOQEBpoeXywtdogLQk1568JLbJMQOD2A
         f2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193303; x=1692798103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFJeOlUoAVVZiQ1qte2B9EXE3G1/GABPnVcBdJPoN+Y=;
        b=JOBrwyVhjIWB9u1nK5EbG4ezZ7rDFIHhKZfI8stKf5mDihtFIFJmD0gVretwd9RCce
         7CRp4sVOiBSs1HepZO5Hjv4cRszlypZxkBbxpe4+F4qErRNNKfGnV/GBY66GmoCm7LdP
         HK8epA6VcDIS81ExZ85h2HVeL7N9we3fe9LhPzh6jE3xvJyOK29gziaLQIxcc7unciVo
         +5wS3bZuckxsRsu/GGJqqb8qIHni5saQsNmR0eKHh3eALbXWEYTbm+G2sZwYcqz8UoL8
         qoiDdKTXqgC6bIF9H4zQFlY4QPIP14OjikTvC6PTFQDUVxYTme/yunA0DkD4fLhYXtkn
         ZLoQ==
X-Gm-Message-State: AOJu0YyhIOULPvZ2nWSnAfdiyHEuV+VaTNGxn7aTiM0VlXmNpHw7ZrP5
	3Ge2+faneDa1DCk8rhfQZGZpoA==
X-Google-Smtp-Source: AGHT+IH03K+c1nXropL+IqIXoRQAv5P5qSCXhNOovR8dC0XmnmUQZ4fTiOKaQi2i1CPbTFbcchZJTw==
X-Received: by 2002:a05:6a20:321b:b0:134:198b:84e9 with SMTP id hl27-20020a056a20321b00b00134198b84e9mr1694935pzc.61.1692193303021;
        Wed, 16 Aug 2023 06:41:43 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:41:42 -0700 (PDT)
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
Subject: [PATCH v3 10/25] target/riscv: Use GDBFeature for dynamic XML
Date: Wed, 16 Aug 2023 22:39:20 +0900
Message-ID: <20230816133938.18310-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PCpIY3bS43M1

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
