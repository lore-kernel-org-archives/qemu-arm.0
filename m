Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5054631ejc;
        Mon, 27 Feb 2023 13:36:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8vGI3iwF0bGSTuBFr2iEryUQTE+AzfVKbCP8sBnjj2Ct9usrqOYig4bAG0FwfmSBXu55yg
X-Received: by 2002:a05:6214:d42:b0:534:86f1:bcb5 with SMTP id 2-20020a0562140d4200b0053486f1bcb5mr1948716qvr.41.1677533814680;
        Mon, 27 Feb 2023 13:36:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533814; cv=none;
        d=google.com; s=arc-20160816;
        b=CTDvQJHr+B0Bm0wBmzjJ3tVQsmJspPc4MPRE35204aAnxE1+qSku6FFZoNK92NinvV
         fB96pukdzIe9OMOJ+S+d7bKbRWPsegiNcPKwyaxFtJL8t9Em2HRRYizQ3WzOF2mLuIz4
         MKJNPFJ05q34XL74io9R1NZFgL5NWFHgaVzr356wDazG4u0yi0Vavu7WUM4Cwr/M8tSc
         aB2Uf3Sw8fi/Z8ZlPYPuQws4tlERCuCgDcIsRi2OrMqhGkqp1K6j9mK3P8leZ+ZRzm4y
         ytk+dtmUo/AjUP90P+TiqEUiZdTPp6Qt3YH8Gol1MzZP2jWmsJVpnsLu8y8BfIjl1Xsd
         dELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZxO2vFEBAewUG3Eemq5/VG4yc4LrHxRhdtS1HA4qP7I=;
        b=PmcIZH2Wqjbs1FIXNSMKk2uNL8ReaUF3OjKuNvMcQXie/u8kh5HzwoV4rNsfKwk4R6
         cHDiDCDQWbM4xW0yRHfDJI5+G94+FDuvhqxSDlnACarBpAl0FBjFkfm6DNu0l8mIz3Nn
         /tAiUjPjMkOSDn4iESpHIpzy+Gl4hEmtOwrMBd0Bam5WWuAXeOYLoL66TOZaKMozY6/j
         3LZKvfLVsHUeISohyigciXvD82nRhkgJnhBVEGRuGmTdMePGpXcUgI/Q6QUSPV8SWzdh
         94WAHTEZ/9ETa+PHt0qJ8jvRvjrEGziMctxg54OIkHyEGIiTWmMqWwjXB3QIW8jq1Pwb
         iAJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6n2lUHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17-20020a0cf5d1000000b0056bc02d626asi7117381qvm.242.2023.02.27.13.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6n2lUHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl7v-00079o-CR; Mon, 27 Feb 2023 16:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7t-00078V-VI
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:41 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7r-0004HZ-WF
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:41 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so11550487pjb.1
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZxO2vFEBAewUG3Eemq5/VG4yc4LrHxRhdtS1HA4qP7I=;
 b=M6n2lUHMnDdngn13MzAJK5qyfzqgLLqKEaMVam+co6RIemOBZLJ7L2woZLer+Rz+b3
 Z2W1DS42hYDYsk4kdWfb9fIQ3uQzZuvn1Rk6E4ziK/Gf9tgToR9SgK5NcQ8ozicxJeMA
 iBWjijIz6k2PkRNyongc5xIR3Xv6R5g6rBpqKu9qzL/qV/fQQB0Ov0PgLsQAwU6g2ME+
 i+YfqrYVn9KrDnfJvGcuaKzHk8xtkD2czfLGRKzkeOm6Kqprd2HtO7M7uzEWOWpzoxeC
 FHLpnPtY+L/ruOAlODY1w7Fpq7Q/iTmzmoK1P2zw1cBQ2B633R3j5ozivB7qSIFne4AX
 hvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZxO2vFEBAewUG3Eemq5/VG4yc4LrHxRhdtS1HA4qP7I=;
 b=WRQU43o7AD0u4vSJSFHZq5Hk1QzmO315AEk7QvTbc//lRe4vQDved508h/6gmNeVMs
 iv+t1SjNQtBaYXQxDQcaJJZDdnF1y8sE/8YDDa6ht0407tV/O2Gs06sRURjVg/W65ZZB
 Q8nwn/1vBrcNdSGJcb0WuvqErSGG1Klvl7IdqfSESJlvfmkb1+6vMQ12fKPxb7MG40fE
 8bXfLtGyp5QcynkfZT/6Dhxfrwxg4piFPLJgAv8SQt2kz9+3Ha5s6EoNwj5y8jdps186
 55bzQAb+7NjWsfm56i/7WOxR8F90kkA/3FrRP3D5I0iYX8MqAAfs07fb4W5LEgsGRiic
 PgsQ==
X-Gm-Message-State: AO0yUKWTUEtk2bGlF4iXIbgpDVrdpCJTbmd7usfK0s5bhQTAt1ONRR3k
 bWZBmByNPH5rgcWtPvvUYxggjA==
X-Received: by 2002:a05:6a20:4420:b0:b9:2df:7ef6 with SMTP id
 ce32-20020a056a20442000b000b902df7ef6mr947580pzb.31.1677533618545; 
 Mon, 27 Feb 2023 13:33:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 04/14] target/arm: Split out output_vector_union_type
Date: Mon, 27 Feb 2023 11:33:19 -1000
Message-Id: <20230227213329.793795-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: BDAzFblDYu4s

Create a subroutine for creating the union of unions
of the various type sizes that a vector may contain.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 83 +++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 59fb5465d5..811833d8de 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,44 +210,39 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-struct TypeSize {
-    const char *gdb_type;
-    short size;
-    char sz, suffix;
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
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+static void output_vector_union_type(GString *s, int reg_width)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    struct TypeSize {
+        const char *gdb_type;
+        short size;
+        char sz, suffix;
+    };
+
+    static const struct TypeSize vec_lanes[] = {
+        /* quads */
+        { "uint128", 128, 'q', 'u' },
+        { "int128", 128, 'q', 's' },
+        /* 64 bit */
+        { "ieee_double", 64, 'd', 'f' },
+        { "uint64", 64, 'd', 'u' },
+        { "int64", 64, 'd', 's' },
+        /* 32 bit */
+        { "ieee_single", 32, 's', 'f' },
+        { "uint32", 32, 's', 'u' },
+        { "int32", 32, 's', 's' },
+        /* 16 bit */
+        { "ieee_half", 16, 'h', 'f' },
+        { "uint16", 16, 'h', 'u' },
+        { "int16", 16, 'h', 's' },
+        /* bytes */
+        { "uint8", 8, 'b', 'u' },
+        { "int8", 8, 'b', 's' },
+    };
+
+    static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+
     g_autoptr(GString) ts = g_string_new("");
-    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+    int i, j, bits;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
@@ -263,7 +258,6 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
      * 8 bits.
      */
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
         g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
@@ -277,11 +271,24 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     /* And now the final union of unions */
     g_string_append(s, "<union id=\"svev\">");
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
         g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
                                suf[i], suf[i]);
     }
     g_string_append(s, "</union>");
+}
+
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    int i, reg_width = (cpu->sve_max_vq * 128);
+    info->num = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+
+    output_vector_union_type(s, reg_width);
 
     /* Finally the sve prefix type */
     g_string_append_printf(s,
-- 
2.34.1

