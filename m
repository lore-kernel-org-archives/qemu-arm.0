Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1740767njc;
        Mon, 16 Jun 2025 02:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPeWPBU2qaJ6mZCsy7se9JXEiHLmdVIV9/VtvBNJyAuLRszAFoHbtcMf1/iRkSxiUEq1cKRyMC1KJJgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEOFP0/Hvw8Lk3QfIPmjmTDo6vwLtrkEG2Q+VYPdmmOtnZoyIadIe570Brz/qZzVymkzM5J
X-Received: by 2002:ac8:7f01:0:b0:4a7:1447:f07 with SMTP id d75a77b69052e-4a73c4dc2bcmr143272661cf.14.1750067369894;
        Mon, 16 Jun 2025 02:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067369; cv=none;
        d=google.com; s=arc-20240605;
        b=NDGu88B25La9wVEUZECMwWAjiwgEuxtrQq8fXw7/9ohpdREtzD6qXLtZ6YcJZLZd/5
         TWy6VA1Rj4kMzljj7SMbylWX/GvG2Iz41n2JmhMaB3VZmUsqYy2eqN8Q7N/dmWF1ppW9
         ArPjCXun7/mo0oCJVkZGi7OwWyL+Jubp1O8x8kZgaMWwQCXjN/qS/Bak/kvrYXThDiQu
         2PdvQBQCWJdlLbzkEIiVfO3uoZkt34qRnK+neszKjGG6wfRbeV/KlHjUayqDW6Vxuv/h
         yMc6TlZgS8KM89bcG2qH+9zQFkxMM2qZFb6H+/8A0WUf/V6ONvdVXSmX6OWmdXXFjr0g
         9Wzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sq2EBzvdEtw4LUpJJ6fxloV21QmH7/1NcGjyty7YAiY=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=DAgX4qRkD7Y5gBGNg0ZnLOMGfOAOKi7812lRafmSNGgBY2qnVD4D5LO/lzqJl+ITK6
         HNmylzjrLBKSfqGsOgAwoIbiZ4iyaqYJZx1F26xqhyfxBZ8QD6D6Er1ed7YLIFa/r2hu
         84edu4Np6n/eEGU2jtSw60/KoISPTPfFqLj0G998RsY2YDyauuO+JSzBzCJpU/AsLDsD
         jYBYDVb0ClxSvU2QsjdXOdhrefJ9kdYignDCBBY0nU2BxP1OWG4ZcLmFjXeN2l1NDmBi
         xfhvRBiKKBAvhMR3+lF00UHnoRs65007LmnB2XooVudqlqSI3fLU+fTzeorxZVj0dqKK
         ITAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wvwuhnx6;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b9081si93075661cf.50.2025.06.16.02.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wvwuhnx6;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sq2EBzvdEtw4LUpJJ6fxloV21QmH7/1NcGjyty7YAiY=;
	b=Wvwuhnx6F64l+b9r+2BaIHjswe1VlURnxEcGtzClAiXad0iSCovlCXoxLDTJ1lK/2zPTgE
	yZsHRg+sz8lAdq9PocvtumIsp0CYIdsUVSfyIOYDtnF8TNwrV92xQX6yCw0oxIF1yPrNS/
	aERBgzvI6cyfYLnAOIuzMrCO48uKPTU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-KIZzgZhaOu6VJIWV1QuNAA-1; Mon,
 16 Jun 2025 05:49:27 -0400
X-MC-Unique: KIZzgZhaOu6VJIWV1QuNAA-1
X-Mimecast-MFC-AGG-ID: KIZzgZhaOu6VJIWV1QuNAA_1750067365
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 793541956089;
	Mon, 16 Jun 2025 09:49:25 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9104019560A3;
	Mon, 16 Jun 2025 09:49:20 +0000 (UTC)
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
Subject: [PATCH v3 02/29] hw/acpi/ged: Add a acpi-pci-hotplug-with-bridge-support property
Date: Mon, 16 Jun 2025 11:46:31 +0200
Message-ID: <20250616094903.885753-3-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: tLbSD9PXR5Eb

A new boolean property is introduced. This will be used to turn
ACPI PCI hotplug support. By default it is unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/generic_event_device.h | 2 ++
 hw/acpi/generic_event_device.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d2dac87b4a..f5ffa67a39 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -63,6 +63,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/pcihp.h"
 #include "qom/object.h"
 
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -114,6 +115,7 @@ struct AcpiGedState {
     MemoryRegion container_memhp;
     CPUHotplugState cpuhp_state;
     MemoryRegion container_cpuhp;
+    AcpiPciHpState pcihp_state;
     GEDState ged_state;
     uint32_t ged_event_bitmap;
     qemu_irq irq;
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 7a62f8d5bc..7831db412b 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, AcpiGedState,
+                     pcihp_state.use_acpi_hotplug_bridge, 0),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
-- 
2.49.0
