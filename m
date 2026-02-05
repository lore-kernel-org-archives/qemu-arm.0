Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD1ECD99E
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:01:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo5Va-0006tS-0w; Thu, 05 Feb 2026 14:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VS-0006oF-F5
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:14 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VO-00037w-OE
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:14 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so884913f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 11:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770321549; x=1770926349; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+nwsgAJTHvM+0L73DFIwTvl7Jx6GKbrKwt9jyk9QLg=;
 b=Qzb584sXSuCasOdrjwe4xfKUT6bDvd+UeHQnH9iHlC8mATD8XLQq8XkRZ/fW/YwG09
 Nt3J7cpbD0rspOjz32uxDkaTQWRI3d+bT1R+oHVYrOSd+T8kJHn4nKYR4z20jE2enYS6
 kdE1kEzboX3VfnfPSPwYNuad4iDs5WGwkwJRGypVDP6mWAD6JlhGSKizHYiSXMn1OQNL
 mR29quYAYBYccIFlWKYN+VALzKQmXOP3lA6OigfqRgG/XvsNwCEDXdAJ/+tY3owKGna0
 DDgxf5cw6uouA7HOI3xXk3O+2sZuRUb1LhnAH93N+QLSV5YSNw5LeITwc9HpNrAmENSZ
 GfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770321549; x=1770926349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o+nwsgAJTHvM+0L73DFIwTvl7Jx6GKbrKwt9jyk9QLg=;
 b=WqDK9jbf0m1dAvn17NR3p40NBRnzhMdAva1mc4zwLzsQttUH/X99urHspVU5MNfLCI
 mVsQsrlT/KrnKbM9CGsgFDSAonLot2qX0BX2oKR/cjO84jEiFclRdPB1DumaO4ARvzLi
 1kfw1qe74Z3Hp3rWCXtcNRFMy3uYh+h0vKp2Dv+EgfDke3UlpPAAaDentCFEAqocBqcT
 u029TC9g6/ojZx1fKvDwtIOtoS3FGHS6nbONgJ3Mmh6u4t3k+nIT8oXoHMVQe/M5Jjgp
 ZbOnd0boInKHv08NGQJNJZM3NSV6DxOk29ETDNJmSy0vK4hC5GsYs1eGft5dH1iqJ0qy
 VXyg==
X-Gm-Message-State: AOJu0YyHjQ6O9pAYpcRqk/YjimAucefY9OmqD6O1urCIpWmH+SgrmDOm
 n1xs5wt+unwx8HY3Nm3uQKrhSASDXTwSLKJtgXAmg5HYf0eXPPit7uhy
X-Gm-Gg: AZuq6aLxzVwieBsVp72R7yyRMNbPonzwzVb+1ybT8rCFPVlpBDyYSUkxsz/b3DxbpdG
 ZDCsimpbr8U1hF4cDZtD+q7rvwEzWjzyklj9Qkp23XhzHFX5IChLJ0hU8y0mL4AgBNSSBvoT1xi
 aac7VxwX6SUrCWeq9vdT/aJ6CtT1oElbIgwGXfc/29yyIhJ5TM57EfTC+/g75iD/G1oDAvxKzRq
 ZAsSMFG0NWXCV1adMSdybW/fUJPPKWQE/SS2h73a1DITMxLVWGhU2G1bgntKs50QWySD9pH6UJk
 iVI+YurSljALVa5xz8p0ldajtL51ZUbhgVoYEPkSA/I43vHacBq4WdwfqE+PBXivjPJ0fLUgmi/
 1DqIc1tCAkwCRJSj5CHRxdUogONwXmOTnRvOpR7zygPawYZ+uKX/eu7e5gOsR9aLJfiyBmfCQyv
 3KOsAWixzNKwH7vYefl1w=
X-Received: by 2002:a05:6000:2601:b0:435:d859:5cf with SMTP id
 ffacd0b85a97d-4362938a761mr761246f8f.54.1770321549243; 
 Thu, 05 Feb 2026 11:59:09 -0800 (PST)
Received: from thinkpad-t470s.. ([93.140.16.93])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-436297450b4sm514079f8f.34.2026.02.05.11.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:59:08 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 francisco.iglesias@amd.com, Ruslan_Ruslichenko@epam.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 17/29] hw/core: Add Remote Port ATS device skeleton
Date: Thu,  5 Feb 2026 20:58:12 +0100
Message-ID: <20260205195824.2610192-18-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x42a.google.com
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

Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port-ats.c         | 205 ++++++++++++++++++++++++++++++
 include/hw/core/remote-port-ats.h |  75 +++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 hw/core/remote-port-ats.c
 create mode 100644 include/hw/core/remote-port-ats.h

diff --git a/hw/core/remote-port-ats.c b/hw/core/remote-port-ats.c
new file mode 100644
index 0000000000..c0e8150452
--- /dev/null
+++ b/hw/core/remote-port-ats.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: MIT
+/*
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
index 0000000000..8bdae1bce9
--- /dev/null
+++ b/include/hw/core/remote-port-ats.h
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: MIT
+/*
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


