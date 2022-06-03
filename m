Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5711098lfh;
        Fri, 3 Jun 2022 08:34:20 -0700 (PDT)
X-Received: by 2002:a17:902:7c03:b0:162:1a2d:5b2c with SMTP id x3-20020a1709027c0300b001621a2d5b2cmr10561585pll.107.1654270459725;
        Fri, 03 Jun 2022 08:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654270459; cv=none;
        d=google.com; s=arc-20160816;
        b=Pd4fUBJ12pQTdo5Q+WO3zU+fB15Dui0r18YnGaZqpmg+Q6RHHPlPeOlp2BOvd4+7Cn
         DueFr0tsAwHjsfMdC0NUCCD1Dcz1Mf/OQhPi0ggQFZAPjTti8Lrg4ahBzevBfgJws7pF
         ConIpv8IApHTbagBIJT9XR1Kcu1FUOBUH99MIxkS6cF+NJLcNMnXyCG9YdAAhABd+m+r
         kEhPVTVup6zC8UOGowgWqbfF3i3Hfk8HzmNg/soXcGPgESwbchwL6p9knwycR1KeJNEe
         MJJCQF6hWpfyu6WwCbSlNnC4EEjyobj+rVWstpHDx94MYNxm1Uq8EZfm6lz8QNPJdyPZ
         3Bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eu6Ka5fs2jm+BFFRMhEXnnCDkOe9V+sSnXtefqD7zbI=;
        b=Z8mQMAIT08P2ezOAx28edwsseed3vRUeJD5knLihU/W976Ly80SlWVJgFZyXStl0hg
         yzjr5gOGbtjCQ5nLcAv/rQXhFyDYkakd7Tav7Ji2Iq4F4VIYSQbpaRDhZi0mfGIW24vN
         hQAsIklVoNlZsFZMUg5I1C5h/EGBM/NYjdo+TYb5QqUZNNk1ECRlUEQiGOCQyhJqPXY3
         J1kvup0VbqlYsl8D6/y5uR1/xLoa1GoWSj0zi1Mb8s+uX9QnAsgJO2WchG7VQNUzvnpC
         8JMKt1eDS0pKc0/NYsYwK8X5zt/Wn3hjPzU7vesQWI1iMKdDZ4/0Nvkm7ZZ7n2BfrR56
         q/xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGmtW2ip;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w13-20020aa7858d000000b0050605a926c3sor4341320pfn.26.2022.06.03.08.34.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jun 2022 08:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGmtW2ip;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eu6Ka5fs2jm+BFFRMhEXnnCDkOe9V+sSnXtefqD7zbI=;
        b=JGmtW2ipEnzHH6q5J4O97iBZ42ZCmOCqI9a34Tveqkdek4dfUz4+PKxRUCOkmfPFmy
         ECzuEJpN8IYs7phTitmEAaDMAjgNANRCWDiLDe+k0gheM8PokGmzVLOiC+O/qojtisYG
         lT5E6cy2Pnc6waMX08afnkY3sSmT4y6w3nwJRWz/idr/12BhLglMVnEbxLhoimtug6/K
         0neRlosvR5E45XNazA2i8aWsxFLFotAb/6wxll5DHWEcwWHD6+Q9fnFLnBJ8xeENyRJ3
         yxRnRMM34pJkaMAhktL62Y6EQp2WZcWYuBMBTKEwvEf1P0MuNnXRh/KXdOXefNp8TC4B
         zu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eu6Ka5fs2jm+BFFRMhEXnnCDkOe9V+sSnXtefqD7zbI=;
        b=QYAF7+wPxEkuTykCGwT0gpe6q0jEJl2N9QnxTa2eGSLd8Vr4QCWecz97b8Fjr/qfQ1
         NE10r6zq26Q6l865s+9EjrDEkezAVrP9bT/0cmvGcvPmf75V9/IXi7yKN1qHLvt/KDHQ
         kiQIm/NxysCDrxMzObUVlBlCIMR02IBIZqJRy7xn76likPVsSLDWnkW1/Ts4DzDOWc2h
         xV7fMOkUwny+RRgPxKoBvRzzhZr/Hdr9laGaiAEXMLYsi0ZzjfFMorRSkci14aJcdC4d
         kiR+dCbs2TbQdzgVl6G/WflzHQzEKDrPbtRL74APHYoG0crz68JbDBhyt1pv6deuiB+U
         jGPg==
X-Gm-Message-State: AOAM53114Z5HtFMpUx8FQs2TdNmgpTw+Nxj690T82PXB+RotGgmmndfm
	ZNQZy4blySJZNZdsBtikjp0Sq3e83ubZkie5
X-Google-Smtp-Source: ABdhPJwA4UNLIaN2xceQeUWjr/IWQaBZu0vE+8dWgN+c5EWSD0raEd8TG8hAdr/rOmrj+QUiX21Zig==
X-Received: by 2002:a05:6a02:19c:b0:3aa:1bf8:7388 with SMTP id bj28-20020a056a02019c00b003aa1bf87388mr9420811pgb.455.1654270459233;
        Fri, 03 Jun 2022 08:34:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94? ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b0015ef27092aasm5537026plk.190.2022.06.03.08.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 08:34:18 -0700 (PDT)
Message-ID: <7c4ecea9-3c63-e429-eb6f-44cb32cca147@linaro.org>
Date: Fri, 3 Jun 2022 08:34:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Content-Language: en-US
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
 alex.bennee@linaro.org
References: <20220603092505.1450350-1-drjones@redhat.com>
 <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
 <20220603150536.pt5jwmoeoqfkeixu@gator>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603150536.pt5jwmoeoqfkeixu@gator>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: m1UuugnFasOS

On 6/3/22 08:05, Andrew Jones wrote:
> On Fri, Jun 03, 2022 at 06:56:41AM -0700, Richard Henderson wrote:
>> On 6/3/22 02:25, Andrew Jones wrote:
>>> The max cpu type is the best default cpu type for tests to use
>>> when specifying the cpu type for AArch64 mach-virt. Switch all
>>> tests to it.
>>
>> This won't work without further changes.
>>
>>> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>>>            """
>>>            :avocado: tags=arch:aarch64
>>>            :avocado: tags=machine:virt
>>> -        :avocado: tags=cpu:cortex-a53
>>> +        :avocado: tags=cpu:max
>>>            """
>>>            kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>>>                          '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
>>
>> For a release this old, we'll see the kernel bugs wrt FEAT_LPA/FEAT_LPA2.
>> See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")
> 
> Thanks Richard. How about for each test with guest kernels which don't
> work, I add a comment about LPA2 and use '-cpu max,lpa2=off' instead?

I would prefer to test new kernels with max, where we might actually test the newer 
features.  Perhaps keep one older kernel test around, to make sure we don't regress, but 
don't pretend that it can test more than what it was built for.


r~
