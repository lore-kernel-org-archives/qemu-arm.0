Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206802ejb;
        Wed, 2 Aug 2023 01:49:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:d0:b0:131:5b6f:ccb6 with SMTP id 16-20020a056a2000d000b001315b6fccb6mr14199128pzh.19.1690966140475;
        Wed, 02 Aug 2023 01:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966140; cv=none;
        d=google.com; s=arc-20160816;
        b=yZpsfg3WwCOLLvbmNXLPtIGKE1OEfWwXPD/gWL0SpUdVP2sqwqhRnDUl4QXVZMUUo6
         8taZIOxw6mBvcQPp6ClF2dXe8TBKeiFo8FxoPVbHxq2zw5NzPpLki7YLpu0YkezM5DoW
         R6xsW7FNxCTDbfnJ9lfh5q4Fd/TzsmrsBgxelSCii63YYXPnbHjEQ8oVodTF35xJeeto
         LS1+JAvbcpB5XuAhl5Xx+ZrLYxvbW+7fwGeP2J8kw2fEVDkDCfIpwqFDk/n4QvdqmkTf
         rLTh5RddTaSZdvZJqwUrm0E56d0bFsaXFhR5uINYlj4xb8dwP2SMKSO5nAysEp8PshNu
         mrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KlLyNz2EVMU9S4fs/o4J37H6wtwszDT/+6W4fMi8NHI=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=t5cnMtx88KXnGdSR4YtYw5rZR3Z7mSlkc+YDSyL9vmtIzt1hvp6mAerK77F9grvxhG
         I7ALYQ9ad8r2mqrWAf3WozvC6x1vhVu3ureTXMi/K6ca9sOqdUgonGrp0B3hfJ2QMA7Q
         npVHH1qo2nXHKxtfMYzVfqRuUj2kvX880tDB6hvrAvhZZA2UWqilJ+0bZRvIHMASkrEu
         gAdgR6NKW1hI+CYP7kJI29/nZkEtDJeOH9FwiQ/+OPUMHm/WI0CkBHa1tpvD6/bR58pz
         RQ5gyzc4/U2wwfdPRf8WvG1ehydOPRdChmH2ndRJqyg1FwiuZRnDf4zx0w6ns7CJa2X5
         UZRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=I9d6y7L1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y13-20020aa7942d000000b00686b670be26sor8083386pfo.3.2023.08.02.01.49.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:49:00 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=I9d6y7L1;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966140; x=1691570940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlLyNz2EVMU9S4fs/o4J37H6wtwszDT/+6W4fMi8NHI=;
        b=I9d6y7L17EfUytj96v5S19LRy/CQ6SU7inX25mzQgjzhAp3moNUahFdWKqDTfyCdyy
         43GZoxBHpqNnOIXlM7HwGjkd0OU1vhETOpiODnPgGPH2nkPYJ6T26MvEv6C4RO/vsqNc
         5cZnK+USTMsY378w3rI6O9vS83dagBxbUAuE8a2xbEUt1fIZ5lwPtsACFg5d6O1sM/em
         BswCKAhGOGYnxijAapdXIcH2m9CGemD0JyaXMzL49YY9rlFNrq7FLPO795hpPZ9nKE47
         IGSkEguuouMLkg7NcrgC621AMvlm6CxrUvM5wChmVk8EKxdW+MswD34au3Vf/j8VSCj4
         9kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966140; x=1691570940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlLyNz2EVMU9S4fs/o4J37H6wtwszDT/+6W4fMi8NHI=;
        b=frbUNIZaxb9gPhREoy+EEOdj1/HLMX3S4xWKjbYOFJ37mB9uxeCozYAEsIqmJCADQd
         IDiQy61t6coayqdN7hp+xQ6kcml2IO8Ac3W+1fOjI0jOgD2Bfz2nCgPPEl9yjplChapk
         Vx8bzmsyF48VF7qSiF9zId2MMQVz4agzXUMfECAw23FfLBoMv0SRkvCF8Mo8xQRCHzWj
         6jb/AWmIXHm9YU7Hqk66gqQJ2DJ5LQmkoLi/whPkOvI3PD7frbZT9nOiQAqHIXHDygbt
         GbIMYbJ2xzJd+QRcdmjCXDXjFnLPID49gKeRNgwjNiFMUD83y7ONN2bJ2n/Mmmex/lhm
         aScA==
X-Gm-Message-State: ABy/qLZtW6NVTeGfFU/Xf6p7jTxRWMGiLDMW1mgCbblhpu0t587Ew4wW
	HkM/fN5M6AwPbINO6zmFtOPADg==
X-Google-Smtp-Source: APBJJlHA8kBTXnSW5YBX55gXyLrdeEM777duI6lt/h359/3N7WEXi+2k5C8a3eQTg+fSHu3N0eflgA==
X-Received: by 2002:a05:6a21:3b4a:b0:135:4527:efe4 with SMTP id zy10-20020a056a213b4a00b001354527efe4mr16329600pzb.10.1690966140004;
        Wed, 02 Aug 2023 01:49:00 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:48:59 -0700 (PDT)
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
Subject: [PATCH v2 15/24] target/arm: Fill new members of GDBFeature
Date: Wed,  2 Aug 2023 17:46:03 +0900
Message-ID: <20230802084614.23619-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 41mRkefvdP2q

These members will be used to help plugins to identify registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/gdbstub.c   | 46 +++++++++++++++++++++++++++---------------
 target/arm/gdbstub64.c | 42 +++++++++++++++++++++++++-------------
 2 files changed, 58 insertions(+), 30 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 100a6eed15..56d24028f6 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -270,6 +270,7 @@ static void arm_gen_one_feature_sysreg(GString *s,
     g_string_append_printf(s, " regnum=\"%d\"", regnum);
     g_string_append_printf(s, " group=\"cp_regs\"/>");
     dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] = ri_key;
+    ((const char **)dyn_feature->desc.regs)[dyn_feature->desc.num_regs] = ri->name;
     dyn_feature->desc.num_regs++;
 }
 
@@ -316,6 +317,8 @@ static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
     DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
     gsize num_regs = g_hash_table_size(cpu->cp_regs);
 
+    dyn_feature->desc.name = "org.qemu.gdb.arm.sys.regs";
+    dyn_feature->desc.regs = g_new(const char *, num_regs);
     dyn_feature->desc.num_regs = 0;
     dyn_feature->data.cpregs.keys = g_new(uint32_t, num_regs);
     g_string_printf(s, "<?xml version=\"1.0\"?>");
@@ -418,30 +421,34 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
 }
 
 static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs,
-                                                       int orig_base_reg)
+                                                       int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
-    int i;
+    const char **regs = g_new(const char *, ARRAY_SIZE(m_sysreg_def));
+    int i = 0;
+    int j;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
 
-    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
-        if (arm_feature(env, m_sysreg_def[i].feature)) {
+    for (j = 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
+        if (arm_feature(env, m_sysreg_def[j].feature)) {
+            regs[i] = m_sysreg_def[j].name;
             g_string_append_printf(s,
                 "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-                m_sysreg_def[i].name, base_reg++);
+                m_sysreg_def[j].name, base_reg + i++);
         }
     }
 
     g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_systemreg_feature.desc.name = "org.gnu.gdb.arm.m-system";
     cpu->dyn_m_systemreg_feature.desc.xmlname = "arm-m-system.xml";
     cpu->dyn_m_systemreg_feature.desc.xml = g_string_free(s, false);
-    cpu->dyn_m_systemreg_feature.desc.num_regs = base_reg - orig_base_reg;
+    cpu->dyn_m_systemreg_feature.desc.regs = regs;
+    cpu->dyn_m_systemreg_feature.desc.num_regs = i;
 
     return &cpu->dyn_m_systemreg_feature.desc;
 }
@@ -462,30 +469,37 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
 }
 
 static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
-                                                       int orig_base_reg)
+                                                       int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
-    int i;
+    const char **regs = g_new(const char *, ARRAY_SIZE(m_sysreg_def) * 2);
+    int i = 0;
+    int j;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
 
-    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
+    for (j = 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
+        regs[i] = g_strconcat(m_sysreg_def[j].name, "_ns", NULL);
         g_string_append_printf(s,
-            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
+            "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            regs[i], base_reg + i);
+        i++;
+        regs[i] = g_strconcat(m_sysreg_def[j].name, "_s", NULL);
         g_string_append_printf(s,
-            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
+            "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            regs[i], base_reg + i);
+        i++;
     }
 
     g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_secextreg_feature.desc.name = "org.gnu.gdb.arm.secext";
     cpu->dyn_m_secextreg_feature.desc.xmlname = "arm-m-secext.xml";
     cpu->dyn_m_secextreg_feature.desc.xml = g_string_free(s, false);
-    cpu->dyn_m_secextreg_feature.desc.num_regs = base_reg - orig_base_reg;
+    cpu->dyn_m_secextreg_feature.desc.regs = regs;
+    cpu->dyn_m_secextreg_feature.desc.num_regs = i;
 
     return &cpu->dyn_m_secextreg_feature.desc;
 }
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 20483ef9bc..c5ed7c0aa3 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -316,15 +316,21 @@ static void output_vector_union_type(GString *s, int reg_width,
     g_string_append(s, "</union>");
 }
 
-GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_reg)
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
     DynamicGDBFeatureInfo *info = &cpu->dyn_svereg_feature;
+    const char **regs;
     int reg_width = cpu->sve_max_vq * 128;
     int pred_width = cpu->sve_max_vq * 16;
-    int base_reg = orig_base_reg;
-    int i;
+    int i = 0;
+    int j;
+
+    info->desc.name = "org.gnu.gdb.aarch64.sve";
+    info->desc.num_regs = 32 + 16 + 4;
+    regs = g_new(const char *, info->desc.num_regs);
+    info->desc.regs = regs;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
@@ -339,44 +345,52 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_reg)
                            pred_width / 8);
 
     /* Define the vector registers. */
-    for (i = 0; i < 32; i++) {
+    for (j = 0; j < 32; j++) {
+        regs[i] = g_strdup_printf("z%d", j);
         g_string_append_printf(s,
-                               "<reg name=\"z%d\" bitsize=\"%d\""
+                               "<reg name=\"%s\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svev\"/>",
-                               i, reg_width, base_reg++);
+                               regs[i], reg_width, base_reg + i);
+        i++;
     }
 
     /* fpscr & status registers */
+    regs[i] = "fpsr";
     g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
+                           " type=\"int\"/>", base_reg + i++);
+    regs[i] = "fpcr";
     g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
+                           " type=\"int\"/>", base_reg + i++);
 
     /* Define the predicate registers. */
-    for (i = 0; i < 16; i++) {
+    for (j = 0; j < 16; j++) {
+        regs[i] = g_strdup_printf("p%d", j);
         g_string_append_printf(s,
-                               "<reg name=\"p%d\" bitsize=\"%d\""
+                               "<reg name=\"%s\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, pred_width, base_reg++);
+                               regs[i], pred_width, base_reg + i);
+        i++;
     }
+    regs[i] = "ffr";
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           pred_width, base_reg++);
+                           pred_width, base_reg + i++);
 
     /* Define the vector length pseudo-register. */
+    regs[i] = "vg";
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
                            " regnum=\"%d\" type=\"int\"/>",
-                           base_reg++);
+                           base_reg + i++);
 
     g_string_append_printf(s, "</feature>");
 
     info->desc.xmlname = "sve-registers.xml";
     info->desc.xml = g_string_free(s, false);
-    info->desc.num_regs = base_reg - orig_base_reg;
+    assert(info->desc.num_regs == i);
     return &info->desc;
 }
-- 
2.41.0
