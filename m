Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp599963lfb;
        Wed, 18 Nov 2020 07:06:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGw34MbtMBcIIDuCju1zb9gvxjSteGbVkLYK8njobB+fK1+PFLycKfv1ZbfnLlYR5IQzlH
X-Received: by 2002:a25:40c5:: with SMTP id n188mr7654771yba.116.1605712008277;
        Wed, 18 Nov 2020 07:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605712008; cv=none;
        d=google.com; s=arc-20160816;
        b=Lge5eZmHZShX/umWNEGSQ7+gYwlITOK44Ez6qtOOyCzHF72nfRDxtrxjiOR8O55kqd
         pZvsBroU6MW93wb8h2vIHJVpZCDn2JX24JiR6g5uD+7wb1OVoeFQvfWsp2sTbXi+WK93
         UJulGScb0Qav1vE+cav/p2+Q8whoKK9wU/V06l4AiMHYMQTmk7nK8rGnnWpLELgWidIm
         3r6c5EuOryiTx2GdBr3a4EiIO2D6ZGwQXEqc2mhU/kbXUP7bl5vura9zgEDJIyb19Hri
         AU4R63suCmGrFUf+TkSOZlqOBN7TaRwz5Fgks+FMGLNCDmnuP58EL2jgU7CtTQNSa9Tu
         mnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=6s82WB+8tvuOYlghTqFLNpnIelzLv1lqaVsobXhv59E=;
        b=Nbiq4/HXJexR/BPFuY21lpHNGn4p/eB9RLLzT7LW81ShOTFyvOWsf+gG+04ERVD1cO
         UvFnjwTekrRCy9wngnXdHdGEIUEhnk6QGJjQA/1fn1H+uQUYQQfTgqA1gIBLy2ly3MbB
         Go51CXjKrAZQW6bSKPI3prvJtwFcCpOg/zCMTuXlaJkUZzbYcPf0a5j0k7ttnQwhE9VW
         5pXXfQJeolw4NxxNGMK2cabzWc5IB0j9d/dzZN0fUCwLfwNc97f3IgZNYcul7eb40Ia+
         Lka9j6sYod1vZIUADpweyoM8a86ybC8e4ikyRtj9qvYB04Il8E2Tt+evl1QpgzY7q8eY
         LPxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si23649341ybb.472.2020.11.18.07.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Nov 2020 07:06:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfP2l-0001Y8-Mu
	for alex.bennee@linaro.org; Wed, 18 Nov 2020 10:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kfP0g-0008AB-PA; Wed, 18 Nov 2020 10:04:38 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49734
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kfP0Q-00077n-AC; Wed, 18 Nov 2020 10:04:38 -0500
Received: from philogene.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 494025FA5F;
 Wed, 18 Nov 2020 16:04:15 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: fix stage 2 page-walks in 32-bit emulation
Date: Wed, 18 Nov 2020 17:04:14 +0200
Message-Id: <20201118150414.18360-1-remi@remlab.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 10:04:16
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WC1kBeCbHSjI

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Using a target unsigned long would limit the Input Address to a LPAE
page-walk to 32 bits on AArch32 and 64 bits on AArch64. This is okay
for stage 1 or on AArch64, but it is insufficient for stage 2 on
AArch32. In that later case, the Input Address can have up to 40 bits.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11b0803df7..38cd35c049 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -40,7 +40,7 @@
 
 #ifndef CONFIG_USER_ONLY
 
-static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
@@ -10988,7 +10988,7 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
  * @fi: set to fault info if the translation fails
  * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
-static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-- 
2.20.1

