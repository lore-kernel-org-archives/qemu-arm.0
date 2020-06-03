Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp31466lfc;
        Tue, 2 Jun 2020 18:14:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcki/ILxi6D5YAL3+DYzk8nU3VXENWEJmVZHRQkqXLoT/VoQxOnV1rttOsGbksLVaqMa0I
X-Received: by 2002:a5b:c46:: with SMTP id d6mr16760220ybr.70.1591146897107;
        Tue, 02 Jun 2020 18:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591146897; cv=none;
        d=google.com; s=arc-20160816;
        b=QFdm7S7G+mGS2f37VeZvF+wTJeJFV2Zfdz6fHG4JXefUIbZqzeP5CcCifr4DCIHllB
         ABeCb0m8wF1LOyX+AXKAqihFtOMY9rnTUmDUVrnsM6TuHCFOWPGeJpWG09+ry+zsgFNP
         V65QTYlwu6jA2NEHnKxGl4s3H/EywePrYu8qy6Qsuo+r7mvVzBoH/f55EkgfyBMn0UD/
         uz1dWdfBFsUAisai4K0f5V4/5PnTSpbw+jSllRz8e8h10F7UUhsylVvtU1NSWSxHvpwa
         dx86VKBsoG1DEJefa4Bzt8VskuSf2DYfXd43738PljqukXZdi2j6Y/Jbg7Avm/FlHK0a
         GFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LadquP7zcJjQQG0Yfbt1ahthtHYVsuxaqjQXIxyHC+g=;
        b=AOrWGqE7zpGx1p34YbWPpK+7UujTQZRJK6xDK36YvwFPJNnheyi2f2ovnZcriGuuBh
         +t7llpszUgC398IOgBhhVVisXYp1M8u2N9XLu5gili/Og3e/CcbW/ij6AS+K8paGbuW0
         5Rqv7K3FTxPO1YTlnNsJnDozuiL0/WhTVuRTzxBr39s6s/n9PKQKtB1gPCu6Hu2V/N1k
         hD8GNUqZ816MhG2ZkuD4mICBwdSwG/wOu8a7FCqgmnyu7Q3XBpgotfAWozKu1B5etJj0
         julFxHzb5PUSVHfR7rA+QbuDBaEek4TIylndhhYfd+V3Wjig16TQ3dvn5IxqF5tgr8Xp
         0Utg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="u+UtE/59";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h198si320915ybg.378.2020.06.02.18.14.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="u+UtE/59";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgHzc-0005lU-Eh
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy7-0003Hg-EF
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:23 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy6-0003Vb-RJ
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:23 -0400
Received: by mail-pf1-x444.google.com with SMTP id f3so400817pfd.11
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LadquP7zcJjQQG0Yfbt1ahthtHYVsuxaqjQXIxyHC+g=;
 b=u+UtE/59Le3pHvHBcznGutnq/Jy4yqyhDnjhwwE2lSJCdgfZbgodRX9j6tPmJ8hYKu
 IdnRKB4rB+wkqH4mUHceRFWxAwA+OTsvl5tx9+IxRUKNtL/4HY+/h+gai/CrpCZUKGFx
 sXxt/WII8p055eMQ/Dm1e5pf5eP6XrWQ4CDJ1VxgJeuheWUqgN5SRZacYXE5ch5p1Foj
 CY0nbaC9gUtZq6E8FIlCYYLpocgWCSsuaEqkJICoVySJnHBjSDAzuGqyN0yd4LJGlfI2
 v6Z6hlFEDsmlcA/6XIIPTglrdWZc0V3ii2qMN1ZSq8V2NknLycAiPVMV89694bIa2l/O
 u4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LadquP7zcJjQQG0Yfbt1ahthtHYVsuxaqjQXIxyHC+g=;
 b=UtAgpIZwRsH/Myv7jW5ITZ9SFs1QHP2K64lknYLGJvDbGQw2K2NE31k8FRdkcK3HR2
 PQRV5Kx1yfwLCokmC8tDBw2Dam8+BkO8NELuafRKa749sE4iuI+Umq7duYAqUhi5o2Vf
 lTl33WAfgY1xpxfXGF/+K4t2ZX7vxdr5SGBF+zZdIIfe2kIqUgdiMKvLKspcyWd5R/eL
 ap8Ju9uMTh/pmsb4S13B8OYrmpAuWJRQ1vEPEGwb9v226VFL3xN43v42rctYrVhpMSIc
 rpaxo0m/wS/FQej96jzCU5+IU0/ctTi9mGXkASuYMWMOE3/ay28p8Xxhc9LB4x8g7MFz
 NNVw==
X-Gm-Message-State: AOAM533uokG329KsTWsvYr0Fgj4iTLjU5Cb0f+cBKyuRRfV0nApa7gde
 2lQZmA5MGUAHrhnPmeZ5fKAqQ1+oFKo=
X-Received: by 2002:a17:90a:df16:: with SMTP id
 gp22mr2327443pjb.6.1591146801223; 
 Tue, 02 Jun 2020 18:13:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/42] target/arm: Improve masking of SCR RES0 bits
Date: Tue,  2 Jun 2020 18:12:37 -0700
Message-Id: <20200603011317.473934-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RRWnIxX/cEnE

Protect reads of aa64 id registers with ARM_CP_STATE_AA64.
Use this as a simpler test than arm_el_is_aa64, since EL3
cannot change mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a92ae55672..2ec49c1a55 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2011,9 +2011,16 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
-    if (arm_el_is_aa64(env, 3)) {
+    if (ri->state == ARM_CP_STATE_AA64) {
         value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
         valid_mask &= ~SCR_NET;
+
+        if (cpu_isar_feature(aa64_lor, cpu)) {
+            valid_mask |= SCR_TLOR;
+        }
+        if (cpu_isar_feature(aa64_pauth, cpu)) {
+            valid_mask |= SCR_API | SCR_APK;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
     }
@@ -2032,12 +2039,6 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             valid_mask &= ~SCR_SMD;
         }
     }
-    if (cpu_isar_feature(aa64_lor, cpu)) {
-        valid_mask |= SCR_TLOR;
-    }
-    if (cpu_isar_feature(aa64_pauth, cpu)) {
-        valid_mask |= SCR_API | SCR_APK;
-    }
 
     /* Clear all-context RES0 bits.  */
     value &= valid_mask;
-- 
2.25.1

