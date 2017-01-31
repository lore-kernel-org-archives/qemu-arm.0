Received: by 10.25.77.65 with SMTP id a62csp99220lfb;
        Tue, 31 Jan 2017 15:39:48 -0800 (PST)
X-Received: by 10.98.200.207 with SMTP id i76mr31592326pfk.38.1485905987958;
        Tue, 31 Jan 2017 15:39:47 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com. [2607:f8b0:400e:c00::243])
        by mx.google.com with ESMTPS id m30si12600112pgd.339.2017.01.31.15.39.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2017 15:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::243 as permitted sender) client-ip=2607:f8b0:400e:c00::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pf0-x243.google.com with SMTP id f144so30282673pfa.2;
        Tue, 31 Jan 2017 15:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=U4kslvD7Hcpus+acxyxBc2VXjoZyJy0mqcItkeVCVfM=;
        b=jCQWQHm36c9dFvUBgPNaCvvweNsuUQSEhGcAoUtv1BpBajjjS0EM7byUPk5I/kvEGj
         pv3rwZc9nPv+uNcRSm/f8sgpU2X1cv5lWTy3UsSfXyHJYqmxrwiBVhFAE0t8U8Mw3OPC
         ga2fdu5DWPcPki2Uk9bCvSdWxUzqhxpZjdWGWEtCmg4EDQtjD+59dEoaTcPaE0dc8LH6
         A5YHYoJAj0orTnwA+nlX1bilppyj0t5uYpT5sY5R+A9vYSM/h4yu+CWEdgopOrJ8+pIJ
         1Z6xGN7GqLAVWLAZJpSSy0e1WMH8+lA9hsqSiFKt/mO0o+fb26H97dBjww2prYhz0XjO
         4cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=U4kslvD7Hcpus+acxyxBc2VXjoZyJy0mqcItkeVCVfM=;
        b=iXxjPk8mQvHu+hi0iqEmkne1qQcnVLcnhhab1fJEmlr9/EONE8zPFqB0p6iVzoFxtt
         WxCmCDe6eQlUmATC0YHG3NLr6jBuk96fqlLvygNitcIYAEmxXOjOVoIvH3TE+qA0vIun
         VB/uu5moW9TMJ5Tvyhf3Vlfh+yEfwFG1MXQRDWaUUtAxr59MQXQBhvVWdCA1pKZbSyEC
         8b7vEymRt1G1mQQLfmafrWEFJbj7Pfx7KP+42NkRZnf9g3XEdHwyBB9PHtNp4Nlv1bDE
         h88TvVytzVHGjmYKe4celrtWHIhAC5JAv5u8sU5dg9CpzI3BMIxCaLpLKb5DvcPU5X2n
         wACg==
X-Gm-Message-State: AIkVDXIBQSSDNrq3HvP0nA7IcLWfCqejYlP96Okj27/PXRigbvbnFZ6d+qhmqcizWeQJmw==
X-Received: by 10.84.136.135 with SMTP id 7mr43595927pll.149.1485905987487;
        Tue, 31 Jan 2017 15:39:47 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
        by smtp.googlemail.com with ESMTPSA id f3sm43858203pfd.10.2017.01.31.15.39.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2017 15:39:47 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v8 25/25] tcg: enable MTTCG by default for ARM on x86
 hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com
References: <20170127103922.19658-1-alex.bennee@linaro.org>
 <20170127103922.19658-26-alex.bennee@linaro.org>
Cc: mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com,
 serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com,
 bamvor.zhangjian@linaro.org, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f15d91cd-e5b9-3dda-7afa-5b2a91b9e9d0@twiddle.net>
Date: Tue, 31 Jan 2017 15:39:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170127103922.19658-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oCneVfe4jBLm

On 01/27/2017 02:39 AM, Alex Bennée wrote:
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
> +#define TCG_TARGET_DEFAULT_MO get_tcg_target_mo()
> +

Why the inline function?  The expression in the define would seem sufficient. 
Otherwise,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
