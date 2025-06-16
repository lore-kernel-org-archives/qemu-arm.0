Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741414njc;
        Mon, 16 Jun 2025 02:51:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgJEkq4e0H8Bqp6ahvj1WxzqItJzleHyU2tAvgKlJuAcW3bAuAEoZ3ewjo/viKLcZU2q4tl3ZztDsAjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFJXtx6rQoEtiGgwo2ff+bOFbUYbXAc5XWAo14WC/7OqOE7XggHdmF6l3sYNDDqCRULoo2z
X-Received: by 2002:a05:620a:650a:b0:7d2:18ba:8700 with SMTP id af79cd13be357-7d3c5138445mr1692446685a.7.1750067475951;
        Mon, 16 Jun 2025 02:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067475; cv=none;
        d=google.com; s=arc-20240605;
        b=KOEYfHKByy4XFrrkVgXk/hAAsTUpd2rUDLevhW8FNoDgUCPa4z96vPc3+FmRXoVxR/
         RDBxJ3a+qtofxDsfXutKZZM+jDRvXu0vHCKRlH3Rn0CCxe71axsWfy7bGzVoTgU2RAON
         yB6K0nXE4DhMEnyKwyxz/8I2wIN/smxFLzAx7z6bj0DwXYitywa4/AnyN9N7dx7l7b5p
         ZYbBPDcIMnsnhAqKlrKt+G3W+jzCf4lB/Ph9c30tBflEl85vuoE836ElcsDZWvppKdzZ
         dGPKyJtrAtLvj1Wuy/uZQ+B+s8EpEiHJwtJn07qy49nYM84/tjWQ4z+ZGQaN64+YN8IL
         5W2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8Y1qdYHZEKH6Xmzl8eoJOe9QKUbxbGtABxaz9IVujHw=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=dorkBk/gn3rMn/xq0GF/Q2ok5fmXtg7Zr3+X+YXKEgLDtRiflFJov2ZsphZ2HzQcbz
         4RpUOeIusDSlfp70FHNJqCDz9wF5rmEP4PDA8ihG0KhwVAgq/RVEUf4CdMT2Mx+i9wJm
         bXDNn4usQf8YKKRa79TNzfdglplvbEFPY5fFPTV2Rg/vhywyIMNT4Q5i7vcE9Hok2Ijr
         ETlLWsVokJajwGns7TCiLfc0IAwJNysD4ORe/+za8OVLZSu6sWA7OUlntk9aW8GF9+1C
         mMk107qvZ21HqeT7EtrL4fN7wgOFl9b/UhbNjVXfk7t9dOGm44rak+kITbA05wYynMUa
         pk9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J97p6eo/";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dc33f0si1006527485a.103.2025.06.16.02.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J97p6eo/";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Y1qdYHZEKH6Xmzl8eoJOe9QKUbxbGtABxaz9IVujHw=;
	b=J97p6eo/2sTUdjLHXvLVoj+caN4z3pcdIsGQkNb1Dm9vGkIscQLB3HqkZz4TbPrf/9qJBe
	f3RrlhAQHk6IgaxxGYW81fcaVwznQ0ALnFLCIZT0JmEPyFyD2QRjSLkvsv5e+pPnqzcmzq
	9mEUDikwAVGnirjO8CD8k0rzv203Xs0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-5uLTMmmPNgWlHJCfabrEGA-1; Mon,
 16 Jun 2025 05:51:11 -0400
X-MC-Unique: 5uLTMmmPNgWlHJCfabrEGA-1
X-Mimecast-MFC-AGG-ID: 5uLTMmmPNgWlHJCfabrEGA_1750067470
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EDB601800282;
	Mon, 16 Jun 2025 09:51:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 94F4A19560AD;
	Mon, 16 Jun 2025 09:51:05 +0000 (UTC)
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
Subject: [PATCH v3 22/29] hw/acpi/ged: Support migration of AcpiPciHpState
Date: Mon, 16 Jun 2025 11:46:51 +0200
Message-ID: <20250616094903.885753-23-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: /Bf+cSy3bqBm

Add a subsection to migrate the AcpiPciHpState state.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 2ae9ad082a..48b286ccb2 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -417,6 +417,25 @@ static const VMStateDescription vmstate_ghes_state = {
     }
 };
 
+static bool pcihp_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->pcihp_state.use_acpi_hotplug_bridge;
+}
+
+static const VMStateDescription vmstate_pcihp_state = {
+    .name = "acpi-ged/pcihp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pcihp_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_PCI_HOTPLUG(pcihp_state,
+                            AcpiGedState,
+                            NULL, NULL),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -429,6 +448,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_pcihp_state,
         NULL
     }
 };
-- 
2.49.0
