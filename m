Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2598350dye;
        Mon, 30 Jun 2025 09:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVIlN7jZxGiK7sy4LXY44lwYZ4nJYhUopqVpzM5AaGotPoCEMDG1ncX974pxpxmytRAw8f5Kc3+B5hEw==@linaro.org
X-Received: by 2002:a17:903:2ac3:b0:234:ba37:87b0 with SMTP id d9443c01a7336-23ac40ec047mr202078905ad.13.1751302179779;
        Mon, 30 Jun 2025 09:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751302179; cv=none;
        d=google.com; s=arc-20240605;
        b=HEEqf5IzfsnJcr0Iko/gqrAFiA1EtFnRw4CxwydHBCrTSc7BgPBCBoiYP4ewSaVI7L
         54BAos8oLDRKHAqsNDpv/piRtFfYwPLAbzuHpOsn/oBRYmioL3gjXMXBHG96PFd23kdq
         ADiQFF+0/xhrDMsM7oY9vRRb/L+BWYLG7sTQ+uufnpoOtbj0LDs9BDJXoE4DhYSplor9
         TRrjLcOpIO6/2g0BO0e2IfqpU7iCMfj1GS8RyYQPi87vethNy1mf3aeJe568lHnhOxEF
         yDUk8Y/FK3x7J+kkWigkWkcNGcoEWp/fgrAWxU3LZGa6gcJAzUqPE2KvHDL+D9LKS4d/
         2bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tTo9bQDZX/TKUpXWrNBeXrsYKdrS8YGynbPu15MH34w=;
        fh=CHVDevqUiaJcssbr2uDXmmWwC9xJTyFU8M0tKbT7wok=;
        b=eT6cpECOhP/1k5dhmZURPtQ2mWZDzlnJPge9lurkQV/DmWv8j8Mtasa+U0R8vrs6bA
         6rEih56ess7v4iK5cigOKCPgCyPlfZ9wgI8fzFPWbLCu4q3aAmXm8/PATAKQp2nWww9a
         clErJRe5BEsgZ8rh8xmqtuwjs1I9FI1CvzUxkmSv84mgYlvhb9CytJQ36HXYWDYN+avS
         gAgKE2vKtgx2Bddp51n3mfYnn4P/vzDbSrmLFN1nYE+8r29WtJksCnPTC/OGFzhpPzf6
         QKxKtUsdwQ7umXqInw2MwyCkFJdUUeRU5+cjWrPKipIrzaYyaFSlY2CuCgtiJkhIdpqa
         PSsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKCMNRc4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-23abe3a708dsor46755475ad.12.2025.06.30.09.49.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 09:49:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKCMNRc4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302179; x=1751906979; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tTo9bQDZX/TKUpXWrNBeXrsYKdrS8YGynbPu15MH34w=;
        b=pKCMNRc4vfpB5+zPxlHTTowxx0uFjcllDIQeCXfhAhUYTLdg5PQLOeImEMnOMW08Qp
         5mRr6eml06Vw7eZLkkY4n8O72trfisery294TR+ALoj54eDc+m99soe8vtZX7XP5tUic
         bnmBsBB6GmpWkIvHB3PExa32pUGygyjwlFSzxjHQC/7UABcYd2e9bzFlRfmlN56nlwQk
         vRi1Bf1huergXmHhHP0iMwmGS30H+AYyD1zU1o1MKjVJEUcQe5ngPDe2lDz4zb/KCG9W
         VOKkpK22IswG6cP04tGPFbHltLE9Dolh3e3gBmcAcVcsSl3ATQLFjRQ9B2DErGwGUta6
         8C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302179; x=1751906979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTo9bQDZX/TKUpXWrNBeXrsYKdrS8YGynbPu15MH34w=;
        b=vRu+BnKo4eCqvpALahiqzln3jFHzvIgSivA5PQ3lsV8ZXq0+q+x9ZTCLpGECNmz7DJ
         FNpMtxiNkP2ba11w2LjkVytS1gfWtOH9goqKygETiFCR+OcXzTsysRrJLgyvv7ITLH3M
         VpOlGn7FM2MXSTBVKErc5cjB+MOkQttl9Ce4evr/IHbZj0PawB3RvqLs8TOgztD6Gy7w
         ccgx9VTDPX5MvuO+NX8jBF5Ju5SB98o/PzzO+NFZORdDid+5G00AniIT72kiMoOmbDFD
         10lPA9RvX0KRojLALQDc9kC4b3gGKWxOG1vBBcVjRybW/RcNbgSweqGAYWOG4oqUeVfW
         oQDg==
X-Forwarded-Encrypted: i=1; AJvYcCWQxyZab26ig0jIOAnxD8cuxk2z+fXQw5rD47/qiAdfWMR1+StJ6u1zPgU2xZG7qSg9HzQBpyaXx25IRg==@linaro.org
X-Gm-Message-State: AOJu0YzMtRXhrswxLSyt9WgDK5rBHKyhepVbHoFq0hYwkB2GCS4ZwQ1R
	E4z9+KIbeQgVmmTWfjyQigY0n/Mp//murS3qzXUv+qaSEAV2RThkvryVc5jrOAs4+LMkdw==
X-Gm-Gg: ASbGnctLZUk39+M4YTbjrFpGeMTCG2lUP2xBlUgq4PWfSdwTWY09pUN7AkFnbQXeUT3
	4k18jh1hzYKoesdM/CuAZ0heOWFnMLgESHWKnp78AcJP51zbuCQ4qcOlIrk3OhXWcTRb+S8BfJL
	N+JI9kMH2rfK5I1PFr5FGOhVbAzxyyKOhvMV/1SARtG5JMC0Zik3FSc9fzRqKrSZzGkcR1QsGAH
	KUweAKUCOdYcq7QEf5g+nnpnqryouei3CabJOG8k9Mj/HbbPphCbI2HawUIl8fBxV44bNZrXGyI
	COZgjZGII37QMvVuMfTG2Dg12VCXk/QIWQsGiRjrc4vzAOcpQ4O6QOxzs9QKKcC6KSqMmtuzw/c
	=
X-Google-Smtp-Source: AGHT+IGPfHLB9AxOoQRn5fGAquUwskyga5GmnnfuIof5rLxfJcrVSIOEtWlNjeuenDmD0x7Ikv2tsg==
X-Received: by 2002:a17:90b:1d4d:b0:312:db8:dbd2 with SMTP id 98e67ed59e1d1-318c92cd016mr17612576a91.19.1751302179343;
        Mon, 30 Jun 2025 09:49:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5426bd9sm13675903a91.27.2025.06.30.09.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:49:38 -0700 (PDT)
Message-ID: <c4745999-9863-40fc-b507-f6b937430d08@linaro.org>
Date: Mon, 30 Jun 2025 09:49:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] target/arm: Only allow disabling NEON when using TCG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250630130937.3487-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EwGPSIbm40Hc

On 6/30/25 6:09 AM, Philippe Mathieu-Daudé wrote:
> Only allow disabling NEON when using TCG.
> 
> This avoids confusing user experience:
> 
>    $ qemu-system-aarch64 -M virt -accel hvf \
>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>    qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neither
> 
>    $ qemu-system-aarch64 -M virt -accel hvf \
>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>    qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither
> 
>    $ qemu-system-aarch64 -M virt -accel hvf \
>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>    qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: Property 'host-arm-cpu.vfp-d32' not found
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
