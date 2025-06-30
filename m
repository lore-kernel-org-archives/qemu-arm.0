Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2603457dye;
        Mon, 30 Jun 2025 10:00:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhCo9tJ9N+994lMGYkSwE02jxYzxGcxxrJQA+Jph5m24nK51AtOMS3CimgcdKZe0BGUuR9WruyzQrm3w==@linaro.org
X-Received: by 2002:a17:903:32c2:b0:235:1b91:9079 with SMTP id d9443c01a7336-23ac4627094mr218106395ad.32.1751302815047;
        Mon, 30 Jun 2025 10:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751302815; cv=none;
        d=google.com; s=arc-20240605;
        b=KAT2kjy3gZC+hL90pQhQftcufPsqKj0SP+rXQpUVpa8toVZ5LITA/uN8TlT0MDkbRT
         WIuZUUdBfWdbTgKs9Kwv3MEFAPSJA7MrSxCEgv4cz0sq+4NJgeOikSXWDApuDNp1lGaF
         hXJGUSZAVe+k2WTW5uBN0x3o5xDzWvIQlf77f4Xou7QBEr69k+jJl41JMaLtbLH/iORO
         Yr7SSPRRdk8od0ZSTPQhmgQqncQ9yMerMtj5e8AessVUn7n6pysAHtfzVnLpKnGX9Ext
         KD+pgPxlq3+inOO895JGhwpVklrd1aq08htygZcXfPotCn+iYEzoV5pwym1iZV8NveQp
         L/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I3eQNe5zSWFvV6RMIIvin+yaWpWS4xAVg44LW33aFDA=;
        fh=KnZRzfYovVCF8jvMw1K3Xm1a/i4G7kVRrKwuKxfW7EI=;
        b=X42Hl6U7Z7TjR2ZuAFYDbJQiBR/35Xv8hMIalz7W3FMvvr/C2J39PFdIORpZ9wunhL
         gVKm6Ce0rODAPakC6NTWIrg45Uvn9Rdaom/61XrIKeq4IO/JFu+z17vESsrYgAUDmCDG
         NKgshjdJVVo96JO/+vcYbggO7MGWOv2mvPggiRYaoW4raB6vZVYNSFsZvih4OHhDe2Qd
         POpbO0D7GVDXhfH670BUkBqY7SaY+/kdQqnUy2j9ZTiesMUDCDw45/MNBpjcQlKIP+B7
         ywY3jIA9Bxf+Zxyop4uLgzGNKz6izmmmtCViILK17/3RVrowNgZEOFZopcfwdXhh9FvO
         TfwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qAhYh/kr";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-318c14f0601sor7268222a91.8.2025.06.30.10.00.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 10:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qAhYh/kr";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302814; x=1751907614; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3eQNe5zSWFvV6RMIIvin+yaWpWS4xAVg44LW33aFDA=;
        b=qAhYh/krfLtxoWAOckLU2mXMS2OTfwA8NMJHdhBYmyI6292rvXP/08go7SOFDHH46R
         mZvjVoZlDoRUsPXb6GS7suTPxgoFHzvchCxIF34u+wthJtL+C0O3HbwU0EWhBAhPHQIF
         hvb7+W+egS3spSZy0Yt9PWHshPCx/ONjcTLos3zYPll0kgpzsseVpHo2u4ttgBDrr/xQ
         7da64ArQmojTdvrE7ddlhXPSt07wk4YXSFllGwXNEberhv96gD9FJAQk+q+CFoeJA+87
         AX6ZdH350cLelrjCtQRboJ+0uASU8Kxfi1gLICBMyDCtd3ROZUjMIsCIbu/xF/JnqVDP
         Riew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302814; x=1751907614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3eQNe5zSWFvV6RMIIvin+yaWpWS4xAVg44LW33aFDA=;
        b=cMk9Kerq8PDNpO1Hors5/yWfrYmW7Oo6utD8rUAbCcqaJhZMkK9saEf4KST3kRP8Ss
         DLRUDsW/jgK7igRn9xABhUc71/f3jJ9erVaGeEncRTHPVhZy4PvhL4PwRdvSJtVYrlBa
         Ixw2I96/p63ic4/45bcNQJAZtLcbs5O/kC70OvIaSOdJaBYITXq3f/nhYxy80aC0T+Uf
         Z+IEti4vFtvi1JTCojjiUwRfzZQ5ZK6zJT3mnEJAnVcadETQdjL6fSUORGMW5kPVr3Bz
         nuglA17EvCJJVsJlNhw2cpgAx9hMYR0HU/haxDKUPURgd6FM9aFJbLqy4nBXyMBVl/Cr
         nFSw==
X-Forwarded-Encrypted: i=1; AJvYcCVEYlxcXufdPrTbh/uY2PfifVS15LbCTK0s+adq116mxq36vtG4LNAU2H75EoIyxYjLf6HYXDaVYyV/yA==@linaro.org
X-Gm-Message-State: AOJu0YyJBVE3I3680Jo3LVTjmiTa5Ww9+4L2EJyLeAeRCpf6tvc+qsnO
	MdNiP16DS7cSocv6SJSOe5CxENK2LpfBw+YPJvIbSbO7IoRs43pMcrjsZnwj8mn1tDcXYQ==
X-Gm-Gg: ASbGnctNclI1aEJjwULZqFp1CftSL2w8BK5YY/gRgP7Enm27EEh1sgctrSE9YB1WOW3
	3JKNfs7FXb5m/rKU9U9S94RheZdzwHGvuXpEMdaqofIgW6NATe4LP5TyYu+zeyEdjtavcS6YddW
	8RlLId4NyZdeKXlaSmUp7oXj/HMZ+msnD6xxrynMZct8Y5KtJicOsGRA4wJ8j5zCXqajGEI52Dt
	lPqwQE0wQkzFXB9lDtrxBNcI1tqK5SJ0nrwZCWNpwZ019scJlnbRUjoB945J3aJ2jzS8pgcQ+CE
	5GM1PN751BUuZViPEuHqKRr+T0FF/IA1fhhnXcspVWf3URdeyYGkU8evoNtqDWiSKBV+FUs/TYg
	=
X-Google-Smtp-Source: AGHT+IFGQTfgRoayqp0wsGP0Ws6F1wt15Q0VksNcgT2DBn3B6Mah97+3gXp2+5ltKhPsLpxd5/MThg==
X-Received: by 2002:a17:90a:ec86:b0:311:a314:c2ca with SMTP id 98e67ed59e1d1-318c8ff301cmr17697123a91.6.1751302814166;
        Mon, 30 Jun 2025 10:00:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5383eb6sm14661996a91.10.2025.06.30.10.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:00:13 -0700 (PDT)
Message-ID: <c4a4b79f-788f-4c78-afc3-842c2dbcefa2@linaro.org>
Date: Mon, 30 Jun 2025 10:00:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] target/arm: Allow arm_cpu_tlb_fill_align optionally
 set CPUTLBEntryFull
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250630130937.3487-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rm7Ka8kQeqwf

On 6/30/25 6:09 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
> index 23c72a99f5c..df04ef351d1 100644
> --- a/target/arm/tcg/tlb_helper.c
> +++ b/target/arm/tcg/tlb_helper.c
> @@ -349,7 +349,9 @@ bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr address,
>                                 &res, fi)) {
>           res.f.extra.arm.pte_attrs = res.cacheattrs.attrs;
>           res.f.extra.arm.shareability = res.cacheattrs.shareability;
> -        *out = res.f;
> +        if (out) {
> +            *out = res.f;
> +        }
>           return true;
>       }
>       if (probe) {

Would that be possible to provide more context about why it's needed?

The goal of tlb_fill_align is precisely to return a new CPUTLBEntryFull, 
while checking all the protection to access this page and generating a 
page fault if needed.

In case you just want to check if an address is valid, 
arm_cpu_get_phys_page_attrs_debug might be a better choice (checking for 
return value -1 in case of error).

Thanks,
Pierrick
