Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1043335ejy;
        Fri, 16 Sep 2022 07:49:53 -0700 (PDT)
X-Received: by 2002:a63:db42:0:b0:438:f2cf:2c8 with SMTP id x2-20020a63db42000000b00438f2cf02c8mr4863305pgi.192.1663339793637;
        Fri, 16 Sep 2022 07:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663339793; cv=none;
        d=google.com; s=arc-20160816;
        b=StfegUTOMWXeW6K9wazkg/Sy5aJaXWkPF+7IaCQJ4tscYMh5B+bnrThp1XRM/eJbV7
         DylV6sblki4kFR22CuzH6MviY/SNKUp7R1hYjWdwWr2ANSjyLldjk4bIuw+nQ64B0o1t
         sYp4ar1aBkjTmKZlRU57BpgjYbtmXVKA/jHzZfuaNaPoXVgO9jB7pKoL4QTrOrnI/m3K
         zOBi8RYQZ84puyDSmWy09djhY4levgURnZF0ndwfifTW1kWzGqBc4G7NuCgrl5KcZrJi
         5aTmHvP3fou8yd8HoFHCi2i3K3AXFNg+gdDPHbM4kAKWOzyhMO28XJnX/YjJZemQZ9t7
         mI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=Cc9sHu2/LbuOvpJmPx8KZ4L4SU0wr9IfsnBM4ucc7K4=;
        b=J/2aH6kKUJlu5AgNZF07WtGAej8gPTY6+Hyb5uc7RQ55qKlpVBNFp8slVfc7Ix0m6B
         aDv77pOM52ndvGC1xtUeQ4zyHrgA8OtOLTiOuCgNB+dcVlnbxodXPb/6msvEpMXqv/tD
         OuLSz823kp304QyugKcygmppG/KtVkl2T0jW1WYrYD9WEIhvWh27J5fQZK5JwgO3js/Q
         m41UuervMKYSCcMQv1+uUbiqkOI9b2/X2wGLux2rwiNjt17uugi8OZDLcl/NeEalUNGO
         s11pQhNLN6sWc5WRXI/s8k5fcCrAZQsg0lT8376RAoBZbH8qQfo7E5M2gfbqHUtg9QZn
         RuKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jyZas1iP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i6-20020a170902cf0600b00176b888248fsor9108754plg.103.2022.09.16.07.49.53
        (Google Transport Security);
        Fri, 16 Sep 2022 07:49:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jyZas1iP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=Cc9sHu2/LbuOvpJmPx8KZ4L4SU0wr9IfsnBM4ucc7K4=;
        b=jyZas1iP+5Dq98iefCET3BXXZE63KjNYAutCW0m6yl0hGgZkXwk2vxbyc1ZTlOIK/9
         WGzYQSj/yAvyL/5MkVdn02WWFKoyX5SMu5JerTeDqDccfNwCVlucfRqGBafIqUYbWRLZ
         MLCNOqMgFeLOgLaAlOSCgXdD1o9PhoxD2JEyY+baau2OFcGz3Iy3MYgusoGeN+Mt50jy
         SrXKHIq7COBYV1D6IdUwJP8fU+/4F5jjba2rRd55bMkCIqPkN5x7gQPBgSTvX43yZjR7
         LOtle4+2A7v5PJFLdhUGsYdRFOkLmla0FosEs1sUIQ4USfUpOpRerHC9V549rPIFfI4i
         T07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=Cc9sHu2/LbuOvpJmPx8KZ4L4SU0wr9IfsnBM4ucc7K4=;
        b=QE+5l19IX6j8MgMdRVbJVpDO1kKO52Z6tUkj1JW4UtjRa+c03NsnGWy3lB6fzibYBp
         8+3MBYSBiE2NUko4KCYYm2EtpSbYo05ljrvt8b7lCXhSOO48H6R/5ZLebOKucwE4AH6n
         rDMG2pI0djxYXqTsgEC6LCIlWbum4YtS9h3cPxK41YkCzCPqMNMBjGx3lLywc0GjUFjd
         3qb/elUYYtB70OmjlcGd+dqPkZRvZuRIbhNxmpJl+0nZNcuKe+wONuVEhbciaKDzDD2v
         gVXD73RHr2gJ5R9FidKjzYbTBxzUOa3+NTYl0hy2en6AY88IejM2mlPbGJ/NbOetUH+v
         9JCQ==
X-Gm-Message-State: ACrzQf2/Q3OCDG9NLmrgTSx9QsbtnQ4TS4aCb4U3iHwPmTKaEJXxF6kd
	4Pk3xWm8QCavIG/uiqxKmcIv/CoXGUzMsw==
X-Google-Smtp-Source: AMsMyM53VeSWQo0lpOV+bMYlnLgXQZIAE+qn7Z7++KdcTevJUoxumml/tHtDZw6yHu1f2gMDBFLqKg==
X-Received: by 2002:a17:902:be03:b0:178:6f5d:e979 with SMTP id r3-20020a170902be0300b001786f5de979mr174636pls.163.1663339792855;
        Fri, 16 Sep 2022 07:49:52 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b00176b66954a6sm14947923pli.121.2022.09.16.07.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 07:49:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org>
Date: Fri, 16 Sep 2022 16:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
 <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 37/IP/AtsF6B

On 15/9/22 10:16, Richard Henderson wrote:
> On 9/14/22 17:09, Alex Bennée wrote:
>> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
>> This solves edge cases like accessing via gdbstub or qtest.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>> ---
>>   hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>>   1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 492b2421ab..7feedac735 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] = {
>>       0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 
>> 0x05, 0xb1
>>   };
>> -static inline int gic_get_current_cpu(GICState *s)
>> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>>   {
>> -    if (!qtest_enabled() && s->num_cpu > 1) {
>> -        return current_cpu->cpu_index;
>> -    }
>> -    return 0;
>> +    /*
>> +     * Something other than a CPU accessing the GIC would be a bug as
>> +     * would a CPU index higher than the GICState expects to be
>> +     * handling
>> +     */
>> +    g_assert(attrs.requester_cpu == 1);
> 
> Better without "== 1" -- this field ought to be boolean.

Boolean so far, but this could get more types (such DMA...).
Maybe we could already add an enum definitions, i.e.:

typedef enum MemTxRequesterType {
   MEMTXATTRS_CPU,
   MEMTXATTRS_MSI,
} MemTxRequesterType;

and name the field MemTxAttrs::requester_type.
