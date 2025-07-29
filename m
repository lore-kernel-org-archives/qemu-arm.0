Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77165C87FC9
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Jul 2025 16:39:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugnLI-00082k-Ao; Tue, 29 Jul 2025 12:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ugn1K-0003Hu-27
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 12:17:53 -0400
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ugn1H-0001Hq-32
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 12:17:41 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1753805846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOAFvXjrHEu0P9+9MA6Q6NIwE4ue9YOFl/xjbvqzEoc=;
 b=h0HOO4mJ0WE/HSkvK2U9EmqUnUA3bJhQEu0i9LiARUd0ikJEdePHCBFzlSHLSmVpdHgkQ+
 2+UIdm5fBjY+wcUAz+Ntkg87A9SO2EwLA34YyPTHINp1rVV13x6Rw4fAVfmxbSyMJ6+CBG
 yfmCRw9okw81XBVcco38D+6LmyudxDM=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH 2/2] hw/intc/arm_gicv3_kvm: Write all 1's to clear
 enable/active
Date: Wed, 30 Jul 2025 00:16:50 +0800
Message-Id: <20250729161650.43758-3-zenghui.yu@linux.dev>
In-Reply-To: <20250729161650.43758-1-zenghui.yu@linux.dev>
References: <20250729161650.43758-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b1;
 envelope-from=zenghui.yu@linux.dev; helo=out-177.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Writing 0 to GICD_IC{ENABLE,ACTIVE}R architecturally has no effect on
interrupt status (all writes are simply ignored by KVM) and doesn't comply
with the intention of "first write to the clear-reg to clear all bits".

Write all 1's to actually clear the enable/active status.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 hw/intc/arm_gicv3_kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index f798a6e28c..6166283cd1 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -295,7 +295,7 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
          * the 1 bits.
          */
         if (clroffset != 0) {
-            reg = 0;
+            reg = ~0;
             kvm_gicd_access(s, clroffset, &reg, true);
             clroffset += 4;
         }
-- 
2.34.1


