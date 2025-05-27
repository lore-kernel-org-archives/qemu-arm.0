Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647743njc;
        Tue, 27 May 2025 00:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZkrHitZqNy9LKWdkVEkkOYYxlqnThKxUAGYSlbSSUAcC5rKXh5Pu2hMAoQjUwTT3QvSdAk7ODVKlKqA==@linaro.org
X-Google-Smtp-Source: AGHT+IHX9/DQol/ASjc+JKok2hmdtm6kL475OA6QyHCO1yjRt6DnO2n1dsG1y2iSfpyPK6AnOqbr
X-Received: by 2002:ad4:5bad:0:b0:6f8:bfbf:5d47 with SMTP id 6a1803df08f44-6fa9d150327mr175360046d6.24.1748331788723;
        Tue, 27 May 2025 00:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331788; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+3ooyr6YurpGeQOjvB/G9M/+z9H8Cs3L6x8P83mdMDUdCzSrCC2/d1Lz/3xz0M4jb
         1q/n3yV6WqG9wERWU/vA1CGpLnmOQnFMl3q7mUDsd/XnjRvaz7IQOhMQqC72V5QfdiFq
         XekmXQIjzR94JJs4jVJpLk1BJHapKLjD7pyDCziZGKmhSnxhtHr8xJz/MjHeAopcQh1m
         ynJElOiYJC1h3Sx84JXls+LrmDoL3/L5dZr9rabYdEqJVXoyPKJT9rUkg1q//ALOGB83
         6nQp2fakjvetE7EIb6v0kwGdunWEstxHTMfGknw57kl+EoCbIUSXVpwF5nw52cJotsAt
         cIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jaKSgM9rSL3nHTCO00OSVo2Bvk0AY2hNkbNnVpqcZvk=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=C4KtOYC3ydwbFp3YX4/vUZY/t7ZL95cD/CUtogglxXvbSi1lP23ugq6A+VYV+xFOIr
         mT7KqwnrIkSdEJn/2qUL4/kPWHdLZTwNbmDjHfFmfhbHFLFSwV46yOPMWb/6dfowmKis
         xG+2HPOh/TuyAEa3K0W1O/r/75HgzKx/gv5nY+Y1ZzlpTU8DfmD3fLss0Ni7bKpRBeJH
         oWcXVhRiXxxgPidzhkW+IjyyIIcUbiA13tEQsKDeQjsQEspsgK16ewLTUtFhD+sad2aI
         mopA685DheE7uFCAtSbdCqIZvg6HtPZwxYLracgQUVi7R1Bsmqi6UFg9twyezr+4ipyr
         /Mqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYt2G9Lk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faa23f31f3si65038316d6.55.2025.05.27.00.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYt2G9Lk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaKSgM9rSL3nHTCO00OSVo2Bvk0AY2hNkbNnVpqcZvk=;
	b=MYt2G9LkSYmBe03msZTzjm2p9ur1qiCnPqC0hp8sVb79h9K9g5k6DZnwgL2GvMjbw++O7m
	ENzFXLTt10XP6bIkBIXjg1rbdBTFmNgxD//uLjiDek4x+G5gwupj3ASZZfomhOz7h+w7RR
	7F5dVieODJ1Uw+G/momYZziCBRta3d8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-QuBOibNqNMmOl77rco7r-A-1; Tue,
 27 May 2025 03:43:04 -0400
X-MC-Unique: QuBOibNqNMmOl77rco7r-A-1
X-Mimecast-MFC-AGG-ID: QuBOibNqNMmOl77rco7r-A_1748331783
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79CD41955E79;
	Tue, 27 May 2025 07:43:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1819C19560AA;
	Tue, 27 May 2025 07:42:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 06/25] hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine downto gpex
Date: Tue, 27 May 2025 09:40:08 +0200
Message-ID: <20250527074224.1197793-7-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: hN4tnyuxMXQj

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
