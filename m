Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648350njc;
        Tue, 27 May 2025 00:44:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRCsOdoLLeNDbn65vhO+yQPGtAtHw9cwDt1vAdEbR40hcJ+aA0D2tZDJq315Xw8UZLReqcl9JlAjj8nA==@linaro.org
X-Google-Smtp-Source: AGHT+IGQLTNUJumFfkLq/r9ShlGniCLB0XT2XvUdCa1bFpDYVfoqcREj1cCpHilwlbDXUpVWVm49
X-Received: by 2002:a05:620a:3729:b0:7c5:49d6:733a with SMTP id af79cd13be357-7ceecbd36f3mr2112956285a.21.1748331857204;
        Tue, 27 May 2025 00:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331857; cv=none;
        d=google.com; s=arc-20240605;
        b=gqtpnyQRZSzR8Z0c/hKWkca6yS/Ge4elg+9VngrIJzWUQlga/hSC12fhXkAhH/bAyR
         AVbqCAjJN6jMIeerq/OdaBZPBDk9M7ClAjNRq92pwm6uilJpNie9a9SYWYU7cyBJPI5H
         LSPDq+h+wuE2RIJJBoLxNsi+b+P1y+WTgvZCaRROGNtxqSYqnylVKjE4/+oetGC193wY
         4F70nHlwW/pWzPQdlAwT2tXF/lNMqQJ75I11OiWQcQeV3pJlPa46KIllx9dFOXOn29kX
         77zf0Bg62QeHcgPvGR/t68g64xtNvODbKEveiv9A0eKM/AFgJF7UiHUZtHjmRMlF2TnO
         BVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=24FgHquFSVjSO5zvCe8B5oLsx+dYGuODNwxMnX99AKw=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=HsGpg2yKc3t5URHJjtRhEr7JPgP1kZ6GbfJVkjxJfba43W9kSHG2QQDRdUh0NslWf2
         P+fWhynWBDCFjSa/NMnCHk0FSrniO1dTu7QMVFbNUu9/CSltgguMoLK+R7FzwLe2nEiS
         n5jvOBACrSxW27zT375a0Lwfkex0XhpNtfqYNq8zNrduRULfVm38XBLw7UPg8rISjWaf
         /YVW3xeYXdWCKn4NVFf2JEdXgG0KW7VLIW2aZR94YiaXf2H7Av/S/sy2ApA76mwNLwrG
         WBE3tt/CB+3CsbtktA3nWhcciB8TQNvv3Ufa41Bb1vO1umNgDuAnU4TRKpTfSAEpw/uh
         Ny2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9UHpFEb;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd4688c999si1600288685a.289.2025.05.27.00.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9UHpFEb;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24FgHquFSVjSO5zvCe8B5oLsx+dYGuODNwxMnX99AKw=;
	b=A9UHpFEbzcMaMqwzT0NpcnJQR+eNzIpZsk96VF7PizUuW6dDwNno4YG+NC4GeJ8U72+GJe
	O2bCfr0R/xnNAsoTecSXoIlFknLD3+VMbQ1w70pDZBE62cJP4+Ngw/8U7g9W0c+wsFzaeO
	CjlCAxoOSNGSlrT0ALj/u3MXYBnvngs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-NNiSSrxjNUGivlLtE5aWnQ-1; Tue,
 27 May 2025 03:44:15 -0400
X-MC-Unique: NNiSSrxjNUGivlLtE5aWnQ-1
X-Mimecast-MFC-AGG-ID: NNiSSrxjNUGivlLtE5aWnQ_1748331854
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9B3C195608F;
	Tue, 27 May 2025 07:44:13 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6480119560AA;
	Tue, 27 May 2025 07:44:09 +0000 (UTC)
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
Subject: [PATCH v2 20/25] hw/acpi/ged: Support migration of AcpiPciHpState
Date: Tue, 27 May 2025 09:40:22 +0200
Message-ID: <20250527074224.1197793-21-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: xVUJKJwdSvkv

Add a subsection to migrate the AcpiPciHpState state.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index c0dbf9b358..9334249cf5 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -415,6 +415,25 @@ static const VMStateDescription vmstate_ghes_state = {
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
@@ -427,6 +446,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_pcihp_state,
         NULL
     }
 };
-- 
2.49.0
