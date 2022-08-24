Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2219126ejc;
        Wed, 24 Aug 2022 08:57:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6T2/TONSPkB9wofl/mSfMeGqhen+DijY+ry1AoKWcXLFt/YK2Z2bnYRDwOwnLFJ9fhLdsn
X-Received: by 2002:a05:622a:2c1:b0:343:550e:d7fb with SMTP id a1-20020a05622a02c100b00343550ed7fbmr23990557qtx.286.1661356678781;
        Wed, 24 Aug 2022 08:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356678; cv=none;
        d=google.com; s=arc-20160816;
        b=PuEOm8vwFrJ/CIY/isLMWY9J48Y5RlFVxf81su3YGSBOBfv+0rAOncF5T830J9VY6+
         UnwwRPq3BVGuLiNT+XHHqYXHMObcHpWls/0SKo5hRefOqFvd7CPNqK67RA7q/pGihJo2
         PSpQ+Lp3gtHseklg+IxwwPDE36tN1rM/oa15QiloNhTmRH9+LlMKTHNg3S3qlLTWdyQY
         klfXbUOHf26pcOXpVZQtGfLs0TmaESkIh/AaMU7N78RHmf60xNIhvj/FawH/giVS3Muc
         qzaJ5ztsYE7pShTUYB75ffCB0usqlb5l6+6Rfqn8FxdFM4erYeaXw36OoCuEKLHdJ3nv
         kOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/y1zm97n6IGKhSBa6qGqkTluIHtkqiOpSJE6ybC/cmQ=;
        b=qp137nY+bYmVlk8TibE12bdDcJ4bl8OADGlSvkeNhRJwUDMLXmEtLf5UeqmDzL8MM3
         hFmopo5fLrBWtm1kZYU5QGQ3eLm0evbAZLOOSJznrOjt+j8XvBL5GAbUb2Ye3JpaJS0e
         qU7mKx7fzcIJoi8yPt06BNV8DTnAA1gM9p0UPyVR3XUC+lyY3cg8c83pL8y6xUe/a1ZI
         MCGNji9u7rDNqfsKYXH8EP/z9TNlMlEw8zXOQpa4SfKt2zoDrYxthFN7eBdzoZj5IzY8
         1oIeA/DPPG9Th/bCxIOV+mdzlf6Mj8ytwOkcoq1XyB9DOEX9XW1M77nAOiFcKa7Ju+G0
         B44w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwlW40h1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020ac87012000000b003433dc638b0si8419611qtm.116.2022.08.24.08.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwlW40h1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQslS-0005bd-6e
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsfN-0002KV-SD
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:41 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf7-0002Gj-RY
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id u14so21278701wrq.9
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/y1zm97n6IGKhSBa6qGqkTluIHtkqiOpSJE6ybC/cmQ=;
 b=XwlW40h1EREpZkq6bDzc17N3GOMsYtv0OAPbS70wPH/7excd57FtyJRddtkf1pDhu8
 phIoFoGUmX75T8ofO/nMriJKx8K1YgW0F70ec5EM1ixE5PoC7+r03CkEv6AMFSQ0pq+N
 bOZQAatftnREL+sp6QjSfb51wbYJa2kCPb4qI1JTGF/58357c/JFAWFNGSLOGGRu+1Af
 q9VCzXLigWE6aqNp0sP23osm4Po9n9rtqC3szzkkuQgJ6A/Tb873QaPDDDSwTSDgiYvM
 VfPippxj9mE1sQ5FKI3wRST2nejAh054NJDoS1oy/qVdz0pfVu0DDp4CvruJw4NvRN2n
 BwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/y1zm97n6IGKhSBa6qGqkTluIHtkqiOpSJE6ybC/cmQ=;
 b=DJh4WsTilD60h1IErZgAi9UGSucaD7pg9IpetHrGFCVnaGGKnLomIW/wNDor/D12PA
 oV+az3t5EZXIZdXoYJy981NZ3kb8+2dxbqj+RMUSXE2ZDpgWeU2e4ilfzSFpnKk4CShx
 U1yfbhFUDEsO6ruWk2MahIFIEfjvDtOR7rYHI8FnvgkSAc0Gb7zfl4st9O0AtaBq5Qj9
 ckFf/aEBC7TPna4BPDR6L13BB7jVTX4UFjnErXvFK/UcKckQKs8r8+STJAXSmQvGA7fo
 op2dJcX0VqMGAI1iBG99NiCwYMznXqedwuhAymkhwN8G//M9n3smHNXspKRY4fBWg9+k
 PyHA==
X-Gm-Message-State: ACgBeo3c1tZ0b6g6cNd2J6Zxt4dLZbdcDg6XA46uv76ZI9toUne/NPte
 f63RdbDkowpPYcqZNR9XG+2jJg==
X-Received: by 2002:a05:6000:1812:b0:225:7383:d739 with SMTP id
 m18-20020a056000181200b002257383d739mr1654652wrh.333.1661356284426; 
 Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 09/10] hw/arm/virt: Fix devicetree warnings about the SMMU node
Date: Wed, 24 Aug 2022 16:51:13 +0100
Message-Id: <20220824155113.286730-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: da9Vag3q0pHp

dt-validate reports three issues in the SMMU device-tree node:

  smmuv3@9050000: $nodename:0: 'smmuv3@9050000' does not match '^iommu@[0-9a-f]*'
  smmuv3@9050000: interrupt-names: 'oneOf' conditional failed, one must be fixed:
  	['eventq', 'priq', 'cmdq-sync', 'gerror'] is too long
  	'combined' was expected
  	'gerror' was expected
  	'gerror' is not one of ['cmdq-sync', 'priq']
  smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

Fix them by:
* changing the node name
* reordering the IRQs
* removing the clock properties which are not expected for the SMMU node

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 779eb5ea31..de508d5329 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1329,7 +1329,9 @@ static void create_smmu(const VirtMachineState *vms,
     int i;
     hwaddr base = vms->memmap[VIRT_SMMU].base;
     hwaddr size = vms->memmap[VIRT_SMMU].size;
-    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
+    uint32_t irq_type = GIC_FDT_IRQ_TYPE_SPI;
+    uint32_t irq_trigger = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
+    const char irq_names[] = "eventq\0gerror\0priq\0cmdq-sync";
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
 
@@ -1348,22 +1350,20 @@ static void create_smmu(const VirtMachineState *vms,
                            qdev_get_gpio_in(vms->gic, irq + i));
     }
 
-    node = g_strdup_printf("/smmuv3@%" PRIx64, base);
+    node = g_strdup_printf("/iommu@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, node);
     qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2, size);
 
     qemu_fdt_setprop_cells(ms->fdt, node, "interrupts",
-            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+            irq_type, irq + SMMU_IRQ_EVTQ,      irq_trigger,
+            irq_type, irq + SMMU_IRQ_GERROR,    irq_trigger,
+            irq_type, irq + SMMU_IRQ_PRIQ,      irq_trigger,
+            irq_type, irq + SMMU_IRQ_CMD_SYNC,  irq_trigger);
 
     qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
                      sizeof(irq_names));
 
-    qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
     qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
 
     qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
-- 
2.37.1

