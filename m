Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1740743njc;
        Mon, 16 Jun 2025 02:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnIni4HGFPjgHDnNc/W4/Nz6xDO00PKMzX7CNJ8UpIF5VCnUcc79yoVS0BAeX1+YxCskEJYZyukLqm/g==@linaro.org
X-Google-Smtp-Source: AGHT+IEOTNbYhvRtahl6BqYmwogRJuEZxbR21yBnZWD/wRX5QsOuLKPLXwGMSW7fLoabIbdefUfT
X-Received: by 2002:a05:620a:f02:b0:7c5:9b12:f53c with SMTP id af79cd13be357-7d3c6c0c7aamr1441402985a.5.1750067366922;
        Mon, 16 Jun 2025 02:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067366; cv=none;
        d=google.com; s=arc-20240605;
        b=W2IGvJ8iIHoxwiy+4uRZjQwBVI9q/zjAds5oK1ciYzPj5pU22sKwkyXI5gkyVghWH1
         gX6ceCyiGDkswMINjjUiZaztDI8KN4pRW1XUnSVWw6xU+LUOsYA6vB7CWbAIHVIIfNDg
         sjFFcapE7LJ3wghc5ikKmCkqOyjBqvJhneq2/TmgqO4RgH3jax1cxN0o5HE7NxjLhO5G
         YR0QGsu9G7X4Z7/H0WXlz97E+BasvT/PPznObBl7B2Ai/NDVvFD8YYIo91fd/8RRlyX/
         QeIKWpJu+6bOkkng8DSWFV53x3ZH77zSBfZK33XAjwoWxXU9sJOqCJMrR0shlrTPg5Ag
         6hQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NIVmB9T7X9elVC/gEk8odcOfXiEnBnk9LzN+nIeRoJE=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=WzoRyRXMkUOCYWlCHqUtU+8N+bBTwmNes+fpbkXI3tyKQRqfzd8JwaPs0SD+uqg24t
         hMQBzvZdpyKrh1TJTuKUPtwkrdvck5az015am/VXXRXkEqEFgLQKQeShLgUwOcKoqXYI
         IMXRNrvdSQElWozenM3mAJ16F6Ag8i6QC2T2H/bG9GQJqnyfKe5wup5ZAfanqmWr3P6V
         pydZSVGcZqYZ7CtcAZHupak1xNNTIdbqI64CoNTsTfV5GSvRPuZUYecmMZDwSDUY9omh
         b76naXReZYlJWut8S5uOWBvJCdIvcKk0S4PXGM1MVWZXu5iocGKji55psfR2TV0MlCXX
         j5vQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K6YYGvRD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ecdf4fsi919576185a.317.2025.06.16.02.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:49:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K6YYGvRD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIVmB9T7X9elVC/gEk8odcOfXiEnBnk9LzN+nIeRoJE=;
	b=K6YYGvRDvz4iA6R4kjNgOKhbCWKb4773nHX4zZaelh9B685JTVJOeSGFwGrA5TCl6JbFuk
	ZAthCIbQJQxOKyWTvS0k1SyLhpuhIWXzqo7dU4faeF6M1/BUt2dMB2VhggyldQf2PsmE+Y
	jC52+3oORF3DwPl61Y1PQkSf4ZBhd1I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-r-s2yrIIMtarp5VMDjbb0g-1; Mon,
 16 Jun 2025 05:49:21 -0400
X-MC-Unique: r-s2yrIIMtarp5VMDjbb0g-1
X-Mimecast-MFC-AGG-ID: r-s2yrIIMtarp5VMDjbb0g_1750067360
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0FA8919560AA;
	Mon, 16 Jun 2025 09:49:20 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8892119560A3;
	Mon, 16 Jun 2025 09:49:15 +0000 (UTC)
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
Subject: [PATCH v3 01/29] hw/i386/acpi-build: Make aml_pci_device_dsm() static
Date: Mon, 16 Jun 2025 11:46:30 +0200
Message-ID: <20250616094903.885753-2-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: C43xFHrZCPrN

No need to export aml_pci_device_dsm() as it is only used
in hw/i386/acpi-build.c.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 include/hw/acpi/pci.h | 1 -
 hw/i386/acpi-build.c  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 6359d574fd..ab0187a894 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -36,7 +36,6 @@ typedef struct AcpiMcfgInfo {
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id);
-Aml *aml_pci_device_dsm(void);
 
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
 void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 61851cc840..f59026524f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -338,7 +338,7 @@ build_facs(GArray *table_data)
     g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
-Aml *aml_pci_device_dsm(void)
+static Aml *aml_pci_device_dsm(void)
 {
     Aml *method;
 
-- 
2.49.0
