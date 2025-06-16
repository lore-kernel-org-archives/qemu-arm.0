Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741317njc;
        Mon, 16 Jun 2025 02:50:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdAtdlGZhV1ccpVZP+H+VoW9pTbw3LEXZP5ri2+HPoppvc/LHPOOF0ZbUPhkoLlBY96b617K1KyJXMOA==@linaro.org
X-Google-Smtp-Source: AGHT+IFAz+4ual9gWUYOHlLCm8PulUpoYazPeUT7yLDRt4nS5CLd6bI8QaNbOpOwBQbBrVQ1tCJ2
X-Received: by 2002:a05:6214:528b:b0:6fa:fd7f:829f with SMTP id 6a1803df08f44-6fb477d871cmr155143626d6.27.1750067454766;
        Mon, 16 Jun 2025 02:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067454; cv=none;
        d=google.com; s=arc-20240605;
        b=hJBqeFp4UUo3U4HIqbXZ2rMuZi2DyjaQsRUVFQ6QjRV00YSlM6XHsDxYDQI/3phXpq
         O3HVEe1YYEqKrMtoD2hsHhp4BgdvtNVw5ui4otIaNUfvQuwxTVwi/TD1dSPSHv9k5Z/M
         7fRACXibZZKE3udyKp27WQfYpIs8PPPMIF9QJagD1qPERGl0PmG5E02Hn306ZgilT8G8
         ksD/h8Km7BjPEjWlwTYffdHJbD6If8xCJO23nXUCCSbfEh0A/AxA6+7tlVLN99rL9zpf
         ZfZm5DgFGNcruqtYZ5ckEuCHLvH/i6W8fZj/9V+v0AfctXbv42XphHIYRLjIYbCEXWhV
         tN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X9ke3ovGroJdAMQ5k7koM3cVJlYucfzFw/FxUAv6QRU=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=kOGyh000Cs1W6rlnH0A1cXYXc2qMbf0iWJc5Q6Wy0iEy8jf30+Os6uW/vuv6Q1cP3U
         nXPkAc98DjtLzFkq0VwI3LTXucTqTd544BzVQ/OVLQAFOpySzRQdCqaUfVGKl3wbfI5A
         3jOTgiJLhIqzgRYdcIR0VUuo2Nam1s/mG6yX0eB0Uhig6LVucUG4Yfcwf5qLHuXzppPp
         NFsQrnd8ybU4ibpwqOMCsmv13lFKPDLxb56b3mw4N4WxEFvFjDcCxBH0gJCb2dHMvbEl
         MsU1hI0kuVFb+J+UJrS2V9Z6LI3jVmDGxoAmcJ6Pdcer4QkyTPyc4xpY1eludjLbDH6g
         iqyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KEyBxmei;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb4e1b5f6esi47278026d6.38.2025.06.16.02.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KEyBxmei;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9ke3ovGroJdAMQ5k7koM3cVJlYucfzFw/FxUAv6QRU=;
	b=KEyBxmei3DssQajgFyqWj7geSWYHS8rQVbRGTx585b9zb70db7RbE2DL+cXvCpTrrqN3EQ
	+m7HT+dQfmTC1E/jYy2EoEpML5J+Go1j5QHElz3Ru32y4qcJR63MHcWqLSOPlJFQ4mPcxA
	/Ln+vFNjcnAvfrHtTrHZgikOGoVEweY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-8BKRdJV_PGKxgov0JSEeVw-1; Mon,
 16 Jun 2025 05:50:50 -0400
X-MC-Unique: 8BKRdJV_PGKxgov0JSEeVw-1
X-Mimecast-MFC-AGG-ID: 8BKRdJV_PGKxgov0JSEeVw_1750067449
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E64C195609E;
	Mon, 16 Jun 2025 09:50:49 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37EF319560A3;
	Mon, 16 Jun 2025 09:50:43 +0000 (UTC)
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
Subject: [PATCH v3 18/29] hw/acpi/ged: Add a bus link property
Date: Mon, 16 Jun 2025 11:46:47 +0200
Message-ID: <20250616094903.885753-19-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: /XOUNvEMX6AB

This property will be set by the machine code on the object
creation. It will be used by acpi pcihp hotplug code.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
