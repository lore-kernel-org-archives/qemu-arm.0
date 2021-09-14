Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp743083lfp;
        Tue, 14 Sep 2021 07:35:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHakonTOlaZfL+312vdnuX6J605oGshhXfdvVIFdCqBLnkVU62qR405SiPPlKMZs5kUR0k
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr2609983wmk.5.1631630106862;
        Tue, 14 Sep 2021 07:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631630106; cv=none;
        d=google.com; s=arc-20160816;
        b=mmrSvw60YNdE6EHN+efqQrm1vLEA6ArYq8/Z5NT5c5181wNHZf2E7iokqpv7GoLUYP
         eHS7i1zToIf4bEVFXgyHue/5ak86RBM1fKUlQ1X9bcGUBA34AqeK9IIlWdt3ZbJSd0Iy
         DTfNo4KDX6L436Bc64xgPe69Lxq1emVB2MafPEuA0+AkN5iVKrAyzBSHEOE4vLgZQMk9
         A5idEgRmOgVFBqAdKG9hkqFi/K3l/i/INt8KpYQ0o9eQoOEAmZDMSYvjIlnsvVmY2jxk
         eQ9YrLKrq9mrJeOK7e+KYeLZbbTGOsKVpqS/Rou90O44It0J/TZ9s+VLfba+o4cZQmum
         OFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K3EssKNnZXrh2nHfsbAL/+KnNzJUGLWYCayXBQqtwQg=;
        b=gl3J25sY608tsQrs84fPZJk6S926JOYaJVx5Q+8oKj3CrXYBarswFFdE7fTFjTRfO3
         XfePOENJlTV3+9bNh5rOMFAGCgGm7CpfIOYKVMw0Sanoz18JKWoo73IE76v0ecIvzukb
         Vg20sqyROg5NvYJm8B439vZe78Dnkv4R5++6DxYW07WntgMzgwwr6IeLJkA+8NVpc/V9
         ETDXKVc/G1rlXgrgOWMK0ayO2cFp78+s/gzI8e9EKDwvBoB8fcZ2CrexmwUmeWHpmMmX
         W8Z++WWWWgOMEU/qc5mxgavDOxM4DrST1GOJr7S7k5pZHQTJXBrOOcRFX+ElfkoopS7/
         qQvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GQ8uMDlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si936225wrg.177.2021.09.14.07.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GQ8uMDlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9Wb-0004Bz-Kp
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MQ-00069s-E1
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MI-0005MV-BC
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso2706133wmc.1
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3EssKNnZXrh2nHfsbAL/+KnNzJUGLWYCayXBQqtwQg=;
 b=GQ8uMDlmNJBTj6EJqRMyXEgopIkmn/ONEFRtC5GMlb/Lzj0gauo6TLnjhq/xa9R+8a
 6rQSIqcQn3gX2LiosSJHoM33Uz8nlpM/zR8jNXdzQKbieuxYpfrt6oSX939cCLWq44vP
 LQx5e5Rie00rpbKGyoJlRUPA5MnI/x2jRqpwZfzkRIrtc9qt1rFhTmR0d6Dxfh3IDhPA
 pKKzc2s6J+vVNF1H8PSO0uRqAW/8peFROziZbDb9n8vZoFxLmGkjVrZESSvCw/tWlmxq
 z6BJSKAC4nKE6X8xxLZiHB7NRKhGnD8/a4DtMaU6aw8HY8XSweC7CVZ/3qzh3vcXrjU3
 DLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3EssKNnZXrh2nHfsbAL/+KnNzJUGLWYCayXBQqtwQg=;
 b=hLkwW8botf9pF8+TPEm6IYsS4zUNjMxabH2stkd4KFEPMKeSqUjqK2DAsPLcoHHDNh
 aPc22rvhlVhF5sjnytexp/p85apV9UJu7FPVGBEZjHVY1tePpL4IbeG36AHdct2jH2Ds
 ZHJPj7iLf2fZ5YFk99ejYLivptCQiELzO53wDps2vRWbxFX49StFy9uan9pJpjyWNY1+
 7mYSWuJU9C4KaWkHYU+lM5tnNpOzJWEWPVJMVypwZNfAH9ppEY+y0pw50o8nIwS/C9V3
 +6h2FR8reGGvxqtqkvON6uB73DilBrsJixDTafVmFPDKJgHzadYfhHRUX+zf8HLnvsfX
 KI8w==
X-Gm-Message-State: AOAM532HBKnbEPno8B7FivBVMUNx3WeOnqXMM58wxOoNAquy78L8QYO2
 zJ/jtMklHx2aJ7Rsep+TqcSOWg==
X-Received: by 2002:a1c:7f89:: with SMTP id a131mr2466926wmd.31.1631629464193; 
 Tue, 14 Sep 2021 07:24:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:23 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 03/10] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Tue, 14 Sep 2021 15:19:58 +0100
Message-Id: <20210914142004.2433568-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o3nYFD91gOc1

virtio-iommu is now supported with ACPI VIOT as well as device tree.
Remove the restriction that prevents from instantiating a virtio-iommu
device under ACPI.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c                | 10 ++--------
 hw/virtio/virtio-iommu-pci.c |  7 -------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73e9c6bb7c..f238766aa1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2547,16 +2547,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (device_is_dynamic_sysbus(mc, dev) ||
-       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
+        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
-    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
-        VirtMachineState *vms = VIRT_MACHINE(machine);
-
-        if (!vms->bootinfo.firmware_loaded || !virt_is_acpi_enabled(vms)) {
-            return HOTPLUG_HANDLER(machine);
-        }
-    }
     return NULL;
 }
 
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 770c286be7..f30eb16cbf 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
 
     if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
-        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
-
-        error_setg(errp,
-                   "%s machine fails to create iommu-map device tree bindings",
-                   mc->name);
         error_append_hint(errp,
                           "Check your machine implements a hotplug handler "
                           "for the virtio-iommu-pci device\n");
-        error_append_hint(errp, "Check the guest is booted without FW or with "
-                          "-no-acpi\n");
         return;
     }
     for (int i = 0; i < s->nb_reserved_regions; i++) {
-- 
2.33.0

