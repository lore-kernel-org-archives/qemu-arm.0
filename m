Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788339dye;
        Fri, 27 Jun 2025 02:58:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFnUPVIzm/pUCbB1EL9jxRt3pFp7j1B8I30Fp/1qsVhmnGXty99yn1mUCU8cCeQT72pWTLzE88gsrNBg==@linaro.org
X-Google-Smtp-Source: AGHT+IGnv26ruhua97oKnNmoYLUWz9PL4BZhh5SyGdA0dPkp3IkbyA+dd+HdwRuErCFVcbVVsXLh
X-Received: by 2002:a17:90b:2585:b0:312:e1ec:de44 with SMTP id 98e67ed59e1d1-318c92ffb0bmr3153798a91.27.1751018326323;
        Fri, 27 Jun 2025 02:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018326; cv=none;
        d=google.com; s=arc-20240605;
        b=deNBTzopmb6jZMcMIw/U5YWFO8H5Kar1uJ41KCIdPX+hIROrH3pJpCrxKhE2g9B3qj
         luqvOCB9kl2U4y1x6hVIjIp+6rPUEhstK7oJlgGJkmNCWY0FV7ITrxTZoaV1Ih5CSZHo
         t3sGVrYicV+c90XsKlEHQztcimKpAiW4X1Mis78cLDsFxuG80HbgG1Iwpt3xVKg2UK/I
         BL/ufFtJNoZ8EM/bHJlBh4lOBeBdQAB3qhlNsLIrBhgMZ+aKNJZ4cKilYqYkYKnwvdPc
         tyYE+Kuppi4W9IXRX5wVbz71FCCtyb3qb0y8SigF1C11Y8U18mbrQ5tcu9rWMCzD4lK6
         Daxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NgnsE+j+Qv24GfrA0H7C1JIWu62bT2V6IsizJNlN8Q0=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=dpJw/spjEkcMaylK8fMw+K2TgGNWc/m0k0ooqeAK5WgcIO3NdXZyhMZvcnR7bxGz1c
         mEX1+fDQgAAGg1qy/wvXTUiW+mTShijiKg3+GlzagiJjKdCadGExPbb12jXK8rhKqmnm
         zk+rDb3U68EhcBbBSBy0OmyKQE0bX+/L6wp/taya7ZVR9svtras0+BMEJUOmunf4uQTF
         vdbWjdtVYDd61XPtPCOJq4V4OOPCRzQctWiyaXO464HE4M+z9FUvFyB8lZn0U6BUVEl8
         jTb9tglkPlwnJjjBxvT3wgylv255fJbY4/1u2K6mjkHHCT78eu0U4mG/twI8ThnCgrR1
         oOOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="N1R/zcwU";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-315f5386ec3si7841484a91.34.2025.06.27.02.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="N1R/zcwU";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgnsE+j+Qv24GfrA0H7C1JIWu62bT2V6IsizJNlN8Q0=;
	b=N1R/zcwUBjGPrpSOeSl5VNMUSxRkNbNHuRNHtOnkuDf00g6uZMf1ddovDRd0VrjNXXJ80c
	1UL+bW5ebOwIk3DytR57jebsYDym88J8of2ZvLVXWc2j041BC9K3oXIWDSVMiJ1y+RKcNb
	i9ag+ppMZxps31Rs6eeFdFTEVvTrquQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-qX1Oo7SIP5CuykwyDWfIoQ-1; Fri,
 27 Jun 2025 05:58:41 -0400
X-MC-Unique: qX1Oo7SIP5CuykwyDWfIoQ-1
X-Mimecast-MFC-AGG-ID: qX1Oo7SIP5CuykwyDWfIoQ_1751018320
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBA9C1944AA9;
	Fri, 27 Jun 2025 09:58:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AA6C19560AB;
	Fri, 27 Jun 2025 09:58:34 +0000 (UTC)
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
Subject: [PATCH v4 26/32] hw/acpi/ged: Support migration of AcpiPciHpState
Date: Fri, 27 Jun 2025 11:55:15 +0200
Message-ID: <20250627095620.3300028-27-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: q32rbsEZ+lUJ

Add a subsection to migrate the AcpiPciHpState state.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index fc84bfb34e..3adb8217f7 100644
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
