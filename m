Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787597dye;
        Fri, 27 Jun 2025 02:56:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtDdlGZZWMS6aJWmnuX74aj9sA5PWjPi8L0N7YWAUdmJqL4+KV2Qc18Np6Y5fhwrsa1aMdUSaFENp1jQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEUchkxkbEJBKO7MJj6l4EsbaozHhTuYgySmFWAb4kU4A6w0fI82imc80f6XF/CWTGVVCaI
X-Received: by 2002:a05:622a:1301:b0:4a6:ef76:c265 with SMTP id d75a77b69052e-4a7fcbc358cmr42155061cf.36.1751018199181;
        Fri, 27 Jun 2025 02:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018199; cv=none;
        d=google.com; s=arc-20240605;
        b=NOLrG11IsTtBwKyB+o7bbpO2mBrlnObGKDKzX6QuM3UD5m8t6pJpT6fUpkK/2GKWfa
         4FwYyGaTpEWs6nBw0E5cmYSM/TUfHh0DucS/ICqISLDsyDhbPtFnhliW3ZBAx3pEwSkR
         Ht5AzIe99atrp/AL+AliYcMf0XqJeq+n+5NK7flnhVVrYNvPDXReufUMziFlypPiIYaz
         HSdF/l+ck1KtIoTBnM2XW2+WW96MLRwftTX2YtSV6vxuVOgKa0Ylc38WzGAy45tT0mGg
         dDmSLoh5zPjLrtZhIWIYXoxEQwWKQhNxdT6DrluPRO9VIxOKZ928JlQj1wo44+mcifh8
         xiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NIVmB9T7X9elVC/gEk8odcOfXiEnBnk9LzN+nIeRoJE=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=if4lpjEN2ackkapGEKYOVohadNBlsG3opa/aQtQmr2+wAOSRjYuq6FMsmucqkTnM2f
         7snEF7fKcLEgdSCWcc7013hBc8MRh8BWZofF04vY6IRd45k+s38Odev/TiCOftfRS7V7
         ykcFPrTIzPGPys1wjxzIn4Pcyj5WZkgMc0S+vtSCXLiYmdP8UQ5CC0HP0t5hN0AMTgy5
         N9SHNXYcs81E5I71E/c3epwXu+MYQwfflRZtcGujCpbNkrnbAZ4900Xhyi8daG6oKZj5
         ZXerrwml1ozogjk6oVxP3HD9nOiHLJoDoz8VRNxL/OQP0EwlZgPiFWxVJDKOgw2W6TiU
         WW0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SEpqWPHk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e6cf9si20490571cf.298.2025.06.27.02.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SEpqWPHk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIVmB9T7X9elVC/gEk8odcOfXiEnBnk9LzN+nIeRoJE=;
	b=SEpqWPHkYCXo6ve2RQ4hrM7+cinh/LxpBa/z/g7Ekckp7YoI9KBHQcIgOgEmPW7twsXPwD
	uoCxgjBnRtfu453VkSBl3iP7QhsRiuky0qEASbVg+GNP37nUdEx7PcwP80Kp3PgbVklsOc
	4yZH3AM2zuQV5r4a3aNzXrkptFRSeKY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-lo9r3gt2MN2x5jUphQRW6A-1; Fri,
 27 Jun 2025 05:56:34 -0400
X-MC-Unique: lo9r3gt2MN2x5jUphQRW6A-1
X-Mimecast-MFC-AGG-ID: lo9r3gt2MN2x5jUphQRW6A_1751018193
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C9F71801212;
	Fri, 27 Jun 2025 09:56:33 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A5ABE19560A7;
	Fri, 27 Jun 2025 09:56:28 +0000 (UTC)
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
Subject: [PATCH v4 01/32] hw/i386/acpi-build: Make aml_pci_device_dsm() static
Date: Fri, 27 Jun 2025 11:54:50 +0200
Message-ID: <20250627095620.3300028-2-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: i1Fu8ZZ9aw72

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
