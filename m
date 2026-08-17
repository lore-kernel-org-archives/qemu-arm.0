Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731CAC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 12:40:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvwc4-0003b0-Cq; Mon, 17 Aug 2026 08:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc2-0003Zw-D0
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc0-0001Da-LS
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:46 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49978908b35so26171645e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786970322; x=1787575122; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=opC12ydTNugOwOJ6xGPR73o1WqfNlp3JxYQBD+XkUu8=;
 b=zeErLOSlbq4rXYafGthjHQZ2xLQAvHb6Q4e5rUE1n053FvCQl/iqeB3ZBEZqjcw25K
 2oQPi05u0bY1Xz76zNRqshYyJ+P3P1ZMI4YrD0Yce8QQgR+3PjZpmPzouL6jAzt5BAh7
 2jxsHxMyjvaJUSMXbI6xmqVOLE8fUnTkTGfAm9nYz1Er6oTNpHAN3KX8hr/oapYRDVIN
 eO+/fzsR3WgpI3iEldH/DSQSGo/XLizfu5SXMOD+28F7B70kKDBZ8eLJMpGIRaAr37Zp
 LACpfw2TD6F4JmSG7o3bfqUv/7ouQKiXClXkYhGEJHMVlOzVT7n6Ww+ZWxqF0p9RKeqi
 nJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786970322; x=1787575122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=opC12ydTNugOwOJ6xGPR73o1WqfNlp3JxYQBD+XkUu8=;
 b=pITFvdsvTXW5/NsXt2NSNEsP85R7mdGx0bD0dHE3KfSahGF0+N/IpKa32uRaH3MInl
 llNlv9GvtdyYW0PgcfFV5q3DHKnzDPWuMc4BoQfZ1aWegb9CCx+XCOzqSz+7Qd4UDv3e
 Mg0vw8sliz8g4U1px810/WMoAcuY6BD/31FNboXoI00b+v8hzeLLeHE2Pw7M6b/kLQp1
 HcMsvUHuWmnjfZ6P+wiWGfAGY83nE6kGqPuAg5B3IYnUeXzO283gl/2pdquVE9KKmTE6
 7bbduWRgWnezf9ED7AcjQvjTSMBPQdb6pb1qn4g1WcN7gtSgJQ5koFz+xf0ol+MT0+JA
 bzGg==
X-Gm-Message-State: AOJu0YyOjbNFymwrPgBn0Px3LRbR2690Dz2PvCRDQZ4puA7jC10dUz9h
 58KB3Vdr6cENk4fE/32eOqt1io11qU0lBy3T8ZOdUhwzuZpZWMN08D3aRah/MCLYJK3D+06Vxwm
 G4gG6
X-Gm-Gg: AR+sD12BnVL5XRRux5aiWf0Zf6cmGnoXNdA8JLmSV9xQGjNKNnEMtiO6YipoPyW0o/k
 GVqmvGvRxuqCvu9Iw4wdI1zi1XfwT9MPYd/IjlLNWUOA6VWritnPM8RDvlTUMnYpTFBMsWHpHcH
 4ciD+BsZADsIHoJ/qg5URVpQeIkdHaBLxD6SGRjguIeILSUjG8U29pgZnBkmcTbV5R/4rc5JS0O
 r5WFuSFftZe6T3RRSL2XF5n20oGjL3h9UBA+WF0xu8m1Cc2KDymCCZDGUy6QjhN0Qv2Q6j4KiaF
 tUpE01ByMOI/lXti+aavlkUJwPRncpkRdf8RgSg/IvgxerWU2BgNH1fzaS+J72EgED9zJYqDhaU
 CdRmQPsjeQo6NSDYtWx1U5Q3H9eUcRSMbRevXq60gOOsDzpmVRILMDFt1WeAt0FUXxttLxzVsnW
 xBvWDu1UxluWakmBWoR6t7J9vYVT38RUa7iFW/4Jec+NISOTqzVwvXfXjPFGlGsm5Z6EwlCHh7E
 epzfkMXQ8D2qr4gk+n8TpV0c1reuASiNJgPHzhqhVWxVCBQKF2mN2k+5PvItpKLBeFEyg==
X-Received: by 2002:a05:600c:4e8f:b0:499:972f:6b8b with SMTP id
 5b1f17b1804b1-499972f6d08mr122199655e9.16.1786970322362; 
 Mon, 17 Aug 2026 05:38:42 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998780397dsm120415055e9.3.2026.08.17.05.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 05:38:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/8] target/arm: Handle NSACR.NSASEDIS in CPACR accesses
Date: Mon, 17 Aug 2026 13:38:31 +0100
Message-ID: <20260817123838.1578060-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817123838.1578060-1-peter.maydell@linaro.org>
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In cpacr_read() and cpacr_write() we have code that implements the
"CPACR.{cp10,cp11} behave as RAZ/WI from NonSecure when NSACR.cp10 is
0" behaviour.  There is a similar requirement for CPACR.ASEDIS: if
NSACR.NSASEDIS is 1 then CPACR.ASEDIS behaves as RAO/WI in NS.

This doesn't matter to us yet because we don't currently implement
ASEDIS or NSASEDIS. But we're about to do that, so add the handling
to cpacr_read() and cpacr_write().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index af45234ad2..c33de9c5d4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -588,11 +588,19 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /*
      * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
      * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
+     * Similarly, if NSACR.NSASEDIS is 1 then CPACR.ASEDIS ignores writes
+     * and reads as 1.
      */
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-        !arm_is_secure(env) && !FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
-        mask = R_CPACR_CP11_MASK | R_CPACR_CP10_MASK;
-        value = (value & ~mask) | (env->cp15.cpacr_el1 & mask);
+        !arm_is_secure(env)) {
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
+            mask = R_CPACR_CP11_MASK | R_CPACR_CP10_MASK;
+            value = (value & ~mask) | (env->cp15.cpacr_el1 & mask);
+        }
+        if (FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            mask = R_CPACR_ASEDIS_MASK;
+            value = (value & ~mask) | (env->cp15.cpacr_el1 & mask);
+        }
     }
 
     env->cp15.cpacr_el1 = value;
@@ -603,12 +611,18 @@ static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     /*
      * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
      * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
+     * Similarly NSACR.NSASEDIS makes CPACR.ASEDIS read as 1.
      */
     uint64_t value = env->cp15.cpacr_el1;
 
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-        !arm_is_secure(env) && !FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
-        value = ~(R_CPACR_CP11_MASK | R_CPACR_CP10_MASK);
+        !arm_is_secure(env)) {
+        if (!FIELD_EX32(env->cp15.nsacr, NSACR, CP10)) {
+            value = ~(R_CPACR_CP11_MASK | R_CPACR_CP10_MASK);
+        }
+        if (FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            value |= R_CPACR_ASEDIS_MASK;
+        }
     }
     return value;
 }
-- 
2.43.0


