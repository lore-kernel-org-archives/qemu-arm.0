Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp464030njc;
        Tue, 20 May 2025 05:32:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFtcwtT1uXyQw5ToOnfwRiuwSYKVpKHHCg16qIYWw8kj5xnP0dwstNWZySNsROlv0OAz+SHCtTi3Wkjg==@linaro.org
X-Google-Smtp-Source: AGHT+IF++zGFBgIJ9YtVokNihACaUvd7UD6WMYWxEdwzMJ0CCfr47M8dfgWG6FtvUq9PaCJk4fBU
X-Received: by 2002:a05:6e02:3b89:b0:3d9:6cb6:fa52 with SMTP id e9e14a558f8ab-3db8431398fmr191657335ab.12.1747744325815;
        Tue, 20 May 2025 05:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747744325; cv=none;
        d=google.com; s=arc-20240605;
        b=fBg/W0m6t9ZgR35W7MkKnM04CuYQ5K38aM68DEVlq44rJHxoB/UEVrxmBt7GYK9YUk
         5Auh7/K85oDoT54i35aJc5UN3YPVdHkUBeGax9/+ylgR9ZM+cDtnJfb+wqKPHPmo6MvJ
         Vji4RYn4EO6VHevoTqK9l9W5TguLbaXFw4R4kSY9kkfM+2D08Z2bcGQpO6w4ke3xPpv4
         sGteBLSctqz4zOR0OBBdltbJRq8qlSeo21AZjPAmUNN2cqq9+QAQyK8eC+INq0GEz7xo
         qT+CzHB+oAOUpU+OBN/6ty9aTr5z+HnD8iSSmue0WS82BGv3SZIg+9wWJt0MAUS6qb6J
         0zhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fL7WhFP6w6L2PiRs6zkB+Kk9hcklC639f32eQyJNiNU=;
        fh=rHKfGTYPoV2lcgUBwEKrfBB1/Gdw1RVt+tzY57xfKiA=;
        b=jMRAc1fIjVmLugKonSxOAZseOOefprTlvyFHVgxdrNozGzp30/w/Yli7xSnA1Wo05w
         ZDVg08nmmQQ5toQ3iCzIJWRjhFWcuqqo1hLyVuFjo4vap+fsrZAFZnbPeLKJREiX2hMb
         bBq2HjwvoxB/f/Z92GbZaGMwuYeiQ2fgBQBcGmfoCp9ayaWN/pCsEo+ziuo87PUSHHHI
         Jh6NG+4gEfxDWMD9LbTpWs+RsMFcM0qjyfeWIlrMFC5S0JL8RIdz2yIc77aJZhjn3tbz
         WLY0sHKXILYXa2d8c+5lVfyOrDHcLQ//p3FUORXV4lt0kls2nxr1Ttb4h3fuEyYjtZUA
         NsEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pF2lDv8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3dc804f8045si1995435ab.84.2025.05.20.05.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 05:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pF2lDv8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHM81-0003C9-Dh; Tue, 20 May 2025 08:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHM7y-0003Au-S3
 for qemu-arm@nongnu.org; Tue, 20 May 2025 08:31:27 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHM7t-0004iE-Lw
 for qemu-arm@nongnu.org; Tue, 20 May 2025 08:31:26 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-525da75d902so1780760e0c.3
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747744279; x=1748349079; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fL7WhFP6w6L2PiRs6zkB+Kk9hcklC639f32eQyJNiNU=;
 b=pF2lDv8vZremWzgTsUYhCSzgsty9uUhsk1YoB2abg8jOyPLFcfQVZxqWX28nffgOvn
 nQ+lDSy84ynSxfgp3jE6PwWAvJoVssu4rt3BFOL+gJ//d51W/gkq+AbS9hNpnaMmcU6L
 98/SDzjRdRWgx5mRzEVVd4iNL0YyLfSi20ua+F9wM0mNAcAYxQKo0MaVS7S6KEUuD03k
 50Q/MSOynM3pv7dIZcbT9NZgsHJzW9sKh8Z9FZrrpA4Rh9iYgRGcJgAs31zTiuwu1wrx
 a32kfugZBYLQqHejRoRhrLGbLC21N2uXaAgwMVR1WcPlgYTnb0ZaTmNbHDlh0Ytteovx
 cxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747744279; x=1748349079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fL7WhFP6w6L2PiRs6zkB+Kk9hcklC639f32eQyJNiNU=;
 b=S9IolWxIwCBQNBCcgUPr+YAB9ZqPja4eytI9m+v9ReEWfviyT42fzexRdCvAYBsBf7
 0ku4jW2mwXGWq2HuFPNzmt8NmXO/UYScYIFa4ocIMxvGFSEc950C4JnVbpsrbpcW4g0o
 g5nLv4vy2DPskfNlxr5rmqQOTISuHNJsTFck5UiQLdpjwK7PWv2ti+rdW9VvpUwq9RPz
 4rEoLL83lHfZhdDfuq7z46winbHa3tZ5Lju6p9p7F8+5Lv3XkYOB1JIhFL1ewS1Cg2Dp
 ZyQf7+vUHbR5gcpyOHZ1Eutk0OOkLMNiIW8J+IhHENr/qGxfIkRpZrB5Et8oxW9SBaOP
 AOkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJuyVRGyou0Q0Q9vuA8Au04NzcGJLJHqC4ZrCkuEUknd6Osh/yUm27qZLp48PdiGwi1I4WLzY2BQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyxr4rPr/FaGD4Fj0UshdeJwwLHdX7LBdBVh60RG/DONUX10MV0
 wLW8nFqX6pUvKBO2ghpDqAbQfBXBnT/EhVDerX5zHM2y6IBnl489FF7EksZILBm7iWM=
X-Gm-Gg: ASbGnct28o9OIH4ENfe4sfzji9rPALxm/NVvXldmZAH0rneYNPkt6E3a0I9HYyvy3Nv
 b7ppHFqzTUWMwi/EsHn0RUzR6g/BesdrVKD/S/GP9HowHOaoMu8UuP+CPfG1A+QFiVbzE+pEpDf
 XFPaoV9JI9Qp2Llc8QuEH4Tn7j+/dBP5e49N8t6SPjZ2CaCeKrQ2bGLtbsb+gN6xlVG33Wvhx3d
 TNAFSLf21wXJUrv6NtnfyLjU0GWfqOVsedgDh5HgYZUavTrPVvj9uKIzOcTp7Ny5VlsdVCfz9Nu
 nx6hoaBXIaAFc7w8iFE6g7Pgg4pely8y9rWvAe+TCaRLU48xhtS7R6m6YQ98wX2K3EvncINjrGm
 DrQAm7pINBSCqVTh7oifWh6gZ+ISjdA==
X-Received: by 2002:a05:6122:1998:b0:50d:a31c:678c with SMTP id
 71dfb90a1353d-52dba7d091bmr13121602e0c.2.1747744278878; 
 Tue, 20 May 2025 05:31:18 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dba9405a2sm8341560e0c.13.2025.05.20.05.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 05:31:18 -0700 (PDT)
Message-ID: <31b7402d-4d7d-4d38-9d2d-27143520e581@linaro.org>
Date: Tue, 20 May 2025 09:31:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] hw/acpi: Rename and move build_x86_acpi_pci_hotplug
 to pcihp
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-4-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa2b.google.com
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
X-TUID: FaJSf03b7zwt

Hi Eric,

On 5/14/25 14:00, Eric Auger wrote:
> We plan to reuse build_x86_acpi_pci_hotplug() implementation
> for ARM so let's move the code to generic pcihp.
> 
> Associated static aml_pci_pdsm() helper is also moved along.
> build_x86_acpi_pci_hotplug is renamed into build_acpi_pci_hotplug().
> 
> No code change intended.
> 
> Also fix the reference to  acpi_pci_hotplug.rst documentation

nit: double space       ----^

There is still one place where the ref is wrong, see below.


> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> rfc -> v1:
> - make build_append_pci_dsm_func0_common non static and move it to
>    pcihp
> ---
>   hw/i386/acpi-build.h    |   4 -
>   include/hw/acpi/pcihp.h |   9 +-
>   hw/acpi/pcihp.c         | 174 ++++++++++++++++++++++++++++++++++++++-
>   hw/i386/acpi-build.c    | 176 +---------------------------------------
>   4 files changed, 183 insertions(+), 180 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 275ec058a1..8ba3c33e48 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -5,10 +5,6 @@
>   
>   extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
>   
> -/* PCI Hot-plug registers' base. See docs/specs/acpi_pci_hotplug.rst */
> -#define ACPI_PCIHP_SEJ_BASE 0x8
> -#define ACPI_PCIHP_BNMR_BASE 0x10
> -
>   void acpi_setup(void);
>   Object *acpi_get_i386_pci_host(void);
>   
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index a97904bada..95efe9a804 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -3,7 +3,7 @@
>    *
>    * QEMU supports PCI hotplug via ACPI. This module
>    * implements the interface between QEMU and the ACPI BIOS.
> - * Interface specification - see docs/specs/acpi_pci_hotplug.txt
> + * Interface specification - see docs/specs/acpi_pci_hotplug.rst
>    *
>    * Copyright (c) 2013, Red Hat Inc, Michael S. Tsirkin (mst@redhat.com)
>    * Copyright (c) 2006 Fabrice Bellard
> @@ -33,6 +33,10 @@
>   #define ACPI_PCIHP_IO_BASE_PROP "acpi-pcihp-io-base"
>   #define ACPI_PCIHP_IO_LEN_PROP "acpi-pcihp-io-len"
>   
> +/* PCI Hot-plug registers bases. See docs/spec/acpi_pci_hotplug.rst */

nit:                               specs   ---^


Otherwise:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

> +#define ACPI_PCIHP_SEJ_BASE 0x8
> +#define ACPI_PCIHP_BNMR_BASE 0x10
> +
>   typedef struct AcpiPciHpPciStatus {
>       uint32_t up;
>       uint32_t down;
> @@ -69,6 +73,9 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>                                            AcpiPciHpState *s, DeviceState *dev,
>                                            Error **errp);
>   
> +void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
> +void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
> +
>   /* Called on reset */
>   void acpi_pcihp_reset(AcpiPciHpState *s);
>   
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index aac90013d4..e0260f67e6 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -26,7 +26,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/acpi/pcihp.h"
> -
> +#include "hw/acpi/aml-build.h"
>   #include "hw/pci-host/i440fx.h"
>   #include "hw/pci/pci.h"
>   #include "hw/pci/pci_bridge.h"
> @@ -513,6 +513,178 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
>                                      OBJ_PROP_FLAG_READ);
>   }
>   
> +void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar)
> +{
> +    Aml *UUID, *ifctx1;
> +    uint8_t byte_list[1] = { 0 }; /* nothing supported yet */
> +
> +    aml_append(ctx, aml_store(aml_buffer(1, byte_list), retvar));
> +    /*
> +     * PCI Firmware Specification 3.1
> +     * 4.6.  _DSM Definitions for PCI
> +     */
> +    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
> +    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(0), UUID)));
> +    {
> +        /* call is for unsupported UUID, bail out */
> +        aml_append(ifctx1, aml_return(retvar));
> +    }
> +    aml_append(ctx, ifctx1);
> +
> +    ifctx1 = aml_if(aml_lless(aml_arg(1), aml_int(2)));
> +    {
> +        /* call is for unsupported REV, bail out */
> +        aml_append(ifctx1, aml_return(retvar));
> +    }
> +    aml_append(ctx, ifctx1);
> +}
> +
> +static Aml *aml_pci_pdsm(void)
> +{
> +    Aml *method, *ifctx, *ifctx1;
> +    Aml *ret = aml_local(0);
> +    Aml *caps = aml_local(1);
> +    Aml *acpi_index = aml_local(2);
> +    Aml *zero = aml_int(0);
> +    Aml *one = aml_int(1);
> +    Aml *not_supp = aml_int(0xFFFFFFFF);
> +    Aml *func = aml_arg(2);
> +    Aml *params = aml_arg(4);
> +    Aml *bnum = aml_derefof(aml_index(params, aml_int(0)));
> +    Aml *sunum = aml_derefof(aml_index(params, aml_int(1)));
> +
> +    method = aml_method("PDSM", 5, AML_SERIALIZED);
> +
> +    /* get supported functions */
> +    ifctx = aml_if(aml_equal(func, zero));
> +    {
> +        build_append_pci_dsm_func0_common(ifctx, ret);
> +
> +        aml_append(ifctx, aml_store(zero, caps));
> +        aml_append(ifctx,
> +            aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
> +        /*
> +         * advertise function 7 if device has acpi-index
> +         * acpi_index values:
> +         *            0: not present (default value)
> +         *     FFFFFFFF: not supported (old QEMU without PIDX reg)
> +         *        other: device's acpi-index
> +         */
> +        ifctx1 = aml_if(aml_lnot(
> +                     aml_or(aml_equal(acpi_index, zero),
> +                            aml_equal(acpi_index, not_supp), NULL)
> +                 ));
> +        {
> +            /* have supported functions */
> +            aml_append(ifctx1, aml_or(caps, one, caps));
> +            /* support for function 7 */
> +            aml_append(ifctx1,
> +                aml_or(caps, aml_shiftleft(one, aml_int(7)), caps));
> +        }
> +        aml_append(ifctx, ifctx1);
> +
> +        aml_append(ifctx, aml_store(caps, aml_index(ret, zero)));
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
> +
> +       aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
> +       aml_append(ifctx, aml_store(pkg, ret));
> +       /*
> +        * Windows calls func=7 without checking if it's available,
> +        * as workaround Microsoft has suggested to return invalid for func7
> +        * Package, so return 2 elements package but only initialize elements
> +        * when acpi_index is supported and leave them uninitialized, which
> +        * leads elements to being Uninitialized ObjectType and should trip
> +        * Windows into discarding result as an unexpected and prevent setting
> +        * bogus 'PCI Label' on the device.
> +        */
> +       ifctx1 = aml_if(aml_lnot(aml_lor(
> +                    aml_equal(acpi_index, zero), aml_equal(acpi_index, not_supp)
> +                )));
> +       {
> +           aml_append(ifctx1, aml_store(acpi_index, aml_index(ret, zero)));
> +           /*
> +            * optional, if not impl. should return null string
> +            */
> +           aml_append(ifctx1, aml_store(aml_string("%s", ""),
> +                                        aml_index(ret, one)));
> +       }
> +       aml_append(ifctx, ifctx1);
> +
> +       aml_append(ifctx, aml_return(ret));
> +    }
> +
> +    aml_append(method, ifctx);
> +    return method;
> +}
> +
> +void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> +{
> +    Aml *scope;
> +    Aml *field;
> +    Aml *method;
> +
> +    scope =  aml_scope("_SB.PCI0");
> +
> +    aml_append(scope,
> +        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr), 0x08));
> +    field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
> +    aml_append(field, aml_named_field("PCIU", 32));
> +    aml_append(field, aml_named_field("PCID", 32));
> +    aml_append(scope, field);
> +
> +    aml_append(scope,
> +        aml_operation_region("SEJ", AML_SYSTEM_IO,
> +                             aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0x04));
> +    field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
> +    aml_append(field, aml_named_field("B0EJ", 32));
> +    aml_append(scope, field);
> +
> +    aml_append(scope,
> +        aml_operation_region("BNMR", AML_SYSTEM_IO,
> +                             aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), 0x08));
> +    field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
> +    aml_append(field, aml_named_field("BNUM", 32));
> +    aml_append(field, aml_named_field("PIDX", 32));
> +    aml_append(scope, field);
> +
> +    aml_append(scope, aml_mutex("BLCK", 0));
> +
> +        method = aml_method("PCEJ", 2, AML_NOTSERIALIZED);
> +    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
> +    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
> +    aml_append(method,
> +        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("B0EJ")));
> +    aml_append(method, aml_release(aml_name("BLCK")));
> +    aml_append(method, aml_return(aml_int(0)));
> +    aml_append(scope, method);
> +
> +    method = aml_method("AIDX", 2, AML_NOTSERIALIZED);
> +    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
> +    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
> +    aml_append(method,
> +        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("PIDX")));
> +    aml_append(method, aml_store(aml_name("PIDX"), aml_local(0)));
> +    aml_append(method, aml_release(aml_name("BLCK")));
> +    aml_append(method, aml_return(aml_local(0)));
> +    aml_append(scope, method);
> +
> +    aml_append(scope, aml_pci_pdsm());
> +
> +    aml_append(table, scope);
> +}
> +
>   const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>       .name = "acpi_pcihp_pci_status",
>       .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9e584e69fd..b92765fbd9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -361,32 +361,6 @@ static Aml *aml_pci_device_dsm(void)
>       return method;
>   }
>   
> -static void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar)
> -{
> -    Aml *UUID, *ifctx1;
> -    uint8_t byte_list[1] = { 0 }; /* nothing supported yet */
> -
> -    aml_append(ctx, aml_store(aml_buffer(1, byte_list), retvar));
> -    /*
> -     * PCI Firmware Specification 3.1
> -     * 4.6.  _DSM Definitions for PCI
> -     */
> -    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(0), UUID)));
> -    {
> -        /* call is for unsupported UUID, bail out */
> -        aml_append(ifctx1, aml_return(retvar));
> -    }
> -    aml_append(ctx, ifctx1);
> -
> -    ifctx1 = aml_if(aml_lless(aml_arg(1), aml_int(2)));
> -    {
> -        /* call is for unsupported REV, bail out */
> -        aml_append(ifctx1, aml_return(retvar));
> -    }
> -    aml_append(ctx, ifctx1);
> -}
> -
>   static Aml *aml_pci_edsm(void)
>   {
>       Aml *method, *ifctx;
> @@ -647,96 +621,6 @@ static bool build_append_notification_callback(Aml *parent_scope,
>       return !!nr_notifiers;
>   }
>   
> -static Aml *aml_pci_pdsm(void)
> -{
> -    Aml *method, *ifctx, *ifctx1;
> -    Aml *ret = aml_local(0);
> -    Aml *caps = aml_local(1);
> -    Aml *acpi_index = aml_local(2);
> -    Aml *zero = aml_int(0);
> -    Aml *one = aml_int(1);
> -    Aml *not_supp = aml_int(0xFFFFFFFF);
> -    Aml *func = aml_arg(2);
> -    Aml *params = aml_arg(4);
> -    Aml *bnum = aml_derefof(aml_index(params, aml_int(0)));
> -    Aml *sunum = aml_derefof(aml_index(params, aml_int(1)));
> -
> -    method = aml_method("PDSM", 5, AML_SERIALIZED);
> -
> -    /* get supported functions */
> -    ifctx = aml_if(aml_equal(func, zero));
> -    {
> -        build_append_pci_dsm_func0_common(ifctx, ret);
> -
> -        aml_append(ifctx, aml_store(zero, caps));
> -        aml_append(ifctx,
> -            aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
> -        /*
> -         * advertise function 7 if device has acpi-index
> -         * acpi_index values:
> -         *            0: not present (default value)
> -         *     FFFFFFFF: not supported (old QEMU without PIDX reg)
> -         *        other: device's acpi-index
> -         */
> -        ifctx1 = aml_if(aml_lnot(
> -                     aml_or(aml_equal(acpi_index, zero),
> -                            aml_equal(acpi_index, not_supp), NULL)
> -                 ));
> -        {
> -            /* have supported functions */
> -            aml_append(ifctx1, aml_or(caps, one, caps));
> -            /* support for function 7 */
> -            aml_append(ifctx1,
> -                aml_or(caps, aml_shiftleft(one, aml_int(7)), caps));
> -        }
> -        aml_append(ifctx, ifctx1);
> -
> -        aml_append(ifctx, aml_store(caps, aml_index(ret, zero)));
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
> -
> -       aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
> -       aml_append(ifctx, aml_store(pkg, ret));
> -       /*
> -        * Windows calls func=7 without checking if it's available,
> -        * as workaround Microsoft has suggested to return invalid for func7
> -        * Package, so return 2 elements package but only initialize elements
> -        * when acpi_index is supported and leave them uninitialized, which
> -        * leads elements to being Uninitialized ObjectType and should trip
> -        * Windows into discarding result as an unexpected and prevent setting
> -        * bogus 'PCI Label' on the device.
> -        */
> -       ifctx1 = aml_if(aml_lnot(aml_lor(
> -                    aml_equal(acpi_index, zero), aml_equal(acpi_index, not_supp)
> -                )));
> -       {
> -           aml_append(ifctx1, aml_store(acpi_index, aml_index(ret, zero)));
> -           /*
> -            * optional, if not impl. should return null string
> -            */
> -           aml_append(ifctx1, aml_store(aml_string("%s", ""),
> -                                        aml_index(ret, one)));
> -       }
> -       aml_append(ifctx, ifctx1);
> -
> -       aml_append(ifctx, aml_return(ret));
> -    }
> -
> -    aml_append(method, ifctx);
> -    return method;
> -}
> -
>   /*
>    * build_prt - Define interrupt routing rules
>    *
> @@ -1227,62 +1111,6 @@ static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
>       return dev;
>   }
>   
> -static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> -{
> -    Aml *scope;
> -    Aml *field;
> -    Aml *method;
> -
> -    scope =  aml_scope("_SB.PCI0");
> -
> -    aml_append(scope,
> -        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr), 0x08));
> -    field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
> -    aml_append(field, aml_named_field("PCIU", 32));
> -    aml_append(field, aml_named_field("PCID", 32));
> -    aml_append(scope, field);
> -
> -    aml_append(scope,
> -        aml_operation_region("SEJ", AML_SYSTEM_IO,
> -                             aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0x04));
> -    field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
> -    aml_append(field, aml_named_field("B0EJ", 32));
> -    aml_append(scope, field);
> -
> -    aml_append(scope,
> -        aml_operation_region("BNMR", AML_SYSTEM_IO,
> -                             aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), 0x08));
> -    field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
> -    aml_append(field, aml_named_field("BNUM", 32));
> -    aml_append(field, aml_named_field("PIDX", 32));
> -    aml_append(scope, field);
> -
> -    aml_append(scope, aml_mutex("BLCK", 0));
> -
> -    method = aml_method("PCEJ", 2, AML_NOTSERIALIZED);
> -    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
> -    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
> -    aml_append(method,
> -        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("B0EJ")));
> -    aml_append(method, aml_release(aml_name("BLCK")));
> -    aml_append(method, aml_return(aml_int(0)));
> -    aml_append(scope, method);
> -
> -    method = aml_method("AIDX", 2, AML_NOTSERIALIZED);
> -    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
> -    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
> -    aml_append(method,
> -        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("PIDX")));
> -    aml_append(method, aml_store(aml_name("PIDX"), aml_local(0)));
> -    aml_append(method, aml_release(aml_name("BLCK")));
> -    aml_append(method, aml_return(aml_local(0)));
> -    aml_append(scope, method);
> -
> -    aml_append(scope, aml_pci_pdsm());
> -
> -    aml_append(table, scope);
> -}
> -
>   static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
>   {
>       Aml *if_ctx;
> @@ -1394,7 +1222,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           aml_append(dsdt, sb_scope);
>   
>           if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> -            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>           }
>           build_piix4_pci0_int(dsdt);
>       } else if (q35) {
> @@ -1438,7 +1266,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           aml_append(dsdt, sb_scope);
>   
>           if (pm->pcihp_bridge_en) {
> -            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> +            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>           }
>           build_q35_pci0_int(dsdt);
>       }

