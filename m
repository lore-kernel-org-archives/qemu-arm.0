Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2811255ejb;
        Mon, 20 Feb 2023 18:20:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8/O0tVveTpjDVR/zqr84mOD2uk2VEgwrmP6y1B9jG1qZdD73mciLrMPdtevr9n2Y+oGZBm
X-Received: by 2002:a05:622a:8c:b0:3ba:151a:d300 with SMTP id o12-20020a05622a008c00b003ba151ad300mr21696593qtw.60.1676946012664;
        Mon, 20 Feb 2023 18:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946012; cv=none;
        d=google.com; s=arc-20160816;
        b=knKGG8dpJRPL9cLeK4/Pvb4N/7CsJwtsREbswOqn6YRL2NvDw1i++SyqiDgslYSP+V
         MXCkQuWO5JabrWxWGth3uMrXJNSgz8wa4cNqOKA2xFdjhN+VfKJ0dCw4xnIU92vv9gCX
         rJPlnjWQtIJsLx7ds/x4WJJk7yyt0nHXLFJuXzD2oPgDoDrjjxFexaGYKC/BhXQ/m1qp
         raOzvf23untFy/VuDJHtVq2W64ZBGl3+rDFNnnFIXxyXk9OdnK0+UKFE9ALmSlwrZhxG
         aFSu/h6mBXIkZZTZUpZr3t+a4JhIK9Lol0gQ6o8WvXdECPhyqP/frDfOMDC7fTTL0g30
         vFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZxO2vFEBAewUG3Eemq5/VG4yc4LrHxRhdtS1HA4qP7I=;
        b=ii3pxkFbxyn1/FdOzx6PNgPsMLe2WzzpMP7VaYBeJtXEONeJ44dFNrTfd/H0AH5XDg
         dttwOCDA4nZ3xvBju6rM8h1MY92W0IW+VAvUFRVXxEy7QEbw9iRbAX9Og8qq8I6Ac77u
         TLfly4eezuue+MpBo/CObN6mF2LkSAs3i6tALQTYBHPZsf3Ra7/qMwBoyvV9KpIGGnZO
         nS4Ba7339eaHs0tM9L57g806zrBHAiArOoNb4PDgTumdFgQE+Y2HDgI6bHAxTL9bEYvg
         TYohi6OF50HKQc338TPSRG/nqaiFaYDUl5YQ9aEfEadcMaQocL+onH5vfUInLZ+S9gVZ
         AnVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2f7ennI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj14-20020a05620a190e00b0072a0bb7514csi11599625qkb.546.2023.02.20.18.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:20:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2f7ennI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIGF-0001cp-Lf; Mon, 20 Feb 2023 21:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGC-0001as-Rw
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:05 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGA-000821-P5
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:04 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so1356981pjb.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZxO2vFEBAewUG3Eemq5/VG4yc4LrHxRhdtS1HA4qP7I=;
 b=L2f7ennIpruboA+aTi7OGo8rD2/WhhE4hi9vMPyRB+ZutQOZYkvJX9g0d56Gmo6LEq
 JuF3EEmyrrOREwRuLExo+hFn91lS4nOqLAdCBlNkinXDIACmlbmxG97uy3cHCYIYYy2Z
 f2nk2ygJpo2un3Vha4VIeY/vs1LI5iVqOs7HzZ6qbAZ1i9RXLB1Qm53nxCxQqoHjWd14
 jv4nTfecPy0jkw4iev7Ktg1tdhXkKg/Q6ikTwtQhQoe3Lpfe0aIwOqX7Ae7p3rsFtnT5
 evch9Ze7hY0V1P9AqKFN90bQoHCLqV4xWW2NlnvEaq7gHGGbyG1VSXJrBMyQXSjlff3G
 59Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZxO2vFEBAewUG3Eemq5/VG4yc4LrHxRhdtS1HA4qP7I=;
 b=LKIVGX+jBI76gGuzDkgzr1ytkEAvIQTydLY8pAB7apgfJ64bFSEpfcZVQu13Njj5t6
 GzNT/EWlfUmyhfYetr7SqRAES4Nz/WFlwGspQUaorSrAyEOw9Ui822Hke3FV8YVBrmy5
 m20/U9gPY/1rK+8gR8fNhpOI75/nb2b/ZidFCPdsbnrZCd1C6E+ineqb/xhOYtFJLWiR
 0YAJt7TnkFmY8IQNso7NLycu0BVzU6HgV7HAQrCpOJQtra/6NOXOLla0bQNJocpWqa3m
 y75s/e+3xL1kkHqUQTAp1oTBcZwLsZz60bRk8Z9zG6Zq2EHO3NQ9/5sKh8j15lKCcJuB
 MUdg==
X-Gm-Message-State: AO0yUKUf1+FDFFcYFYdxDhK6LPst4M+ncgK/U33l1E8qonTsTYe8E8+e
 Sws1zzqiwH6BNRlLmgJ9GXHmtw==
X-Received: by 2002:a17:902:f54a:b0:19a:a647:1891 with SMTP id
 h10-20020a170902f54a00b0019aa6471891mr6625157plf.67.1676946001373; 
 Mon, 20 Feb 2023 18:20:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 04/14] target/arm: Split out output_vector_union_type
Date: Mon, 20 Feb 2023 16:19:41 -1000
Message-Id: <20230221021951.453601-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: QWOoffm/VFSK

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

