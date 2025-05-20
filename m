Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp529995njc;
        Tue, 20 May 2025 07:10:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjv6e/pHc5xSgI0SI/gHBVvYwcUHnWDtUE/dSccPpEQtnaDFaNvc+ebRG9WOA62ediMR3gX8A9EzeM4w==@linaro.org
X-Google-Smtp-Source: AGHT+IFr/jhofU0LyG0uPUv0Axn+zKQeCRgtkJUJFC/hs1FTRxysi+8uox/1BfwHsw9jgtB7Fn8f
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr178408845e9.15.1747750230023;
        Tue, 20 May 2025 07:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747750230; cv=none;
        d=google.com; s=arc-20240605;
        b=gRDuE0dFMTbz5NmRlYR5yH6O9B+T08J5csbUJQO+U/1nQAYssXKGipfigv6AgjtiBC
         M40v5MKixxaig1lsP0eLLD0AAAkOHaf+KmPMGx/Meukhiu6geCiNOPLzZxAtRCkX1QCC
         9CU+uT+Jpbv8yI35K2fVeNs16l/p8ttLcaWFyHbm7ru33Zd6jleGYZXFJGxxApSsS7fd
         uuCcqUeHma2DZdlgT7XtE4HyzNyTzdmebSeRJRYz8jh9Y+Mun1+8tHxvFmS9xX0ZN5qp
         0PPyydp/dQZiYG+KhCl/v/xbcmSXQvNS/LCLk2tOewjXDF2TsBWLuZdhUO7PbcikPnw4
         iY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wTiO3+Hfc/CdWQbhAFjllN1Tm1FIAkftjxcvMbFqISg=;
        fh=F/Ua+nq9pwGbDcipwgaU/gCLVKNetlgdxxTYCFcao3Y=;
        b=hfyn96KP3uIkB16UMgSUbt6vKjWS5m70uZbWJNr+Y7L5EoY0hyK3gvBH/TnBGNNdls
         4lenrAMjXsTtK33pCcq72z7K6fExcgIhf9JIjUP33U/YNH4tgfE6cm/JoUCLbmnpkbMO
         0QIrmy8GcPw3wwplZ+S+Zh8VxhbyGd7Bt0H+NyCJ5ZTU6JZVJhr8dO1Ygu68r+wqV1EN
         qIcwzrnps3Cy+dNNCWt2PuBDzwSAqjb4ux2d0ZehId+e8ktc7Cs/enGQzG5eBdHsKPEw
         kSS2HL/kAffClJi6QwLM4+ShC82vzszKJay4IaJ+fzyp2g31R55XOydFHK00FR+z2sB5
         6gZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRUngxin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a3626f218bsi7097158f8f.825.2025.05.20.07.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 07:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRUngxin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHNfR-0002PF-Fx; Tue, 20 May 2025 10:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHNf9-0002OP-Ei
 for qemu-arm@nongnu.org; Tue, 20 May 2025 10:09:47 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHNf6-00085P-GM
 for qemu-arm@nongnu.org; Tue, 20 May 2025 10:09:46 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-86feb84877aso1311594241.3
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747750183; x=1748354983; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wTiO3+Hfc/CdWQbhAFjllN1Tm1FIAkftjxcvMbFqISg=;
 b=cRUngxinPoymIA1v9E4osNr4h9Nd0vDmUYUvyVyhkBAAbmeEAotXOUX4hJ43pSV9RA
 zJY2EOT76Xp/SZGN+x5d3B1d6FcR/aPK3HEoss7jLQMk7TUzPdkoZoSafrHiL32Yc/P8
 qlDjUwewwvwarBVXC1iBQn7EadY+SUNYx6Q+5ITO4v2N7e+8midcoGwo1poLhaudTOxY
 7ypuALSYtfxVWbC9DkRW/JxDQJYc//nk60OFFUATqjZEIj7g0HbYTj08xeD3Cun7YMNM
 mko+NcLG4kJ7e1wU6JaC9zodlAwCo2NBtYQABtSLyvQPYUm3bxk9whjqKNw5QCMpBbVT
 UdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747750183; x=1748354983;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wTiO3+Hfc/CdWQbhAFjllN1Tm1FIAkftjxcvMbFqISg=;
 b=P7U1ENzDMDQoPZbKw0XOTQUUr2iXCd27u4klUPOmrgH2JL5loZvTecyfV9O7kuIhp4
 Bc+Siuj6lYXbFKLkDsVvvxyrLFgfX7ehWOr9GQGs7UN67hf+mtDQuWeCRWlwO7Tr+LIf
 g+5qd3RIJfZf4HM3/gpXs4qg83/nT1Rl3Lh48ESZEmstBkxqHOjdgt6fa3pZdzKpNb9B
 PA2IocLmh6dOkh81Og3cDhK1lNc8EXpDhwqye/eVe5fKRRyZ39exp3NXSS+4RrJVLs6N
 TjxZJP8d+2iZBzFyFpRdSzm+IEVKOI2lhUwqUIMUbkPX1MYlgQGO+rtz4Wpi6Pdybtei
 9D2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgfwIqvwkjulWegv3EXaxByvb+8HsTXeL61xKXlKXk6UqyBzSJOZzpuryFHzQML67kddw3ECbaAA==@nongnu.org
X-Gm-Message-State: AOJu0YxwVz8T7EgX/q5jV+q3qquw08viAlY1DZvhLKNIxUqRaQC7rl1Y
 dvsj7vmVb2yWmOXhvVsfzNA+IZ5sXi4u/9Z8+xFwiMQyJNU9/hUSPUxaXiRdx546HtE=
X-Gm-Gg: ASbGncv+IxSs0dk9320PxywAOWhRWOXbSuU7P0LgUi8D/ahtX0rZaEQtpphB7Pkw2So
 oaHnlUerme4Mwfa4P71cLIwbmkd44JPh2ifky3wnRLIM5/WoyQeOazMTqI0M75apoIV6+B40SlR
 dCMrs9KB9JkpGLS5xIgY8WMj6OURIUgOrqzZIsan/UffdMss7m2wtSODhIfYI57Id1NaK0betgV
 Z4+eVbfxEMpOR1bf7oT3FgiQzI8xVG7qUGkDXbPc5aiVj+eYJTNDY+K5h5ANnS8cJHtOtoVGtD+
 7TONSPSm/GMAdrYbC+jj+2Dcs4TXB21a68C8GSZMlYoX1y8m2zZctm/XsWv6z5ljfArBws/ljXh
 CD+9Oule+Tj0Rd93SlVOGVVx4BFFZUg==
X-Received: by 2002:a05:6122:4883:b0:52a:792e:ce4c with SMTP id
 71dfb90a1353d-52dbcc505cfmr12884839e0c.1.1747750182672; 
 Tue, 20 May 2025 07:09:42 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dbab6c0c2sm8416467e0c.42.2025.05.20.07.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:09:42 -0700 (PDT)
Message-ID: <e1ec0e15-ad26-456b-a8d7-16f683290651@linaro.org>
Date: Tue, 20 May 2025 11:09:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-9-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-9-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ua1-x936.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ULEL2Nroeuix

Hi Eric,

On 5/14/25 14:00, Eric Auger wrote:
> gpex build_host_bridge_osc() and x86 originated
> build_pci_host_bridge_osc_method() are mostly identical.
> 
> In GPEX, SUPP is set to CDW2 but is not further used. CTRL
> is same as Local0.
> 
> So let gpex code reuse build_pci_host_bridge_osc_method()
> and remove build_host_bridge_osc().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> The DSDT diff  is given below:
> diff --git a/dsdt.dsl_before b/dsdt.dsl_after_osc_change
> index 3224a56..fa7558e 100644
> --- a/dsdt.dsl_before
> +++ b/dsdt.dsl_after_osc_change
> @@ -5,13 +5,13 @@
>    *
>    * Disassembling to symbolic ASL+ operators
>    *
> - * Disassembly of dsdt.dat, Mon Apr  7 05:33:06 2025
> + * Disassembly of dsdt.dat, Mon Apr  7 05:37:20 2025
>    *
>    * Original Table Header:
>    *     Signature        "DSDT"
> - *     Length           0x00001A4F (6735)
> + *     Length           0x00001A35 (6709)
>    *     Revision         0x02
> - *     Checksum         0xBF
> + *     Checksum         0xDD
>    *     OEM ID           "BOCHS "
>    *     OEM Table ID     "BXPC    "
>    *     OEM Revision     0x00000001 (1)
> @@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>                   {
>                       CreateDWordField (Arg3, 0x04, CDW2)
>                       CreateDWordField (Arg3, 0x08, CDW3)
> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> -                    CTRL &= 0x1F
> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> +                    Local0 &= 0x1F
>                       If ((Arg1 != One))
>                       {
>                           CDW1 |= 0x08
>                       }
> 
> -                    If ((CDW3 != CTRL))
> +                    If ((CDW3 != Local0))
>                       {
>                           CDW1 |= 0x10
>                       }
> 
> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
> -                    Return (Arg3)
> +                    CDW3 = Local0
>                   }
>                   Else
>                   {
>                       CDW1 |= 0x04
> -                    Return (Arg3)
>                   }
> +
> +                Return (Arg3)
>               }
> 
>               Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method

The problem I face with diffs in the commit body is that tools like b4, which are
based on git am, get very confused on how to handle it. I'm surprised nobody ever
complained about it. I'm wondering if there is any catch on it, because I have to
edit commits like this manually, removing the diff, to make it finally apply to
the series. Anyways, do you mind at least removing the valid diff header, like:

> diff --git a/dsdt.dsl_before b/dsdt.dsl_after_osc_change
> index 3224a56..fa7558e 100644
> --- a/dsdt.dsl_before
> +++ b/dsdt.dsl_after_osc_change

from the commit message so it doesn't confuse b4?


> ---
>   hw/pci-host/gpex-acpi.c | 60 +++--------------------------------------
>   1 file changed, 4 insertions(+), 56 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index f1ab30f3d5..98c9868c3f 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -50,60 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>       }
>   }
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
>   {
>       Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>       Aml *UUID, *ifctx, *ifctx1, *buf;
> @@ -134,8 +81,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
>       aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
>       aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
>       /* Declare an _OSC (OS Control Handoff) method */
> -    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> -    aml_append(dev, build_host_bridge_dsm());
> +    aml_append(dev,
> +               build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
> +    aml_append(dev, build_pci_host_bridge_dsm_method());
>   }
>   
>   void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)

Otherwise:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
