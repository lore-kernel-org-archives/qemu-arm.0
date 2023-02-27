Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5053772ejc;
        Mon, 27 Feb 2023 13:35:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/NI/j9U1WE0WAO29TW4MVryxftLMNF6t/HbhDqo6f3dcjTAE5bWfS3JS+qeBTPk7yNo6cK
X-Received: by 2002:ac8:59d6:0:b0:3bf:d48e:26c4 with SMTP id f22-20020ac859d6000000b003bfd48e26c4mr1267616qtf.39.1677533739967;
        Mon, 27 Feb 2023 13:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533739; cv=none;
        d=google.com; s=arc-20160816;
        b=JXp/EHPHdVOyfswgITOnTzvHek10PB0UT5Sv6eI0N/muYQqZAm7Let6ZgXfzRurbc7
         1WDkGr3Yrketm5BBBDa8mk7bpcot/SsGEPME1nghK1NB6ju7VYwq9o0JSmwaj8eRB2QW
         1Nr4zaqxB0va1MthUos/pT5GTo6EjGhB3mcCsoGvdISXx1BMCxz75L4kqxw2w4vcH8JT
         ONpAzrdjEEFSg8RfifxU1UewnZ5XzKG0EmMHF3D02og6L9F5OZ649YSSqCf+YRRHze78
         4Id3PSp7nu2TQZeQYW1nCxTltzyDZlV6HsxBxrKRU3BgaddFJJaoPCAecyo1fX4kA51z
         Fqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S1Xf3inqsr/wtX3faUEiH0u2ljaxoLVvIIynuke4Aqg=;
        b=gSQgr/5iPfem2gol3C/RCdSs6HpNhtIXfpJKEwSd5CslWku1hP0Zq50J3c35sq4uLg
         Kh+toDETG7+nNwFtY39Q26LV2BY8bzR0BJr9LKlFT0mhALX0LfW6CEOBQLuYbUa3vBOJ
         zV66MLxssvmOf4xFtgXwdyOhRcQ4WpMdTuCM4myvWZT9s8zGFSra2+X8Dfbn6B1+7eaY
         6FfaDtkYVzf5amF3OsJGxzY2bhdTx2AdTbiV2WvdyvBsm3gggl/jbHs8wTPfEtu9HL/5
         F/SlkEv029zK0zCADdGWI0iEhzyAu0pxqtpBqigEzkhmkYhf2rUiG8epBJSKCv04J5YD
         kGTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C2GGY3bf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05622a008a00b003b68c08e4a1si7606161qtw.97.2023.02.27.13.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:35:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C2GGY3bf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl7t-00078M-Jg; Mon, 27 Feb 2023 16:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7s-00077d-IL
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:40 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7q-0004H0-EU
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:40 -0500
Received: by mail-pj1-x1035.google.com with SMTP id y2so7625871pjg.3
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1Xf3inqsr/wtX3faUEiH0u2ljaxoLVvIIynuke4Aqg=;
 b=C2GGY3bfZ5vSMGfHLw5kf4trIG/UDOj81mPnwE7p4DJBiJ1KH/KlD/WYWGk0z8dSdT
 3x5Fjpy4Y9DUYhPDks1yJ84yIZSZAw8kowCefRRPo7K6fv5je6LvOlO1yg/haCSQckQx
 FOFuP8KJLDusgAiuV7u03dZBYF9wqHpSnFWozuzbRvs/UEm/z/DMBsclI1tKUG9eSoZ8
 lBzvS8lwNzui2J4Nb8yDzJ+OFcd71gJtXlxv47BTWfEXSSxU7cS9q4UmJHBHY7kOYLbG
 dSH2f3plci+W8AuZgwfVq3vL9Q2yUb7wwO27o0ot1NJHf168BuRPIcIzIkUjRtyAQ5AV
 luRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S1Xf3inqsr/wtX3faUEiH0u2ljaxoLVvIIynuke4Aqg=;
 b=Q3GZBKtLV6cRImOD6xUc5nbc/XvCRcC91+M0guekfPIsn9jMpgjbOCelTnzEpSjUNd
 Ez2VlLjiBVwSRz3g7wB//CDKpTVi0xo54P5gyl9C+IJAzUmb9aGscvNHsWCNuyJrkE4D
 bvawRu+v2ArY4lcAlxgg9r7kaxqiCjQv167Bl0u7F5tRQhHR26TssnjIobzrgqP/gPT0
 eqvoywJlHgs8fon5XBpKnaVDGh3zvMm2PKdHFZB+gdvPnjvi6qRSCr9JnsdaBBCDOBom
 bHhGBt8y8b1bRVc9gI5JQ4bvUF9arlKJK01SC8eD/KzuTj22H9sIgiA+gCd+qDKBEM/G
 arjw==
X-Gm-Message-State: AO0yUKVdixysDHg1gXdT6m9sJTOUGxOPRBv6D8m8KKpEULRQ2LFE/HD/
 FYT1TA7j6ZgiL3iFcBME2kDRLg==
X-Received: by 2002:a17:90b:390f:b0:236:9eef:e285 with SMTP id
 ob15-20020a17090b390f00b002369eefe285mr608297pjb.35.1677533617000; 
 Mon, 27 Feb 2023 13:33:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 03/14] target/arm: Move arm_gen_dynamic_svereg_xml to
 gdbstub64.c
Date: Mon, 27 Feb 2023 11:33:18 -1000
Message-Id: <20230227213329.793795-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rPeCZ2pdTx0U

The function is only used for aarch64, so move it to the
file that has the other aarch64 gdbstub stuff.  Move the
declaration to internals.h.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |   6 ---
 target/arm/internals.h |   1 +
 target/arm/gdbstub.c   | 120 -----------------------------------------
 target/arm/gdbstub64.c | 118 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+), 126 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 32ca6c9a0d..059fe62eaa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1112,12 +1112,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-/*
- * Helpers to dynamically generates XML descriptions of the sysregs
- * and SVE registers. Returns the number of registers in each set.
- */
-int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
-
 /* Returns the dynamically generated XML for the gdb stub.
  * Returns a pointer to the XML contents for the specified XML file or NULL
  * if the XML name doesn't match the predefined one.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fa21393ebc..725244d72d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1342,6 +1342,7 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
+int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 52581e9784..bf8aff7824 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,126 +322,6 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
-struct TypeSize {
-    const char *gdb_type;
-    int  size;
-    const char sz, suffix;
-};
-
-static const struct TypeSize vec_lanes[] = {
-    /* quads */
-    { "uint128", 128, 'q', 'u' },
-    { "int128", 128, 'q', 's' },
-    /* 64 bit */
-    { "ieee_double", 64, 'd', 'f' },
-    { "uint64", 64, 'd', 'u' },
-    { "int64", 64, 'd', 's' },
-    /* 32 bit */
-    { "ieee_single", 32, 's', 'f' },
-    { "uint32", 32, 's', 'u' },
-    { "int32", 32, 's', 's' },
-    /* 16 bit */
-    { "ieee_half", 16, 'h', 'f' },
-    { "uint16", 16, 'h', 'u' },
-    { "int16", 16, 'h', 's' },
-    /* bytes */
-    { "uint8", 8, 'b', 'u' },
-    { "int8", 8, 'b', 's' },
-};
-
-
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
-    g_autoptr(GString) ts = g_string_new("");
-    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
-
-    /* First define types and totals in a whole VL */
-    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
-        g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
-    }
-    /*
-     * Now define a union for each size group containing unsigned and
-     * signed and potentially float versions of each size from 128 to
-     * 8 bits.
-     */
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
-        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
-            if (vec_lanes[j].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
-                                       vec_lanes[j].suffix,
-                                       vec_lanes[j].sz, vec_lanes[j].suffix);
-            }
-        }
-        g_string_append(s, "</union>");
-    }
-    /* And now the final union of unions */
-    g_string_append(s, "<union id=\"svev\">");
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
-                               suf[i], suf[i]);
-    }
-    g_string_append(s, "</union>");
-
-    /* Finally the sve prefix type */
-    g_string_append_printf(s,
-                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
-
-    /* Then define each register in parts for each vq */
-    for (i = 0; i < 32; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"z%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svev\"/>",
-                               i, reg_width, base_reg++);
-        info->num++;
-    }
-    /* fpscr & status registers */
-    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
-    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
-    info->num += 2;
-
-    for (i = 0; i < 16; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"p%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
-        info->num++;
-    }
-    g_string_append_printf(s,
-                           "<reg name=\"ffr\" bitsize=\"%d\""
-                           " regnum=\"%d\" group=\"vector\""
-                           " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
-    g_string_append_printf(s,
-                           "<reg name=\"vg\" bitsize=\"64\""
-                           " regnum=\"%d\" type=\"int\"/>",
-                           base_reg++);
-    info->num += 2;
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_svereg_xml.desc = g_string_free(s, false);
-
-    return cpu->dyn_svereg_xml.num;
-}
-
-
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c598cb0375..59fb5465d5 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -209,3 +209,121 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
 
     return 0;
 }
+
+struct TypeSize {
+    const char *gdb_type;
+    short size;
+    char sz, suffix;
+};
+
+static const struct TypeSize vec_lanes[] = {
+    /* quads */
+    { "uint128", 128, 'q', 'u' },
+    { "int128", 128, 'q', 's' },
+    /* 64 bit */
+    { "ieee_double", 64, 'd', 'f' },
+    { "uint64", 64, 'd', 'u' },
+    { "int64", 64, 'd', 's' },
+    /* 32 bit */
+    { "ieee_single", 32, 's', 'f' },
+    { "uint32", 32, 's', 'u' },
+    { "int32", 32, 's', 's' },
+    /* 16 bit */
+    { "ieee_half", 16, 'h', 'f' },
+    { "uint16", 16, 'h', 'u' },
+    { "int16", 16, 'h', 's' },
+    /* bytes */
+    { "uint8", 8, 'b', 'u' },
+    { "int8", 8, 'b', 's' },
+};
+
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    g_autoptr(GString) ts = g_string_new("");
+    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
+    info->num = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+
+    /* First define types and totals in a whole VL */
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        int count = reg_width / vec_lanes[i].size;
+        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
+        g_string_append_printf(s,
+                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+                               ts->str, vec_lanes[i].gdb_type, count);
+    }
+    /*
+     * Now define a union for each size group containing unsigned and
+     * signed and potentially float versions of each size from 128 to
+     * 8 bits.
+     */
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
+        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
+            if (vec_lanes[j].size == bits) {
+                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
+                                       vec_lanes[j].suffix,
+                                       vec_lanes[j].sz, vec_lanes[j].suffix);
+            }
+        }
+        g_string_append(s, "</union>");
+    }
+    /* And now the final union of unions */
+    g_string_append(s, "<union id=\"svev\">");
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
+                               suf[i], suf[i]);
+    }
+    g_string_append(s, "</union>");
+
+    /* Finally the sve prefix type */
+    g_string_append_printf(s,
+                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
+                           reg_width / 8);
+
+    /* Then define each register in parts for each vq */
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"z%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" type=\"svev\"/>",
+                               i, reg_width, base_reg++);
+        info->num++;
+    }
+    /* fpscr & status registers */
+    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
+                           " regnum=\"%d\" group=\"float\""
+                           " type=\"int\"/>", base_reg++);
+    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
+                           " regnum=\"%d\" group=\"float\""
+                           " type=\"int\"/>", base_reg++);
+    info->num += 2;
+
+    for (i = 0; i < 16; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"p%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" type=\"svep\"/>",
+                               i, cpu->sve_max_vq * 16, base_reg++);
+        info->num++;
+    }
+    g_string_append_printf(s,
+                           "<reg name=\"ffr\" bitsize=\"%d\""
+                           " regnum=\"%d\" group=\"vector\""
+                           " type=\"svep\"/>",
+                           cpu->sve_max_vq * 16, base_reg++);
+    g_string_append_printf(s,
+                           "<reg name=\"vg\" bitsize=\"64\""
+                           " regnum=\"%d\" type=\"int\"/>",
+                           base_reg++);
+    info->num += 2;
+    g_string_append_printf(s, "</feature>");
+    info->desc = g_string_free(s, false);
+
+    return info->num;
+}
-- 
2.34.1

