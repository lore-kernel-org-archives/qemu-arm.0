Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A09FC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 22:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wf3id-0001g2-Uu; Wed, 01 Jul 2026 18:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wf3ic-0001f5-PN
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 18:47:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wf3ia-0002Zy-VR
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 18:47:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-473dc4cf238so739553f8f.3
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782946063; x=1783550863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjFztGb7C9MEWIW5wBfGcj8wgciULOA+rIFwIPLrLuI=;
 b=Sk4I5xNxk+yz8P1zxSEc9wszfMTLRdSjgqIrq8sTjqr0OsfMvZq5wAcPI64i1B0IPx
 e1iVaeZq/7MoyB+l36Xey9s1vJM5OwYAD29GXKiZH4p8qE8WIrQuJp1IKIeM4FXYNnFn
 fypyGh5+NPAXqly7Bp863J0XkZ3+eZchU+5B1QV3bxlM85X07ag04GA1CHRM+CgEdm+K
 R6SX8XRLsS+P1LQ+loS7JMerc9dLSB3j4wYuamW15ncHGNAuxOiOv/4KLSHzJRh4MS4x
 02BQc/wqVC8PCHen5CLvNwiJwF9zLbJ2Sx8fEr1KD/jm+SIPj/w+8LZye72dxDUK8EHB
 cknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782946063; x=1783550863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KjFztGb7C9MEWIW5wBfGcj8wgciULOA+rIFwIPLrLuI=;
 b=VZVuaG3peqFF0Hmwzl6uNOGST/sd89B7butwr9rPWk5ULpBJTlm/cOMJEZl0iu5fVN
 qgI3cp6oZGTpsqSs3zk4ROh78RmeoY3GjWSdTiDasl9R1qRZ/gVm074q1gsmbphW7LVm
 IQBfc97DONvR4VyQR2xkp1H8FdGLjShBEW4Dkfwb44ewwqn1e/J5onzmKy44q7bAcDEJ
 V9DAejBiq5GWMY6kkXBEtoXOBjlHFLTbqMmMfau3ecg+TfxFlC5EsXcofUv1RE2jibbR
 9M65UxTp8Wvak+shzf75+WKr4qxegP0nXBypa2I9JatmZt8NhuQHN3dQLs5MCdXFSmee
 K7Hg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqnldqYERm9He8zyTjlids/aDthnWtuoh0XKd1wAw+EQAiGX6FC2mZfbEvQVhV7LmTLPITJq+7iAg==@nongnu.org
X-Gm-Message-State: AOJu0YxLxuh9gcD/cjFX6EnORv6RLebgeJWnG9iaHTeQ7+R5gulf/z87
 xijA58be7TXMb35Y+o14M4uMa7n/cP7Mf/fYO8ali5yIK6b5BRTeG1+h
X-Gm-Gg: AfdE7ckrMipzgtUeBMQueQl4uvk1Rd7UF9709NoaeTjcJmB5tmC/YD3tKTlJJargo1T
 ubx2wmYFlx1K8FG3FHXYRlvBI6iLijawJofoOb4xvU6j82uro+gKki4Kq77TxtllsyI20k4ynUX
 fsds6U/wHTfk4riSsd+cUOOP0cZEcmLApMONCjVft+IC+7B28VrWxF3E+3GAPqV+u6KCKLS0Eya
 MQXVwBt6Ic/pP4CHglNWQdCgGPU6S0h0ipTJFJ4BUjw4zagXSzvETP7u6Es2Kpy/u1adStUb53d
 xF6f9GGvjHwy3nJMw7cifxZOa3+TF16/WH6G6wzCkIbrmwJDittjHkeqzerosaStKqoj6KOKCNj
 5YwxD8n8ozoPQyNN9o/2O1z37B6/CBZk6Th+ntlEMyP/nu3NNPppfou0d7X1jaco4VfOpdgEvzo
 kDAd00CmBpaBiAIVILJzFz/AU2CJInP8M925up2Okj+3AC1yda7nSUZJfzgtq25ABZ71VkC40Qh
 J6niXhZ4laUiCHdVBa7CIqwK5a9RJJow3Sa1IvkbNSvVcc=
X-Received: by 2002:adf:fc08:0:b0:475:cb71:a344 with SMTP id
 ffacd0b85a97d-4775a0fe280mr4531259f8f.37.1782946063237; 
 Wed, 01 Jul 2026 15:47:43 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2d44-b300-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2d44:b300:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dba0esm3178614f8f.7.2026.07.01.15.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 15:47:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 1/4] hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
Date: Thu,  2 Jul 2026 00:46:09 +0200
Message-ID: <20260701224612.48342-2-shentey@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701224612.48342-1-shentey@gmail.com>
References: <20260701224612.48342-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Subclass TYPE_CAN_FLEXCAN, yielding TYPE_CAN_FLEXCAN2 and TYPE_CAN_FLEXCAN3.
Since TYPE_CAN_FLEXCAN is now abstract, TYPE_FSL_IMX6 needs to use
TYPE_CAN_FLEXCAN2. TYPE_CAN_FLEXCAN3 will be used in TYPE_FSL_IMX8MP.

Note that Linux performs 8 byte accesses on the i.MX8M Plus, therefore
.max_access_size has to be adjusted. Otherwise this results in bus errors.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/net/flexcan.h |  4 ++-
 hw/arm/fsl-imx6.c        |  2 +-
 hw/net/can/flexcan.c     | 61 +++++++++++++++++++++++++++++++---------
 3 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/include/hw/net/flexcan.h b/include/hw/net/flexcan.h
index 153afc1e03..32de7b904a 100644
--- a/include/hw/net/flexcan.h
+++ b/include/hw/net/flexcan.h
@@ -139,7 +139,9 @@ typedef struct FlexcanState {
 } FlexcanState;
 
 #define TYPE_CAN_FLEXCAN "flexcan"
-
 OBJECT_DECLARE_SIMPLE_TYPE(FlexcanState, CAN_FLEXCAN);
 
+#define TYPE_CAN_FLEXCAN2 "flexcan2"
+#define TYPE_CAN_FLEXCAN3 "flexcan3"
+
 #endif
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index bf106a9063..57cdde971c 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -92,7 +92,7 @@ static void fsl_imx6_init(Object *obj)
     }
     for (i = 0; i < FSL_IMX6_NUM_CANS; i++) {
         snprintf(name, NAME_SIZE, "flexcan%d", i + 1);
-        object_initialize_child(obj, name, &s->flexcan[i], TYPE_CAN_FLEXCAN);
+        object_initialize_child(obj, name, &s->flexcan[i], TYPE_CAN_FLEXCAN2);
     }
     for (i = 0; i < FSL_IMX6_NUM_WDTS; i++) {
         snprintf(name, NAME_SIZE, "wdt%d", i);
diff --git a/hw/net/can/flexcan.c b/hw/net/can/flexcan.c
index 1ea459d9f6..d6a76c28ab 100644
--- a/hw/net/can/flexcan.c
+++ b/hw/net/can/flexcan.c
@@ -1298,7 +1298,7 @@ static const struct MemoryRegionOps flexcan_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 4,
+        .max_access_size = 8,
         .unaligned = true,
         .accepts = flexcan_mem_accepts
     },
@@ -1324,16 +1324,26 @@ static int flexcan_connect_to_bus(FlexcanState *s, CanBusState *bus)
     return 0;
 }
 
-static void flexcan_init(Object *obj)
+static void flexcan2_init(Object *obj)
 {
     FlexcanState *s = CAN_FLEXCAN(obj);
 
     memory_region_init_io(
-        &s->iomem, obj, &flexcan_ops, s, TYPE_CAN_FLEXCAN,
+        &s->iomem, obj, &flexcan_ops, s, TYPE_CAN_FLEXCAN2,
         offsetof(FlexcanRegs, _reserved6)
     );
 }
 
+static void flexcan3_init(Object *obj)
+{
+    FlexcanState *s = CAN_FLEXCAN(obj);
+
+    memory_region_init_io(
+        &s->iomem, obj, &flexcan_ops, s, TYPE_CAN_FLEXCAN3,
+        sizeof(FlexcanRegs)
+    );
+}
+
 static void flexcan_realize(DeviceState *dev, Error **errp)
 {
     FlexcanState *s = CAN_FLEXCAN(dev);
@@ -1378,19 +1388,42 @@ static void flexcan_class_init(ObjectClass *klass, const void *data)
     dc->realize = flexcan_realize;
     device_class_set_props(dc, flexcan_properties);
     dc->vmsd = &vmstate_can;
-    dc->desc = "i.MX FLEXCAN Controller";
 }
 
-static const TypeInfo flexcan_info = {
-    .name          = TYPE_CAN_FLEXCAN,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(FlexcanState),
-    .class_init    = flexcan_class_init,
-    .instance_init = flexcan_init,
-};
+static void flexcan2_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
-static void can_register_types(void)
+    dc->desc = "i.MX FlexCAN 2 Controller";
+}
+
+static void flexcan3_class_init(ObjectClass *klass, const void *data)
 {
-    type_register_static(&flexcan_info);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "i.MX FlexCAN 3 Controller";
 }
-type_init(can_register_types)
+
+static const TypeInfo flexcan_types[] = {
+    {
+        .name          = TYPE_CAN_FLEXCAN,
+        .parent        = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(FlexcanState),
+        .class_init    = flexcan_class_init,
+        .abstract      = true,
+    },
+    {
+        .name          = TYPE_CAN_FLEXCAN2,
+        .parent        = TYPE_CAN_FLEXCAN,
+        .class_init    = flexcan2_class_init,
+        .instance_init = flexcan2_init,
+    },
+    {
+        .name          = TYPE_CAN_FLEXCAN3,
+        .parent        = TYPE_CAN_FLEXCAN,
+        .class_init    = flexcan3_class_init,
+        .instance_init = flexcan3_init,
+    },
+};
+
+DEFINE_TYPES(flexcan_types)
-- 
2.54.0


