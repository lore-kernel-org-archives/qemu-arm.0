Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1067899ejd;
        Wed, 17 Apr 2024 07:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXp09HhzKaWmvpXh49ZOo+ZtKgeXTmiftW0DYxumkd6paW1NJexFekHN3SM9BDmx7JfTV4bX9W1rTj/RtHhp/vi/BxtC5Jj
X-Google-Smtp-Source: AGHT+IGV/NwGFgfWaj4cbVdIpiFtPQb62kJaHrh/EBpB6+HueDa09WV9WLHrqmXlp0LBGzNBDk3j
X-Received: by 2002:a05:620a:144a:b0:78d:7474:9b50 with SMTP id i10-20020a05620a144a00b0078d74749b50mr16818211qkl.39.1713363657669;
        Wed, 17 Apr 2024 07:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713363657; cv=none;
        d=google.com; s=arc-20160816;
        b=az8jeJVivpDetnHogQhALJF6GSIZTXVnbxiOftZFCzooitfuyGiUiwz+DksEBDL+o5
         U7LgCUhz3TYWxBl7o/aYMAD1J5SipySx4ox4A10q8E/91Y8HT4uAQIg/4PQCEf7yudIh
         Dpgp5abofkUzT4GLavRfCujLT+PPOOJeIDb0MgXLhb6S7OMgH50aHz6rl1v/6RMeg8CE
         wDVMeRs/tGoAx1dvQ+eecYnFOLQfrO8hQ7cUMDF6OOcBwWH1Im+efgKr1tWlm/0FEk02
         4W2v8qRHcL6CTMAmWhhStOPgA7nBPIj6iuqQKEuf5Yc5tvO7J9c+YMWYxcq/sj+HKT/i
         ro6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=g64g9Pt7qYCOpYOwvn3RujnDyp9ytH97gIhVySUkEbw=;
        fh=5HFStlnE/6EFwEv8OHLWUbtTMx1h4xEyKW4UWaAWI+w=;
        b=MvPpOYkL5r5yafMiyqzf1qL9GIbvIPkekLuUA4PssMJFdQHQ3zx10zTNyqO+nuBJag
         RQOGs2e+O4ma+aB6EWaS+yLuqyqZATTtS2nfcTf8A2ZQO2su1mS0YH7WHyrI/rSo7PL8
         sMqA4wLbxxnM5P6urmDkl5c0619U3AAYGk0tvEJ0vtdfXQTBYLaMe9Abzkiuqxx4gXcU
         Wt2HBV0TiyimTkRbEAmEToJt/o9gGOxHxMwVg5Kf5N55rcnzEbnJcXzW/NpfVMekUcWl
         hpk1DYEDZDtjIkWPO2cciPBSTWxFRDSZa3bIIfwvcBRMvU1S0LMEwRYY5+FRXQZw2/Sx
         j2bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AnM8JlPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020a05620a14a700b0078d66dda599si14767130qkj.532.2024.04.17.07.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Apr 2024 07:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AnM8JlPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rx697-0000Ki-Pv; Wed, 17 Apr 2024 10:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rx693-0000IP-Oa
 for qemu-arm@nongnu.org; Wed, 17 Apr 2024 10:20:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rx690-0006pN-7v
 for qemu-arm@nongnu.org; Wed, 17 Apr 2024 10:20:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f55so3824925e9.2
 for <qemu-arm@nongnu.org>; Wed, 17 Apr 2024 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713363612; x=1713968412; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g64g9Pt7qYCOpYOwvn3RujnDyp9ytH97gIhVySUkEbw=;
 b=AnM8JlPjLg/KW/dBfYha08dPX4cO/ulcd/BWZVs/3RS9htRbFLlhO/c5IT9abZ3gUT
 mekzUJUiRsZ7NZ20EIFCEgnagtuQ49xphdFeR2MOiTMyPG0Y/TDd2FPlmYpiMj6xXbqp
 L8c1vcJygjmjcT0U4+jwd+I5PiM4OT4qorrDy7K+8Zb0kQ6hDomHamFQpVlr6lEqqqfJ
 l0k6176jFSIteTyBx8oAftetorE8QAvPnKraq5c0nfEsKmopIdFeaIrSqzjIKRKHmEDC
 l8LETli50a8jOA3TxuM7cZ2VV7yd+5+mlrB3IQ9I0Gr3Hwa0qa1dJeYubjz6ioCak93w
 plsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713363612; x=1713968412;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g64g9Pt7qYCOpYOwvn3RujnDyp9ytH97gIhVySUkEbw=;
 b=N5OoIPaEP/U4SqjuybBqR4rtpyk20kmBPmDdiWhgQwKkpWWedfiVDKqRYA7wJH0Ije
 3ER1g/HoYF0f/ZBeORPQ1D/O/OtA3MpEFSWypiVWCpxT+CJPy2UodCO9MLRFmAtjy2ik
 a7cUwbT1bX8JmKqbEJR48kQ2KmqRnI3evbFVRsQPYIGYLO3Qta6YkKfxDKcOmvUX8pNR
 gR0hoqmF2rfLdwXjZADCvwCBXmiu1NfG4n1Xix0bWXbiR8lWTzu8Bp1eRP9KwkgvRfgS
 lxVZbcAlFYkxS3u3DfpNmUjVRlIbw1Fh/i84sSxQek+sJqNKYUDshLPEIfrEQ9Xyh8S5
 YVXg==
X-Gm-Message-State: AOJu0YyVlgTn0Iq6u0cCy4++AjOophp3iNNHkSKzGsttZD9yMG/waHGJ
 Ub7cM2ipytANSQ5kVHNuy5J7Jtn4dy3YU+NccxxhnPCe3CF86YjB0ITPYOIoXRY=
X-Received: by 2002:a05:600c:4e8e:b0:417:f7ad:7066 with SMTP id
 f14-20020a05600c4e8e00b00417f7ad7066mr12090784wmq.38.1713363612186; 
 Wed, 17 Apr 2024 07:20:12 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.201.23])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adfc805000000b00349bd105089sm1780408wrh.47.2024.04.17.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 07:20:11 -0700 (PDT)
Message-ID: <9722502e-ce18-49d4-932e-4ff777163763@linaro.org>
Date: Wed, 17 Apr 2024 16:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hw/i2c: Fix checkpatch line over 80 chars warnings
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Corey Minyard <cminyard@mvista.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>
References: <20240416184722.28334-1-philmd@linaro.org>
 <20240416184722.28334-3-philmd@linaro.org>
 <4513c447-2ef3-4547-875b-5500067b44eb@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4513c447-2ef3-4547-875b-5500067b44eb@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W4VBYAempEEm

On 17/4/24 08:24, Cédric Le Goater wrote:
> Hello,
> 
> On 4/16/24 20:47, Philippe Mathieu-Daudé wrote:
>> We are going to modify these lines, fix their style
>> in order to avoid checkpatch.pl warnings:
>>
>>    WARNING: line over 80 characters
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/i2c/i2c.h            |  11 ++-
>>   include/hw/nvram/eeprom_at24c.h |   6 +-
>>   hw/arm/aspeed.c                 | 140 +++++++++++++++++++-------------
>>   hw/nvram/eeprom_at24c.c         |   6 +-
>>   4 files changed, 98 insertions(+), 65 deletions(-)


>> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), 
>> "dps310", 0x76);
>> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), 
>> "max31785", 0x52);
>> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), 
>> "tmp423", 0x4c);
>> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), 
>> "tmp423", 0x4c);
>> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3),
>> +                            "dps310", 0x76);
>> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3),
>> +                            "max31785", 0x52);
>> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
>> +                            "tmp423", 0x4c);
>> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
>> +                            "tmp423", 0x4c);
>>       /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
>> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), 
>> TYPE_TMP105,
>> -                     0x4a);
>> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9),
>> +                            TYPE_TMP105, 0x4a);
>>       /* The witherspoon board expects Epson RX8900 I2C RTC but a 
>> ds1338 is
>>        * good enough */
>> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), 
>> "ds1338", 0x32);
>> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
>> +                            "ds1338", 0x32);
> 
> If the definitions were on a single line, they would be more
> readable IMHO. So I would do the opposit change ...
> 
> An alternate solution could be to define an array of devices
> at the machine class level, something like
>    struct i2c_device [
>            const char *type;
>            uint8_t bus;
>            uint8_t addr;
>    } devices[] = { ... };

I agree this would be better, but this should be done separately
of this series. For now I propose not modifying hw/arm/aspeed.c
in this patch, and ignoring the checkpatch errors in the next
patch. What do you think?
