Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp46805lff;
        Wed, 11 Dec 2019 18:26:27 -0800 (PST)
X-Received: by 2002:a62:7681:: with SMTP id r123mr7211437pfc.169.1576117587861;
        Wed, 11 Dec 2019 18:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576117587; cv=none;
        d=google.com; s=arc-20160816;
        b=WqgOO0/lWeGH2w7ph5GsvfkAWyoHPEq3hd7Ktyz4uh3kxC6q6syQHCs8MCbaaCWcw5
         6NwEbWJYAp9VtVCGO/n0oM44AUDh8lZ12grgBL3XF3llfnwudlxhhQqk5XQ6/DwyXoF0
         8U4GJKWaWWrm/q+JXwv5iqXINLWN488nXsAtY3K2PcAEf2YHwwzRNc0owNTRqJCtf7We
         7s/GAeDnfgeIfpaOVHkwrvDqxNbEavE27KORRaXH6B9yxczOOclOXSULpdPnwIdcz+1F
         199uY2vRpltuJpFByGGai2oWaDvjnf6+pGyaoqmp8S1Ciq8667z0SwQ8zHI0bpdYMVnX
         /0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=l01TCjoxhhiRwrhGymsnwdBCUwsXAo0f17ZzMIBSSa4=;
        b=uOR1KcGy0EVJuEOi1j9zBkKsDA8AUV8yMIEJ61aBWavm1XivA0DNLsIupPlzQTcwXs
         zX3D3Km0apw8i+7Rb1CD/6dS4e+LqSBS7aNHDiEAY9O9x9FP6Cn16dG9EcUnE1bAAP0i
         PdusKQQMtaToowl/2fagizCjJhnBFQJ9Z1RYfHlTaygxsQiMzJAbPoEqx1DqyWFslVEW
         iRqbR+yVa6GrS1aDx6qAqZQDmigt8RT61Ra+eJNDOcdHkah3d8Nx4mQz5gSXzFuG0Hr9
         Jpgjyx9s3E10wnKq65nOxkiDzs0mdLC4ByJImJG8AViwIdj2lckAOQhqpJ3e/aX7mN2x
         ZNuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhXX1opq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j1sor4991642pff.59.2019.12.11.18.26.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 18:26:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhXX1opq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l01TCjoxhhiRwrhGymsnwdBCUwsXAo0f17ZzMIBSSa4=;
        b=QhXX1opqNF7tkFLSur9SQgoXLDrEYTI/iPypsUYk0zPBfEzb7vaslnO3pTSZ21ynoA
         uc6HzlaS7j3tQfJX8QR2epgH0wodu6t6VRVqEBGWTaFZOrL5Fn5ySKgpt2Z75jgPov1d
         aKX8ouffQFQqp3JKqLFTqTjZTGyU2UB3lGzzSNbxbvDg1kXMyarpqJ9r8UV1w/bWJRH7
         KDMIZ4fEOMHCweVf9chJRrw60j/6bDzBrMLQ7eG3OOYbFeU/AbDXMAvhxajbtVqt9KOg
         zaYGGZGUN0R+MpSYkb/GSUIhi6gRno8pD6U/yAwajnSo+fVfAZU4vA9uTK0R2bWJowoo
         MUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l01TCjoxhhiRwrhGymsnwdBCUwsXAo0f17ZzMIBSSa4=;
        b=Jq3UKBZXQax7tGFsecf9GU2QW2Y2lmNnS8K2pOFuFXzMoTD/VPMlAiErRLLhERM/kM
         cYt9PeBopPCtVRV/OScCtJUdMx8vZt9HRfGw5wVsb9WjilPT79fn8GhpCeBOQmTXTVcB
         KgPPhgSZI67InNb5iab0IJ9avBg1vyMcGsnrbnL8ss2ifouuLGVN2edvLKFxEj2kDun1
         RQ4xIkvo3HNTs3p89eXpV9n8HlAYemTiqOsREjBUd0LGrTkYw+bfpVXS9U+de2jOvbJk
         eBrZPsY75A1fJQcFk+WnglS8x5qdMLLvysRXNkpqrQ891ltYVzTGQUwKd7Zyqd2v4qNF
         HDnw==
X-Gm-Message-State: APjAAAX3zP0I0d17YTc86y0YhF4YKLidxCnYvRXtaSLDdO1ycb9RT2GT
	9Kf5PR8Onss6a99VwDPhUHd7Fn+u
X-Google-Smtp-Source: APXvYqzOf8mu/kWOthQCugcummgnnhrMmMXn2oRAw4uQ6g3eTLFPs+ZT6dz+LmcGdTsqK8erHl3iKg==
X-Received: by 2002:a62:7b46:: with SMTP id w67mr7325952pfc.113.1576117587348;
        Wed, 11 Dec 2019 18:26:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id u123sm4586602pfb.109.2019.12.11.18.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 18:26:26 -0800 (PST)
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org>
Date: Wed, 11 Dec 2019 18:26:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: tZMa+oHSZrdu

On 12/11/19 9:05 AM, Alex Bennée wrote:
> +static struct TypeSize vec_lanes[] = {

const.

> +    case 51:
> +        return gdb_get_reg64(buf, (cpu->env.vfp.zcr_el[1] & 0xf) + 1);

You need to use sve_zcr_len_for_el to get the effective vq.
Also, I thought vg == 2 * vq.
 > +    case 51:
> +    {
> +        uint64_t val = *(uint64_t *) buf;
> +        cpu->env.vfp.zcr_el[1] = (val - 1) & 0xf;

You cannot hard-code EL1 without ifdef CONFIG_USER_ONLY.  If the effective vq
decreases, you must call aarch64_sve_narrow_vq.  You must call arm_rebuild_hflags.


r~
