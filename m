Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2511621ejc;
        Tue, 17 Jan 2023 08:16:59 -0800 (PST)
X-Received: by 2002:a05:600c:1c1a:b0:3da:fbd2:a324 with SMTP id j26-20020a05600c1c1a00b003dafbd2a324mr3587643wms.36.1673972219011;
        Tue, 17 Jan 2023 08:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673972218; cv=none;
        d=google.com; s=arc-20160816;
        b=hs2odQ9CykAKDA7n3YPmHyBT02V4mTktbJem0RAu4GWJscpRklbyyaLlpExIX3xHYi
         AqZQD3vjtJ/kekGQBz13g+g20RYI20F19LKt6555o/dwAIlUtl03sPZT3/IjTZ+Ee82h
         u94cttOIAzdrb/GIMDX1H43hjuLtkYbkVYz3MsT1bui3pI53xiuKgU+EkygSA3XQed27
         wFeYBldxVU6wvu8i5n6mF0S4YkxIRJNKhCXjk0ob8ZeLT5aGDY1JkBA62YA+YkxjQ/dc
         u2jiSqLgQAeW7zVafxdnc6W6qqD2HxSzoN2uOJAPulqlYaWE3YeSAGA5IoNPUjsf+MJZ
         1+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FQyfz7GFXFp/yRvoE9XY5c+G01h5EjYf0zpXppNFrVA=;
        b=WdFHZ4tGPeZuBy9mKRsNjtsw7x61ngSkhdsPg6JSNHg36lycCdwlDiQ3YdwSg+JlxE
         Xdd9eH5fBuQchWWCDBBgSFfiEd9bySudL2rKu919rCy07fgkP0RMJSzPZikN43KPSPMn
         jdeJ/G2+Dp1zl33sxFcjQgRVKaaCjZDDSofxsAowpWC6s8etmqRfcsr3DL4pgPNeCN5j
         zOcXBX9bTj6wQG05c0hLtXdv3CeudTOofRoaDi7mEM+PrnSbib9qTjIh6uv+su/rCM7o
         0wXFrUv79Wm6H+dmrwYOJOj3rVo/fxFLdXTEGPHoGyuPmA7asphPDMGPlqkWdFTQv8DZ
         3LOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VGiB7E/Z";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w4-20020a1cf604000000b003c6bf7974f8sor11108151wmc.36.2023.01.17.08.16.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jan 2023 08:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VGiB7E/Z";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQyfz7GFXFp/yRvoE9XY5c+G01h5EjYf0zpXppNFrVA=;
        b=VGiB7E/ZO1oxzYMfbf5cmQV4AxekiWJlP01Lv0DuiXDVHvC58QbYZ7iE0fOJAsOMpM
         WHgYMiVKSo4vuqynBfpSKcvOdh6hRQiT14+5MKVVetTD7LqriC/VorW0pGNsgPdRrScc
         7743mGLO+auZtTEO+KXzNTGwXHNRSMn2U3tBMMqDGpaTuHJ0frTdkP+QyJF0tIgusYxf
         fx8XfHphjQJKgm1d2/QXABpbIXzzWJCxIYwUKO5s4fG0/AIJX4emu18ICKHvfqmqf6m/
         xTb9VAM5Xmej/umeJ8QiURsAHwOGO5ntfttz1b69fj13UF8qtaW+mjvaPK4piSQcDT4g
         mv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQyfz7GFXFp/yRvoE9XY5c+G01h5EjYf0zpXppNFrVA=;
        b=Q8abl4C5QI8JfzWTjwKLiYEQ5WLmw8BzlGolk2xIA5qWk+PqmKc2LmTxTAC/1VSYeR
         hfJEUoAgEMzsQ9sXZtZAxEAmzQn6tF8kQyh7Q8zfkhncACwkwlBzEH46uP94y7iTXWwr
         4ASCLdsKMb8Jzecn+52j7/00aDmhJOMQYjCLpeKEWkgq2JcFTkMI3iwl9WFkylZOIloD
         asDrHXXAPEqyj6L0MS86DRrfasyw8qa24RVwJi/3Wy8r1ZEa42vK+bjj1VKJFccCm4u5
         URxORrO5jlrK0I2Fg4fq30sT10BC1rww/WtxC4YBETUakGthY+LVgvukrQkyLErAkrrZ
         kWLw==
X-Gm-Message-State: AFqh2kqTwMi3FVb4BqWnQmsj7iZhYx+Lr6yoTZhfY2Ebbcklk9ydGBDP
	A983NSjcqPYoNS0MBXTQgkgdRqlG
X-Google-Smtp-Source: AMrXdXv4cU/eqbSxCGkK4YaozkQNRAEYyqDcwuqNKagGw81rYGRE5AI5rj6Z57QDBbOyZ4Ag3fXIRg==
X-Received: by 2002:a05:600c:181a:b0:3d2:2043:9cbf with SMTP id n26-20020a05600c181a00b003d220439cbfmr3662010wmp.10.1673972218799;
        Tue, 17 Jan 2023 08:16:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c231800b003db07420d14sm2359370wmo.39.2023.01.17.08.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:16:58 -0800 (PST)
Message-ID: <ebe782e3-c73c-5311-451f-8d36ea391e7e@linaro.org>
Date: Tue, 17 Jan 2023 17:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 06/28] target/arm: Move cpregs code into cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-7-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xd/EbAkJ4FGn

On 13/1/23 15:03, Fabiano Rosas wrote:
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.c     | 9087 +++++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c     | 9063 --------------------------------------

Nice diffstat...

>   target/arm/meson.build  |    1 +
>   target/arm/trace-events |    2 +-
>   4 files changed, 9089 insertions(+), 9064 deletions(-)
>   create mode 100644 target/arm/cpregs.c

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index aa94db9917..0c3e72a266 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -31,5614 +31,9 @@

Can we remove the '#include "trace.h"' from helper.c?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   #endif
>   #include "cpregs.h"
>   
> -#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
>   
>   static void switch_mode(CPUARMState *env, int mode);


> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 2a0ba7bffc..04a480443e 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -1,6 +1,6 @@
>   # See docs/devel/tracing.rst for syntax documentation.
>   
> -# helper.c
> +# cpregs.c
>   arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
>   arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
>   arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value 0x%" PRIx64
