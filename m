Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2163853ejc;
        Fri, 10 Mar 2023 09:41:03 -0800 (PST)
X-Received: by 2002:a17:902:c40d:b0:19c:bcb4:cacb with SMTP id k13-20020a170902c40d00b0019cbcb4cacbmr31130690plk.56.1678470063524;
        Fri, 10 Mar 2023 09:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678470063; cv=none;
        d=google.com; s=arc-20160816;
        b=eXfh30Uq/fdvWjHlmqMIznz09itXdO02M1A5THtY60F3+uIj1kdJADsa4MrJi5ke0u
         pZalTOHQxSAkGRSPDz9JXIXQlvl/wCcGSmzT/1oPm3Q7LKzW0CNnchqT4+evW02XiLFB
         iHCiVURuLIASGbzjkr+1VCV71wOR1HZFA4TDti6+EhJWpS1D0aNWrZ3ayrr/aEeVHraT
         1wck2imXlSKL4LynGC6Pfm2bAM77lgQtGbRqlfDte4ETU0lB8Awdkhv8/Odb4p6d2rzo
         DTRfedRXk8Js0SkipkAdfYGZVnfwJmMsIsUrFrHnpJ0UnrGchxdmHSc+2sKpKlQjj2ja
         GATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FGXwzIkMd0KiLZl2peeEUWNcnKyZnt2KyS9WbqqunNs=;
        b=IfIx92b3dlT7pAh8yy7FlJ7h5l8Frv+N98cVC7HxN198o838vT9yHhxQtd4685LaVD
         dMg955jQxSLkhJvhHuoO8u/pmdOBfmWbGUGZeRryQ4yj/o7nlw53SUl4xmnyYiL5zo6J
         PQlUArXnjHJWTVnnsrXP7ng1kZ0Cm/2Ur2qGErpYBTUxdwyNT/4F+JUp1qOQJX+BY0HQ
         tl+DHWg5ePFQ1k4f0Hmk6YPT1KfB+iDv3/mgjBb/wmxMIed++Lm8e3a3AddjA/iM7Wsm
         rGe4n/ryPYh7640SRiP7ifcJpCbMHSLtnI3j8dvgAcjPW8uLTDQjGdsSrNars9XzGG/p
         DL/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4FCwXUj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jy5-20020a17090342c500b0019b8b794b3csor250342plb.67.2023.03.10.09.41.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 09:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4FCwXUj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678470063;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGXwzIkMd0KiLZl2peeEUWNcnKyZnt2KyS9WbqqunNs=;
        b=l4FCwXUjLafnpsaEy4c2vAZCOh9CUpLEJUIXxb6tRsGINwCRfkM59nBW6kAvn8f2QM
         Lon6IxgPuGPdEGz75q27FHn0aYrqCKm/HPzgiZgWjEjIBxFImfRx+nDNj/q4JgrBT5cn
         TBPhbP219KROj9FpmsxabAAhe6MKxKEJjxQjWJxQVzN0wPWSATzVRbXCqoeXxUV/TNm0
         H7QG+tPnE0n+MPZROQwYoBFqj0mxUWq38qe1BDa62wkQek6/li6gfXU6z/Ui35uvchJG
         Qk7n2Ga+7n1AsrbxBQrlUCI2gsRLir0uMrpIMh2YNPvNdFar3qWV6UdIn7PC3pdsV/Bo
         jRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678470063;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGXwzIkMd0KiLZl2peeEUWNcnKyZnt2KyS9WbqqunNs=;
        b=TCmwBMW84BLawybYajD3MZ9QrPBIcSRl1/ZF9TEs0WuMAewBkZfmpqlQsxitizO6GZ
         P2iq0iXcAWvZkVLMr2TeBQnrz4QwFz3YnM3zuz5gkO0voqeGcrDr/1fGkG5VLMCpcMlO
         19wbvwAWzxK8Jhl4imNRC9uikclSPHPuPtOaqzG9iZL2FStQIzdCbOunaq/ietsaCh6E
         XC9IEwwlI8mFBrBKnIwsnLM1BOqf07w4EWl7/qOP1BcTUdeibotqPzbs+AK8wgUZZAwj
         +29Xx8lZymijU6yoYhAyQVE1x60P8kCGpBJTa+XIMBKKcFInahNaLahC+B9vf9Fc1GMj
         zI8A==
X-Gm-Message-State: AO0yUKX2h0FG3qAw3xSjFjiMHrRIQysb8BjFj3RREWPVTg9niSE+FvhA
	W9L5X1hR0JBSuB0KYkXxTz9cJZk4oKeoHKgg2d8xKQ==
X-Google-Smtp-Source: AK7set+0InHqiBBJs4iiLJUeAcynnYhjqYjTPRAW+l85Yt1sD2Whveqis6WiHIWciSxUnFc4O/7vMQ==
X-Received: by 2002:a17:902:f685:b0:19c:e440:9256 with SMTP id l5-20020a170902f68500b0019ce4409256mr31149312plg.35.1678470063023;
        Fri, 10 Mar 2023 09:41:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62? ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
        by smtp.gmail.com with ESMTPSA id y3-20020a170902d64300b00196025a34b9sm274715plh.159.2023.03.10.09.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 09:41:02 -0800 (PST)
Message-ID: <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org>
Date: Fri, 10 Mar 2023 09:41:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
 <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
In-Reply-To: <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GpVVvzMGGV7H

On 3/10/23 09:39, Richard Henderson wrote:
> +    /* Undo any setting in generated code. */
> +    plugin_gen_disable_mem_helpers();

Oh!  And this is the wrong function.  Should be qemu_plugin_disable_mem_helpers.


r~
