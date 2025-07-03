Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506296dyc;
        Thu, 3 Jul 2025 05:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXf2PoWsNdsIT2Y0HV78KCMM6GhMEeHg7arKdv5Y4ke0Kgkd8IgAQFz3v9fD1rGefu3SuYD0ZfDsMDAXw==@linaro.org
X-Google-Smtp-Source: AGHT+IGCkFMtlJPq0kqkDUt0gjuhlS5UXjnbAy5slyQTtcAp8V6dDBV8Sb1YQLiYj8UuiPln74l4
X-Received: by 2002:a05:620a:4148:b0:7d4:6784:beb with SMTP id af79cd13be357-7d5c4711ea1mr1080467785a.4.1751546404356;
        Thu, 03 Jul 2025 05:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546404; cv=none;
        d=google.com; s=arc-20240605;
        b=V0ympXBajC7MPtyvz0GcCkJUkG7ifPMFUY07bKBkezoiQLsqSdxxAleDSda/2olIkx
         on/ExM7iV3/qi0D0w72GA6gtGjYKcIRaAUIQM8bwK5brXYkfhua76JDXTvl6DW0tq+9c
         /NMCC+qPdnlpO9Hj+czfv+xxH9H9C5yM+Gu08DFNdj8yTfYhChaSwdG2IpoeqqVw0wlz
         1f4dUy1ndSytfLBRyVUHMPUbPR+6E4Rb/5bXaD12DP6YN2CHeIB7sMbCaRk+R1OF7CfD
         LOQqEWrMXHhTZjuV959MqsV8Sj2t/PbzklXp0irsOfq0ZP/eUOs/TOfvER0R+qWMmsEL
         WXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qykNbq9Z1KR/RSUyv3WPhqM899KG4p1hewVkFgNUlDM=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=kK/a/bfftHoVaFT1csqjM4FobFC0EKJ+PCfZw/Kt0Yn6f/HVlxLGtWxzxygQSRPfl2
         rws/epxcfl9FUX757iOYTZsQE+fRczEZphT0NbCqLmBaCNZjA/AuLKY9KmyVAeDyDR6s
         LHdU1e6QhEf6jNS18zULs8azt46i6Rj2kZdSizVFKP+P9J1QkPOYxSjAOBHPClrbR8at
         D83cHG2ULl8yt19UDYf0lFqaVcnaekf4XzoAO3Qw5c5ArQI8r+HOlmLd/mLIEb8QGVPz
         ZeVvUFOtbeefgLFbaXOp5EX6qKmEiU4REQwfKlXjMLHfYZ6jhvekvlNsafA7ZgZg59kO
         JBlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSXfLyI6;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443193e10si1406161385a.60.2025.07.03.05.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSXfLyI6;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qykNbq9Z1KR/RSUyv3WPhqM899KG4p1hewVkFgNUlDM=;
	b=FSXfLyI6cTSaKDAxpVW/DHM3/VDTAqUrls0RY+3ZyqIxz+Kt8idAj2uxiSccEoeULacTzZ
	a9YtsJzhqFDgdJkOWVnrwzq4EKMap7ggEbqxUVYc8+D04d+e+IsVO2KBpr3huhvkAbdb09
	nJZwrDAiRYuakuhlkZ/cMxc4EBYBEF4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-0qgx4O3_Op6RVLD_Q77E_A-1; Thu,
 03 Jul 2025 08:40:00 -0400
X-MC-Unique: 0qgx4O3_Op6RVLD_Q77E_A-1
X-Mimecast-MFC-AGG-ID: 0qgx4O3_Op6RVLD_Q77E_A_1751546398
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0644180121B;
	Thu,  3 Jul 2025 12:39:58 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2857318046C3;
	Thu,  3 Jul 2025 12:39:52 +0000 (UTC)
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
Subject: [PATCH v5 27/36] hw/acpi/pcihp: Remove root arg in acpi_pcihp_init
Date: Thu,  3 Jul 2025 14:35:27 +0200
Message-ID: <20250703123728.414386-28-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: 8+E/zsHh7sam

Let pass the root bus to ich9 and piix4 through a property link
instead of through an argument passed to acpi_pcihp_init().

Also make sure the root bus is set at the entry of acpi_pcihp_init().

The rationale of that change is to be consistent with the forecoming ARM
implementation where the machine passes the root bus (steming from GPEX)
to the GED device through a link property.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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
index f1594e664a..4922bbc778 100644
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
