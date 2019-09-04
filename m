Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1141878wrp;
        Wed, 4 Sep 2019 13:04:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzq27VDn7RO1ROe5IBD/cPIdvj9MGLKGsHUCKbW45b2VQ4kyHk6qlQMis+y5DIaOAjDBFMx
X-Received: by 2002:ac8:1e08:: with SMTP id n8mr41180658qtl.144.1567627441228;
        Wed, 04 Sep 2019 13:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627441; cv=none;
        d=google.com; s=arc-20160816;
        b=aFaWxEnPCo95xIyaxQbXZqZBQish66PcgsQmEpk9G16qM7ITqOlBVED885LVdAfUly
         ON0PTnbiunIGSpbSTroDGXdCSUeGYkqd24MlmlIynvhNUpB9VTp0sFf2+vOxK6Nm4NJx
         j/K57bnoIOz6zBCSQausta8H/3xbttHwK5aOt1z0sAKniXd0BHlcpzmbHF7ReHumLtaL
         5DiMgTDNyNU47Igz0zl8EtvSrCC6ezkADMxrVnPY/lPfG+Hwi0YPXrq6+VIoGnybHQSB
         NUzSdW/79aafShfwEtqXNux4HM/qmJO7JUGZD8Y9ILySq7kzFpmUUVYpYz88a1zPSHSJ
         +Uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=W/BZPRSZY6X94E8EzsWgQ6OBzD8ENERCVK/Str0XZk4=;
        b=tcZQLyipmgH/l7nQTjAsAMoXwzHpy+qtAGW7/08qjgVsfbEQIKx8JOaDMNOfdHV36b
         GfWxxkC/7xs066E6w0SR+zs3ZFwhm1u1JMsR3ucvycb3bWEigVXk3OSHDCLP/4S3JP1j
         kti4pHDFP+XsOp7PLIZR1EtkB3WTwfMNh/WqDiuToDal5J4hmkGXUDhraRKBl1RZIsNZ
         Cwntu/U2KCw1YT31K4oluDSnaxW/AySm5jV2E+l1T38LVzG/i0s3byx8tcaS6f5v/BGW
         SwAs+mNDHFRlMBOTGvPFjGtM17q0qX/L0ioEL2B3wG2rennsoN5/5IMOtBjd4rhjOa3w
         wdEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lhH1jllA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si362184qts.257.2019.09.04.13.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lhH1jllA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bVY-0004Wt-5O
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0V-00059T-AZ
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0S-0002lS-5m
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:55 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0R-0002k7-Qg
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:51 -0400
Received: by mail-pl1-x641.google.com with SMTP id m9so10055083pls.8
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/BZPRSZY6X94E8EzsWgQ6OBzD8ENERCVK/Str0XZk4=;
 b=lhH1jllAnJ0yjcLPM1tNCnoFsu2GANDxZN4ZbSlek4Q9XC4Oks0Mp1d42LGNQwJrqy
 fXYEqHmT0TlKips5YSojr+6ctyBLNQVFGVBV+2ABRm6qf04q9aa1wcSEzgFbBPcoiD3a
 dRdP99xf8GZBbKmsfFaPlaijgxp6Oj37LljTLyx+SOoqqcsJ+1mwZNPr810dIDtUCR+j
 R12dsyX5elfM+XojpL4G2w3VgP5U09b/Az9TaeVoB0tF8XHk0+gDuPbq1Ldo1BnFw1gG
 jABz9jBshYwNwXewvI4HRm/WRJ6uOZfVIX3MEgvdmrnWjL2fo2IByjBsQvA0DUlbu/DS
 ROUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/BZPRSZY6X94E8EzsWgQ6OBzD8ENERCVK/Str0XZk4=;
 b=kp2ME6tIda6SA2Xh992Kqep0O4ppo79JFwF0s8ZYIP7TeKoYN6n8qOoy5e1Gr9K7Yu
 jja9aljCdn87Th6evjc5y89mBcDIum7rI6WR2TCvCX+Wc4ShwW6Of8C4ThfvGSXx5qzO
 fN6+wwVierDVPvbOHtTX/vUWfEfgGpz9yV7oPaO2VW6QpNAzP5jWkisZYCFXw/Dxo8I7
 /XtnbSMKG7pMxsW9gqFucj+XKfDrx/akooDhbuz4/Ap49BTGrRKj3SwVpbsQLjSp4K2G
 cJ2zBu+EAgesA1wFfTE4IItnbRQ00T8dSJOiKasEQx+bydzOvNJ4YxHWDdLSXYqBOVXW
 mUKw==
X-Gm-Message-State: APjAAAUE5vPZNalZ6tDXb/r1THUMzddOBquOJqeGqwNf3y8JjI5cpX9g
 ukXSKVR1s46Hgfbxj7Z1BVBwtU+St3I=
X-Received: by 2002:a17:902:850a:: with SMTP id
 bj10mr2758478plb.254.1567625510315; 
 Wed, 04 Sep 2019 12:31:50 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:28 -0700
Message-Id: <20190904193059.26202-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v4 38/69] target/arm: Convert PLI, PLD, PLDW
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
X-TUID: ajV2eBYImN2C

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 37 +++++++++++++++++++-----------------
 target/arm/a32-uncond.decode | 10 ++++++++++
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a599da96e1..3f02532d12 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10252,6 +10252,26 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     return true;
 }
 
+/*
+ * Preload instructions
+ * All are nops, contingent on the appropriate arch level.
+ */
+
+static bool trans_PLD(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_5TE;
+}
+
+static bool trans_PLDW(DisasContext *s, arg_PLD *a)
+{
+    return arm_dc_feature(s, ARM_FEATURE_V7MP);
+}
+
+static bool trans_PLI(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_7;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10312,23 +10332,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f30f000) == 0x0510f000) ||
-            ((insn & 0x0f30f010) == 0x0710f000)) {
-            if ((insn & (1 << 22)) == 0) {
-                /* PLDW; v7MP */
-                if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                    goto illegal_op;
-                }
-            }
-            /* Otherwise PLD; v5TE+ */
-            ARCH(5TE);
-            return;
-        }
-        if (((insn & 0x0f70f000) == 0x0450f000) ||
-            ((insn & 0x0f70f010) == 0x0650f000)) {
-            ARCH(7);
-            return; /* PLI; V7 */
-        }
         if (((insn & 0x0f700000) == 0x04100000) ||
             ((insn & 0x0f700010) == 0x06100000)) {
             if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index 32253b4f9a..ddc5edfa5e 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -54,3 +54,13 @@ SB               1111 0101 0111 1111 1111 0000 0111 0000
 
 # Set Endianness
 SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
+
+# Preload instructions
+
+PLD              1111 0101 -101 ---- 1111 ---- ---- ----    # (imm, lit) 5te
+PLDW             1111 0101 -001 ---- 1111 ---- ---- ----    # (imm, lit) 7mp
+PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
+
+PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
+PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
+PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
-- 
2.17.1

