Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B531FC88E7D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6VbK-0007mp-GM; Tue, 15 Sep 2026 12:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbI-0007kt-9R
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:40 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbF-0003SM-7G
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:39 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6a9ac6aa620so1322029a12.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789488095; x=1790092895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1UWLhGiru03iCBAYq6e7CUFMG/HcvDmu3qHp9LhwQeI=;
 b=L9pOh0L7xc7xO+qxyWFZrv7jFneDbp6dUgkhJIJmJ+ccviLNseU/6VJZ/4yJK0HpnF
 4CsOjnDaKIqUZS3a/lJSeHD3jTDP5fd4UBptWRAv4NR2aGDE4KSXJDxkn0k+vtSm7Qyy
 sqluer3hm+LoqvC5FLvmx27IE7d6VSDr8FyvXTswh2rR7E+Lu5g4TYATE6YNFym+0y32
 Y5Yx9TlEeByd5ZhpIiEU7VQfZYQ0eW3cCN1X3btfxxhkKuZRCYWPo/Dl76n19Zub1YZB
 ffY7IDpA96cF7jq2FFP8N0ayU2qNCkM+AuHVvUD0zGa5L3nF4+rSZbmJBEhV8RxuPYaH
 Yiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789488095; x=1790092895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1UWLhGiru03iCBAYq6e7CUFMG/HcvDmu3qHp9LhwQeI=;
 b=D4OqWw7+J9WiuBvqQzg4MyR3/mc5/vn54+tuHsHhVw/IdwUt1utmCiGJvxaMgJGALy
 u8Ftg3c58jJjmdK2ko3O1wUbN5vKeAXvBdxPKpVfMBr1AxwivJ/vGVGdUm1r9cCogkoR
 ZUEEp43Vd0+kcxi4oDc459DqDQg1ImqHuwNmZHaxgUVAUwMarWuCkY19UXT3LSl3f/PH
 u92VI7UbJscgzTa9LufACI/DjUWLHic93J1EgsX84MfYJf5Y0qQ2n9/BvXA69XQuSgwN
 dNvk+rutuHk+VZzXsE8e8TRTtEibI2cMsWLZunzBdkrI7av3A4AF0b3qXYMpyYPMlN6H
 hjMg==
X-Gm-Message-State: AFuF++m4K1Z+NMKE2l75z1H+JhZQUOvm1jdO7AvFUJMrcWjHBnYEEVJB
 J1691nfvGRu+tTu1Z3G4wUrCyjSR29gAJWuozQcs8CO4eRcGBLNZooxe
X-Gm-Gg: AYBFou1tT1PulfX1tmNUisAj3gufXAuzggmF+Igfp8C5nKC2OcD05Fy4JaSg8MAqkk7
 zbQoxfyZRtJLpTP8ufPVr/dLXTD6uMYKloCruOvKp/twOhxnXU6oqOST9yi80QgdGtt/756zMYu
 CwMI+j0gTM6yvuPUTd9h+c/2VN5d/8qpaKg7ZyqaqDf0HqMhnWRKOwx6uJpoupXmsxFQbFNe8kD
 KJaF74pwf8JogIFmmGlfazBCcl5ClDQ5EpyvzBv87cluiWXNMOG0tmHhXLKh0RP3vLmxqMC9oBj
 /pCyhN+0SkQ5cu8jIoMV1z2py9XKRvrgtGeMvlII/hqjfLN88L1PDy73c1T2Ki/LV4ObYxK2OXM
 Uoq0gdD8GkySR+zcINih9OZCgxZTBUyX0IzER9mDJl/Oc6GLW3AWq9n3x8vBw2VTmNFyP6RHlZ2
 Kqvqo47KFLgqvHAks9wme2NaAcb8bVrJFzA1uuQ2kVACt/uexnNXYKkONXR+eUophtLGgJDZcuJ
 yRLts4IhDp1EzvqNoJ31xRVI70kh3DGD/lyemuOtQTtFw==
X-Received: by 2002:a17:907:da3:b0:c25:f7dc:2d9 with SMTP id
 a640c23a62f3a-c29c8bdb1ecmr343882866b.26.1789488094518; 
 Tue, 15 Sep 2026 09:01:34 -0700 (PDT)
Received: from thinkpad-t470s.. (83-131-196-251.adsl.net.t-com.hr.
 [83.131.196.251]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-c29ddd86344sm3235866b.0.2026.09.15.09.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 09:01:34 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com,
 edgar.iglesias@gmail.com, berrange@redhat.com, eugene@nuvacore.ai,
 Ruslan_Ruslichenko@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 13/20] hw/core: Add Remote Port ATS device skeleton
Date: Tue, 15 Sep 2026 18:00:37 +0200
Message-ID: <20260915160044.345788-14-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160044.345788-1-ruslichenko.r@gmail.com>
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ed1-x535.google.com
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Inroduce the remote-port-ats device and remote-port-ats-cache
interface.

This patch provides the QOM definition and basic initialization
logic required for Address Translation Services in Remote Port
system.

Preserved existing MIT license for remote-port-ats(.c,.h).

Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port-ats.c         | 209 ++++++++++++++++++++++++++++++
 include/hw/core/remote-port-ats.h |  76 +++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 hw/core/remote-port-ats.c
 create mode 100644 include/hw/core/remote-port-ats.h

diff --git a/hw/core/remote-port-ats.c b/hw/core/remote-port-ats.c
new file mode 100644
index 0000000000..793f9fc52d
--- /dev/null
+++ b/hw/core/remote-port-ats.c
@@ -0,0 +1,209 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * QEMU remote port ATS
+ *
+ * Copyright (c) 2021 Xilinx Inc
+ * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "system/system.h"
+#include "system/dma.h"
+#include "qemu/log.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/error.h"
+#include "hw/core/sysbus.h"
+#include "migration/vmstate.h"
+#include "hw/core/qdev-properties.h"
+#include "trace.h"
+
+#include "hw/core/remote-port-proto.h"
+#include "hw/core/remote-port-ats.h"
+
+typedef struct ATSIOMMUNotifier {
+    IOMMUNotifier n;
+    MemoryRegion *mr;
+    RemotePortATS *rp_ats;
+    int iommu_idx;
+} ATSIOMMUNotifier;
+
+IOMMUTLBEntry *rp_ats_cache_lookup_translation(RemotePortATSCache *cache,
+                                               hwaddr translated_addr,
+                                               hwaddr len)
+{
+    RemotePortATSCacheClass *c = REMOTE_PORT_ATS_CACHE_GET_CLASS(cache);
+
+    return c->lookup_translation(cache, translated_addr, len);
+}
+
+static IOMMUTLBEntry *rp_ats_lookup_translation(RemotePortATSCache *cache,
+                                                hwaddr translated_addr,
+                                                hwaddr len)
+{
+    /* TBD */
+    return NULL;
+}
+
+static bool ats_translate_address(RemotePortATS *s, struct rp_pkt *pkt,
+                                  hwaddr *phys_addr, hwaddr *phys_len)
+{
+    /* TBD */
+    return true;
+}
+
+static void rp_ats_req(RemotePortDevice *dev, struct rp_pkt *pkt)
+{
+    RemotePortATS *s = REMOTE_PORT_ATS(dev);
+    size_t pktlen = sizeof(struct rp_pkt_ats);
+    hwaddr phys_addr = 0;
+    hwaddr phys_len = (hwaddr)(-1);
+    uint64_t result;
+    size_t enclen;
+    int64_t delay;
+    int64_t clk;
+
+    assert(!(pkt->hdr.flags & RP_PKT_FLAGS_response));
+
+    rp_dpkt_alloc(&s->rsp, pktlen);
+
+    result = ats_translate_address(s, pkt, &phys_addr, &phys_len) ?
+        RP_ATS_RESULT_ok : RP_ATS_RESULT_error;
+
+    /*
+     * delay here could be set to the annotated cost of doing issuing
+     * these accesses. QEMU doesn't support this kind of annotations
+     * at the moment. So we just clear the delay.
+     */
+    delay = 0;
+    clk = pkt->ats.timestamp + delay;
+
+    enclen = rp_encode_ats_req(pkt->hdr.id, pkt->hdr.dev,
+                             &s->rsp.pkt->ats,
+                             clk,
+                             pkt->ats.attributes,
+                             phys_addr,
+                             phys_len,
+                             result,
+                             pkt->hdr.flags | RP_PKT_FLAGS_response);
+    assert(enclen == pktlen);
+
+    rp_write(s->rp, (void *)s->rsp.pkt, enclen);
+}
+
+static void rp_ats_realize(DeviceState *dev, Error **errp)
+{
+    RemotePortATS *s = REMOTE_PORT_ATS(dev);
+    RemotePortDevice *rpd = REMOTE_PORT_DEVICE(dev);
+
+    rp_register_dev(s->rp, rpd, s->rp_dev);
+
+    s->peer = rp_get_peer(s->rp);
+    address_space_init(&s->as, s->mr ? s->mr : get_system_memory(), "ats-as");
+
+    s->iommu_notifiers = g_array_new(false, true, sizeof(ATSIOMMUNotifier *));
+    s->cache = g_array_new(false, true, sizeof(IOMMUTLBEntry *));
+}
+
+static void rp_prop_allow_set_link(const Object *obj, const char *name,
+                                   Object *val, Error **errp)
+{
+}
+
+static void rp_ats_init(Object *obj)
+{
+    RemotePortATS *s = REMOTE_PORT_ATS(obj);
+
+    object_property_add_link(obj, "rp-adaptor0", "remote-port",
+                             (Object **)&s->rp,
+                             rp_prop_allow_set_link,
+                             OBJ_PROP_LINK_STRONG);
+    object_property_add_link(obj, "mr", TYPE_MEMORY_REGION,
+                             (Object **)&s->mr,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG);
+}
+
+static void rp_ats_unrealize(DeviceState *dev)
+{
+    RemotePortATS *s = REMOTE_PORT_ATS(dev);
+    ATSIOMMUNotifier *notifier;
+    int i;
+
+    for (i = 0; i < s->iommu_notifiers->len; i++) {
+        notifier = g_array_index(s->iommu_notifiers, ATSIOMMUNotifier *, i);
+        memory_region_unregister_iommu_notifier(notifier->mr, &notifier->n);
+        g_free(notifier);
+    }
+    g_array_free(s->iommu_notifiers, true);
+
+    address_space_destroy(&s->as);
+
+    for (i = 0; i < s->cache->len; i++) {
+        IOMMUTLBEntry *tmp = g_array_index(s->cache, IOMMUTLBEntry *, i);
+        g_free(tmp);
+    }
+    g_array_free(s->cache, true);
+}
+
+static Property rp_properties[] = {
+    DEFINE_PROP_UINT32("rp-chan0", RemotePortATS, rp_dev, 0),
+};
+
+static void rp_ats_class_init(ObjectClass *oc, const void *data)
+{
+    RemotePortDeviceClass *rpdc = REMOTE_PORT_DEVICE_CLASS(oc);
+    RemotePortATSCacheClass *atscc = REMOTE_PORT_ATS_CACHE_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    device_class_set_props_n(dc, rp_properties, ARRAY_SIZE(rp_properties));
+
+    rpdc->ops[RP_CMD_ats_req] = rp_ats_req;
+    dc->realize = rp_ats_realize;
+    dc->unrealize = rp_ats_unrealize;
+    atscc->lookup_translation = rp_ats_lookup_translation;
+}
+
+static const TypeInfo rp_ats_info = {
+    .name          = TYPE_REMOTE_PORT_ATS,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(RemotePortATS),
+    .instance_init = rp_ats_init,
+    .class_init    = rp_ats_class_init,
+    .interfaces    = (InterfaceInfo[]) {
+        { TYPE_REMOTE_PORT_DEVICE },
+        { TYPE_REMOTE_PORT_ATS_CACHE },
+        { },
+    },
+};
+
+static const TypeInfo rp_ats_cache_info = {
+    .name          = TYPE_REMOTE_PORT_ATS_CACHE,
+    .parent        = TYPE_INTERFACE,
+    .class_size = sizeof(RemotePortATSCacheClass),
+};
+
+static void rp_register_types(void)
+{
+    type_register_static(&rp_ats_cache_info);
+    type_register_static(&rp_ats_info);
+}
+
+type_init(rp_register_types)
diff --git a/include/hw/core/remote-port-ats.h b/include/hw/core/remote-port-ats.h
new file mode 100644
index 0000000000..ffe60539ac
--- /dev/null
+++ b/include/hw/core/remote-port-ats.h
@@ -0,0 +1,76 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * QEMU remote port ATS
+ *
+ * Copyright (c) 2021 Xilinx Inc
+ * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef REMOTE_PORT_ATS_H
+#define REMOTE_PORT_ATS_H
+
+#include "hw/core/remote-port.h"
+
+#define TYPE_REMOTE_PORT_ATS "remote-port-ats"
+#define REMOTE_PORT_ATS(obj) \
+        OBJECT_CHECK(RemotePortATS, (obj), TYPE_REMOTE_PORT_ATS)
+
+typedef struct {
+    /* private */
+    SysBusDevice parent;
+
+    /* public */
+    struct RemotePort *rp;
+    struct rp_peer_state *peer;
+    MemoryRegion *mr;
+    AddressSpace as;
+    RemotePortDynPkt rsp;
+    GArray *iommu_notifiers;
+    uint32_t rp_dev;
+    GArray *cache; /* Translation cache */
+} RemotePortATS;
+
+#define TYPE_REMOTE_PORT_ATS_CACHE "remote-port-ats-cache"
+
+#define REMOTE_PORT_ATS_CACHE_CLASS(klass) \
+     OBJECT_CLASS_CHECK(RemotePortATSCacheClass, (klass), \
+                        TYPE_REMOTE_PORT_ATS_CACHE)
+#define REMOTE_PORT_ATS_CACHE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(RemotePortATSCacheClass, (obj), TYPE_REMOTE_PORT_ATS_CACHE)
+#define REMOTE_PORT_ATS_CACHE(obj) \
+     INTERFACE_CHECK(RemotePortATSCache, (obj), TYPE_REMOTE_PORT_ATS_CACHE)
+
+typedef struct RemotePortATSCache {
+    Object Parent;
+} RemotePortATSCache;
+
+typedef struct RemotePortATSCacheClass {
+    InterfaceClass parent;
+
+    IOMMUTLBEntry *(*lookup_translation)(RemotePortATSCache *cache,
+                                         hwaddr translated_addr,
+                                         hwaddr len);
+} RemotePortATSCacheClass;
+
+IOMMUTLBEntry *rp_ats_cache_lookup_translation(RemotePortATSCache *cache,
+                                               hwaddr translated_addr,
+                                               hwaddr len);
+#endif
-- 
2.43.0


