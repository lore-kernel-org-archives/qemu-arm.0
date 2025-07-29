Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E373FC87FC9
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Jul 2025 16:40:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugnNC-00037J-6V; Tue, 29 Jul 2025 12:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ugn1K-0003Hy-2C
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 12:17:53 -0400
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ugn14-0001HA-Pa
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 12:17:40 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1753805841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2ZO+yRcPzN1e4ri+7Jvh6MuhG7j6tOGfAAa9Axt08Q=;
 b=AxYF/EJZj1Y+KX0IXgVhyjWAQ5ltobnEzoo77lxKg+aZPMgED4IR/WF+8D2lSi0RIdzbQx
 Z7Ptm1p5783RlKplUIPs8s0BksSsb6WvUIO0KBkuIA1vgcN/cuYLXMD8+AeBCyAaH1FsYn
 Uei0pIFdFtsyklBPhCoJuINqAp8+nvk=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH 1/2] hw/intc/arm_gicv3_kvm: Remove writes to ICPENDR registers
Date: Wed, 30 Jul 2025 00:16:49 +0800
Message-Id: <20250729161650.43758-2-zenghui.yu@linux.dev>
In-Reply-To: <20250729161650.43758-1-zenghui.yu@linux.dev>
References: <20250729161650.43758-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b2;
 envelope-from=zenghui.yu@linux.dev; helo=out-178.mta1.migadu.com
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

As per the arm-vgic-v3 kernel doc [1]:

    Accesses to GICD_ICPENDR register region and GICR_ICPENDR0 registers
    have RAZ/WI semantics, meaning that reads always return 0 and writes
    are always ignored.

Remove the useless writes to ICPENDR registers in kvm_arm_gicv3_put().

[1] https://docs.kernel.org/virt/kvm/devices/arm-vgic-v3.html

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 hw/intc/arm_gicv3_kvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 8ed88e7429..f798a6e28c 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -387,8 +387,6 @@ static void kvm_arm_gicv3_put(GICv3State *s)
         reg = c->level;
         kvm_gic_line_level_access(s, 0, ncpu, &reg, true);
 
-        reg = ~0;
-        kvm_gicr_access(s, GICR_ICPENDR0, ncpu, &reg, true);
         reg = c->gicr_ipendr0;
         kvm_gicr_access(s, GICR_ISPENDR0, ncpu, &reg, true);
 
@@ -445,7 +443,7 @@ static void kvm_arm_gicv3_put(GICv3State *s)
     kvm_gic_put_line_level_bmp(s, s->level);
 
     /* s->pending bitmap -> GICD_ISPENDRn */
-    kvm_dist_putbmp(s, GICD_ISPENDR, GICD_ICPENDR, s->pending);
+    kvm_dist_putbmp(s, GICD_ISPENDR, 0, s->pending);
 
     /* s->active bitmap -> GICD_ISACTIVERn */
     kvm_dist_putbmp(s, GICD_ISACTIVER, GICD_ICACTIVER, s->active);
-- 
2.34.1


