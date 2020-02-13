Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp633095lfp;
        Thu, 13 Feb 2020 05:53:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2MG59mHt6H/mtBji15ZF5xS4ZODt8XJT+S7T5lu509BnE5ssRXnHOm0L/70bmo2+BnPv9
X-Received: by 2002:a0c:c310:: with SMTP id f16mr11773430qvi.65.1581602007061;
        Thu, 13 Feb 2020 05:53:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581602007; cv=none;
        d=google.com; s=arc-20160816;
        b=JBu8LMsp8nSZWXWfVDAp8R8zsO0RB1QrMKth3NaAPYCSqpZSPguMrIl3K5qMwdsmDq
         0QJBW1ruKpXoUH83TDN0KbyOaDz8bzTetGHCP+RFLgmbP+jEw+AD9y4Rm2qqrtGSFVRl
         UHpgEcwSG45dfGb+S1ZcLOyTiXphcx+e0UhvILCZJNB7tVccdBkleC6hqwZ88Tq8WRrG
         IEi+pSoal3/F7EcU7AUuQXbMuxLgEdXgN2XjuCyE7P73UBw69hwi16ynpn1Xqpi2y6uC
         m2m1/j0YC56FaK9tHkbnhSMeY8AnU0tosJLfJcJPaQsNiLIsEqpPDCYZV/Yuz7D/9jUb
         QIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=v74zuWvJsToqbhALqcqyXmxJpMnNTkbGA769JD+fqHY=;
        b=Rlcvr8JDzQlxUvxFJln+DTeOcCgOuIZO3sDt5/TgWcwg6Sd9jaZ7RVnEYkbVrZizNH
         g8nSHjxnkzh0vMRdoCbX9lJe6mf5CxMawLCKOhwxFOd2sxjbai08qg9YIxTlE1vgaMzD
         92myE6jFlrwizLmJzwX9YoFlu7qlfyvxtk/TmF1p97hFrtHoSOUNzilb1TdrmVPCwmIU
         3ftkE7mYEL243mHX4javd4oqwkV5rwVVKkbMqwnOjayomVcdIIHFJeZAW0/OEkDcz9Fo
         PfuUAIv1zxmOz7UFmrcHSQS/IgRqqSIBjIqpqm/deThiw5NUPVjq7IaA0eBORCgo4gWA
         3EGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LunB8F9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si1235583qko.287.2020.02.13.05.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 05:53:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LunB8F9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2Evm-0007BT-Gd
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 08:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j2Eve-00078L-8B
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 08:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j2Evd-0003El-1c
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 08:53:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39703
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j2Evc-0003DQ-TI
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 08:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581601996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v74zuWvJsToqbhALqcqyXmxJpMnNTkbGA769JD+fqHY=;
 b=LunB8F9SZ0TvfWu52XbPusud05UT2lZwqWQ2DuIDU7FmYv2rYHVtiE1cT6Sjydpoei+bhE
 ka4FYO6q4AGUFFz+oqSCg3nW73xfuQ2mZ1rsVvaBROcmjjVWFYf3naP7t/ihOnNJNJeOUl
 5nAg6H3CPqVTpPk+cjX2Evv2sKbfSu0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-gg4p1mV5MrCLyORhat8Keg-1; Thu, 13 Feb 2020 08:53:14 -0500
Received: by mail-wm1-f70.google.com with SMTP id n17so2042440wmk.1
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 05:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fd3QGAjx1cwbZudQ3kK3BytgAiXrgfi56WUJfwbT0/0=;
 b=spad04JlojrfruBLbPMMlFx9P/g2353i1cEqT+OUcgsoSD7y14MBs1dhQ0r8ou3fcD
 Tz7XHmq/3un1uVb1cE3puP+AMg5Bme2uFwqM0UNcUG7Ppj0pCw7bzN+ZE4ba8GmcdyaL
 r+l5phbSWd2z1BC0P7Gm6f2CPpbk5mOujKE8pvnwldDvyhDSt9ycM0K1UMdKqBCQJXtx
 lU/xxWI5oL+QNtjzW4RP4whOQ5DpKrqk/JOJJGHqOStO9W9hhh21iesVDFMIrJ8Shw1h
 Q3VAmSpkW2QHnzEF1Hvci4Bd49Y5G4uTFDS5vRuzHhnFQWLdZzSG8QSfWRxORmDjUMXv
 yMgA==
X-Gm-Message-State: APjAAAUynXC85QPt6jv/IvFOm6KjRFJh86dWeba+Zo9zPWWbyGQMrB8s
 tUkh1APuyplyzpOyJIQ8hIb1mUcxXgQ0drTiMYuXHukPJws5tXkGbhP6YpcrO4lWD/IXcKsdW+p
 rwjvZbNszVNmD
X-Received: by 2002:a5d:4a91:: with SMTP id o17mr20883488wrq.232.1581601993185; 
 Thu, 13 Feb 2020 05:53:13 -0800 (PST)
X-Received: by 2002:a5d:4a91:: with SMTP id o17mr20883461wrq.232.1581601992930; 
 Thu, 13 Feb 2020 05:53:12 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o4sm2916430wrx.25.2020.02.13.05.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 05:53:12 -0800 (PST)
Subject: Re: [PATCH v3 03/13] hw/arm/raspi: Extract the version from the board
 revision
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-4-f4bug@amsat.org>
 <CAFEAcA8raRKW5OYJzO1kHs263_uJ_LucCa9tKgg70iX0jGqcGQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8570a6c6-9fd2-2e65-3c12-b4fb04fa9f80@redhat.com>
Date: Thu, 13 Feb 2020 14:53:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8raRKW5OYJzO1kHs263_uJ_LucCa9tKgg70iX0jGqcGQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: gg4p1mV5MrCLyORhat8Keg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RkhOeFgvOjC3

On 2/13/20 2:40 PM, Peter Maydell wrote:
> On Sat, 8 Feb 2020 at 16:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>>
>> The board revision encode the board version. Add a helper
>> to extract the version, and use it.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   hw/arm/raspi.c | 31 +++++++++++++++++++++++++++----
>>   1 file changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 818146fdbb..f285e2988f 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -16,6 +16,7 @@
>>   #include "qapi/error.h"
>>   #include "cpu.h"
>>   #include "hw/arm/bcm2836.h"
>> +#include "hw/registerfields.h"
>>   #include "qemu/error-report.h"
>>   #include "hw/boards.h"
>>   #include "hw/loader.h"
>> @@ -37,6 +38,28 @@ typedef struct RasPiState {
>>       MemoryRegion ram;
>>   } RasPiState;
>>
>> +/*
>> + * Board revision codes:
>> + * www.raspberrypi.org/documentation/hardware/raspberrypi/revision-code=
s/
>> + */
>> +FIELD(REV_CODE, REVISION,           0, 4);
>> +FIELD(REV_CODE, TYPE,               4, 8);
>> +FIELD(REV_CODE, PROCESSOR,         12, 4);
>> +FIELD(REV_CODE, MANUFACTURER,      16, 4);
>> +FIELD(REV_CODE, MEMORY_SIZE,       20, 3);
>> +FIELD(REV_CODE, STYLE,             23, 1);
>> +
>> +static int board_processor_id(uint32_t board_rev)
>> +{
>> +    assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style *=
/
>> +    return FIELD_EX32(board_rev, REV_CODE, PROCESSOR);
>> +}
>> +
>> +static int board_version(uint32_t board_rev)
>> +{
>> +    return board_processor_id(board_rev) + 1;
>=20
> This uses the 'processor' field, which basically means the SoC
> (0 for BCM2835, 1 for BCM2836, 2 for BCMM2837, 3 for BCM2711).
> We use 'version' for a wider range of things in our code here:
>   * do we need SMP setup?
>   * which address does the firmware image go?
>   * do we need to set up SMC vectors so no-op SMC works?
>   * as well as "which SoC do we instantiate"?
>=20
> We think of 'version' as basically "raspi 2 or 3?", but
> according to the table in your url you can get a version of
> the raspi 2b with a BCM2837 SoC, which confuses this idea.
>=20
> Anyway, since what we have in this patch works OK for the set
> of board models we support, I'm happy to leave the patch as-is,
> but maybe worth checking and considering what in our code we
> should really be making conditional on "actually the SoC type"
> and what on something else...

Yes you are right, version =3D (2, 3) was too simple, I replaced the=20
'version' check by 'processor_id' in the series introducing the raspi4=20
(with other cleanups).
Eventually this file will only use the board_rev fields directly.

