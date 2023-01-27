Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1496161ejc;
        Fri, 27 Jan 2023 15:04:41 -0800 (PST)
X-Received: by 2002:a17:90b:3eca:b0:22b:b89b:b9d0 with SMTP id rm10-20020a17090b3eca00b0022bb89bb9d0mr28795479pjb.22.1674860681701;
        Fri, 27 Jan 2023 15:04:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674860681; cv=none;
        d=google.com; s=arc-20160816;
        b=gqx/kNi54zpOP7ONCUM/b4BishrKjp8FL39BRepYGx0NhDFOkKlOTugCk7ngKgW0OU
         XFGqhIHVywaWr2tXHFDZOuYM0S2uoiA8XftYGEwbBtGVM4G70aCRQ0JlBNl1v0ZnARVH
         aVZC+gs1Wx5xyYseMnG+RDeZRFutn/v57I7ulUcaFfaOQFinapFS4GpLnLzGYMOi8jS7
         M7vazK47tgWs5aJ8fwfmf15cOHNJ92DIt1cKsDWJitkaCXF/LSUVlyWwpOUID7Dl4O11
         urVCDZgVbgMezlGXIOw6nUHgGofHDXIYI4s5mEJF3M5JrOP/4kRmMtVVMyXZF6BaJHi3
         vXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZPFJmW5XKyYOOk/UPaUouBU5VqYMgswETW4k1N1Fo44=;
        b=NcCARAutrHk1Z1oOLT04B8j+qqJV7HdlxUOQEcdvFyVyZ2Exej0D7Y7HullVToAWYW
         TEhWO5n/bKJCXYFJ+UhUdelj8acwnWFnWwIVBOm4ph4y6NG6AbENqNn095IdfkH3I5Bf
         JfAc7udDyKhbE7Td1RTJ8ZQKPrSke+8y6ihP2+xSsgVocIe63gmHBfNick3zDnaeeNo9
         q8ZRUKqD9bd3B5pcHy6jVZ5T58oGw6wrU61hwuQklq/U82E0SGAIvbOpHJLcIZyG9uRh
         DIh5EJuUNOPHO0GYg49JNlarvuS0eDPZXUrxgXt9F6J4THpN86/bZQm7tU3RuJpWoWMJ
         IgTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLuHieCs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p23-20020a17090a931700b00229f87c6c37sor2516696pjo.25.2023.01.27.15.04.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 15:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLuHieCs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPFJmW5XKyYOOk/UPaUouBU5VqYMgswETW4k1N1Fo44=;
        b=WLuHieCsxiLAEihq+pZyIYsEHRhaTq0kmA3e78ml7wofI4FikhYO3o6wkquBsFKSsI
         5TgSKM1YCU866QUzbe/eWCU/E+sHaR4gBFX7EUSTNzttNkEgTcOt3wqnjz5vlXZWca99
         t9n7On7IFXcdyOwuOEr+eTrOdVHNpDVNEuVFkYPg605IlD/j88wjdtNX+RIQhtd5IWO1
         6M+Ap27mnUq7rWGAutDtPQdmA7THSyd5kXvWHOgnOpqRRQRJXFOeSVOjwDPhmI1Dbdx5
         SC19i6RIZyVIVc6kaj0SnUKlw/R7ZYP333Z1Mcpl4jO6VyF6SS2AvhsPGY/8OfWhTP2D
         DQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPFJmW5XKyYOOk/UPaUouBU5VqYMgswETW4k1N1Fo44=;
        b=2Oceni+OQGTTNIKUB+KKNcgei99WdQjG1cA1aF2Wk0Jgea1mE5IZkjxuNiy5Ns83pY
         wQKiyGVuCO+L4xV1TIcJQgrYkUbsFdUnzFIb0bCTQMnl2XKnoK9zUgjHY0jTHcVdjjZa
         BVBO5Vmf5aaJVY7V79lNbRq8sIVWYUusAWCmaGayGMI0kNtidbV346Hk08+9GOLA/Xt9
         Zxy/nq0r7fQCoWKqk3NVCQfT9fMDEUHTS8KHD18x/EeZsLGA6kKFJmFJTuUDM/m4ZXkS
         Lgxhnl83tDwJyjLNxdEwLnbjUOmOT3+Z/ZqJJRYmpZjI1L5bfnJAGoVBhVW45zndieJz
         8y9g==
X-Gm-Message-State: AO0yUKWPrR5k8jUhJEp1rddqkxEh4bmVz6hcTviGSkE9Ed7NCbyALg6i
	S0IipMOUHjw1hE9hR7TZwWH1gHNq
X-Google-Smtp-Source: AK7set8iUQqqGQKNu7EsalBJe6XeaIhWCgz7v1VNbqI3WMDsYazRsl1RXCtwVy9TfB/ga6Xo60C3wg==
X-Received: by 2002:a17:90a:1dd:b0:22b:eedb:649a with SMTP id 29-20020a17090a01dd00b0022beedb649amr16287452pjd.20.1674860681277;
        Fri, 27 Jan 2023 15:04:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id v11-20020a17090a4ecb00b00229f68ba7fbsm5541004pjl.19.2023.01.27.15.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 15:04:40 -0800 (PST)
Message-ID: <45e099d2-1418-6002-f6d3-a11275e6f14d@linaro.org>
Date: Fri, 27 Jan 2023 13:04:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-7-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-7-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hTEy+TWVmug9

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -118,6 +118,16 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
>       return 0;
>   }
>   
> +int kvm_arm_rme_vcpu_init(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    if (kvm_arm_rme_enabled()) {
> +        cpu->kvm_rme = true;
> +    }
> +    return 0;
> +}

So... harking back to patch 3, how may times are we going to query the cast of 
machine->cgs to TYPE_RME_GUEST before we save this value?


r~
