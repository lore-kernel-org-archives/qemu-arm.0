Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4802527njc;
        Tue, 27 May 2025 06:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUj0LeILt8VeZonk7lse0i8kmr0BUAjBTVIBPDVaqZAtxM11fikGWqL4x2WPDRe8Ve57chL+NU0l/a4VA==@linaro.org
X-Google-Smtp-Source: AGHT+IFm1hf9aNRnt9HOKnr/fzVIl/TAefhYUt5qhgQ4muD+kUl1aYg56HOwzPUexEvRqMIhsjSt
X-Received: by 2002:a05:6870:ae96:b0:2d4:dc79:b92 with SMTP id 586e51a60fabf-2e8d1219f5bmr268690fac.6.1748351400625;
        Tue, 27 May 2025 06:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748351400; cv=none;
        d=google.com; s=arc-20240605;
        b=QVuxNZ+1HztxDKRCx0dTK1q5WQ8z2DZ7est6PssvOuPSh0HDpttdgzPN8pY7COsxEs
         L8fO9s27k8CiKd8hWPUg/cPM+ge32vtzZdiz7ilMsPBpFZ0iTLkyQGcHm1b2pZgrhspJ
         C/05QqrVDqkWZllrB0efQXhuvfvQOlT7YjFECoxT3YcxP+u4qB6kEwrwGKhtpf49g1Tk
         cvPI98txHzan7trMeNsPifCMqnPjYE72TEyE0vZR0ggF5OgjIMnyrcDDrYCnkff0hbif
         Hqey6GBOs08aODYZ61Xcfo0RKx2cfKTvUU4nOZlHFy5g4xyPyV+/l5xlg/I3terCHLIA
         C3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=6SORohSuXJ/bg9jDlHgEDEDaVO+N78BynoBi5RubMzc=;
        fh=zO8BjiRCYdc5WQQvQUrJID36bE6oC8s7RdPabnPo0P0=;
        b=Mld+QmkmnxnRM3O13OwAPf3nXECmEFWSFPIPRoMLo4g8bkcMRES5Vdiwwu1Ti48SKa
         QEiv+b/8YE/3bULKjhlCwMskL0WpEKL9sSOKKe4Eju06LC46JwGUzsH9sNWKAnYqzw9i
         5QkzxH+N35MMBTwnHPeiFTTUT/EAQIWYwQYBbjMXjwN6Xfmcnq76hSqKwdTujKE42A/I
         0yZnei8/xxRirc0a+NDChvGXYp2w/T9dj6ZgEMit3t3D3pDAiR0A1x03qhGY6+249hk/
         6/N3dltq6MILRsEPzvNexWxTm9CexXahBtl8qfaD2XB+KoyA2J3YEH6YNvX3UKA7nICM
         Gajg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K6KMRxtJ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 586e51a60fabf-2e3c0b94d56si3885646fac.245.2025.05.27.06.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K6KMRxtJ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748351399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6SORohSuXJ/bg9jDlHgEDEDaVO+N78BynoBi5RubMzc=;
	b=K6KMRxtJOw7K0HZ0OmJ7vaBwghPqTBbg+ig7GmGdlGHrQIFuy3T8e7kStVNEPARWcjVEiB
	HUdBoU+KKaHzFw1F/Ew9vAvYtBYi4yeWyjfAt7prQwLn+AjF+A+G6GOx4+U8o4QnlWJjHC
	5PwQePvCf67FmIdrFGtjqtUXquH9AsM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-1GI9xH4JOBGDS8aijlbBGg-1; Tue, 27 May 2025 09:09:57 -0400
X-MC-Unique: 1GI9xH4JOBGDS8aijlbBGg-1
X-Mimecast-MFC-AGG-ID: 1GI9xH4JOBGDS8aijlbBGg_1748351396
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3683aa00eso1597127f8f.1
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351396; x=1748956196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SORohSuXJ/bg9jDlHgEDEDaVO+N78BynoBi5RubMzc=;
        b=CAg9jUbQclsm8RtBd6ZAffqsDmUQ0emjU05Hz2O8PuATMqzmbC5BXzPLlQz0ieSybN
         +JM2iEJ6NvJRa4AeWqHA4o5Bh/abZa/PAxoECVlth9hC8daoQrlJSsS4G7hEn/Pe5zLV
         mRS0KoUBRUTm2KUDMiV0yIalrhb1+MjpVGKdcYGOIZqghzU+SQJgBjRjeGiwVN9cI2Mc
         7xkK6FZrkFLttY9egkAXvoi4EZkRkmpN9S0C12CwqSXP8ibvWXOoiqfltUqMCMp4lVp8
         6yD5m7Arf2Uvzd0RJFaHApC8SyMPPgmGiuxa2CoTSEsyVU3sg5JaO49StDniLnlpAFkd
         k6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW1iDwbMV3I4s2dL1i3vp7+rpXkw7uV4JSJbuVK2CbkCjl3iXFWqptlPmJIPTPa3OmYtfAROPSL4LnfDQ==@linaro.org
X-Gm-Message-State: AOJu0YxLvyLAPaAkuK4GZ+fF/KYfLToeZU0xN6+Q3xYbg7DhT2ogbDOl
	1kGLrPSy2E2+ku37QDu30WXT1hvl2Prkn41sHZSZlA0W43o5FldXjyfkz3UG9ZlBkN17Yof+Grt
	OeLfUQNusih1Xb+pF0JYIvus/yWQB+n7REySCgXPKEIoithpDZD9htqkuGeHWorkE/FLw
X-Gm-Gg: ASbGncsIuOKUVn6M/T7xobbf8kF10Bjohn2+7fnJ2jCvoYfp/uAt6aEn1XOKs9YsiCK
	NUEYr4Rl7HqcxfwmXhl6Sx6JkBJWIL13NDExvYs0GYuqW1UQmU8ZOiv4kSSbro6sqld4yGdLM0s
	ZM0dNqd0DrtMwR1R3L9Yqj6C/lAWDFu8ePedKJPTLwu+Hz5wPjm+eUq6G/DcCySU3Y69sFfzIQO
	i01wauZYFb1yF1LXU+DCKXH+0vk9JfK3rNperYFYSACUkyMmo5vd6BGcFwp7HTzxEWoSn87HZ8x
	fXlUV+bQmu1PwMvXpg+NaL3wcPCfO+Ky
X-Received: by 2002:a05:6000:1789:b0:3a4:d719:5be0 with SMTP id ffacd0b85a97d-3a4e5e37ff3mr551655f8f.2.1748351396030;
        Tue, 27 May 2025 06:09:56 -0700 (PDT)
X-Received: by 2002:a05:6000:1789:b0:3a4:d719:5be0 with SMTP id ffacd0b85a97d-3a4e5e37ff3mr551621f8f.2.1748351395614;
        Tue, 27 May 2025 06:09:55 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d2a7a317sm8217352f8f.24.2025.05.27.06.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:09:55 -0700 (PDT)
Date: Tue, 27 May 2025 15:09:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 11/25] hw/i386/acpi-build: Introduce
 build_append_pcihp_resources() helper
Message-ID: <20250527150954.13d08fa9@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-12-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-12-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EMxMLdJxTpr2wfYuE75-n20o4WaAsSH7lFfRxtbwCQg_1748351396
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 94zMOvzuLnEp

On Tue, 27 May 2025 09:40:13 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Extract the code that reserves resources for ACPI PCI hotplug
> into a new helper named build_append_pcihp_resources() and
> move it to pcihp.c. We will reuse it on ARM.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


> ---
>  include/hw/acpi/pcihp.h |  2 ++
>  hw/acpi/pcihp.c         | 20 ++++++++++++++++++++
>  hw/i386/acpi-build.c    | 15 ++-------------
>  3 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 971451e8ea..8a46a414cc 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -75,6 +75,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>  
>  void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
>  void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
> +void build_append_pcihp_resources(Aml *table,
> +                                  uint64_t io_addr, uint64_t io_len);
>  
>  /* Called on reset */
>  void acpi_pcihp_reset(AcpiPciHpState *s);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index e0260f67e6..fb54c31f77 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -685,6 +685,26 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>      aml_append(table, scope);
>  }
>  
> +/* Reserve PCIHP resources */
> +void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
> +                                  uint64_t io_addr, uint64_t io_len)
> +{
> +    Aml *dev, *crs;
> +
> +    dev = aml_device("PHPR");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
> +    aml_append(dev,
> +               aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    crs = aml_resource_template();
> +    aml_append(crs,
> +        aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len)
> +    );
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>      .name = "acpi_pcihp_pci_status",
>      .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 91945f716c..52cef834ed 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1432,19 +1432,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>      /* reserve PCIHP resources */
>      if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
> -        dev = aml_device("PHPR");
> -        aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
> -        aml_append(dev,
> -            aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
> -        /* device present, functioning, decoding, not shown in UI */
> -        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -        crs = aml_resource_template();
> -        aml_append(crs,
> -            aml_io(AML_DECODE16, pm->pcihp_io_base, pm->pcihp_io_base, 1,
> -                   pm->pcihp_io_len)
> -        );
> -        aml_append(dev, aml_name_decl("_CRS", crs));
> -        aml_append(scope, dev);
> +        build_append_pcihp_resources(scope,
> +                                      pm->pcihp_io_base, pm->pcihp_io_len);
>      }
>      aml_append(dsdt, scope);
>  
