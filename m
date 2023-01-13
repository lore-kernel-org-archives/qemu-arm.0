Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp708825ejc;
        Fri, 13 Jan 2023 14:06:11 -0800 (PST)
X-Received: by 2002:a17:902:db05:b0:194:751f:3e89 with SMTP id m5-20020a170902db0500b00194751f3e89mr2815280plx.63.1673647571516;
        Fri, 13 Jan 2023 14:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673647571; cv=none;
        d=google.com; s=arc-20160816;
        b=NEMfWINmJ5+mdcvaGDoKsNGeY3C0KgWFIqu2Qqm+pqpR9+Obs9e8/z0cT3Q8+ITWdF
         6SGthF3+cKDfpGsquEWI4luv89kQOudktqolEk5Y/qyLFifn14qLH+sszGPZrqcNhtk6
         XUAimtk/uxW3np1LRcbGtRzxqszL5ZV5sqci19kX882vkVyHFR5BeJpwzK7YtJ13a0CG
         +eWfVdIXLjz4j208rT0bBLe46x2r/Z+jQygQ6I60USI3QigPa0UL71VX0VPkTeX3BECS
         T1FhJbrqsnXLvuYXgRbAD+msf7Dx2W/GYrlm6AacXqRPYSw0z3xOSnOBAjHgKMKPu0uI
         QmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y+qvu+7Pyq9eGkJEkiUMjhl/CTNX4Fkv/iCghWgzUEA=;
        b=olx1IKwhr4Dg+R9mm5yq44GKRZfVNzs0jfZeuXhRN4wAveDZzuUVW5tDhQKz/vkAEp
         xzVMUkWmM8aayu7oE1S/dyjl1gNbQwJeWrxcpbmnTq7XHePnakaffsLMN2TPfg2Os0ro
         Dd9P+Igm9zf3Wu3Bj9ibDSADObiSVXUHnMaj2owMFO3runKGBth6ei630CPWhFsJG+Re
         Qzi5dkzvKW2yH8SY8N4Na2aH3DtnK0bDsVLHEk/5R8pEiR9YN4fd25KGIugnKRQ1PcTX
         +1Oe9tdGmNw7Qy2MFOiHuamuOwSmXR6FII424atox5pX08wF3FlS1xCCvAkxAldn+bCX
         D0Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWzupnxt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f18-20020a170902ce9200b001947221dc94sor1203913plg.153.2023.01.13.14.06.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWzupnxt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+qvu+7Pyq9eGkJEkiUMjhl/CTNX4Fkv/iCghWgzUEA=;
        b=GWzupnxtiMTv9PyYpGSi1Ph4fVSpUTC8VH+gkqVospHTdK3Bb79I9XQsyo9HmaUG/T
         I1YCRGMPuj33EZUegH5v2xph/c9m1OjXIdKnhfpUO4ltynxKqGDKlESEhVq0HTUZNTUX
         tHreFmhHR2YRXgrJzKj7osbn6D7uzBvSXdd6cYN86OQ1Spq4noDBza/1xY3MCl1hIJQi
         Vsf5jLijCMkVnTSqgtA2sEF6QUSpJ97iOAFe3tuuHXBLNUT2UKs8yB4nmsoSOkQOMWPc
         rnIFvi8IoNJEV4Zvt7om8VdumRTq3epxvKd/s1rdnjEp/xTa8AFsHMe1vjSojzlerpAc
         E36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+qvu+7Pyq9eGkJEkiUMjhl/CTNX4Fkv/iCghWgzUEA=;
        b=eikAcuEhX8wI4r+m+tL9hLoaQtQMHndQJnSgL/tD3iWTHlYMp/MNLdE5nrz/ATc56+
         jnhsUJbMvBFQph3HOokuA+i9UTfjjXUBpHrYJrt+Nr7N8H+av6YWTpRBLLhnzOT5Qfxr
         3ulC6ivxDqVJNtJhXEw+h9aTHsTXcSf7iNZ0/GgRF0qv2McHCJuHoAyIZ40kuEKXX+Mp
         eUAgwgojBtHPwC8UMm7THdK3eTbc+KvQNHeAvqSBrU21zmkPMW1cnGO2MfgX/sa8EBOD
         nWJw++MVPKC/IjIBsaSuyIpKoiBVLW7vDTmDvlQVmCKPJACIWxqmNXKMkmfv2wVXSc5C
         lkvA==
X-Gm-Message-State: AFqh2kpSF8DEDvkdRGywcONClcxb2N0nwazqjPGs6QanmdLLmT0Yhtmr
	YBSB6W8Tfv2+qA1NRoXQTdkhM5kY
X-Google-Smtp-Source: AMrXdXthoEcC0VtLJnDCb/yDqaibGbZuSB6Tr7SakXW299e+yKfjwRbKlVZCFoLh5shmSb03HSW4WQ==
X-Received: by 2002:a17:902:c401:b0:189:ba1f:b168 with SMTP id k1-20020a170902c40100b00189ba1fb168mr122912315plk.1.1673647570979;
        Fri, 13 Jan 2023 14:06:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001766a3b2a26sm14649164plr.105.2023.01.13.14.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:06:10 -0800 (PST)
Message-ID: <bf48eed6-bd46-a9d5-15df-a402c5ea3546@linaro.org>
Date: Fri, 13 Jan 2023 12:06:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de> <875ydaievb.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <875ydaievb.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 76c1ZcZ0il3D

On 1/13/23 08:22, Fabiano Rosas wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 1/13/23 15:04, Fabiano Rosas wrote:
>>> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
>>> cortex-a57 as default cpu for KVM.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>
>> Our recommendation currently for KVM on ARM is to always use CPU="host", as named cpu models generally don't work (yet?) with KVM.
>>
>> https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html
>>
>> Should then "host" be the default for KVM if CONFIG_TCG=N or CONFIG_TCG=M and the TCG .so is not loaded?
> 
> Yes, "host" seems to make more sense. I was under the impression that
> there was a way to use cortex-a57 and cortex-a53 since they have
> cpu->kvm_target set.

One may use a -cpu other than 'host' if and only if it exactly matches the host.

r~
