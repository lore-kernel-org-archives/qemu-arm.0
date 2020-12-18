Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2168521lfq;
        Fri, 18 Dec 2020 02:49:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA0dEKyhwdka7iq5FRorqUoppm9ly0yyZw+TkQMv+OK+qD9LaBW5go8OPe+4Sb2+NbLf8I
X-Received: by 2002:a25:abd0:: with SMTP id v74mr5298810ybi.193.1608288546458;
        Fri, 18 Dec 2020 02:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288546; cv=none;
        d=google.com; s=arc-20160816;
        b=DzJrEU10l7zpoiAUxt3y6oclbKPFarwkTwJQBvztR7i3PgA3InxYAZDQNy3YSNJfRf
         D9F0DQje8uqWyUTNAKQtacX7BTLIsXTb/FQE960dFj0R0S3B7WaBCD7x0xAtKMo2HIaS
         7DlzG7YllqC6dBXBxv2NWe0qFLQ9M/tfAMAXj9hm7MLIxLKmE5qjJBuCXFBpNs9/Y+4j
         xOJMBfjYviz9Xp6rQvew3vW50KRiRgXCAOEKRefAgcRYZpqQRRQQ4g3VLD4o2O4ISHs4
         hPVGjoGPcyaHiZC2kLlifbms/dFLY5PYtI78KRFTAKMcUJvpF4nBqLLwkZF//Gx5av9d
         F9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YyRijmSSCsMZUTv/3DBTcVQF2P2ZxWCBO+25pflt5ZE=;
        b=0k4JBy/sCFzLKFRXqHf6ISaK/tM5COwY+5hZMB8XLiSuKcKFSp4bME/O9B9DttSe+6
         cTjlPraMpTSvtzH0sgdZATr7wTvIMaH/1BWlpjYe5i/l8E8X7VFI336ctmIQ0ms6FVAr
         QGUVnlKQjcDjClPcUNSrEKL8vjiihTYOPH9VAKFpxe1Mkv3jW6fKZYRMPsodOEXyc5ts
         ryqu0PLOyH293uU7AXS+KalhA8AyHF1hpc6gIq2yebvrx3/85PpU00VvNjQoIczpcqWJ
         P55nDVOOPHxuvQcLN5rQSYBblTQp1rc9RIVqMYzXfa8u7jvFbUrJsFP0hPI3lq8Kc9TU
         YAbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si8504285ybc.94.2020.12.18.02.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDJp-0002Oe-OY
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9Y-00071Q-50; Fri, 18 Dec 2020 05:38:28 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55300
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9W-0003L8-Is; Fri, 18 Dec 2020 05:38:27 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 28670606AE;
 Fri, 18 Dec 2020 11:38:03 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 13/18] target/arm: generalize 2-stage page-walk condition
Date: Fri, 18 Dec 2020 12:37:54 +0200
Message-Id: <20201218103759.19929-13-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
X-TUID: wlljatBtDmOZ

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The stage_1_mmu_idx() already effectively keeps track of which
translation regimes have two stages. Don't hard-code another test.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff69b46d43..6d60fa23c9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12152,11 +12152,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
@@ -12164,9 +12164,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
2.29.2

