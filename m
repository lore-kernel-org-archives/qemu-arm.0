Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1037446wrv;
        Fri, 2 Aug 2019 09:33:13 -0700 (PDT)
X-Received: by 2002:a17:902:2aab:: with SMTP id j40mr79018544plb.76.1564763593722;
        Fri, 02 Aug 2019 09:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564763593; cv=none;
        d=google.com; s=arc-20160816;
        b=z8wzdI4+ErwGJeAuOQmsQpqXkU8nqCIaEeJr9AnUyk5v7l/fuue5jX+QwwXnPmhQux
         9kU7jaP2o7xDv/JAtqXDkiyZYYnuAqNjmVhXO8+5tXPyH8UTewW15R9+NMnLGDQn3t6h
         GGv0Hl50MT2xUzSPB/jFOz8gI78Frf23oiD/XA2OnyqwXrxDCuldA5IpFyf+K9JWn2iU
         QYycCuN3Y/DDW+WmhsqNeC0ruqYqhICSeSkziyVAo20h9AC2lJ3BR/Jv2B4LG6XHHyYT
         mGaBQJZ56MAHa8LdNG9I2j6Vkzuf59aWWL1pO0/ELRTIg2sCBjFrsWPNLhHF1bEMpK66
         9tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=y3SBkKt/bAn0VxqA0AbUooNma5BupktkPNhWPGGOtj4=;
        b=T7kKFu45z4zzxSp+8v9jXfNuAF+Q1b/g6X1nnxoV7YPGJpjmQ2tRoifmJMl1cUJRel
         8OQ4Bu6o/ShmO1/0xH2pevJRFVyynkt8f9th3Ir7QtXDH9prdE8PKSctYxjj0VciFvre
         +1CoxqADvRjvx2WoCHGQumlUcAYwuoX6FjJlpds3csAN1YPUZsHkyOq89BikSu0M+DEZ
         LOhQXVc0L8+MyNlFvdsVprVmlZx+nK+rg5glFCA+y/3vwS7OvWBwLhNwppSs8uFJ9Tjj
         qZMlpQyuVixWMv/46xwDuu0APiCEJJTyQnjSGcprzUulwef2p25woZ6xMgylvceZ8/DF
         B4Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j9/t5MCO";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e10sor1875116pgt.62.2019.08.02.09.33.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2019 09:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j9/t5MCO";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y3SBkKt/bAn0VxqA0AbUooNma5BupktkPNhWPGGOtj4=;
        b=j9/t5MCOCeNrtdH+K/H3D03ESAxKCNaE4O5hzmtc8Xs2IzetwqvrGs4aQtl0QpdzEi
         rsRSHuiUJurB1nDjuyL0psutERDXZEGxTkoDJDeK10MeW/CG9vuOZ/5OKAKnPFNawU43
         xOacPF8Z+QFD15ZnxsrIfVKFYC0xNXbaUhKsr0GtroPN4EHDc/dzY/JYIRTY6A7nGXVr
         k0byjX31H3XadDuYLFLKtxT+kUhDJN5AENIFHG5BQt8teklc8+licyIqpFDdunCQiTOz
         YAO6SXeRScSYWZCZj2dyKXr9qsEnDjbNpD1CSoyfQ6JKsYmwSD97yhObrhLKTrKifCvC
         GzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y3SBkKt/bAn0VxqA0AbUooNma5BupktkPNhWPGGOtj4=;
        b=HGiF2xoWDUSoDjddfB/SoBnI6PAmcP9avdvp9yTZZyCjhcTvwuGtJOZv410Hlz9v5K
         cs0nZDqwbaonVU7pICa9vQK3Q3j8GQ8OeyKqyA3D5MIF21aGYDdSbE4LOmUu7SauA9JX
         Lv9EIXdWINQYiBRo3TYNFcmH8VLE2gMQWIZs9AXsBYQYXX1FJAD2x4RxCORQoglxrgF0
         6iepJz6a93xeca/nSeeEKk7GEa5st7yilxAQWsIFvYzRxkZ8kjqcVAO47R+5gHrzvCc/
         C0j7k7dqO38cB8BWz4Kwk41nNoQQ25tGZlYCuuTqCwcpqABJzIdTPZ2PfpGdQeR+UPEv
         EC2w==
X-Gm-Message-State: APjAAAWNPx22wqgtyp2IuB239LzFGqjdNaI8Y50ZDhS4DP/D0bg65BHt
	e3ZAgOiz7rED3j1opTiKatDjMUC5
X-Google-Smtp-Source: APXvYqwi63evdxZ7AclrTbZu3+JAKRqYlIZ33XJRToMMh88pQCbuf2wkQ6I9VeGvlaeDPbPQnNCFXw==
X-Received: by 2002:a63:5a0a:: with SMTP id o10mr52639467pgb.282.1564763593161;
        Fri, 02 Aug 2019 09:33:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id c70sm34970414pfb.36.2019.08.02.09.33.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 09:33:12 -0700 (PDT)
Subject: Re: [PATCH v3 06/15] target/arm/cpu: Use div-round-up to determine
 predicate register array size
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-7-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0c3aa3e7-fed4-e90a-3c2c-47702ddabae0@linaro.org>
Date: Fri, 2 Aug 2019 09:33:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802122540.26385-7-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: NQeJ+fObHn9Q

On 8/2/19 5:25 AM, Andrew Jones wrote:
> Unless we're guaranteed to always increase ARM_MAX_VQ by a multiple of
> four, then we should use DIV_ROUND_UP to ensure we get an appropriate
> array size.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
