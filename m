Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365197ejs;
        Wed, 16 Aug 2023 06:42:39 -0700 (PDT)
X-Received: by 2002:a05:6808:1988:b0:3a7:3b6c:ecb9 with SMTP id bj8-20020a056808198800b003a73b6cecb9mr2706055oib.22.1692193359531;
        Wed, 16 Aug 2023 06:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193359; cv=none;
        d=google.com; s=arc-20160816;
        b=HU540zYVgSHSNEWNEl2Seft5Zi8U3oej0uhYZSQZvnjMbWh+aK/F4+inAVjrzE9bn9
         OaIxOcVXv8jLbK3s4i1kiUWMCT5DUrh2p+dMU+xtV4jLWQWV2CCzTTXr7TMiFTuPzZdM
         0uRoTBo5paq1E68IzxixLLWi72TLi+Ii6DUpZZCeQ7jYRCsa/fc44aQ9jqF8TpOY6LXJ
         o3cYuhjB0JQihyflRp/2XgwCxcMAOh/7oDoSgKQEzvFdsjBAxGFd0t4o7TmMLmVEa3Ij
         WdNyVSZIUFRljplHC1yN1gULtwD/eU8zrHLu6dDig9ZmMx6aeqQfWjeSB7pNR8hYl59N
         7smQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=P0wuHqE05SX0fkbxe6zYmBeR3URsUNcVY+PN75JuZEC5t001NbRz0Bz2vaA19PbJZI
         diKKi7n+ikTO1fcbSpoj3Yx6JS5LpM1OOjjWVPe9s+se3CaT3hWDqV6OqiBQd0M/WDJj
         woX5MVLdXr3Ta1/mUDhob86iJC+Rl+L3dCnobfoVKUoHXRPhNsy2joTY4rO492yEn1hI
         fv8a7VVwzg4z4MjgNMqtVCmsxgvADqYZJ/cw6C2AOWIJmnWkYNzMZv1F7F+AkfGmi4mn
         QAH0gfhFC7NrnFA5XWUJFIY0v5+58faIeeqCmaDIWBwY7yAoJcDbBkpeywj87vR9oT6v
         BqVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=uA0vbzOg;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e22-20020aca1316000000b003a70ba98ce0sor8870656oii.17.2023.08.16.06.42.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:42:39 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=uA0vbzOg;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193359; x=1692798159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        b=uA0vbzOgFggojb8JrPdDIKFavnBv6DhcL4VpCB9FkJKsvQwcOSS3+/+IjGhy3eZ3YL
         ByJIKryICXjUWC8AgMJB0UEn+XR5KPktTG3gPay2oj/INxp7cn7k0mkKfGRZEnOiShai
         TKKGdIiNyN7lbb81DAQzJw/82G95hWrzBNZHagMJFjoVvwjA6viSiu7NnPIhVuJ/a6c6
         /qheRwJYLkMouejPkvDt3n2fyLty73MdNNxG+cdZgdgWhsqtdqgpThSR2IQSLBNSG79O
         riQ2zjaykLK1kxGXu+y8cSgUrROYHLSRx5ZSuC4cKP+C/71KQ73SuZB6av0p34KDO1eB
         0EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193359; x=1692798159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG+pfP5pv1xqEwFfnKQ6TBE99udBp33hdNPK6bQ51/o=;
        b=ZwQAC2Q7D0gSWsg7dNqIMy3ArkUOYjcK5v8B+r/LEbzoU3Ysbf2cAdKHDX+5P7AKfp
         7qXEhb9xGdI0fhM1ihQGIpmyIbPy9l56oIl8AtQQiG/jBgfRTRi9i0WFAi3zILAGuLbW
         KtB+1xo7/DMHdWp+YvSll5mMLNcC52N14awyUrYMuPqmQi/Xa/6mXDdeqNf6kw+FfcFd
         d1/tA1oPsISkztqJg08sFJfNI0TfCaCAuP4WHIOfyWdvaBcwNKOhui7FMBArAW3LpMk6
         LpKD9xVHa7CvLw0IIyFf50liCkdkYBonSzT51C1Bq7vvp4q4C8vBaiHAmka6peQ77AYV
         VjkQ==
X-Gm-Message-State: AOJu0YxmCIYoquoXJoHMyQoa1QZZwdnfojihlWkqv1K4tj233595IhLx
	wKsw6imH7XWowGl28VkCARsabQ==
X-Google-Smtp-Source: AGHT+IGg3SNEbeCVRAXr+lJ0fXMsXgM5SH1yyDaMlZwyyj67hiea4W3tXcR4HNOr/fFZEQXky7D43w==
X-Received: by 2002:a05:6808:152c:b0:3a7:3ea1:b596 with SMTP id u44-20020a056808152c00b003a73ea1b596mr2780191oiw.47.1692193359017;
        Wed, 16 Aug 2023 06:42:39 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:42:38 -0700 (PDT)
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
Subject: [PATCH v3 16/25] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Wed, 16 Aug 2023 22:39:26 +0900
Message-ID: <20230816133938.18310-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2iKDkv75IZGc

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
