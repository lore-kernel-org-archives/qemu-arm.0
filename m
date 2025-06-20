Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp846403njc;
        Fri, 20 Jun 2025 05:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtTN1Aeusx/U1lvYJYHf5rgEhox6JS8YzBMCly7NgadL8Jm7ZYOW8jmEW4VHr2o8QTiD9LLGY+XRFrmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFkNQcUHs8FxjHgoU04n2JYUE3rKCl0cv3p55RXJfrR+VhiSzM6E2pqt9cf2vqRqJJy3oVS
X-Received: by 2002:a05:6214:318d:b0:6fa:bb26:1459 with SMTP id 6a1803df08f44-6fd0a44eb39mr49443106d6.7.1750421773156;
        Fri, 20 Jun 2025 05:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750421773; cv=none;
        d=google.com; s=arc-20240605;
        b=XsGqtuPEnnGjDtMt4NnlUaH6tFwrY0K/Zaw1+7ZXnQ9q7Xfwi1c+ZdeIkVlUfFPfc5
         l3fb6pDMpTJOwebkCVDYPQ1svofYiX8yDZb1X+fjxybmTIezhmd93EfRZV3sPKEhUT/2
         ceS7dLIOaVaAc3ybvv4ypl+DwqSYbdLd6Gp0IqlgEOiYe1fmo+qTFK3WT/eP1KaIvrk1
         y0YsIKLNFEF0w5nTEWvlkyIx5qjxh+u6z940F2wv/5q3zO9WCkDM0AAHDLf3P7h/Lmy8
         4VPx70F4ovbVT21FcM8AKRv+sGanTj/HXCQ6Txn1s8eqQ3nENFW0FAQehyMKJlmzxpm5
         F3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=YttMP97XA0YGzCwUTM9cPhn/4IsllK+DArVX8YtuLig=;
        fh=M9Z1ygJpLkI/B7yRujdqaoAHtwAgpa6HR5jvUd98D6Q=;
        b=CLplp9MLmuqZQryFWeLrAVdzYpn8TdWpQG0OFOwQcHoTN29ri3nSx88W6llvlE0kxw
         eNCvVBTilrS+diwbGXwUUHxgrM9A9Gt/pBqPEBQx7Ftn2B5IvGRe7eOGjimqfH2+yIJS
         awH4IZVKoj7L556kuHD2DGxEWNAReD/39d0xafVi1xJDfidI+dN56FpCZBtJKKmF8FEf
         xdBILFD27tSe46h96DvozHKGJ0Sg5sxx20SoKoTB1s8NVFwlaTm8AxCFdmPKiXeAF/Zd
         sJlrvmYgGwx4UlVBCpj6tb8kEsJRMG9WnF7ziZjtrrGGa4Af2CdOzybTugBW06atZSWy
         k5kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hHMYE6tc;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd093df85dsi19695636d6.16.2025.06.20.05.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hHMYE6tc;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750421772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YttMP97XA0YGzCwUTM9cPhn/4IsllK+DArVX8YtuLig=;
	b=hHMYE6tcaShK90DdV9kiwcb+wR+xGWswlMsnbxlt+ihYKXwxZ48zPm1HWffwZw6Jcn8rj1
	OedYbCuOS62vuHOl4dZfoSSQl7x+VqWXfoZ/OWFUU4glL2fxFVHp/pQR+tbILU+tkn8XlN
	SVYSMULsdj9RZBNvewMhHPqp4VgnNSM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-ZtndxtZ5OdGVLK898GItRg-1; Fri, 20 Jun 2025 08:16:09 -0400
X-MC-Unique: ZtndxtZ5OdGVLK898GItRg-1
X-Mimecast-MFC-AGG-ID: ZtndxtZ5OdGVLK898GItRg_1750421769
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4535d300d2dso13446635e9.1
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421768; x=1751026568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YttMP97XA0YGzCwUTM9cPhn/4IsllK+DArVX8YtuLig=;
        b=XeA1nS9n4ENf92x1eB1pelQiEHKglKOhkRbU/f2sXgGtNkDZPHSXgZR7irESL2UZlT
         MCzjolqZ02lNFwupMVREUyz9YGhCC5lXwhu4DN8DKVxgHSd/vJiecxKbD3jyWgBE4x8p
         E4dnPRo+G8JzSSpa0MUFYSdTOvHiFjL4fyfQ7X1e8dcmXpW6hxKx0TGbsB7XJvEcI0Z6
         sV4byryu6eWi0ghXD2UFU0jMtJ/tU3zze3x94o9uP3d41rl9k/0T/desdHt+SzooHwxx
         CZfJuka9b4IYCnjPh/wmS3eES3x5vRaGTW6+UQu0OZTCb/fxa+gql4eszo4ijFyLcIbo
         z8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMkhP9l36WgfDwFH+eMpIpDftscMsnEgsms1Bt6FRd9dKg5zN/Kzq9moakRx8EEK0UbIOegqFpCQNx+A==@linaro.org
X-Gm-Message-State: AOJu0YzfW5WzZ/RcpDiplnzOQis1dGhcUn5TBt5146LI/E+2jYzp0EUP
	lp0VuUqihyXIERm5OW8vWzaEwEq8P1zqrLdGwglOMwoxrzeMuuu+bWhUKK+OAK5d8iJ4OP3r/lX
	jdtrXaNPuM7+7J0gp/mK249rm0S5TpA8/oaMT58/8vyEczePKgJUD49k8ng==
X-Gm-Gg: ASbGncs0qRz00q59ZzkfOXN2noIx8ZLglj/yHlYy93zwtoxEfNcSNRHV9cSG/x1cM3I
	EAu4GGBiqptbvHrzvYZzLaWG5JxlaJxotIAl7D2mTbQSuAFWv6J8gkFeFkrpFOc7tALW+BAYsAb
	3+opuNkfj88bxztWTRQ6ypwLHaciWGqWkBl8iJDQXjYa0BVlLbYzjfbJ5x/H7U/O0iNw0Oei/S4
	0Kt6ZjAq231QE7MNDrzY2wxcqMRt9VvN57hCooFkkpzAhr9at2sqwx16QKZE4N3gx+njY4zqZr/
	P3hBwNkrX/4E
X-Received: by 2002:a05:600c:4684:b0:453:d3d:d9fd with SMTP id 5b1f17b1804b1-453654cb7cdmr25695295e9.12.1750421768535;
        Fri, 20 Jun 2025 05:16:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4684:b0:453:d3d:d9fd with SMTP id 5b1f17b1804b1-453654cb7cdmr25694855e9.12.1750421768092;
        Fri, 20 Jun 2025 05:16:08 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190cc3sm1892106f8f.89.2025.06.20.05.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:16:07 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:16:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 09/29] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Message-ID: <20250620141606.709c49a7@fedora>
In-Reply-To: <20250616094903.885753-10-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-10-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 55DqJHMLNkZK4DTQH_OFkO1iwzid2iu4LL818Rf1JG4_1750421769
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Ndu4zqPG7pPT

On Mon, 16 Jun 2025 11:46:38 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> gpex build_host_bridge_osc() and x86 originated
> build_pci_host_bridge_osc_method() are mostly identical.
> 
> In GPEX, SUPP is set to CDW2 but is not further used. CTRL
> is same as Local0.
> 
> So let gpex code reuse build_pci_host_bridge_osc_method()
> and remove build_host_bridge_osc().

qtest fails with

FAILED: qemu-system-mips64el 
cc -m64 @qemu-system-mips64el.rsp
/usr/bin/ld: libsystem.a.p/hw_pci-host_gpex-acpi.c.o: in function `acpi_dsdt_add_host_bridge_methods':
./hw/pci-host/gpex-acpi.c:83: undefined reference to `build_pci_host_bridge_osc_method'

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
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - move in the dsdt.dsl diff in the commit message and remove useless
>   info (Gustavo, Michael)
> ---
>  hw/pci-host/gpex-acpi.c | 62 ++++-------------------------------------
>  1 file changed, 5 insertions(+), 57 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 44737a8d81..952a0ace19 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -1,5 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/arm/virt.h"
>  #include "hw/pci/pci_bus.h"
> @@ -50,61 +51,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>      }
>  }
>  
> -static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
> -{
> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
> -    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> -    aml_append(method, aml_name_decl("SUPP", aml_int(0)));
> -    aml_append(method, aml_name_decl("CTRL", aml_int(0)));
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
> @@ -133,8 +80,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
>                                                bool enable_native_pcie_hotplug)
>  {
>      /* Declare an _OSC (OS Control Handoff) method */
> -    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> -    aml_append(dev, build_host_bridge_dsm());
> +    aml_append(dev,
> +               build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
> +    aml_append(dev, build_pci_host_bridge_dsm_method());
>  }
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
