Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp740485ejc;
        Fri, 26 Jan 2024 00:34:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE10/G8pdBSThHiV1pQVqe7sI5RYNtIowf0jmjriRFoqMtBzl4POAjXMKxjlA4RKRXYz55E
X-Received: by 2002:a05:6214:27cf:b0:685:29c0:cbee with SMTP id ge15-20020a05621427cf00b0068529c0cbeemr856335qvb.4.1706258058752;
        Fri, 26 Jan 2024 00:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706258058; cv=none;
        d=google.com; s=arc-20160816;
        b=Yie6FBFngIIV7cwitVAM2P02wRob92s3zi2VfXarGT2e24Ok1ml5+MNOmAwe+EuMgW
         cII/fnnKUedimHzVbY7T3Pubs/SsHfm7esBPs6dSsbii8JUY8snEIOQh9unlCwSLN+1k
         9F950BUeueDEauIF7BJi6gMbqhZR3aRjeh8Jef+BsIttEZuP4guCW2576zzmKcvrSmMY
         4ISppuPMNZxCF1NgvVoYG+GPEaWo9y4qQ/alz3Yudk56bkkPz/U7rWg5e3ey3IAm7gr5
         4Op7YSl5FVl7i1KeEuC2taln39RALhOWdnolmzzowag3zs21Nj1X1RhH5X9ByYaOVvsl
         JGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Ww7WBiBP9vuR2URuJ1fmYubFamezI7Et/De3Il4Wb5Q=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=v6i4j86jynjADppKgttBBxRtONfE+ECVhJ1+HJcKIN0cBIuW5NDVvUyoGqshJ2GX2F
         zHgsIND5OvPoRQdAQeOtkYm3fYfTPmeaXjojD1cwJrPxcgfRmg4F9dwhH59kunYK3G5E
         BbyXMiHeuYW+eR700NoEemcrtm/pmM9GgGPSOoPHeslVu0YnU9GOeQAIt8yV96p/CQGY
         Ly6Sliz1XZBM8p/nyyVwBsQKeF1aJvv9PhWT20/IpbqUPRSQiGwVRJQARpQWLMfZIS49
         dYBTTl0QPZgwbjeu8cXTqhnC8H0LXJev4+CJ+sEQUEFwRBq1gcgXVnQ3KhTZAFZZa8zg
         6xoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx14-20020a0562142b0e00b00686f96cdafesi840259qvb.28.2024.01.26.00.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 00:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTHf4-0004rl-PI; Fri, 26 Jan 2024 03:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHf3-0004bS-7E; Fri, 26 Jan 2024 03:34:05 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHf1-00088f-5q; Fri, 26 Jan 2024 03:34:04 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLrZZ4VJ7z4x5l;
 Fri, 26 Jan 2024 19:33:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLrZW0R2Nz4wxv;
 Fri, 26 Jan 2024 19:33:54 +1100 (AEDT)
Message-ID: <769b7e74-6660-46e1-ad7e-4bb3e92e58d1@kaod.org>
Date: Fri, 26 Jan 2024 09:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/11] hw/fsi: Introduce IBM's FSI Bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-4-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126034026.31068-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: zPowQ6jRsNYg

On 1/26/24 04:40, Ninad Palsule wrote:
> This is a part of patchset where FSI bus is introduced.
> 
> The FSI bus is a simple bus where FSI master is attached.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> [ clg: - removed include/hw/fsi/engine-scratchpad.h and
>         	 hw/fsi/engine-scratchpad.c
>         - dropped FSI_SCRATCHPAD
>         - included FSIBus definition
>         - dropped hw/fsi/trace-events changes ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
> v11:
>    - Split the patch.
> ---
>   include/hw/fsi/fsi.h | 19 +++++++++++++++++++
>   hw/fsi/fsi.c         | 22 ++++++++++++++++++++++
>   hw/fsi/meson.build   |  2 +-
>   3 files changed, 42 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/fsi/fsi.h
>   create mode 100644 hw/fsi/fsi.c
> 
> diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
> new file mode 100644
> index 0000000000..50e8f5c888
> --- /dev/null
> +++ b/include/hw/fsi/fsi.h
> @@ -0,0 +1,19 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
> + *
> + * IBM Flexible Service Interface
> + */
> +#ifndef FSI_FSI_H
> +#define FSI_FSI_H
> +
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_FSI_BUS "fsi.bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(FSIBus, FSI_BUS)
> +
> +typedef struct FSIBus {
> +    BusState bus;
> +} FSIBus;
> +
> +#endif /* FSI_FSI_H */
> diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
> new file mode 100644
> index 0000000000..60cb03f7a2
> --- /dev/null
> +++ b/hw/fsi/fsi.c
> @@ -0,0 +1,22 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
> + *
> + * IBM Flexible Service Interface
> + */
> +#include "qemu/osdep.h"
> +
> +#include "hw/fsi/fsi.h"
> +
> +static const TypeInfo fsi_bus_info = {
> +    .name = TYPE_FSI_BUS,
> +    .parent = TYPE_BUS,
> +    .instance_size = sizeof(FSIBus),
> +};
> +
> +static void fsi_bus_register_types(void)
> +{
> +    type_register_static(&fsi_bus_info);
> +}
> +
> +type_init(fsi_bus_register_types);
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> index 93ba19dd04..574f5f9289 100644
> --- a/hw/fsi/meson.build
> +++ b/hw/fsi/meson.build
> @@ -1 +1 @@
> -system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c'))
> +system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c','fsi.c'))

