Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5427047lfp;
        Tue, 4 Feb 2020 06:28:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyA9ouhgWwdOFoKKMyg81emyDwUBobOW9D/m/fd+1+kM2X91iC7xL0HJBzO1W5EE+ai6O7E
X-Received: by 2002:ad4:4d85:: with SMTP id cv5mr27183965qvb.171.1580826532935;
        Tue, 04 Feb 2020 06:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580826532; cv=none;
        d=google.com; s=arc-20160816;
        b=HutcpqAynwdR7ygcqq/ld8oBfqN1nHAqsi1FpYlFfI7npjmmI4bx43Lj6nD1ZUjf13
         biTYNAWUUxVG3XW9pGOaQMKA4FvPvRuNIrnAciI6Tt/PMebNmYcUvIQ0ycfiXMRHz7ux
         +Akyd7t0IW5H93bp2tPzI/g/e8sJanLkuWQnbEmfvSPdQtF8wOfW5vnFHLP9KH8QAIug
         43cAkfeq4obqjWwd7NZ0VO+hjYpCZIhIiXfx2InzLGrh+ua6iHO9sb/7TUvF7Yn4Ddls
         MWwcitj+/BYz/wwANjB+n1zhyJCUTBVMfOL8rTlAiYmay1NqHwcBsdYJ1ZyCLvrOVHvw
         M/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BXoc4wax9AubX/kELszQsgm/+uB9WOGe3eqVjGcpiX0=;
        b=SJrGTXZBtdoWf91cxzg4OS5aimPe83uCW9vxzG7vl05YzlL1Z5iP94BAe4EMHj6Ktu
         F5//PUJ/GWeJFokeWvzSDQq9ptEO/yI0SIsvILcY49Iw17+yIneOcO4jhJPw/XDdL39V
         EW2aL6ETPOUHklKsnNJB/gnoOSRnBtkoMokUfIKj9s7WguZ5n8qHIZ+BuPBRLWo8qZmE
         s2qSJqSQO0t7+g5mgW631mY/uxyFctuexFLY4UvlO+qaO7U0Mt5X1UCYUdtL000iWwfQ
         QrrXmN79JPGIjmIJA9Zn49k+Pbzh/XAgYpq/qyM2ypAgERhuCStZQj9eEItJQRS1CsTL
         xIWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EYqOxdGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s124si14144908qkc.53.2020.02.04.06.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 06:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EYqOxdGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyzC8-0005n1-C8
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 09:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iyzBy-0005jT-PF
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 09:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iyzBx-000396-I8
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 09:28:42 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iyzBx-000332-C2; Tue, 04 Feb 2020 09:28:41 -0500
Received: by mail-pg1-x544.google.com with SMTP id w21so3984751pgl.9;
 Tue, 04 Feb 2020 06:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BXoc4wax9AubX/kELszQsgm/+uB9WOGe3eqVjGcpiX0=;
 b=EYqOxdGk3QW4rrHmD8OwzhRHSopSbc/4P7aowIJGn2Jk+qdEQWP+Tv9ckviOdF9fmf
 XyoxsBsBGS6hBoVMooeD/knR8xU85NapjDV6lYdhc1CGTacHwj9oRl4pyPBqhdMyYEHi
 mS/udBeUcNqka0iT8Xe/37lhRired4e3Du8pOwwANAwGc/V6BJFstPT+347Zmf7IYVnL
 m6eVKV0t/yaa4kIpg+I1k26pwT4cn8E6ZaXymSk4sXVUeNs1ZONsD+GavnYjEXWNvP6M
 OHgVv5GQ1IwJA9LIKg2/JM8bSZeeERiPR3YBWeAY3qJB6ZkrQ8YeynU70lzjtPhti9GJ
 Wqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BXoc4wax9AubX/kELszQsgm/+uB9WOGe3eqVjGcpiX0=;
 b=bZzRBJTvstm4JSSB5QKLDqy5RMWE1JwgtA0iA3g139bKRr43VMT6idHb8YjwIYOkY2
 pHxhNsiT//cZFD4MSxrgHq48rtyKCmFmRVF/MlAs3jwSgbzsldzpTWD2I2sHen5lyDCD
 jf6TyHJZ3xX9kK9nIdaGSACP0gKSOcI/2/CPqLaLZxD2DmPUtpTyt+XVcR0kebXT2c9U
 AVswwgcZC3XrweOrLZ3Q8BSbRM2qm6Si55B+oAsCsR6tYKJqPpjHfA4fEbO5Js+IdhCG
 nxnFT4QGodtQJFLG7YhplmaeQkUavyF1Z29rAWmIneNfy+RNesiWEYguKxBvtJ6ddN7g
 H7Gg==
X-Gm-Message-State: APjAAAW8X3eV1e4/VSsYFzWjayRzkmgzxIpkux+3ecurHA8/OAXYypn+
 MKazkO0fF1bwJrh/A2RPzDU=
X-Received: by 2002:a62:e719:: with SMTP id s25mr29906695pfh.40.1580826520115; 
 Tue, 04 Feb 2020 06:28:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g22sm24113391pgk.85.2020.02.04.06.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 06:28:39 -0800 (PST)
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
 <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7fe70871-c0e3-4ff6-bfda-17b45aa50c5e@roeck-us.net>
Date: Tue, 4 Feb 2020 06:28:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gc42qX/5rH1N

On 2/4/20 12:53 AM, Cédric Le Goater wrote:
> On 2/3/20 7:09 PM, Guenter Roeck wrote:
>> Always report 6 bytes of JEDEC data. Fill remaining data with 0.
>>
>> For unsupported commands, keep sending a value of 0 until the chip
>> is deselected.
>>
>> Both changes avoid attempts to decode random commands. Up to now this
>> happened if the reported Jedec data was shorter than 6 bytes but the
>> host read 6 bytes, and with all unsupported commands.
> 
> Do you have a concrete example for that ? machine and flash model.
> 

I noticed it while tracking down the bug fixed in patch 3 of the series,
ie with AST2500 evb using w25q256 flash, but it happens with all machines
using SPI NOR flash (ie all aspeed bmc machines) when running the Linux
kernel. Most of the time it doesn't cause harm, unless the host sends
an "address" as part of an unsupported command which happens to include
a valid command code.

>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/block/m25p80.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 63e050d7d3..aca75edcc1 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>>           for (i = 0; i < s->pi->id_len; i++) {
>>               s->data[i] = s->pi->id[i];
>>           }
>> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
>> +            s->data[i] = 0;
>> +        }
> 
> It seems that data should be reseted in m25p80_cs() also.
> 
Are you sure ?

The current implementation sets s->data[] as needed when command decode
is complete. That seems less costly to me.

Thanks,
Guenter

>>   
>> -        s->len = s->pi->id_len;
>> +        s->len = SPI_NOR_MAX_ID_LEN;
>>           s->pos = 0;
>>           s->state = STATE_READING_DATA;
>>           break;
>> @@ -1158,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>>           s->quad_enable = false;
>>           break;
>>       default:
>> +        s->pos = 0;
>> +        s->len = 1;
>> +        s->state = STATE_READING_DATA;
>> +        s->data_read_loop = true;
>> +        s->data[0] = 0;
>>           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
>>           break;
>>       }
>>
> 

