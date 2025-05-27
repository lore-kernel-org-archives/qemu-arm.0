Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4779200njc;
        Tue, 27 May 2025 05:31:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWluyc7kY9g5Lv1jEUe+pmHUnGuT7FxZUFxU+YzxVmA12ULjxLLr94A0laUsLiaafc9f0mN6rcbouNFgg==@linaro.org
X-Google-Smtp-Source: AGHT+IEumJwdmHWLXWOxB6eH+pN/r27/+gqiS7JX4uzcND9jKF9rbZyMeXyzF4fI23/VZREL4dtL
X-Received: by 2002:a05:6214:c6f:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-6fa9d2aea12mr200125826d6.45.1748349102400;
        Tue, 27 May 2025 05:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748349102; cv=none;
        d=google.com; s=arc-20240605;
        b=jCPc3Kg/LWrcCtZYLXacYkwPqTmlzPZjJfFAP4/CK2768XQ3eIrF/YI3rDPgY+TV8I
         bzLVeHlC8oIeYqv5OuIGbQOB2MK5s2osQkfQeyllY/uP1K51L1NLIsqB+tjsPX8hjXbk
         newakRCQXcZSyMhBGV6LixCvqlVu3e3bo+BfDxfMw7DXFN402CIJ49I2Ltu6354ltN0+
         rU09woVlgSR3wnJsKfY4YpVvaFXCbjr+YfWlZ/6zyO5WMPNnZOfOxLnQZUIaK1ZQkwg0
         PdeqIQQrYHtJgRLh394XZf35vsE+TwFANwd1Dn2YfjIrMI+DnlV/zJLAacWq93MMO12D
         U5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=khf7rH0HmEe5VYlwa8emnKScvg82xox3EazQfBd2MOk=;
        fh=UZBJSrCYzpnFOfwJ4Vfw1YbEWMFAfZC6WDBofYNKWrs=;
        b=A6dBFR6xizCQML9TcUhxmz+DAetXdsC9IQWCPSRyfgiq57xgf3A5GkJTP9pcrIYlOc
         Rtfc3TINzUYsiEWk50Xt1KxNY8m6zl3U+iOlN4UJMst//MU+H0mwONazV8jSlorbnqbY
         65WMpXuEj7Sl++1JHPa8xs50XjhurI6jWnDSe/gdjFswGudqEUgsC7MlFF4fbJ+U7ubT
         BLHgCXIKI+dFiNo4MyXLYOQbWfSKSVZVcqEoG2TZQZaohpXFhuZqEJka2RFKyNgN7dwy
         f4tDifd+mVcpq7+el4GuVd/5/gXucWlpLLJ6zpglTG/VMc9ZWaSDLqhb04migLU4dRb7
         Z5iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZDdUILre;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faa704fec8si51744466d6.419.2025.05.27.05.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZDdUILre;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748349102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khf7rH0HmEe5VYlwa8emnKScvg82xox3EazQfBd2MOk=;
	b=ZDdUILresqbsJn036+d8K4E5+9YQWMrGmLdHvvgygUyL3JY6uVgjrpdAUcn7mY+W4H4gNp
	x7WFyM7UL7cErOzlckUAvq882YPCuy2u+kbDGJHSo4iohgZ0uckhMoDqIzCYxqibjqDAeN
	VhpLlXtVdhgoYJV5Wv5L6JUhzkvlrJA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-xYNrPx8qOwaZebEn3TuSSw-1; Tue, 27 May 2025 08:31:40 -0400
X-MC-Unique: xYNrPx8qOwaZebEn3TuSSw-1
X-Mimecast-MFC-AGG-ID: xYNrPx8qOwaZebEn3TuSSw_1748349098
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-440667e7f92so17750405e9.3
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 05:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349098; x=1748953898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khf7rH0HmEe5VYlwa8emnKScvg82xox3EazQfBd2MOk=;
        b=Wqvxr6WzhUjGoWZaaleI5wYH9+6VuJcazKg8YWobjh1wGSxp93Gvil7Fk84RWmAAvb
         V1uG7GrCaDAYWJiSe9gOVTASIaDQ+8T/FU5iBs7gm+ruthzUZZSWaFj81q3wZTPdGswx
         93TtDLf6b/q8rJSM+l+8Rgzl/fZWWeD1SLtyepkCx8xTkk552hIhupR9pY1iRrq7VB/7
         voZKUZQwdF8FnL88YAAxsig59zTbToXpjI1UE7SBY5oifCRFWfGNUukfDu+AY1YgqpQ4
         PNCji+QcA0+ttKFu2x9LdOB3FFnCXYkdCj1v2VoEkvgOXQaKWl+tv4HJx2nmEuLg/ReP
         T8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbLRdTURV3E9oic6mXcx02DSZ/siImaAD8zNoTEtsdnhaSvExyFbGsq5W0I4upbJ05mfxbjdk31Wi5QQ==@linaro.org
X-Gm-Message-State: AOJu0YwfNWVFNfnmP2l8FoQyksWGoT3qtoE5d3e9Sklj+88fZn+PrLg+
	ZhDufW2++UfO1tSej8uYQnOPu5+c8xCl5auW7uppl5ggGzOAmOp42gGygVWxbNMlokWaLTBYB/I
	w6gsXf8yjXuwzu4XZJ10byVfFT2wkRma6RkHnvP8wUrI/71hz1Qeb5qh+fQ==
X-Gm-Gg: ASbGnctpFwAUZPLv09qx/dlgTu/RkQ/ENvOgFdTw9KvrFsNnGdPJsOMo85BBkYRPvqh
	kHOd7fTu1V452VHtVYZAfvknGnwPeZ1XIZ789Vs1uQsgucmnJip248ssjLVMr8dNlsqZrCZCLgy
	3YUmvPp980vE+TGNf/1ovuHA6xo8zkbJY+O+2YvOHoLf+Dbo02bzllhZjkpvc1W+NzDOnE+ZLkE
	E6rTnFXM+dZCZ4HGLRUhgvv6IKzrjRwz8Yz2gDfvUhhrL1hFww+sZaGn6D8jiAEvW3MVC76nBpx
	PcS8wfN7skm3iaaCH4uWTx76tkgEsAGn
X-Received: by 2002:a05:600c:34d3:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-44c91ad6cc6mr147728455e9.10.1748349098342;
        Tue, 27 May 2025 05:31:38 -0700 (PDT)
X-Received: by 2002:a05:600c:34d3:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-44c91ad6cc6mr147727975e9.10.1748349097931;
        Tue, 27 May 2025 05:31:37 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef032esm273576215e9.9.2025.05.27.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:31:37 -0700 (PDT)
Date: Tue, 27 May 2025 14:31:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 05/25] hw/pci-host/gpex-acpi: Split host bridge OSC
 and DSM generation
Message-ID: <20250527143135.33a96728@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-6-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-6-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wCZjOHEQ-t7T2xoleLN1PyO7YoGfZM254qdWeikNSRI_1748349098
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: L5THRv7IGWM0

On Tue, 27 May 2025 09:40:07 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
> it appends the _OSC method but in fact it also appends the _DSM method
> for the host bridge. Let's split the function into two separate ones
> and let them return the method Aml pointer instead. This matches the
> way it is done on x86 (build_q35_osc_method). In a subsequent patch
> we will replace the gpex method by the q35 implementation that will
> become shared between ARM and x86.
> 
> acpi_dsdt_add_host_bridge_methods is a new top helper that generates
> both the _OSC and _DSM methods.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/pci-host/gpex-acpi.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index f34b7cf25e..1aa2d12026 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -50,13 +50,10 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>      }
>  }
>  
> -static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
> +static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
>  {
> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
> +    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
>  
> -    /* Declare an _OSC (OS Control Handoff) method */
> -    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> -    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
>      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
>      aml_append(method,
>          aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> @@ -103,9 +100,13 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>                                 aml_name("CDW1")));
>      aml_append(elsectx, aml_return(aml_arg(3)));
>      aml_append(method, elsectx);
> -    aml_append(dev, method);
> +    return method;
> +}
>  
> -    method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
> +static Aml *build_host_bridge_dsm(void)
> +{
> +    Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
> +    Aml *UUID, *ifctx, *ifctx1, *buf;
>  
>      /* PCI Firmware Specification 3.0
>       * 4.6.1. _DSM for PCI Express Slot Information
> @@ -124,7 +125,17 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>      byte_list[0] = 0;
>      buf = aml_buffer(1, byte_list);
>      aml_append(method, aml_return(buf));
> -    aml_append(dev, method);
> +    return method;
> +}
> +
> +static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
> +                                              bool enable_native_pcie_hotplug)
> +{
> +    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> +    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
> +    /* Declare an _OSC (OS Control Handoff) method */
> +    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> +    aml_append(dev, build_host_bridge_dsm());
>  }
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> @@ -193,7 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              if (is_cxl) {
>                  build_cxl_osc_method(dev);
>              } else {
> -                acpi_dsdt_add_pci_osc(dev, true);
> +                acpi_dsdt_add_host_bridge_methods(dev, true);
>              }
>  
>              aml_append(scope, dev);
> @@ -268,7 +279,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      }
>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>  
> -    acpi_dsdt_add_pci_osc(dev, true);
> +    acpi_dsdt_add_host_bridge_methods(dev, true);
>  
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
