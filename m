Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2516240ejc;
        Tue, 17 Jan 2023 08:22:35 -0800 (PST)
X-Received: by 2002:a05:600c:2152:b0:3d9:ecae:853f with SMTP id v18-20020a05600c215200b003d9ecae853fmr3667966wml.3.1673972555260;
        Tue, 17 Jan 2023 08:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673972555; cv=none;
        d=google.com; s=arc-20160816;
        b=JoOP4auKy8KngV2P4L2lSlCmHrjd7nS44zfbJtiBLb3DEEzl7p1am+znlIqU1LJkRt
         VnptZwfHYAK9gkMrP30U9rorN3NK5MWi+YigxKBzY8Xh6onRkXQTpONuHWeN1+I47kLN
         q1qSHINYIhVXSx0KRHCqUiGobWRSeQy/qE4U0lALAn6WAnPLJ2rDEHx6NJ4aoRtgG5TQ
         aPtyGVVBYHcJLmV+R/YaqtVKnTxabaBXqeZxtrrCzJN13J3kUQrZpGFO720mLyCoMzCK
         UShwQf0pHB2oW9yKFJVw9H2ayIhOIbsiQcC4rCV/1KZsF3JELwF2W4yFKkl4tRsDyu6e
         tZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IxmpzMHTz8+hV4OAE4/nl25vNiisU17G9a+jLAxnpIg=;
        b=ZLSDh7iePgH/INTpjVJ6U3Ep0Ae1PcP42Koybxa1lqX6sttvo1+sDnodPD6pW4RDxr
         9YgCqTTyU57WxbDl417dN7/UjsFnmvs9Nj9dBVrFt2Kx6k/MWh3URg1zDrzi1/yWFD+u
         HZt7Ouw4UAUdoYXLxX3aHu5JOm3ypSeDhgWysbZYUBfloa4lHvELoVY07eRhcjl9sr85
         JbBX3ofNZ/gQVu9+oAYCYI8eIsb+o+ZifBD+HLuFMT3adItCSetVtioo+80ZHfhkXIWH
         1gjYgVyhsSyLtOhrV/BQKl8l7yFi5vcJ0tuxL31+gbz/Y//ndXZzdhCrdZnkJxdVUF6Q
         26ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mz+7JKBK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 10-20020a05600c228a00b003daf671f7c2sor2471840wmf.20.2023.01.17.08.22.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jan 2023 08:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mz+7JKBK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxmpzMHTz8+hV4OAE4/nl25vNiisU17G9a+jLAxnpIg=;
        b=mz+7JKBKf8ZaXddHZ8CwrHFQ37l3BiD42yen/BDB7SjJtP2jPQCt3ZcKQx76yBBPen
         ZYjUY5EzxOty2+HtWJTdTRiXLb2OyOexnfuUylgSaiBawEfXhwpSlinjkZ8h3DNJ0gjj
         4vePF8TwwE67KbCu4fC05Gh0d3HUdOihbjVNmAmvj33nQ//gN8wlIJ69+Wv02SYzwbUn
         OUke0KITjaxoP5ojxrqEcAiP3spcBNqVZqYxz7ZAGX+GBn1albQvRRsqxhvK+InZ5lf3
         uW6bHRWlySPukbYjxmQLfsuDyQbrK5mjksIQf0uYZjKAr3gavZaF1CvP7JcZGo4R3nTX
         bmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxmpzMHTz8+hV4OAE4/nl25vNiisU17G9a+jLAxnpIg=;
        b=YmY2COSgGswBnMl/OwZ7R5ceVCN9b2FHKStsl3FPAOgu/xJzCb3FY1z1smt1WtttLR
         0Z53j0mwNPEtLWGmR+pu371CggHXgPUKJ5lslbuVFWy7vfEx1GjNtmeZAGEI0Rli5oaR
         xbuBNRBMODPELhS5RcX1alwztpelzWh6rjJFlHgg/4KllgQqN/exa6+w+sXmNOed8bgs
         AP7QiaZ+PHSDVkJl0/iwjvv5VtS5CQ16lPswnDrC4DHLlayptQitL3qrNtJHjAgtNTIQ
         6rNe/i0gwMI+SMxQEEtTU6fGI7qV5cRJYL49OrYtUss7bhqOW5IpZHbJ1U22co8KdUkL
         MVJQ==
X-Gm-Message-State: AFqh2kq5wkf6Ao++a+Va7qsiDCLZ4I0PP3owgLX1rjbmpBLc33+LV0ws
	/AF7CnZpMKcXV75LNPCOgrnQ1Dx6
X-Google-Smtp-Source: AMrXdXtirFBilyg7KKPIHgJBDY1nYWvc5I0e/rJ4KESzyjXBBMyKaUK/MBiV8rI/7Lply6hS8Kryjg==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id y9-20020a1c4b09000000b003db0f0a8726mr376357wma.28.1673972555070;
        Tue, 17 Jan 2023 08:22:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b003cf71b1f66csm42290935wms.0.2023.01.17.08.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:22:34 -0800 (PST)
Message-ID: <7d47f4df-1a14-d448-f8df-9c31dc2ee371@linaro.org>
Date: Tue, 17 Jan 2023 17:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 10/28] target/arm: move helpers to tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-11-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: atoczHYhu6wv

On 13/1/23 15:04, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> ---
>   target/arm/meson.build               | 16 ++--------------
>   target/arm/tcg-stubs.c               | 23 +++++++++++++++++++++++
>   target/arm/{ => tcg}/crypto_helper.c |  0
>   target/arm/{ => tcg}/debug_helper.c  |  0
>   target/arm/{ => tcg}/helper-a64.c    |  0
>   target/arm/{ => tcg}/iwmmxt_helper.c |  0
>   target/arm/{ => tcg}/m_helper.c      |  0
>   target/arm/tcg/meson.build           | 14 ++++++++++++++
>   target/arm/{ => tcg}/mte_helper.c    |  0
>   target/arm/{ => tcg}/mve_helper.c    |  0
>   target/arm/{ => tcg}/neon_helper.c   |  0
>   target/arm/{ => tcg}/op_helper.c     |  0
>   target/arm/{ => tcg}/pauth_helper.c  |  0
>   target/arm/{ => tcg}/sme_helper.c    |  0
>   target/arm/{ => tcg}/sve_helper.c    |  0
>   target/arm/{ => tcg}/tlb_helper.c    |  0
>   target/arm/{ => tcg}/vec_helper.c    |  0
>   target/arm/{ => tcg}/vec_internal.h  |  0
>   18 files changed, 39 insertions(+), 14 deletions(-)
>   create mode 100644 target/arm/tcg-stubs.c
>   rename target/arm/{ => tcg}/crypto_helper.c (100%)
>   rename target/arm/{ => tcg}/debug_helper.c (100%)
>   rename target/arm/{ => tcg}/helper-a64.c (100%)
>   rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
>   rename target/arm/{ => tcg}/m_helper.c (100%)
>   rename target/arm/{ => tcg}/mte_helper.c (100%)
>   rename target/arm/{ => tcg}/mve_helper.c (100%)
>   rename target/arm/{ => tcg}/neon_helper.c (100%)
>   rename target/arm/{ => tcg}/op_helper.c (100%)
>   rename target/arm/{ => tcg}/pauth_helper.c (100%)
>   rename target/arm/{ => tcg}/sme_helper.c (100%)
>   rename target/arm/{ => tcg}/sve_helper.c (100%)
>   rename target/arm/{ => tcg}/tlb_helper.c (100%)
>   rename target/arm/{ => tcg}/vec_helper.c (100%)
>   rename target/arm/{ => tcg}/vec_internal.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
> +                        uint32_t target_el, uintptr_t ra)
> +{
> +    g_assert_not_reached();
> +}

Do you have a plan to restrict the calls to raise_exception_ra() to TCG?
