Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp364551ejs;
        Wed, 16 Aug 2023 06:41:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a14:b0:687:41cb:e274 with SMTP id g20-20020a056a001a1400b0068741cbe274mr1824821pfv.9.1692193294222;
        Wed, 16 Aug 2023 06:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193294; cv=none;
        d=google.com; s=arc-20160816;
        b=FBJQ1VRJFtyjP/lGg94etfToRnsrIAff6c9C5Mr9d6PR6pzeP5eSO9nOzyBWdCEyxR
         8giL755CNvgNk2+3ZujILhs6SfgHm3qnV3IpDNtuCTUfurApREka+KEay/PAY+iPzwuC
         SlpELBuZBK0sk0tiybBEOWY+5BE57J/MC9kwMdk0jTkMIUEj98Q/BBQEv3dKB8AiaQaN
         PbKMc31+WIkS09/v/otcdWlsZAe3MRIVql0mVzlxidCotc5h8/iVQSJVl2nt0p9stsnb
         gtAy49U20Hm2Z6g8DJjgCXiEBNzu9ZELvf2WFrG+L8mxUJ/2vNodtLRghydowIjJHANA
         59bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jj8XEMKTKizRIsIUeuKfRN/fxn5DPOE9jMPRlwlycR0=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=bKaBwMQjWQLWKt+h/k7273KQ6gUZ8GdMd9u4Bl7xAFnpBR4ZV+61Cv+/7PLWaNvroO
         MSdPRXd9L8mmbMeMKLNRgL4DThtHup5gtRGUGV4NDM5fH0jvM3ri7W7CNCUULyZR8HJd
         r1pu3/3/BCOpI+CmlnpA0XRc4ubdumhUkRCB+dD1j/34v7j6lvrN1b7aHKCLw/KYWpp3
         LGWYjJkZSPdEBDSVgx81xdgrYdNnO3O1klVCJzluEJAT2+5409ob1G8iFYPfUxZMaF7b
         64P+vX43YycBy9FQDk2iskA7kf6YGocdIdx6V41OD8C08lFmCK4k8mp5OJCMY6QF7IZB
         CBag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=deTjKnOS;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p7-20020a625b07000000b006879c4820d2sor9018045pfb.11.2023.08.16.06.41.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:41:34 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=deTjKnOS;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193294; x=1692798094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jj8XEMKTKizRIsIUeuKfRN/fxn5DPOE9jMPRlwlycR0=;
        b=deTjKnOS5iyh/BjVsLwfTclFyBrnCqUKn9rBN0JsVTkd9ludoooER+EtgWvDje+tDe
         4nSg64XEfAIAulvTIgNXHfyjoquJ1lJuzc8cl7yB4oWeYYBP5FKqP/PVLUzVgJt5KQog
         uMo9CLGekkvMY7pwgSXXk17s6Deo0psWga5UCf0uQUV0aCa8BXUZzLpJCV28AAunCCsj
         g3BICpVR9sZIagHyv1fuJ5e2SwARQsM3DxgO+6qRzVXoQm1j7FPYXV/1KOJ43wPl3/Ik
         NKYhhPJsv0NUhSJurfkoOBThnGH+DnChiyLj2GHKrn4vqGCbCZ6qeDR2pTSqo7GWVlyi
         GLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193294; x=1692798094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jj8XEMKTKizRIsIUeuKfRN/fxn5DPOE9jMPRlwlycR0=;
        b=eoduMzj7eIW9udGpgiBiWnNlsPjRRuSXydy76B1lYgu2oQqQAKAr+fSfej7jvD6PX1
         W+qw4JeuJIo1AfAhsf/WrwZkDXfvsEsP9HEKNaqZ8nTErrihbXMZ1SObEtGiDz62REtH
         +ox94IbicqQNBj6c2HsuszZFZUUsAmNV46XCf5q5LJVC0wMVMvITzaBWLJEkBs1Ms8Pn
         11f6ygIsKV81VLfQo5FtV84hA9R6/GNAr3YMIyKI9X1vC9E/6qweGMnvyy3nybW73Rwr
         8vFGfKRonO6qwuKiZ9bYPVaxcBg8nwf6sFdQdZXJuBgY7nLHqg77fJg+8Nze43r0NT8H
         l13A==
X-Gm-Message-State: AOJu0Yw1o6H2wU5okqvG+5zMZn31APW9aamk9SfbhEvhJhsaKFpUAo3x
	k6m4zjrAU3snzvsM7Y23eJ5nlA==
X-Google-Smtp-Source: AGHT+IHvP4tk8BcT8Uk54LMH0+JuCIkezE9W7gtYrcz27+yXORlK4bskCsC9mYkhtPC7NJdHYac3Vw==
X-Received: by 2002:a05:6a00:850:b0:686:b94a:3879 with SMTP id q16-20020a056a00085000b00686b94a3879mr1937906pfk.18.1692193293702;
        Wed, 16 Aug 2023 06:41:33 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:41:33 -0700 (PDT)
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
Subject: [PATCH v3 09/25] target/ppc: Use GDBFeature for dynamic XML
Date: Wed, 16 Aug 2023 22:39:19 +0900
Message-ID: <20230816133938.18310-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Xu2oqw4GuQeA

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/ppc/cpu-qom.h  |  3 +--
 target/ppc/cpu.h      |  2 +-
 target/ppc/cpu_init.c |  2 +-
 target/ppc/gdbstub.c  | 45 ++++++++++++++-----------------------------
 4 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index be33786bd8..633fb402b5 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -186,8 +186,7 @@ struct PowerPCCPUClass {
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
 #ifndef CONFIG_USER_ONLY
-    unsigned int gdb_num_sprs;
-    const char *gdb_spr_xml;
+    GDBFeature gdb_spr;
 #endif
     const PPCHash64Options *hash64_opts;
     struct ppc_radix_page_info *radix_page_info;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 25fac9577a..5f251bdffe 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1381,7 +1381,7 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
+void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index eb56226865..938cd2b7e1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6673,7 +6673,7 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     (*pcc->init_proc)(env);
 
 #if !defined(CONFIG_USER_ONLY)
-    ppc_gdb_gen_spr_xml(cpu);
+    ppc_gdb_gen_spr_feature(cpu);
 #endif
 
     /* MSR bits & flags consistency checks */
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index ca39efdc35..0ef484dbee 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -318,15 +318,21 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 #ifndef CONFIG_USER_ONLY
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
+void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
-    GString *xml;
-    char *spr_name;
+    GDBFeatureBuilder builder;
     unsigned int num_regs = 0;
     int i;
 
+    if (pcc->gdb_spr.xml) {
+        return;
+    }
+
+    gdb_feature_builder_init(&builder, &pcc->gdb_spr,
+                             "org.qemu.power.spr", "power-spr.xml");
+
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
 
@@ -344,35 +350,12 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
          */
         spr->gdb_id = num_regs;
         num_regs++;
-    }
-
-    if (pcc->gdb_spr_xml) {
-        return;
-    }
-
-    xml = g_string_new("<?xml version=\"1.0\"?>");
-    g_string_append(xml, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append(xml, "<feature name=\"org.qemu.power.spr\">");
 
-    for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
-        ppc_spr_t *spr = &env->spr_cb[i];
-
-        if (!spr->name) {
-            continue;
-        }
-
-        spr_name = g_ascii_strdown(spr->name, -1);
-        g_string_append_printf(xml, "<reg name=\"%s\"", spr_name);
-        g_free(spr_name);
-
-        g_string_append_printf(xml, " bitsize=\"%d\"", TARGET_LONG_BITS);
-        g_string_append(xml, " group=\"spr\"/>");
+        gdb_feature_builder_append_reg(&builder, g_ascii_strdown(spr->name, -1),
+                                       TARGET_LONG_BITS, "int", "spr");
     }
 
-    g_string_append(xml, "</feature>");
-
-    pcc->gdb_num_sprs = num_regs;
-    pcc->gdb_spr_xml = g_string_free(xml, false);
+    gdb_feature_builder_end(&builder);
 }
 
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
@@ -380,7 +363,7 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
 
     if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr_xml;
+        return pcc->gdb_spr.xml;
     }
     return NULL;
 }
@@ -618,6 +601,6 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
     }
 #ifndef CONFIG_USER_ONLY
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_num_sprs, "power-spr.xml", 0);
+                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
 #endif
 }
-- 
2.41.0
