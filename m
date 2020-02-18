Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6437160lfp;
        Tue, 18 Feb 2020 11:11:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpiyZjs0rnvw6p887BvqatjrmLcS93KWvWIZ5UG5Widbwl8usN2Zwz6b2IASNcvn/GRQwC
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr18383782qkl.201.1582053089522;
        Tue, 18 Feb 2020 11:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582053089; cv=none;
        d=google.com; s=arc-20160816;
        b=U7le+qBfBZWUiUZEUQWnFODNbPHUYPPCQ48RigxvpO13lTHYK2aq6exnyz3Yrs0Qh5
         Y+kebjvUa/EM9Osnm3xij+y6/IXvwxXZQOXYH261QvySLTdTL0Ow9NX005Ue8VyP/atg
         cS2kBRQwlrACJqZmNgMugLjdWA/heTgh8ALy5FjWIvbtEn5Zw8IhQJrHPk140sAD/EO2
         NSST7YI6NfJMMN7G3dqHXPGrNj929Zm/Sj/g2FF2f8T5P/19eZ2T286qEAn9kOMa87II
         HTT6ymDq9+Jr/jdNJOudyy/bcohm7i42YpaWIC09YwBbUWXxDaAuz6lv2xbYlAKb5jeH
         Sq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=macsUf7RwNXBE0fmKKCjQlSCUWHuv/3Gu30XsvyGcpY=;
        b=kpofk6zwsM6jukE8eQfKAT5w6uXXZOQ15NmELUByUuibP1JCqTEBbFSp8WeqFCDNP0
         wmzmfQZ6wBAted1AOWfLctB7T1ozl52+cAv7jzx+USymrohJ97907q73YFjl9Jx0gVK4
         q5GP/S5ETmgnoympmuhSc5obaLK/eNU6nYzm65O5uZbWYLylmrO7DieOwyrOGHCAvakO
         1oeap2cN1+A20+L8B5I1sepqfuaFQiyv8g54Rnx+JnuTHOMup2V7ZIs6viPM2oNVW0E0
         4lP8TWvu0a0W3735SO3QEY1n2QXLYBPlPZK300F2pvSXHm/yieKEMcBWFaeeAcvdQsNn
         YIVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ap0lFfBa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si2331362qkf.102.2020.02.18.11.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 11:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ap0lFfBa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j48HI-00056Z-VQ
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 14:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j48G1-000500-B6
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:10:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j48Fz-0001uj-T4
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:10:09 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:50641)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j48Fz-0001s4-M4
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:10:07 -0500
Received: by mail-pj1-x1042.google.com with SMTP id r67so1447093pjb.0
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 11:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=macsUf7RwNXBE0fmKKCjQlSCUWHuv/3Gu30XsvyGcpY=;
 b=ap0lFfBawvYsao7AIava1O4L4J8JPIPlsgvKjLKk/m5K5/K6dRHpWbzlRkGL52Tr1l
 jYY/jCvZR2BGfEwmRv1iecNjZ19mAJA7O0zP5UdSsdv3yvWZQilzWwqSM+NcE/dss3y9
 RPjuQ8zG6DiR4KK6YDpdFD6qnBY8uwkwnIhJsLVVvlGcCAW0TNwsmjeGXUA0E8gly8li
 XnNfswl1eAgkgWM0AqbkaWhtK2Xh0kfA5GLG/utz9bvhge95lWk9Q+ZHf/DjqASJsq9o
 Pclnq9mSd2dcKuGTuajCSJqo2mNjY6h5QMES8U4ylqvI/OT0ihUVCy31I+ufZdYtSJd+
 DbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=macsUf7RwNXBE0fmKKCjQlSCUWHuv/3Gu30XsvyGcpY=;
 b=Yo0pi1GITZLwDGvVTLWUgLDbwEQvc1KPot6RQd3Ci59lnvwoKpV8+k9QFBn1T+H/4q
 nu0LzHj/qSD0hW4Kz18ZhEBRxHZqSTaKFh71Uxpv6CFAx9s6bAF5k2MVQso1Sk9KbieF
 7arooNuSqIw26TYSOAhkGc8RkqTyNb4Fumc7LrC6lOFjl6ODHjqDU3eIGISSORRHEPZn
 FWLanuYWAQZFcFGmStemxi+axFAUIeY1UzrhGGfvT9DjwbHsrY+UjZZ7pPr3UBW2dK7o
 uJcpt4EzxFdIObG6fCjMlHdbGuegEZZ84snv54FssK6l4rGd8BTN8lUdAmNydZ0YXAlG
 fX0w==
X-Gm-Message-State: APjAAAVtr1r57L0oXHKJDtWonaeFQw0oj3lbniPJrr7aLgMgv7WFlYni
 l4FYlpkm7DrkrmAzHLhkrVBL1ZYpAZc=
X-Received: by 2002:a17:90a:5285:: with SMTP id
 w5mr4470243pjh.77.1582053006040; 
 Tue, 18 Feb 2020 11:10:06 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i68sm5139399pfe.173.2020.02.18.11.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:10:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] target/arm: Honor the HCR_EL2.TACR bit
Date: Tue, 18 Feb 2020 11:09:55 -0800
Message-Id: <20200218190958.745-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218190958.745-1-richard.henderson@linaro.org>
References: <20200218190958.745-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+iIjxnJX2jG

This bit traps EL1 access to the auxiliary control registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc99ee5d18..52b6e68659 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -553,6 +553,16 @@ static CPAccessResult access_tsw(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps from EL1 due to HCR_EL2.TACR.  */
+static CPAccessResult access_tacr(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TACR)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -6911,8 +6921,8 @@ static const ARMCPRegInfo ats1cp_reginfo[] = {
 static const ARMCPRegInfo actlr2_hactlr2_reginfo[] = {
     { .name = "ACTLR2", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
+      .access = PL1_RW, .accessfn = access_tacr,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "HACTLR2", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
       .access = PL2_RW, .type = ARM_CP_CONST,
@@ -7668,8 +7678,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo auxcr_reginfo[] = {
             { .name = "ACTLR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 1,
-              .access = PL1_RW, .type = ARM_CP_CONST,
-              .resetvalue = cpu->reset_auxcr },
+              .access = PL1_RW, .accessfn = access_tacr,
+              .type = ARM_CP_CONST, .resetvalue = cpu->reset_auxcr },
             { .name = "ACTLR_EL2", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 1,
               .access = PL2_RW, .type = ARM_CP_CONST,
-- 
2.20.1

