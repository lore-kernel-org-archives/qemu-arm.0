Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506143dyc;
        Thu, 3 Jul 2025 05:39:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsEqQiXDAMxUft4Ezx7mUOS4X9WAkKthltPdl2ugXN8z/AMK0EVrgTejQ+oGkYPbDXFw4g9LF7LqtGPA==@linaro.org
X-Google-Smtp-Source: AGHT+IHFMR8tAUl01nj5dJuH4jKLsBSy5TMzuaULbfq9jug4j3BHzpFS8HDN88Y8tjwP1SBkEUWk
X-Received: by 2002:a05:620a:400e:b0:7d3:db71:1239 with SMTP id af79cd13be357-7d5d14a695cmr582573385a.54.1751546385517;
        Thu, 03 Jul 2025 05:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546385; cv=none;
        d=google.com; s=arc-20240605;
        b=HBY4jprqhyDo7gig3+iKgi4lAfShKGS+7OHkVjMaQsLR7PsT+k9g9hE+n1ofvDg4R6
         pABJymtCT7GqTpQuOncB4WP+rEwKa17NZu4Ph6ZzATQnyxtZelRKli4OE5VLO2lOi/u+
         f8xs5IlBuBcm8G4V/V/RORkT6mYtJuQHoafPdfc9ySddR3zXDcSHbl6uHS6+HrcbX4+e
         hjqPvcI1EInR4bQD8V59ZcE3W0NKfE14MuAQKt6H438vc7YIfnZkf55HaX7FR+KGmygj
         VZ1l7sPorn95GHD8MSLzJXFBDX04aqCKDmlVl42ZL8oxYJfjGgxw8khrNNyqjyF9Cur7
         mLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gui6+S19PIPTP0HqJYWTL54xHSgeFPP1n+ZMQjEgGiQ=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=gwxqrQN58YkHWTcePrp2jiBMiEpQNAraXH5KN+DNa6MA98oFk+UIW1+uoTrO+/Fzzu
         LYGRzlu9P3yTr9SANXICLDV7LpgfVaW0DGOpHHueMFcfPOvTU28pOxc+CKpzrVSBPTDv
         U5Khjod9qFBGMthvsiGNgLMHofnwRVtjnnrKuIZV40+kOTe+/jXn2BqRbr8A2nrmnT5W
         widhsYfkoyn/009xIKgZ3q93MBrjuFr6qjsEVU6jSwTeuO/QBh4CligKzTRmch4qQiEB
         /3IVSWl2VaoH7XoyvTIRTTb89+uqHIjc8z/nHmUl4VzJJPiZLWED8W75qY4V0ZKFOir/
         opTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cDA0CM5Y;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77298025si165910216d6.103.2025.07.03.05.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cDA0CM5Y;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gui6+S19PIPTP0HqJYWTL54xHSgeFPP1n+ZMQjEgGiQ=;
	b=cDA0CM5Y9MO5u6hgb3FWPHpf+1o9If7qEu4x8t1nIVBkZ8MGRkV6lAOpzLbmaqtWefSHQn
	J+qnEtjooZmt9dSC8+RSMO/uxdLw1LAZSiuMbGRasIrxpC2GedW6vtTbY+H72YT1u8s2rp
	mchGXKSjQLgilZ6Gh0TiTk22sUrLBvs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-s7LHlYcxPsWGAwPJTR7idw-1; Thu,
 03 Jul 2025 08:39:43 -0400
X-MC-Unique: s7LHlYcxPsWGAwPJTR7idw-1
X-Mimecast-MFC-AGG-ID: s7LHlYcxPsWGAwPJTR7idw_1751546382
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78D5519373D8;
	Thu,  3 Jul 2025 12:39:42 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AE9B180045B;
	Thu,  3 Jul 2025 12:39:37 +0000 (UTC)
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
Subject: [PATCH v5 24/36] hw/acpi/ged: Add a bus link property
Date: Thu,  3 Jul 2025 14:35:24 +0200
Message-ID: <20250703123728.414386-25-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: aRdZRN0dLo19

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
