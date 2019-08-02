Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1040090wrv;
        Fri, 2 Aug 2019 09:35:52 -0700 (PDT)
X-Received: by 2002:a63:2364:: with SMTP id u36mr120978182pgm.449.1564763752325;
        Fri, 02 Aug 2019 09:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564763752; cv=none;
        d=google.com; s=arc-20160816;
        b=FYCtLEd3cqkwJEBWc9hCiwBYZnVzqnF1t0yG2x5AS7Wl2y2Q+eO6f9DVDKKa0VlzSn
         MbLMcxYSiYJHDqnY7cLbQzdvJMx9efjioXqDpSQkikxwrVhvG9A+jPQ+6FugZSsaIGug
         eddPDB3+38yS9MXvUMfWjOIPUkQ179Rf4ltUMxYlErOWKVHOYGHi9vdhU2/xXx47nDOT
         lwyCP6AZ4N7wadScrCnMoM3N+THQpsonxhHNMdLsETzIc7j/zI2UYBEqz/ojz0T5O/5r
         YS5UfNfP70rYOVrt9AteUkDEVkiiEHFrbzFtwEkglou9Hrh5JJr6mpmR2oTztUYRSZQW
         yhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=ofHR5x+bnfIPl+rlR7IwCOhCOElxnwlX0H9IAE/w9mc=;
        b=K3GoxPsZipivHTXsCW8cIkThXdCmnRopup060eAj35Sh34rrpHdKgcVRzpdtZSr3ua
         cZUz5XbIkv2u8N6cmBuS+bh18N22Srb/hpXLQuoyQ4cBpKiUs71b4yE1JjF2Urb25EeX
         HC4ES2dwty82ckXvpHo9Y4OrlVLfVML9CdcCmppg0VqslMmirvIKnOtRWrrdwYFp+r8S
         GPqHC5/4we8Zmt7Vv67PovwukgP0ynq06bbtj5MCTJAR5getcWtb9olIQq6KUYGFSPJS
         IjmHyRHSwj35mCzMZyCvJF9CignRbwY/KZfhC/fTOAX+qDzYve+s4JczJlwIfZfO3LKo
         o1xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2DtwsCJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g18sor57293805pfo.60.2019.08.02.09.35.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2019 09:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2DtwsCJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ofHR5x+bnfIPl+rlR7IwCOhCOElxnwlX0H9IAE/w9mc=;
        b=a2DtwsCJJwkt7EWoz+CCYzpQ9lutYz3w1dyDa04Td3mu/m9GHzswyj/a9jLuXlwJ99
         XTLkx/BOpiRSO2nr7wp5iTI4PHkRHZQFM4+cYWkvw1NXdprMhti7nNKI/KdBEj15Vu5b
         LoIOwnbc1lySiOjIXHObrtZL7drd5wX1WSGhP7h8O4MHziWdnyv5WABIyoz3t1Qorufj
         azFrK1dp34JMhvoGOpzrejcv8aUomGOIEPIza1CY+I6woRm80ES7EUd3ynulZCyYQYmq
         fvDiyf4l3grVvi0HBif2hN/ZW8wtmzl57XUH51CA5Ef+KcMxjgxm+9YbK+TVUghIQ+Mq
         a+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ofHR5x+bnfIPl+rlR7IwCOhCOElxnwlX0H9IAE/w9mc=;
        b=Wb90B+KnyVZCbYb9xKlqGciIZjaaCcyi74FMQiU0GHMPWid2pfJOcdm639kZiVrazF
         hGYXqR/Uk7XYIPaJfpB8u5NCW06eqYEFbS3yanIRYfxXcupE7xXLi77cCUljX0B3SlUN
         mSvcu8USbXZFrwbGIBGhiICj1YpLnhK21YxzKLSFNavukrG0K3EvS0qqI+Jj3RWhJ3jx
         VAXOwITZfeAD9NvNppXKb0n106EGi9Pi7TLrO+jFpzo2o4m65eDkxsOY17TD3SRbCEha
         l19//oYjdG7JGVink6bNBPE1Ar0Q+iLhEafWUmiYhizan/JDvOHhi+IHdNd89dKIZLQx
         XJgQ==
X-Gm-Message-State: APjAAAUViYyQueb7bDGYGcFslNSerhszuVcAPNXa6HcgfIeT93HtTwJu
	PXZqQe+amPUtA3KBHwwA7sbvJ9RD
X-Google-Smtp-Source: APXvYqzuP9aZLLdkCqSTmUzvqjZUlPQNljTGZqcRITtOxAkTUXAFEZvyteTuVwhPNNSd9k0v1rEM0w==
X-Received: by 2002:a62:1c93:: with SMTP id c141mr62500792pfc.9.1564763751885;
        Fri, 02 Aug 2019 09:35:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id t7sm7023610pjq.15.2019.08.02.09.35.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 09:35:51 -0700 (PDT)
Subject: Re: [PATCH v3 07/15] target/arm: Allow SVE to be disabled via a CPU
 property
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-8-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <045c61e9-ab5d-a068-dd54-441a6f864ea7@linaro.org>
Date: Fri, 2 Aug 2019 09:35:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802122540.26385-8-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 2M23zjnydhiN

On 8/2/19 5:25 AM, Andrew Jones wrote:
> Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> a CPU property") we can disable the 'max' cpu model's VFP and neon
> features, but there's no way to disable SVE. Add the 'sve=on|off'
> property to give it that flexibility. We also rename
> cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> to follow the typical *_get/set_<property-name> pattern.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c         |  3 ++-
>  target/arm/cpu64.c       | 42 ++++++++++++++++++++++++++++++++++------
>  target/arm/monitor.c     |  2 +-
>  tests/arm-cpu-features.c |  1 +
>  4 files changed, 40 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
