Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp890491ejc;
        Fri, 3 Mar 2023 02:21:55 -0800 (PST)
X-Received: by 2002:a05:600c:a08:b0:3eb:5d17:8ddc with SMTP id z8-20020a05600c0a0800b003eb5d178ddcmr1187779wmp.18.1677838915353;
        Fri, 03 Mar 2023 02:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838915; cv=none;
        d=google.com; s=arc-20160816;
        b=Yf5npn5zrFfZa9gOd9RDaECGwkoq574hl5H5hFATG8A1qfd4MvLb5HpqH5ZzcCqPwb
         XrQBrC+YnNs6eLSMpi3Rvcm+BBHdAkQ8T8RTkHVorKNCInT1QONYkjDSDAKak++A+Mzk
         jbsc2duYVx83dSOoAOfECMWfFGlkwwwDrO8p/4qsMcrR49LBy30Vx3cz5vJBANhMC0hg
         r/vwmfNA5K8db9OIWcEb+LgReTnaFOP+auxc/4zcCe1kjCZGFacg/caEKYs5MK1fbxEy
         xTKODYgNZn9/hAX8TxZueOOEV0zzQOMIMcGcJIziNMascgXxjmIVNgUGF8SDU/QWnX7f
         rJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mzlTP7R7zKCP7RJ8UiVzNpPB9G68mLprKPS65LltYYQ=;
        b=W9N18LowsjeKMSApTwIUcjMGvCtYikc5BauiT1B0SeLxOXj1gxxnfcIsRnARjIPbCT
         cDYSyOPWX6ENQHBRK6BJXI0R/SFR9fpyT2+0a8fnYTYygqHxa6cToELBRZ2SVBrf8zNh
         YUXmPqYwHeKqCoHR9dm9mW3vI/LwpFjhZjAFnSuOyQJ/PhbI+PokJ0+Ln4H7cNMG49yC
         JRDupVcDrl+nShdjuDr6JL8litdoLcbpEnCc4zSlO+shyB0KEdA10LQLd/mCCDxx2bb/
         NAVnEZ7qPWUAByAT6pfrfx3mgyoOh4futXt3UGol4dhf7WpKUaQFHvJazlUpJQ7XAAp6
         iPgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ngRXPhil;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z6-20020a05600c0a0600b003e2065c838fsor595181wmp.23.2023.03.03.02.21.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 02:21:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ngRXPhil;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677838915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzlTP7R7zKCP7RJ8UiVzNpPB9G68mLprKPS65LltYYQ=;
        b=ngRXPhil7bj3ycpjZ2nfojxKpA1sozPlWMzoi6tz5m+9ydiiaE9GrSxvNVUUgb22uU
         PSrwz6wkEnyslNL8Bn/sp4HB6BbfQN9DbGBqk4wljP5Y6aN5uuHixDU93FiGsAsKVxoW
         vlaVAltrwSf8bUTl5MbjF01UqOit1HYpD3DiuIAq5nPkcwEZ8eXP4CSk+7s7SycANOCq
         wD8BQ3KrQmP3R7ypZ3j/cr8zCEmC4HeLpWPKL/ftjh4vOMHbIlOhmj7Hm5H4yQDdyBHl
         pOaKVylMGdrEmDIVLvkshVsT0aQVjEmLim6y79vWd+UnSrgf5LZiED14limOAuU/S/q6
         cFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677838915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzlTP7R7zKCP7RJ8UiVzNpPB9G68mLprKPS65LltYYQ=;
        b=bmYEM0QFjmMoUse5gpf/IU8tZyMK2zqLzGO8rSBfTbpYPZ9MLsxclFpyC7y8ppMa2C
         IKmqHtrqMHQDduoOiPc0C1BUd1bHRXPUjLE29eiXEfRSu3j5MW/60QuA2NuqbKNLMmVb
         i+08+7WYnDbXRVA9F7CWubbsAuBGlo4qcRt+7taEfA7TpydkOjEK5gwoQfcn8Lv/Rf5k
         92OCcbFdmB+7ooQyAbAmHd9ljkn17zoHhazEpIahrG21aYPhR7gXHN2+9z/1eN1/D3tc
         48Aqe7vJBl46chEXIwykcXLpaqz4dLrq4GPJ9quaFsCX4Xsm4EQP50gBRm8dvM8oT0l/
         7lnw==
X-Gm-Message-State: AO0yUKWQ8RnsjR5Ai0iyzlR2J3ELqhAQwTWUU3/D6vkqJP7NGFjHMcTJ
	VCrGY1p8qNWVgTMbrxbe9jl0w06W
X-Google-Smtp-Source: AK7set/y4nBoHbF+MCdO2IUmaX6TdF9cDnDQW+P6n0jDIjBG5I8GF1PCA2fXKcwrdTiiqAq5Gr/d1w==
X-Received: by 2002:a05:600c:548b:b0:3eb:39e7:3607 with SMTP id iv11-20020a05600c548b00b003eb39e73607mr1254174wmb.4.1677838915005;
        Fri, 03 Mar 2023 02:21:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net. [88.28.30.180])
        by smtp.gmail.com with ESMTPSA id v38-20020a05600c4da600b003eb68bb61c8sm1678065wmp.3.2023.03.03.02.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:21:54 -0800 (PST)
Message-ID: <0ffef565-0332-43c3-2786-9fb0a8c356bf@linaro.org>
Date: Fri, 3 Mar 2023 11:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20230303101452.769367-1-thuth@redhat.com>
 <20230303101452.769367-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303101452.769367-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dPw1KLrVgbT3

On 3/3/23 11:14, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> (There are still the 32-bit MinGW and TCI jobs around for having
> some compile test coverage on 32-bit, and the dockerfile can stay
> in case someone wants to reproduce a flaw locally)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index d3a31a2112..b96439146f 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -43,26 +43,6 @@ cross-arm64-user:
>     variables:
>       IMAGE: debian-arm64-cross
>   
> -cross-i386-system:
> -  extends:
> -    - .cross_system_build_job
> -    - .cross_test_artifacts
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check-qtest
> -
> -cross-i386-user:
> -  extends:
> -    - .cross_user_build_job
> -    - .cross_test_artifacts
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check

The cross-i386-user job might require an Ack from Laurent,
so cc'ing him.
