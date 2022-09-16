Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1038429ejy;
        Fri, 16 Sep 2022 07:40:34 -0700 (PDT)
X-Received: by 2002:a17:903:2595:b0:178:6b71:2eea with SMTP id jb21-20020a170903259500b001786b712eeamr146571plb.143.1663339234523;
        Fri, 16 Sep 2022 07:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663339234; cv=none;
        d=google.com; s=arc-20160816;
        b=uN5v31Dcc3CjfMWyIm3pJ9GcshBifGiQfH0KytlTSb/nFulE9E+lacpn3kteBoKDoL
         60qUYAMD2jwUyruL7UEGWt917dnbWRjD7xSytTq+2PUiNOF5Jk48lp5ieLCxNbioo+Qr
         TU2/JriSoPi0qe7urVkML4ZFAybFWBmGZt4+eHb+j35dBNAnP91OdG92As23E5tNRLhx
         w/KmSgJTbENI4+a2uZjVA1AnFrgDkTdVPVQhImDkAIYCsRbY1Ys4dCky4PEUkmHE83C0
         EnnriY8+CH7vT4OHmG9NBUN5A6y/WuMaQcCV3DNw/akkaCFTY4zWVECfqIKpqCrPDOt4
         +J3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=5IihWDj5b67Y9nHNA77Y/yguccHMnQZ4dH5/aT0IYkk=;
        b=G8az5rAATPdLFUQ6u6oc4V9kx4MKXzvG1xZ85v5E/SKlVzrpPJzLBq/OXct8++3GE4
         dK6L3cS3m3YQoDo91oxnrDWmzoJAZ45mnqwupP3U0EvpTl6FeSx/7K96X9ez40MHUTqq
         Z5CiFLQ59FsnKROZ//QVEjnNobhZAdC/euaCVBCqwJ90aYhkC55Mf3Y/BEFccKnHxJk+
         Oro+djCNLyBurkW7UDNf955XQEGSR6UMxUR3oA4RkWyNJ2gA+f1ocQc3OOLNy1tylTCs
         RHWOpXkBXGmTOYy/NHudmSzERt5C5MS1lJtzRvYS6PdDfiCkeoOGEzU4O5QG1cBg+NJe
         WN8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o208qKfK;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p54-20020a056a0026f600b005253736b950sor10197691pfw.45.2022.09.16.07.40.34
        (Google Transport Security);
        Fri, 16 Sep 2022 07:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o208qKfK;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=5IihWDj5b67Y9nHNA77Y/yguccHMnQZ4dH5/aT0IYkk=;
        b=o208qKfKiMFoWJcd1MhXVvZRCWL3ZM9VlaiSDq9kVQSsbi3fITK8cTZpRBXfpgR2lR
         vcBY0H6qPTu+ya2DXZWqmH/JPniW5fLBz6uqXn0D49qtHRQdwT4i4M09ujPtQqKddgOz
         XXdITmQOuuw/mZnlmBbwSch+r3jGnt8Ael/sscGLYFN5yS4V2ypHId18M1Etto9ak1/E
         JV5/XZ+AtzuOnpa6WZt2BxESy1nx7HNEOUfHBPZlrwY/hBH12UT7NMSp5HxWjQwkN5e9
         RIvht2nhJnmzmmXbXsj4g4oQdQkx8lW96Gkge+DnL2tYuPVvZRCuHkMWn4X7MoTJqHX9
         N7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=5IihWDj5b67Y9nHNA77Y/yguccHMnQZ4dH5/aT0IYkk=;
        b=GGTxoE3kYr+njn/V9tHtQDld9ZyeeRzdAQQG9BcfZPuVnuqzomteQe2mO+W26Kz+9k
         rhUAndqhA7je6E3zsYIo6xXfkR+ZzittQZPnqMzqaPjFewAdiD3DuxCU/wNR0xG0tqN+
         9jXhyTU0HYRqhHwwzzk867w/Pxpm8XpE+pITmiqrWQmepOjfFgoY3iCPTpGwVZnl93vA
         mCKTHoSxpeoSEG2KaNuns1C0tFLJ7dihrgCIEvonnYBkjiQ7WkiJhvKG9GE1HvjmlcLM
         tXgta/TitQmb/ZJ9yUNxyCiQWalnVy5EXdsSgjzgrL1B4qJsLYYCAy3Ctl/k02yumJNY
         ka1w==
X-Gm-Message-State: ACrzQf1YejRBUUPx9pLXq425gYM9I2Vcqob3z4JZIXluVCtk1n+A18Ku
	DzLAuZN5GbpWcXkzVgKgR8jGnV3AycddcA==
X-Google-Smtp-Source: AMsMyM4g+CP1mMbyazDO8kVEOdPQdoo6RhQhqT1HT9hkv1d0i4UZOwjVBU9FaSmkK0sxlvV8UYF6lA==
X-Received: by 2002:a63:6685:0:b0:439:869c:e16d with SMTP id a127-20020a636685000000b00439869ce16dmr4861478pgc.19.1663339233850;
        Fri, 16 Sep 2022 07:40:33 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id z23-20020aa79597000000b00540963470d1sm14728700pfj.84.2022.09.16.07.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 07:40:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <b80500f1-0ee5-d600-7834-22196baf5bfb@amsat.org>
Date: Fri, 16 Sep 2022 16:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 2/4] qtest: make read/write operation appear to be
 from CPU
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-3-alex.bennee@linaro.org>
 <c6d2e06f-75b8-0ba2-5e0d-51603873e40c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c6d2e06f-75b8-0ba2-5e0d-51603873e40c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DoSnayHss2aN

On 15/9/22 10:08, Richard Henderson wrote:
> On 9/14/22 17:09, Alex Bennée wrote:
>> The point of qtest is to simulate how running code might interact with
>> the system. However because it's not a real system we have places in
>> the code which especially handle check qtest_enabled() before
>> referencing current_cpu. Now we can encode these details in the
>> MemTxAttrs lets do that so we can start removing them.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   softmmu/qtest.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
>> index f8acef2628..c086bd34b7 100644
>> --- a/softmmu/qtest.c
>> +++ b/softmmu/qtest.c
>> @@ -362,6 +362,13 @@ static void qtest_clock_warp(int64_t dest)
>>       qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>>   }
>> +/*
>> + * QTest memory accesses are treated as though they come from the
>> + * first (non-existent) CPU. We need to expose this via MemTxAttrs for
>> + * those bits of HW which care which core is accessing them.
>> + */
>> +#define MEMTXATTRS_QTEST ((MemTxAttrs) { .requester_cpu = 1 })
> 
> Maybe clearer as { .requester_cpu = true, .requester_id = 0 }?
> Otherwise it kinda looks like we're setting the second cpu (index 1).

We could rename the field as 'requester_is_cpu'.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 
