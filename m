Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1491145lfa;
        Fri, 4 Jun 2021 14:03:08 -0700 (PDT)
X-Received: by 2002:a17:90b:234d:: with SMTP id ms13mr6725568pjb.135.1622840588672;
        Fri, 04 Jun 2021 14:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622840588; cv=none;
        d=google.com; s=arc-20160816;
        b=uJiHcsM5RC+SsnPPiObVqce1CB3Yic4bUak2ilrss8NHQqLaH9/21iiCBgn9NMn6P4
         Atl3UBTa2+DeBHGesY9Ik0qivV38io/QJWTFvwANT7F+h3FvGHbFoWO0n//PceTGy36R
         FYmtGBfHhnwAka/Yj4kgvUSvJM/En4jiYzTZ1YKD9QnNYk57i+5HubSS0Mi9j+Xo2U9p
         3HbupEWVNU4vUs/ANTNWWOCO7SKNHMcG1TPVrvkGEW/dUUkAqas4l7FzSV+kgJWP0Vdf
         OLrJNFnIzj1X0zC4jQ5OALGn1xqPWl6KAMn9LM617AztrLnX5R0zKPux1ixttLMThgMS
         DVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=OWaMTKWGQMObSLPgd20FSe0a88QTy8C5hfuU/lSHefA=;
        b=w6hezEp1lI/b99b4tOUPUelJZu4zXur8yu4IWHKF/qpNoLVQv/402Bb2dBpbe8eG5e
         YuksENjDrfGDLl3NzpD57EsHiHE3DduNI7TYBxIBwHesNUnI72ORSRI2GhTVJqtr501G
         JgfGFr68Fy6bejTqdFnVa/AT9MDY2IPIik/ZMyY9nMT07UwfvqETVUxdb9r6U2iWVeUx
         VoNZohOPabglTQ06C5PwpUCcxGWcDtMKLdBJhCFEGFPcuwpuLE3HZq6gomVuXDnWJ26/
         j/GqeG7oHN7WkHbP/nsUttE5GKiPgk9LoD/EaqNiSq49lfChTec/SgI1Qi2bfJY/EegM
         srag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pWEuL93Y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 66sor494310pla.62.2021.06.04.14.03.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pWEuL93Y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OWaMTKWGQMObSLPgd20FSe0a88QTy8C5hfuU/lSHefA=;
        b=pWEuL93YZ1kgmrE/umrbkV9Kg4O+AjeJYd1spOKNnotFQ0W/DDJFfGeWPvaP+kABV6
         RG2VvkaQFG0/udV+XX9/pRZBLLplQEVf4ny8Wcy8zaCMGUjejWu3ae7RMM7ts6+pEm76
         8VC7a0owN9JWotSZPToz/N6OK9VLYgvecpjekXZdu69j9Q9KneY8mB5AssGkOKugULyl
         HrYFB5GiNxSKfEheyLC83pF6nEQiQQM6wwjCkR07Zwk1bnS9n+8venQXTO8MLaUPN1+Q
         K37tZLNUgUI5d5RzV2SxD1eoDBgyrp3BtL3skBjNUiHFhYhccZmUjciQKnHpnunmvqw1
         9+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OWaMTKWGQMObSLPgd20FSe0a88QTy8C5hfuU/lSHefA=;
        b=gm5NJbs8Gab7jGCNXAVr7BlXb12yzBk5VwWCm2g8u41J56UptGImYO4Y1g1gkE9wAH
         rCDAbjOsb5me1S3MFsMOn1p/Os8hNflhjMSG9mJ9dTDRXJCTra4YX6oRDN7s0IQhimvW
         R8e4GeSQVTxNkIS/lXbV4lTExCBeNXLmm3GpfugDbOcv5Caak6Vf46lzfa1uRJcnLBhN
         w2oGLF/C44YDggN7Sx12H1mKw1/iTyNR5FHhjkfQfC39+ce1WOBA9OeqryiimN5THfZn
         nubfNA8j1WYu+c23ALFbHgN3SnCuMqMn8fSdyidUpAnIuY2fpgNR2l6+xa2CSltIEGS7
         9XFQ==
X-Gm-Message-State: AOAM531JfNUxI4wU/CLBvMlaDkQ1TaexGMUNpwhbI1VC5nzIkwhv7hrG
	K2809dyc/K0T8x8N0lLL8jJG+AjnfnVENcYv
X-Google-Smtp-Source: ABdhPJy6NJVH5WHLvvLYCT78ihjCOpJnEzjB5c2NAZIF4MLnNhAEzO+6QcVTryexEdV/vBk2pJriCQ==
X-Received: by 2002:a17:902:ce90:b029:f7:72be:b420 with SMTP id f16-20020a170902ce90b02900f772beb420mr6273001plg.67.1622840588222;
        Fri, 04 Jun 2021 14:03:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id v14sm2044613pgo.89.2021.06.04.14.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:03:08 -0700 (PDT)
Subject: Re: [PATCH v16 06/99] qtest/arm-cpu-features: Remove TCG fallback to
 KVM specific tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <596cea97-75df-5f89-d10a-5ea8ff15be09@linaro.org>
Date: Fri, 4 Jun 2021 14:03:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Em4d6f2WhPIN

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
> tests are now only being run if KVM is available. Drop the TCG
> fallback.
> 
> Suggested-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-7-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
