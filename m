Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7522290lff;
        Wed, 15 Jan 2020 14:16:24 -0800 (PST)
X-Received: by 2002:a17:90a:222c:: with SMTP id c41mr2540672pje.35.1579126583939;
        Wed, 15 Jan 2020 14:16:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579126583; cv=none;
        d=google.com; s=arc-20160816;
        b=EpFX6rTFTuTUnhx8zK6HeGESmD3KvE7sbtHxE4WzCtuozfQgZFQ8HBL7v0fUgl10KR
         +mnSgSju4w8VPjeSkm5wayZj8hogdYfKXNKP0Djtk43WZjiuopiaTK8aOPodFIkYLEXV
         pu4rzioDdLDTUx1OVKj1Y+R8JTr6gpqu1NalvNX/d2uwGjd0DHN9Vwi70Tl0hlcY8/ga
         NQyRT9przX0xl4A64Z2Cqi06rQ9qSWZOJui9Ax/j2dufg86UFb5QpEmqKpvWi1RPBijj
         2GZeeN2dOL7pkpOvaO3iZUtHm8fUZrUPFO0KF9GCwUHGTJM6HBQ2Jq9zAszAEE+eFywj
         Grqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=k5qTG11cijFjDdtVQH/y0HmKwWbcCvaBtfDANdoeBBw=;
        b=DssnBaKMUdPYbOLHH3H1p4bPZMOpdYBH9m350dm9ewB5QNaI4nGv8aqbSw00NIRdfX
         xhFi6RjscPV4Svy/py8CM/zKfNtQERQkL6xSO+kWuHc5umSeUltUwd4IgIwC+ffGMG6t
         44t8fuNHLgGFllovRetwWLFo4NuFSC0sCrXHbz/W+ARLqiT20oOQXZ+MH0LxCt+PSLlC
         I8PfCvXT93JuJ0VFnKJ0KMS+MO5197hyk5iNgpvE82dn1G5Xow4o6swODP4HRHZTrSYF
         xxgVZHjDFle4ueeHbeCIAr4EYDkFMXQyx507mQwvyMkfWrIdSIFn6abMweVm7QO9lVVq
         bVrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jla1ex8S;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c15sor22474720pfi.13.2020.01.15.14.16.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:16:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jla1ex8S;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k5qTG11cijFjDdtVQH/y0HmKwWbcCvaBtfDANdoeBBw=;
        b=jla1ex8SdGGmoRMprgceXvRpAwRSylhng5WaLjcX0B6Lj6R0SkIkazbHXFJjxt7Ru2
         9agZQtRwDQyIEqSEEKJAD9Y1AmqM8UebuCum25XvxNMcHV48we+lVxDHYPahcHXHviNd
         xw/JPyh0qVKJEY9Gff+66cjvTk9frCCkN787v2gbDEVQ5ih6oHNOGpQBhodPkVUIQoHL
         yiZgauH0kev9nGPLuwvekWWVSVGu7qXOUN1Acdg8HqQNaQlnPl9ugULD7fUXVr/DHx6o
         PGGcylp6I/VSfTjR0n9o6i7JZ42XbrWH6A5RPRQDRSRfMrpdRd6h5z9/3LOvRxgg5vFR
         wORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k5qTG11cijFjDdtVQH/y0HmKwWbcCvaBtfDANdoeBBw=;
        b=AkUlBXjeH629l9fLLd81+Q/qdPJdYLYLIk+bDve4OYyWyFFV9IlE5X6C3JGAtEC7C6
         OFg1eqA8Efn5Pq70jgvZ2P2zZXvUUojDAjpTiUEoOM3Q5sVnFSPuvYXTeqyNJQiJf9p6
         6wJRljyZNr0SxHxwYjDbbAX5VtQo79AZ54I8juhHXo9VylIypc7musIlfsMxkEo4ltc0
         +sB7mkuEa6xl8/nYgBsmMAe6ETsISmhI2aqyGMUrzU9OvVszLBUDG2BvNQaq87v5eUBK
         gkBDqMwsgT21MDaf8GEa2p7yEBoxh/YQ72F+L2q5xxCGetYFrAqC53Lx+e7mZMVNbSl/
         Tccg==
X-Gm-Message-State: APjAAAV0/uHNwk2Ct3/+lVD3YnVn+m3uU1/La+mw2qOBqlLBrYPG3DX4
	jTYjio/VIE58VD1Z9Ms0q7O/LNRA
X-Google-Smtp-Source: APXvYqw5hijErwfEPZ+wYjWAVMpXJq6f2iW9FfVWg6uvgv6nSvim2WhuVQeZwThKRBpqQO7FlFvWcA==
X-Received: by 2002:a62:ee11:: with SMTP id e17mr34252560pfi.48.1579126583547;
        Wed, 15 Jan 2020 14:16:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id j9sm22700317pfn.152.2020.01.15.14.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:16:22 -0800 (PST)
Subject: Re: [PATCH v5 12/22] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8b01b9a0-3fcf-2d17-5f20-182cac6329a2@linaro.org>
Date: Wed, 15 Jan 2020 12:16:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: gDIYe0JsjONS

On 1/14/20 5:09 AM, Alex Bennée wrote:
> We also expose a the helpers to read/write the the registers.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - instead of zNpM expose zN at sve_max_vq width
>   - wrap union in union q(us), d(usf), s(usf), h(usf), b(us)
> v3
>   - add a vg pseudo register for current width
>   - spacing fixes
>   - use switch/case for whole group
>   - drop fpsr_pos marker
>   - remove unused variables
> v4
>   - const-ify vec_lanes
>   - drop vg

Sigh.  This still feels like we're coding to a gdb bug.

I assert that vg (or equivalent information) is required for the job to be done
correctly.  It's a per-core and therefore, for user-space, per-thread quantity.
 We cannot possibly be "changing targets" for the "thread N" command.

I'll give you an
Acked-by: Richard Henderson <richard.henderson@linaro.org>

because I recognize that this is how gdb works today, but I don't like it.


r~
