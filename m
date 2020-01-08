Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp137745lff;
        Tue, 7 Jan 2020 17:13:19 -0800 (PST)
X-Received: by 2002:aa7:95a3:: with SMTP id a3mr2356532pfk.193.1578445999730;
        Tue, 07 Jan 2020 17:13:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578445999; cv=none;
        d=google.com; s=arc-20160816;
        b=NzhSUX7WrNDK98A51fncEkVvmIt/mD/31vYO7eoIN6gmEPv1hhqJt8ciObJrxZTpS5
         xfXndHH9AtWvFFUrHjNkfuZIzMOp7NoPq/ZnGQMZ9u5f3Ko2OinMect6SDNSoC0wReSs
         cZ0vRaQj4PaYDs3oUr3HtvEyMOIuf9cTobk4tCTthrwcx/hYFRpJVDmW4+Q9enDhZ2Wr
         sbU3U32zkYtwN5L392ahibjmdfUaVpgeFfA2EUsk1NgkO5kWXHJGKHzT+q4gVyP7o5kS
         DUeCWFSQgOqmf4Xkaegl0ly9DlH7kONDdHIh5Ap/gstlYUQXmvX0bayBiDwNFZa4HVSX
         TW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=81BrgS9WWJ+d5e8LvhW0vX2zDT1GemMSM+3dELgRUIg=;
        b=F1C1xrtkCZ+ttkZ6VE6t/KHyPpMWMcGjTClGylzvXDh5tqNsQrzI2qxR1mvGaRr8CB
         gc0VeqtiLwNiR5uy3YuEMWB9WgU/k4nr8uVxN1Z/9fL6QVPdTbXR5kGrzbdaOHXkxLdE
         9Wgd1WaQoLaR7X0HBFbnZJhdyEpuE7H+ebUpgWLKpu1EGQQrv+pvzdbEC9uokuj2r9kK
         CGHluLgqqdgO+2WnsXPLnMN5KgBfbisKGqYy0Ae5t4WiH40e0SUCKP8arBsr07t3hys7
         Kc5u5I+u/sXOHmbzsaXnYLoCEA/yWGK0pLcejDfENAbj2KANwDlyMYxanWd0JbL26ejK
         EY2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4ZBAfeh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c16sor1535203pls.22.2020.01.07.17.13.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Jan 2020 17:13:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4ZBAfeh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=81BrgS9WWJ+d5e8LvhW0vX2zDT1GemMSM+3dELgRUIg=;
        b=h4ZBAfehiBRmQX5CcukXP9zu992je1WRDKRFBQejSokrYp3dBoELu95iqeBjsJMtiJ
         nD1wGNVlgy7DAvIvhd964y4bcHVhcVtK7RJeannciHsJrd3c7V3lmvpKn/etcjxDF94q
         l741V1xCjJzXAizWFvrtTSyp4XsVhDav+XoIiz/6sPS5fOy/lneqhKIaCgjcJe/Jx5pa
         Wvdy5PN62w6v1dDuxfpkH38owtg1bnpTq6mywDGDWia8iODcDTPl+tBjgii4RqkYgu99
         q3G8YHA6aIERwUyAe6Xun8ykDgEtfhKyYxugp8GiiGW1y+JsHZCuMygvwvgH0erfcgvf
         Ek/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=81BrgS9WWJ+d5e8LvhW0vX2zDT1GemMSM+3dELgRUIg=;
        b=gQVryJgtqZXZK6L5zrj2h5R2aPgCe3u2CDyiEscrM/nI9lISlb8aI2TmHqI1yjAW89
         45cjnM8wAHPyv15JeI54f8vROeT7913EqOerlTYuuxDbL1M5nLweX6/n5ge4/lYBZ9Qj
         PZsMOPgWoRn1vAlmnHYq+AYcTaSZ4tDfDdETPgQWwzmNUO6DMfNp/DqnT7IrIROsfYRp
         OrsRF99bJspTTEf9ePMQBhtHL3dZzcJl1B1CEJko4HFiM9c7/zI/lYYBEjlyEMvS70+i
         Z15hAikMw5gVNReMPosRlbvg96VzcKjyD3IoZcPw2vW9K/RWpMa73qgvpMOpSflFuJ2d
         ZMzw==
X-Gm-Message-State: APjAAAVp0ofqxT5zADTBLpeWOsSJrhz0YEPqKkLRL88YmC55GSzwckqx
	HShdyV9sIsUX+mWS7eebICbKyaNM
X-Google-Smtp-Source: APXvYqx6+ByI5cecW30Yox/qwOPJJq9PmUpYo1kLdEbAApS1XY0VO/WsBZ3K4uywRQBMLFs59k+r7Q==
X-Received: by 2002:a17:902:9348:: with SMTP id g8mr2747322plp.323.1578445999090;
        Tue, 07 Jan 2020 17:13:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id l2sm815655pff.59.2020.01.07.17.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 17:13:18 -0800 (PST)
Subject: Re: [PATCH v2 5/5] tests/tcg: add user version of dumb-as-bricks
 semiconsole test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 keithp@keithp.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
 <20191220132246.6759-6-alex.bennee@linaro.org>
 <09322c6e-74d9-08d0-1138-f2d5581a7244@linaro.org> <87d0bv4a0o.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <608b5fde-098d-3200-6555-314a6d794992@linaro.org>
Date: Wed, 8 Jan 2020 11:13:13 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87d0bv4a0o.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: j+FNHrj/xfGj

On 1/8/20 12:27 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 12/21/19 12:22 AM, Alex Bennée wrote:
>>> +#if defined(__arm__)
>>> +    register uintptr_t t asm("r0") = type;
>>> +    register uintptr_t a0 asm("r1") = arg0;
>>> +    asm("svc 0xab"
>>> +        : "=r" (t)
>>> +        : "r" (t), "r" (a0));
>>
>> This is the #ifdef __thumb__ svc code.  Are you enforcing that with
>> command-line arguments?
> 
> No it is dealing with aarch64 vs 32 bit and the __arm__ is a compiler
> symbol. 

I know that.  But you're obviously assuming that the arm compiler is defaulting
to thumb mode, not arm mode, otherwise this doesn't work.

You need to test

#ifdef __arm__
# ifdef __thumb__
#  define SVC  "svc 0xab"
# else
#  define SVC  "svc 0x123456"
# endif
    register ...
    asm(SVC : ...);
#else
    // aarch64
#endif

And run the compiler with -mthumb and -marm to test both.


r~
