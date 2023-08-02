Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206381ejb;
        Wed, 2 Aug 2023 01:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:238e:b0:687:7b0a:fae4 with SMTP id f14-20020a056a00238e00b006877b0afae4mr426038pfc.0.1690966083529;
        Wed, 02 Aug 2023 01:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966083; cv=none;
        d=google.com; s=arc-20160816;
        b=jME5N9jdMvthBG52CWJLgR0ZqDSQf1UnzPycYjF/iiSEGGikOWkICRsxcy//BIM1JZ
         9+9J65RoYj2cWuiuJ3As1pGVjLnyR16UzMACH/gDET4iHTfoAsyrTNb9ansQE+r19ynk
         qqO+mzSkIQmMHauIBBIa6sEP1tZ0TBUjnT8x10M8GSutoraQt0dyLnCtHnDS9YwenkYd
         Gnhp8EUo3Ti2RpU5I5OPf+sshb7oi9SPlDJuHPeRnoUM1MuXgnvzQOXk7P8fAxcaZtjG
         qNCGs5S06H+xJhM7+niPG7bjnzJVvF+yCvMXd/9zIMCieOpfsaZouoDmbbw7iPlCuJNj
         Qz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pq57Uwa7dhS1yah39mA3LMQjW22Opa3qbj+NxrN5x90=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=WXEWGRhLOlZlozztD0ryBmoAe9rdWikV3Ao2E6hZrDva4JFmcQcrD27sm1WseOncbF
         T+WsIC0vry7hlGXdRFEZLvEkWh58/fZ1kit5Fii8n9cb4IEPdRAePF7UWrag8AdRHV95
         G7x0p3xbbBQTacm2eh2Bvx+tbZ6uT4TfFu4oLGPzzRmY+l0Cwy+KJnIMMvK9Q1vqbRUH
         DI1E0PI/Ia+NmHz+Js7ua7QYm91KGFIqR87j4WPMqfZZpA1zUniiUF5yVLfqbZzn/MLT
         NtjWCfW9x4gWcBn5acrJwWU7BHsPllQ3pyPyEFPdYv+ACy51eutXbnXcuTiCtUx0mtE8
         fXiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=4znDbBz6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c22-20020aa79536000000b0068742d40019sor421051pfp.7.2023.08.02.01.48.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:48:03 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=4znDbBz6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966083; x=1691570883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq57Uwa7dhS1yah39mA3LMQjW22Opa3qbj+NxrN5x90=;
        b=4znDbBz6dIiW1VW2ERZ5N671RxvfR2niT81CdTbsjZ2f0UeUIuBqmgOgoVy9m5nJYk
         8WDqdCMszED50KukaStQUAnY91CcBcK6+EX+Gtn7EM5agVYJbZuVHnz+NxyATyeNrOHa
         IPxcM6KrMWjBcwso3CUdTX3ejnzxa2fREIhA3PpeogE2N246RCsqkNrpKNPAyLaT1yUE
         1baAejwRDwC26tZJscMEclsurDmdVOKEzjrR4jPzyCZIETdKCZdeDbuczEaLl3oxUx5w
         OZVuT5JtFeT+J68E+8MinTsn7fbaDujkWB1g87LlcutaA1YjqyX7hjL+DACKArXdnqoQ
         GLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966083; x=1691570883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq57Uwa7dhS1yah39mA3LMQjW22Opa3qbj+NxrN5x90=;
        b=O4One+NeGpdzzV2wMPqLuXQN4X+uJE4aPi//M0hXRYupP6zi+U7lJAIZspI4pROw8t
         uG/8rI26mQbqX6t1km1rwWOtRWwu/sjkJQACJ9dm8w8du9wX9VwjrgL83NDVjzTigpF7
         AJJS10tVQ2gceVw1Ll9eRp84SPrCQmZISgqfR74pz6xSYnaou5giSoFiPCBx6mS9Ck4I
         UkDsI6yITyWEXEmvnBOXPE1yLwuFXr/FF6GZvWwqbOErZYlFwDJmqVptsQ44S3kIoilB
         cOwMBSYcbS0RC05CF9N35vDN1PQOOFM5qjuG8CP2xFIjx1KntXsSwnDwnJtT+EE02aR7
         r4Ow==
X-Gm-Message-State: ABy/qLbN8L5px4ImC3v0/G7izknohr9fcrRoVYO4Ej4WcC/ovbch5Fh4
	NV1mMwDMXgp7hG/rz4dGddGWjw==
X-Google-Smtp-Source: APBJJlFMRrpUhrrO4SHd4nCouhxInOUR/e1nvQUtmnw6oZkEvYyek1ma0delv8dR+RSGch9NfFdhCA==
X-Received: by 2002:a05:6300:8002:b0:137:293b:f9c0 with SMTP id an2-20020a056300800200b00137293bf9c0mr13735849pzc.33.1690966082899;
        Wed, 02 Aug 2023 01:48:02 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:48:02 -0700 (PDT)
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
Subject: [PATCH v2 09/24] target/riscv: Use GDBFeature for dynamic XML
Date: Wed,  2 Aug 2023 17:45:57 +0900
Message-ID: <20230802084614.23619-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VyZux++JvtQf

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
