Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp464781wme;
        Thu, 17 May 2018 14:34:08 -0700 (PDT)
X-Received: by 2002:a63:740c:: with SMTP id p12-v6mr5231268pgc.259.1526592848855;
        Thu, 17 May 2018 14:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526592848; cv=none;
        d=google.com; s=arc-20160816;
        b=Pjd33jy9S+Kj7iKvsP798QdbGCnIvh7cDkAOj45k3JGxP/p6+CT3KoIniBsIGtOpq+
         Kcw8Oy84qSoc8QI9HF+lw+N3mhbETtCHXPL7QXPke+5jnLpx4DdvAgqcYv7e19BR3WNa
         zyJVvSkQLnkWCeA8lXH4MJB2udQzkRi8FV6TvPPX6KZhsOlDcEzodWyefPbY8c+Kg5bM
         yzhRZM0L7pXTEMsw4cLmgtQg8JwYCuP5y0URWunaVsZE8GINxuyj4omcKB7v32dtKEfS
         isy5JlF5SmVZ9ZUW6tDWcLasqqu4PIKsGY/QIcd5/lFYvYKH2aoFXl3G9X2mrQim3Uy5
         LbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=LV4PAsVt3cJdy+g/hE/OmitTpUZygfzs36U8HhRi7gY=;
        b=aIoGxK0p2gmYpQXBPXgeBanMOIi9VkAtCfWiMwZRCqb993KKVl9nKxgknZA+KX4XiB
         XNMH8GJVMhYdtyweIS+4R/K1WQYBeEywKtBOENGECFR/L8s2+jOt2kGpbNMXd31C2u9B
         7NGh9yJAs1960VJN3IoGKeskhgG6aGwtuiZe68S6DjhTcMQW2y9kdX3MMtJ5tslODTq5
         4eLfjb85xHhAoAddn0FDWsTBEVXzjXwYuOVBVKRftdlEzAHDfYg6vIa3SqyE1R2feFKb
         6TRgh7ZDziscmXWsgIROFiSt7qumLmLZBfHrKD5BxauNYMhtrmfotMsgQ+IM6hoMULyL
         fVWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijfx4FI8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d6-v6sor3495872plo.78.2018.05.17.14.34.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 14:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijfx4FI8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LV4PAsVt3cJdy+g/hE/OmitTpUZygfzs36U8HhRi7gY=;
        b=ijfx4FI81Nm273AlVwdcw5cJLAEIHVHSaG2q7FCH4duLNRsEsI2KSTUMJ8VwFI64hk
         ABOJFkwlgzc0E+V9nQ4O4Y4M9x7wheYuW87CLMXieno3OreYCTFRPsb/7B6mKQMN0CUB
         +AeR/3IPvsjqr+WOIkQ9YYWlDHYptsw1TpBU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LV4PAsVt3cJdy+g/hE/OmitTpUZygfzs36U8HhRi7gY=;
        b=IQlgnBJ4O81YwDYdBDN2HPLa+cg7zmUz+bvnoyHUjk+CPd19dsDrSnExc9itXYUVq0
         8V+mjm9PaT07Nk/1QtcMRjp/JracHTesGgZLq92FAt/SC3U4u4dlYrcUFEOR09p1vMNp
         hCSPiTnhfNTa+9Qmunn2vloa53PVvcIn++4epxv4yZv4hy89+OgtYmrhMzAIRmjgIxgc
         3E/ttmovYTcLQuQLciQG69NuabJHLdc1mjWdgI62gocTE/rnzPmIupx7xZCegtOe72PV
         iSj8mm82oPzDT2MN8qcYfqFZu558ybrnY2zFfMYylI4V1pbz/ln7ijYjusoATzEX4rqE
         9N1g==
X-Gm-Message-State: ALKqPweZ8GIoHcDqrBz8jEcDVhYRC46fR6RCPkR6JWTECzEQImci37/y
	87lYjRUUi8rB6nz8Y239UIoN6DxN
X-Google-Smtp-Source: AB8JxZp7L/GUCyBB0QXd2zxC182eosntulXKIN2bjUAqnNYwzVy/q/eW7e2R75GxwaiXyURhxE1myQ==
X-Received: by 2002:a17:902:294a:: with SMTP id g68-v6mr6817184plb.110.1526592848372;
        Thu, 17 May 2018 14:34:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id f4-v6sm8861365pgo.77.2018.05.17.14.34.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 14:34:07 -0700 (PDT)
Subject: Re: [PATCH v4 29/49] tests/tcg/arm: disable -p 32768 mmap test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, famz@redhat.com, berrange@redhat.com, f4bug@amsat.org,
 balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-30-alex.bennee@linaro.org>
 <9b8a5a71-2071-ef5c-07b2-3797883ed22e@linaro.org> <87muwydlgc.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dd18fb0e-437e-d551-171e-a748ff3ede22@linaro.org>
Date: Thu, 17 May 2018 14:34:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87muwydlgc.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: W1jDqGXMOdk7

On 05/17/2018 02:24 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 05/17/2018 10:46 AM, Alex Bennée wrote:
>>> Broken since I updated to 18.04
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  tests/tcg/arm/Makefile.target | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>
>> Meh.  Most of these fail for hosts with 64k pages.
>> So, sure, disable this one, but I don't think that
>> the others are useful either.
> 
> I'm not entirely sure what the point of -p is meant to be. Is it just a
> performance hack for linux-user to have bigger pages? We are not using
> softmmu but I guess it affects the PageDesc structures?

I think it was just meant for testing, but I really have no idea.

If we actually had better support for mismatched host/guest page sizes, then
one could view -p as a way to choose between legitimate guest page sizes.  E.g.
8k, 16k, 64k are all legitimate for aarch64.


r~
