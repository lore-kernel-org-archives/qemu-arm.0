Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D22CCF2C9
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 13:40:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIR3v-0002ZF-BQ; Sun, 18 Oct 2026 09:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3p-0002RR-Em
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:25 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3l-0002JR-JC
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:25 -0400
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-93a40a9a01aso325877485a.0
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792330580; x=1792935380; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=loq/9z2qITmRvVK4fBqH6nfcxD/uwFc4DDxvLDl7qWg=;
 b=RtQgSQZOKy1dgoiom+MeUSyAPBNSFgCVBlpcEq4DT3ry+Ib49mUyhY5NRSP2Gj8Fr+
 ccr/H8ufSL1cgNcnqSXOZCcOk9tZz9DM5WAeh16UTIl3BXA18jN4irfVNhA/QtDElNol
 7TWBaHKeYNNRTT+GR0bkaLmhKoHM6Z+2ekuDJFg7BrN317kfSX42zVCG0WhbdNNMOUla
 nnSYkADcti/i2rHAvDuDs884Fclsf1QNnZpmpVUtbRbUmofAuMmtz8rQz2TBRyIbu0zY
 cHXncZ9RHo7Ro1vix8kzTgfoBspopAiW3ugFH4FS55QQ52eYHlH0AstJLHBk7RAZ7fP0
 WdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792330580; x=1792935380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=loq/9z2qITmRvVK4fBqH6nfcxD/uwFc4DDxvLDl7qWg=;
 b=032cA60p08kIf3uDmalrD6XzVLv/uqNQTlzgXG1s0iW+3qFiSWjWE3BtL6Cic/8KZT
 2EyDP3nqeO5wbA/npXjJ0hQ3WCdrmNwFKX9gr5LU0AIwmO6QoPEqQIps7IaeuUD8syJ6
 tM1h1HWIcjH/2jCndLY7z4awALeEJ5OlId8/EOByBwbSm8gpaBrxqxiiG8I4VvCGmCfj
 MN1838mR9qv+UYJwF+bxJbx8wOgP9s9UQoTLrHA/MwCz5HoCPDZ4ZGcy8+TAx3qmLcSw
 1XRME1veKApxzZCMSi0DNzkPEEfHMY2lH976Fhi3KyfaKtIFZ484GeVnSZLp0UZ9a5k3
 yrjw==
X-Forwarded-Encrypted: i=1;
 AKwUvByQ9Sbcm/4h4HhDoTSk7uQVHS/5D0ELhOxXBvajrV2cMDNSqRxhv1qfXuf8N0GqfiitL7PUUgYw1g==@nongnu.org
X-Gm-Message-State: AFq9FYJnJzdb5I2/j2ONTZN2Fhqg8cbN+hDqMpnUpvmWXLOrlGrZEkwU
 trNbMmyAPYSDQd74+fxV0sxmp5ZLP0bSSDG4iJ4IfBfowlng3yU+vSSIejDyq3Ym
X-Gm-Gg: AYBFou3c+HQTkktrXjBBlxaaBEECllxgiR44Nb7MrWDsKvcJJqR4OXxdgD+g4hoZo6E
 SCHncnnmTLDOpbDxCI7FlwLi9aDFcTLPRF01U33ZMYkTAKus4lahzALTHNhvGpmYu4bSJeDbORa
 H/Alk4WcmHb5nCkgNpIk3TuQMpJiVk4kZ89kO6IYZFmS8B3tswj/tqT+qY8X/vL50W95VeLl5uk
 JuqpnDt16hICnLrG6EjsDbWYd5K8TSOl5i7E0Ws2yk5lqYxFJ0evDfhNEWW/dJ89dXv5eno0CtV
 Kyrj/IKal2EaEzVqs61mMZzjR2xSLkwhQRms9h95f5MyCeMkVjB5JgmpNDcSN0bf+PzFksws7Ve
 mopGF6uPssoyYTC/FNtdx+nsCWq/U2jUrN9QGMTS0ybDd3E7bktbNo6oaKNmLkbMNC51KS4pIx7
 UuORoTG8coo6bL7NeYTmMXuHx3vi2HT/IJrswoXzBgjFiuVrMAbgcmjzjjpNRwUTosFwqZ7e8L8
 WqMQannGYS43IF/fpdazGJrOu5PRTBTjin1dHNRHdFumRHaTRWg9meDJYuLffgP0WTjNaw=
X-Received: by 2002:a05:620a:3196:b0:93e:5534:e63 with SMTP id
 af79cd13be357-93f29c8858fmr821602985a.13.1792330580080; 
 Sun, 18 Oct 2026 06:36:20 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:ecfc:9d0d:b95b:11bf])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f2a854bb7sm459056485a.23.2026.10.18.06.36.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Oct 2026 06:36:19 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v4 14/17] hw/net/bcm2838_genet: add migration state
Date: Sun, 18 Oct 2026 09:36:00 -0400
Message-ID: <20261018133603.64323-15-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018133603.64323-1-marcelomanzo@gmail.com>
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The device had no VMStateDescription, so none of its register or PHY
state was saved or migrated. Describe the MAC register block and the
PHY, shadow and expansion registers, and re-evaluate the interrupt
outputs after load, since they are derived from the registers.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/net/bcm2838_genet.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index e20358c8e7..643ee3ec0b 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -17,6 +17,7 @@
 #include "system/dma.h"
 #include "hw/core/registerfields.h"
 #include "hw/core/resettable.h"
+#include "migration/vmstate.h"
 #include "hw/net/bcm2838_genet.h"
 #include "trace.h"
 
@@ -1129,6 +1130,37 @@ static const Property genet_properties[] = {
     DEFINE_NIC_PROPERTIES(BCM2838GenetState, nic_conf),
 };
 
+static int bcm2838_genet_post_load(void *opaque, int version_id)
+{
+    BCM2838GenetState *s = opaque;
+
+    /* The interrupt outputs are derived from the register state */
+    bcm2838_genet_set_irq_default(s);
+    bcm2838_genet_set_irq_prio(s);
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_bcm2838_genet = {
+    .name = "bcm2838-genet",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = bcm2838_genet_post_load,
+    .fields = (const VMStateField[]) {
+        VMSTATE_BUFFER_UNSAFE(regs, BCM2838GenetState, 0,
+                              sizeof(BCM2838GenetRegs)),
+        VMSTATE_BUFFER_UNSAFE(phy_regs, BCM2838GenetState, 0,
+                              sizeof(BCM2838GenetPhyRegs)),
+        VMSTATE_BUFFER_UNSAFE(phy_shd_regs, BCM2838GenetState, 0,
+                              sizeof(BCM2838GenetPhyShdRegs)),
+        VMSTATE_BUFFER_UNSAFE(phy_aux_ctl_shd_regs, BCM2838GenetState, 0,
+                              sizeof(BCM2838GenetPhyAuxShdRegs)),
+        VMSTATE_BUFFER_UNSAFE(phy_exp_shd_regs, BCM2838GenetState, 0,
+                              sizeof(BCM2838GenetPhyExpShdRegs)),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void bcm2838_genet_class_init(ObjectClass *class, const void *data)
 {
     static ResettablePhases unused_parent_phases;
@@ -1136,6 +1168,7 @@ static void bcm2838_genet_class_init(ObjectClass *class, const void *data)
     ResettableClass *rc = RESETTABLE_CLASS(class);
 
     dc->realize = bcm2838_genet_realize;
+    dc->vmsd = &vmstate_bcm2838_genet;
     resettable_class_set_parent_phases(rc, NULL, bcm2838_genet_reset, NULL,
                                        &unused_parent_phases);
     device_class_set_props(dc, genet_properties);
-- 
2.55.0


