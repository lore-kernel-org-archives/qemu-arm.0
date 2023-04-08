Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp610102ejb;
        Fri, 7 Apr 2023 17:36:46 -0700 (PDT)
X-Received: by 2002:a17:903:705:b0:1a2:17b1:70d with SMTP id kk5-20020a170903070500b001a217b1070dmr217394plb.42.1680914206203;
        Fri, 07 Apr 2023 17:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680914206; cv=none;
        d=google.com; s=arc-20160816;
        b=L8tmyMaEC6UwzhPKhbUIq6us8cuCsCx/RUH8Iu5trLB9kJmCcucOoeZnjbCJ16CMKx
         +FO1f4rEPpdJU8JCpXT1FxdAKqGpX7lzxUgIfjuQyjrqhjQF/ONqrfm8aVEBsmK8aH7w
         ttFWrDw7I7CtVzMb0K7+q5e2Hz+nvR+tMgVE8MxKb8DVJhxHywSOEdGNGV3xT9g2gsjs
         shj77BFLl6YcAsNQE+dT6x1BE/6quaNPGYilMOGJbV0lXAnH2oREO6DAmL45LL4z7mW4
         oSwjdE/wxxcyg2SktdttJ3ifE36Ro57j2yeupIQDguTdRu7b2MopuPwlWYPwnnPubIF7
         1Pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pToGA7FV0Kiuzd13D8HdwPAx2mWDhQqvcrmIS2Cnr7I=;
        b=r85ZqousVUg2DQvJ+6vaWRUOO5DHj2XTZQr0rQCxnJKX4XZDTiI05uUTrNrAPey3cF
         7pamk2MHzRA8Znpl/y364bcL8T25McGyqvTr2nFWXUL+cHrB12iRA9pQvHSuFABeG+zE
         noVe3lRYODRr3TRa2+paoYkq/0s+4Sih0wAVERJhQgCUVlzW0VeEIYeXeYZf20eNHaLg
         sG12OVeCHYw7onbv0qjjjY1ox6cTyeZJif1vgzug9eJlvCjJ1G+YEVXbTjMkLYHbEzch
         Y9TjM/EUCPmTbVonGqr1XCYnWWoLskfw1kFM8CfpmAYf/rED4m/swR7ayGiOdNvKCoiQ
         USsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTkB0j9l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id iw13-20020a170903044d00b001a1d394dff3sor1037086plb.126.2023.04.07.17.36.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 17:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTkB0j9l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680914205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pToGA7FV0Kiuzd13D8HdwPAx2mWDhQqvcrmIS2Cnr7I=;
        b=NTkB0j9lk3kv7Vr/kgHBVZYw4BNYJx3chmF+8X9rG0YK1V5srco7gsi2d7gbEC7tu0
         8pqFA+IZGlpP1ssRQC5vU0ql7nVO+DBZPq4aRNxko+WIRV4NHqKnwLn6xyqVNuOx8dYl
         tHsz9KE0ZRd7uWCuj4Zkf2x8T1HAKDO7AnQ62nX+967KKhesRrTtKZWdRHLRN3rsZhfr
         WGLiUFQ5zJiAp/fRBwyWzImXwU8NQOrT5tEDWTjSG5PH5/SIEP0p+Z2OE0/Vpyio1f9I
         d8x3vsBe/4OIySwaaKi6gxhmp+X3XVic8EBPRusNcRrmSUahp4+AkSR0X5qvhOXIBBJI
         /C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680914205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pToGA7FV0Kiuzd13D8HdwPAx2mWDhQqvcrmIS2Cnr7I=;
        b=w5JrgJYq//6HjGLF2a7cnJxuk2pmjqqQTbwBjSmqW5V60b2PL+M2JnSfhcPJKHlNWC
         qrlzVfmJ+BxWvzIYZVR0WXLgzNJ0JhqxiuhtB10aKML2OsaWHp64fOzduDrFSc4REZ6w
         14FR41NLfQjYcJNpnT5bBJrRxTx4i9EAmdkG6i2kuVIPu5rfDsRVGo1Q7RyK/UN73I+L
         /MqHay6kYByvcZqlAbzA/GaG0DyZ239pd174LJ4kszdfD9Q590+YU1xKLWKm4ZTbGib3
         yQolqzq0Zi4+KVefuDAhUHxh0w61E1Pr0LDprVSE79AFP32GGI9xXO0fN1ph6iNeWbEy
         vkXg==
X-Gm-Message-State: AAQBX9cE07fvg7sMY8zYI3Ab6shCTQxcxd6tKXlRUSFYqUELQSaZudXD
	G/ipz3LJoTdt5ZJoRc2+A2+czQ0V
X-Google-Smtp-Source: AKy350aucnCbxoMrXwvAyMohaMMogPmBAdeaQMVXJGLyL1y0RYnmQhQH5DdC3xcMXS5Nug67U7UBLg==
X-Received: by 2002:a17:90b:4f42:b0:237:d2d8:3256 with SMTP id pj2-20020a17090b4f4200b00237d2d83256mr754113pjb.20.1680914205650;
        Fri, 07 Apr 2023 17:36:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id pc9-20020a17090b3b8900b00233cde36909sm5172046pjb.21.2023.04.07.17.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 17:36:45 -0700 (PDT)
Message-ID: <d6d73e10-a551-09aa-88b7-848b11953f60@linaro.org>
Date: Fri, 7 Apr 2023 17:36:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] sysemu/kvm: Remove unused headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PvnFetR8UX3M

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> All types used are forward-declared in "qemu/typedefs.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/sysemu/kvm.h | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
