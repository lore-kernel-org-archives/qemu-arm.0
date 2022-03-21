Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1077336lfb;
        Mon, 21 Mar 2022 14:55:03 -0700 (PDT)
X-Received: by 2002:a1c:2b41:0:b0:380:e379:b8b0 with SMTP id r62-20020a1c2b41000000b00380e379b8b0mr951852wmr.87.1647899703074;
        Mon, 21 Mar 2022 14:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647899703; cv=none;
        d=google.com; s=arc-20160816;
        b=Ii7h+KHo86Lx0ZeY0+6ZE9CjfGOkHsCe2r26gMfhvuAgjjaMdgstgYOT4utONvVQCQ
         USmijzI4J9t2lVWrHEFAwHDUlX9HvX5Y6p3x1rnPqs235D6YaZVKGTeJBMe4ZStfe9QB
         /BC4AWIkIh/ikHm1pQVEBE2l7VcecF8es+290RzfDSouhV8mwyRNUY+Rae6TXjfHnZWj
         QbYNpRqwsLvKMjpLX5D2Sxyy13GrLtRyKebJwYMBFvA7M/rJaEvppC0sPfkn0phH/SSJ
         BSfitFiElHCxk0Xx8MS7+uYFDCZ5037/is++TQfYX6cVzUH0rFTVyOf9kOCTBIiYfK6c
         3p8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gScqlb2rCIc6WPHLCKIeAXIxeCHOKTICQ+ZFanQilDg=;
        b=MEEAYRdfiZpL4wQMUoVoQV1QcSy+lv/sRez01ZIC6hh7GxrL+XfNOcGHdlrg2ENd7J
         SHb7hXq/FQrmv9Oxp2xItgY4yulNcbd80LcC59eo/21fhEBXAQ0IyDyC4sroEdqCyzbK
         3UySWIYKjbQ4Bf9S50c9nn8vKRvZTGgsiJKCBPtz3H+kmPZ9N/G7QcrjzqS1xVvHfsgt
         i2AKMUGlkqdB/zhT0SsGwOYDeKdF4WgBeS9Us8DUEPpdJEt0JGquncGWRZ5ckhPFZLHz
         R3OjUGc5q66UIuHbMGWaEqcCSoD7T31pHrcOaGRF2dOSZVQR2ZgYNFLNLZkP7pToF/xh
         pmdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJaKN13t;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd11-20020a05600c1f0b00b00381410c0ddbsor125149wmb.21.2022.03.21.14.55.03
        (Google Transport Security);
        Mon, 21 Mar 2022 14:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJaKN13t;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gScqlb2rCIc6WPHLCKIeAXIxeCHOKTICQ+ZFanQilDg=;
        b=UJaKN13tBasLcAUOKZaZS4k4xEqLa49hsTBVnf7Koof4tYVChaxhcBZfbxhwUx5zjh
         UlxxEvyuSr2wJlMu2dU2UWJ56va1BCL0jmCLIGajEzkBqIwQPh9iyYwkLeRzYfOBKE5E
         iPJPtoHDhSS6ULuc+7gVkqQ8u+s/9Ccmjih6yGhe3mxQJq0cw84aATdIlFFxSsR8PPbb
         e3yiUsl8vXXfN++ta01BrsT5gl0ACYKLRuz1uvYCUyVjMFQOLBf+Kj34h9uckpvzWudD
         P4KHy4ph3fny2sfoc9aWPre3oKXgMpsHTJXG2pFeyl63Sr1CtqIgOkXXMWx70QmVJ3bC
         jqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gScqlb2rCIc6WPHLCKIeAXIxeCHOKTICQ+ZFanQilDg=;
        b=msmr3LBCrvdXjR3fFhyOZCj8J2yvyMbf3Mntqyy5KaK8coUsy8GuxG1TGWYvH2Mjw4
         U1S9AUabNmlmalnx9R4tgkgho/HxcSbV/1Hi1uCMdUNamQXQ5Q5cjLJG46W8OrV6dT1Q
         gn96aGEGRDbREr3kZxUpDqsw3kXglm9fi9BoPY2I98XtV0Agta66H4X0byLst4Yg911m
         aNJ+ISHx964qmMMMSv1MUpwChrNJe4Hiv8nfKyZ/sZyhmy4L3TITb96kOw61KKQ5HNBF
         1DNHbtWy6oF1C4OCDl9HbqLSwRRmhJQ1ggio4sMWgC95BJUH00mpOEw5fFXIh5BmuOqV
         h2SQ==
X-Gm-Message-State: AOAM532wcYtngEJjGK221jdclAbZI9JbKnhQNKhQIKWxBWKmEsBz7gU6
	7dr5kkTo+iFa96NtXg3zQ1s=
X-Google-Smtp-Source: ABdhPJxvjRMWSHHVLqjiJ36FLzbC0YF/yo8vjhwxaux2v9XHKhuymTxVefmcDpx1jFNPWIL28kQr0Q==
X-Received: by 2002:a05:600c:4e12:b0:38b:b715:18a6 with SMTP id b18-20020a05600c4e1200b0038bb71518a6mr953768wmq.17.1647899702708;
        Mon, 21 Mar 2022 14:55:02 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net. [83.50.65.198])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d598c000000b002045ff40259sm403774wri.58.2022.03.21.14.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 14:55:01 -0700 (PDT)
Message-ID: <19196e24-5596-428b-2b62-9ac902cbb6ba@gmail.com>
Date: Mon, 21 Mar 2022 22:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 sw@weilnetz.de
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
 <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com> <87a6dr48n2.fsf@linaro.org>
 <YjCfjmxMnGZYGGv6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YjCfjmxMnGZYGGv6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RO2kjxKqvUJH

On 15/3/22 15:15, Daniel P. Berrangé wrote:
> On Tue, Mar 15, 2022 at 01:59:59PM +0000, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> writes:
>>
>>> On 15/3/22 13:12, Alex Bennée wrote:
>>>> Another cleanup patch tripped over the fact we weren't being careful
>>>> in our casting. Fix the casts, allow for a non-const and switch from
>>>> g_realloc to g_renew.
>>>> The whole semihosting argument handling could do with some tests
>>>> though.
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>    semihosting/config.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>> diff --git a/semihosting/config.c b/semihosting/config.c
>>>> index 137171b717..50d82108e6 100644
>>>> --- a/semihosting/config.c
>>>> +++ b/semihosting/config.c
>>>> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
>>>>        bool enabled;
>>>>        SemihostingTarget target;
>>>>        Chardev *chardev;
>>>> -    const char **argv;
>>>> +    char **argv;
>>>>        int argc;
>>>>        const char *cmdline; /* concatenated argv */
>>>>    } SemihostingConfig;
>>>> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
>>>>        if (strcmp(name, "arg") == 0) {
>>>>            s->argc++;
>>>>            /* one extra element as g_strjoinv() expects NULL-terminated array */
>>>> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>>>> -        s->argv[s->argc - 1] = val;
>>>> +        s->argv = g_renew(char *, s->argv, s->argc + 1);
>>>> +        s->argv[s->argc - 1] = g_strdup(val);
>>>
>>> Why strdup()?
>>
>> The compiler was having issues with adding a const char * into the array
>> and it was the quickest way to stop it complaining. I'm not sure what
>> guarantees you can make about a const char * after you leave the scope
>> of the function.
> 
> No guarantees at all. This method was implicitly relying on the caller
> never free'ing the const arg it passed in. That is indeed the case here,
> because the arg came from a QemuOpts list. It is bad practice to rely
> on such things though, so adding the strdup is sane IMHO.

I see, thanks.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
