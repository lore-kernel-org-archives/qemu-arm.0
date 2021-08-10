Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1115360lff;
        Tue, 10 Aug 2021 01:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa/Rdb4MHmtitNC1Rua2n4sOJzNLbEk9kpVQ1msQqJAh6ffPPN8/cO6QvgDw7to+OR1IvV
X-Received: by 2002:a05:6e02:1c08:: with SMTP id l8mr1029189ilh.134.1628585237016;
        Tue, 10 Aug 2021 01:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628585237; cv=none;
        d=google.com; s=arc-20160816;
        b=FIux/zBhiWRZFECeo4+PP7D2Y0MFzGqDNVOORdCnwKgDDoTqo+Bzy45j2OKqXuE0ZI
         i3YBTqUx/YBvePM4pnrM9gTm0FF9nvIfidba2Rrx7EusWMuhhCQWACkxM3OEs+zSSwbV
         GoqImv6T7BPpiyGLpwT12twaoGeS64ImpcT3wZ9EjO2Db1iogpavZSuEAABFX6lBfkzF
         RydINETMyTJzEEKQi52qeJxJXbUwgavtVr8eANohRJN1AdwG7A7dYr+ME6EfwsuvoGza
         IHT+0iPj5TIWD/geBJ20fhVzZzREV+lOwiRT/QfBEomOeNBx/jObDHp6h0S79I99a6mR
         CwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w0WrmTsj2crsjvUQBpyETk8wh1igNNKeXtR7nnjXX9k=;
        b=TCkcNyrMFQlrlyD2w/lNlKqUWClUxTZzHuc/i4TeaFZyWgsGWwUTLEsFUKUtkxAiIG
         5h+c/X5d5zkxL1UB1eVpPuWnLDW5O9FH1xAzHZ8xZSbkjJFQB7ASsey1wh6Qpf951oCC
         mD3Vb1aepevTkxfUs5aqvykHNUAQjssiW90IZllHx8pc8m9X5QWBH86zpyd/VWiaMQPm
         pdYvKnSQ7jWvBVBwK4TRVhbcmiLTW0cRQnB21l2G9TnPHlBPjFxngjqPImFW4jHyzj1s
         xuNi7sN+mFQV5lNKhQQBDZ0zUCBvd9WAc7hYTuXvBQKUYVCDd9xPuYLf6pQ7Jx6D+EnB
         3l8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GSU4LoJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si21320352jaq.90.2021.08.10.01.47.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 01:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GSU4LoJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDNPo-0007G3-92
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 04:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPL-0006Xf-EP
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:46:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPI-00084m-Rj
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:46:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id gs8so33949628ejc.13
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0WrmTsj2crsjvUQBpyETk8wh1igNNKeXtR7nnjXX9k=;
 b=GSU4LoJJbL9VyHHM3L22tON6TYOqHzdu9c4dpHA5Bi+yX/i1Ju/HZC22lZPEObqV9C
 vOVpk+BaFTRms839Of775KYjhOKZKhMEqwCij70r4B2Mlgpjid+xRAcHZ5BznolZuP9W
 Rb0yExz/vjGwRvprqgCJIu0w80Kn83UHjjnyc3+FHW+Kq+iq8E0dYZz5A4B8kMqoR0Wj
 BSSo1aN2yt+9dU3Q4sBuskHLozwxpd5SmXiQobkE0/wBW2oH0UjPBcZ7zrWJmpkn+YvQ
 NYWZmZ0MTb7cxQfS/Shb9fdLU0rjlwKjRY4vp7OkoCGpyJsGCElhu6HrWwmbEohHiU7A
 nHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0WrmTsj2crsjvUQBpyETk8wh1igNNKeXtR7nnjXX9k=;
 b=PgP/h3Dt5qsG9Hj0bRxoJWABKqmfczy4aYAfYxkRfVLi8EqC68YnWhOEcm3bhsrgun
 RVpxsaxgWbIkG3lnDOhCMqzNgUGYetkcmI7OFqa/b8L5/V4KvEV/aVeEN7ufKuNoV9sE
 BjCalb+tjq0YRUWzk5FsYqKtXbm4m1QVw4Hi/TaBBcKlXtv8dsDdYD+TXUn+aXNP6Y+f
 5nqzZuympARyEElUxGy8/pk9LcYIJzRNhCIoqdNup0fCwLvonILcosfkaXpIfng1ZU7a
 nQB5GUcC1epEk0eAdH2dn4aL8QegmZFzQDXvF/5ROIhbkXoIbrtG8o+yzEsehuqZbmui
 IpCA==
X-Gm-Message-State: AOAM532wVF3Djnp6DKvkazAqxEObxdR5/zuZ0ooGRZO7zacYJOHcsgfO
 OXlKzB1msqCvlzP+VRjSMJ62CQ==
X-Received: by 2002:a17:906:e0ce:: with SMTP id
 gl14mr26936247ejb.168.1628585203430; 
 Tue, 10 Aug 2021 01:46:43 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:43 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 4/6] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Tue, 10 Aug 2021 10:45:04 +0200
Message-Id: <20210810084505.2257983-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 2HfFXzvbaKsY

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
2.32.0

