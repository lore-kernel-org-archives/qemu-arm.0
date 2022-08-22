Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1003570ejc;
        Mon, 22 Aug 2022 09:13:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7PkIcG51edZe5ii35Hq6R2V/N/s3ODIqGZWZEqTGBDIkIlX8/hSYd0N+QBR23NuTc2+7YZ
X-Received: by 2002:a05:620a:1986:b0:6b8:6cef:6cc with SMTP id bm6-20020a05620a198600b006b86cef06ccmr13455411qkb.482.1661184808825;
        Mon, 22 Aug 2022 09:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661184808; cv=none;
        d=google.com; s=arc-20160816;
        b=vldGCGgykrMiH+thg6+GVpUgMFSaY6+FzJvXK7l1u9hHSjHYZv5jVqfUnN869sykNt
         W+pB5jOGK5YhVRIjGHwTbHMpd8yrtR8nYg4V8KiH0jecl82o4lc4npZvlmLwMhrmdlA7
         ao38Kns7iOSxpV7ACwUNwsZcZRTFBVy6szy9641rtfiudhloOiuVeGWuVxQlSQe3Wff8
         Bu3f7Fj9m3Mh4QnNPCUgE5NH39OMmIKdO82Uym+Mg2P9cUUsFzBF8d4kZEN41iQSLHce
         m0HhXmqox+Anvzb0nJJplPqYAw5yKeIj5b5xrreNHthout3QYLVPf/A8+Ur9ntzHQXTS
         ikoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PKVm0lHT4WCbN6cjWU3f5Rl68TusjrY3hk9BnIKlewk=;
        b=Mti30jnpkt1dWaDXad4r1Kf7mIHZymBUufHG8CLS/UpSbePUU3mqTBWJ22QhXhW/Vg
         OdfAEkQeXGxNLLxkjlOfepqDXUWoLwKs2Au9EJkteQFqmAY3cZS1Gop17aEm/yQ/mXWf
         yD/nKWJBcxCGfmMvh3xE/CZK51/TT8IOUmPN7RPAH+SpolJtWvjzc7m6gswJNPvXkU9+
         6q6BHLyWVjTJXy/gDXG11Hk/Ve4TjKvOrxTWApKNR/Y2ZwP1F00jpku6RwYfJTY+UeH2
         KPaG8X3KT6LUqY10OKLc5x9Z2OuX7FsmP/RH/1VT3HHPn4nl6P15bi2hFjRiAcupcpO2
         OS4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kS1sHI1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj13-20020a05620a190d00b006b977be370dsi4929777qkb.694.2022.08.22.09.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kS1sHI1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQA3M-0000Du-AT
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Li-0008RM-Kv
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:22 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LR-0000fu-09
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso11651395pjj.4
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PKVm0lHT4WCbN6cjWU3f5Rl68TusjrY3hk9BnIKlewk=;
 b=kS1sHI1jh2LEgjdd1mGf8UbiFwKTmdlKzL4dKbF+ka0oCTo/hoSpNOM0MQCzOAbYLi
 09QYUEDVR9inf7d3dmv6yLXBwXPFr5OTzSiPdPc/I3PnUG4QxY67NWDtVp6tBJrr5aIJ
 DbGKfEoYlZ9lSCRos81r0gbBg9ym4nr+RmNBasI2jZMzpBcRddx07mHHmj7N52jAP4AU
 lZB0uTTNkWZgeUsgea9lV6fcgALwIhZmrUj7W37SmTqVq2qBB2KXrtDboOZgmIzr4br4
 H0hdvR6UnlCAEmLijPQQ+L6z7bK/aEvwnwGh6UbC15JVv78FL0FcKQRN+mx7v9o2JGfm
 jKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PKVm0lHT4WCbN6cjWU3f5Rl68TusjrY3hk9BnIKlewk=;
 b=zhq7PeggUb4nMzP9PapDql3k7pvyMKa8wYxvY59tHbwNvr94kuuhtd5sDyLBJgAzC0
 Dcu3MJcq02zIy4rrIS/SayoEZR4ZKG4J3g0srX9tJUcp+gxHt9DHPijHx3c6AxJfDHu2
 u9Yi6B+OsGxQjeGelLPaDqCsRwcgsH3aBIRWgGb/ltFfrV5L5dRaw6PEJvSkNJMHkj3G
 mnI4LJJXabvTV7iGoyhWqQql2BO7xETAw9FM6o76DLkO4a5UbK15s9UPkRhW8/Lordt4
 CPI2KaDvGoK2yB6p8nRQ80/Tz1D3xcS3bTZnjeDmsaYW81h8FyKXBc7tXAeDn6EObd/O
 PQAg==
X-Gm-Message-State: ACgBeo1wIqfkShwxkSwmlNHljFRbFRA87tGbOU3PNDl0Z5ZeFT64Prag
 kskHji7n3e0LBHJWJ9IAXn+gVA==
X-Received: by 2002:a17:90b:1c90:b0:1f8:42dd:9eba with SMTP id
 oo16-20020a17090b1c9000b001f842dd9ebamr30141374pjb.160.1661182084283; 
 Mon, 22 Aug 2022 08:28:04 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 27/66] target/arm: Reorg regime_translation_disabled
Date: Mon, 22 Aug 2022 08:27:02 -0700
Message-Id: <20220822152741.1617527-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: awqp8+RsQ4SW

Use a switch on mmu_idx for the a-profile indexes, instead of
three different if's vs regime_el and arm_mmu_idx_is_stage1_of_2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2c13586396..ae9552f46f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -148,21 +148,39 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
     hcr_el2 = arm_hcr_el2_eff(env);
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
         /* HCR.DC means HCR.VM behaves as 1 */
         return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
-    }
 
-    if (hcr_el2 & HCR_TGE) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && regime_el(env, mmu_idx) == 1) {
+        if (!is_secure && (hcr_el2 & HCR_TGE)) {
             return true;
         }
-    }
+        break;
 
-    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
-        return true;
+        if (hcr_el2 & HCR_DC) {
+            return true;
+        }
+        break;
+
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E3:
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
-- 
2.34.1

