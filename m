Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1312648lfp;
        Thu, 6 Feb 2020 03:19:14 -0800 (PST)
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr3201879wrp.378.1580987954635;
        Thu, 06 Feb 2020 03:19:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580987954; cv=none;
        d=google.com; s=arc-20160816;
        b=WOPUEKARAIZowdVb46LIt8GkqaOpvJ4fGPH+Tjl+9Znep6s1tLzVjB7z1IgGW3ayF/
         gXfx+x19bOSEmCkZgM37eDiC1NxhjrQ/n5jIOyeMzKh93A7ZX0ry7DZMW0x1YP32rW1f
         3d8yRhnPP9CdauGTvMziDLq+E0fTsRaXKPxKx7sojcU3hjQCyDfzwZbGibx0K3SpYCvj
         BPkXKfUPmiYHL9NVP/vUSf8ChWmeJqUaBblQrYZY0G9HE9KEhcTAY08PzHsNjF7iJJdf
         3Q3e3VEY6nlgHk8agyr/8B6fo26LAwtV1Pf5ipVVApWTm8p8A8HpbhkiDA8cQdYR5cDu
         tfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=vN17QQ69gIBf8TKYtcFphBWXeRO1Dk7l8wmh8+tw57s=;
        b=GA37Tr8GkUAmqTcAHWbL8gqvdv6Y/j36s3iXgDCzH7BO9CNpGFZTsALOszdEFbgcKi
         GSfKB5E7Z3J8fcm1YpplJKmNq2V4DoTniBopD5jBwRt5/XCKR0bHxtZourZIcdsGl9Ef
         mOrdOGiMasLOTvn5SUGmXOrhX5Tu7tc28unqmcwAQI2EWi4IbvykoIlAR2mr9kd9jQLJ
         6UuQjT/4pGvhgpmcir5ZOHIcCev1CTmeRPNReWfMO5ccgSZpzssO59VzTSHVQE9VwYZL
         PBmLCSt3KfCYiLVndY5lB9ICyhmBlHcRncFz7kzWZfIRb2EK8boH0Jpp3XboAL9rhBZx
         A8vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iGsOWJRI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m26sor1697408wmi.8.2020.02.06.03.19.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2020 03:19:14 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iGsOWJRI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vN17QQ69gIBf8TKYtcFphBWXeRO1Dk7l8wmh8+tw57s=;
        b=iGsOWJRIruUVA9SDA4Qz5bK/11J2n7J5dtrZx4Zr5brQqsmGmmevbby9mVI7mUIfIf
         /4LYO0vSLyOLVG3BoUx5tJqujVKc8mUPhMIl8tvEpEYkETER6wT9Bx+z5yI6JlF0TJua
         Z1206Wqco2gjcm7BC1IZOEE4l+ag7VixekjTK6X9TJcQmlHApyYrHHHExjnZaFt98l+Z
         gJpAe7wxRnmi5ueJgPBQD+lqm7/Vhs/bWksxRiPOyxyBMBBZUqbG11UGqYm7tm+UygCr
         l5/YrgKdw5Y0mILQIbDhvJ2qouRcHoK+As9F/R8IdmIkFocZpKBd5llbT5Ufp5gF+Fbu
         E0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vN17QQ69gIBf8TKYtcFphBWXeRO1Dk7l8wmh8+tw57s=;
        b=APnfIiO+dHKNCLbulQpdy5KdiB5ETULxBDeHm3ZxALoQrg3bcZXesVo07LN52Xj9PO
         rIYKPFSfvq7w01AHZqpek+iS2gWSbnWLiHfAHpmc523bH/ejmdfXlc1pcr6TfQyI5ldv
         OZZ18mN3VMTok3JIfzL5ZFUwzQ8V4XYIFej+VslIkgd5qZ8l9xchFp937No91CLb3XWx
         DHbew3DdBvxWdEI97kvBCKeAeJ26OwEyCrMx+iWIXN3vWVHX/OpBl4Alfd9cdJBSONt/
         zUJIU+NWnf0ESoXuM4pkhxPk4HyPsWQ9PCT/7k+WWbPv0jhqfcGRlJXTv8Q+ys7r1mWk
         QEbA==
X-Gm-Message-State: APjAAAUnnGAiN3ssvfH+LahoeBRq2Bphq5zCHh03JNbUE9Z7MzrNytj5
	13zC918V38nL8tiSSMjVw+n7Mr+R
X-Google-Smtp-Source: APXvYqyWDpXZe2M/Kgjd60DJW5qJf1clk0L194BGElg2EKik5Lh9TlREmulHXTbWnNge5Z/xXtUr+w==
X-Received: by 2002:a05:600c:2c08:: with SMTP id q8mr4090137wmg.45.1580987954335;
        Thu, 06 Feb 2020 03:19:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.43.13.93] ([135.196.99.211])
        by smtp.gmail.com with ESMTPSA id 16sm3349261wmi.0.2020.02.06.03.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 03:19:13 -0800 (PST)
Subject: Re: [PATCH v6 12/22] target/arm: default SVE length to 64 bytes for
 linux-user
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20200205171031.22582-1-alex.bennee@linaro.org>
 <20200205171031.22582-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7dff4d7-f8b6-d8be-76c3-386896d1a7f7@linaro.org>
Date: Thu, 6 Feb 2020 11:19:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205171031.22582-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: aELlB4ps02w5

On 2/5/20 5:10 PM, Alex Bennée wrote:
> -        /* with maximum vector length */
> +        /* with reasonable vector length */
>          env->vfp.zcr_el[1] = cpu_isar_feature(aa64_sve, cpu) ?
> -                             cpu->sve_max_vq - 1 : 0;
> +            MIN(cpu->sve_max_vq - 1, 3) : 0;
>          env->vfp.zcr_el[2] = env->vfp.zcr_el[1];
>          env->vfp.zcr_el[3] = env->vfp.zcr_el[1];

Let's reorg this to

    if (cpu_isar_feature(aa64_sve, cpu)) {
        env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
        env->vfp.zcr_el[2] = cpu->sve_max_vq - 1;
        env->vfp.zcr_el[3] = cpu->sve_max_vq - 1;
    }

Using the MIN setting on el2 and el3 was wrong, as it meant that we could *not*
increase the setting later with PR_SVE_SET_VL, at least not without changes to
linux-user...


r~
