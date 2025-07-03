Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp507396dyc;
        Thu, 3 Jul 2025 05:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXajf3T26kL7crLbe4G+yuH8x6yGps78Tda55GtqntQiT7fRF8kYCNDXcP/bQvMKzF5YqyyYwFeKNz3wg==@linaro.org
X-Google-Smtp-Source: AGHT+IH+OLev0lLW12Ls9spzyE9W3BRCAT5dtEVZ8gMxhNkuSPDPLZB99vFgfIwd97u+1/wX/5bc
X-Received: by 2002:a05:620a:2b46:b0:7d3:ed4d:44ca with SMTP id af79cd13be357-7d5c4668720mr893096485a.2.1751546429622;
        Thu, 03 Jul 2025 05:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546429; cv=none;
        d=google.com; s=arc-20240605;
        b=V/tfgkc05Z5M7zqjWEbkm91WISTk1GKnzCsps/8Lqr5IBquPPidtddXoWRcU+RUICE
         XEcVum/nAnFEkUcjQ+pwpI/Z6qIYbbIzwxWIseXUIY/yvyVb87vuuHayA5XxAjMXQbai
         i9QDhxH+opmD9BantALznCQg2YABd2ESmbWywnEXwBhwGR82qzkB7R1KmxKVHJcIMyzt
         Myqth8F82tZH9Is2cWG0hw3JArPHYQMtL5Vv8ZV2eCXMPiqnUAx2GuA1qK74c+RH/rWi
         vIoAcx1hI33Fm7NUf+Eq6gkG62fT9Jy1IFfmtduSS1jkI7kyr5kIjbTaXdeYRICx1diM
         1Ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qOo0M/gBODBY/l4vKN4I8WgeRJue6j7oGCUoicYhs58=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=e0cb6UXzVvgmGYWC7YPISNO5cTAffVJmhWnU7RdaGiYtUjb5gqkW9Y2/ZgGsORZHHR
         2zrkSzpMk8UgJfTliEXcggJWDs7TB3LpfoaBBT0DQKf3afvrxsbGdijVlTnNCkjW8CL4
         wPuCuHNOR1ZDYchRDcREnbjZs6YEwyV6ST6eOmPh2P8OD88++iRsuSBg9rangwqpisFy
         9NZRL+REdVAY0COoB/iMNBy9sCCdVqel+eRomhA0C14hCnVY9KP4KZ7PNy9hZ/QWC/Up
         QqcbanChNpMezm7EoaHaIET2/8rIWyoj67drzmYEBCUlQOif8kdM2F5+3/ydiffUZoHI
         LC3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6ac9a1b;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc24ed7esi157591331cf.429.2025.07.03.05.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6ac9a1b;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOo0M/gBODBY/l4vKN4I8WgeRJue6j7oGCUoicYhs58=;
	b=A6ac9a1b/TxBBy6+fO63hIfcdoOTk4Q1qF25mMN7XM8PX3kUKm5kt8uzsVvkg9CzZ6wztx
	ZhP+ympsBb9eUxEfI20KLGYR06V8+6B4ZnGtve2Xw5ddAqrIcXdjZr+9+nm67OLXr/R1W/
	8wjYba7bfQsXBdgUAPV1dbYMNAG1HPg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-YacpWBbyMqKWyBI4UfuuqA-1; Thu,
 03 Jul 2025 08:40:25 -0400
X-MC-Unique: YacpWBbyMqKWyBI4UfuuqA-1
X-Mimecast-MFC-AGG-ID: YacpWBbyMqKWyBI4UfuuqA_1751546424
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 47F6A19560A2;
	Thu,  3 Jul 2025 12:40:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C73EE180045C;
	Thu,  3 Jul 2025 12:40:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 32/36] hw/arm/virt: Let virt support pci hotplug/unplug GED event
Date: Thu,  3 Jul 2025 14:35:32 +0200
Message-ID: <20250703123728.414386-33-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: iv36XyzFB1pr

Set up the IO registers used to communicate between QEMU
and ACPI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v2 -> v3:
- remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
- use sysbus_mmio_map_name for all regs (Igor)
- create_pcie left at its original place

v1 -> v2:
- use ACPI_PCIHP_REGION_NAME
---
 hw/arm/virt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7b247ad30c..4f6fe16675 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -686,6 +686,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     SysBusDevice *sbdev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    bool acpi_pcihp;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -704,6 +705,18 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
     sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
                          vms->memmap[VIRT_PCDIMM_ACPI].base);
+
+    acpi_pcihp = object_property_get_bool(OBJECT(dev),
+                                          ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, NULL);
+
+    if (acpi_pcihp) {
+        int pcihp_region_index;
+
+        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
+                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
+        assert(pcihp_region_index >= 0);
+    }
+
     sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
-- 
2.49.0
