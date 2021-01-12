Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3459448lfq;
        Tue, 12 Jan 2021 03:22:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziUhqQSfDmVIBE4VvWhJjZhFSRJpORKwn2zdo2118jO0fOj9t9Lh3Z/xIEd+7vRv2iM2DB
X-Received: by 2002:a5b:b51:: with SMTP id b17mr6008949ybr.44.1610450534893;
        Tue, 12 Jan 2021 03:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610450534; cv=none;
        d=google.com; s=arc-20160816;
        b=yi0UNuf1lU0a3ui3Y/Va7AZ3YU06tIO9WmKBXIjWHqTXeR0RtQtdL6WIqjrrH+TJ5/
         TcffTHGUVIZ6Sg+4dETBDkHuaBWCG4KtTzlxuS01xXNoB3Ln8MEQgjimQtLP7dFUArST
         sOc39fl4nhqIoqlGSRO/YPG41sGdiA5vZUiRr3ig4cRo1LYT88nOL04Vh7Ej8MRmCbPZ
         UKEuN0r7ixz9vrdnafFnaNFB7IE+Neg6ND3xS2khRC0izx5sqeS/kluv8LI2XY0Br//n
         Qmd6kDhQBiPSlWktqC3ASF7Inqb3QJMrW5CWKMD91LvrKIl9ma88dUMYZVveJcUXPQs4
         kA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=70avu3d7zQfpwa8A+UXHZMiLAWdZp4eCVUw8PZnw8HI=;
        b=LvGeJCVYwa7pU9JkcUIZsbrbmUUb8Ub41hSnAJHVHW9UC3mqvLqTNYB/yNsAGtmFf5
         uGkSOGR0aId2kWiPj9NavRGWkkLvepY2KZnL4N9pbta91fmgbk6Bs/fMc/1aOS18mF9j
         6/CPYSgce3mfyFTuG7Lx+zjmoQUb72YPzxD8FMuHcljfRBPeVrDY3/C8ak/2MpMkE78n
         tdPX99fnjQqgbza6aLxUyq5BJNULHqpL5T3twpHWg6Mh7qkJevAm8Dk5yfSI/NSHxkEV
         6rZi6XU/ejZvE5DklMLokzykhfm9K25Wgp1AvZtZUPQhTNK3Zo1h3aXSHE++LfF9SaZI
         XAMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n62si2598352ybf.174.2021.01.12.03.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHkc-0002ix-6b
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBV-0003vr-N4; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56728
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBO-0003UG-5m; Tue, 12 Jan 2021 05:45:55 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id D74C2604F8;
 Tue, 12 Jan 2021 11:45:14 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 13/19] target/arm: generalize 2-stage page-walk condition
Date: Tue, 12 Jan 2021 12:45:05 +0200
Message-Id: <20210112104511.36576-13-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MQMDl9uoNG7S

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The stage_1_mmu_idx() already effectively keeps track of which
translation regimes have two stages. Don't hard-code another test.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fe95c2965d..d889a6cd17 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12159,11 +12159,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    target_ulong *page_size,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
-    if (mmu_idx == ARMMMUIdx_E10_0 ||
-        mmu_idx == ARMMMUIdx_E10_1 ||
-        mmu_idx == ARMMMUIdx_E10_1_PAN) {
+    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+
+    if (mmu_idx != s1_mmu_idx) {
         /* Call ourselves recursively to do the stage 1 and then stage 2
-         * translations.
+         * translations if mmu_idx is a two-stage regime.
          */
         if (arm_feature(env, ARM_FEATURE_EL2)) {
             hwaddr ipa;
@@ -12171,9 +12171,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             int ret;
             ARMCacheAttrs cacheattrs2 = {};
 
-            ret = get_phys_addr(env, address, access_type,
-                                stage_1_mmu_idx(mmu_idx), &ipa, attrs,
-                                prot, page_size, fi, cacheattrs);
+            ret = get_phys_addr(env, address, access_type, s1_mmu_idx, &ipa,
+                                attrs, prot, page_size, fi, cacheattrs);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-- 
2.30.0

