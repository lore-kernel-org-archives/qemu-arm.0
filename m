Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788257dye;
        Fri, 27 Jun 2025 02:58:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmsT92OrpiFjcYUu//Ma8aPt3/5nz+oG8TwBbYFFGvJqEFERqzig4S51AxxqG7+4XvWrU8ypJwD3KmiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHgLJRKvnsjllWXV9wnKnxhNb2rMwZuLSo7Xbgussumkd5YoX4rOjYBmGzclcvf5JqKGCwh
X-Received: by 2002:ac8:5fcc:0:b0:4a7:f492:d0a2 with SMTP id d75a77b69052e-4a7fcbe18a7mr46702951cf.45.1751018312832;
        Fri, 27 Jun 2025 02:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018312; cv=none;
        d=google.com; s=arc-20240605;
        b=PZ1gS3Ipx/xi37i7HnSL6RFCy/6cVM05AIxLCsBacmPKgmU7pQg3/aEBw9LbYANgu4
         oUFy8Q3j8+P0U6H/BF+22y6ItBcqS94YMq2vEdBOd50IaSFAWVOr9Is2IoB3xifKiWb4
         XCp5be34+Njul6LCbwRls5DXQ5SEM7NL3H9b77W/kl17fF1Gp0N1dNu/U7urrBmYbAhL
         rEE20lStSGtgwmgc1apjCW5v3tHJ7u3Zg9K2XDgUHQ40Yegiw9SjRAmSJLASzVih71ev
         QPb9yJHrQ0gJYin2d739jlUfXYJWNOzIiHwOuAPxPfKHh/CyvwyF0ak8cbUadx5Js7jn
         0PwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=INQd+oWYSiEgiEW+cgsyMUd/aijNFRKTjcfY/Sb/Zdw=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=a1AKRCejzwJg5TIrjFOzrqNB+qX8WYhb3yqcGybKf0yEqcu5yPOqgMF+6I3RM2xpD0
         A1mGre1Zfc20blBto+7wcWjS1jhMmNb6g6K7h4mUgTKe0Ktlwx6haOALCSm2xTXku8va
         GkTZnZ4opg+vIiw91ekwMOhURgXC+QqhaeXzlkOdy5bayeBsgjr4CzS1dB7dzvVCI5PW
         FBqI+s9CqftW7M77bQUnv+/Yaj+bb71geEmOCCa6zs/VgW+N3jrcAvLKujnGxOeOSgea
         W/p8Jryz1oshHC5f9Am9pPj6w9RpHc1iAB2xd2J9qpEjKjfVtoPsAUT5NpmDAULd4lz1
         qrbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/ZzBxVQ";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc232a29si19159161cf.338.2025.06.27.02.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/ZzBxVQ";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INQd+oWYSiEgiEW+cgsyMUd/aijNFRKTjcfY/Sb/Zdw=;
	b=F/ZzBxVQ0zfqqHNRYgO/NarOu/NS/yoRlrt0W0PX/FayQLYTYXVivVjKOuhHJvUnKIGhRz
	c37FtK1RKHqPRYkCWj5vOb7JYLu7IqBtb50bba7CaOkDlI/22HTtxzLTkcQWle+ACIMCby
	fwf5lm95gNcjtzLX05jeGuQAEMxe8Cg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-SdWR_Jv5ORmlLPxlmnCEVA-1; Fri,
 27 Jun 2025 05:58:30 -0400
X-MC-Unique: SdWR_Jv5ORmlLPxlmnCEVA-1
X-Mimecast-MFC-AGG-ID: SdWR_Jv5ORmlLPxlmnCEVA_1751018309
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 859F41955EC6;
	Fri, 27 Jun 2025 09:58:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 190E219560A7;
	Fri, 27 Jun 2025 09:58:24 +0000 (UTC)
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
Subject: [PATCH v4 24/32] hw/acpi/pcihp: Remove root arg in acpi_pcihp_init
Date: Fri, 27 Jun 2025 11:55:13 +0200
Message-ID: <20250627095620.3300028-25-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: k8OHqRaYB5RG

Let pass the root bus to ich9 and piix4 through a property link
instead of through an argument passed to acpi_pcihp_init().

Also make sure the root bus is set at the entry of acpi_pcihp_init().

The rationale of that change is to be consistent with the forecoming ARM
implementation where the machine passes the root bus (steming from GPEX)
to the GED device through a link property.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/pcihp.h         | 2 +-
 hw/acpi/acpi-pci-hotplug-stub.c | 2 +-
 hw/acpi/ich9.c                  | 7 ++++++-
 hw/acpi/pcihp.c                 | 4 ++--
 hw/acpi/piix4.c                 | 5 ++++-
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 9ff548650b..ca6a258825 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -62,7 +62,7 @@ typedef struct AcpiPciHpState {
     bool use_acpi_root_pci_hotplug;
 } AcpiPciHpState;
 
-void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
+void acpi_pcihp_init(Object *owner, AcpiPciHpState *,
                      MemoryRegion *io, uint16_t io_base);
 
 bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus);
diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
index b7bc6e40a1..d58ea726a8 100644
--- a/hw/acpi/acpi-pci-hotplug-stub.c
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -4,7 +4,7 @@
 
 const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
-void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
+void acpi_pcihp_init(Object *owner, AcpiPciHpState *s,
                      MemoryRegion *address_space_io, uint16_t io_base)
 {
 }
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 967b67485e..2b3b493c01 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -322,9 +322,10 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm, qemu_irq sci_irq)
     }
 
     if (pm->acpi_pci_hotplug.use_acpi_hotplug_bridge) {
+        object_property_set_link(OBJECT(lpc_pci), "bus",
+                                 OBJECT(pci_get_bus(lpc_pci)), &error_abort);
         acpi_pcihp_init(OBJECT(lpc_pci),
                         &pm->acpi_pci_hotplug,
-                        pci_get_bus(lpc_pci),
                         pci_address_space_io(lpc_pci),
                         ACPI_PCIHP_ADDR_ICH9);
 
@@ -428,6 +429,10 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
+    object_property_add_link(obj, "bus", TYPE_PCI_BUS,
+                             (Object **)&pm->acpi_pci_hotplug.root,
+                             object_property_allow_set_link,
+                             OBJ_PROP_LINK_STRONG);
     object_property_add(obj, ACPI_PM_PROP_GPE0_BLK, "uint32",
                         ich9_pm_get_gpe0_blk,
                         NULL, NULL, pm);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 36492aa0d9..4ec72b9483 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -493,13 +493,13 @@ static const MemoryRegionOps acpi_pcihp_io_ops = {
     },
 };
 
-void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
+void acpi_pcihp_init(Object *owner, AcpiPciHpState *s,
                      MemoryRegion *io, uint16_t io_base)
 {
     s->io_len = ACPI_PCIHP_SIZE;
     s->io_base = io_base;
 
-    s->root = root_bus;
+    assert(s->root);
 
     memory_region_init_io(&s->io, owner, &acpi_pcihp_io_ops, s,
                           "acpi-pci-hotplug", s->io_len);
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index d98b80df6d..7a18f18dda 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -567,7 +567,8 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
 
     if (s->acpi_pci_hotplug.use_acpi_hotplug_bridge ||
         s->acpi_pci_hotplug.use_acpi_root_pci_hotplug) {
-        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
+        object_property_set_link(OBJECT(s), "bus", OBJECT(bus), &error_abort);
+        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, parent,
                         ACPI_PCIHP_ADDR_PIIX4);
         qbus_set_hotplug_handler(BUS(pci_get_bus(PCI_DEVICE(s))), OBJECT(s));
     }
@@ -611,6 +612,8 @@ static const Property piix4_pm_properties[] = {
                      acpi_pci_hotplug.use_acpi_hotplug_bridge, true),
     DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCI_ROOTHP, PIIX4PMState,
                      acpi_pci_hotplug.use_acpi_root_pci_hotplug, true),
+    DEFINE_PROP_LINK("bus", PIIX4PMState, acpi_pci_hotplug.root,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
-- 
2.49.0
