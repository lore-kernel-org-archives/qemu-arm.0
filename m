Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1219955ejx;
        Thu, 17 Nov 2022 04:35:58 -0800 (PST)
X-Received: by 2002:a1c:f617:0:b0:3cf:5584:7730 with SMTP id w23-20020a1cf617000000b003cf55847730mr5208605wmc.187.1668688558124;
        Thu, 17 Nov 2022 04:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668688558; cv=none;
        d=google.com; s=arc-20160816;
        b=vYNUeeNQiKHzu5CbzAbGD96RFExErM+Eh7hGCGsXERSajOvcigDeg4IPbPOJylA3ia
         wva1kBdDHafwktGw+gjPRdGLtKKAUc0zxiwvvMOTnI4TwxyqEbtEpzntfJLIq24fUl94
         cGmlD5WZ8uqBVdPI5PnwrQKCOsHTi6sxvFJ0Z1LGHi24iwBzfByN0j+6SZRnLCMhxXuL
         nLYi8LJBGHThSgDWdnnoRJ5Q1tDbaC9q3PA7Vwmq2IEuGN/XmRdHbEphd+Obd8mTsX3g
         l1JAgJkgT0SBTr3gT7HvPADhtd6tH4qhNmrz7/rVH39rjJof6gz0CTfr27LkOs7w+ElJ
         Osig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GTi207hJypWRogL7kEGXVr7Qp6Muoo9NZCYfZ0ivVPo=;
        b=UyPm5keZ4jONTfiL0IOFOeC5wIWMxD/DUvLX/4R6BdupLB5pKFjP/fW5dK/G6aUBcr
         vH/3dBn2hvPwyyTQfVVvcEKAJ1JZniAVmCvSWoeOk3x4ScrXXD1bRrs3HQSCJk5mAmL3
         x5OiwCMsnzF8TqBxES0C3uXxY/1yONQdrZSSZtH0udrN/iYT6qDu/XcaYoqSbm/KQhaa
         jhYOTcoww/i1t9bikfYPwZphXP9JAz5R+/dAQMCWgT6ym8fpOElR/Rs9zKrCX3m/jKSi
         GhAYlDfxE36UoqO4/HEtIlwj9YbrMzAiNNTUNn9PYbcSEN1cGRdlzbYgUxMcEvlpZjp/
         8B3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWMs9atQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j7-20020a05600c410700b003cf573153ddsor1063028wmi.11.2022.11.17.04.35.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Nov 2022 04:35:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWMs9atQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTi207hJypWRogL7kEGXVr7Qp6Muoo9NZCYfZ0ivVPo=;
        b=NWMs9atQ7rKELq0KHNpim+kJcprPe5n98gN9ep+vhQL8ZihesgjWRvXGJUym5smqm/
         K+by/0BqPGDdQIo4imZXvwDzm4o16E6fr+hnPKKQMGiQZZFKHZpz1Yyxx57eV/F51hFr
         BaRNMi1sKEhu0U20itu+lHRCxT9X5Hr/CHbUuiLCFAiZ0PTUjw8uk8M2SWXNOiRMyMd2
         pKB1lrcTNVuFtzm2JAs7HKvDAuVkD6Ki7B1nizW6MqJAL6D35JVAuh51gbZCXFMf7AL5
         yt6kUGM761+k7OWGe2N0Z7qg10eiUwl2RHghPwGiJfjzhCBnAToZniHbVJb+wN3Z4h8/
         X9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTi207hJypWRogL7kEGXVr7Qp6Muoo9NZCYfZ0ivVPo=;
        b=NFfeud1jD1le0ATmGRBaqQvlnek5zjPCYFD1JVO6xTbfHOqEIeae88mKxPTSPmaxbG
         QXGHHRaxn/qC3n7lTPyadeJbVma7LJFEaj0njMHyrGzUZLzblEGqKfcRP6TRkTOqgs+g
         z8xGfW3i6nLPfcPG4v4bHW3dJZFdqD/q6bjCCfvtZCqKfQz2viBGAmdbjFXJH1iWUnUR
         /+6g6cVgF3X0D2yxTZfFBgEHYWughzfXEqokm9B7h62JmJFeqK7k30EQkxNbJAU7yAGD
         NprwU8VTlu4tCsTrqlMok+LEyMyHPPbVd74rvPBR2Chh44EVmogYg9lI6CB5Zfs7PJdt
         is2A==
X-Gm-Message-State: ANoB5pnKPq/Q8WPAfVlyXA6otqGslLIKXRMQ+A5XEyBcVfzgkypZBr0W
	XJzmv1rlPjVj9MYorL4ZAW3rEOBwaTMIwIuo
X-Google-Smtp-Source: AA0mqf5pskwzSCVIpY6Nx5vrk33ryhSlWak8dawjOUdbqGSjJ/v1wdsaQrEFzzegPU7mm/SC7/vPQw==
X-Received: by 2002:a05:600c:4f48:b0:3cf:54f4:eea with SMTP id m8-20020a05600c4f4800b003cf54f40eeamr1602783wmq.105.1668688557678;
        Thu, 17 Nov 2022 04:35:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.189.175] (58.red-88-29-172.dynamicip.rima-tde.net. [88.29.172.58])
        by smtp.gmail.com with ESMTPSA id t65-20020a1c4644000000b003cfa622a18asm5487582wma.3.2022.11.17.04.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 04:35:56 -0800 (PST)
Message-ID: <36fdf2bc-e2b9-283b-d415-9ba10759edf0@linaro.org>
Date: Thu, 17 Nov 2022 13:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] tests/avocado: move aarch64 boot_linux tcg tests and
 slim down
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, thuth@redhat.com,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221117121900.3922169-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117121900.3922169-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6rnEf8qFda7L

On 17/11/22 13:19, Alex Bennée wrote:
> The boot_linux tests download and run a full cloud image boot and
> start a full distro. While the ability to test the full boot chain is
> worthwhile it is perhaps a little too heavy weight and causes issues
> in CI. Fix this by dropping the TCG tests in boot_linux and replacing
> them with a alpine linux ISO boot in machine_aarch64_virt.
> 
> This boots a fully loaded -cpu max with all the bells and whistles in
> 41s on my machine. A full debug build takes around 250s on my machine
> so we set a more generous timeout to cover that.
> 
> We do drop testing for lesser GIC versions although there is some
> coverage for that already in the boot_xen.py tests. If we want to
> introduce more comprehensive testing we can do it with a custom kernel
> and initrd rather than a full distro boot.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py           | 43 +++++--------------------
>   tests/avocado/machine_aarch64_virt.py | 46 ++++++++++++++++++++++++++-
>   2 files changed, 53 insertions(+), 36 deletions(-)
I'd rather keep the current tests but:
   1/ rename them as '_cloud_image',
   2/ skip them on CI
and 3/ add the '_alpine' tests to run on CI.
