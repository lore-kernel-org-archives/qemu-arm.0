Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0BCD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 15:35:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSclN-0002Nd-GF; Thu, 28 May 2026 11:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wSclE-0002H9-C6
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:35:05 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wScl7-0007Wu-Kn
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:35:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so68366495e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779982495; x=1780587295; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1qXL1l1v7Mc9jI0Bv0/cp9n0LoICATpSs3WZIgkwsgA=;
 b=CrY/SyjfXwF/bb2qTPmkgMoG/pr9QblrHuCxoOkPW3EQH7bDI2DGzYteS+0NWzo7Au
 pZoKoWi+KkjllWOrJh4/8VsKTWYS8ElIfnbsGqX4MRA4DaWcUQ3X9xP5RjjAkSORFV+j
 g5Xpdc5ahY+X31l1qiBWXOIw9dXgfHZiGFtP2/jqEHpEbbkTQGAhiZzkH330EcwTLOtL
 ogVx0iGzYs81O7HFcd46NR6Hn2LM6SU5Zk8lPxH2Ech/Crb75eaSs/i/s+ieD6mIlpE6
 5a9ukIZWSRp0mDfqzxo+BxDMnxfBY81vbPZ1muplPONTsfBoIHarfsKeVaSn0+aZZRjK
 U0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779982495; x=1780587295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1qXL1l1v7Mc9jI0Bv0/cp9n0LoICATpSs3WZIgkwsgA=;
 b=kh+gHhOEAY0Ca2p0q5nPz9dHEPy4rExlyPbiqgxzYDIamPBaypkRzzs3T1E9Uhz4cl
 XCacbYa8BEcarKc10j6adJH4/6fSUFOO6V1Ug+KQ0vLz5Cc91rw2q/izyYLKK8+rvN6f
 kZBHbHxdk1JZddPtUkfXmn433ybTIwclPPVvisg04oQMdhyJRkFqc5xx/XkDuHB52UM3
 4n5H9axdC3+Wi46rKSz9gtF/3JDrTeWjUEDDxeHGnApSel5zx/0hxZrGBvFJ5eSbmqeU
 1F63tINUHqicGaiLYgTchUpKce6bg39+cpTqzOOXQ704LKGk3saGz4edbAZjFkz2u8ra
 4itg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/6tAQhP3Semh1FSbtVl1muUhiZY1h/5Yl5o72/teeLbCjzAZkez/4gwWPRp3oWFKIh3XfPv0M/TQ==@nongnu.org
X-Gm-Message-State: AOJu0YyfFVMNWxhZnjcRbJ6I0oa296/F52yjvHZdnJtpg201mTU10r32
 eGFxozMATugwWphCxlqqgvlumBD6h3GqaSj9huoJ+ZRZFqhPbOf1NWrmIlsZ1QNtP+0=
X-Gm-Gg: Acq92OGyzFyGRuSGTmLbd4hYWMwkddBer96mVCew48EtQ4K5/O8n/MQkvSo424P5OzR
 SUmvJj6PZ033yIDCarv5Z1JvTXY68m3qSwchPmKIGdJrMe05VlwuTagSeqvLQcSvrdWNkJ2NQs5
 5GPgIH4QryGS/4q/H+zV449eBLWQ+CfTSx+DRoURSpFvlvPu6Ye/XRpDQuQskCpYgDKIUOnPJED
 r306l+hfrSpWwwciKi9bB5bSghm8dczCvFJ32jGq3bzJA4RodKmy/mFuGSaMA2YpyPJZxviaUW4
 OlatDu0nc8gGsvIaKhfJmaMO9wHHMgRiSTkQLG+dlxl6IigIp75Us6ya+TIvYfb8yXcpD61zMSq
 0rcd8+IlZtk+laohEoWKo9aA4/K92IDDCrShV0maeY+upUduJ3BCx4VypDFMjhqTGqLOLxS/97F
 c03lLBBQ7EYWL4mgFc9bulu2ZA+LTUBYIFFU3M2w==
X-Received: by 2002:a05:600c:3581:b0:490:482c:4391 with SMTP id
 5b1f17b1804b1-490482c4586mr493006935e9.23.1779982495493; 
 Thu, 28 May 2026 08:34:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:f5a7:372a:ab8b:3c01])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909298d41bsm46514785e9.11.2026.05.28.08.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 08:34:55 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 28 May 2026 16:34:36 +0100
Subject: [PATCH 1/5] target/arm/cpu-features.h: x-rme now means GPC3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-jmac-gpc3b-v1-1-d34c46c5069f@linaro.org>
References: <20260528-jmac-gpc3b-v1-0-d34c46c5069f@linaro.org>
In-Reply-To: <20260528-jmac-gpc3b-v1-0-d34c46c5069f@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 target/arm/tcg/cpu64.c    | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index f9c979d20b..6819d5f6a7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1138,6 +1138,11 @@ static inline bool isar_feature_aa64_rme_gpc2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) >= 2;
 }
 
+static inline bool isar_feature_aa64_rme_gpc3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) >= 3;
+}
+
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, DIT) != 0;
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a377f67b9c..53f0ea0404 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -159,8 +159,8 @@ static void cpu_arm_set_rme(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-    /* Enable FEAT_RME_GPC2 */
-    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 2 : 0);
+    /* Enable FEAT_RME_GPC3 */
+    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 3 : 0);
 }
 
 static void cpu_max_set_l0gptsz(Object *obj, Visitor *v, const char *name,

-- 
2.43.0


