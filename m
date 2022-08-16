Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1712033ejf;
        Tue, 16 Aug 2022 03:50:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7oU2Ggy3U8VZkHS/V8O3GMLA89JxXiFxSxsvxwRJxIR+mo8i6WbWDQnktxMMtXb2meGpe9
X-Received: by 2002:a5d:6d8f:0:b0:222:c96d:858a with SMTP id l15-20020a5d6d8f000000b00222c96d858amr10664346wrs.127.1660647025642;
        Tue, 16 Aug 2022 03:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660647025; cv=none;
        d=google.com; s=arc-20160816;
        b=sfhkEn2VnAoo5YTo01qP3atPbVY0pPcLFn2rMyyIMm1G1/fwWqTcAlycwHdmOfLL1I
         FQ30pgvVngzmjS/1h+KlmMn41EAMV3J4VspBCEakASdO8cs1zL3DWWCfZkf/Ee6likOu
         jtD4uxHBAAS35TnxAJc7CbzZ7u8qDsIP+vB2CDHMbqM6jRjTYJv4zVLeFHdL9lvln4h8
         g+0yPR/w4CMNQynv2Ici4iW4wI+id0Slump4atJe5vNsMIXoEDI1NQvViYGTAhcFhYGs
         nw/5EHvutGhgKQLZlXRSy1QYTweJxAzin2DEpr+mwxwKaqMjo3uga0U4EKielFyIPWR4
         OqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=XaGzZzqfhTfO/kwhwMlBrj8flISk3M4AxScYlWUA2R4=;
        b=JXSEYMCidK2dOsYNcb2zjG+RauBkXJmCE++i2TD1zVpZL+o8hr0JelkQd/Zwx4uO+T
         mOoI/LirwchZ/UR8GQWOpOtyUWDv3eEinvsyBh91NHZBGmgm6NIo6hzgoonPtthEHhjG
         UHe9qxxxJmiNHGvmuR5OCaj1FUeODMgkTCskoApLt5oK38fKrpCTFqQv743amz5qmoHg
         7mwvAqhOzcjR1Xg0oVdRUxMPsQn2QKSeifUhkmZyWcyd0xctJYd/GeUfv/Thch4F+mie
         MNy3zPZBzWh/NijxElTh+sSdxEPSi99RhKEW1RCIysYSFWzb23O07x33E6cOTez/Pit4
         l3wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id h2-20020adffd42000000b00224f759446dsi4193183wrs.156.2022.08.16.03.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 03:50:25 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjgfT-1nczfv3pCF-00lFUN; Tue, 16 Aug 2022 12:50:25 +0200
Message-ID: <cdf8a0a4-d196-bd84-53fe-5962292636fc@vivier.eu>
Date: Tue, 16 Aug 2022 12:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
 <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
 <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu> <87r11miz8i.fsf@linaro.org>
 <531cdb6a-f660-b671-375c-a3819d90c030@vivier.eu> <87zgg4bmwq.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87zgg4bmwq.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BLkwoyrF+1S4X3kARX+Z33hSL+OPE3Ch63e7rr+UrGFxCeKaOA2
 Lk9Rwj3r69sY4sf6eTa8Vaf8oPmwQlMSRZ5uvV37th6Z5DoeXV1TbioZimicWk+Crr7N6oo
 DHg/QhjyhPtfYwNKj/xtPMxbIsmhg8wMs//WnRT2AmjkemtBMv1vXb5YJ5bIxAoC4n42Krq
 bcItW0XfgoLFWXyzQBnjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b7jjD1o1Fiw=:ySSDdPB3uCKvYkt69cdNUJ
 kUwbM6ySo5N7oHXvfoJRCmb54sxV/DShQQVza0nLsjvkWKVbTLtv3KtEADUBiefNopWl2jtCx
 5N7TsCzsmBFHv3SmHtc1KDSmu+5nXZp0z5Ox81157OOTDB/gniXs5+SmEcSqkL7qnfIIUrPIZ
 s80lnZ3I6LY3V1K4nv+0nPycD4Zb+FWtayBVVJ93YR4LRjCYhagWRl99Xe+hCqsOQVQKX1vQG
 vILExMPcxd2tSexEPIV3R+u5JrqeLN3fTMt+ZQcQwNHvQg4mEEUeErYA5VspNUXLu7ojsCr3K
 7cx3ds0XAi/1iG6VhnpYkw83BE0llgecVEuisjtaS2LKG85/JBcYAF17eLtF20ftib9xnQ5Ce
 /CXJpLCxHkXxEYBVQXcmeSjpoTS36OOJnwwxG8wCvSa7w0h3QFHFUtflqusD+wV07o6NecNta
 ASbDNSB0+W2A9jsc0u4ZcgF+MB1qU/eRoUuSseGYkqevEO+tFnUsrQS7X5D2FZ5F58MhhBQo5
 RfJCQ4WYNgNvAumDnhZrfgNVN/AqOjR+/6RvmyXxVqvpJsQ0mRUu7OJiLCs0PFxU1ciQPmM0e
 hQ6bBS20W2b4cZQInWk3wD9tG3Qiv3BcPCIX+C/gV/zjB2h507QhwbyymWT/ZnL+GFbMKhoFL
 4IR+IeLmT/3crw1sQsqoWkYzN0IJapnhf82gctZOryb6/GhuDIF0kk+HMnFhdYb4gmmkSv0O4
 HizMkhrMku1cTW5gsgriQQSsFheqWX6wL13+UQ==
X-TUID: TuS8hWewY7t2

Le 16/08/2022 à 10:41, Alex Bennée a écrit :
> 
> Laurent Vivier <laurent@vivier.eu> writes:
> 
>> Le 11/08/2022 à 17:18, Alex Bennée a écrit :
>>> Laurent Vivier <laurent@vivier.eu> writes:
>>>
>>>> Le 11/08/2022 à 13:54, Peter Maydell a écrit :
>>>>> On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>>>>>
>>>>>> Le 10/08/2022 à 22:47, Richard Henderson a écrit :
>>>>>>> On 8/10/22 13:32, Vitaly Buka wrote:
>>>>>>>> Sorry, I only noticed today that it's not submitted.
>>>>>>>> Version is not critical for us, as we build from masters anyway.
>>>>>>>> Richard, do you know a reason to consider this critical?
>>>>>>>>
>>>>>>>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
>>>>>>>> <mailto:peter.maydell@linaro.org>> wrote:
>>>>>>>>
>>>>>>>>        On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>>>>>>>>        <mailto:vitalybuka@google.com>> wrote:
>>>>>>>>         >
>>>>>>>>         > How can we land this one?
>>>>>>>>
>>>>>>>>        Pinging it a week ago rather than now would have been a good start :-(
>>>>>>>>        I think it got missed because you didn't cc the linux-user maintainer.
>>>>>>>>
>>>>>>>>        Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>>>>>>>
>>>>>>> It's unfortunate that it got missed.  It's not critical, but it would be nice, because support for
>>>>>>> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
>>>>>>>
>>>>>>> I'll note there are missing braces for coding style on an IF.
>>>>>>>
>>>>>>> Laurent, do you have an objection to merging this for rc3?
>>>>>>>
>>>>>>
>>>>>> No objection.
>>>>>>
>>>>>> Do you want it goes via the arm branch or via the linux-user branch?
>>>>>>
>>>>>> If it goes via linux-user I can run the LTP testsuite but it takes 1 day.
>>>>> I think we should definitely run the LTP testsuite on it, so
>>>>> taking it via linux-user probably makes more sense.
>>>>
>>>> ok, applied to my linux-user-for-7.1 branch.
>>>>
>>>> Running tests.
>>> Any chance you could pick up:
>>>     Subject: [PATCH v2] linux-user: un-parent OBJECT(cpu) when
>>> closing thread
>>>     Date: Wed,  3 Aug 2022 14:05:37 +0100
>>>     Message-Id: <20220803130537.763666-1-alex.bennee@linaro.org>
>>> before you run the tests?
>>>
>>
>> I've tested it, it works fine.
>>
>> Do you plan to do a PR including it or do you want I do (there will be
>> only this one in mine)?
> 
> I'm going to a roll a PR today so I can include it. Shall I add a
> Tested-by for you?
> 

OK. No need to add the Tested-by, I've run generic tests, not targeted to this problem.

Thanks,
Laurent
