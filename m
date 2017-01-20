Received: by 10.25.190.12 with SMTP id o12csp564595lff;
        Thu, 19 Jan 2017 16:08:46 -0800 (PST)
X-Received: by 10.129.83.194 with SMTP id h185mr8880092ywb.221.1484870926663;
        Thu, 19 Jan 2017 16:08:46 -0800 (PST)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com. [2607:f8b0:4002:c09::244])
        by mx.google.com with ESMTPS id i188si1479585ybi.78.2017.01.19.16.08.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jan 2017 16:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c09::244 as permitted sender) client-ip=2607:f8b0:4002:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c09::244 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-yb0-x244.google.com with SMTP id p3so5141660yba.2;
        Thu, 19 Jan 2017 16:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=sp4SZi4pNWuGj1yk6V1zoUlHf7/oq+5+Pw3Dz3U2nqo=;
        b=gniszzyCJj2OxlrJh1bOKWgyqXnRkkrql2vo21TpAL7smJ0UgfcPMCA6xX2a7dcDml
         NY0+ZedDHL6dk/CQ24F8xEPoAMDq7mr6hTAOBI+MFBWzMyQrmTyoN7gXq36Pz9K3Dz8j
         PQdb2LHcrSWqsc5FgNvaRd053zvMFN4XQ90gbM/aOLzHUtAwY8JrUpPYx9QDT3iE9rcV
         ZdnxlLZ5N2xUyAd3kYbfxZoWlRRy5aJUGPloXYw2U1dqJmS9MmKQR26jUycWaL7dviE7
         om8aAnO/bZbqJhSnWjFdgM3nwoAXm9tdjq5OgyChnGd1zU9SpxEuo1igSK1Nw8aBGgjp
         Rfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=sp4SZi4pNWuGj1yk6V1zoUlHf7/oq+5+Pw3Dz3U2nqo=;
        b=uc1stezO2iW9JoMXAhK1ClZl2JXbWiRH/6nE/q67GkREK2kQuDCDz5ShJsLL3K4xcb
         xWUG5tCTlYZnuXEYA4K/dKsAmmSU3psClMJptSvgCyn9TGQUzxjF0geOHr8aWjvD68Ip
         6nkpw2HqC7q13Jhje5075Hbywmb6GIBrZYlUWC9br9z2lKrNF+JUylGqCyHMc052FVCm
         Gc0QZCl5eQXAYyeSwL+GLcLQZsyF6d3FEr8Mi+dH9SLfO8EtMA+7tX8Z6MUnV1yaJnKR
         E5uEVZUtPraqB8U5J+2eRaQ1qS6vWSnc9WURIB6CSO82+Xbfp+C+euvi/8YOghyMxAmJ
         Whow==
X-Gm-Message-State: AIkVDXJ4kzHYgS6wHQ3icEJO7E/ASG5DcQKHu9chaLknWFjd3PXJnULxV6GYHXpsWuinHA==
X-Received: by 10.37.110.11 with SMTP id j11mr8814662ybc.40.1484870926213;
        Thu, 19 Jan 2017 16:08:46 -0800 (PST)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop (c-73-207-178-95.hsd1.ga.comcast.net. [73.207.178.95])
        by smtp.gmail.com with ESMTPSA id d68sm2506402ywh.7.2017.01.19.16.08.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2017 16:08:45 -0800 (PST)
References: <20170119170507.16185-1-alex.bennee@linaro.org> <20170119170507.16185-27-alex.bennee@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.1.1
From: Pranith Kumar <bobby.prani@gmail.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: mttcg@listserver.greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org, nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com, serge.fdrv@gmail.com, rth@twiddle.net, peter.maydell@linaro.org, claudio.fontana@huawei.com, bamvor.zhangjian@linaro.org, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v7 26/27] tcg: enable MTTCG by default for ARM on x86 hosts
In-reply-to: <20170119170507.16185-27-alex.bennee@linaro.org>
Date: Thu, 19 Jan 2017 19:08:44 -0500
Message-ID: <87a8amr3sj.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: R2VzWvEeiHar


Alex Bennée writes:

> This enables the multi-threaded system emulation by default for ARMv7
> and ARMv8 guests using the x86_64 TCG backend. This is because on the
> guest side:
>
>   - The ARM translate.c/translate-64.c have been converted to
>     - use MTTCG safe atomic primitives
>     - emit the appropriate barrier ops
>   - The ARM machine has been updated to
>     - hold the BQL when modifying shared cross-vCPU state
>     - defer cpu_reset to async safe work
>
> All the host backends support the barrier and atomic primitives but
> need to provide same-or-better support for normal load/store
> operations.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

<snip>

>
> +/* This defines the natural memory order supported by this
> + * architecture before guarantees made by various barrier
> + * instructions.
> + *
> + * The x86 has a pretty strong memory ordering which only really
> + * allows for some stores to be re-ordered after loads.
> + */
> +#include "tcg-mo.h"
> +
> +static inline int get_tcg_target_mo(void)
> +{
> +    return TCG_MO_ALL & ~TCG_MO_LD_ST;
> +}
> +

Shouldn't this be TCG_MO_ALL & ~TCG_MO_ST_LD?

Thanks,
-- 
Pranith
