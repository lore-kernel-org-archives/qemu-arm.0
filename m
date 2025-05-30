Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp993070njh;
        Fri, 30 May 2025 01:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVL1N1d5MU/PMoOeO8K3kPw5Hp3N12rcKvEfauOV4h4o8bdVATkZTudw3wT6RhCL9EBi0IkEUlY0lMcdA==@linaro.org
X-Google-Smtp-Source: AGHT+IGedP34nVnjT8CReCwDqgNuSGMkhcCHcSCmvvB/AARFK76ww595wAIyojWov1kTqGOfcmfa
X-Received: by 2002:a05:620a:6183:b0:7d0:9726:5b91 with SMTP id af79cd13be357-7d0a2052b89mr381748085a.56.1748594436821;
        Fri, 30 May 2025 01:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748594436; cv=none;
        d=google.com; s=arc-20240605;
        b=GmKGL8rdajDUeu3u3nsb2c0fL7o3hqNQJMxIKcxZtUVNqm7DxWDsK40xkXxb+vlXIr
         QrOG2eCuCq0DMCnkQzkjpM2ZDVgTVZaEsTlFQEG0ay35rZpSntWocYG51Z0Fj/eZXFsy
         UjZWvVIB7yFdqtHLHWEK0OOG74vXni0qGlNPDTJfIiEbyBb1y6YNvpRxvGJpPOBK5mIo
         G+v9yZ/6HjlXyq7VIUjrhLAq58xY7TIaEYfAkjF/edwjIbXy0Zrd9UaqgvbZeTVe1cNZ
         EHAUnwdKtYnat+KLkxxV/iE9l4hxa12ZPtL15dStgZnD8d2YxnPbVd5Ia8lAJYKqiyH2
         f0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=2C6wI3MAkp5ieEqWazX8lu2/dCW6uYLt5/+tEtvZU88=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=KqR5vnCFBwKo9HuEOucALjIKKLUIV6/JJz/N3Pzz//MS3inPk0foPKBH5VbxDQ+PTq
         bfqMwqqvap8E18hD7czLLPMBypXzl+jHnv8OT70XeeFr9hpxD24Can8zNNEUXn6wey+D
         AMHkmPutNK/7T9eYP4USK7qvja4Hj7eX4Kh87LXZdvpXTpxwC5oRcXcMP1sc1ErFr4rA
         WSbQXYDxvPSkuPW8FrB5znfL12DZgYmZaz5NPe/irVGE/8adbBUKrypl5J61paVIvMpJ
         lMmtbQNeTtKSY3ccHF2szYvHtq7EH1FT+wbDeNDBpVvpEONXnnugGTFV4DE+EM1hpsWD
         u5hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1e080bsi338288285a.278.2025.05.30.01.40.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 01:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7xVY3WZpz6L52c;
	Fri, 30 May 2025 16:39:17 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EEAA1402FF;
	Fri, 30 May 2025 16:40:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 10:40:34 +0200
Date: Fri, 30 May 2025 09:40:33 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 01/25] hw/i386/acpi-build: Make aml_pci_device_dsm()
 static
Message-ID: <20250530094033.000076ec@huawei.com>
In-Reply-To: <20250527074224.1197793-2-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-2-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: bft9scoR1oM0

On Tue, 27 May 2025 09:40:03 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> No need to export aml_pci_device_dsm() as it is only used
> in hw/i386/acpi-build.c.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  include/hw/acpi/pci.h | 1 -
>  hw/i386/acpi-build.c  | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index 6359d574fd..ab0187a894 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -36,7 +36,6 @@ typedef struct AcpiMcfgInfo {
> =20
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *in=
fo,
>                  const char *oem_id, const char *oem_table_id);
> -Aml *aml_pci_device_dsm(void);
> =20
>  void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>  void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 61851cc840..f59026524f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -338,7 +338,7 @@ build_facs(GArray *table_data)
>      g_array_append_vals(table_data, reserved, 40); /* Reserved */
>  }
> =20
> -Aml *aml_pci_device_dsm(void)
> +static Aml *aml_pci_device_dsm(void)
>  {
>      Aml *method;
> =20
