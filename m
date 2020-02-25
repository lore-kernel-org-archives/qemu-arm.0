Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1738550lfg;
        Tue, 25 Feb 2020 06:15:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyE2gwADxx5fFEIis2YxZ6oUe+rRyyTKMgn4Bm/S1XAf3C6i+mn5zV0L6uwT3HCQLk3oAGN
X-Received: by 2002:a0c:f193:: with SMTP id m19mr47100173qvl.154.1582640129431;
        Tue, 25 Feb 2020 06:15:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582640129; cv=none;
        d=google.com; s=arc-20160816;
        b=hktZYc5pX7FErsk5dVREKK7KwoDmEOUEuEgxYmVpnHIal8WXE/c49OxnB83TFrFYe+
         4IbNX7BKMXhqb4v7BElUc6nFSm0LNfCQLuul4pJDtDEdS7aAZ0RHozKiegrfaCdNf051
         bgQPrPDN5dXwyebV2rl7SfyjPfX7f0x3LbfLxdLQScJiJ6NN7ukp85yA6OOnprHvVSbg
         8UFVXcjwmcQ0JzkqWWpFD0D8aTze66+VNlGDHCy3ZlaOeaAL7s2rCI7uv81OZUWbm06R
         5v2dftuPeGQ0e9Os5SzTS4FTs9em4/Ge9Epz6FpWIZekco+SqfOc1GGQiBdt+8eWoZem
         po/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mplXFz9XhI87VPN32Jx6WUqNvWODeZuWVw5OoOQxrjM=;
        b=ZED68da+MlvYR3er2hLAgscz2oLM2SjugKfOVHGE1GYK229BLCPpXd6H+/V+4w5fmz
         C012fyjcz9M+ok9v8l2uIH5aBmblzclORmNyALTqhZWeAOCRcGlYYH2sm9pIv8gRtEZ/
         Ic3++5p55pgBuVhH1ePz38nmNAy4j7Crp3p/NAlITg8a7lOzYy7bfsGlZGV7DVy9bLzH
         KfRO0MzeHLu6c8nJrXNjqKolcRrEVHt/Qua5iCNcqJlIwCxkPpZ2YlhN1CNGHYEu720G
         nJGHxgdwKQ2EmT2Kvba9Hlwug7Bcek8dx2PgGiA2u+qGLBzhJKEJOvg95bItTDeEFjTO
         s3HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZEHGxMJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17si6350834qvm.205.2020.02.25.06.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 06:15:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZEHGxMJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6azg-00015I-OT
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 09:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6atu-0007Ds-46
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 09:09:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6ats-0006Yc-KI
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 09:09:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34571
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6ats-0006Y4-FX
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 09:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582639767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mplXFz9XhI87VPN32Jx6WUqNvWODeZuWVw5OoOQxrjM=;
 b=ZEHGxMJDGHNJtCn1EXuyqgLLnNEn83M7OlfoVqMpkTr5XtTUPDw8uZyMxcqEWQsX0irs85
 NR8S5rI7iTtgogI0a+LGiXiqDUD/pWi27mpuGp0VGAzpx9M1NifyalAdb4cMng2jHLdkWO
 pNbpajrC2i4RcIYMHB8TS+GXBGbCS4c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-RRUef0qDPQuw7VF_KBr87Q-1; Tue, 25 Feb 2020 09:09:25 -0500
X-MC-Unique: RRUef0qDPQuw7VF_KBr87Q-1
Received: by mail-wr1-f71.google.com with SMTP id n12so5461796wrp.19
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 06:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qEoTyBPH0U7wxGlqvxw7ToAiex8GCPJH26NUCkpeNTI=;
 b=Uhd2sAyz4hrnfXZv9EfVdcEBQcesYwqBn0wdoHQlXIAvBpwhgIKT/8nSSf0MpNiDR+
 qLKXLQciwtWDumYha343W7S0wuZHKe/ntuRAS2MOe38wDoWSAqdLeaCYu2GpjWCqNvKZ
 xlhUjV+pgnq8vouRZaIPRRrQ7EeZuA9IG+wpzK24aOu1rUeYJ9Jc933Ly8LhXOWtWtEz
 anHJwEGwd230gNpKwJj4M6C5v52EEDSQ9G9YpwYulCnAlMq+TLFP2seSACKZxizIsnl0
 o5+hUHb/a9fGE/HpuLY0EDSvQA06aOyxSILCyxu9RT/TvSDLukqsZpvlqycKxnHKmYOQ
 iUYg==
X-Gm-Message-State: APjAAAXQoX0b54V5JWyaIt0rnJTaMgTAzcxIj0vDjeZ92C5z9LY5Bi+x
 tiZ+VHfLPxLyeX2Zy2Ph8ULi8OYogdubKnqd/42Pn3P6yZ3L4nZG4+tLSXWVOg3PoC0nvG8oNGC
 72CJ4TOTWKQaK
X-Received: by 2002:a1c:610a:: with SMTP id v10mr5365097wmb.44.1582639764636; 
 Tue, 25 Feb 2020 06:09:24 -0800 (PST)
X-Received: by 2002:a1c:610a:: with SMTP id v10mr5365071wmb.44.1582639764355; 
 Tue, 25 Feb 2020 06:09:24 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id 25sm4358911wmi.32.2020.02.25.06.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 06:09:23 -0800 (PST)
Subject: Re: [RFC PATCH v2 2/2] hw/arm/integratorcp: Map a CFI parallel flash
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200223233033.15371-1-f4bug@amsat.org>
 <20200223233033.15371-3-f4bug@amsat.org>
 <CAFEAcA9bZJ9X20SX-5J2M6rWEhNC=un3Re3RVhGGHD1qMEdWtw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8c64ad4-1c72-04fd-400a-ac003b3090cb@redhat.com>
Date: Tue, 25 Feb 2020 15:09:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9bZJ9X20SX-5J2M6rWEhNC=un3Re3RVhGGHD1qMEdWtw@mail.gmail.com>
Content-Language: en-US
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ftVBYMLYhaAC

On 2/25/20 1:47 PM, Peter Maydell wrote:
> On Sun, 23 Feb 2020 at 23:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> The Linux kernel displays errors why trying to detect the flash:
>>
>>    Linux version 4.16.0 (linus@genomnajs) (gcc version 7.2.1 20171011 (L=
inaro GCC 7.2-2017.11)) #142 PREEMPT Wed May 9 13:24:55 CEST 2018
>>    CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00093177
>>    CPU: VIVT data cache, VIVT instruction cache
>>    OF: fdt: Machine model: ARM Integrator/CP
>>    ...
>>    of-flash 24000000.flash: Integrator/CP flash protection
>>    of-flash 24000000.flash: do_map_probe() failed for type cfi_probe
>>    of-flash 24000000.flash: do_map_probe() failed
>>
>> Since we have a CFI pflash model available, wire it.
>> The kernel properly detects it:
>>
>>    of-flash 24000000.flash: Integrator/CP flash protection
>>    24000000.flash: Found 1 x32 devices at 0x0 in 32-bit bank. Manufactur=
er ID 0x000000 Chip ID 0x000000
>>    Intel/Sharp Extended Query Table at 0x0031
>>    Using buffer write method
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> v2: Kconfig change was not committed
>>
>> RFC because I have no idea of the flash model, its ID code, and which
>> default CFI family (1 or 2).
>=20
> ARM DUI 0102G ("ARM Firmware Suite Reference Guide") helpfully has
> a few details:
>=20
> Device                                  Size  Organization     Flash part
> Integrator/AP Boot flash               512KB  1x512K block     Atmel AT49=
LV040
> Integrator/AP Application flash         32MB  256x128K blocks  Intel 28F3=
20S3
> Integrator/CP Boot/Application flash    16MB  64x256K blocks   Intel 28F6=
40J3A
>=20
> (of which we only model the CP.) With luck that's enough to
> nail down the relevant device properties.

"Intel 28F640J3A" is everything we need, thanks!

>=20
>> @@ -646,6 +649,14 @@ static void integratorcp_init(MachineState *machine=
)
>>                             qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CAR=
DIN, 0));
>>       sysbus_create_varargs("pl041", 0x1d000000, pic[25], NULL);
>>
>> +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
>> +    if (!pflash_cfi01_register(0x24000000, "pflash", 16 * MiB,
>> +                               dinfo ? blk_by_legacy_dinfo(dinfo) : NUL=
L,
>> +                               64 * KiB, 4, 0, 0, 0, 0, 0)) {
>> +        error_report("Error registering flash memory");
>> +        exit(1);
>> +    }
>=20
> Passing a 'width' argument of 0 means "weird legacy backcompat
> device that's a bad emulation of a pair of 16-bit devices";
> we should avoid that for new code, and instead set
> the width and device-width properties to whatever the
> hardware has. (This in turn means you can't use the old
> pflash_cfi01_register() function.)

OK I'll try to document that.

> Should we be using blk_by_legacy_dinfo() in new code?
> I'm not sure if there's a better way to do this if we don't
> need to maintain back-compat with old commandline specifications
> of the flash contents.
>=20
> thanks
> -- PMM
>=20

