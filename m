Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025558ejb;
        Mon, 31 Jul 2023 01:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:318b:b0:76c:a3a2:ee07 with SMTP id bi11-20020a05620a318b00b0076ca3a2ee07mr6937089qkb.16.1690793126978;
        Mon, 31 Jul 2023 01:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793126; cv=none;
        d=google.com; s=arc-20160816;
        b=aBaEbcy1P3Y3NV7MKVGT6SNVvi8Y/XNa5MJ/n7JJdL6/bc8MfvsMH2GUQl93b1+Jsp
         /9V7if2a2Ty5eCapJ7O45HEDwfNzHV8sENs9CsRSypTAWxORG+b31kaJaVCuAjcV2dDm
         KJsu5M8EmHCscMyxW6eyaKtOsXiWaWcdVxUaVaXsydCKqFJtjm/50WeMnOmCB3X0Hu73
         V+YoypQT8/gAQmoZYyULqWAQxW4PrGozesSDgpDXwD71hnRgw642Nl12rSS0F8UHf9+U
         CYo6qiDWLJ48JjyLEyZav+Px0s+hPWZVGC0n+ZcFaQ7cUxofkikCLbpaRmPTL4vPwcoi
         nY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iYW1nIFGTA7fjkY/uj18ixbf7NM+vxI6KJp/a1kW3DM=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=HxlOXPSQ4WkOQfXzyRAnBRvSAdIegjkRn5IFe4QDg6Tj36b8EHHF3YfSoKtqriGn0O
         WRmQY7TQzoSSbZN7uI/OYFxwa3qMaYnL6rfLwx6fcnB7jGs9xkm/TLIe0ym3MFMQOXL3
         igtmzuapuoMjHBnyN/lTGERGbsvXkUtSSvcPFk8vJ1qOOjVDdFXCE93LrZcjJ0WMVOxn
         R5Vq1YySjRVK4WH6Ipgq1KCBTDuYHJXZGKdFx6rvsKmu7e9DctqSyi0KTf9dsfijSWU4
         yoU878oLe7jDaK4hkjsZIuwJkjDY0KmU9LzogETcoHnS+vnszLly/P2sFqnBaxd/rvgE
         cdjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=FCgiuReH;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u21-20020a05620a085500b00767c3f1582csor362216qku.5.2023.07.31.01.45.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:45:26 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=FCgiuReH;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793126; x=1691397926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYW1nIFGTA7fjkY/uj18ixbf7NM+vxI6KJp/a1kW3DM=;
        b=FCgiuReHkxvCMedZ1O9wOeLgAAAtREGyPlNLdCVVJ8f82wmV0yMwqZ5/6niswZFTy3
         DTqVCtXuk4WVC+0PA6DvJZrQt7o6+ETOWPXu7JHji/sTG1ulIOGcRcZ403GjTkioFqWD
         EAo5VowSHMC4Hxlypd/oe7P416AOb1VYwHmdGMKmNsEJvN8k/0IjxxrcX7YmiRirNEi6
         ZRBt8vx+AY2R9C3WsfzoREBZmbqHU2g6O8vOg7iaaKbNc6dVHXflOsF4HN9Ro9plFXaN
         d1Gbh/OluFrPCVJBucMn4bsdWf1um112AXwqtQrw+Dy+FyvhtCyk2zyV20clbS2XZbLT
         4a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793126; x=1691397926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYW1nIFGTA7fjkY/uj18ixbf7NM+vxI6KJp/a1kW3DM=;
        b=HAjLswaLuXL49sTwaVDM0gesnk7djCuz+e/HfWRZMjPQQ+AEJcGsNqRE/Jysbbjg7f
         U7xjg/GbZr0VyI2BiFQ212oPtv7V6XtFeaSAbppFyX4M0Pv9tKo2nYzEfnrnQICHjUEy
         q5lgyqbKxn9bzXo/ADPC6PSIxZC4HT4ivU/6hfHTX+zJx/tom2hvtZ9fLcJORYyOKVvK
         TPchadkYgwq6FpZOGha8VttTs992Z0BGiqyLJlt13YA0woWTV7VLKH4RP0QOr0S41vx9
         n43oLJeadAULRygTuX3xq/+rh5quMMY78LD8NsJvmIh+ZFKTm40W4qMtEZBXoGdi0ap6
         AkFw==
X-Gm-Message-State: ABy/qLYNDTUiAlOd6aLxTR7mY0v0njk3edApkKbluB3OdKLe5vlaIHRq
	p/FPA7zBDG1OBv6rMTubBy77RA==
X-Google-Smtp-Source: APBJJlGEAClPWuuPChQAQnL+wQ5I3Z3zwpDommxcO1h5PxQnB4ei0G1BfSVCDR+41QWvIMmcc33ivg==
X-Received: by 2002:a05:620a:450f:b0:768:1053:b1b3 with SMTP id t15-20020a05620a450f00b007681053b1b3mr14080627qkp.31.1690793126581;
        Mon, 31 Jul 2023 01:45:26 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:45:26 -0700 (PDT)
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
Subject: [RFC PATCH 08/24] target/ppc: Use GDBFeature for dynamic XML
Date: Mon, 31 Jul 2023 17:43:35 +0900
Message-ID: <20230731084354.115015-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lUFuV1laACxu

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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
