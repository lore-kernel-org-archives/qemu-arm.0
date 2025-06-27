Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788395dye;
        Fri, 27 Jun 2025 02:59:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKuX4NzbI0voffXO+SLueL1s6cAwKsVfFQB86NYHhf7i8+6ECXh+Dezfny+zq/yfTxJ8jY5FEvJuZEMg==@linaro.org
X-Google-Smtp-Source: AGHT+IFuettv1xYK7StVOOvxgY0PEBXT6uZRNUx7Baq74qoZPPRZZkK79OL5APyz2i6L0qJ803J2
X-Received: by 2002:a05:622a:4b08:b0:4a7:6872:babd with SMTP id d75a77b69052e-4a804a88015mr258801cf.12.1751018340747;
        Fri, 27 Jun 2025 02:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018340; cv=none;
        d=google.com; s=arc-20240605;
        b=Kot351glg6ooH+UQG6XLQBmJXHikXbeVmzKl1rIYftgC3A0fT0yY9gq4DRwTaIBIG1
         Fp20kYB4hIHQPEo7NCe0wc7U6S/JTTmZuGwTWcWi36qPH7UbjggrRInHhK3DwXm4vpms
         2MbUbvvCD3jplIGGRIVeWLfjmXZnq9GkIdr03O9m+5FXjtDxBUgOJJgI5xUhgMFkxN+5
         CXEOoS6S1oUs1g0d8ZATD7HOeT3IMduE77Kzi5yXXk0c9ysxpmoH37b8x0vgO2P5iA8R
         ba3DPsXL64tBkVMQMLrjvtZPX4j2bsreUvRgzfsix+2FvOzP4Y/YaqpS0D/XUOgi4NFB
         fiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tRoRixwqTnZ7ojJEkTwJJJeBkcITPbZrpHGxpWdI9MA=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=JoJ3SUSy+Oo1+CH5ift22jL2u8Xol4CHqgql6+Dah/MwmOrshBX3JZ/A/1iHWKfnhS
         IOOuLoDUppt83Sh2Ep5W/AsjBRg2zw02+r5ZCLj8v4fJ1Y2i3YNJaupPkzZMv1S8e92I
         DWRR3bIUdZqZyJktBSi+VCXrJPU1vpGM4xZkGEWLeuWbOH7jILRyCpsLBwBraHcLtBvG
         xuhxvPG069RhupWoYs35EI/QrtT9YyD3/1sqnN08T6ts39/nGaiTX39FqJODnxiGFDqv
         Vu4mOr3C0aydMngjNxLxkpfB3fuX+3WOJg9mL0xcHhhWeHc2UjFO6IFlL7X2gxK+6KS/
         qYJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GoKNZBw5;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc100f51si20220241cf.66.2025.06.27.02.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GoKNZBw5;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRoRixwqTnZ7ojJEkTwJJJeBkcITPbZrpHGxpWdI9MA=;
	b=GoKNZBw5m1lfRX2nc9evATK7eS75nbNLV0Ip0QMYXL0vkFZPiQxeJTwNoT7WJvzLLNgKNv
	8cRj67XCrxsg7Mgt1FABEqqo1D3j9+FWc/cc8+hAoxN5mxNWHkznFtz0HMMXM5WhZ0Vams
	hP2K5o0QwX12IOjQ0fDImhGIUoIpw5w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-qVufnhvLMxevo8_iVlqo_A-1; Fri,
 27 Jun 2025 05:58:56 -0400
X-MC-Unique: qVufnhvLMxevo8_iVlqo_A-1
X-Mimecast-MFC-AGG-ID: qVufnhvLMxevo8_iVlqo_A_1751018335
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A8AB193F048;
	Fri, 27 Jun 2025 09:58:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A14819560AB;
	Fri, 27 Jun 2025 09:58:49 +0000 (UTC)
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
Subject: [PATCH v4 29/32] hw/arm/virt: Let virt support pci hotplug/unplug GED event
Date: Fri, 27 Jun 2025 11:55:18 +0200
Message-ID: <20250627095620.3300028-30-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: IUboBOj2IMwn

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
index 878c567354..d8706ef9c8 100644
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
