Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206315ejb;
        Wed, 2 Aug 2023 01:47:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:1614:b0:13a:12c2:359e with SMTP id l20-20020a056a20161400b0013a12c2359emr15795094pzj.2.1690966074019;
        Wed, 02 Aug 2023 01:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966074; cv=none;
        d=google.com; s=arc-20160816;
        b=NgmCK0JYttRaxNEglYrobv/4zlRDXeRSCFf6ZqmxmBAFSNT0Rzde2KefKx1TthKXHS
         mhTmaRD8KrcP4DxnEwuW5Y8s6hRXiM7uewDgn/PmYm7Uv4x5lesOga+G3sTH8hcZpTSn
         X7+fbWJ2kGswoQrLwi2l+ycXLEoV0Kqq6aHdl+TO2CiLP8t1pTI+3XuY0P3NhUxlUT4/
         H1Js+jHNBp5xbauFvlaLz48cJS9FYPD2WAtgZ0Pjxm73jworOholsV2He8CcVEzvAztI
         WtULzRqoMgMZ64bTHKGEN6W3Lj3egrT1JhSawGVf0bhsJW42oKqlzumnlV9rG07MBOrQ
         eNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FfSLUm35sjJsoTcaq+das4MWgsMnUid5n089D7b/Mw4=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=sloCf6Csk8drjRM3reslUZTrdWYOztD4QbRd6bkkhQJW5coiabc80Ap/mCW+NUD5E0
         hroXVMJFSxAbcHUQ/h/b40dxZnw1KS2Gk09TLuwu6q/Jq7tnakIe1qRUnO77JlsD4wzK
         serMlOPjiVB0kHA9tIdxEhzUATyDEhlRD7KmezIspZyzeHPlK9eT4MuoPx9zh1KZnBz7
         X7jww/1AJ1SMzvf1DO2SJrt+dozJ7uohpLIXQFLn6AsMlC1zcyvH3B/Dah5i/RzABedA
         i+KPx6Pi2Ufj5NYgngaUAmRLTkOO8GuPKM+rlQRhya4WjMK3o/ziimNAkkq/ySP4yR4d
         ToUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=LbemMOCp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 67-20020a621846000000b006820b4b1c0csor5627328pfy.5.2023.08.02.01.47.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:47:54 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=LbemMOCp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966073; x=1691570873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfSLUm35sjJsoTcaq+das4MWgsMnUid5n089D7b/Mw4=;
        b=LbemMOCpA59+4SX3Vw5YM4Hrn90s38FAys9idCA11uRYhyXfXGj8DIFj8y3U1AKxKG
         lLWA/D5ny862rglbLVPPRZw/1Ao56oKPzhrQTISGzFmmQR+cvjJT6kCgiquGBQoIrs4g
         6Tz8AkPKbeq6ehbUTBNj/FCf+Q4nySlngDkPyWCsVY2/+5gE+aTJTNJhF4w9ZhaS/luT
         6Zjd1+dfLraJK8q8L3tdcJgAj1tZ5/QtvIt37lIAXZ4k7LWgPceRZ6+gag2KZkqFW2Hr
         F2IJWC8WtKNMeEf91I8Rqq2KBfiiWIG2aQI0paDtVCMhPlSs9svUGIfjy0wm7qWw0M54
         IaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966073; x=1691570873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfSLUm35sjJsoTcaq+das4MWgsMnUid5n089D7b/Mw4=;
        b=bfQqIVhiWqbBmbtFNsnUx24J6l8g8xY2N6yrLsTO2GZWtIxPZZeRxXiZ9vrOvQbNJ4
         pewqm51gOTraAqButBbP5nMK8nOIixdyGVkqjxkz/fJS6bgondLDEvq8IirwKCeJWr4O
         42jhvKqBSd+iEaF8Yj+eBQ1Jo11zOXLl6fZIFFWOsjN7MyWl4X5w9kN/rAhovaA2Tj0w
         TJi446Y/NE4q6ICC30jne3WEJVUy6TLO+TlPCb5p3KgTuU49pnrLYIL9TslTGkDytHj2
         oHHmf0TNKL438/pVI7M5UhBVxJxaHxH+W4nhit20CiE/K/2yixJKemqxUFjQJ7ldNkZV
         EVdA==
X-Gm-Message-State: ABy/qLZSVqYOWCDhfgBqTMNFoWXqLm+ZSWuFIMOsaOT2kzlXkohid9IJ
	wemeX8DOA8Ejm7pcRYWbcpoBMQ==
X-Google-Smtp-Source: APBJJlFhFy6f1OBgGKEWBPpueI+nYG1EJAkDB7LgjnmraVDggWbfuovQNJK5km1/39tHxk+3HTcQDA==
X-Received: by 2002:a05:6a00:1947:b0:680:6d16:8f8c with SMTP id s7-20020a056a00194700b006806d168f8cmr14889190pfk.32.1690966073436;
        Wed, 02 Aug 2023 01:47:53 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:47:53 -0700 (PDT)
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
Subject: [PATCH v2 08/24] target/ppc: Use GDBFeature for dynamic XML
Date: Wed,  2 Aug 2023 17:45:56 +0900
Message-ID: <20230802084614.23619-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FATXuHohkXX7

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu-qom.h  |  3 +--
 target/ppc/cpu.h      |  2 +-
 target/ppc/cpu_init.c |  2 +-
 target/ppc/gdbstub.c  | 13 +++++++------
 4 files changed, 10 insertions(+), 10 deletions(-)

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
index ca39efdc35..adc647a24e 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -318,7 +318,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 #ifndef CONFIG_USER_ONLY
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
+void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
@@ -346,7 +346,7 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
         num_regs++;
     }
 
-    if (pcc->gdb_spr_xml) {
+    if (pcc->gdb_spr.xml) {
         return;
     }
 
@@ -371,8 +371,9 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
 
     g_string_append(xml, "</feature>");
 
-    pcc->gdb_num_sprs = num_regs;
-    pcc->gdb_spr_xml = g_string_free(xml, false);
+    pcc->gdb_spr.num_regs = num_regs;
+    pcc->gdb_spr.xmlname = "power-spr.xml";
+    pcc->gdb_spr.xml = g_string_free(xml, false);
 }
 
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
@@ -380,7 +381,7 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
 
     if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr_xml;
+        return pcc->gdb_spr.xml;
     }
     return NULL;
 }
@@ -618,6 +619,6 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
     }
 #ifndef CONFIG_USER_ONLY
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_num_sprs, "power-spr.xml", 0);
+                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
 #endif
 }
-- 
2.41.0
