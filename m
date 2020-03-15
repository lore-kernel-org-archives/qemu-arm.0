Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2125453lfc;
        Sun, 15 Mar 2020 13:17:53 -0700 (PDT)
X-Received: by 2002:aa7:991c:: with SMTP id z28mr22688296pff.294.1584303473194;
        Sun, 15 Mar 2020 13:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584303473; cv=none;
        d=google.com; s=arc-20160816;
        b=hH7qt44V7BIwv4J4KIxfpNJ9bZ0ezCeZB0rmgmeHSxwpq0wXX7d71w7rLf/Clv2VjN
         PPq/uP4jLx0lJnYhY5lui98ZdkHmXRC0oAJ3BCuCtJadeTi/O36R5KvmrRc2WpD18oha
         wITTyAwvMvwluXOhZdamabSVep52PcDuCupMiOE+hPjfjXOVNA2gkeuuNmvvXSvgN46s
         JJlhE8gc41YGGj1sNu4vs6di9cZOPkP5pOELHU7uIL7GFIEllkoAW11sMGDEk44JLl8o
         op2S3mim58r+WJ2NSjKVD4JiC2Jm2WAojK+6wZ7yPlcxIOvzQqriw9gI5g8fL3kVcUIL
         pNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AhOq4VxYKsC1Jgb2Uc4npHOr2Sarvt2ZXKSUnRDtBtY=;
        b=T1DPjwt/S77/3oJ4GJyYHSlTE+0fRvLdC/WCA05Q97cb3tRlQdcIAsEUgp4T77B2kD
         Teeha/DLt1V8nxSMbS5D+fiorL4qx+Yvdnjv6P3oApRzNsgGYFNiRSS3jVeMaeWJZbvZ
         1WsMtxkr0ukjykIqVq5l4GPsSR1w9yL11Ss/6GR033GO35Gky/46HSTBsh3rHimbpVn7
         Pzy4WUi9XGCHyhe/wZJX4R4/2Rq7NF1RfIpekneKbogAGIFc4EmUN1LphNKOVCmvR3mV
         N/zRhfHinHu9t5+uDhtaJX34wMJq/kiRieNK/uOFARiVOBZCJIb8pW0bvphTHfDfi+Ez
         D0yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qsbw76KH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w5sor19096922ply.66.2020.03.15.13.17.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qsbw76KH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AhOq4VxYKsC1Jgb2Uc4npHOr2Sarvt2ZXKSUnRDtBtY=;
        b=Qsbw76KHjfoL6NG8zpM2gYqVJf7m5qJiaKIS2u8TTbT634TvTmTkGB0lhgLLbtc1F4
         1YftFaFHxss8PStF3Ovuq0s9RGsk3uifG3PhSTwDeI9onSZEQsXGfgk0U0pIWUP3wU5b
         9qDBDvRAN+Vs6g81T4CBKyLDnc5f91lnqB1N8WSNcA2jlEvgPLvu8dOE5IjSMZVo4Pf2
         9Csm6fx/qZ6pOcDV8lOhF7D2oGBNve6HNPz28GbOY0UzfScQAqijGRz5fQ6IWohQy+nE
         UgDcrIm5DSkbk5giYTDu2cHecWLyN7HW/bK9CAQD38YSmscVwetwrkaihbvbK+zWYlVu
         fhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AhOq4VxYKsC1Jgb2Uc4npHOr2Sarvt2ZXKSUnRDtBtY=;
        b=NldPRPB+nIr3tX8zxacnQ/2kAci0FbSFIp5GexUHKDfC9NuRmoumAYRkq29C+rjIAK
         1rldRAi7ivM1yhSHTBDKEML8kDFeC5otRYKQdaUhyAhnDCblisHyRHP6ZdKDHmE2vCMC
         ID7OTPkX45vwkuBt9frssC0AMWf537oaBsDEymbJ21vcAYT5NpVgCmRLtUK86FVXHIK3
         55mubk1NV3Uro2Br2qA1RcnabCr3MTGao4zmH5wbT+C6C7ciDpXZtzD3Mn2aTQN0Gqdu
         7LdJW1mnAY52MEpeqB+Hu6+Kt18lgs2WvPQycZGwTIn5qtgs3ms3c2+B5ZRfXeib1aAC
         8mCw==
X-Gm-Message-State: ANhLgQ1gcA0F1/UGhEh+ceXKD6ro9QF8E6n7j4UV9eARdfEVa/x7qEmV
	9Ol2PQqz//YlFik6DsRZ22SzjqUx
X-Google-Smtp-Source: ADFU+vsRBAdAFKUNCyqTXhNmdMR8ILJNAGjnDYK+VeeFZ60mSUdnTys3f42VhTgSoUm5VL4pIzgDIw==
X-Received: by 2002:a17:902:be03:: with SMTP id r3mr23402910pls.137.1584303472735;
        Sun, 15 Mar 2020 13:17:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id j21sm17288919pji.13.2020.03.15.13.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:17:52 -0700 (PDT)
Subject: Re: [PATCH 05/14] stubs/Makefile: Reduce the user-mode object list
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24e2d723-cd4d-aebb-65f8-e4fedaab8926@linaro.org>
Date: Sun, 15 Mar 2020 13:17:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ZDeB3AW8Khds

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> These stubs are not required when configured with --disable-system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  stubs/Makefile.objs | 52 ++++++++++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
