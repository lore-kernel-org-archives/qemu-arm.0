Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4834488njc;
        Tue, 27 May 2025 07:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOTdFNMlD5XWE8olvMYJUkP5M50jd/Y8shfcSvMl8zGSw6izwKyp5fSVj3Tqsild+tABpOzRGx/uLbcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEMYeuqkKPKLpiRR48+21W8SqX+mxEm2FMPiSjEpG0F5aPPuFHkYk/3zmJgrIrdERwjs/NT
X-Received: by 2002:a05:6122:792:b0:52a:7749:b517 with SMTP id 71dfb90a1353d-52f2c5b40f6mr9704576e0c.10.1748354446135;
        Tue, 27 May 2025 07:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748354446; cv=none;
        d=google.com; s=arc-20240605;
        b=VJPor3xpx1BmFHVSGw+ClSdpK9fhEmtyMHCkESknBlcrfWryMBU6jvpW7L/X3riNm1
         fkz+eZGvgOQtjyXRwI9bAglz3wyHXGZlEvLMjQ/7nf/ZVhCbFDV879ZpuNOiAkP/jG/y
         lq5pKeffY8OQbGX6JcXsQMgFE0OILVQXcJRBtNBQlJvD2edmvRw0WuNAPO3XIZR2S6E4
         34R+HtxPB8bO3s9H2p6L9oS/t2DI+9InZn1ZC4uOOwYR6n6KdOH5fR+ZvzSyss5czWeM
         VOahsJ0U0VmIV3g0H6UZtRwnWYDUu0CiOkLCAV/fqdKZlnqFP1EHA1CPxKk9BLDHIJtS
         tC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=9fqEK7t3Ihy1U7LdrqIC4SYR34scUsQWrqu4TAo6V+Y=;
        fh=MwbfeReDPRGmNLZ7kTR+i/xkVqLzzbPCGOziwxM0E0s=;
        b=BvsrKdQ4OhnW9UIHdMN73CscTRisDguVK2jrbgjOVFNwpcDs47JIqhzjeehKhYBpFV
         wJJ8x8VR/Rpq52P8qvPr8fXx3J2LrPakGdBfPdixw6fX+dAcizu7jezvLe59Eq94tnG/
         9mbJXti26tpEhWAE8bt0IQX4mlBAftMWwyrnKl2L7VulP3nSoh9ugTuD9QHJqGKitsIf
         SdsN4f1axWtwiuaaBc/2Oklrc8/5BoLcM/kmuWh4HpHCgy1xVZlpn9557m2UEGbzuxMs
         SZBr3fin8CqN/8yQW90X+PyFCzPtk2AZ4Rlt6txYlbfPNq9bwUDafqjwIjm0kPNkIPee
         9hHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELckjn8m;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5305ab46afcsi238504e0c.158.2025.05.27.07.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELckjn8m;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748354445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fqEK7t3Ihy1U7LdrqIC4SYR34scUsQWrqu4TAo6V+Y=;
	b=ELckjn8mSFwJpAxlTKJ5nhySJqufCtISu/062JjicSNlv7FscvWOmqiwqXvI94ZqnEs9nm
	3gOquLMKZGcCRofKMD9VEoiMSE3TDgnMQRz14bQ+MjteaYqMLaJFKpZuXST4pBd79cGei0
	SltxHkJjmAAha7USIM6tDhAS/X/x5xk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-MSj6EsSxP4GdvPacLMVUFg-1; Tue, 27 May 2025 10:00:43 -0400
X-MC-Unique: MSj6EsSxP4GdvPacLMVUFg-1
X-Mimecast-MFC-AGG-ID: MSj6EsSxP4GdvPacLMVUFg_1748354443
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a362939f61so1037806f8f.3
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 07:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354442; x=1748959242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fqEK7t3Ihy1U7LdrqIC4SYR34scUsQWrqu4TAo6V+Y=;
        b=TLMm3x1+htmmzC8RAeP8CrVdmUeNSGAscUNLihmraU46sscMn4bw56yBXKP68Ib4Wh
         1Lb10/yctP32AzJEv9WLWjDk287ABcGaNH3OPCc4G/NFBGqQ50a9WTY1kO0vPAtu1v/v
         07PpGSmKWW67FIW38YQXF1uDmAo6/rj51mDWwEGlZoYy4AlcA5ew+dI1gpDQejgbDS4/
         NmG9a9OXLmq3KKqoMzka2dELObZxcmJybWBVPsU8219clyUYVnMmYGH9jrItwDeUzjPr
         /2gqeq00++OGCjQCNJ/10D4w3toImxXl0lmWv3JnbWtRQ1db5FWXoJQ0755maHy9M+LW
         TZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdFsboR17efkLQha65YUagbDLsGMMb6RbT7xHkVUkyXwNlRwXXEIUPsTVs0bVtgwq+L7cAmR+kdrM0ZA==@linaro.org
X-Gm-Message-State: AOJu0YyMMJk+R7bEqa25BEZZq199Q0Oh9xgHRxnyQInEInkgFzaLSWxI
	4nSHuYNYyncoi0jLcmJl2oFIjTpoDx9K2bgi/FQDmcLT/Y5k4lQ6sIjMrONUR4sAOHOgxrkymNX
	tuWnfk9/tjCbR/cXxSunF7j3EzfkrgqxJfw/iKpm24b5HWDI1CBw9w5qB6g==
X-Gm-Gg: ASbGncuIyev/FfoBU1r3ngyqAO9HTpTiFJAhwThQjmwg3r64ga+z7a/KqCB5cx+MzrR
	zmYsYEID1kkMhHIHQPYnvdNwHRPN2OlabbUZVXpmy+kQvpZxhQUXS+zDMquATuhj02xT2zLoxOc
	mzlGcM/7Zh1deuPTdSSLRoOyAk0nT02YUE/hI9iTmN5hUP6XwYGc3quyT5wamEpOqlVjO3BuABY
	ZRB9ENIeXNYTYYGf3V4ZL8hsry6i/ftYZBLNPCe3DYNaAJApKUoyi5AAnKrlpvTfYnc+OTCPSaa
	MyxgzIMAY2INj/XgtmVPOZhoUZuNWG9e
X-Received: by 2002:a05:6000:4024:b0:3a1:fed3:7108 with SMTP id ffacd0b85a97d-3a4cb4b8e74mr10644462f8f.40.1748354442596;
        Tue, 27 May 2025 07:00:42 -0700 (PDT)
X-Received: by 2002:a05:6000:4024:b0:3a1:fed3:7108 with SMTP id ffacd0b85a97d-3a4cb4b8e74mr10644415f8f.40.1748354442117;
        Tue, 27 May 2025 07:00:42 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c9cd023csm11512864f8f.10.2025.05.27.07.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:00:41 -0700 (PDT)
Date: Tue, 27 May 2025 16:00:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 16/25] hw/i386/acpi-build: Move aml_pci_edsm to a
 generic place
Message-ID: <20250527160040.5641920d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-17-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-17-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RedrVcBTr0XSvaxBnBtJS3NIkpoWVwQEZ27EEMdZPPY_1748354443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: qBQCkTaoD/3F

On Tue, 27 May 2025 09:40:18 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Move aml_pci_edsm to pcihp since we want to reuse that for
> ARM and acpi-index support.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/hw/acpi/pcihp.h |  2 ++
>  hw/acpi/pcihp.c         | 53 +++++++++++++++++++++++++++++++++++++++++

edsm is for un-pluggable ports,
a more suitable place for it would be hw/acpi/pci.c


>  hw/i386/acpi-build.c    | 53 -----------------------------------------
>  3 files changed, 55 insertions(+), 53 deletions(-)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 5506a58862..f2c3558654 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -82,6 +82,8 @@ bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
>  
>  void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>  
> +Aml *aml_pci_edsm(void);
> +
>  /* Called on reset */
>  void acpi_pcihp_reset(AcpiPciHpState *s);
>  
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index d800371ddc..57fe8938b1 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -937,6 +937,59 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>      }
>  }
>  
> +Aml *aml_pci_edsm(void)
> +{
> +    Aml *method, *ifctx;
> +    Aml *zero = aml_int(0);
> +    Aml *func = aml_arg(2);
> +    Aml *ret = aml_local(0);
> +    Aml *aidx = aml_local(1);
> +    Aml *params = aml_arg(4);
> +
> +    method = aml_method("EDSM", 5, AML_SERIALIZED);
> +
> +    /* get supported functions */
> +    ifctx = aml_if(aml_equal(func, zero));
> +    {
> +        /* 1: have supported functions */
> +        /* 7: support for function 7 */
> +        const uint8_t caps = 1 | BIT(7);
> +        build_append_pci_dsm_func0_common(ifctx, ret);
> +        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
> +        aml_append(ifctx, aml_return(ret));
> +    }
> +    aml_append(method, ifctx);
> +
> +    /* handle specific functions requests */
> +    /*
> +     * PCI Firmware Specification 3.1
> +     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
> +     *        Operating Systems
> +     */
> +    ifctx = aml_if(aml_equal(func, aml_int(7)));
> +    {
> +       Aml *pkg = aml_package(2);
> +       aml_append(pkg, zero);
> +       /* optional, if not impl. should return null string */
> +       aml_append(pkg, aml_string("%s", ""));
> +       aml_append(ifctx, aml_store(pkg, ret));
> +
> +       /*
> +        * IASL is fine when initializing Package with computational data,
> +        * however it makes guest unhappy /it fails to process such AML/.
> +        * So use runtime assignment to set acpi-index after initializer
> +        * to make OSPM happy.
> +        */
> +       aml_append(ifctx,
> +           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
> +       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
> +       aml_append(ifctx, aml_return(ret));
> +    }
> +    aml_append(method, ifctx);
> +
> +    return method;
> +}
> +
>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>      .name = "acpi_pcihp_pci_status",
>      .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 6feb99e9eb..e8ed335fdd 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -322,59 +322,6 @@ build_facs(GArray *table_data)
>      g_array_append_vals(table_data, reserved, 40); /* Reserved */
>  }
>  
> -static Aml *aml_pci_edsm(void)
> -{
> -    Aml *method, *ifctx;
> -    Aml *zero = aml_int(0);
> -    Aml *func = aml_arg(2);
> -    Aml *ret = aml_local(0);
> -    Aml *aidx = aml_local(1);
> -    Aml *params = aml_arg(4);
> -
> -    method = aml_method("EDSM", 5, AML_SERIALIZED);
> -
> -    /* get supported functions */
> -    ifctx = aml_if(aml_equal(func, zero));
> -    {
> -        /* 1: have supported functions */
> -        /* 7: support for function 7 */
> -        const uint8_t caps = 1 | BIT(7);
> -        build_append_pci_dsm_func0_common(ifctx, ret);
> -        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
> -        aml_append(ifctx, aml_return(ret));
> -    }
> -    aml_append(method, ifctx);
> -
> -    /* handle specific functions requests */
> -    /*
> -     * PCI Firmware Specification 3.1
> -     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
> -     *        Operating Systems
> -     */
> -    ifctx = aml_if(aml_equal(func, aml_int(7)));
> -    {
> -       Aml *pkg = aml_package(2);
> -       aml_append(pkg, zero);
> -       /* optional, if not impl. should return null string */
> -       aml_append(pkg, aml_string("%s", ""));
> -       aml_append(ifctx, aml_store(pkg, ret));
> -
> -       /*
> -        * IASL is fine when initializing Package with computational data,
> -        * however it makes guest unhappy /it fails to process such AML/.
> -        * So use runtime assignment to set acpi-index after initializer
> -        * to make OSPM happy.
> -        */
> -       aml_append(ifctx,
> -           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
> -       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
> -       aml_append(ifctx, aml_return(ret));
> -    }
> -    aml_append(method, ifctx);
> -
> -    return method;
> -}
> -
>  /*
>   * build_prt - Define interrupt routing rules
>   *
