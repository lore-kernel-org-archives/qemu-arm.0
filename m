Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787776dye;
        Fri, 27 Jun 2025 02:57:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPsFm/TJnQ9Kiasm/X3Y8Abt1SHSq2H6ZELow/V0cFw49fDXEA89zzkcsM8tVCKyn9zMn+GXvFaF9Glw==@linaro.org
X-Google-Smtp-Source: AGHT+IF6AirTeLHuQUqlUbqbYYic/apWkZfZxVqdrsV0aVWo8m4WrxLR0kf7yqu1z2bB15bXlPrf
X-Received: by 2002:a17:90b:524c:b0:311:fde5:c4c2 with SMTP id 98e67ed59e1d1-318c9107c31mr3269664a91.1.1751018226536;
        Fri, 27 Jun 2025 02:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018226; cv=none;
        d=google.com; s=arc-20240605;
        b=Vz5qm8/rLJqLGR+fckjdkuII4zWlDS1qte0UOgw9AGrO/LUT8dmZGHh0uqCl1cyNXx
         cJa1EeZDeCiSQHVejCCF8bSGEWLuf1M793jzCM+Sc+14md/w3wPkbxdflhuKbB/ohiZ9
         jTSmuyBpGwyVahbPYcfT840vK1GILKGkTmfSaom9ZCDwwAVvY/ZQazdB7KA8GbXq7DOX
         f6p47UzPc76UqXW5+LUejuY6M/83RDg1A74njpD6Q6aEtG8DI53R803Rv5rkMx5S1Hwb
         5KuNwRzGU3oWvoo1SDtJTLGRprHP/4lFennfTWDMEAq2PLw6EwGzlA5MY5sSppuqthOK
         M1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BVBauhjAfa1MgdLoAK1AnZIiryc3UEaONwjgDAPygh4=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Shu/8ZdS/eDU+bQo0fAcWYB4LDNaipKTRyfeimD/a4YxparOYtVdsNUGoyija83CAo
         s8WTNvQjz3y0n48eS6rF1ji3t64zL6PcyqhPZocy8DWBUskjW9W5466Y0DDE/Gv7toKo
         YjXWObDKVKgJSCr/KPyBeTDow0IWDN5xjWWwDLO6VNnxFWKo/gMIjTHgEWBAZUlRfEBg
         aSRM8KHR047DBJL4HaqkQOCWBdtsoIqVg4TzkGG76HAy25fE1tn+PkiT+kA5KKIi7HFE
         wM2WUMzA5BV3jssbsfa6era512T70J5g+t1RU//VLc3uOwa3qf4OYRMIa7w0ck+IqVHq
         UwBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YeH3o42Q;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-315f54569b4si7656129a91.88.2025.06.27.02.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YeH3o42Q;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BVBauhjAfa1MgdLoAK1AnZIiryc3UEaONwjgDAPygh4=;
	b=YeH3o42QjyQY6ksNlfkDIC/TrBDrYvm/DkwRaIyoirt1ntuZ8s9a0j8VZHr2ijqTKqsHTF
	dtt7uwMDv3/bKgevxS+zSf3Ncdan3hdVBDZbq75MmK/Pu4HBand/QdpvxomKhs9vLJwBEK
	4bpu/zuWzxVvA1T9NfnMOSb0casosLU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-394-ShEHiLrNPNKYqgVGI9ugkw-1; Fri,
 27 Jun 2025 05:57:00 -0400
X-MC-Unique: ShEHiLrNPNKYqgVGI9ugkw-1
X-Mimecast-MFC-AGG-ID: ShEHiLrNPNKYqgVGI9ugkw_1751018219
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E5AE193F05B;
	Fri, 27 Jun 2025 09:56:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7EBD419560A7;
	Fri, 27 Jun 2025 09:56:54 +0000 (UTC)
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
Subject: [PATCH v4 06/32] hw/acpi/ged: Add a acpi-pci-hotplug-with-bridge-support property
Date: Fri, 27 Jun 2025 11:54:55 +0200
Message-ID: <20250627095620.3300028-7-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: itrvDR5AHJFd

A new boolean property is introduced. This will be used to turn
ACPI PCI hotplug support. By default it is unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
