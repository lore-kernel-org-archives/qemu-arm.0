Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506405dyc;
        Thu, 3 Jul 2025 05:40:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXakVFh3vKS9VX9Xh9fi9rK36VyCPtbfIWo3PhUrxKlvpA7SuQ0MAg23QlEm7GDrZH9NE2NeJhc9nVDEw==@linaro.org
X-Google-Smtp-Source: AGHT+IGwmZi76xTxBjL/BAtQqqS8Ye4ymLp3mUFgRpTMTBX8Eh2b37qwas7LYcviAHdKTFeUB2GJ
X-Received: by 2002:a05:6a21:998f:b0:21f:7525:f537 with SMTP id adf61e73a8af0-222d7f2c78bmr12449520637.41.1751546416023;
        Thu, 03 Jul 2025 05:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546416; cv=none;
        d=google.com; s=arc-20240605;
        b=XiSkmRsgx1hTScroqAwVMNJ8RpYQAZX4vezKkitthY0KbdUzUUE31L6DO6fc6zJdrv
         2teYyhUrZQ7v/bQVmB/6K2B/dOJAxjvCOQL+iSifY9fVTxFYCKQAfW4VTbYQYLamge68
         g0+0QC8TcRj3XoZ5p21Q4BacLzbkgkBhGWZOcdFdPsoETi3WRGLDaQWJhv+e1QokkF1a
         sMNAzBvgF0mZpUaoCIs470z7i9VC2bO2UZ1XBq1V+Rrw62E2BsUgjp5bjN2im1k11PsN
         XZ3i4DEmfVtzyLdR+OdGeZf3abAWHCnou8a1Jz6yfSvsGjT1UNeTyXIZwG9S/tC95ZwK
         y3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zOreZF7iJ7Xj4M3A4SKQurpH0SYsfcpWvlogIxrsc8o=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=fKUbP7IwH0iLFMwAGH/t7IUjbCG7QbOgJHQdrV6YpIDnVLd99Zl0TBQ0NkhhMTIUNX
         wcXVBE55GFLplCekrwRJurvna/Oj1RcHwtKHDr41oSdDYL6x8dMrBXX2QVzkjVfpPvtV
         OIam5rXZdEOBh2jPmMHtNAWO3xBDaMgt5eKi3piqibuLJeclvjyY4lI6B8zdrAfjQKjl
         zRe1cuT1xlLGbAfBrei5LniNZbCK6WmIuYvxGDOi+9BRyNfnGPnIm/cuvFHfCVyBnH/u
         P++tRXLT92DAJKlFCvIvZHMH8r7aOrbKqr3OvP/ToYbTjxVW5Mv5TSrchroZ3wcv9mr7
         3bvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBHRFGiq;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b34e321c537si19597974a12.468.2025.07.03.05.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBHRFGiq;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zOreZF7iJ7Xj4M3A4SKQurpH0SYsfcpWvlogIxrsc8o=;
	b=dBHRFGiqRyylTmKmZQtITQ9yZSUWS4NVMRocsyyrWYjiC0LooiNRqmYtjaOenA1ltM3Vi3
	CkMCeunBImzvfuuzqDubsPxzE9nTRLWFQKlA+8XsORYcTaCCC+7q0GshA3tPDee+sfvODD
	X6AL5vbXU7oifeI4rnnZRtIh7tVqPPc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-xNl-DebeP-m61Bnga-SkDg-1; Thu,
 03 Jul 2025 08:40:10 -0400
X-MC-Unique: xNl-DebeP-m61Bnga-SkDg-1
X-Mimecast-MFC-AGG-ID: xNl-DebeP-m61Bnga-SkDg_1751546409
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1024E180028B;
	Thu,  3 Jul 2025 12:40:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8DC4F180045C;
	Thu,  3 Jul 2025 12:40:04 +0000 (UTC)
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
Subject: [PATCH v5 29/36] hw/acpi/ged: Support migration of AcpiPciHpState
Date: Thu,  3 Jul 2025 14:35:29 +0200
Message-ID: <20250703123728.414386-30-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: k6/j+DJEFRBD

Add a subsection to migrate the AcpiPciHpState state.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 7535d07737..95682b79a2 100644
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
