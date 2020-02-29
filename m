Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1318478lfg;
        Fri, 28 Feb 2020 17:30:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4VjgEojlTe5Sw92OeQ9TB/DvB4faOmOr+eaQuRNjtelKHnFM0EkQ+BM/EOlMOKXqlBVmI
X-Received: by 2002:ac8:42d7:: with SMTP id g23mr6594464qtm.206.1582939813246;
        Fri, 28 Feb 2020 17:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939813; cv=none;
        d=google.com; s=arc-20160816;
        b=ppz+SYfJ0pxCQm4URIIWTOnQYwsryLoHrb3x5p1g+ujGoyMaRE1adn2zfvCkMAIuRH
         mprlyMATVdAfMARuy5f6juNy0AR48B8cUCPWmwIkVO9WuYLHpBHb4gtheaTZeC2lSFOO
         8/1wIe9ES0+Y2dZsuQhYGv0G9YQAMzeK+//6+k+lbixKLEaHZ/GfKw6z3iroLH05KD5v
         aQ3amevn2glNrBXfz9uUTCVLeUa1Dbz83fh53Lo/xvVuQCrjTaPebvOfZG4AYHUu5PaM
         9iN4DDK+KP1BWQXD1yEtdFXb2ZuGXS69qgFvKvEqYpvHMKdU8PiYgSMSLI91Ja+UOE8D
         Et2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ohQYIa+ztFNnbKsJpZfcxKi5WgxlXIdIZEVtzv1Cd+Q=;
        b=Xgr+RYNFrrEijJffJhSt8bzRdHec7LRe9m1wiQ/BJ58KOqXt07sOsF/TyTmR2Ha5QD
         SzkIkDyXZQ7TKW03qEBfW1epR3JDDyrcKCioepcJCjAOeGD4GO2Lc9iwUpfdPuxPwaFe
         K4745IEMTFOLacsCdiS+avNoD/vOVdXikRatjgWjWXUxSwb5cQYMwOftO6uskNe5ZAMK
         7kXBn94DujPHIGNBUnOzEASRK0I2a4qosKyllq6gaZZN8DqvTkqtrRCQFTju57g3BPR0
         B8P36M2bMwT3e8eBHVWdS+dIgfmQ7jm3pI9juOXGif6Oc+64hqP11/Gp8HRSfnK+EwHd
         6N9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iF5RAbD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u83si2300610qka.247.2020.02.28.17.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:30:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iF5RAbD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qxI-0000CM-LS
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvb-0004u0-TO
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qva-00065G-79
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:27 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38675)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvZ-00064g-Ue
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:26 -0500
Received: by mail-pg1-x542.google.com with SMTP id d6so2396302pgn.5
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohQYIa+ztFNnbKsJpZfcxKi5WgxlXIdIZEVtzv1Cd+Q=;
 b=iF5RAbD4McjE5ael1cVN0Dr06ePAj0CVJWs6KjQDBEMVLZZr0/wMSLsCz5Sxu2Y9Kq
 /snTikKt/jQjIlLOD2e+h3T/f3hzE1B5DR5Oor1MvMavAIjwJN9sIqJglaNHnTxSvkL/
 RKmlF47g0KKO64CH4ChVnThi/ayvdCtPdFCMlOkyjaMyQU8nhtDvVzXl8oLFpvtD6V13
 I1FUaKm9PkRTUuqpAJwNCvo6paooZi93s3smwCDru+SHmCfLssrQ+20HBh2FEssQS8dr
 S2QhTJHNzJlS2APpmscgVtL5ZyZVtSdEzfTbK94noapuwjBxY21IEgaXvNFR6Rzo4AKJ
 obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ohQYIa+ztFNnbKsJpZfcxKi5WgxlXIdIZEVtzv1Cd+Q=;
 b=dqtx7sf92Rplsj/G+RVKpRJYDWA+/pM7yVP8vYqw03/Xcnp/nO2aUwlDTxD89ZsUYl
 5cwTeSxLJ+37Fawu479S8nznojh22bStu/M4g2L5jZxyN+PQKfdoFQWRF67mtZYVpequ
 6g1e5IY3/5TM7Vd7yFt0cFCPGbDJPZ+BLCaFI/sL7apbwNsvD28a2rI2ozw0K27n7I+1
 EMWZhjnusygRoLUDBdCAJkl5uFJjWhC+TRlvopsDXYEzfwk05GIZo4rj+jOQnsnrLFFy
 /bpnBjT1i32XJQmTK9+IeceVaJU472yPvXoGT6fYK73pZb36HGmFlVwxXJr+c/z2ypmb
 SGng==
X-Gm-Message-State: APjAAAXXfm/NfWrQrPpzY7udQ+cLmCk6QxdGTQ/obid//sER1d96vvYH
 xqcnpLj/pPgxZHJuo724WoqhLDb5cJ4=
X-Received: by 2002:a65:6843:: with SMTP id q3mr7346064pgt.269.1582939704957; 
 Fri, 28 Feb 2020 17:28:24 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/12] target/arm: Honor the HCR_EL2.TACR bit
Date: Fri, 28 Feb 2020 17:28:07 -0800
Message-Id: <20200229012811.24129-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TVP4sk2Dsy/1

This bit traps EL1 access to the auxiliary control registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ddef3d7dc3..2c06ac8d02 100644
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
@@ -6961,8 +6971,8 @@ static const ARMCPRegInfo ats1cp_reginfo[] = {
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
@@ -7718,8 +7728,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

