Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp951551ejo;
        Tue, 12 Dec 2023 06:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkbrMvyw5pTOiDfWF7ZWa8PMqJPJ4e3H6ETLLZRn17NknDwjJiumjfYvmI9G2xz/3k5P4q
X-Received: by 2002:a05:6214:48:b0:67a:9cbc:951a with SMTP id c8-20020a056214004800b0067a9cbc951amr3645184qvr.13.1702392548712;
        Tue, 12 Dec 2023 06:49:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702392548; cv=none;
        d=google.com; s=arc-20160816;
        b=dv50BKfCC+Jm/TevHEoE4gz3Cv3QoZO+6PPOou4X/QRUIKPiP+Ilm0SLnXA8VgqN4U
         9t2LiNC9VOoyAPGg3QRgCzZS4oN/nJracBaUAQE2tc+PEsCE4saWNSCPby7fjuDfIkgH
         Oru6xyFxmC71xjR+vZ7SeDHv6XT9uSVHDlYFT25VIOCdsNtWaA6HP0J7NPHS+0j+0xZv
         7pDSBliXIInwHkL34YZZ4rm5OxB2ubXZcgG5POmyfbCzZYjbnZwS8iEilNp+9mc8+O59
         HXUt0fUp3/EptAxwhTmZLMWI+wBKHyuhM8nFpo0KvPJthmxG9fYw6QvgXladJGbet01w
         GcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id;
        bh=YEb26rWgc4obyqTeWOdlVZdJPy6hRfQ3WprFXybdVG4=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=BxxJ5xbrjv3XBh7jPqrpV6QunXckORSnDo9YLRmfobrug+df+e5XTlI8NxyX342hOb
         Zkg75gB7EZvyHuD8g9CoBVKNikGATqr07JO3JU9ggjUxJmrKe/0pTLm65eDzfLzfnFI5
         YEm7TLRO64kyf/d3qdGmLgh32vA4bD37eJrr/Mb9xW8oHFgKAmtXpQwV81Rj+U4X5Qfq
         7Vz8+IUZcVinz/RpDSu9FdjwdL0izhVCU9XrFrAZYGHIZcQppWmZ13fNjL3w4ltCxOCc
         IKsID+V/he1W/HCcSmBt9Cxy7gZ/XItcuLYUv25xJzW61BIE2H6YB83wjJu8kZG0qt9Z
         ZmSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1-20020a0cf701000000b0067ebf3c2041si7309231qvn.355.2023.12.12.06.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 06:49:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rD43z-0008Bm-Cf; Tue, 12 Dec 2023 09:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DDG+=HX=kaod.org=clg@ozlabs.org>)
 id 1rD43y-0008BI-6j; Tue, 12 Dec 2023 09:48:46 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DDG+=HX=kaod.org=clg@ozlabs.org>)
 id 1rD43t-0004PH-5K; Tue, 12 Dec 2023 09:48:44 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SqM1c4T5yz4xQj;
 Wed, 13 Dec 2023 01:48:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqM1T0X7Tz4xNH;
 Wed, 13 Dec 2023 01:48:28 +1100 (AEDT)
Message-ID: <d8b3b1c4-42df-4390-9b81-0a426fa43b77@kaod.org>
Date: Tue, 12 Dec 2023 15:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v8 04/10] hw/fsi: IBM's On-chip Peripheral Bus
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20231128235700.599584-1-ninad@linux.ibm.com>
 <20231128235700.599584-5-ninad@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20231128235700.599584-5-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=DDG+=HX=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1Q9RpYi6ILcT

On 11/29/23 00:56, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in
> POWER processors. This now makes an appearance in the ASPEED SoC due
> to tight integration of the FSI master IP with the OPB, mainly the
> existence of an MMIO-mapping of the CFAM address straight onto a
> sub-region of the OPB address space.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> [ clg: - removed FSIMasterState object and fsi_opb_realize()
>         - simplified OPBus ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/fsi/opb.h | 25 +++++++++++++++++++++++++
>   hw/fsi/opb.c         | 36 ++++++++++++++++++++++++++++++++++++
>   hw/fsi/Kconfig       |  4 ++++
>   hw/fsi/meson.build   |  1 +
>   4 files changed, 66 insertions(+)
>   create mode 100644 include/hw/fsi/opb.h
>   create mode 100644 hw/fsi/opb.c
> 
> diff --git a/include/hw/fsi/opb.h b/include/hw/fsi/opb.h
> new file mode 100644
> index 0000000000..c112206f9e
> --- /dev/null
> +++ b/include/hw/fsi/opb.h
> @@ -0,0 +1,25 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM On-Chip Peripheral Bus
> + */
> +#ifndef FSI_OPB_H
> +#define FSI_OPB_H
> +
> +#include "exec/memory.h"
> +#include "hw/fsi/fsi-master.h"
> +
> +#define TYPE_OP_BUS "opb"
> +OBJECT_DECLARE_SIMPLE_TYPE(OPBus, OP_BUS)
> +
> +typedef struct OPBus {
> +        /*< private >*/
> +        BusState bus;
> +
> +        /*< public >*/
> +        MemoryRegion mr;
> +        AddressSpace as;
> +} OPBus;
> +
> +#endif /* FSI_OPB_H */
> diff --git a/hw/fsi/opb.c b/hw/fsi/opb.c
> new file mode 100644
> index 0000000000..6474754890
> --- /dev/null
> +++ b/hw/fsi/opb.c
> @@ -0,0 +1,36 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM On-chip Peripheral Bus
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +
> +#include "hw/fsi/opb.h"
> +
> +static void fsi_opb_init(Object *o)
> +{
> +    OPBus *opb = OP_BUS(o);
> +
> +    memory_region_init_io(&opb->mr, OBJECT(opb), NULL, opb,
> +                          NULL, UINT32_MAX);

Let's give the region some name.


Thanks,

C.

  

> +    address_space_init(&opb->as, &opb->mr, "opb");
> +}
> +
> +static const TypeInfo opb_info = {
> +    .name = TYPE_OP_BUS,
> +    .parent = TYPE_BUS,
> +    .instance_init = fsi_opb_init,
> +    .instance_size = sizeof(OPBus),
> +};
> +
> +static void fsi_opb_register_types(void)
> +{
> +    type_register_static(&opb_info);
> +}
> +
> +type_init(fsi_opb_register_types);
> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
> index de1594a335..9755baa8cc 100644
> --- a/hw/fsi/Kconfig
> +++ b/hw/fsi/Kconfig
> @@ -1,3 +1,7 @@
> +config FSI_OPB
> +    bool
> +    select FSI_CFAM
> +
>   config FSI_CFAM
>       bool
>       select FSI
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> index cafd009c6d..ba92881370 100644
> --- a/hw/fsi/meson.build
> +++ b/hw/fsi/meson.build
> @@ -1,3 +1,4 @@
>   system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
>   system_ss.add(when: 'CONFIG_FSI_CFAM', if_true: files('cfam.c'))
>   system_ss.add(when: 'CONFIG_FSI', if_true: files('fsi.c','fsi-slave.c'))
> +system_ss.add(when: 'CONFIG_FSI_OPB', if_true: files('opb.c'))

