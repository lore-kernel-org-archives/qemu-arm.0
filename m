Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp71177lfk;
        Thu, 27 Jan 2022 19:27:24 -0800 (PST)
X-Received: by 2002:a17:902:ec86:: with SMTP id x6mr6588872plg.96.1643340444120;
        Thu, 27 Jan 2022 19:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643340444; cv=none;
        d=google.com; s=arc-20160816;
        b=hUtOf+8cM1Nre54Yze5d3ob/BAl6VjuuvMZ2r8x+dqqGUrR+PanMYgLAehBI4HlpLS
         9G5STqMXxHhFv5K4i/IT6y8gpE31+87cUBSTZ1+iq+0fa+DcRbiXq+RfYK3N2ndzPW1J
         eV3ZUt3wPmXLaDwSHbyymaU7UUzm555gjIW6GpdQ2rsr7kYvl7xPQUV+gbLk8QrfOLHl
         fyq8bd5WTwlwZC9nWSvzViFcx8roowBbOxYL22StwbZjKrRdMGQg2ZOMslvtJx01l6gA
         zn1aOx2sjSvK57dBQGH3DxdPGQg4MFlaecZPB3sqKgkWJpWxKfSVRqToaXUsiT689EcW
         0UfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C/C17HGr4K28H6mayuh6WUg3uZ69lu3PJY9/bRzGYug=;
        b=zc1RpItU7XG78igBqXFVQNnYplHPop2w0tn2JOUPzb8FayFqMlQLwMPeab/jkpGlCx
         FyZZNgw4olx6YvDTH6Q9yJ9vovU2BuvyV7w2XqGK4wRLJv2+Lmx0BbFoSM4DfbopHQKW
         YKyAUwiP3tQSID2e57haaPgsLDus+9WIIQy3efTG0Gi7n+PlH5VzYImR+5IgebKQPl7P
         Vm9V/FBqWnrrRh8wZ/46sz1keafMs9EIuDWIbORHeOX044zVkMq0td5lxNhkFoAuxiFO
         4Xd8KuTJ5Ek3eCaV2vhfZNpwfgKSijy5Wlv535DgUXq/Q7vH3bVuiribHRpp3Q/fzFgN
         kxUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rOjHXKHo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f2sor136422plo.66.2022.01.27.19.27.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rOjHXKHo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C/C17HGr4K28H6mayuh6WUg3uZ69lu3PJY9/bRzGYug=;
        b=rOjHXKHoeqNRIcgeBt1AIaBooHm+FyWftp3aL3g1tXQXwQPW2VF3eKrbt/yHKI74wP
         hNdutqCn3nOAR8tM1MxjVsmlSWBQvzzg56N8nN8VFZh0KSnfkjzVHlf7VC/NyFF4VumO
         UYLyRr1NQ4ybH4RT1EQ7ph6fhH2qXwrnbXx9crFGgiCcRDD5I9xGq7zYnq1fUuW8ZRF+
         4IaSvv8Pz2VIve9oNQYOz810xPjAJyiVMbEEoBYsYqfnuBHDUTNEw7skkGrfVfmT4Yop
         GJc7KDIPijyAaqMuLkQG2zLMx+g1mhz4pFUd0EPr8KNRBcsXFo+R5txolWYfteSRtd/n
         B6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C/C17HGr4K28H6mayuh6WUg3uZ69lu3PJY9/bRzGYug=;
        b=RR8CdNprudEFM/W6NUk73Rq/1ooTmJgGVXRYVlj8LgVxOLPW1KZi/IypqyFoAWD7lz
         wOQIr5G9DtxJtKqFQwsQG+2ywj+gqeqU4gsWdsHeKZ0va1oC8A01Gab2X7IPPk3gdCuT
         79tDoXPkWG4WqygfF26xSgu8fyQiiPaFjaK5txFG55owH5wV4B/E9qkii4O7zkBZj63N
         HIaNnw17WKoakIk7fOgsD01WRDw6KrdVsMmtSqsAGv7UCIMcUgIbrilfofQRcyFRGaiG
         icMM7Ijuxwbe1mXLN6fiIskpoXgSRd0EtGXExQA8IxPjWBWQdGTXa/tLUhGf4//tH0bu
         R8EQ==
X-Gm-Message-State: AOAM530tI4gdVj5oFe3DA5d8qNhdVaOHcMGBkPLvYoQZnPbs2BmKsal2
	3jPnaJnxJthahA/IsJ1joc6VVDxb
X-Google-Smtp-Source: ABdhPJxa9iWpYZfQEljeVwrU5tvTxvXgH9e9gO0uVLuPaQ9SFpmk5U0W26K+37N45b9K33XAk/vHSA==
X-Received: by 2002:a17:902:8648:: with SMTP id y8mr6233861plt.115.1643340443383;
        Thu, 27 Jan 2022 19:27:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id l10sm6801805pff.44.2022.01.27.19.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:27:23 -0800 (PST)
Message-ID: <32f1d628-f550-63ad-c6ab-3d8788253e52@linaro.org>
Date: Fri, 28 Jan 2022 14:27:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/14] hw/intc/arm_gicv3_its: Provide read accessor for
 translation_ops
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: fYvCfTKPDT5l

On 1/23/22 05:24, Peter Maydell wrote:
> The MemoryRegionOps gicv3_its_translation_ops currently provides only
> a .write_with_attrs function, because the only register in this
> region is the write-only GITS_TRANSLATER.  However, if you don't
> provide a read function and the guest tries reading from this memory
> region, QEMU will crash because
> memory_region_read_with_attrs_accessor() calls a NULL pointer.
> 
> Add a read function which always returns 0, to cover both bogus
> attempts to read GITS_TRANSLATER and also reads from the rest of the
> region, which is documented to be reserved, RES0.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
