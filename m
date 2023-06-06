Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3657557ejb;
        Tue, 6 Jun 2023 11:00:38 -0700 (PDT)
X-Received: by 2002:a54:418e:0:b0:38b:4214:94f3 with SMTP id 14-20020a54418e000000b0038b421494f3mr2742701oiy.24.1686074438642;
        Tue, 06 Jun 2023 11:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686074438; cv=none;
        d=google.com; s=arc-20160816;
        b=QTtMcKXN3K51LiO8viXQ3EKHqOQkM9s1sNv7PWA/oHIznDw8SOFvPaIyh+uwzlwkCV
         f7L7J5Q1i7MpXgRnnWe4S5YHeJRFCzaG0N1+AG3AfyIRm2QbLj4KSHJAY2ToZALnHMzF
         t2wVhXkmXuayMZnWi3iKPgEBgiYraO6lARGcbuV2BK4efjT3vKvnzvxnriAgJ8OUYMGx
         t/uip97QlUxPrQAoJAS1vScelwMwy6EC4PmqX1Q8x101d36jigl6YlawNWWz9t+6X2ru
         gSwB1Y3VOPd/gtZPfJidc8V5n2K6gajLeESXy23eORhLkOcU30FRGf5mCWXIcCQdJSaC
         r7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IkmWsUeQ3NeqOOEXMdw17W1sbDyxMp7hfVxIgZmM+dU=;
        b=Yv85dW14tqsa2CFhHKZglBCHZ3m2S/E/TA0EAhiNvnpJvPwbCl8ms2qwZ5z1+BIn1Y
         WpNuaZZhnkCW2+zM5ep2j1i8H1kiNMWj48F3F6KNuY7hcsm9AqPaofwyAR51z3qApjlV
         LQwYVhWSQI1pYaFS56WvBs8iF+AFy9ohtJ/x5AlGAaHn4nC5tmhcirzWypqZXAq+7bcD
         w51kA+fyylF5QpXLT7lXWuq8HBad1W8ttreG8AvTyxDU+hQQu2HxgEWUQS0vgaQcdRyT
         qCcJlyGIel6lN+XlVDKLiInzBlXMIBoFdXDuj1M6LbW1CAtu2KpyvyJHrDuEL0PXju2d
         b4Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o3mwICIf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p8-20020acabf08000000b003980c7795d4sor4737455oif.12.2023.06.06.11.00.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jun 2023 11:00:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o3mwICIf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686074438; x=1688666438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkmWsUeQ3NeqOOEXMdw17W1sbDyxMp7hfVxIgZmM+dU=;
        b=o3mwICIfLws+jcwDsNpfIxx92VjPaUb9/a5z/SHauUvHO67t6AiTqEb2wymWKEHgbI
         XXo/GidAR5Ve1stX4cQklkuWSz/VUWOC8JzROflwiew80+hqWx+0C9KFpl7PxrB6Ln4O
         l6bumFcuYj8QpkLigfkOA7YqvGgIORxKmLKgq1f8Z1G+3ozPHbAlV9XPdpoSZeO/r0FV
         H2i0vLgYSE2IIOo2NWtRDVzSmnXPYFrazuxFFNyglCFdjTpj+Eedzq3n5jelfdfElYaN
         7JzDE97R2mrg00hGl5zl8ae4mgicgzZ+5B8cd3THQ14wo2F4rXbhChYfPJ/6OOvlpdl5
         N4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686074438; x=1688666438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkmWsUeQ3NeqOOEXMdw17W1sbDyxMp7hfVxIgZmM+dU=;
        b=GYha5VysRyTgnQdeTVg/77iOY4ypMUu5v5QgGOOUZ0l/6EPSUjL4q0Pk6/W6bJWZT2
         Ef/SIM33ObzFFKwjGEreWvne1KrsiF9oeVFHxYQjitb96eTstxDF1pfY9di/irU1imu7
         Mdg3x1ISLQn7pvzSkbM6vnWpVnbJlbboC45pTvge0TIMD/YJipOuPZDmW+wQYslTQylH
         jhFGV5TjpvzkrRTFmwFdtsk5bsWzWQURoe9X8fod3cS945Oco1Tiu4fh1SHjdWrh687Z
         eJMgU2JJzCbJzpNrkKgeUOm8RQ6bfmMc2sK9K5tOagN2kk8xAsRk+JCCwgbboLjg1FTm
         +fIg==
X-Gm-Message-State: AC+VfDyMCm3IHLPoV1/WyFhhG9fM97OkjdulXQCQ1ySqoB1434gLsBxh
	W/cjvki0xsrVkzeI4vDKga1yqRKt
X-Google-Smtp-Source: ACHHUZ5fww69VSyE1Z7z5sKWe2gU6haAEEnK87S3bMijOfh0NOXcPSM6//xY2wXNq4Wcm34iiTnJtw==
X-Received: by 2002:a05:6358:c114:b0:123:57ad:62b6 with SMTP id fh20-20020a056358c11400b0012357ad62b6mr595071rwb.0.1686074438110;
        Tue, 06 Jun 2023 11:00:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a? ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a154200b0025621aa4c6bsm10370844pja.25.2023.06.06.11.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 11:00:37 -0700 (PDT)
Message-ID: <2cf9b45b-c2aa-c83e-706a-e3e51601b793@linaro.org>
Date: Tue, 6 Jun 2023 11:00:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/8] linux-user: Emulate /proc/self/smaps
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230606132743.1386003-1-iii@linux.ibm.com>
 <20230606132743.1386003-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606132743.1386003-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Utl+stM4KOYe

On 6/6/23 06:27, Ilya Leoshkevich wrote:
> /proc/self/smaps is an extension of /proc/self/maps: it provides the
> same lines, plus additional information about each range.
> 
> GDB uses /proc/self/smaps when available, which means that
> generate-core-file tries it first before falling back to
> /proc/self/maps. This, in turn, causes it to dump the host mappings,
> since /proc/self/smaps is not emulated and is just passed through.
> 
> Fix by emulating /proc/self/smaps. Provide true values only for
> Size, KernelPageSize, MMUPageSize and VmFlags. Leave all other values
> at 0, which is a valid conservative estimate.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/syscall.c | 58 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 57 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +            if (smaps) {
> +                show_smaps(fd, max - min);
> +                dprintf(fd, "VmFlags:%s%s%s%s%s%s%s%s\n",
> +                        (flags & PAGE_READ) ? " rd" : "",
> +                        (flags & PAGE_WRITE_ORG) ? " wr" : "",
> +                        (flags & PAGE_EXEC) ? " ex" : "",
> +                        e->is_priv ? "" : " sh",
> +                        (flags & PAGE_READ) ? " mr" : "",
> +                        (flags & PAGE_WRITE_ORG) ? " mw" : "",
> +                        (flags & PAGE_EXEC) ? " me" : "",
> +                        e->is_priv ? "" : " ms");
> +            }

There are a couple of AArch64 specific bits here, which we emulate.
But this is good enough for now.


r~
