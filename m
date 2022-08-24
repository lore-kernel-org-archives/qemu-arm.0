Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2218985ejc;
        Wed, 24 Aug 2022 08:57:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7rEPKLa8cMXKUbH19unFdX7oyYxVgVQBhLFzHyMPRDYUgU9YZ6/405rTeyqCC/YnrQmquH
X-Received: by 2002:a05:620a:4245:b0:6b9:9b7:11d with SMTP id w5-20020a05620a424500b006b909b7011dmr19897995qko.579.1661356661663;
        Wed, 24 Aug 2022 08:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356661; cv=none;
        d=google.com; s=arc-20160816;
        b=aj4dpXJShlQZE0jjHRJxCqR9F5X0PZ1/0oJmIg8JrWeALBPCOIXL6aLK+hpoaX93Bv
         7o62Wn8T48eUtOqCMp7Gk5H6+WVRbpGa9GrAyJNhZL+j1xVbzF+BokKTpw+YUJcgJn2i
         5xz8Bxowp/JbwQkEOiRIqcd3C2LuhKGA/5mpZX8ciLFCR1mNPT3BupxRRukTDt1PyOz8
         5m/eaDnYC0VjFehHd9tBPcKikWaF67mYNax5cLZorQlAEGcdpcsYU/5E/OKaZemVLPRT
         d9t5gVA8aF/GEci+Bc/hZLsJys6akF7GXwJbRJJRhF/SWzmby+zW9rcjkwCtP2jghMkZ
         CGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LhPaHmCfzH5shp5YW3SkLpdM/SN0fbAn5PuvfUG/UcA=;
        b=stDpM2+XZCAthSfmOdOXDfrJ3nWyUzSM1+DCVlQUD9atDGoFYRNJqm4aOLYgQ5+ip2
         XZ0eMYWpLFKJvo6hqfKQ96cGwY13lMpWu62jBbGovJPalirP8xfFWeZIPxZNqrSUYy9L
         W3+mfLVssxQPbOe44NJ8D2X5/keqvpeZciYJYoYsTjFVugRd3pu2AIEa/H38/5Ll1b+U
         lx8G4NkjAiEkAHqLZ+ksOjwjHkdosliTgE5AsczvSDfu9DWSWfFsClwCtN1GXflpW/wb
         SLuexZzGatjeeyv73jeStUmJtN6dR1Oay4O2S++P3OJw8X8b4axMEMzvFH9zmRLMMNZe
         jz1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I00XCp7Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt14-20020ac8690e000000b0034454335261si8435742qtb.466.2022.08.24.08.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I00XCp7Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQslB-000473-7K
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsfN-0002KQ-RN
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf7-0002Eh-RF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bs25so21308324wrb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LhPaHmCfzH5shp5YW3SkLpdM/SN0fbAn5PuvfUG/UcA=;
 b=I00XCp7YFTtBahSzec2jxL03lRNw3TocDi+xJL7O3MoTnAFNtoC5PsrGQTQYRyT+Em
 Nc6olmD28Q+vISLeBRUPCGu5UDzttAaSUX0knNx+CKHvHKMbE81b7EIVlakEToErDWXd
 U9JU70lYqzfNj/OE71DrT3d/jKUE0P3xEMK0zvCy0zMUHpmGVHqmbh5tK6M2dMDwZCjn
 l+xmQNeAK/UDqi21jKXNNT3WtgVoOcwHlvjSgOX7DT6PKbzkg3xET5oWzqqWqRsGPgq6
 39bx93EhJaN9C0cAHzQo8X6sMENp1IqXiqfYspLVu8slnAaK3OifXyVCkx7ZfccLXt0y
 N4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LhPaHmCfzH5shp5YW3SkLpdM/SN0fbAn5PuvfUG/UcA=;
 b=5Wo5PNgiD2bhis5QnUFgE/ga7qTFsTnDWWRFcS60wd/16UU/g51FnxbUAVUM3xeMTv
 pBLRS9j87Asq+SLKHM+zAKgxLvAZg2T8+Y/au4XdAvms2plNYPA0QSFNChDyGGfuqa1P
 NmXVX1Msa3xCuyxH71DeAoCcA+E1RRH5eEVDEakIzGZzjXm+KPcAmStU8SwNmMjBGuI5
 CihFXe2gcVTUBxISHM1JXPGkLEndVhSNZ45ID3iH+mpK7+TjafRAK0Jhi/Uf/hXP4Wor
 8wAZm2RzzTwI13yUYQmqh2ZVfgKvHU6DyevPBO4Lk+kBfGhujwyv8hneYbalSsjkN+g4
 0Qzw==
X-Gm-Message-State: ACgBeo3zpc+Q+PMIk7/BhA9C/QP6UHsJHJW6OKhLouqMfTcQ31D1so9P
 x65Es4QcSBiu03/ExPftJ7YN2A==
X-Received: by 2002:adf:d1ea:0:b0:225:46e1:4fa0 with SMTP id
 g10-20020adfd1ea000000b0022546e14fa0mr11303465wrd.362.1661356285050; 
 Wed, 24 Aug 2022 08:51:25 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 10/10] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
Date: Wed, 24 Aug 2022 16:51:14 +0100
Message-Id: <20220824155113.286730-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0vPHCHcVXbR

dt-validate and dtc throw a few warnings when parsing the virtio-iommu
node:

  pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
  pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
  From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
  pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
  From schema: dtschema/schemas/pci/pci-bus.yaml

  Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"

The compatible property for a PCI child node should follow the rules
from "PCI Bus Binding to: IEEE Std 1275-1994". It should contain the
Vendor ID and Device ID (or class code).

The unit-name should be "device,function".

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Note that this doesn't follow
linux/Documentation/devicetree/bindings/virtio/iommu.txt, I'll update
that document when converting it to yaml, hopefully this Linux cycle.
The "virtio,pci-iommu" compatible string is not actually used by any
driver and only QEMU implements it, so we can get rid of it.
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index de508d5329..08b79592eb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1374,14 +1374,15 @@ static void create_smmu(const VirtMachineState *vms,
 
 static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
 {
-    const char compat[] = "virtio,pci-iommu";
+    const char compat[] = "pci1af4,1057";
     uint16_t bdf = vms->virtio_iommu_bdf;
     MachineState *ms = MACHINE(vms);
     char *node;
 
     vms->iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
 
-    node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
+    node = g_strdup_printf("%s/virtio_iommu@%x,%x", vms->pciehb_nodename,
+                           PCI_SLOT(bdf), PCI_FUNC(bdf));
     qemu_fdt_add_subnode(ms->fdt, node);
     qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg",
-- 
2.37.1

