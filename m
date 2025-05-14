Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1340885njb;
        Wed, 14 May 2025 10:08:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjhvQ86S+d3aSjOIB1G6fZQU0Tw81chcwMep61QIjay7dR9e+fIcfZ5tKSCDmUyxoeFDG5H5EUI5zPGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHt2MexgCkLrA7Jem6K8oyDM7rRaD4E9hkE58dT3fkNWNx9APIi65WeRLlSLQZfRkuBEh4L
X-Received: by 2002:a05:6102:2b9c:b0:4c1:924e:1a1d with SMTP id ada2fe7eead31-4df7dd9d49emr3865890137.18.1747242534846;
        Wed, 14 May 2025 10:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242534; cv=none;
        d=google.com; s=arc-20240605;
        b=dQYF05FT+BfHQlUaTUUJVZao8j/EGQAarResT3Ijp8UDz+4bQPDbdY06M1/tTMvog8
         FIz4L0ecy9s8GogAAAxR8pcU6HgJ7zDmBYwLIjPcoKlre8YvpgHNd6Rd5AF7q08f4hne
         Gf0gw6Y4kbINdVIwru4755KhxK3dBYHBdC3TfHcx7RMndyGxxs3T9iGp63ihdvAftKF/
         nYKWd5FPRn2hgukmnrH1bhUSsGjWYiBDBRro/v6RInLPCYlRNhWffhh13R2xIpdSrcL8
         YiqRDE33mUu3u9DbCUjaovPB/KFxJ8WK3WTogDsKaT4nTGltw9DFgTXU+01h4v4ZETyT
         hHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jaKSgM9rSL3nHTCO00OSVo2Bvk0AY2hNkbNnVpqcZvk=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=M4K9ApwMRd9ZIRheS3xSk9n7h6C2AzLN9AWRmU9seVthuUw+Digf+GjkTWZnAztNPp
         MpHrKy6KK0sutD3trbds5TGj4vwHEDWZfakL3CGaA2QUstCFVlCPYjoWxCgpH5k0sM3f
         vracRYFeFr6nK/Ds/4rA8Noe54rpDuG4fqhn6lk54HWer/4zndYTXfGiehH9vh5xpUrR
         3dzg31wDgCqQOxBatQRw47OSfYsywaYSO7P6vmdFE4J160slE3PwybZp7sTPCJjQu2Hp
         W1faSO7bjF7c153dU56ydLONNJF3jqeF4HDYe+7aoX+Su0KQEMGWxP4bWiKKnBQtc6cM
         /rEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="R8VK/utA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4deb200f1absi5259028137.436.2025.05.14.10.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="R8VK/utA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFFY5-0001vs-V9; Wed, 14 May 2025 13:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXt-0001rw-Rc
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXq-0007dX-Vm
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaKSgM9rSL3nHTCO00OSVo2Bvk0AY2hNkbNnVpqcZvk=;
 b=R8VK/utAh5i3med+h2rmiy3cMQJYsujIwuvoxCQB4iZw74yDhdLo1eMWmAakCwPK3aptSp
 yK4ap1QJSKyLnYN50CW4Us0jGPJWymGfHBpu2CRCZdTm8idsDNP2SilOYwH9l9jiNyLjTl
 tNWcRfTORV/R4Gpv9198tN6VVfCXvPo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-XPstQw65PXyPdilm99nTAA-1; Wed,
 14 May 2025 13:05:13 -0400
X-MC-Unique: XPstQw65PXyPdilm99nTAA-1
X-Mimecast-MFC-AGG-ID: XPstQw65PXyPdilm99nTAA_1747242311
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BABE1180045B; Wed, 14 May 2025 17:05:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 720F830001B0; Wed, 14 May 2025 17:05:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 06/22] hw/pci-host/gpex-acpi: Propagate hotplug type info from
 virt machine downto gpex
Date: Wed, 14 May 2025 19:00:53 +0200
Message-ID: <20250514170431.2786231-7-eric.auger@redhat.com>
In-Reply-To: <20250514170431.2786231-1-eric.auger@redhat.com>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qPdr3up+kotP

Propagate the type of pci hotplug mode downto the gpex
acpi code. In case machine acpi_pcihp is unset we configure
pci native hotplug on pci0. For expander bridges we keep
legacy pci native hotplug, as done on x86 q35.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 include/hw/pci-host/gpex.h | 1 +
 hw/arm/virt-acpi-build.c   | 1 +
 hw/pci-host/gpex-acpi.c    | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 84471533af..feaf827474 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -45,6 +45,7 @@ struct GPEXConfig {
     MemMapEntry pio;
     int         irq;
     PCIBus      *bus;
+    bool        pci_native_hotplug;
 };
 
 typedef struct GPEXIrq GPEXIrq;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7e8e0f0298..be5e00a56e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -129,6 +129,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         .ecam   = memmap[ecam_id],
         .irq    = irq,
         .bus    = vms->bus,
+        .pci_native_hotplug = !vms->acpi_pcihp,
     };
 
     if (vms->highmem_mmio) {
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 1aa2d12026..f1ab30f3d5 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -204,6 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             if (is_cxl) {
                 build_cxl_osc_method(dev);
             } else {
+                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
                 acpi_dsdt_add_host_bridge_methods(dev, true);
             }
 
@@ -279,7 +280,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
-    acpi_dsdt_add_host_bridge_methods(dev, true);
+    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
2.49.0

