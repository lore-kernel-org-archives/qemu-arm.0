Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5697705ejc;
        Tue, 28 Feb 2023 04:26:40 -0800 (PST)
X-Received: by 2002:a5d:6805:0:b0:2c7:1483:88d6 with SMTP id w5-20020a5d6805000000b002c7148388d6mr2229023wru.23.1677587200075;
        Tue, 28 Feb 2023 04:26:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677587200; cv=none;
        d=google.com; s=arc-20160816;
        b=sIN1K+gzngPUdF/fP4TvK7ikIQ4rqIlNIdIKj9n4DygTMf17BG7hMK/V3yfwFrae3b
         Jga+XNWrETx2mb/XWfYaRqtYO1JU33t36Bdj2azoFNDKVgDofDQoDarz7bRTWXX4fR3A
         UTbpbbInkjdi33X1ke7Vg+rJYfnwpVvQ8RPSJrUwXHyEMa7FmqIeuy9HJHkEJnQJ2V61
         LH8faw74qP8u8La9WluDl1Xcvoh6yjMNUm1IQtzU5dLXwavlEisaKpK57VeQMEO6ikp3
         mm2M8wJdg4xofGLQSG8D576Jk+JH75bxAGPH3kEqyVNN7umSQpKQAl5KmzZLros/c6nA
         uZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cu+nvG5w9sWCWl9GYD0stdG9tMSCSHPgD7RGc1i2YRA=;
        b=dVcSIOxShSHMJSYrpQoKUtNzpkWmSPhWPseNT2af1p40JQAavMwgnpvOLPrH/4xly8
         65edvWvBseh3pGVHILPlyV+J1v3eK3SIZeCQ0Qg9wEHsCo9iDjT/50IMiyeamVpl8K+r
         2M41WvWkQynpXiBs57uDXrKkmqYJIBX59gncGFK4QVJ5exu/75z4n+qxvwMVHHR0K9uR
         Ycox5rf39WvbCS602ct2pClnfCAwOpfm6y8Hu1+blfWLd6JCsADUXqA0pg8eo4HxzELe
         s4klNQhdTksZwlAZOtELMAG2/S7gE7aKRhELT0zjKpgMaAgA/en9tmlxrXc3Fuv6KJiW
         9VdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3wluKxc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r7-20020adfce87000000b002c54d57e841sor3326934wrn.66.2023.02.28.04.26.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 04:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3wluKxc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cu+nvG5w9sWCWl9GYD0stdG9tMSCSHPgD7RGc1i2YRA=;
        b=K3wluKxcE/rCvWqOkwXeehlmYRMbEq8RyljUSJLktvXWQYzvfV0JVuxh7sEjOItHLy
         zkB0bDfg1w0blyu7O79patbUxjElHTkQWl4dXxYhVt8U8TUSLz+j6ddCyrJhS7m5cNCn
         JLxtUFnp8BSUDvt4S4Tw2zxaHnbV4XxV4VEVqJ/d+Y8YmSoKUc7w/Eb9CcXJEnBvBW/A
         surEgKqpwer9fNgWwtsETr6+JOUrM+n0f+qX5qRY93yOvzTIh3pBSxNrOBcD3EKmU40Z
         QzGrVYDctK5UF7fdvl4Q/aoN9YBMtUH8C7ppyKj5Xnqt7NAR6KHA4YfeOrcVsxTwOU7s
         Czbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cu+nvG5w9sWCWl9GYD0stdG9tMSCSHPgD7RGc1i2YRA=;
        b=d7tmjZH8OPf9y483eSWfer0dnLlfvnsplLDpmQQdqY/tj9pDZe684bSO31m+va1Dst
         SpBW5kPKxxbIoxhmdqJDbzigbaTzar22XekvaHJiobNgTRhr+nj9tMtEK0HktJfmCX0f
         wIfrAnAYefjBkWtJ4pxQRmH/JPBVoGxmcmQnHInkVte68a+Bsf0hbHiYPkQI0eNVMcDQ
         pPFTLi0/CSkORZlbPwoDCRZa3A/Br4fCOtKepWN1dc8BeosQ4iZSjfY/jHWc3f3uBlTe
         4ou5xOQZlxg7dKtWpNZU+0Ys/4SjAKmhmI0DZVpSdoLNaLPbV3pBrS57sfUKLCU6hTfR
         rXKw==
X-Gm-Message-State: AO0yUKW7lTmUDU1JiuEEW5tBXBdoQYnRidb1w+9ovfuMpn1aIvyyJ600
	q0zZqdpDIR3wL8cBimxP81fAJjhl
X-Google-Smtp-Source: AK7set/FeEH3SMp+xTRs7KN0rO4ziPX4ZU/IYrCCDHUXsFss9SGulRgXPV/twaTftMt+Opk3ZZcv+w==
X-Received: by 2002:adf:f405:0:b0:2c7:2cf4:baff with SMTP id g5-20020adff405000000b002c72cf4baffmr2283941wro.70.1677587199717;
        Tue, 28 Feb 2023 04:26:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id c18-20020adfed92000000b002c54c9bd71fsm9920712wro.93.2023.02.28.04.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 04:26:38 -0800 (PST)
Message-ID: <084ec45e-944c-32a5-163f-d2fe5666d3c9@linaro.org>
Date: Tue, 28 Feb 2023 13:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
 <20230228035917-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228035917-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DBy+PwBTCJtg

On 28/2/23 09:59, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
>> On 2/27/23 10:12, Michael S. Tsirkin wrote:
>>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>>> I feel like we should have separate deprecation entries for the
>>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>>> although they're related they are independant features with
>>>> differing impact. eg removing qemu-system-i386 affects all
>>>> host architectures, not merely 32-bit x86 host, so I think we
>>>> can explain the impact more clearly if we separate them.
>>>
>>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>>> a superset.
>>>
>>> Removing support for building on 32 bit systems seems like a pity - it's
>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>> and the maintainance overhead is quite small.
>>
>> It's not that small.  It only works for single-threaded system mode.  It
>> silently does not honor atomicity for user-only mode, which is perhaps worse
>> not working at all.

Will the same occur with 64-bit hosts when we introduce a 128-bit 
target? If so, there is no much code we'll be able to drop,

> We should probably block multi-threading on 32 bit then.

so this sound a user experience fix.
