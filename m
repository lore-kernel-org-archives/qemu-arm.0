Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1687744lfb;
        Tue, 22 Mar 2022 09:49:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1d82:b0:1c7:1d3:f4 with SMTP id pf2-20020a17090b1d8200b001c701d300f4mr6126835pjb.223.1647967764765;
        Tue, 22 Mar 2022 09:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647967764; cv=none;
        d=google.com; s=arc-20160816;
        b=Kz/UU+2kXrK2xYmt5vH2VDYn4kgNBhg6M0nJ54oeO04VdHiCJXJXUsu9RBJBLOYqNP
         vsXK6pahCsofyyEhHaZPHMDMnpbt9pJH5F8wxaTuHexsL4okUl660QZyuHFjLyIqbXYx
         JD4kNnmwywO1abVTcdyeD0EiW9xm8szENFAm943XpzyBfASHXtt6h/7FyxjB/zTbeXxv
         p4qMfT+n0/4iSokHpYJPUjuR8IxxY9Wm6BPPXQpYPonbDfM791VCuROmI46U4UISAQe8
         +i5/Nrbp3pSVeHeHYALAH9OTgXTGw7I83CcusaYggpeBEc1kONaRqQsn1sZj/6bVvXi6
         1rBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JmfhQdsGQ7vsHp96PngBCD8Y7rG4c07+Z5Seq9tTlZk=;
        b=s1IXhX+sNgHXELl732GtDDnTMjuyyg6Io1N7mdML/S/imwtoCF0xpDls+r3MJo3ioW
         KxmFFcQIAmHGRqnkzMFp4SmgjbEoNknITLhHLhfNIj40eKFkZqD8BO2QWo+EvAiUrgNO
         7CFXY4lXXZupQC1iTlXJ20F3t5qfmVZgzTXqO4fIuhK2QgrfQ/Hq43bKQLWoeVGQNT62
         l+5+n1fXhxkSQPlCT6FwDRXxafhHOQNZnNiVRo42ndiKadlVZP1SErdvBJL8dwNFvl5x
         VqqVsrW4Uth19NbFsdTWiF4u59Ntggazdw1ycg7BUj83mjZyuI2lO8YaWcj8SjPoABYU
         qmmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bRk8C+ew;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bw27-20020a056a00409b00b004fa8e92e2f8sor3005063pfb.18.2022.03.22.09.49.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Mar 2022 09:49:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bRk8C+ew;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JmfhQdsGQ7vsHp96PngBCD8Y7rG4c07+Z5Seq9tTlZk=;
        b=bRk8C+ewE6ZA/JMnIjSGxN3vG8wSxM9NwMw8CLBtHCqUPUkn+S5wusGoSxKuFWGMPS
         YXvXnf5kyJtqgKVf8OKGIYo4qnzOg5+y4lu3o6Uy8c0QWfJ4lIFUo+XJx7rRSysjnwpz
         dYkerD/ZpRe19A9Bpd2PcouJTelxT7qKv+7MbL9wSGcjVKnZNpbEguaADqhYPcTkZQlr
         SXs0miW7qGBOzcLV1/K5L2aMP0Nj3Ibt9UCHNnozUsueniQbdwQaz4sZENw+gdFB9WF7
         gTTBO320rIop4oYWFTDN8+v6O0IcXp4u8uli/o7nvA/xhScle9cwbDUYEOQ6oeGRZMVm
         6cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JmfhQdsGQ7vsHp96PngBCD8Y7rG4c07+Z5Seq9tTlZk=;
        b=ExsuSnJKRxrLcZ9LjmH1whm+jB88FNDJLnlwzyPJQG4tDmOhW8Bs1SUFG0wlkwoNGC
         Hog33A6NSF7J1mN/Q/BX6zJ4xpu3LhUk/0uezKuTew+CG34Zy/qvvqHBAr5xHsP8/rta
         I3L9uXeyiS5S8NA8ht9suM8l6GFQTRXDmNg/WyGxvkzzWavhX19h022V4iBxHmLzZVkr
         20LJbwk0PGIG8BgLczI3wxFT4yyNTtb077wyJ5LpZo7sUdk14fXhAScjmrkLgy52jbs7
         ox44rsPQWDN3rMx+9fOl4U8yA6phLIm2xAYB9+YmHqQn0FehuHWaMM0Syfxmfvlom8sD
         uM8w==
X-Gm-Message-State: AOAM5309ytCa+IRo0KTlT8p7w+gBJcluxsOZSCufRBQtQDHNHEPm8mSi
	Ac0Qve/hpHHPDieX7yh6q5pazgLmM/HlLoO9
X-Google-Smtp-Source: ABdhPJwPyvxb3QbR67mBjN4HaQ4kn/Lbu0CjQlhNCxZDUhGMEMq97jGpP/55FRWQr4392qOuOnNLeA==
X-Received: by 2002:a63:6b83:0:b0:380:102:8779 with SMTP id g125-20020a636b83000000b0038001028779mr22852405pgc.42.1647967764254;
        Tue, 22 Mar 2022 09:49:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.10.94] ([152.44.200.141])
        by smtp.gmail.com with ESMTPSA id h6-20020a636c06000000b00363a2533b17sm17785592pgc.8.2022.03.22.09.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 09:49:23 -0700 (PDT)
Message-ID: <be27ed3b-cbba-3ccf-63ce-813457cafb42@linaro.org>
Date: Tue, 22 Mar 2022 09:49:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/8] tests/avocado: update aarch64_virt test to
 exercise -cpu max
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, sw@weilnetz.de,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315121251.2280317-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dSCqqMy5TJUg

On 3/15/22 05:12, Alex Bennée wrote:
> The Fedora 29 kernel is quite old and importantly fails when running
> in LPA2 scenarios. As it's not really exercising much of the CPU space
> replace it with a custom 5.16.12 kernel with all the architecture
> options turned on. There is a minimal buildroot initramfs included in
> the kernel which has a few tools for stress testing the memory
> subsystem. The userspace also targets the Neoverse N1 processor so
> will fail without additional v8.x+ features.

Maybe better as "would fail with a v8.0 cpu like cortex-a53"?
The way it is worded now suggests it won't work at all at present, since we don't 
completely support all features of the neoverse-n1.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220307172249.3125779-1-alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

>  (04/32) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_virt: PASS (3.66 s)

Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~
