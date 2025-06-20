Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp843895njc;
        Fri, 20 Jun 2025 05:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTyXmYlJezYLfb/LB0fwJZn8M3Xz/pbA9ivrnzM8dp0YTIWBeby2nm8PCi/1o3FE0mgylTusdx5JCOGA==@linaro.org
X-Google-Smtp-Source: AGHT+IHdiaUQQ/AJHHGEDT45RGqV2gm7F7Du3NOF2trGLQbwKyrw7Ex/cZ/grRe0xHnXvWumN+x9
X-Received: by 2002:a05:6102:2b8b:b0:4bb:eb4a:f9ef with SMTP id ada2fe7eead31-4e9c2766d8bmr1233652137.4.1750421511730;
        Fri, 20 Jun 2025 05:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750421511; cv=none;
        d=google.com; s=arc-20240605;
        b=SrreDWhKCUXOWzajuY5CBuqIPf8TlCYJscUImChUKgm3iOxOe+u8XFP7PgBGy0vn/O
         lGX2bv0ZChivgW0XN53Um1MHnArN51qo41CC+tBfzk9poD2erjvYOvYNDSOyO4BjER1W
         63668BiwccW6Y8B+67jiO2esqr2cDTfYwYZQu0Q7ddHQENF7kMBYo/KcE6rUvGY/UfO0
         91QWQ+mllWsFyn+UB8IQGCVrhQQseW8xNQHbpbaY92liEV8waAVQSy8OE0faGSIONmm4
         ZF1ANPjAbHp7E8ZLSLLJZ+uKp/ccaa9njw59NUU1K8oYsJ5Y3Fb3lvdMPejjPk2/bk1t
         394w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=/Ir0px5WCIDm9aNSHCxvhKa6T9zzjSsHqMnbniD/uT8=;
        fh=xRnrxSnEFdJqXw2UpsdllzjRIgwVkLtipboRzPshk08=;
        b=R3I+IdEQ8u1vQhAvw7ZUmkxUC/WBYgnN1ct2UYQPVAokhmh4yfVgzoTLOGN6ynH8FW
         s7coyjTI45hp4eW0yyoJSrXWtgObzq42LuUZt6es716XykwQuV4reJmJbxs7I2G9qT93
         6LHfH2zJg7QZ21bpvF2Pov82IvucnJjT3npCz3nn+25PPXXP4OE6Y0OZbspgOMoIeBr1
         +019VJETzDLESMRtmubEl+pYFh0VpEeNM7dCfOS6DRLecJJQbvRbK8CQndWLjBgT+RUC
         d8A/MANqjsOhF6vgXAITxj1ZTBI/lpNuzBZ8HJXxGap+mXQ8b0Eic4LaZSr+DsOCnWIQ
         a/Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWaamu9T;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e9c4af0b4dsi210522137.209.2025.06.20.05.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWaamu9T;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750421511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ir0px5WCIDm9aNSHCxvhKa6T9zzjSsHqMnbniD/uT8=;
	b=HWaamu9TBJPagmSJpEaxyrBwrEw/aqB7Wt6kSMFoGhaP2iMyR3jqMNWkihI9usZvpECH8L
	zd65hrja++NFlRIidNGm8It3uTVUfqgmYJKfDgmGa4GDu0aMHB62X4zDY1oAowfzp7CN3o
	JmcTygrQUyOsTR3MnNVJCKDsN+utyi4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-W2w2muzvNriuWWdcydgmrw-1; Fri, 20 Jun 2025 08:11:50 -0400
X-MC-Unique: W2w2muzvNriuWWdcydgmrw-1
X-Mimecast-MFC-AGG-ID: W2w2muzvNriuWWdcydgmrw_1750421509
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso10550155e9.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421509; x=1751026309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ir0px5WCIDm9aNSHCxvhKa6T9zzjSsHqMnbniD/uT8=;
        b=V7zmYJBl7BbIYBeYLlzNcKHV/6QmJjYx1UA2jlnHY28BpEvJ08umQnVSst33DCrR+M
         IlkRZALTxhRhfGSNETyGjmjn5CsbS/2tM8eOE1sqXk1n5mTy+lHfOQe+ZG/d0t5skHkJ
         vol2NvvN2u3yyIazqRO9KqUlUnB2s3h61nXhb3jqx3GCw8tuBXYzTPX7Gfkr1x0KJs/4
         PnukxRGljkx8fkL02IaPWiNW83AoX62zoJ2cXNSRh6YJ6J7KYuo1yTOFcb4vlIqaXUAH
         8itpHM4bzc1CKYpkMgJP/EWw7dcg0+fnC0SQ3x/nK6iWb7EzGPHLfkAqfuShSkEwLpAb
         W88w==
X-Forwarded-Encrypted: i=1; AJvYcCUvb45Gx4BEGFyDJlDjmyBNBtGwMtdvzvn9896ra0PPmMmlDBCKb8Hkc/97PryLaqia2sKSSkNLt81cvQ==@linaro.org
X-Gm-Message-State: AOJu0YwPAQqeuki69M88l9C+Ob7+Z4/VTlB9ESXPsYmCY5b0gG/Cyxt4
	/PLnX8cVZ5WxTmT4rXkK60yO3tLeQfkb4cbfzXhBgLceGdZOYRfkKuy6+klQnut3MYwdIZi466F
	dImwSnPaCcDl1psnS+vY37zEwW6FfdvQ1duykbs2Nifw1OYW48ikWxWmPrA==
X-Gm-Gg: ASbGncucGaOOyv7gWQMFGddNCwiUi2apFYSpUynvkSnC/LlchyKnxv3KuiD9Nxx0RFZ
	a4ecoZuDo6mpXekmnaKKeLExVUDni72sfAd3EH1RyXW7voy00deTN5sd4IIDHLt1rTUUHk/mGMb
	Vy+nuqJmymU1srlVJiMlgRkX1YcBju5s/71E+7rz1UQkljpTOiBuaA/mC9DNmxuvIsTEqdvG3YW
	zaw3uxe8XNdwPVOn4y+ju4MaIosVrv5vEo88bcXfGMRMaF37xN5Ktb9qdu747wASh8AJKcOQ2uB
	u3vOKfDRv0HO
X-Received: by 2002:a05:6000:1a8e:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a6d12db6d0mr2171301f8f.15.1750421509051;
        Fri, 20 Jun 2025 05:11:49 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8e:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a6d12db6d0mr2171283f8f.15.1750421508652;
        Fri, 20 Jun 2025 05:11:48 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19f9esm1925745f8f.39.2025.06.20.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:11:48 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:11:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 08/29] hw/i386/acpi-build: Turn build_q35_osc_method
 into a generic method
Message-ID: <20250620141146.503c89e8@fedora>
In-Reply-To: <20250616094903.885753-9-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-9-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OAlmsTnR2QMAitpUoA2kmjPbEFeFzpxXttRRwszJ9SI_1750421509
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: mW3FdJPpm5/H

On Mon, 16 Jun 2025 11:46:37 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> GPEX acpi_dsdt_add_pci_osc() does basically the same as
> build_q35_osc_method().
> 
> Rename build_q35_osc_method() into build_pci_host_bridge_osc_method()
> and move it into hw/acpi/pci.c. In a subsequent patch we will
> use this later in place of acpi_dsdt_add_pci_osc().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> v2 -> v3:
> - move to hw/acpi/pci.c instead of aml-build.c (Igor)
> ---
>  include/hw/acpi/pci.h |  2 ++
>  hw/acpi/pci.c         | 50 +++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c  | 54 ++-----------------------------------------
>  3 files changed, 54 insertions(+), 52 deletions(-)
> 
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index ab0187a894..8a328b580c 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -42,4 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>  
>  void build_srat_generic_affinity_structures(GArray *table_data);
>  
> +Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
> +
>  #endif
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index d511a85029..2228f1245e 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -301,3 +301,53 @@ void build_srat_generic_affinity_structures(GArray *table_data)
>      object_child_foreach_recursive(object_get_root(), build_acpi_generic_port,
>                                     table_data);
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
