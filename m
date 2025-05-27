Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4781425njc;
        Tue, 27 May 2025 05:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/RoKQ2uo8z6jCTrNHHd/JMG4yH0iq+DW0MVs2Tnre/Zl5GDP0wGYGrPGk5ej8/Mgv88Ssc7nqjhvTvA==@linaro.org
X-Google-Smtp-Source: AGHT+IFq55c9MyVKWWDhKQG45oBL25s/8wQ4x1S0DY69WTwQ00UBmrysiU7pkDuahtMETTbtpr9V
X-Received: by 2002:a05:622a:5e12:b0:494:57af:bf9a with SMTP id d75a77b69052e-49f480c8e6dmr231659561cf.50.1748349326107;
        Tue, 27 May 2025 05:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748349326; cv=none;
        d=google.com; s=arc-20240605;
        b=SOUHcjGTTcO5PqviGByZQOYTAUEayvWGcG5mn1iWtAcMoLKfREe84xSpi3SRafZNXS
         h5ISWz4XnsAuHvTQ2VI74pOlAe4ThpP3aoa07KYfFMyNOWnk/GlDq18vT4NyH24rQLAE
         ettCZm/fuFAQ6jHDh5Y371kyMGvMflFfhWSTjl/CyAM3+n+Odjll/Ls0ZxNBO8H/J3Wb
         QBf3s3S1bws0doA2rSiY/Mn0iWVz3ZvMMkuu5mrimGuDqjlsW+DL9q6MstPK4LNNi0it
         XFIIiuOX/KBQVfGzQuqujdJ16SaNUgoHxE1eC5ljhX3wTQyA05/pEhQDS2IiVMWNtdwB
         T7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=dcGyCCr0YdUesOdX9vj/ueLKGtD9L/19RsFWfNjZGPw=;
        fh=gFtZvIIXcc94q9jZh4NY7yVWMvRoCEz2GNkddHL5/TQ=;
        b=kLDCuZ8f6+W9z8fpXDvPQzGSj+vJxIYGXjGz2FiSJiB1ajGW+wuzcN1zjA1rGGnwn2
         xH9q/Hd8RqhT1NJqKub6ciGMtrThdN9KiCV/MYzDhmc91JGVKPL4ryJS6sV11sAHPL9O
         /4/L9ZMhCbNkM2yAuUSK7Yz2unq+EVmxg1KZTi0f45SAb4BrRjIRnemm4wAQPmiNaGNS
         w1VHQoErJnE2RUlBeJPS8mIZnphOBiFPRYV9ogCVP6ZqDHrPSya+4mSx/cZfYNpOeJvG
         fhayxtNt948DXu9WmEYnI7j4R71+7r2j6Ale7D5AaKjsZTonO3sT8BBXR7J823zQ44aN
         j+Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5wga9Fb;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fa99d22082si96603076d6.359.2025.05.27.05.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5wga9Fb;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748349325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dcGyCCr0YdUesOdX9vj/ueLKGtD9L/19RsFWfNjZGPw=;
	b=H5wga9Fb9jhHwI22VvN+hMO9X8SpEHeUzwOQHA3maFFdRPGVwtT2O7j8Hb3+7nC6lEViqI
	kBMWynq1w7V/NqrWeRP/6/p+lX3trM3Z8qky/7EfzGEp0d+NI7IIFCG4xphI6lsAfKYlML
	Ra8s92lOC4FlykbEgh0aB6NmS7psnu4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-SALP2iauNZmI_40mjZ1Fww-1; Tue, 27 May 2025 08:35:24 -0400
X-MC-Unique: SALP2iauNZmI_40mjZ1Fww-1
X-Mimecast-MFC-AGG-ID: SALP2iauNZmI_40mjZ1Fww_1748349323
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so1878472f8f.3
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 05:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349323; x=1748954123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcGyCCr0YdUesOdX9vj/ueLKGtD9L/19RsFWfNjZGPw=;
        b=HHVSR08WghgN2S4LEJtC44u/qt4ipyFL1UBLWXIhg635En0JS/13igjQCvpaGR5sK+
         gaK+AQO4/YZAZP++6kV/Pqy1FOHIIgJQ+Td0lVBx/X0q3RjpxMv4FVHt5rfqTdtIzq5v
         9vdV4bsIm7bqEeA3Ukb5dm4KTX3xCu2xtrjuryV9gYZxwp6u2WX3geusm9f/PoAdU4mA
         qdoFSwgJgsv++Z79SLrdqjK7ahLmV92/0n8c9QYoyyEbtnKnXmghXHTDNNpk7lYxaSLN
         9z7YD+WxSlIyHSkeN900c2T0i+OaFO8VkbKrrsNCg5vvWv8jrftcTS7be/wt29MtJmZB
         ZmvA==
X-Forwarded-Encrypted: i=1; AJvYcCXdknM4zRIQaORi5/3skI8DhOO9qgWHsosMZCpZUC5Jt0EMoT3oW7iod8ZT6e41GkrQ8/eljmHWj8C0qg==@linaro.org
X-Gm-Message-State: AOJu0YxSYDHmKd7p5yNJFbmCBaTfZ+f7dy+1ZXH9uikaMn/NWtsPnx+r
	SVSevDrrnJBBMK70WKlZm34tvly/PQ9VbQzHNX5cCfiar66eUWFxxB2FWf5BQQtY6hHYjDLEkWa
	Qpf7mntLiyBI/hVUpSRWjtiutEEZeMDIr8G/8hGUeeygE3l+37DpRlx21qQ==
X-Gm-Gg: ASbGnctXHQQ93n6cv+20pUqhrbybctmTfS1Vow1nyHYVv9FM22TPISoeuojnaKXp0OA
	lJVDj0hh2w6xa5ZQK3QzVpO4XZ963gjQeijM6j6UUzTtx+n4DqKPa3l6cPoVvbFMKBjZlduYSpJ
	vOttnqq2daFREaibjdMDOHQ1Nd7lD4Q605mM5UY3AEs0ImenMCzGcegzSSaiYXNT4/xCh2I5zj1
	/YEj1lchv3CWkp/zcTdfsRPjrbQTh4nzPfiScid4G4hAG4Nphu77t2GL2Gu7KQOqbLMAD92wsoN
	hGxjOgm24VH9vj8C/QPg3w8RK/lw2xZR
X-Received: by 2002:a05:6000:288e:b0:3a3:652d:1640 with SMTP id ffacd0b85a97d-3a4cb461598mr10329056f8f.2.1748349323093;
        Tue, 27 May 2025 05:35:23 -0700 (PDT)
X-Received: by 2002:a05:6000:288e:b0:3a3:652d:1640 with SMTP id ffacd0b85a97d-3a4cb461598mr10329027f8f.2.1748349322661;
        Tue, 27 May 2025 05:35:22 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cfed7257sm9238318f8f.49.2025.05.27.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:35:22 -0700 (PDT)
Date: Tue, 27 May 2025 14:35:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 07/25] hw/i386/acpi-build: Turn build_q35_osc_method
 into a generic method
Message-ID: <20250527143521.0dcd8f8a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-8-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-8-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P4Af3uE_D3omIeYhCRoQTY_Ni-8LNrdwX6D53dwW6vE_1748349323
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: xGNpQkWrsMPq

On Tue, 27 May 2025 09:40:09 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> GPEX acpi_dsdt_add_pci_osc() does basically the same as
> build_q35_osc_method().
> 
> Rename build_q35_osc_method() into build_pci_host_bridge_osc_method()
> and move it into hw/acpi/aml-build.c. In a subsequent patch we will
> use this later in place of acpi_dsdt_add_pci_osc().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  include/hw/acpi/aml-build.h |  2 ++
>  hw/acpi/aml-build.c         | 50 ++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c        | 54 ++-----------------------------------
>  3 files changed, 54 insertions(+), 52 deletions(-)
> 
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index c18f681342..177d60b414 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -508,4 +508,6 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>  void build_spcr(GArray *table_data, BIOSLinker *linker,
>                  const AcpiSpcrData *f, const uint8_t rev,
>                  const char *oem_id, const char *oem_table_id, const char *name);
> +
> +Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
>  #endif
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c

I'd suggest to use hw/acpi/pci.c for PCI stuff instead of generic aml-build.c

> index f8f93a9f66..ba1dfe0b52 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2614,3 +2614,53 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
>  
>      return var;
>  }
> +
> +Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug)
> +{
> +    Aml *if_ctx;
> +    Aml *if_ctx2;
> +    Aml *else_ctx;
> +    Aml *method;
> +    Aml *a_cwd1 = aml_name("CDW1");
> +    Aml *a_ctrl = aml_local(0);
> +
> +    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> +    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> +
> +    if_ctx = aml_if(aml_equal(
> +        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
> +    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
> +    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> +
> +    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
> +
> +    /*
> +     * Always allow native PME, AER (no dependencies)
> +     * Allow SHPC (PCI bridges can have SHPC controller)
> +     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> +     */
> +    aml_append(if_ctx, aml_and(a_ctrl,
> +        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> +
> +    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> +    /* Unknown revision */
> +    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
> +    aml_append(if_ctx, if_ctx2);
> +
> +    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
> +    /* Capabilities bits were masked */
> +    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
> +    aml_append(if_ctx, if_ctx2);
> +
> +    /* Update DWORD3 in the buffer */
> +    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
> +    aml_append(method, if_ctx);
> +
> +    else_ctx = aml_else();
> +    /* Unrecognized UUID */
> +    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
> +    aml_append(method, else_ctx);
> +
> +    aml_append(method, aml_return(aml_arg(3)));
> +    return method;
> +}
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f8572eebe..91945f716c 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1111,56 +1111,6 @@ static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
>      return dev;
>  }
>  
> -static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> -{
> -    Aml *if_ctx;
> -    Aml *if_ctx2;
> -    Aml *else_ctx;
> -    Aml *method;
> -    Aml *a_cwd1 = aml_name("CDW1");
> -    Aml *a_ctrl = aml_local(0);
> -
> -    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> -    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> -
> -    if_ctx = aml_if(aml_equal(
> -        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
> -    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
> -    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> -
> -    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
> -
> -    /*
> -     * Always allow native PME, AER (no dependencies)
> -     * Allow SHPC (PCI bridges can have SHPC controller)
> -     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> -     */
> -    aml_append(if_ctx, aml_and(a_ctrl,
> -        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> -
> -    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> -    /* Unknown revision */
> -    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
> -    aml_append(if_ctx, if_ctx2);
> -
> -    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
> -    /* Capabilities bits were masked */
> -    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
> -    aml_append(if_ctx, if_ctx2);
> -
> -    /* Update DWORD3 in the buffer */
> -    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
> -    aml_append(method, if_ctx);
> -
> -    else_ctx = aml_else();
> -    /* Unrecognized UUID */
> -    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
> -    aml_append(method, else_ctx);
> -
> -    aml_append(method, aml_return(aml_arg(3)));
> -    return method;
> -}
> -
>  static void build_acpi0017(Aml *table)
>  {
>      Aml *dev, *scope, *method;
> @@ -1231,7 +1181,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
>          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> -        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
> +        aml_append(dev, build_pci_host_bridge_osc_method(!pm->pcihp_bridge_en));
>          aml_append(dev, aml_pci_edsm());
>          aml_append(sb_scope, dev);
>          if (mcfg_valid) {
> @@ -1353,7 +1303,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
>  
>                  /* Expander bridges do not have ACPI PCI Hot-plug enabled */
> -                aml_append(dev, build_q35_osc_method(true));
> +                aml_append(dev, build_pci_host_bridge_osc_method(true));
>              } else {
>                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
>              }
