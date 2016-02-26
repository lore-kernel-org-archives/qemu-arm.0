Received: by 10.25.208.211 with SMTP id h202csp11229lfg;
        Fri, 26 Feb 2016 12:08:34 -0800 (PST)
X-Received: by 10.112.134.202 with SMTP id pm10mr1285332lbb.36.1456517314526;
        Fri, 26 Feb 2016 12:08:34 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com. [2a00:1450:4010:c07::241])
        by mx.google.com with ESMTPS id 63si6823639lfz.13.2016.02.26.12.08.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2016 12:08:34 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) client-ip=2a00:1450:4010:c07::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x241.google.com with SMTP id i75so1042691lfb.1;
        Fri, 26 Feb 2016 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=90bTyzKoY4YGYeJKNOFeegk+QvzFP51vbKSrbOnAxU4=;
        b=FsyRvXgD035ogNz8qwpVjH4Iv1JjR/LaYW5aZwn9Z2oSlCQOP0d0fLaB3DrhyILyUK
         ZKZi39wZm4EqGQPaxqE2cj02+BczhyPmCobYpE7YxIf0l6ic7ZMWHk/gpfdh0wuqDHTn
         NPr9IHosXpeRG5r94736vT2O2keeunlRffHpQwk5+M6RLlQoZcEkFwDzM2YM7e6vTk5p
         Gq7U3yeHuk8Gda4/CHK+qldWI7D5wGRUfzf02XGvKbDTFwP1YsfC6Hcr82t+wBc9hezd
         iS6Z8pK54ojcmAgRCnZXOHdUSlyK4oOZI33d9Qd+ueVIiNFSi9+KHg0wv36pvkGNaxLc
         7sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=90bTyzKoY4YGYeJKNOFeegk+QvzFP51vbKSrbOnAxU4=;
        b=Jm+NrxGrWv4wp7h+WsN5MPqO/V9gIWnPvBbVf6BEw1hpVIy51OCfmON6TEjSbh4liO
         HMinCPth1AxQn21aMkfOX79WpTIF7UYCiwIpO7StiStmfqcWvTplPvr8AiIt4WrFhfpR
         /d/u6llKwJHNLNRACRh60NHqLu9l+mw+JfqtI2yt0ocXxfx30v5T6SYMuRZd21L8HTyk
         IuRYRnQvu0EcbfTZrJ2gFfK8ZnHhetMAkWUvYlFX5k2ooua9Jemzpf/8UBXt78JsAPd4
         hY7JC7B6BbN4NJ7HedCMyUf0nbNlF31w4nCVILNdqr6RJKg5YUjn3YuRbPx/NPoKkl2P
         Y/wA==
X-Gm-Message-State: AD7BkJKG10F1IsbwRZVbaTXnJ6bd+y3AsOsQxGLlNkqBlY1Fr31NmOmIM+MqYcu8NAFUJA==
X-Received: by 10.25.141.130 with SMTP id p124mr1369079lfd.42.1456517314194;
        Fri, 26 Feb 2016 12:08:34 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-121-154.2com.net. [46.188.121.154])
        by smtp.gmail.com with ESMTPSA id f196sm2058955lfb.49.2016.02.26.12.08.32
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 26 Feb 2016 12:08:33 -0800 (PST)
Subject: Re: [PATCH v2 4/8] target-arm: Add more fields to the data abort
 syndrome generator
To: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
 <1455912292-23807-5-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA9c7OAF1Lqw1=xd3n+ipuYvo_9AW42wW0JwXM+L4e8iww@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D0B0BF.1040804@gmail.com>
Date: Fri, 26 Feb 2016 23:08:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9c7OAF1Lqw1=xd3n+ipuYvo_9AW42wW0JwXM+L4e8iww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MDpQwJfGoeD/

On 25.02.2016 20:41, Peter Maydell wrote:
> On 19 February 2016 at 20:04, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>
>> Add the following flags to the data abort syndrome generator:
>> * isv - Instruction syndrome valid
>> * sas - Syndrome access size
>> * sse - Syndrome sign extend
>> * srt - Syndrome register transfer
>> * sf  - Sixty-Four bit register width
>> * ar  - Acquire/Release
>>
>> These flags are not yet used, so this patch has no functional change.
>>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> ---
>>   target-arm/internals.h | 20 ++++++++++++++++++--
>>   target-arm/op_helper.c |  8 ++++++--
>>   2 files changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/target-arm/internals.h b/target-arm/internals.h
>> index 34e2688..4e9d9f5 100644
>> --- a/target-arm/internals.h
>> +++ b/target-arm/internals.h
>> @@ -383,13 +383,29 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
>>           | (ea << 9) | (s1ptw << 7) | fsc;
>>   }
>>
>> -static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
>> +static inline uint32_t syn_data_abort(int same_el, int isv,
>> +                                      int sas, int sse, int srt,
>> +                                      int sf, int ar,
>> +                                      int ea, int cm, int s1ptw,
>>                                         int wnr, int fsc,
>>                                         bool is_16bit)
> Everywhere we call this (both now and once the full patchset has
> been applied) isv is a constant (either 0 or 1). I think it might
> be cleaner to define both a syn_data_abort_with_isv() and a
> syn_data_abort_no_isv(). Then the no_isv version doesn't need all
> the arguments that are zeroes.

Alternatively, we could define a function similar to 
LSInstructionSyndrome from ARMv8 ARM pseudocode, but which will pack the 
instruction syndrome from its components into a value of ISS<24:14>.

Best regards,
Sergey
