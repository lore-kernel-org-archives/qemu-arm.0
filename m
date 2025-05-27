Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4798014njc;
        Tue, 27 May 2025 06:04:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpK1qLyKIIwPaFeQg9GbDpsY1qYEJLQMalswZoU4jYJDMY2WSJGGdzOKL0Jv3/FgXDO8wu4uCQtJ6E4g==@linaro.org
X-Google-Smtp-Source: AGHT+IF77OhZKgg8Sq7OyDCzm8zlBjKEpexjg/L8GQeZyS5P2JUDVvxDl7rOJ9z258W4Yp8Vym9P
X-Received: by 2002:a05:6871:a6a9:b0:2d6:49df:a649 with SMTP id 586e51a60fabf-2e8621cb55dmr6509113fac.31.1748351089948;
        Tue, 27 May 2025 06:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748351089; cv=none;
        d=google.com; s=arc-20240605;
        b=GNLE84iv5/o8zesM2itF0ccElwQJetTppzL/hnt4+lXP8iWzqo9X+l4OEAxhbwLGj/
         v4Bi0gGvrujiIr2cj94qv+Ywp0r3gVS8EirhSwwQWhAlMFtlaml1c5DayVHA4VQdC4er
         Mnpsl8dKjOFKT+cuVEjySqeN7DE/IwF4PbMHZeWZFROrgVRs7X/iEbDoqIFqPBZ/B9Km
         T5Rg1Ed4YgTsUlhChfffwRAWeBXlR6oLZguuA/KRHcyDWw2lDqAv/vdAvhiT+/VRyhww
         5l3gYkchMimbzRE7Qqmg1pP6XogehayLOUAIiBmbXZGARPbe1NwK8DI6JXFGfCUGz2AF
         5XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=6Zq143DMxx57FqIKWyVTb6CkcLFEhVgvOIgrpCQWvfQ=;
        fh=aSUgVoJdJ/spnkpsXLfWfcKyurqXcbhbHm+Q7t/+cGo=;
        b=CB9Zx0kOn7yklTzhpBVKx+K5CK20Eejg1pYVyQRmOwwlVZwJw9itf2q9YDAGzG7MMY
         eGc0sCnxZiQCJJYyB1p61bw7LpxDeLPmMd3FUReh1AsNtHXonA2zB0NwhNYXlfl4t1iR
         EpiNMC7umvEqQJ9Ep23yHTSiDxvL8WXog1LGWCwlh8f5UiMfQkX8Bgs+OrE2a+u8RhFQ
         YqdSvQhbggj+JOD1U0BLYMmAVnFeckSgXyVunPyeh2FC6rQDUrlNHxtDtOeZePq43LeO
         /K21TsKB1+Ke8/3nEhaqNCMrYOrmZTjwUXAQB4nPwSPCQ/fjZaGf9SXPYmHG/GE8ZuX6
         EavQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3QqYl4K;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 586e51a60fabf-2e3c06da36csi15675518fac.107.2025.05.27.06.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3QqYl4K;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748351088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Zq143DMxx57FqIKWyVTb6CkcLFEhVgvOIgrpCQWvfQ=;
	b=a3QqYl4KwvrcjIC7alkJ2yBcHXDP583JDs1pRjfl2xGk/Q4dDGumwUaLifMnqB8wz+l4Ve
	hExKDEP6nItlBjsEbNgJW2LGQc/8HoPJaO8/XK5T2WPmPvFKSYehEWoLmzp2Thh6u9Xrng
	7D63OiSKx+Y+InSBtcf1a3p350NPl70=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-3QbawyluNLqnoX7Hp8hazg-1; Tue, 27 May 2025 09:04:47 -0400
X-MC-Unique: 3QbawyluNLqnoX7Hp8hazg-1
X-Mimecast-MFC-AGG-ID: 3QbawyluNLqnoX7Hp8hazg_1748351086
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso1543150f8f.2
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351086; x=1748955886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Zq143DMxx57FqIKWyVTb6CkcLFEhVgvOIgrpCQWvfQ=;
        b=HNQdD4CRUsKKq8jzh3maDyzbg7fjclGi/tWtGq4UOs6mLM5XlcTB3l8Ml+sqmUZ+Co
         oGUrxwGddufWxSs0eekg1lSiFQ5sG929ASftFhVVlF8JfiNOWNadnxMHo1QhHxtOdLx9
         EbBmyfBGXJT122K0L0fsvazpolWeNpf5kzoODkbBxkPMo3DXJTQhV98EPazxfQRuZ/OS
         fvTo3CMr0puKTJmyhPdxu2kX/JZTdZNxYGWk6Y58eAxgMIbikS8Oat6bFasC3pZCc32F
         NiZ4MCNuf/u5HKQ3Q+7PDYlBXUgQXclW0hoK9UG3u2/jUsXMqDlYK34XOl44gtMSbaSV
         4oyA==
X-Forwarded-Encrypted: i=1; AJvYcCXGAZTHIQgb7BoE/zpaYNhnBYcJnmGLBDkBHH4/ZuJJ/jiiAiEyFLrx6dgU/hTNtpJVrET41S0ucOUESw==@linaro.org
X-Gm-Message-State: AOJu0YwYxI6X2fvnONAMj42OegIvKsh2hQAvj8ILDmI/eYV6B/GDrSTi
	fxbjiWYy+4S/njICxHeqOc1Ma/yJQTCxn1pqCwPG8/5Pt8Z0ALYBpVxKrY7Esy/f/mzaPVQldJT
	Dp3qEO3ZCa7a+lQhZA1rjF/YzQhzsuDTCB0O0Qlop9CHAka8ZydfV8mqILQ==
X-Gm-Gg: ASbGncvhm7RxZKqb2hQzICSfjGVWBXQsJidQHSjOcpNTxSBOoRpUli/01uuX4NJ4yyt
	r/xJ4s9GGEL3xZsl9oRkfi6LNUp5QP++gXsTbSgB6MS9Z/a0+wtyB9qYq54WXUwREzzsuKIylNE
	1I4IYivwZrnEHqHh6o5YKtGoBbsLyFHbiXTtpBrBIVc15+cg5ZULYjscmRi43kUlVS3ToDqgITj
	OKdZIQCqQAuPudKiPt2DTW9+b1IDORY2uyB1rzGQuiWA/q0mA/GHPvI/0h54kEWY9T8xNvzmEoT
	c65Uhb+mMM/PctFwqKwZAqqQaAHtzTE8
X-Received: by 2002:a05:6000:40c9:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a4cb43473dmr10183380f8f.6.1748351086130;
        Tue, 27 May 2025 06:04:46 -0700 (PDT)
X-Received: by 2002:a05:6000:40c9:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a4cb43473dmr10183318f8f.6.1748351085626;
        Tue, 27 May 2025 06:04:45 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c73a4284sm11910275f8f.85.2025.05.27.06.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:04:45 -0700 (PDT)
Date: Tue, 27 May 2025 15:04:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 09/25] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Message-ID: <20250527150444.1018537a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-10-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-10-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ln7f05ufrx-vyz6o3JbQ5taf2WGp1NdgCo9ES383fKo_1748351086
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: RvMQwBKJsqIV

On Tue, 27 May 2025 09:40:11 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> gpex build_host_bridge_osc() and x86 originated
> build_pci_host_bridge_osc_method() are mostly identical.
> 
> In GPEX, SUPP is set to CDW2 but is not further used. CTRL
> is same as Local0.
> 
> So let gpex code reuse build_pci_host_bridge_osc_method()
> and remove build_host_bridge_osc().
> 
> The disassembled DSDT difference is given below:
> 
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x00001A4F (6735)
> + *     Length           0x00001A35 (6709)
>   *     Revision         0x02
> - *     Checksum         0xBF
> + *     Checksum         0xDD
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
> @@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>                  {
>                      CreateDWordField (Arg3, 0x04, CDW2)
>                      CreateDWordField (Arg3, 0x08, CDW3)
> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> -                    CTRL &= 0x1F
> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> +                    Local0 &= 0x1F
>                      If ((Arg1 != One))
>                      {
>                          CDW1 |= 0x08
>                      }
> 
> -                    If ((CDW3 != CTRL))
> +                    If ((CDW3 != Local0))
>                      {
>                          CDW1 |= 0x10
>                      }
> 
> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
> -                    Return (Arg3)
> +                    CDW3 = Local0
>                  }
>                  Else
>                  {
>                      CDW1 |= 0x04
> -                    Return (Arg3)
>                  }
> +
> +                Return (Arg3)
>              }
> 
>              Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
 
> 
> ---
> 
> v1 -> v2:
> - move in the dsdt.dsl diff in the commit message and remove useless
>   info (Gustavi, Michael)
> ---
>  hw/pci-host/gpex-acpi.c | 60 +++--------------------------------------
>  1 file changed, 4 insertions(+), 56 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index f1ab30f3d5..98c9868c3f 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -50,60 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>      }
>  }
>  
> -static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
> -{
> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
> -
> -    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> -    aml_append(method,
> -        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> -
> -    /* PCI Firmware Specification 3.0
> -     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
> -     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
> -     * identified by the Universal Unique IDentifier (UUID)
> -     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
> -     */
> -    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
> -    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
> -    aml_append(ifctx,
> -        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
> -    aml_append(ifctx,
> -        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> -    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
> -    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> -
> -    /*
> -     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
> -     * and PCIeHotplug depending on enable_native_pcie_hotplug
> -     */
> -    aml_append(ifctx, aml_and(aml_name("CTRL"),
> -               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
> -               aml_name("CTRL")));
> -
> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
> -                              aml_name("CDW1")));
> -    aml_append(ifctx, ifctx1);
> -
> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
> -                              aml_name("CDW1")));
> -    aml_append(ifctx, ifctx1);
> -
> -    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
> -    aml_append(ifctx, aml_return(aml_arg(3)));
> -    aml_append(method, ifctx);
> -
> -    elsectx = aml_else();
> -    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
> -                               aml_name("CDW1")));
> -    aml_append(elsectx, aml_return(aml_arg(3)));
> -    aml_append(method, elsectx);
> -    return method;
> -}
> -
> -static Aml *build_host_bridge_dsm(void)
> +static Aml *build_pci_host_bridge_dsm_method(void)
>  {
>      Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>      Aml *UUID, *ifctx, *ifctx1, *buf;
> @@ -134,8 +81,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
>      aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
>      aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
>      /* Declare an _OSC (OS Control Handoff) method */
> -    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> -    aml_append(dev, build_host_bridge_dsm());
> +    aml_append(dev,
> +               build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
> +    aml_append(dev, build_pci_host_bridge_dsm_method());
>  }
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
