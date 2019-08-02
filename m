Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1030861wrv;
        Fri, 2 Aug 2019 09:27:03 -0700 (PDT)
X-Received: by 2002:a17:90a:3590:: with SMTP id r16mr5169282pjb.44.1564763223556;
        Fri, 02 Aug 2019 09:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564763223; cv=none;
        d=google.com; s=arc-20160816;
        b=nudYsKGlO3FW3QEnYRgIReKgzcFw7kYzO2BHbITbzKcBzbskgnNCmyLTElizfWc47F
         oW5JqUlMTAKGCyBQ3NfW6ksnfZSSdymbGfl3r078eahZxIruJh3gOehpHxvowFPVJxDk
         YIMXfJHuUNpvXjBfAP8HbwtV3L9G1ed4gFuUgZNMd9SGEixjkSoaiBnh/Wbm80QT+5K2
         owIBLDWTyJXYPfSdjDpB3+O2beyVj45HMB8OCv9jXiiDdFyi1OBR3kPUHBsttuEkNkil
         /8q2WRgIRS7iTU8sZX03N0gxS3EEheKtMh6nUANosLELPtK4kIlZbMtSrmVx/wbS8XT8
         dsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=GS8ER9DbxbrmSZza9XhZrac1/kV/t+hDGahI/wKxDyI=;
        b=KyM4U2CAgoJkvocS+RD25uu+TlFuoVWb8AA3JqWsK6ghPzoLZ2zp937V72fqqIUS+J
         Lg0VkeyaMfkMgjn4+k5OLm9CXL1gKEZjAr53nPBFGJqYwIae5MirIAIqgf9UTGuLgBku
         RbcfTeOWcMIp0oqCKFoZzD3zUgNmDF8u9/uZgI1rse0HIEmrTykFZ5gbLF14wUCISZ2o
         ybMRefijGyuIWi0YfHIpjusYFyV/6vNV60O60/53M4342BbRmKcTmxR0wiW0txYkrwMJ
         /gjCYWam29XUBFC9WC0JTh/ksZVsKj8Dh7DeQOI31CBW+9KeJ65WmqUeLfGh0DHK/Zwp
         jvZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9PWMX8l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 13sor57061139pfi.28.2019.08.02.09.27.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2019 09:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9PWMX8l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GS8ER9DbxbrmSZza9XhZrac1/kV/t+hDGahI/wKxDyI=;
        b=Y9PWMX8lCsqFdI1gTTuHnE8GHPx75MODVn5LfizK5RxSqZIOYVj/F9z2K1+PPYrd6k
         y3+93WN48CEYJSpLrg2Viavd6UbS+EFuycR1Ba6oQkj02pZzm3FV6Lj5YEGix5kpR0Uq
         /bm4qB8eWpMCUg7E5J+OWBUimlMjr9w5N97Qq/Q6l6tOL7rY6p8ZMYVjqNOfX2sk2pTX
         vUu7xje6sNcDZC2LgDDWlF5Ssv2YYwMQztHMMMl10q8qWrOA4GVtDHnyUjxrpBPkz6u6
         uGxYWYvwZYIkTRwDKt41EvPh1RbGB94Qe0u3EcPHLyArQsNGg2YLD35uxSCiHsNTDspP
         xRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GS8ER9DbxbrmSZza9XhZrac1/kV/t+hDGahI/wKxDyI=;
        b=gcdZyh3Nlfasx9boIOmFXgCO5gux6ZuN3lVdz1ZiSC8SLQFITKFmLsSgeQXCNfmkZr
         3xiOykbJ/TIIUWbhUDdmDgf5+nG3ehx52tKUL/yJJzHT8CvX6x9hx4mP/KrGmSMX1jO2
         u/rlriu5EJEnu+W5Y7wutFYjsIkqKdq7ZoMVbxHGo4O03tJPnyD2y6OutjctIA7ksYTM
         CnMug7yU2Jmaa5i3uoDj21ETC3Ukk5lVWomxmW83PuYsHE1G0iA0bPpw/nlByUkrIH/n
         sUZcJ+g1NHXjjT9fDKOVYESnhmcSZZJ6R4s+GuMcbU3oivX6OkUonExiQ0UeHte749w1
         orXw==
X-Gm-Message-State: APjAAAUAeEZ1Z7f5XDALdpNqoDDkMRmiiyj4mFNBodeR4hM0ZZHDve0P
	woLFk3ahXlWPD6i1aX2mkGu5qUkH
X-Google-Smtp-Source: APXvYqxd+uO5rua+zoo+RjlQPPvZcii0QrBwMpr0HdTEQJsT7oBwOXCVayQInrz6mYAO4N8xqU1usw==
X-Received: by 2002:aa7:81d9:: with SMTP id c25mr61603169pfn.255.1564763223043;
        Fri, 02 Aug 2019 09:27:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id a3sm78757971pfi.63.2019.08.02.09.27.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 09:27:02 -0700 (PDT)
Subject: Re: [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-4-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
Date: Fri, 2 Aug 2019 09:27:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802122540.26385-4-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: XxFaezeNN+/h

On 8/2/19 5:25 AM, Andrew Jones wrote:
> Note, certainly more features may be added to the list of
> advertised features, e.g. 'vfp' and 'neon'. The only requirement
> is that their property set accessors fail when invalid
> configurations are detected. For vfp we would need something like
> 
>  set_vfp()
>  {
>    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
>        cpu->has_vfp != cpu->has_neon)
>        error("AArch64 CPUs must have both VFP and Neon or neither")
> 
> in its set accessor, and the same for neon, rather than doing that
> check at realize time, which isn't executed at qmp query time.

How could this succeed?  Either set_vfp or set_neon would be called first, at
which point the two features are temporarily out of sync, but the error would
trigger anyway.

This would seem to require some separate "qmp validate" step that is processed
after a collection of properties are set.

I was about to say something about this being moot until someone actually wants
to be able to disable vfp+neon on aarch64, but then...

> +A note about CPU feature dependencies
> +-------------------------------------
> +
> +It's possible for features to have dependencies on other features. I.e.
> +it may be possible to change one feature at a time without error, but
> +when attempting to change all features at once an error could occur
> +depending on the order they are processed.  It's also possible changing
> +all at once doesn't generate an error, because a feature's dependencies
> +are satisfied with other features, but the same feature cannot be changed
> +independently without error.  For these reasons callers should always
> +attempt to make their desired changes all at once in order to ensure the
> +collection is valid.

... this language makes me think that you've already encountered an ordering
problem that might be better solved with a separate validate step?

The actual code looks good.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
