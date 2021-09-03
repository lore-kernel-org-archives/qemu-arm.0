Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1354299lfb;
        Fri, 3 Sep 2021 07:35:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+t7+8EGOWfm9fA7auYinH2k5k4Zj7wjDPqznLAFjZ7vJc4RhWP/lcGhACE3DruiwLvATB
X-Received: by 2002:a05:6000:1244:: with SMTP id j4mr4553922wrx.335.1630679741846;
        Fri, 03 Sep 2021 07:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630679741; cv=none;
        d=google.com; s=arc-20160816;
        b=edyrosN8CNXRNTlr2hJ4Oh7Ue9d/wjvETZHR63XFBY8r0Q/F3CjUOBQk5OnJn771Kq
         RpUoM8Tq/mrw6eY3eH4YssOJXWLEFchaKb5Pd4ZAPnRNRd7XY343KuMjNkQBmeXVg5DE
         8NfGuuZ9TwypiagVzci7vKuNavopOXwbM3lUHcZ1vnZrPFPyJWMyNIkdH6g960mhOaJe
         /RA+ErLjWxievJL7UcQQf3I6iyFrAKg8RRscROzM+y8vfQ9cpoF2Dr6ddTVibbDIKQlI
         N0k3pJACI1u8mPtWAEmJz3Db6IayVpOabqwGYwDvC5TKdRxE3DLmVVSjoMWKdxZhwJJe
         VfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eo54h4KkqnKKCP3+eSELsEpD4Rb9+IjUu6cLRetgdhQ=;
        b=r6AJeTWJdLyNJKCuQdFAy02IrAPzTWHJd+C0X5FlZJHqCOI10+tKpTZo9Gb60Nz3a7
         j2KMFjOpcBkiqs/Zd44zsQ42+yUP9e408/RIOuIaOa14cuXsOZuTfyHNgZSVU39sWy9V
         Zzqbc6ZhBDA8CZ0TX+Tp+cMCmZVrebDtcLeAED98BzW0JH/RxUih/m1SVP9wUvoSGLRM
         uoMMvu9mSdAH/Fg0ia76A9zVZIlW2j1KWwavQ3bBWRg2XL+1WTA3jWZF+aI05A+kv64P
         IM2sFb+rra9N5reSuJz+kflmFLStDKB+mRQrEgfKJ5Q0CIQcnLIaSNNt7xDAgMBxsEHb
         j9pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ScgXm3RE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f133si5302131wmf.197.2021.09.03.07.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ScgXm3RE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAI8-0002L7-TG
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFI-0004IP-8G
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFF-0005ds-Pz
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:43 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b10so8575987wru.0
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eo54h4KkqnKKCP3+eSELsEpD4Rb9+IjUu6cLRetgdhQ=;
 b=ScgXm3RESccpMpDfCMkTfu/IHJwp9dlW070uJ8iLHVbRvSdXp4cryVAFll4jU8a6R3
 DLOIW0gJQKjE4TShxEQUPHPX9ZBto9wW8XZZdWZb8HIZmnPasOoqaPZ7ZwrxpNY1F1r8
 rQSW9HKjic7Y41mSRv5Pm+o6nN6dy/4t1dsRHe5JKQo5zDt/eyCTRscOVRYhTKJE59/2
 Ep31GDVp6nczQnA8R5UFPCqFqR/clb92b5+bL3Bffr+KjJp4SAX83JyClJVh3dHCkLe1
 gZIJl2I7ICUAbNtyTcN40Linjxy91fOjOi5g+MJ5oCym4KckefZ7PYznusguQlOoSL8x
 hYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eo54h4KkqnKKCP3+eSELsEpD4Rb9+IjUu6cLRetgdhQ=;
 b=udc3pfavJONhexr9iM9CjZSNTKdrQCv5/s/cOga50WtLLGLAjXjGREChL0ZolLdUav
 0d+KKu6z8SrS8feCawsx7o+prNzMzhNaNwX5BgTE4uAw7I4y5c4Wb+wPkb4pBmTe5h7K
 32rXGsISfbt7r0AKCRzjxCtc+vlYfP7vqAXiuTrO6ms8krNtr2uyxCq5Ut+C52ocGZ23
 fLFCCubjsTzRftRIQWeMqh6BBtk2+tHO8iw/Ran7zcEIS6t2qxWBvLSKo7KdaLNNyKT2
 V7ryqVKa+4srmFZG/Tjk2ZY75MSQoU71DvKGQ2PglLcBXThQbMa0DKPD2bLaLQYMYAJz
 Kocw==
X-Gm-Message-State: AOAM530guu3H792Wl0aCsmR9PniOVKCkJDcKXP1uRnhpgVj2IWnDxDyr
 O3EQRUSp3cxVR3eSg4nZeqa8ow==
X-Received: by 2002:adf:e449:: with SMTP id t9mr4429438wrm.135.1630679560389; 
 Fri, 03 Sep 2021 07:32:40 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:39 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 4/8] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Fri,  3 Sep 2021 16:32:05 +0200
Message-Id: <20210903143208.2434284-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: JICP1LI8MmIW

virtio-iommu is now supported with ACPI VIOT as well as device tree.
Remove the restriction that prevents from instantiating a virtio-iommu
device under ACPI.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c                | 10 ++--------
 hw/virtio/virtio-iommu-pci.c |  7 -------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0b..b4598d3fe6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2551,16 +2551,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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

