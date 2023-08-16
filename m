Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414083ejs;
        Wed, 16 Aug 2023 07:54:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d87:b0:13b:79db:e222 with SMTP id bj7-20020a056a213d8700b0013b79dbe222mr2174994pzc.53.1692197690094;
        Wed, 16 Aug 2023 07:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197690; cv=none;
        d=google.com; s=arc-20160816;
        b=tBVu+omZ11UtlPjLOTt4+7307Rbwf+3+Glq5VE095zd4vhPGLFOxx5d8JzOCd1mFDj
         S9SdUc/ptqI+HYK60c0KQUsvPWhUJLOsFXgMa0v9ijdvPM29NAsZ//0CMZmQ6RjtY1Ub
         GAa4cyBmkG+W6Jm0wDkqb7JL9A8qMEoQnkZZjTnhIC+dVNlpbksvVPUpJDlHVAhu+/2c
         /0Tvi9zOnb1y9r/mCEnieOIyPFNVUkVvCK66cbWCG2xH1GY+aAbxto2Uw4LvTYvBKGKD
         fMcu1zWNDr8hXq21LGADfEi4oGFSG+1Vs4cqvC6ZsgPyEiFun9vxjUP8IMpk5Kv0Uq6I
         Di9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=KnPmJPWGcMfsYtNYIuZzuZgB0NibNHGLq+lfyi0YeQh3I61YJTAuDygC/s4v+cYqqE
         SebQ1V/DvGKVFs2Bgjh41pQAQQANuTX3gHRRfmYXthCt8+icvR5PQE0bSJp1dGTV06qx
         rIGV/S1dkXLucQ6MuRlMlGSQuvBXKoUnfonm0aSl4rH4TsE8So8k7tumEOlPoVb88AZ9
         HDS5LFhP2jLvjV+XcVlIZIUuLhraAsIPbDmAd+d3SNmzuhiIE+HulXg6SbCCIl1gilYG
         yTzblYjFmvK7Esk28Xq9fXznCyuWAyPsG9Cy1wXQE5IgCACJbxr/QpSwxhDlN32YnQvY
         tD5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=BA4DY5Qh;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b128-20020a62cf86000000b00688910b9b2dsor887266pfg.4.2023.08.16.07.54.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:54:50 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=BA4DY5Qh;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197689; x=1692802489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        b=BA4DY5Qh98ZxOZQW5lmEIxYZxcJFJfHns/k0/rHhsc+v9N6/qu8hi6VE10JWsF9wfa
         aZzOgQ+wVwzG/qW0JlY9WXpvUNGV7vKxQGQRBLKtZpOaRGkBWtaj33CWxzjRXIvAyutD
         MGXwURiN4InOdghAoVskP5q+E3fhCggki9S4D4YL4LpxG5irT4DkAeZ7tvTRs1/vBDTl
         kUyVUoLdloMkOKlxNK8vfMNqp2MMyfE7Bd/frZ7XD/2ewK1kaCnaRpYZOueCEClrxxA/
         lZE/GtYZQwruEf6dr7BiM4ymK7vctQ81CVWQb7DyEZcvRrXbNF5m2SnuS2JgNnbsj6pj
         A/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197689; x=1692802489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        b=IgQ39eGeojnHr2nZTBxhVDQjCKMt7pDtcqhacbrbhwFQhqCgIiWZEggTZmqR5NqIQ0
         5yAtWPylBdghTTRdFpjfClCjYfukTYCf6rhzBzokEPtq3rv+YoyfOictXzF36BdhF2Hc
         ald795w76oG7TkuceiAW1KmPCtGFgGdJsPIDANR7iKQ9ZVPynNVzCHRbkaUSMBQe9G22
         PWXMN4WX0Zym0IW1sAAc8mzt+Zjca/rilhEXLSRumGeiWeFjUFG2Yo8KTm/OAEfvrcYc
         DOzeXLjTHqFtU48R9K/Y6RXKHyNgVdM0mmdsAB88n5Cw63ajk7PBMtwbI+Qj1wgvcL2m
         BP5A==
X-Gm-Message-State: AOJu0YxgqksDnK3gkp6buArv+A0GN0rcGMMKB7OiOXbCMzbOa7JuA70m
	iYi7OiSto2Sc8xqc682rpz3rag==
X-Google-Smtp-Source: AGHT+IEdYU8lWth02xzr7iryTg5Fxt8kHkoQH1OPe4em05J1mppza8xr0eOgv10dhn/kgybj53Bm2w==
X-Received: by 2002:a05:6a00:2391:b0:687:20d6:fae5 with SMTP id f17-20020a056a00239100b0068720d6fae5mr1993395pfc.24.1692197689614;
        Wed, 16 Aug 2023 07:54:49 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:54:49 -0700 (PDT)
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
Subject: [PATCH v4 16/25] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Wed, 16 Aug 2023 23:51:37 +0900
Message-ID: <20230816145155.21049-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: G7jBd+iktvkW

This function is no longer used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h |  4 ----
 target/arm/cpu.h      |  6 ------
 target/ppc/cpu.h      |  1 -
 target/arm/cpu.c      |  1 -
 target/arm/gdbstub.c  | 18 ------------------
 target/ppc/cpu_init.c |  3 ---
 target/ppc/gdbstub.c  | 10 ----------
 target/riscv/cpu.c    | 14 --------------
 8 files changed, 57 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 09f1aca624..8fc9a1a140 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -133,9 +133,6 @@ struct SysemuCPUOps;
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
  * to GDB. The caller must free the returned string with g_free.
- * @gdb_get_dynamic_xml: Callback to return dynamically generated XML for the
- *   gdb stub. Returns a pointer to the XML contents for the specified XML file
- *   or NULL if the CPU doesn't have a dynamically generated content for it.
  * @disas_set_info: Setup architecture specific components of disassembly info
  * @adjust_watchpoint_address: Perform a target-specific adjustment to an
  * address before attempting to match it against watchpoints.
@@ -166,7 +163,6 @@ struct CPUClass {
 
     const GDBFeature *gdb_core_feature;
     const gchar * (*gdb_arch_name)(CPUState *cpu);
-    const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d6c2378d05..09bf82034d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1131,12 +1131,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-/* Returns the dynamically generated XML for the gdb stub.
- * Returns a pointer to the XML contents for the specified XML file or NULL
- * if the XML name doesn't match the predefined one.
- */
-const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
-
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, DumpState *s);
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5f251bdffe..3dc6e545e3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1382,7 +1382,6 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu);
-const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f07133419..f26c0ded18 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2354,7 +2354,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_arch_name = arm_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 791784dffe..fc5ed89e80 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -470,24 +470,6 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs)
 #endif
 #endif /* CONFIG_TCG */
 
-const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-
-    if (strcmp(xmlname, "system-registers.xml") == 0) {
-        return cpu->dyn_sysreg_feature.desc.xml;
-    } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
-        return cpu->dyn_svereg_feature.desc.xml;
-    } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
-        return cpu->dyn_m_systemreg_feature.desc.xml;
-#ifndef CONFIG_USER_ONLY
-    } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
-        return cpu->dyn_m_secextreg_feature.desc.xml;
-#endif
-    }
-    return NULL;
-}
-
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 938cd2b7e1..a3153c4e9f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7370,9 +7370,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 
     cc->gdb_num_core_regs = 71;
-#ifndef CONFIG_USER_ONLY
-    cc->gdb_get_dynamic_xml = ppc_gdb_get_dynamic_xml;
-#endif
 #ifdef USE_APPLE_GDB
     cc->gdb_read_register = ppc_cpu_gdb_read_register_apple;
     cc->gdb_write_register = ppc_cpu_gdb_write_register_apple;
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index dbdee7d56e..c86b7055ca 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -357,16 +357,6 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 
     gdb_feature_builder_end(&builder);
 }
-
-const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
-
-    if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr.xml;
-    }
-    return NULL;
-}
 #endif
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 86a477bfc0..e12b6ef7f6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1957,19 +1957,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *cs)
     }
 }
 
-static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    if (strcmp(xmlname, "riscv-csr.xml") == 0) {
-        return cpu->dyn_csr_feature.xml;
-    } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
-        return cpu->dyn_vreg_feature.xml;
-    }
-
-    return NULL;
-}
-
 #ifndef CONFIG_USER_ONLY
 static int64_t riscv_get_arch_id(CPUState *cs)
 {
@@ -2147,7 +2134,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
-    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->tcg_ops = &riscv_tcg_ops;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
-- 
2.41.0
