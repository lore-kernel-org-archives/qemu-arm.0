Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp474163lfu;
        Sat, 30 Apr 2022 23:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC6p+b9GMnEoh61CE3yzyCZGUIBdxrk+NHc6hya3fnDjeg/8z3s958QiWkQGgOg8mzmj3Y
X-Received: by 2002:a05:622a:611:b0:2f3:8454:edcd with SMTP id z17-20020a05622a061100b002f38454edcdmr5737528qta.297.1651385952919;
        Sat, 30 Apr 2022 23:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651385952; cv=none;
        d=google.com; s=arc-20160816;
        b=PHA1CUUhM/TIkx2NVRlxPUJDT5fkXowWM26mh8sVcNv+MhVoyAVlJ/TogR+9e64ZIB
         SGRHNJtN73TwJNLvSUg4WqTBhOpkGitHSVyDk8QhQfbDZSYXjo8DN6DUr/WkgDn/14JI
         vjWyjhM6fjkwY1aiB3eT+eaf1+cdJkyD9OS1bJY2PRAdpHU+bq9aA9TzTZm2ypLvxAUJ
         6YOUUO9uwwejiFj60wlvi3YNrq9koZoadxtVfKq7Ik0qsl7hK++pJpb5dYaSJo8ac8dI
         /5jcOxGG3wNI3uTzNhbsOWe2g8OxztVK9mGJcalOaOGi2ULJZF6lO9ruC0x6MKS4mMOD
         psmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=quTC6tTsjrVSG7RTQMFQxNix8MmA7vsc1c94ro1M6BU=;
        b=Zxz7dj09IcY3L8VFJ5mLg8Qp4OZYqhyL5EDOvNIcmQ9YqJLVbyuF0d5cymB2UqegMi
         pNl30SIthb9zubtHrHEC8z9CC97w3XGoxCF5GiWNbwSm+pm4u4hhfArm77Z0B/Jzsrw3
         NFnfByRnekDwjYQlP0fgJ/oane/01xdyrh28CzNN1Z2oFPt6EhzSz4r2PBgsV2bhcxj7
         Fsa1r7iI5MBZAxmr7RMzQvWkRwuLeGQ9FoOj9wLjx+WcR7ed3X+lGHLM3rmUbtrXEDTQ
         WB3LtCDzlNdNaG8ss/Ifp0SH4vy9LKHkStMY1jiOBrHmkujsCRo/PBghkXBDL3TI66Vv
         40wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GAaMlrPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a0562140d4800b0045812880679si2971188qvr.185.2022.04.30.23.19.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:19:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GAaMlrPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2vI-0000I8-Bp
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tp-0006t8-Bw
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0001HP-JU
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:48 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so10595823pjb.0
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=quTC6tTsjrVSG7RTQMFQxNix8MmA7vsc1c94ro1M6BU=;
 b=GAaMlrPsCUAKgd4ifuF74NLDzajJdiMSssMgoXVuxe/PhIqvNkznvXLkzcgSb4zIfS
 TeJbN30lQ2SEyg1HbpDIcTskbRUl0WXEA053PCs9ROdHLNm6btDswIXIThYYYSgdNAta
 qx3IgFdVR2lOd5wu6keMsZCiAhdIBpVfvl6e681283mImO7Dvo4PaANbaxpC/WnE57RI
 HXx9+66u6ZdDq8iJD2Ghfnjtmv1g4iykmK9vlIITE53NwY/ni5cGT6zLlYws9ve58UjC
 nxdgdeC4eX+qIDfZ8NO5bcHtK4UTwKaRVEtmHYwWRr8AzVvdECTVXIkx/F8/QS/cZehb
 s78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=quTC6tTsjrVSG7RTQMFQxNix8MmA7vsc1c94ro1M6BU=;
 b=hCNIaOaqQcl92IHi/Z4FFysyQHOMo/0CiIZuJlT/DxAksADdqUOla7cIMwYgevqRf9
 DYAXcU6Ht10C4f1k0xDCIq/bAjgUKEEC66RQp1SiaMSJ9ER5dUqge4jHq3rRBK+seBuR
 hkFENeJXV3cqyFLFi80khpLICLCoK1Q0jtAcLenVZvNAjxtvJptbML1KYHK1kjKgTRBy
 IT7tMYZZHvNqbqn3G6lrbGCdwOkvCo6MOxP/6058QbY6z0ITqt6GtKh3wzDqJIRsj+HX
 l11ekJBaRE3Nvsu21cAiOBS0FvVXD+dHJZqONRvYKcuycoLD1vayf7aurKNziTn7n0q2
 HP2A==
X-Gm-Message-State: AOAM530yKlCuJHTN1q2ysVFxe5l2AEs9Wn8T0c72xitWTshLVFiS1m+Q
 qrn3Qgrgy1MdpHjMYUwIlfR5xA==
X-Received: by 2002:a17:90a:fac:b0:1ca:5eb8:f3b2 with SMTP id
 41-20020a17090a0fac00b001ca5eb8f3b2mr7145887pjz.37.1651384242469; 
 Sat, 30 Apr 2022 22:50:42 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/45] target/arm: Hoist computation of key in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:55 -0700
Message-Id: <20220501055028.646596-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OarNCuhy1uBJ

Move the computation of key to the top of the function.
Hoist the resolution of cp as well, as an input to the
computation of key.

This will be required by a subsequent patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44c05deb5b..118422d672 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8509,8 +8509,34 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     ARMCPRegInfo *r2;
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    int cp = r->cp;
     size_t name_len;
 
+    switch (state) {
+    case ARM_CP_STATE_AA32:
+        /* We assume it is a cp15 register if the .cp field is left unset. */
+        if (cp == 0 && r->state == ARM_CP_STATE_BOTH) {
+            cp = 15;
+        }
+        key = ENCODE_CP_REG(cp, is64, ns, r->crn, crm, opc1, opc2);
+        break;
+    case ARM_CP_STATE_AA64:
+        /*
+         * To allow abbreviation of ARMCPRegInfo definitions, we treat
+         * cp == 0 as equivalent to the value for "standard guest-visible
+         * sysreg".  STATE_BOTH definitions are also always "standard sysreg"
+         * in their AArch64 view (the .cp value may be non-zero for the
+         * benefit of the AArch32 view).
+         */
+        if (cp == 0 || r->state == ARM_CP_STATE_BOTH) {
+            cp = CP_REG_ARM64_SYSREG_CP;
+        }
+        key = ENCODE_AA64_CP_REG(cp, r->crn, crm, r->opc0, opc1, opc2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8554,12 +8580,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
 
         if (r->state == ARM_CP_STATE_BOTH) {
-            /* We assume it is a cp15 register if the .cp field is left unset.
-             */
-            if (r2->cp == 0) {
-                r2->cp = 15;
-            }
-
 #if HOST_BIG_ENDIAN
             if (r2->fieldoffset) {
                 r2->fieldoffset += sizeof(uint32_t);
@@ -8567,22 +8587,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 #endif
         }
     }
-    if (state == ARM_CP_STATE_AA64) {
-        /* To allow abbreviation of ARMCPRegInfo
-         * definitions, we treat cp == 0 as equivalent to
-         * the value for "standard guest-visible sysreg".
-         * STATE_BOTH definitions are also always "standard
-         * sysreg" in their AArch64 view (the .cp value may
-         * be non-zero for the benefit of the AArch32 view).
-         */
-        if (r->cp == 0 || r->state == ARM_CP_STATE_BOTH) {
-            r2->cp = CP_REG_ARM64_SYSREG_CP;
-        }
-        key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
-                                 r2->opc0, opc1, opc2);
-    } else {
-        key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
-    }
     if (opaque) {
         r2->opaque = opaque;
     }
@@ -8593,6 +8597,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     /* Make sure reginfo passed to helpers for wildcarded regs
      * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
      */
+    r2->cp = cp;
     r2->crm = crm;
     r2->opc1 = opc1;
     r2->opc2 = opc2;
-- 
2.34.1

