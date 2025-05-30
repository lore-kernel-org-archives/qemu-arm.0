Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1027603njh;
        Fri, 30 May 2025 03:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTIu7PyMMXlRY4Uqd1c9n2p+zDQCbO0TQHPfXlMANeGr4mF24WBCCHXiSzjZwpq0lkWBaEKSBrHNUXlA==@linaro.org
X-Google-Smtp-Source: AGHT+IHVt2AnZ8dyFHwZXayUXuEmFoSiepjfUX9TZJ5v7OghCquWxTbQ4rVESsSpo5ptC+HpxQKn
X-Received: by 2002:a05:6000:1a8d:b0:3a4:ed10:c14 with SMTP id ffacd0b85a97d-3a4f7a1c572mr2085486f8f.14.1748599508466;
        Fri, 30 May 2025 03:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748599508; cv=none;
        d=google.com; s=arc-20240605;
        b=MkVLU7onjsyDChH15EQrZDNxk4ZsqJ/7Kbq425jTyYdZkiYdjG/aZkpcZpr5swYjEY
         SDuoPUj6KkMOUpuyUwU+z8dMe6EeNmwoOEyU1TEKAN9lO7Cx6E0mq3DmI9EhtWQh7Wun
         GWcyryvUPan9MOWx33RnH+mPWbbtIepKWdHX6s+voJU0FjELaK/PLHs3BH0pA9R32s12
         fBXuseVAuooT54qaf62AymHiaunEd4dwvUIIgAMb7BDrQGnMWaTiCP6sxuNlwuNRy+vz
         avmbwh97JOy5we55DJDrr8jPNPzPrngKH28QsNOMO62JAmjGcxyK8cCEmH2Mn09pBKFT
         LjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=pOwjapNPCfpPkmeOrkgqvF3K0tPJ/P93BX6Gq1mib7o=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=cvEOhknZ3HXty6c5oxmaU1+bOru3ia26vJ0NedQF9oAuiHXg8FGsw5lVXAOs37r3N7
         LOgT/ahFJMq5p1xZFoOLeiJfWhube+cYjmJ57o5AIoyvEBwYvwOYswI8urbY5wFmTXaI
         o8mKVk1PyKCcbVIGVRq+3ohFyxHUFkhcNkY1JFzcuMDdTYPbSrRNJOE2Cok7CbhIJwKi
         tzlHQeqTa7nVX5cA4olMVe0zquEpTflPseWkVizr7HQdvSzt0N2btbXT0krTGXku8TgB
         7lEXpnBLLeBsJqD9dwi3NFXAHrcHkKFAmBhPvbZFDsze4igNIYqoHUbuBHT8rkkygP3h
         nLXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4efe5baefsi2588495f8f.235.2025.05.30.03.05.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 03:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7zPV20tWz6GFWw;
	Fri, 30 May 2025 18:05:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AC69C1402FC;
	Fri, 30 May 2025 18:05:07 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 12:05:07 +0200
Date: Fri, 30 May 2025 11:05:05 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 09/25] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Message-ID: <20250530110505.00007430@huawei.com>
In-Reply-To: <20250527074224.1197793-10-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-10-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 4YlHy+Q7U7+f

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

This is where they become unused I think...

>      /* Declare an _OSC (OS Control Handoff) method */
> -    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> -    aml_append(dev, build_host_bridge_dsm());
> +    aml_append(dev,
> +               build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
> +    aml_append(dev, build_pci_host_bridge_dsm_method());
>  }
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
