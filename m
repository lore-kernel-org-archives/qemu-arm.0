Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647594njc;
        Tue, 27 May 2025 00:42:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEdvjAMRofYXVAJx0sJ5qzVpPbwnCqIPebNgp/A5UtoajpJkC6J5RiHIKNctYMs5X+xngFZgvOx9QO9w==@linaro.org
X-Google-Smtp-Source: AGHT+IG5igIftOwtdkcA7mRpPi2HKtNmkDN5o9v7c0y47uNF4eABUhqtmzfoBW0/Ear7bYsrkHxw
X-Received: by 2002:a05:622a:1dc3:b0:494:a2e6:2a6 with SMTP id d75a77b69052e-49f47b045f5mr223524211cf.35.1748331763952;
        Tue, 27 May 2025 00:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331763; cv=none;
        d=google.com; s=arc-20240605;
        b=KvdPtiIBps0WvCwVkLKgmtpUHP+ynGLm29onnLYRDn8bcS0A5UcqTLgOgG4KVtbCEV
         J/RSW7gXntWbBZanyVSv10KcNwqcLVpnlbMUv4pMCFdgk1GxYpS52aC4zaBJaDWtQGkl
         3p9AJ6vGiLXPAru8TS+DeXdEiI8/yGBlqwVvhX7Zl1cOIH1HXKw36QSga6j1sDdJnOPW
         Dmi6oS+DpjagkhJkXZ+s4ZJyJWjx91ihBzMwB2YYQzrepdMU9BO1CMxqlnCfn+w5i10N
         jjg+RHzAh0DlK09B8fVxE4HrXPUWkdmj2+ubRlJBRek58SH4jCZJBwdLwvy++d91sEBj
         qv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+EI6UDMs/JxGr2wyEHak7nDPbzaQxI7sPpq2AJO8XTw=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=MvfDq5sshtUeBx1E8R5Z13ZrhtH+Kp/sGdEzVV6smUoHERdXQiRbVJsao/purHPJ29
         WFS4YHOzA4cQF0+9nu3fpHM6TE65anRU/T69nU1p0KZgA7O8MuOJhKaGzgr1g+H10MoI
         KXEJ3ohDhmfGRkUH2b6vWQINmIDYwFJENbg4a+XQ+HQ2fOkOP2sdxNQDoMtJu9UgxQP3
         HY2DUgfIkge4nXJvBFUNmAzqKjTOMgqKcph+NHUxSi3PQq26bcdpdBoPnoNACCJbynMI
         Zi2/kaNeqRmRL1p7Etp+XyHMdcV89RqyWsDV9kJ2GcUAbDBiMryDlMX0jt+027nqr11g
         qfoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WW0pGSPJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae58f6eesi277895811cf.493.2025.05.27.00.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WW0pGSPJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EI6UDMs/JxGr2wyEHak7nDPbzaQxI7sPpq2AJO8XTw=;
	b=WW0pGSPJ86cU/+8Htgn6JMvPaH4OkzHcBwYHtqKynf4Zc6wVBMquGf0YHt72OprGlDUoxX
	pG6CyiQeqnQBFmrLJfZgwYxqJIQhyHB/DQeZOqDtg992Dpo1zmMBCXfSQz31rBzFRXSJOJ
	TstV9fuFEDIhrWGwkRQTQe4i01V58x4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-h7Koua02MJm5e5JsSJKMSQ-1; Tue,
 27 May 2025 03:42:40 -0400
X-MC-Unique: h7Koua02MJm5e5JsSJKMSQ-1
X-Mimecast-MFC-AGG-ID: h7Koua02MJm5e5JsSJKMSQ_1748331758
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85366195608E;
	Tue, 27 May 2025 07:42:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 075A519560AA;
	Tue, 27 May 2025 07:42:33 +0000 (UTC)
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
Subject: [PATCH v2 01/25] hw/i386/acpi-build: Make aml_pci_device_dsm() static
Date: Tue, 27 May 2025 09:40:03 +0200
Message-ID: <20250527074224.1197793-2-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: LCayMkZcZ0Le

No need to export aml_pci_device_dsm() as it is only used
in hw/i386/acpi-build.c.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
