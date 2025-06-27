Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788175dye;
        Fri, 27 Jun 2025 02:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRkyZVug/hnYiOJ/raYBzWMQCv0pIgXmwihSX2IMss3pfNUNcCWRoLdw4qGlhj9pnket4yqUqtqspxlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEash2bHbs0ASmRmEgnOnyrU8KOu2WDQSh3HdEqKuTaTOFPwzS77rDVdWbY3noOzG3eFipz
X-Received: by 2002:ac8:5e91:0:b0:4a4:41a1:b944 with SMTP id d75a77b69052e-4a804094188mr2666901cf.1.1751018299432;
        Fri, 27 Jun 2025 02:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018299; cv=none;
        d=google.com; s=arc-20240605;
        b=BaeVq6zs2lTOjyj5BBhjZc0U4BeaetLT7U/oU/Y8m6VZpi9Sm+rFRFoJ4ezejDpPFt
         0nMuTxUGbd3/HU15gKKmiu6LSn4PnN02eR0xIbYiLmfarbtUAJ1HGu3tAVbdC6CVRV/t
         PacAnFS/J95fJu29/2gKX+qG81qpFnt5J6dsxEEEa2hVWMObs4PNU7f/7JZIcZMxoR3k
         v/JYbkwxO+oD+xxChEXlk9wdwU2OpuE67TDztoOn1hppQT6uABaOG/TkKgjgof+RAx3+
         kNxF04Q3kVz3E4tusx6PcTOfrEpqIqBNaFfsoT0FzA7KKlpszuYL0awW02n4nlmA/roq
         l9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gui6+S19PIPTP0HqJYWTL54xHSgeFPP1n+ZMQjEgGiQ=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=lg2P063b4Z6e54GWWfNlO7sfEZGG098eGy2uVoymJaT6jfUTCFvxjraCyMKaW2D+Fl
         1bhE8kreA9xzxULNAI167xok3HG/0w7uRpIsVOh4wHpVLgqtKoFOiI65cjcHgE7uSCq8
         U6ELdMG3CYHb9Ic/Oe6olYPHLyjcZgqY7BpPuJdXl+7uuZk4kOsMojJVCJuzTTaw4+IS
         QTqkIXbU1zIsySG5HP4RnIstEMZjNWgkykj2MM6ariylUuMiSuHUNLm+oMPR0qt/qm7r
         7G9OZaPozS7WBHX6XCg2BDEe8BrRnnFfdCK0gHQnvx0Rr08dx4vbVyYWOLIuQldOKcTs
         TMXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KH9oCrN+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc553288si19643311cf.470.2025.06.27.02.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KH9oCrN+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gui6+S19PIPTP0HqJYWTL54xHSgeFPP1n+ZMQjEgGiQ=;
	b=KH9oCrN+e8W5iy5H/FSFRVMPdev+OVxNNebvV3++KbCCreLNWIYlIzMTM6P1zCPFceSRsM
	3D56M8wW+RAAC1Ow0BeeKeZc9Aa/zHW+xmpK8lDH5zAgi3aivEoGH7RK+oKP3FeRvyShZA
	E7PBTB9EUNJ/kYxS/hhxjvRV4ZpTZjo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-KD0NEugGNzWofuVKvw55Og-1; Fri,
 27 Jun 2025 05:58:15 -0400
X-MC-Unique: KD0NEugGNzWofuVKvw55Og-1
X-Mimecast-MFC-AGG-ID: KD0NEugGNzWofuVKvw55Og_1751018294
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F01591809CB8;
	Fri, 27 Jun 2025 09:58:13 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 974E019560A7;
	Fri, 27 Jun 2025 09:58:09 +0000 (UTC)
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
Subject: [PATCH v4 21/32] hw/acpi/ged: Add a bus link property
Date: Fri, 27 Jun 2025 11:55:10 +0200
Message-ID: <20250627095620.3300028-22-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: jtzaZ8T1dZ/R

This property will be set by the machine code on the object
creation. It will be used by acpi pcihp hotplug code.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/acpi/generic_event_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 7831db412b..ef1c1ec51f 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -13,6 +13,7 @@
 #include "qapi/error.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/pci/pci.h"
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
@@ -320,6 +321,8 @@ static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
     DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, AcpiGedState,
                      pcihp_state.use_acpi_hotplug_bridge, 0),
+    DEFINE_PROP_LINK("bus", AcpiGedState, pcihp_state.root,
+                     TYPE_PCI_BUS, PCIBus *),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
-- 
2.49.0
