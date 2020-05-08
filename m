Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp347657lfb;
        Fri, 8 May 2020 10:32:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypIo/KLcbwBKvD3fDO8Rhp/G4Dmwc+Lq1AOUuwBW9iFK1L+db8WiQ4Mzk67aNIpQQCs2/Lld
X-Received: by 2002:ac8:2c66:: with SMTP id e35mr4390889qta.188.1588959129701;
        Fri, 08 May 2020 10:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588959129; cv=none;
        d=google.com; s=arc-20160816;
        b=EmMmubLF5Nx1/CKJtN98XdtWxuP0aGP97xuMLxZfXmkfevAYZ0kj8ymKmTZnGhyriv
         52k3mL3rzym+iHG0RssjjBEofKzdAjI+mg07hF6Ai3DITi3xtJH/ZkkwRuxZcd/20OHU
         BmmRFJ7LVU+lxXBlout5jibbLSIEfcGm1FkMylz1xhEkqnH5LjJNyY90heDmuB7xr7ah
         BwbfRq/A6PnmC2X+S8Q3jZ2igBFnASRWAnv3qLQ9OcFp8FCLJq5M/XfyuEQQx5t2UAkw
         Q+MP9m9Xnd4dCzOE9e3QPvVpgEg/7gj73jDODfAE2txH/mpTHoqinQSNdP5uR2vvlN2D
         JtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0HdpDI/z5PKyCmTC+zEQIudctfStswUUOv3BH8YChdA=;
        b=OsD1OTMdTWg5uQPbGBNHVjSp4F5Qk7KS+eLHfIM0qlzpulXj696FRI0gOF/HbhFd+P
         T0SBiVTeisu/eO6sffRCKZRiniKDmz8PDUFCeBO7pQd/0yUWn+chR38BPHTzGAIwpNir
         Goec+SpfsL5hHZq5dQ312mcfVoVklXUyESGhLdRBq8qcf8aBPyQKamYmvmcaSMby2ZBT
         W2I6kH4dlqvgjyZ7Be0I8omaE43gXDcp/kTEPqvtjvdnCuO7XAkoKVcSFbO2GImi0UOG
         GqyVPaOVPd/0DUYkJnJ0IDhAo//aFKgQ0feXOi87VWG0xrClARGeBn4BZoNjIyGad6K6
         A30w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CPm/ZsOw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si1518769qvl.50.2020.05.08.10.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 10:32:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CPm/ZsOw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX6r3-0000C4-49
	for alex.bennee@linaro.org; Fri, 08 May 2020 13:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jX6qc-00009C-MZ
 for qemu-arm@nongnu.org; Fri, 08 May 2020 13:31:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22423
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jX6qb-0007oP-UI
 for qemu-arm@nongnu.org; Fri, 08 May 2020 13:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588959101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HdpDI/z5PKyCmTC+zEQIudctfStswUUOv3BH8YChdA=;
 b=CPm/ZsOw7Oud7+WLMEA5ZWY9dFlqz9EK3XKRZfFYLjCC6CWzJNPG8oK4afizN45vNGlv4d
 bbxRJUrYmHfazJa5iQ1evWdgvDewm6vc1pIp42Ohb2D0CSYXph3jaJEBIc9SIWRqVBNDFq
 F3CXipFCg4E5kytoaOnDNz4w95LxPDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-5aWOrVD1P3-nq5yGkiEcHw-1; Fri, 08 May 2020 13:31:39 -0400
X-MC-Unique: 5aWOrVD1P3-nq5yGkiEcHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32F1B107ACCD;
 Fri,  8 May 2020 17:31:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F66B61989;
 Fri,  8 May 2020 17:31:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, bbhushan2@marvell.com, peterx@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
Date: Fri,  8 May 2020 19:30:57 +0200
Message-Id: <20200508173057.32215-6-eric.auger@redhat.com>
In-Reply-To: <20200508173057.32215-1-eric.auger@redhat.com>
References: <20200508173057.32215-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 01:34:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: fdN+LCnQseuV

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

---

v1 -> v2:
- Test which MSI controller is instantiated
- If GICV2M is in use, declare its doorbell as an MSI doorbell too
---
 include/hw/arm/virt.h |  6 ++++++
 hw/arm/virt.c         | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6d67ace76e..ad20cb6e15 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -96,6 +96,11 @@ typedef enum VirtIOMMUType {
     VIRT_IOMMU_VIRTIO,
 } VirtIOMMUType;
 
+typedef enum VirtMSIControllerType {
+    VIRT_GICV2M,
+    VIRT_ITS,
+} VirtMSIControllerType;
+
 typedef enum VirtGICType {
     VIRT_GIC_VERSION_MAX,
     VIRT_GIC_VERSION_HOST,
@@ -135,6 +140,7 @@ typedef struct {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
     MemMapEntry *memmap;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 634db0cfe9..d2dd07885b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -602,6 +602,7 @@ static void create_its(VirtMachineState *vms)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_ITS].base);
 
     fdt_add_its_gic_node(vms);
+    vms->msi_controller = VIRT_ITS;
 }
 
 static void create_v2m(VirtMachineState *vms)
@@ -622,6 +623,7 @@ static void create_v2m(VirtMachineState *vms)
     }
 
     fdt_add_v2m_gic_node(vms);
+    vms->msi_controller = VIRT_GICV2M;
 }
 
 static void create_gic(VirtMachineState *vms)
@@ -2136,8 +2138,24 @@ out:
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
+        if (vms->msi_controller == VIRT_ITS) {
+            /* GITS_TRANSLATER page */
+            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+            qdev_prop_set_string(dev, "reserved-regions[0]",
+                                 "0x8090000, 0x809FFFF, 1");
+        } else if (vms->msi_controller == VIRT_GICV2M) {
+            /* MSI_SETSPI_NS page */
+            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+            qdev_prop_set_string(dev, "reserved-regions[0]",
+                                 "0x8020000, 0x8020FFF, 1");
+        }
     }
 }
 
-- 
2.20.1

