Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505126dyc;
        Thu, 3 Jul 2025 05:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULkAFQhIfBWn5Ph4le9QGNThSw1RpvPM5P//fR7hVi3aCyihAe8nT0JelzM8fW1sJHyr60zMvXuvXHBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFoTZrcFY0mn6+Ee7y6pi4FZWbf+KvZTStHjbhuTPwKDNCWprzjdugQ+U3aVyU08vFzvxnX
X-Received: by 2002:a17:903:19ed:b0:234:9cdd:ffd5 with SMTP id d9443c01a7336-23c6e550222mr100099795ad.25.1751546269711;
        Thu, 03 Jul 2025 05:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546269; cv=none;
        d=google.com; s=arc-20240605;
        b=hJid3/s5xoHrJb0vmL+ScRs+NQGl56ZaCRf+KCG8DAtLsThfMvSE+8/wJ8mP1Z6nbF
         yc99sl8xhCWBt0vqHpKU0UiXxXAmK0Tv3YBfc+zjOdFTtt+JylqKUQwfSKhn2wAwGOoU
         UU++JtcLvPeVU37Tl0+drkxdqzrXUu6eHGKMvp3rl0Pzy8T5p/NQBOJJjv7H2T9q/D3c
         Lz+D4krodVbk7oHA9H0MFlrPk/YEH/7G5333lQ/oiVnUYBpZROXstW3TKBCBidTUiFW2
         5e36AMyC+H7Kxcos4gpcaUA8JccJXrY6ieARr7xMDC7nvl9Wq4xTL8hEVzT1LkxdRhcq
         tNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NIVmB9T7X9elVC/gEk8odcOfXiEnBnk9LzN+nIeRoJE=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=W7dAgAD6/ita4QYblKHDgwVP6Hrxt3udcqktT1NTUcel906PHAqD0f1Zg0sJMm4YCX
         pbPfUH62V28Elb8B+ckRC/Hb7rz0KnMdZF3Q5nw+bfohZOYxda2zmrcFKOI3K9Z39+Ak
         IpGeFkd2RQVJmzT7JrMdySbY9aUGJyS1qWcIwKTlk2BYVtYJ5IEKMCJQuh6ZaHuKBVh2
         WnIA3h8gKzvBznMmCto24fUb9YHdZwb2vscBgT8F9U62urCyuWbQ6ZwO7g1g+h4rEvzf
         wlcAnzOpF7qQmgI94m93r0tN3pRpcfB6FYGPDSKg8SxN2nFYLuS3jZ0LvNoQoBFQRTNf
         b7Yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MGiN97LC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-23acb2f2112si187833535ad.62.2025.07.03.05.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MGiN97LC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIVmB9T7X9elVC/gEk8odcOfXiEnBnk9LzN+nIeRoJE=;
	b=MGiN97LCghwXiAdmBoHM49QWeJL60Z5Dy0LxasHctwuBx/LnJAcXy3ckw12ns5+vGhXTDl
	HOP9I0S+fjAFKmE5/rct3CCMYGzmc2zgozk+PdSh1Js1cKugCEOEeSJqk9AxxaXTfLoOs3
	+1a2nQH2Ko6NJwOarPDvhIuCMWKXXxg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-D2W67tqeO06fwnpwi8BK0A-1; Thu,
 03 Jul 2025 08:37:43 -0400
X-MC-Unique: D2W67tqeO06fwnpwi8BK0A-1
X-Mimecast-MFC-AGG-ID: D2W67tqeO06fwnpwi8BK0A_1751546262
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7BBCB19560A2;
	Thu,  3 Jul 2025 12:37:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A2B6818046C3;
	Thu,  3 Jul 2025 12:37:36 +0000 (UTC)
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
Subject: [PATCH v5 01/36] hw/i386/acpi-build: Make aml_pci_device_dsm() static
Date: Thu,  3 Jul 2025 14:35:01 +0200
Message-ID: <20250703123728.414386-2-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: EmQToekRieYy

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
