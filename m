Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1424970ejb;
        Tue, 14 Feb 2023 08:31:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+mEjZ2ycGTWRDmymqRlstwBZAu/7ugpaHUbZ+KRH2Y0OCKVC/h86aniTZbqGv2TI4scMk5
X-Received: by 2002:a05:6214:234c:b0:56c:22d7:3928 with SMTP id hu12-20020a056214234c00b0056c22d73928mr6525440qvb.11.1676392314654;
        Tue, 14 Feb 2023 08:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392314; cv=none;
        d=google.com; s=arc-20160816;
        b=MJNld/gq5lIYXA5zjK2JFMFaxs5mXkL9v+zIoOooXtPOIcJ3CDa/a0aMO1I79StsEb
         IgxkBwiaVup+x8IHmg/Bsm/GVGvZz3h4p8itZiPqskZ5y79eLRTILrtlBundap09mRS1
         QNQkZ3/vvqh1l5k5M3ncYvvJSsCf9+3ww/K3iE6SwrictrLWctG31GrZ6A5sosuqBRzs
         3Bsz3SNZpvHrKNEShbhae7uSO40IgDmbH2EaFQi7x534yjKu4KzTXK6n5zVQql3cwUUY
         o25dy4N/BoNKut7aAb1CuIr74MfNxssRx5/tCk8QswQE2uiL97d9xhDuwpvDfFRqUgQe
         b3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Grnio/H04PPuIGiRb3nIsuzzYqUqwsUO7rkz9vUiKr8=;
        b=sCD3qbJWPJ6nVDEUp6tdAlhBDpoBmjhdR6yjhHs1U/psjoUgol2Ruzt2HW+FvK8FUR
         H7cCOFhsBsjum6D25+lJX+nPc6or88HIsE/a2fSiEmEghOUIdlossu5Z3/lmTgJdOdNj
         HmAprZ7j1nV77iXYUm6HtXxpyP2WxqvGJkf4KK6k53sIvrne2gVhyUh69+rLwzSN7Uwi
         iV0M783HMYBbTGx3LfGY9iDl0VCqZJ7wEuJF6v1RyK+LfFuC8DweJIEXGqUPdFLB3meN
         sYRQj84nEsXqk2cFe7iPvSzLUA2ZMB8YcGbXwXY4QajW0hzt396UpaNY2Wp4Z4nts87p
         0wKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KR5SR2gM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y25-20020a0c9a99000000b0056ea65c4e95si6931061qvd.169.2023.02.14.08.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KR5SR2gM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyD1-0006Zq-Tq; Tue, 14 Feb 2023 11:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCs-0006Rb-Vr
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:04 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCq-00027R-Ob
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:02 -0500
Received: by mail-pg1-x535.google.com with SMTP id c29so6474045pgm.5
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 08:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Grnio/H04PPuIGiRb3nIsuzzYqUqwsUO7rkz9vUiKr8=;
 b=KR5SR2gMQ2Q4nPkyvqJSrcqclkF32K46fkHwU5XrT1mC/jHjg56ECTqpH4qCKp2N2h
 Ja11as9yTO1ir0YTUd7+IUgxkDCr97ao/trMNVYvDx/Suq77DcAubp+zoTwM+V/OD1xc
 /Pest5Non4iwpkWRjW57gb8U9QtqLiMcj4Q0kurid2KCRoNjF0Zy7KWHM2hc8+16srXi
 SPhcx/fGl9DdR+5J4wg0J4X01P2R05AanV5racMvcZOvAMzu/wZwdtsmo6VsMOfrlAnG
 k5+OKna+IUCcYiPay/0miHFUKa69ftRD43BS7nM5f2LfL+055pbocRd9oLjBMS18c3J/
 3S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Grnio/H04PPuIGiRb3nIsuzzYqUqwsUO7rkz9vUiKr8=;
 b=IViYDY4jLULzxdbobl659W6YJU8LLLOkt0albRK6d/2Pilt7VfsOcR/JkC3r+a48xx
 9/+/KenWJgwdLPS3N3kupQbfN2JMxnuBLcY9ZWaIIx3xqlPBVS2eEwiRo7MY2x1OquWO
 yPV2+pZx97GeqLFiOOvorOqd1FXI4TlbtuxmqRhYjLSW6yirC6z47rYtnC8LiwpfJ1WT
 BAM/3ovsP/vDKVLK9MZWLlh/r5ix3uBbXOdwGg0AeSzM0a3FQTI98OTh/n4yA1+FPyZt
 M2Ch3F/xtY/ajzYL3TOO0qYyCCDMt0tKxhuzCwCgkr+6eEdOn8oYFqVhUOzd9vP1ty3v
 3e9g==
X-Gm-Message-State: AO0yUKVxXvnffJ/t3UVabk8bHQK2Ch/ADxbBbzYzY8Zl27Gq8on42k2h
 pR660spsix307rvGL1P0ur3xTg==
X-Received: by 2002:aa7:9842:0:b0:594:15fd:895e with SMTP id
 n2-20020aa79842000000b0059415fd895emr2277535pfq.31.1676392257746; 
 Tue, 14 Feb 2023 08:30:57 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/14] target/arm: Split out output_vector_union_type
Date: Tue, 14 Feb 2023 06:30:38 -1000
Message-Id: <20230214163048.903964-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: M0XL0fDA2cYH

Create a subroutine for creating the union of unions
of the various type sizes that a vector may contain.

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

