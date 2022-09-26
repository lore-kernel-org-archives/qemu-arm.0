Received: by 2002:a2e:b168:0:0:0:0:0 with SMTP id a8csp131376ljm;
        Mon, 26 Sep 2022 13:19:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Q0s/EabuSM06Y4Ad2pSRGM99stzdzhvvXzTMksZ0h3lvGdNR35LBgGNgEQ+Iq6dAH3Rmv
X-Received: by 2002:a05:600c:4fc9:b0:3b4:9a6c:9545 with SMTP id o9-20020a05600c4fc900b003b49a6c9545mr290251wmq.142.1664223598440;
        Mon, 26 Sep 2022 13:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664223598; cv=none;
        d=google.com; s=arc-20160816;
        b=jDcjY6ictetXAjQFCv3iwRu4lAPCyw+CMyjBBiIdzX5xVvOPQRkXqcLLJHtdWS3huE
         cL5hZ7S6DdE/7iQzHnQqbMrhZxv5nPKXUi7AZRyobZmKA5zDMOr9ejfXdO2DSU2HHWhN
         hZXnDcCWF1KKDNpgHg6Fy4Xo11Zer3rGVJWVz4JAq3iHWzSji32fVclL1a3jm7oEq5OK
         JaJINkOlrMqVdiKvlMKSWoc2CLokCRMxokxJaypJyN8X32HeJd/ckvySP4WleAZyEm7d
         8twZGJ/FZ+vgo7iFvjMD8qAAwpvcRCNYSF7+0vloA8iK7UxwuHrsfTHn3Oj4D3K33ovn
         D4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=99+lOeWwMeb5iiIvocQzMl/5PDtquByUUd0o1YV1ovw=;
        b=TV/54nCnBsGQuysakBkxwljMfBgF4bhk/JZRmcfkr2UDYvhFHKjd+75Yp1xU31LWHX
         NEZVs+SelyixxRlIvVyf9IVC5Z87rOeTfcyL4ea3BgCjyNZyi2ERYvrXQ2wnQWR01764
         FWHg3bqcE4KSLowVEzwPkp6m9CtpCqwIDAYPIZvvvK1d5yHS1BZb5rkBvPspYQHKCRCq
         sAwT2I+psjMB/tjpZLsIPYmX1aQk2ocrgP9LjbuYh2BGuMmUYYwsIO88oItMkU4lY843
         0FlAhCcH8OeZji0eZskyy7BfKsl9clKj14zaZkVeT54gL9/SDkgN7JeVGVFxVNe8KliP
         J5Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id f11-20020a05600c154b00b003b45ad1d179si7350432wmg.127.2022.09.26.13.19.58;
        Mon, 26 Sep 2022 13:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [10.95.79.201] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
	by csgraf.de (Postfix) with ESMTPSA id C1A3E608061F;
	Mon, 26 Sep 2022 22:19:57 +0200 (CEST)
Message-ID: <a4461fc5-bfb4-9be8-459b-4f469e19d25a@csgraf.de>
Date: Mon, 26 Sep 2022 22:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2 03/11] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-4-alex.bennee@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220926133904.3297263-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: n2CxS5f5l1xd


On 26.09.22 15:38, Alex Bennée wrote:
> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> Cc: Alexander Graf <agraf@csgraf.de>
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 060aa0ccf4..13b7971560 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>               val = hvf_get_reg(cpu, srt);
>               address_space_write(&address_space_memory,
>                                   hvf_exit->exception.physical_address,
> -                                MEMTXATTRS_UNSPECIFIED, &val, len);
> +                                MEMTXATTRS_CPU(cpu->cpu_index), &val, len);


I think it would make a safer API if MEMTXATTRS_CPU() would take 
CPUState * as argument so you can just pass in cpu here.

For the HVF part however,

Acked-by: Alexander Graf <agraf@csgraf.de>


Alex

