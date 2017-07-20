Received: by 10.25.44.15 with SMTP id s15csp2541916lfs;
        Thu, 20 Jul 2017 12:35:53 -0700 (PDT)
X-Received: by 10.55.98.137 with SMTP id w131mr6224113qkb.175.1500579353001;
        Thu, 20 Jul 2017 12:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500579352; cv=none;
        d=google.com; s=arc-20160816;
        b=0KGk6zwKDyCjTsCXF6zLP+L7Zua50z5jxjDL2w7c1uB2HzdauorM9OTkkkNFWQRo7R
         EsQODrz0WZBQiPe/pyJ4toy4Urv8asfhhv9qX+QDjOGeDiSLaqnqNZcRbAmmN/fChIzo
         GjdiB09Zp5ylaRSFjs+XlZwY99KCIzhrvgn2cq3Ce69ORVoj7qoCnt9xjjb2JlGNHDp6
         xvIzAqn2lwZUKYNhQopp8a2vNLzYbZFeJBrbxhdIJNUOZIlJ6jB6+x8dbxLr93xF9Vc8
         fG65yFv3PDShyJXOHl5HdUUl1LRIG9nnJehT6TlQVcdI0Ylhq2Do+7/7cLTALZJ+WeQQ
         slXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=O19i8rOXxFU2tkuR+hmJP0s/UtVxk1D051DY9vRr+jk=;
        b=E1YoHcMyN+KV3bG7ABYtBtRbF3IwX4ov81NucLGUcCFxmz3qtuImo2kXwqc7NuzSdT
         ek1H4aScPw1kRD7ftwYdntHRjaW6SXQ/cT8r4Aps+HrmhmRYhzLHFI3ooNNlzCRjDQUc
         T9quFhVlAQu2qcCYYGo30jHVqmCYyvaDk/eR30kelp/bREThGMOqa99TaG1pH/cJ9zUr
         kjlsb8VUku/9sNpzWZJPzzodwqEohbWCajibu05W6tBpEIgQ6DIeOOlb1sAKaQNu7n9D
         iTdMfFzPKhFSv7otdroRyH/luc2R/o7LI0R3LBN96gIIyFTtcFMGZoLMOAE2P95xn8Eo
         iPlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=a80GTPBJ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::231 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com. [2607:f8b0:400d:c09::231])
        by mx.google.com with ESMTPS id u65si2496817qkh.220.2017.07.20.12.35.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::231 as permitted sender) client-ip=2607:f8b0:400d:c09::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=a80GTPBJ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::231 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x231.google.com with SMTP id d136so15502312qkg.3;
        Thu, 20 Jul 2017 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O19i8rOXxFU2tkuR+hmJP0s/UtVxk1D051DY9vRr+jk=;
        b=a80GTPBJOInxa/rdBI9joRrznfaXZMTyIZohtZ/ou7pUE6qAobpjvGOIM5rX8Q7FfO
         KrhKkbWUkPQuRrsJrgGlUCUhEbr6zR6PW/YGMtTdxNbLAUgstie2f3qJlb2j6btUPYz/
         8kWvVElStMT7EVfv6h6qhK1zBO8VCp0QU/pSvGYtcCjbMsODTKJ7DjoBZHgh6pqu8vSS
         a3T8SJLlAJWvkr45CSPb++n3/I4HoxsKKPp3yEpOe4uzG5C3c9hceeVAjHVRKHZyAiXa
         urOhEI+Hf9o95/jF7IuvcMqWMGDgXO2dp76a9s9WERIF7GMlOuZ2CDpJ/gF641WBsFT6
         91ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O19i8rOXxFU2tkuR+hmJP0s/UtVxk1D051DY9vRr+jk=;
        b=FfUIyFXbfHiTVY7mdpOr56x6GDfPvD5XjrCeAgOrCr3evKNClGYif2xtH8M4Xy3XX1
         abd63uoo0g4u0c74zWsw/gK2XciLwqyApRMLLvTFtZZ13hpjFn4IGAZngECOTbgSoGyu
         ywlFWYWkYhr+YFkroZLbcMn7wCpbCb+arWyEnU21ASxGnu2UbScegbnAihuhGkrLtTtl
         +Z9cECKEnReY139i1iUfYDPSAdW+hXo+f5iRuMGahY/wYuyOISuSO+Qk2Cj2hphxJYGC
         Em3GOx3y1oY2+xHHTiFhDnoSTngL80u6JJqN8Vnp4QHYMQhf1Ksh21eawyimRlvZQc/q
         PHoQ==
X-Gm-Message-State: AIVw111+lUu97iL6jcPAXgtF5/YxWESZ8Ieed2rijvlJuQl/y6ArI/SZ
	xlodXWwGN3KZU0hC7DY=
X-Received: by 10.55.201.201 with SMTP id m70mr6071665qkl.20.1500579352498;
        Thu, 20 Jul 2017 12:35:52 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
        by smtp.googlemail.com with ESMTPSA id i18sm2538228qkh.18.2017.07.20.12.35.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:35:51 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH for 2.11 12/23] target/arm/translate-a64.c: add FP16
 FAGCT to AdvSIMD 3 Same
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-13-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net>
Date: Thu, 20 Jul 2017 09:35:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 5Ndyo1MBl+N3

On 07/20/2017 05:04 AM, Alex Bennée wrote:
> +static softfloat_flags softfloat_mapping_table[] = {
> +    { float_flag_inexact  , softfloat_flag_inexact },
> +    { float_flag_underflow, softfloat_flag_underflow },
> +    { float_flag_overflow , softfloat_flag_overflow },
> +    { float_flag_invalid  , softfloat_flag_invalid },
> +};
> +/* FIXME: 2a has no infinite flag */
> +
> +static uint8_t sync_softfloat_flags_from_2a(float_status *flags2a)
> +{
> +    uint8_t flags = flags2a->float_exception_flags;
> +    int i;
> +    if (flags) {
> +        for (i = 0; i < ARRAY_SIZE(softfloat_mapping_table); i++) {
> +            struct softfloat_flags *map = &softfloat_mapping_table[i];
> +            if (flags & map->float2a_flag) {
> +                softfloat_raiseFlags(map->float3c_flag);
> +            }
> +        }
> +    } else {
> +        softfloat_exceptionFlags = 0;
> +    }
> +
> +    return softfloat_exceptionFlags;
> +}
> +

For conversions like this IMO it's better to make the compiler do the work. 
C.f. target/alpha/fpu_helper.c and CONVERT_BIT.

BTW, I think these TLS variables that softfloat3a are using are going to be a 
real problem.  It's one thing to do it temporarily like you are here, 
coordinating between 2a and 3c, but later, when the front end is fully 
converted?  That's just nonsense.

Is it going to be worthwhile to significantly hack up the incoming sources?

If so, then we might do something like this:  Given a 3c function foo,

   T foo_st(T, T, float3a_status *) { ... }
   T foo(T x, T y) { return foo_st(x, y, &tls_status); }

And of course pack all of the relevant state into a struct then

   #define softfloat_exceptionFlags tls_status.exceptionflags

etc, instead of having individual tls variables.  This feels like something 
that we could push back upstream, assuming that upstream is active.


r~
