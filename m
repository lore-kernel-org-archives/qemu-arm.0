Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1354474lfb;
        Fri, 3 Sep 2021 07:35:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ+6/XEZzo/gnCuAdv6zT29gL+gxVorn5r7wDIovPr/u8S63FukJFIGUqnPMsM5kDbyTW5
X-Received: by 2002:adf:9f05:: with SMTP id l5mr4466377wrf.188.1630679752682;
        Fri, 03 Sep 2021 07:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630679752; cv=none;
        d=google.com; s=arc-20160816;
        b=atz5dQpRb2Ay9aJtnWTMizsL/3MSQ4G/FeeT2NSbOQRyUfa4/p1VgL5ZAJPPyIiM1E
         Gm4gn8f38E7P8xIwZVtE1RUaTmgYm3aR3IYgR5Ba/IlQ+8Q8xq5oPkgbeRRFFqoR7gMR
         Ktu7fajYqD0q8yA29Ub7WurenQTi5yLDDC0VIUwwM3j08GjU+sk0ZD4LyPsQyzwrdSku
         CAtRNaqwt7R7yFcozg7nGcaI4fSBmoCgOg3M9vBsMhobfLyq1D2p5fICo5dCIIOn/zcC
         R21r5OxJchggPJzq9/AqyRdqpAkgCULHd8w6msFd75ZL8PzeuhGFNqjkHCH4WAB9HqbV
         R4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=94WuptPyOzTpjzAbl+X3deh0A1E8Zn+KEwD/QXX5ut0=;
        b=lquKHOydq9xrS0EMyMRXzww30AHPyThObYTkWfPFDj087i7YG9q5Jv4Uo4t+sOcu88
         9fkvJkXc99vJSNsMu5apGtGcZplDjis6zESgF3zgSvUJeZvPk1OlTF+stPL07nlDRvll
         tmJ4FSS7hml0h7ewURWJgfCEOwxiiSmpnoKiTd/mtHttR8ed6PzSLZr/C/zvJOc0cb63
         Ey7mlgOeq0JAXum9DxJvXDepthvgZeRXs9hLYSKF8l7xm8jW7FreL/8LfRSxuWfN8dHw
         fYfp3sPCWNBLA32xJTbr7dpwGE6uWUVpUo06fM1MKSN3ulfm075TCDEzjsVZKJ9OltNJ
         7A7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVHqGfUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si262218wmb.92.2021.09.03.07.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVHqGfUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAIJ-0002vK-NM
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFL-0004NM-Ks
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFJ-0005ic-9o
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so8521054wrn.5
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94WuptPyOzTpjzAbl+X3deh0A1E8Zn+KEwD/QXX5ut0=;
 b=SVHqGfUk5gdz5MMZMSjEadUWc884a4J/GEq9zsK0zpWsom3HsrJcgE1mtZU8a99TKY
 k635YlVzRYlFA0f46bZuTcNzZ3wGa5P6qEsjMB6oezyfqGiMa2y8y+A4OZ6aNymWzf1O
 XbFluwslPdUziTWubYgNfqk3t4m6svcylF8FXMKjlM4I4TAkuNRaKbEvQlprsZm6hyQR
 iyiGXguOXYiGbV188r6hdxh8sTI+1dVvnX4XfQk2onGoTlr7dWkjQeyOT+iIWGl3gOoJ
 J1ZgqQm0yB4lA0PyWwiZUPBtehORaU3FKxzpj0Jbswm3CsD/UjTZ+AGvqayCfgKiX4UA
 sryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94WuptPyOzTpjzAbl+X3deh0A1E8Zn+KEwD/QXX5ut0=;
 b=a+LzooCRvYSOPib5locp0Ex9pk+GoizV5/NDQH498u/erhjKkRscEHzgICaUTYoEYy
 AJ7XwoslF9y5u8l3ao5jFaJlrb/iAncJfWdGQs8xqzOwP0E7gkpk7B7gO9GoD+8e7HqV
 9kuN7wbaorUrdrxXhOpomGUQBsckCbUwmmaDPKVeX/Bftp/rLtESg+1FD3WXuGaFcA7q
 e5Gkt/42DcWjuZhnegAYlgBJCvFXDfE7gJgwfCZAGt5O/IREGWYTc5wdsEiiQ71767SW
 QsDiz6oj7+UavVHC9fQko8ybBCDFEUal+cQomouo2VSW5Gs14V3ItuBPWAnqxbd8j0Pb
 7cag==
X-Gm-Message-State: AOAM530XU8pw+N8cReqT2wrpC3CNzlyXfmm2Mqhys53unj0hiFmDlDSm
 QM4uTISPPDOVrSRVfVP3TT4oEQ==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr4553910wri.99.1630679563819; 
 Fri, 03 Sep 2021 07:32:43 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:43 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 7/8] pc: Allow instantiating a virtio-iommu device
Date: Fri,  3 Sep 2021 16:32:08 +0200
Message-Id: <20210903143208.2434284-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 96VHbBjnEkzU

From: Eric Auger <eric.auger@redhat.com>

Add a hotplug handler for virtio-iommu on x86 and set the necessary
reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
region is reserved for MSIs. DMA transactions to this range either
trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.

Although virtio-iommu does not support IRQ remapping it must be informed
of the reserved region so that it can forward DMA transactions targeting
this region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/pc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 694fc9ce07..c1e1cffe16 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -797,6 +797,11 @@ void pc_machine_done(Notifier *notifier, void *data)
                      "irqchip support.");
         exit(EXIT_FAILURE);
     }
+
+    if (pcms->virtio_iommu && x86_iommu_get_default()) {
+        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
+        exit(EXIT_FAILURE);
+    }
 }
 
 void pc_guest_info_init(PCMachineState *pcms)
@@ -1376,6 +1381,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* Declare the reserved MSI region */
+        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
+                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
+
+        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
+        g_free(resv_prop_str);
     }
 }
 
@@ -1393,6 +1406,11 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         PCMachineState *pcms = PC_MACHINE(hotplug_dev);
         PCIDevice *pdev = PCI_DEVICE(dev);
 
+        if (pcms->virtio_iommu) {
+            error_setg(errp,
+                       "QEMU does not support multiple vIOMMUs for x86 yet.");
+            return;
+        }
         pcms->virtio_iommu = true;
         pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
     }
@@ -1436,7 +1454,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
 
-- 
2.33.0

