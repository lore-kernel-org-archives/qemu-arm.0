Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE06C5CFCF
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:37:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnar-00013T-BI; Tue, 11 Aug 2026 10:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaQ-0000JQ-Dj
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:19 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaN-0001tx-F8
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:13 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-8f186025973so30423446d6.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458970; x=1787063770; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/awn/fyk/BNWYmm6Q7Iu7ZxGO/DeIOJAJF1lrP09LdY=;
 b=Aq/dpB03ELLf+wYuHRadp4zaNYH8XKowSMX0PG50f19fGWM/IElltyBRd+B0tw3bzG
 JhkHTGl98MCdsDKoZgX+FUC/+mg9tye5e93NlLBxIDSgXi2AxF9sst9YX7IYfm2xWjf3
 T5j6svPvP8WPsQ08A5LrhIf4bud2UU9nG63FH0uxK0inB0HVW0MV2T8SdCHT5CcpoKYO
 a6lTBmaYJOWk0IwSJhsdzUxy15rTr8sWASDJGkwr2Dwndq81qAhCgdi8/1z9CzOLLRXH
 XnKQZ7kL1Zb2uGvwPQKsd6DsMUlCuL9kocfoF7vktVdWAiS6hCA77CbmLaWWATP0PJqQ
 OxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458970; x=1787063770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/awn/fyk/BNWYmm6Q7Iu7ZxGO/DeIOJAJF1lrP09LdY=;
 b=MZQvHFE1XqiUVAXGY87TIIgGvLV/cyz9XuyVnMbp8vIzB9ldllaRbod2LcsUIFh9j2
 4K/UdiB8rhhcoNhiFwtEJVkTw3YNEFqKtV1TDn24/YgRwHmtlfgByQJdBiTqWYJSQWK7
 rIisyuoMz9e7YgcCdbR2vr22Icz4CLLjsNqOEdUnC+tZhr/F4sNzS9hB6kZZu37g3ugb
 PT/eNUSfBOE+p/2AqJFBuXs65QHwVd6la784483Ox9LCTI0R5d6y22g63yyYGMa6PszK
 o3bZ1Qz7DTHn5HhIo5ESiIMUiR4Ap292NYGRDCNl493VeI+Zl07VrUQzpQe4c775ViDQ
 VDVw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEqWt1dfNhUPP1NzX/FqoAEms4LWZ1eQSGY3CJztPEONuMyNBy55ouosms516uR0V5K2urR2mhjQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGBhyw7IlBj/Ph8EbXG4gIPSrr0fgiWlhIAgXqnMr7sJ6VObb6
 +LkDbKZ09L4lq6xgWKTZkxSCfaE90X8dwA/aPnK+E1+zs6kPj86eYmCEAUPCPw==
X-Gm-Gg: AR+sD11KkWwqzrSGm7Wtj8wX2GV6v8NXe3vMTaAQ3wOVQx48RRoXLj+D6i5U11/6HAI
 yYTPyGdEpadbaXtvExykJoPV0GPjTgfdLb/LNzpvOSET43dziYXyFGjck0V/Bo/8W3SlxB4+6uk
 cK5bdEZe0t0kl3KYopP9LcV8Qgq7V/R52y28GZe39VCwd1W0B4RLMS+gS4aUE7na7RpdHdMMx7h
 T7pLtcqkzJp8otL2NmHJYSatMBryQc3DK6cJ4kTjcWyPLNhhNjoj4L+XDS0Z2zSIsrsmipI4Mhl
 eNxAr51qmzwHHyY+Iv7CbIoq27aOwVPj0IherCfM8oKANIfomKVZwbhJcRxyxVug0sLfMIUszbw
 Vv+caPj6wsrmI4of5b5ihAUnrVLtfFL+EYGlmiT6Es4s8AEou0dZ0TEfm0bOzCSDEg7zZ+XKduR
 vFpqVg3RIrSgTERPCzV+AAs/oautCIzkjw1ZaJ1Ie4BPhRWgRVsBawtVz+VdnWzXMkI1Mq/AFyM
 qXcEBFshK8y5pUkNb4Sbajf+lhILQ==
X-Received: by 2002:a05:6214:5d88:b0:90a:35f9:9694 with SMTP id
 6a1803df08f44-90a66e53c80mr34457756d6.31.1786458970114; 
 Tue, 11 Aug 2026 07:36:10 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c26e074sm681286d6.2.2026.08.11.07.36.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:36:09 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v2 10/19] hw/net/bcm2838_genet: implement GENET register ops
Date: Tue, 11 Aug 2026 10:35:47 -0400
Message-ID: <20260811143557.7862-11-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2b.google.com
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

From: Sergey Kambalin <serg.oker@gmail.com>

Replace the stub MMIO read/write handlers with real dispatch over
the register offsets from the previous patches: SYS revision
control, INTRL0/1 status/mask registers, UMAC command/MAC-address/
MDIO-command registers, and TDMA/RDMA ring configuration, wired up
to the NIC's realize()/reset() and qdev NIC properties
(DEFINE_NIC_PROPERTIES) so the device gets a MAC address and peer
netdev from the command line.

Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
networking series (patchwork series 829638, posted to qemu-devel in
2024, never merged). Carried forward and completed by Marcelo Manzo:
adapted to the current Property/class_init/Resettable APIs, with no
functional change to the register dispatch logic itself.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/net/bcm2838_genet.c         | 197 +++++++++++++++++++++++++++++++--
 include/hw/net/bcm2838_genet.h |   2 +
 2 files changed, 190 insertions(+), 9 deletions(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 2bc2a770b1..f3c5ca26c5 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -236,25 +236,151 @@ REG16(GENET_PHY_EXP_SEL,           0)
 FIELD(GENET_PHY_EXP_SEL, REG_ID,   0, 8)
 FIELD(GENET_PHY_EXP_SEL, BLOCK_ID, 8, 8)
 
+static void bcm2838_genet_set_qemu_mac(BCM2838GenetState *s)
+{
+    const MACAddr *addr = &s->nic_conf.macaddr;
+
+    s->regs.umac.mac0 = FIELD_DP32(s->regs.umac.mac0, GENET_UMAC_MAC_0,
+                                   ADDR_0, addr->a[0]);
+    s->regs.umac.mac0 = FIELD_DP32(s->regs.umac.mac0, GENET_UMAC_MAC_0,
+                                   ADDR_1, addr->a[1]);
+    s->regs.umac.mac0 = FIELD_DP32(s->regs.umac.mac0, GENET_UMAC_MAC_0,
+                                   ADDR_2, addr->a[2]);
+    s->regs.umac.mac0 = FIELD_DP32(s->regs.umac.mac0, GENET_UMAC_MAC_0,
+                                   ADDR_3, addr->a[3]);
+    s->regs.umac.mac1 = FIELD_DP32(s->regs.umac.mac1, GENET_UMAC_MAC_1,
+                                   ADDR_4, addr->a[4]);
+    s->regs.umac.mac1 = FIELD_DP32(s->regs.umac.mac1, GENET_UMAC_MAC_1,
+                                   ADDR_5, addr->a[5]);
+}
+
+static void bcm2838_genet_set_irq_default(BCM2838GenetState *s)
+{
+    uint32_t intrl_0_status = s->regs.intrl0.stat;
+    uint32_t intrl_0_mask = s->regs.intrl0.mask_status;
+    int level = (intrl_0_status & ~intrl_0_mask) == 0 ? 0 : 1;
+
+    qemu_set_irq(s->irq_default, level);
+}
+
+static void bcm2838_genet_set_irq_prio(BCM2838GenetState *s)
+{
+    uint32_t intrl_1_status = s->regs.intrl1.stat;
+    uint32_t intrl_1_mask = s->regs.intrl1.mask_status;
+    int level = (intrl_1_status & ~intrl_1_mask) == 0 ? 0 : 1;
+
+    qemu_set_irq(s->irq_prio, level);
+}
+
 static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint64_t value = ~0;
+    BCM2838GenetState *s = opaque;
 
-    qemu_log_mask(
-        LOG_GUEST_ERROR,
-        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
-        __func__, size, offset);
+    if (offset + size < sizeof(s->regs)) {
+        memcpy(&value, (uint8_t *)&s->regs + offset, size);
+    } else {
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+            __func__, size, offset);
+    }
 
     trace_bcm2838_genet_read(size, offset, value);
     return value;
 }
 
 static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
-                                unsigned size) {
-    qemu_log_mask(
-        LOG_GUEST_ERROR,
-        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
-        __func__, size, offset);
+                                unsigned size)
+{
+    BCM2838GenetState *s = opaque;
+    MACAddr *mac = &s->nic_conf.macaddr;
+    NetClientState *ncs = qemu_get_queue(s->nic);
+
+    trace_bcm2838_genet_write(size, offset, value);
+
+    if (offset + size < sizeof(s->regs)) {
+        switch (offset) {
+        case BCM2838_GENET_INTRL0_SET:
+            s->regs.intrl0.stat |= value;
+            break;
+        case BCM2838_GENET_INTRL0_CLEAR:
+            s->regs.intrl0.stat &= ~value;
+            break;
+        case BCM2838_GENET_INTRL0_MASK_SET:
+            s->regs.intrl0.mask_status |= value;
+            break;
+        case BCM2838_GENET_INTRL0_MASK_CLEAR:
+            s->regs.intrl0.mask_status &= ~value;
+            break;
+        case BCM2838_GENET_INTRL1_SET:
+            s->regs.intrl1.stat |= value;
+            break;
+        case BCM2838_GENET_INTRL1_CLEAR:
+            s->regs.intrl1.stat &= ~value;
+            break;
+        case BCM2838_GENET_INTRL1_MASK_SET:
+            s->regs.intrl1.mask_status |= value;
+            break;
+        case BCM2838_GENET_INTRL1_MASK_CLEAR:
+            s->regs.intrl1.mask_status &= ~value;
+            break;
+        case BCM2838_GENET_UMAC_CMD:
+            /* Complete SW reset as soon as it has been requested */
+            if (FIELD_EX32(value, GENET_UMAC_CMD, SW_RESET) == 1) {
+                device_cold_reset(DEVICE(s));
+                value = FIELD_DP32(value, GENET_UMAC_CMD, SW_RESET, 0);
+            }
+            break;
+        /*
+         * TODO: before changing MAC address we'd better inform QEMU
+         * network subsystem about freeing previously used one, but
+         * qemu_macaddr_set_free function isn't accessible for us (marked
+         * as static in net/net.c), see also https://lists.nongnu.org/
+         * archive/html/qemu-devel/2022-07/msg02123.html
+         */
+        case BCM2838_GENET_UMAC_MAC0:
+            mac->a[0] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_0);
+            mac->a[1] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_1);
+            mac->a[2] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_2);
+            mac->a[3] = FIELD_EX32(value, GENET_UMAC_MAC_0, ADDR_3);
+            qemu_macaddr_default_if_unset(mac);
+            qemu_format_nic_info_str(ncs, mac->a);
+            trace_bcm2838_genet_mac_address(ncs->info_str);
+            break;
+        case BCM2838_GENET_UMAC_MAC1:
+            mac->a[4] = FIELD_EX32(value, GENET_UMAC_MAC_1, ADDR_4);
+            mac->a[5] = FIELD_EX32(value, GENET_UMAC_MAC_1, ADDR_5);
+            qemu_macaddr_default_if_unset(mac);
+            qemu_format_nic_info_str(ncs, mac->a);
+            trace_bcm2838_genet_mac_address(ncs->info_str);
+            break;
+        case BCM2838_GENET_RDMA_CTRL:
+            s->regs.rdma.status = (~value) & GENET_DMA_ENABLE_MASK;
+            break;
+        case BCM2838_GENET_UMAC_MDIO_CMD:
+        case BCM2838_GENET_TDMA_REGS
+            ... BCM2838_GENET_TDMA_REGS + sizeof(BCM2838GenetRegsTdma) - 1:
+            qemu_log_mask(LOG_UNIMP,
+                "UMAC MDIO and TDMA aren't implemented yet");
+            break;
+        default:
+            break;
+        }
+
+        memcpy((uint8_t *)&s->regs + offset, &value, size);
+        if (offset == BCM2838_GENET_RDMA_CTRL &&
+            FIELD_EX32(value, GENET_DMA_CTRL, EN)) {
+            qemu_flush_queued_packets(ncs);
+        }
+        bcm2838_genet_set_irq_default(s);
+        bcm2838_genet_set_irq_prio(s);
+    } else {
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+            __func__, size, offset);
+    }
 }
 
 static const MemoryRegionOps bcm2838_genet_ops = {
@@ -265,9 +391,14 @@ static const MemoryRegionOps bcm2838_genet_ops = {
     .valid = {.min_access_size = 4},
 };
 
+static NetClientInfo bcm2838_genet_client_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState)
+};
 
 static void bcm2838_genet_realize(DeviceState *dev, Error **errp)
 {
+    NetClientState *ncs;
     BCM2838GenetState *s = BCM2838_GENET(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
@@ -275,10 +406,46 @@ static void bcm2838_genet_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->regs_mr, OBJECT(s), &bcm2838_genet_ops, s,
                           "bcm2838_genet_regs", sizeof(s->regs));
     sysbus_init_mmio(sbd, &s->regs_mr);
+
+    /* QEMU-managed NIC (host network back-end connection) */
+    qemu_macaddr_default_if_unset(&s->nic_conf.macaddr);
+    s->nic = qemu_new_nic(&bcm2838_genet_client_info, &s->nic_conf,
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
+    bcm2838_genet_set_qemu_mac(s);
+    ncs = qemu_get_queue(s->nic);
+    qemu_format_nic_info_str(ncs, s->nic_conf.macaddr.a);
+    trace_bcm2838_genet_mac_address(ncs->info_str);
+
+    /* Interrupts */
+    sysbus_init_irq(sbd, &s->irq_default);
+    sysbus_init_irq(sbd, &s->irq_prio);
+
+    /* DMA space */
+    address_space_init(&s->dma_as, get_system_memory(), "bcm2838_genet_dma");
 }
 
 static void bcm2838_genet_phy_reset(BCM2838GenetState *s)
 {
+    memset(&s->phy_regs, 0x00, sizeof(s->phy_regs));
+    memset(&s->phy_shd_regs, 0x00, sizeof(s->phy_shd_regs));
+    memset(&s->phy_aux_ctl_shd_regs, 0x00, sizeof(s->phy_aux_ctl_shd_regs));
+
+    /* All values below were taken from real HW trace and logs */
+    s->phy_regs.bmcr = 0x1140;
+    s->phy_regs.bmsr = 0x7949;
+    s->phy_regs.sid1 = 0x600D;
+    s->phy_regs.sid2 = 0x84A2;
+    s->phy_regs.advertise = 0x01E1;
+    s->phy_regs.ctrl1000 = 0x0200;
+    s->phy_regs.estatus = 0x3000;
+
+    s->phy_shd_regs.clk_ctl = 0x0200;
+    s->phy_shd_regs.scr3 = 0x001F;
+    s->phy_shd_regs.apd = 0x0001;
+
+    s->phy_aux_ctl_shd_regs.misc = 0x1E;
+
     trace_bcm2838_genet_phy_reset("done");
 }
 
@@ -288,11 +455,22 @@ static void bcm2838_genet_reset(Object *obj, ResetType type)
 
     memset(&s->regs, 0x00, sizeof(s->regs));
 
+    s->regs.sys.rev_ctrl = FIELD_DP32(s->regs.sys.rev_ctrl, GENET_SYS_REV_CTRL,
+                                      MAJOR_REV, BCM2838_GENET_REV_MAJOR);
+    s->regs.sys.rev_ctrl = FIELD_DP32(s->regs.sys.rev_ctrl, GENET_SYS_REV_CTRL,
+                                      MINOR_REV, BCM2838_GENET_REV_MINOR);
+    s->regs.rdma.status = GENET_DMA_ENABLE_MASK;
+    s->regs.tdma.status = GENET_DMA_ENABLE_MASK;
+
     trace_bcm2838_genet_reset("done");
 
     bcm2838_genet_phy_reset(s);
 }
 
+static const Property genet_properties[] = {
+    DEFINE_NIC_PROPERTIES(BCM2838GenetState, nic_conf),
+};
+
 static void bcm2838_genet_class_init(ObjectClass *class, const void *data)
 {
     static ResettablePhases unused_parent_phases;
@@ -302,6 +480,7 @@ static void bcm2838_genet_class_init(ObjectClass *class, const void *data)
     dc->realize = bcm2838_genet_realize;
     resettable_class_set_parent_phases(rc, NULL, bcm2838_genet_reset, NULL,
                                        &unused_parent_phases);
+    device_class_set_props(dc, genet_properties);
 }
 
 static const TypeInfo bcm2838_genet_info = {
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index b9895933b6..e3dee5a78f 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -390,6 +390,8 @@ struct BCM2838GenetState {
     SysBusDevice parent_obj;
 
     /*< public >*/
+    NICState *nic;
+    NICConf nic_conf;
 
     MemoryRegion regs_mr;
     AddressSpace dma_as;
-- 
2.47.1


