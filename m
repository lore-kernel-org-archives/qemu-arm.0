Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp483323lff;
        Sat, 18 Jan 2020 06:10:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQkSEtA5A7PSSAdDaz2Cq/vUdVxqmobSOd/XkF+vfZX8Q4W65LQu8OI3ptw/b1v6ROGXom
X-Received: by 2002:a37:e109:: with SMTP id c9mr39984043qkm.366.1579356643114;
        Sat, 18 Jan 2020 06:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579356643; cv=none;
        d=google.com; s=arc-20160816;
        b=UIifAI45hyf73oQrsXltKBXFuE5rSt1jfM/Iv4m6IG/333wp4hboIx0VLVErxfvMJF
         0LU7OxdTH4TJF/Tdfd/FvwifiQjB1oSDj84VU+k3fG1Ku2qA41BPU7PvnU7Exjayu/Qo
         SHhqHFgz+1bFHZs4758fUeBAZRMR1urfI1C/a/s4Bs1U102uVc4dhA9xYBApDKDPlJh4
         shNlX96BDv836+ddxHsksMF4q/e16JQq7W9gpmv9V4h89UTM1LcWeKhorJK6qNxZrKzm
         KAldJXdbak54aeASCE8y9aMbU2ma61HYgLuZP4QDfNtuoZ+3utt6predDe0dJmP5dsii
         JtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Iu7vbZou4Mkqkj+xWBLbpLkoGfA0UBUnIAfcX2ZZffA=;
        b=s/2X45IEAyru2GltaV8kfivkIR+BbHylY9BkEaH+BwiCdvbY6/Yo8zSy2tsI5HzTGl
         Ua47sqnjzrgszoulVy1LVHJIqdkgAKhvcUyZSBRTJyrTHIyOotpjEpjfcs6pgHLMUFUX
         7jBDqKNpFnMwo8hF7TyHDBTviQRYQB4Zbs1+NUuGKy8yLXEtLsU3Q/Bhr3Gf+/FBlLBF
         IDno60WiSqXb0otZdnabxuFFUZxXDu7SzmWV9rUYdTfUj7zOabONrJMk7z3jp+RRF7fN
         +1+MmV11okkXmB1LyEz4paRayKpDlYXYaLEXZtn7+nmzheR4K54zklsJj55k7bOfGBRX
         /I+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D6zo+p95;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si16658374qvm.158.2020.01.18.06.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 06:10:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D6zo+p95;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40671 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isooE-0005P5-Ar
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 09:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isolq-0002AW-9b
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 09:08:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isoll-0008WI-89
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 09:08:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59769
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isoll-0008Vu-4o
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 09:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579356488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iu7vbZou4Mkqkj+xWBLbpLkoGfA0UBUnIAfcX2ZZffA=;
 b=D6zo+p95EQr39nyRF8vOdPTSDGXVEj2ktk2S32asAN6WgpCkk0RQAcWdi952QRg8rTOtPo
 a2DOKNxYQzJV0xoJrEYn3RCkPf+P1X7UOr42lQzSJx5Brmg9j+2oHUZ24XQy3B3VZptX+1
 rfS39bSjDmtA3lFcCrll0Y5/Tgb47Ao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-JHg9TEMgOqmsojyX8m43CQ-1; Sat, 18 Jan 2020 09:08:07 -0500
Received: by mail-wr1-f71.google.com with SMTP id f10so11848855wro.14
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 06:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9o3S4O25WsiD4zcH7WvaRM+9ICaD1wM7brIRiW5nnkk=;
 b=IXZQ1u2cmyPUZgd1549Qw/X/GGzZcuXw8OZAYpv7ox7l1QggXkHr9d/UOT/Qh76iwW
 lUFm7s9FpSPOkYipZNGiHe6FbdK5aPSZo5kXHSX5/Zm2rG4YS1pO63OOKJXzM6tOuP/K
 zHtpW93jLixeLF0/SeMbGyflXfh8rP5+HVrLvOGiRCoblh1VpttUDtXtPeSlelZJQkpU
 xq9xftB9YNEjG9eJ2kCVevRTOWj8qHvJsz9gP5DYyjh4YVfOwgJxOoflLWC7D8PBopNm
 vF7x8mQv+NoyoPK2m4Z4W+HCMkEdf2psnAucQx59zFM1ZAdxir5W7SJ8skjnKuWEOhhb
 88PQ==
X-Gm-Message-State: APjAAAUxurAtL1UUxZ9KstODeKvqhr6nnxYO58Z6mPi7OKiMhnYsSCGw
 UkYJKWB+eDCWdfLMb3jti55K4JTwF25cF7vdJlf+OF4PgxZY8AxhVpKSIUlL2O6ZiTWqzLT7Q/x
 0jX5G82GHWPZ7
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr9989780wmm.145.1579356485922; 
 Sat, 18 Jan 2020 06:08:05 -0800 (PST)
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr9989751wmm.145.1579356485643; 
 Sat, 18 Jan 2020 06:08:05 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id g21sm3731471wmh.17.2020.01.18.06.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 06:08:05 -0800 (PST)
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Move the OMAP section inside the ARM
 Machines one
To: Markus Armbruster <armbru@redhat.com>
References: <20200118085509.30182-1-philmd@redhat.com>
 <20200118085509.30182-3-philmd@redhat.com>
 <87pnfgq4ca.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ed3f9476-212e-18b3-7fe8-2242eef63515@redhat.com>
Date: Sat, 18 Jan 2020 15:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87pnfgq4ca.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: JHg9TEMgOqmsojyX8m43CQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XN67+qaiGJOH

On 1/18/20 2:30 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> Add the Siemens SX1 (OMAP310) machines with the other ARM machines.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   MAINTAINERS | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 52fbc18566..e2c148d8d8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -560,6 +560,13 @@ F: include/hw/arm/digic.h
>>   F: hw/*/digic*
>>   F: include/hw/*/digic*
>>  =20
>> +OMAP
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>> +F: hw/*/omap*
>> +F: include/hw/arm/omap.h
>> +
>>   Gumstix
>>   M: Peter Maydell <peter.maydell@linaro.org>
>>   R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> @@ -1404,13 +1411,6 @@ F: include/hw/block/fdc.h
>>   F: tests/qtest/fdc-test.c
>>   T: git https://github.com/jnsnow/qemu.git ide
>>  =20
>> -OMAP
>> -M: Peter Maydell <peter.maydell@linaro.org>
>> -L: qemu-arm@nongnu.org
>> -S: Maintained
>> -F: hw/*/omap*
>> -F: include/hw/arm/omap.h
>> -
>>   IPack
>>   M: Alberto Garcia <berto@igalia.com>
>>   S: Odd Fixes
>=20
> Commit message says "add", patch seems to merely move an existing
> entry.  What am I missing?

Ah yes indeed. Peter, can you modify s/Add/Move/ in the description or=20
do you prefer a respin?

Thanks,

Phil.

