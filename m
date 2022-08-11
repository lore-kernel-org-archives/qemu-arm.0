Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp492350ejf;
        Thu, 11 Aug 2022 05:42:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bQ1fcSMnF7d+dgx0rH3vcK0NCJ41ot3chwodrMdirR3N+19hiosOEnLWFlJBKvf91LVFq
X-Received: by 2002:a05:622a:344:b0:343:6a5f:321 with SMTP id r4-20020a05622a034400b003436a5f0321mr1103604qtw.204.1660221722266;
        Thu, 11 Aug 2022 05:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660221722; cv=none;
        d=google.com; s=arc-20160816;
        b=JsLVjQIedMhfX61t5B0ts4hUly1KHQI+tVYc8vg0bVnR8NplxRcgDrBAccP88Kqsro
         cTdU85Ll3R5PN53vRBvIbquxDShl+lfMgG472Jw0GkXnq/MHdA0bU3zyLyqnrRC/u5CB
         EbUYQDCk5FV+RjjbvF3H2ptT7J+tjSeC6y58O4jCDcqQ72uUWTK+KaKQdO/XS8aSlPTA
         /49YY0+u3rEB4FvP1f2WHUEZy9Yk/iz/Ui07LS4RQmLJCYre7hw8dGW1TTA34L0CVSYg
         2dZ0fyNB5d8XT2zywo+Aw8TvCNEah5kLbIINxt9oA4mfZBe0AihSpvf/NwYdI6DVpt8Z
         Yapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=DRZdplP65aSVFxdzUnuL6d9e2ZwwY00UepznGtjbs0Y=;
        b=fhsIlWr9TFta20/6oP4lCthCP7urqh9RgYzlm21StFfknMJ4aitKxDZ6S7wEIZzw4m
         6vCOUuPrFdmOt7Cmf+wRPsVnWTWg6IKB58JrcZaRuO/F7R1db/QqFIuDmr0i1Ev6na3E
         UTZwQfhu0EZ3hIZnoMNvIMW2wBl8n9+P0v4erKkD9N8UV8twrqKKXi8i0hQkt7QXzQTb
         elGltR6gzQPFFPAqMjv/znalWnWlbC8XRMCc+3/nac8xIZ4uMbvSD4lMvMsKLc/VvmFo
         i6xklPioE3GBw/KZxwj+zQZ49WecG18w3UwimQBNCaz0EOh61pcY0UNkkwKazvAruK8Y
         C+eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a284500b006b5f3b128f7si1563415qkp.698.2022.08.11.05.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 05:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oM7Vh-0002zN-J4
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 08:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oM7HR-0002nK-UF; Thu, 11 Aug 2022 08:27:19 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oM7HO-0002Zf-Ap; Thu, 11 Aug 2022 08:27:16 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWAjC-1ntxW03qFW-00XffG; Thu, 11 Aug 2022 14:27:11 +0200
Message-ID: <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu>
Date: Thu, 11 Aug 2022 14:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
 <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tvxVU4RzFpVuizZc770n++fe4/9A+cu0WFwgj+hfGk0wa+v4saM
 D9DVUEKvCF+bKpsJynp1mmciZgj8hGxthY+PUGXiuJY+MnRnIPs1OeHOcpSi0JW4MZFI/Lr
 guhO0YuUfhwaOuP0rD/22Ia4DdvrZCr6AKMAM4dbrVPq9HKchWT6FX7dvW+tNPYNkqfqUsK
 h64/y5c0My00Y8HEPoaJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gl8jwqK0ob0=:VRSHlsPLvJU9hQPCUVkz6f
 vrw3WIb9lXi6ekIYlXbSqgM716Ms85VOE8qmHgWAhjMGiENCA3GSkHwLOmEhY3gqhsGwYy2mH
 7K4oFcPS33Gvlbg3jI3OChwa+NXBCvSP/cDjJu1iIk/NuVJOGo7B2pJxvZIL/XzNGKQG1WtGp
 yAP+Bf45lyMI/nHgGWg6l07kCcERkUn9FVN93zBygTOloc/8Ze3zSyICOcofsivwXvjjZkNmU
 nzSe2lpSKYWmr/YqFZiT5bgLh3iqFB7kpWsSdRFvLg6ZmGn/6k5y3H8M1a/rEkXxSYBsXPR28
 Y4SX/bUuMRUodpfPZT+EItZPKfK4Trq8kpdQXAjaK0qay6c3IXaxqp8VpDr+g7pOZwenbq1/0
 YIq+j1WpsHUqFggEObpKHqMpolKKNMGuVufHkcBHeK1uyGlUY/rewYbd7YrjzLC2Be6y8QWSP
 BQlTNnBcOBQHlC/605odZb8+aCEDPKTwDApI9VtKRiuE1PM4G60mfaVYBJfFaht/TBt9TqQwq
 imKEVTdGUpwAgRt0wFfAanuJFn+2IJkSOoEruVqnMqMwR2/6gqsujnea02K3WNfyNeCeelgDH
 syjcdH1HeYLXoznr+wrrjhr879o1ewK+8ZoGce15wH0KN3FrqNpRBUabF3J0JIsE9hrD5dlcv
 z7Msg4E6U01NrD63M29eDJUOozx8HY0wj3l/ZY6yMyxCD3OpmsepoOXx7E5RzASJ432EEkMFA
 9rrzu8YdTOvPwPwzZZtClIu49mhtwGPHxWB8cQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Xedha2wPTMp

Le 11/08/2022 à 13:54, Peter Maydell a écrit :
> On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 10/08/2022 à 22:47, Richard Henderson a écrit :
>>> On 8/10/22 13:32, Vitaly Buka wrote:
>>>> Sorry, I only noticed today that it's not submitted.
>>>> Version is not critical for us, as we build from masters anyway.
>>>> Richard, do you know a reason to consider this critical?
>>>>
>>>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
>>>> <mailto:peter.maydell@linaro.org>> wrote:
>>>>
>>>>      On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>>>>      <mailto:vitalybuka@google.com>> wrote:
>>>>       >
>>>>       > How can we land this one?
>>>>
>>>>      Pinging it a week ago rather than now would have been a good start :-(
>>>>      I think it got missed because you didn't cc the linux-user maintainer.
>>>>
>>>>      Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>>>
>>> It's unfortunate that it got missed.  It's not critical, but it would be nice, because support for
>>> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
>>>
>>> I'll note there are missing braces for coding style on an IF.
>>>
>>> Laurent, do you have an objection to merging this for rc3?
>>>
>>
>> No objection.
>>
>> Do you want it goes via the arm branch or via the linux-user branch?
>>
>> If it goes via linux-user I can run the LTP testsuite but it takes 1 day.
> 
> I think we should definitely run the LTP testsuite on it, so
> taking it via linux-user probably makes more sense.

ok, applied to my linux-user-for-7.1 branch.

Running tests.

Thanks,
Laurent


