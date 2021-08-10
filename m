Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1115867lff;
        Tue, 10 Aug 2021 01:48:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYUHMpHUQ2fGLxhhVq3BqubCmtKwj4xOZTpAdI3aSoGGgT4dasg3kyDhXoff9twS8dNFRt
X-Received: by 2002:a02:6983:: with SMTP id e125mr25926217jac.112.1628585295547;
        Tue, 10 Aug 2021 01:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628585295; cv=none;
        d=google.com; s=arc-20160816;
        b=0YmdgRhmVBfGeIR88bLAFVLsbChWmHTeTwLXSTULongSZ91Zmm2VDhjAV4H7GifePo
         /ocOT/DRLRC+pkXu1XF5RCNEAEHCkppvOG4pQg+qD1tu/O/KmTIqSnZRRLcAJ7l194vY
         jTTD3vJuDS61CtnwW8dsmiNdi1DC9RzJdkMCLBo8YUsCUYqj/HgkMUdPkNzME1dRW0gb
         EU/RkEFW99cMRph/G7bNJlLo/b2y1CZXyjCxyc4xD6Jz2wEUA2Ss35Jnf4z2pGnq4XB+
         X6wa3k8X3xbnnsuaVFXZgFHRe4fSM+i/hHEFjWPmUTjfdNgozycCSVxtwvpEgKiwW118
         IygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lKy7vQ/+L1TPLeHZOFXY0eP2HbiclZAzdFbqfddm5Y4=;
        b=dgal4UBQYovlFTbH/Pi886XDwzE5uqtmdGKyPXTZ1s3JyJ9rSbJNbtI4Yj8dJhC04Y
         zj3lHco7+sGc3mZS4Bk6+QacSil3d3fD9SRQeA974T67qs4I8HfRgx5Z+knkMPLvQlU8
         mZZqbHLVRSZN0+rKM1Am7pAOr8krBJYpE9JRjQXcqicjIk0Q3zY0i8IASaYeAFkAr9gx
         RqJ8C+dBhWJMuueUw8KgW4MIZXX1RXJQnq4OOo9AmQwmqEijEtGJ8uk2a4VMWw8aF9HK
         OsVsdnG0ONj9MSd6lAgwnC718QaHzRI/XIUWEEKhCYCYTKmquiV4D2ebcsSo9wc0pkRY
         N8mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rd3WsHeu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si2328978ila.114.2021.08.10.01.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 01:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rd3WsHeu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDNQk-0000wF-Tc
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 04:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPL-0006ZF-Vj
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:48 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPJ-00085z-Lb
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id hs10so34116292ejc.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKy7vQ/+L1TPLeHZOFXY0eP2HbiclZAzdFbqfddm5Y4=;
 b=rd3WsHeuO1qx5IvNODbz1WmK5JsjMTy4OdiZSVrjdXOC3SBxbu0VTiGqxxwFBOOz1q
 lml4LomoTzRnbJIMWXeOOgzGHzP/00ozH1J6ZMv+Drl55NiaY7hZCAd2VxQMpQvBTwHf
 w+aBRnCSr4SY1HjjA4WlhklnUqyO97mLx1LqaHDZ5pmzejPX0AVgNHA0a4z8KUlLGA5O
 3bYHvfMnOmTPoAsflu8tIo3Ae/YmG32wt8+KSWlYZyepyhWvspebr0NfAn6u2D0Y+DWS
 LfL4YsFI8aMIr5AMuwc9WgSzAuSl90KZu7yC7YUKa5dizTE8maPkGDS87Xuncuuvi2JY
 SsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKy7vQ/+L1TPLeHZOFXY0eP2HbiclZAzdFbqfddm5Y4=;
 b=PXmAtRcm/1qg/Z4E0GU6wB7YGlHztlyHUQQ4fErmSviXvwyOfJSb3Vk0xEfD9MZ5cQ
 x4N0ktzYt4iSUm+4on7NfdlFUgg/e/JF0Gju8R1TzF8iCzw+T43L9i5Y1qXUY2f5ipB7
 uNGc3ekU+SWR7v7xHq9KXp25fRBpmtcQTsMEKb73EcsqAyxK9iIeFYqB6Ybhlhtrfa55
 hOK6MTPvH6QU69WevXppnpCXc22GA5ThrBs7G9afmT5CQW4KI+WuHwMqnlM8HsNJvWZp
 KJYYdo9Ncyd7bAMLLmbekk4WZI+pVTsqGTi+OqWyqSPpNFn8Mt9fwLfVx6N3eB42eD0p
 cvvA==
X-Gm-Message-State: AOAM533eej+fS4HG6rnddc7R1t6L5XhJndrA+rethEIvp0o0V7SA4TkI
 04WlCKZYo5obQN+60Sig49jaBg==
X-Received: by 2002:a17:907:98b9:: with SMTP id
 ju25mr26588005ejc.290.1628585204387; 
 Tue, 10 Aug 2021 01:46:44 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:43 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 5/6] pc: Add VIOT table for virtio-iommu
Date: Tue, 10 Aug 2021 10:45:05 +0200
Message-Id: <20210810084505.2257983-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8qN+7RK2XaLA

The ACPI Virtual I/O Translation table (VIOT) describes the relation
between a virtio-iommu and the endpoints it manages. When a virtio-iommu
device is instantiated, add a VIOT table.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/i386/pc.h | 2 ++
 hw/i386/acpi-build.c | 5 +++++
 hw/i386/pc.c         | 7 +++++++
 hw/i386/Kconfig      | 1 +
 4 files changed, 15 insertions(+)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe7517..979b8d0b7c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,8 @@ typedef struct PCMachineState {
     bool pit_enabled;
     bool hpet_enabled;
     bool default_bus_bypass_iommu;
+    bool virtio_iommu;
+    uint16_t virtio_iommu_bdf;
     uint64_t max_fw_size;
 
     /* NUMA information: */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e..078b7f5c6f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -71,6 +71,7 @@
 
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/viot.h"
 
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
@@ -2559,6 +2560,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
             build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
                            x86ms->oem_table_id);
         }
+    } else if (pcms->virtio_iommu) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(tables_blob, tables->linker, pcms->virtio_iommu_bdf,
+                   x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a35..694fc9ce07 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -84,6 +84,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/mem/memory-device.h"
@@ -1388,6 +1389,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+        PCIDevice *pdev = PCI_DEVICE(dev);
+
+        pcms->virtio_iommu = true;
+        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
     }
 }
 
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index ddedcef0b2..13db05d557 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -54,6 +54,7 @@ config PC_ACPI
     select ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
+    select ACPI_VIOT
     select SMBUS_EEPROM
     select PFLASH_CFI01
     depends on ACPI_SMBUS
-- 
2.32.0

