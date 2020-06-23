Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3941168lfm;
        Tue, 23 Jun 2020 02:37:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGnRKzDKzXGiWghj6tIPnIE/32eoTLnVm12rKbyL5+irSyco5ISp+llcn58LxhbMb0Ravi
X-Received: by 2002:a5b:b4c:: with SMTP id b12mr30780749ybr.433.1592905073832;
        Tue, 23 Jun 2020 02:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592905073; cv=none;
        d=google.com; s=arc-20160816;
        b=qkFYg+cfO+AVWRdcUQ5mdcSgQnzR2jzTvmGf7VMdHztk5LpvLpjFTAtBcWYDeNxpA6
         vXK7DUyw6XAQo/YHx1JflwKfIZxV+C42aIxj7L3bgPC1uaxoFFnnkjX2lex3768uKwCI
         3XIi17IaX0JwzBkkHopFPZrIs3n++uBdHy0V34Zy5/Fh0i3WTBvblJ4qPauyd87JvzIM
         O8s6o9EVH/GPYFTg3VB7/9FCfcEhvJkjj11d2NWYi6eKws+banqt4pRyc4fLcOtP7yiK
         BUwSELP7nWhS20nPfJ80Q/He/ai0Nmp227WKQr0QSF3gjSsDICpGTFjSU5hlIs8aHeuq
         d2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ntfAOaCI8FsWFg2XJLaPdm8Y+EgB6Ug4QecggYSwpuM=;
        b=VudjEtgUtyscn1tpykmIT5cb4mdpUOX3qK7Kp7vnKFhEAwV3GrKzp79UWA0T1YPsDg
         tzojLfALNx0EqxdVUwNZrXxkzr9fr6YCD9BISVVjYLag2FA7l0zpJYBmsWQ/Gc/q1eZc
         Nu1AH09nyw3FwYinrYzzC3CRwYUjyc/NxrjX0AfW9JtUurhfJ8nRHhuUZ6+HhiYx31Sh
         rf9icAgqWJQpmHGIOoQbQOMiRzT0XmNKfoLx5H4AS3O5JRsQmy10pfvpwo/+5Qmmjwua
         7BUsGwQ/NDX9mi70BMYGYYU+8/bbD9iU4lYzzRi3F9UfIF7mI+pDjCbiN0E3/P1jtQ++
         StvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GbI+4RZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si16676362ybf.378.2020.06.23.02.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 02:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GbI+4RZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnfNJ-0002Ai-5o
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 05:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnfJC-0003TP-F7
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 05:33:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52319
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnfJ9-0001c1-QW
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 05:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592904815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntfAOaCI8FsWFg2XJLaPdm8Y+EgB6Ug4QecggYSwpuM=;
 b=GbI+4RZ3xlTJbGkNsgZgTVVAGzvqErMRQk6mR2ZvoqwA2Jw58Ptfn89YiWrsPoPCbIzFMW
 T+Y+TtlHxlvT+R/53QyJ0QpqqMv0J3cZ+vX0/7Q0kuLn3hRNDs10cXZXKOKBGEzHgyrHUH
 BfR+kNbkyNtVRWkYzflW+ZYv+JXF5NQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-midXjykaO7WwtYoj8N6MgA-1; Tue, 23 Jun 2020 05:33:31 -0400
X-MC-Unique: midXjykaO7WwtYoj8N6MgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FFDF1005513;
 Tue, 23 Jun 2020 09:33:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAA1B19D7F;
 Tue, 23 Jun 2020 09:33:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v4 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
Date: Tue, 23 Jun 2020 11:32:44 +0200
Message-Id: <20200623093244.24931-6-eric.auger@redhat.com>
In-Reply-To: <20200623093244.24931-1-eric.auger@redhat.com>
References: <20200623093244.24931-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pbCo1Zrw83hL

At the moment the virtio-iommu translates MSI transactions.
This behavior is inherited from ARM SMMU. The virt machine
code knows where the guest MSI doorbells are so we can easily
declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
setting the guest will not map MSIs through the IOMMU and those
transactions will be simply bypassed.

Depending on which MSI controller is in use (ITS or GICV2M),
we declare either:
- the ITS interrupt translation space (ITS_base + 0x10000),
  containing the GITS_TRANSLATOR or
- The GICV2M single frame, containing the MSI_SETSP_NS register.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---
v3 -> v4:
- use ':' as separators

v2 -> v3:
- Add a new value to VirtMSIControllerType

v1 -> v2:
- Test which MSI controller is instantiated
- If GICV2M is in use, declare its doorbell as an MSI doorbell too
---
 include/hw/arm/virt.h |  7 +++++++
 hw/arm/virt.c         | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 31878ddc72..a18b6b397b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -96,6 +96,12 @@ typedef enum VirtIOMMUType {
     VIRT_IOMMU_VIRTIO,
 } VirtIOMMUType;
 
+typedef enum VirtMSIControllerType {
+    VIRT_MSI_CTRL_NONE,
+    VIRT_MSI_CTRL_GICV2M,
+    VIRT_MSI_CTRL_ITS,
+} VirtMSIControllerType;
+
 typedef enum VirtGICType {
     VIRT_GIC_VERSION_MAX,
     VIRT_GIC_VERSION_HOST,
@@ -136,6 +142,7 @@ typedef struct {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
     MemMapEntry *memmap;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index caceb1e4a0..75cf31fcba 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -602,6 +602,7 @@ static void create_its(VirtMachineState *vms)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_ITS].base);
 
     fdt_add_its_gic_node(vms);
+    vms->msi_controller = VIRT_MSI_CTRL_ITS;
 }
 
 static void create_v2m(VirtMachineState *vms)
@@ -622,6 +623,7 @@ static void create_v2m(VirtMachineState *vms)
     }
 
     fdt_add_v2m_gic_node(vms);
+    vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
 static void create_gic(VirtMachineState *vms)
@@ -2149,8 +2151,24 @@ out:
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* we declare a VIRTIO_IOMMU_RESV_MEM_T_MSI region */
+
+        if (vms->msi_controller == VIRT_MSI_CTRL_ITS) {
+            /* GITS_TRANSLATER page */
+            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+            qdev_prop_set_string(dev, "reserved-regions[0]",
+                                 "0x8090000:0x809FFFF:1");
+        } else if (vms->msi_controller == VIRT_MSI_CTRL_GICV2M) {
+            /* MSI_SETSPI_NS page */
+            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+            qdev_prop_set_string(dev, "reserved-regions[0]",
+                                 "0x8020000:0x8020FFF:1");
+        }
     }
 }
 
-- 
2.20.1

