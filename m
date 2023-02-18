Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp421274ejb;
        Fri, 17 Feb 2023 20:26:44 -0800 (PST)
X-Received: by 2002:a17:903:1c6:b0:19a:ae81:b09b with SMTP id e6-20020a17090301c600b0019aae81b09bmr3246574plh.11.1676694403930;
        Fri, 17 Feb 2023 20:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676694403; cv=none;
        d=google.com; s=arc-20160816;
        b=asdOuy56gxJMIaHNHAdkE96w/CzuoU80LFm8Np1mEwXepVW95HxLff5+XgIk9v/uX1
         P3C+paCz6fyDYJTcIwdCyzPRxZrDcbRqg0a5YqEf+up+U0/TSpVjrT5sFTESYQiLi0dm
         iiM944qSSFo0tWBC9SjqWbXINsvSplmePndJV5XK+EwrzbCXLjqi/0biETa9nHZImhTS
         xJxBjYnNCaHDOA3S6fnJfGL+/8oqtlObBfqrYe+aktPBz81mgG+OAJ2NwfbtVWLmgTvN
         a+6hMlJaccVk/GcxPdEDqKrxLbtg0bDTPKnS2B22x/257Nl+bOGPcU4zlMgtU0JkqQMX
         Ai0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yDXgu+LzVItUr6ymCGt9467fm3bRW73QUz+8B4Ljll8=;
        b=Wy2ZR8ZUY1juQ0VrVd+Kf8o1/3JNKFBOpIyt4MNnBqKoqS7KRHg0/FBaY/LPNLRMTP
         t6Ig6udeiwxZOXgpripUTLPlCxI4vdfKaNKjhPRCcospKajh+sbiml9e3Qk3Mu0Jld3P
         FSHbOxngDoK2SphSbtvpPHhDiQ1k1DsmIOVRaH48vQN/kZJCHwpgva3J1JSvqI9Yuj+9
         HBJnnRnJA+sEOnga9m5FkcYQzqJEKoMHt63ow/CfCXc49kT8ixN6Ry4qWxQam+7fSxjo
         hsuFxjDCM9sOQoSpYWLKwP8ZkIxzpF9Jur7KqtkjgB9J7B2ZHoX1n73k1RaX3XDKI2fH
         7yDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TenXUygi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u9-20020a17090341c900b0019a826eea43sor2923688ple.199.2023.02.17.20.26.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Feb 2023 20:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TenXUygi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDXgu+LzVItUr6ymCGt9467fm3bRW73QUz+8B4Ljll8=;
        b=TenXUygiIoPWkNKVIeJtqYICqy+hDfLoP9sQaIbouZ16LEyUrwvm/jUh9EA7Cpk2/u
         RArMfhABG8dNPu2t3vkw2WHNkL9TghyAHDauFHfLF5y6/keEfMs2K7ErtMHF9+wOMchI
         Yv7MEUTJ74Svg43tKIPuApj6HoZ/BUKXz1KSBQrczt4fMyqHzFrelTC40EenbMu6Zf7o
         aH41pgENjUrX3H4GInGNafms90yFWt+5V5ZPvTe7lt9CIi3F0vEQHPxntTjLMF49eMh5
         qF5ylJBSNaCxgigfF9pdxX+eR1EpWBdh9Bq+WAwU8deI10ofDzmbKHOwmzUdFi8UE1Am
         RE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDXgu+LzVItUr6ymCGt9467fm3bRW73QUz+8B4Ljll8=;
        b=rTDt/UMbOaZklcY9jTGFmjVmnxuZ9s2J2WzcggSIyVVnMbUZJUfH8T47TLx11kLJrd
         AczrnpgcudzPHskkVQJ3QT2S3/1tBffSJwnophjT78hm5OzN3jWDqN39w8jhEMyEzIzU
         Bf2kSgwH7r2inp6XjKX7uGxWLkPUig3I8fS8bqPUEOKgHNdj02NeMP/Wf6j/UChwOE2F
         QnpuVCESq1HQF8NKOd06yOBD5s/Paf/Xhot4aDgzIUx0laXVHdZkdkqmjVSpbvQSR2Zv
         RZHsyK1eOrgzlIARfOrb+vADeuQLZMd/n34lnq5u+hkHu+q/HCEV0NRx+kkokN6OYv0y
         OcKg==
X-Gm-Message-State: AO0yUKV7Gv4UEUSqZj2Fw8ktyjdjpQIIAiEjbDLp2zfyyY1XzHUcaxCp
	YHbXYd+dnmRvx1OyU7V7K0G/gE1X
X-Google-Smtp-Source: AK7set/81z3V56Cs1nbzGENr8RXpagB/nmBewNkkQG2i24GA0lVSZy5qkeL6vZAgkdeMpmMpbtqjdg==
X-Received: by 2002:a17:90b:4c4a:b0:233:b20f:e646 with SMTP id np10-20020a17090b4c4a00b00233b20fe646mr4119742pjb.0.1676694403407;
        Fri, 17 Feb 2023 20:26:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id t1-20020a17090a950100b002308e6e645bsm3589500pjo.49.2023.02.17.20.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 20:26:42 -0800 (PST)
Message-ID: <7d0021ce-6992-492c-85c1-9d203a913187@linaro.org>
Date: Fri, 17 Feb 2023 18:26:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 16/29] target/arm: Move cortex sysregs into cpu64.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-17-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217201150.22032-17-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 01SLhoUaGMN6

On 2/17/23 10:11, Fabiano Rosas wrote:
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index a5191b57e1..b0bc8a3cea 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -1,6 +1,7 @@
>   arm_ss = ss.source_set()
>   arm_ss.add(files(
>     'cpu.c',
> +  'cpu64.c',
>     'debug_helper.c',
>     'gdbstub.c',
>     'helper.c',
> @@ -12,7 +13,6 @@ arm_ss.add(zlib)
>   arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
>   
>   arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
> -  'cpu64.c',
>     'gdbstub64.c',
>   ))

Not keen on this.  I think better something like cortex-regs.c.


r~
