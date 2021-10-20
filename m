Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1831502lfc;
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZLOXgE8TsOAummVjFgoLbz21KkAwIPhRwMGSmCxjTYPbfBx3FT99ASTA8NhyNBRuYt1Mi
X-Received: by 2002:a1f:c602:: with SMTP id w2mr826902vkf.26.1634751356487;
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634751356; cv=none;
        d=google.com; s=arc-20160816;
        b=Cx7dibGW/LdQg5t+CSA2fitd4h1CAx/lCjJSqO7T/cGjCOk1D/iPaIBfhvFeD5kFSO
         KJV50j4Nodch0H4SI1V6F0lk1NOMlPP6kb1jNc4Mz5b96KS61HtE11CHi2ULS/MtjSiu
         t+5T8oe0Pxqf03+D+s2q8z+qJbgkZ2HisJBAUIoGNLtJEIgRdNorjKIiCCNXWuaGdV3e
         qqlIuLUHM1Nj/YRPrwbfQPr7vKIwKK/MfOy7GoqTkq/UWrkJbbxFOsp8SyFhiGvXDwmO
         FXJvr1HPI0wtW25oEVzinyM9JvxbM85abI4dqkrqxDZ50ysYTLFoYL7KpurTW+H9/nYw
         SYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qeaTmZSDk/Gw7IgtRc4USWfswVE7NvHNqpapepv6UO4=;
        b=eWrQle+ca833qra67u3Apflgiq7UV/OnBcnj7au2eV6RYcH0iqmqHFYYKE+HPKBSs7
         OD7rtyCf1aGo0lD+QChjPfxq+NsLgTIJe0i86PNX2SaB6VILrvzlfGyJOJmrvVUE2pvV
         Upjh88oF/1IwyeEZLP7lgxi/T6haeb6WFTY/1BAq845/VGG9Wyw2mjoHdwvUzg3Szlc9
         1yTqoEgohw93UegDaKPhiq9UyBo/NPyQ0TTHkgZOJoDdXbhAZh5HudpopgdIXFSmeSt4
         fjNubGlrX9LNVrc1wH2u0UZ2GJ+YeCYoanZRy2xA56LLd7Yb79j12TLrVXx55hkF5CYo
         RkeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L2lvwXsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si2778344vsl.429.2021.10.20.10.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L2lvwXsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdFVL-0005fd-Mh
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 13:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUW-00052p-UI
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 13:35:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUT-0002Yk-KB
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 13:35:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id v17so48409596wrv.9
 for <qemu-arm@nongnu.org>; Wed, 20 Oct 2021 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qeaTmZSDk/Gw7IgtRc4USWfswVE7NvHNqpapepv6UO4=;
 b=L2lvwXsGp+FffPLBsPgpobooIKbidC+J2dOMz8A6yueX03txkArQmRqAPWl6riO/19
 qweE33iL6UCcpMXZ/HCxgpzTy0WwFaVtI0iTTbyBs28ytX5IUEHC9i4OTZctyJNF1QNu
 JysqX44fgmSAhxr+44bLZr1NGpWyRhcuWRNtkccNCKhQztzIEVP1VwFi1yADezeMCXD9
 ndg0H+hyRF9D17kX3GPu9+9TWHvhWXckYqmQQnlHDjoFG/tQInXfdAxHkOelheUpycD2
 I/cNzU0I4Qy6VM9kbZFwTzGc9QzxO58vJANkxMtrfjCGCRlDAd68VlbzOZfZr6QLwaEb
 /Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qeaTmZSDk/Gw7IgtRc4USWfswVE7NvHNqpapepv6UO4=;
 b=PnRrBJ46iCX+PI9O7JEtGWinxu6XRi7+7pQvPhcAY0kOPJLeyfhC5avltirgdsjXhq
 z0ieoGJv+PqMeWxNC6UD5KRkvXSuH0yDYdHgS0ICRXkIPYaLxniIFGHnbfou5eNs8V01
 EAW95emCpekwZ7037aLzLkJbpGNsPhcrW5iUnTGNT4HYVnb22UUpFbZRUYPQ1W4UG9oF
 qAXMM9hGLLxwrqT+ZMTb/pWKrF2dQtdA+KEl56MGNbVdkJf7unEiLXMIZcMu2QyhgmMv
 lrTnYZmedz1nqsFfucNilpakyCkeoBuV3nY0qqqOV7vw7oLawvyaGo5rHOcW5LNvGDQD
 cDWA==
X-Gm-Message-State: AOAM53262Wpz9Hpenv7BnAEnOiEw4WTJ1bpD8VMqB2VOtGBjS45FiMpm
 ikh3IN9v3EfJebwVhDv8j+iGww==
X-Received: by 2002:adf:97d0:: with SMTP id t16mr750146wrb.124.1634751300066; 
 Wed, 20 Oct 2021 10:35:00 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:34:59 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 03/12] hw/i386/pc: Move IOMMU singleton into PCMachineState
Date: Wed, 20 Oct 2021 18:27:37 +0100
Message-Id: <20211020172745.620101-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ETM9LPm68GTk

We're about to support a third vIOMMU for x86, virtio-iommu which
doesn't inherit X86IOMMUState. Move the IOMMU singleton into
PCMachineState, so it can be shared between all three vIOMMUs.

The x86_iommu_get_default() helper is still needed by KVM and IOAPIC to
fetch the default IRQ-remapping IOMMU. Since virtio-iommu doesn't
support IRQ remapping, this interface doesn't need to change for the
moment. We could later replace X86IOMMUState with an "IRQ remapping
IOMMU" interface if necessary.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/i386/pc.h |  1 +
 hw/i386/pc.c         | 12 +++++++++++-
 hw/i386/x86-iommu.c  | 26 ++++++++------------------
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 11426e26dc..b72e5bf9d1 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -35,6 +35,7 @@ typedef struct PCMachineState {
     I2CBus *smbus;
     PFlashCFI01 *flash[2];
     ISADevice *pcspk;
+    DeviceState *iommu;
 
     /* Configuration options: */
     uint64_t max_ram_below_4g;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 54e4c00dce..fcbf328e8d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1330,6 +1330,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
+        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+
+        if (pcms->iommu) {
+            error_setg(errp, "QEMU does not support multiple vIOMMUs "
+                       "for x86 yet.");
+            return;
+        }
+        pcms->iommu = dev;
     }
 }
 
@@ -1384,7 +1393,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
         return HOTPLUG_HANDLER(machine);
     }
 
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index dc968c7a53..01d11325a6 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -77,25 +77,17 @@ void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *msg_out)
     msg_out->data = msg.msi_data;
 }
 
-/* Default X86 IOMMU device */
-static X86IOMMUState *x86_iommu_default = NULL;
-
-static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
+X86IOMMUState *x86_iommu_get_default(void)
 {
-    assert(x86_iommu);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    PCMachineState *pcms =
+        PC_MACHINE(object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE));
 
-    if (x86_iommu_default) {
-        error_report("QEMU does not support multiple vIOMMUs "
-                     "for x86 yet.");
-        exit(1);
+    if (pcms &&
+        object_dynamic_cast(OBJECT(pcms->iommu), TYPE_X86_IOMMU_DEVICE)) {
+        return X86_IOMMU_DEVICE(pcms->iommu);
     }
-
-    x86_iommu_default = x86_iommu;
-}
-
-X86IOMMUState *x86_iommu_get_default(void)
-{
-    return x86_iommu_default;
+    return NULL;
 }
 
 static void x86_iommu_realize(DeviceState *dev, Error **errp)
@@ -131,8 +123,6 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
     if (x86_class->realize) {
         x86_class->realize(dev, errp);
     }
-
-    x86_iommu_set_default(X86_IOMMU_DEVICE(dev));
 }
 
 static Property x86_iommu_properties[] = {
-- 
2.33.0

