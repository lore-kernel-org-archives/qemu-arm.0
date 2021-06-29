Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4996346lfg;
        Tue, 29 Jun 2021 07:30:11 -0700 (PDT)
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id p15-20020a170903248fb0290128d5ea18a7mr11435378plw.83.1624977011482;
        Tue, 29 Jun 2021 07:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624977011; cv=none;
        d=google.com; s=arc-20160816;
        b=McbOZgHXLsDfSi+sbUZ3/mt1QwvRALK+4A8todkOdUAV7gaZGR9qNIWIsi93ZoBIG+
         oR7c1my+PRAzVAMxqiL32vsjogaN/oAya38DW9FKdABfSgHv4drtUFDy5Bp+fqeszb9E
         ASom/fsEyX9SeUyTJJ9kov471dR4ZN2MpUfZaKtJ96WGoa2DHcqSP9UKM0TztuBVvmeC
         QOYjnzi7MUYb7xH+fV/liV1+Do3LK9m9QFc/GKQ7Oxdgz9JLEczvMafDuNEz2ijxyqv/
         9PIp9OVrEox+l2WGovyZM6/E8hNAOotEs3dYhM1Hd+1wSJmI6MB4BDbIxyIQJhnE69V4
         4xGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uJ9HqMO2697to4vZ9XNe3EnzXOWf5jyma7zfl8CPKVA=;
        b=VuToSTJfTYyejy4WhzaDPUH0jrvrrOM5OcU4BlyIYauyZzTh3Ba8oYTOkSYtRTWggM
         TEd4D6yJSpbUVh9sxLR+uM4nfOtQZQ5L6yoCW4ZCqJblpy9gnjr9lzWFqY8BbUIdBn09
         UGyntv76huK+DhiM5x7RQzGcAyZdSEOd8DPlmIjMxiyG6zItaYM9ePkCDGBhtY7t0Evy
         gAmkEvacLEAxXHpopADzbeLZjnMc52l4Ocf+UlCZ6v/7oJ7noXlHtCRdlqID02r4zR2V
         3wfsCjs/rb37IIqMPH9j1kd3UIND+CTu/omCp9bxxhi5YoZeZ+cOqUripmeI4+c5UkU4
         /1WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YzuEoaKm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q12sor7870458pgb.60.2021.06.29.07.30.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Jun 2021 07:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YzuEoaKm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uJ9HqMO2697to4vZ9XNe3EnzXOWf5jyma7zfl8CPKVA=;
        b=YzuEoaKmqQ3lJFe8lHw/9GsBPnT4Dht+sgpRpAUQJgwkEfniTKwGdAV3Gdww0ljXRq
         jPi4bKR4oQoAcpvK/5h7nhOq7sb4h4alpB+mzPGm4yWj4a76Rj/HA3jozSsrNHXj8L9a
         M3stxHYSf+GGwbjr1PcF/l4f+D8KNhglYc/+SdR8ZBoQ/gnIuzJ6g/YcmJkTJz1riBai
         8MGZrSbnVbJ0mcTFv7facTad1BI1RoNz8HoAIQ4IwH8sCCNwa4mUJVhfB3mfu0h7ueJl
         2DBWGWGhw82qQFahD/ScNTgKpcXAdk+bI1p5oNkwfWqC7+KpPYy/xBlFsZRVIwzqXB1j
         YhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uJ9HqMO2697to4vZ9XNe3EnzXOWf5jyma7zfl8CPKVA=;
        b=hmTslQmlvJ7564eYX2OaqCsyNgOhqiRmZev7EEXQvUW5EV5entTb02BGrLtKG5HHGd
         5yb34kDr8Rur//UizWNc4PWjLk63S3fZT/lR/iidZ7kjW8Pmd8xNvIHIYxKrh7fSO6F3
         ZfmEXZAZCxGvTe6cZxPOgF1s+Fw+OYZwtjRlq5zaI4IFkW1V0mmElDtj0wllfewL0a+o
         CRuSta4q4u/QVrzoVWIT5l1ZV9eBTCglAvQi82TawNFQOrUKBEaIVnGUWif0Id7lXTYq
         I7sFn7iS/Lq5S6MwPtNU997Z7dSOcCMRjuH1jX6erK1KgksCfnFRXzD1oYKs72IR6OQm
         iPew==
X-Gm-Message-State: AOAM532ptsloG0dYx80z9iQRp5qzsyoLyBtQoDDpJfvojGnfDMlLcs4b
	qnCOpJJ6EKa9FVOQfQXoUzyuLFc3
X-Google-Smtp-Source: ABdhPJwARwGNz+DoVFRG3P3+3Qx034XeQtp4NPxhByX13GzgKPWRf23OZbE2UM09bHvBQTJUUccOvg==
X-Received: by 2002:a63:3105:: with SMTP id x5mr24302478pgx.364.1624977010970;
        Tue, 29 Jun 2021 07:30:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id t3sm18004378pfl.44.2021.06.29.07.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 07:30:10 -0700 (PDT)
Subject: Re: [PATCH v2 03/23] linux-user/arm: Split out v2_frame
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-4-richard.henderson@linaro.org>
 <CAFEAcA92sHgV1DSKv6XaSBcuyaSfOLhm4OyH5hNsTJTVCx+Tkw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66be19d6-507b-8a28-1544-80727abdbadc@linaro.org>
Date: Tue, 29 Jun 2021 07:30:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92sHgV1DSKv6XaSBcuyaSfOLhm4OyH5hNsTJTVCx+Tkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: ftH4z59p4HW2

On 6/29/21 6:53 AM, Peter Maydell wrote:
> On Fri, 18 Jun 2021 at 20:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Split out a helper function to test for a v2 signal frame.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/arm/signal.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
>> index 32b68ee302..cb65623965 100644
>> --- a/linux-user/arm/signal.c
>> +++ b/linux-user/arm/signal.c
>> @@ -165,6 +165,11 @@ static inline int valid_user_regs(CPUARMState *regs)
>>       return 1;
>>   }
>>
>> +static bool v2_frame(void)
>> +{
>> +    return get_osversion() >= 0x020612;
>> +}
> 
> Not sure how much we care about supporting claiming to be a 15-year-old
> kernel any more (especially since we set UNAME_MINIMUM_RELEASE to 2.6.32...)
> so it's awfully tempting to just blow away the v1 frame support instead...
> 
> Anyway
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I hadn't noticed the minimum release setting.  Yes, I think it would be better to remove 
the v1 support instead of bodging around it like this.


r~
