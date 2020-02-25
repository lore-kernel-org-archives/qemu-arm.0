Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1547896lfg;
        Tue, 25 Feb 2020 03:20:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqyw2tKl9AjKuRC8A/22HruIsa2ps2Ao6+G6c42zo+HJuYHn1218p9KHoni1IIbz68OoMepL
X-Received: by 2002:ac8:340c:: with SMTP id u12mr53229515qtb.257.1582629654781;
        Tue, 25 Feb 2020 03:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582629654; cv=none;
        d=google.com; s=arc-20160816;
        b=vR8Z750pHhzPx+h3MSC4CNAaqkkRhz+Dkpam+Zn9mXHGdk5yIEmc1B9v1ltVLtVi+T
         F4zmVBBilQfFo37YRN3WI4YdnJKINYf+W5yiukSg6QAa5ZXWpuImQNOGmvgYkb8vwwI+
         m9fHa4qbfA+OsHVUbe/MLtna8vKuDFoEh42lX1rnbc37uVDBcRWK1g6G0zjQ2cv7L8rq
         xSpgRZZS95gFuMfrpNKZdjfaU3fV4QdYiySU5tGGa/D/FnlmM9qoZzg2lni0JaxvS0kM
         0Ff3eHTyRdL/NftsKMCl5a8CkbKQxhhSuTQOWieNTGg4DIL0c6JQyDBvlDx4jXXxmaaG
         WeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1LlKKdL4DaKWeVsmQPadwMBS4Z8kHikh7mfaA90+CJc=;
        b=JnhNuzrT3LMjpLaj0SEyyADp1NlEzKiKuKetsdCaAZp9Si7PxZHHwoJT21ewxpfO6c
         4M4bZBKbEhD1+ujwNC/JdZFFQ0LP9DI283x8MKW+e5xvGFdu476cOBgDVldW2m2WP0iz
         4l5625xt8GnV+/3dGXpB5etjIxr8ESlKjJODKnb9SIHVAibFA7wgBJm6HS0kJz1G/zvZ
         5PT1etkhXExvNQJPdZ4KIun75Z6Aj+c1vCnew0yzR0xsKwwEXQw5cFQSz8/CsGs7ehsZ
         6oH8vyDvHY/q2maLYHVaU8k5r9yhDqTozv9Qrq6wuZ7u+inkEKTTQXPkYSH3izQ8yIJ2
         H37Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HFGF8Uax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c31si1608751qtk.178.2020.02.25.03.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 03:20:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HFGF8Uax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6YGk-00020G-5E
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 06:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6YGZ-0001xp-2r
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:20:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6YGV-00078H-6y
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:20:42 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24695
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6YGT-00077N-Cj
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582629636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LlKKdL4DaKWeVsmQPadwMBS4Z8kHikh7mfaA90+CJc=;
 b=HFGF8UaxXmlOmO4lZofm7ss03swDtS4Pc0ByuI3Vxx0b1rjNhZ/Yyf3lT8qwmyQYJFW1E6
 iDQJjWpD+mwFc3qihGUj9SWnKDshas36mR2w3sYAj9tYUFUpx0SSmVubeVrfzzKhsEI0tm
 mM5NLR1ef3UYf1Qwn0vYYt3k3BcAHlE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-20Uaza4kMYaEOLjNprlbhQ-1; Tue, 25 Feb 2020 06:20:34 -0500
X-MC-Unique: 20Uaza4kMYaEOLjNprlbhQ-1
Received: by mail-wr1-f72.google.com with SMTP id t14so585117wrs.12
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 03:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vvCfD7/rNLbdZdQItEDS2uieFhqDbYFswtqRvUcezs8=;
 b=E+bSanFhHYp6QQuAI1aYWGTnKw7Z4GakWjhfmQN0TVSV9p3OtIOj+4zFQh7dCFtq9u
 SPU4g6tfLYjkH3ewiSbJBsA9R9LFCZ9Tg5BwXa+NkU1b9Iy2lNEzEQNkrMsMyv/loVDF
 e5bD88J5ye8IkokXIWsqn47Bu+r1TkRPRH4bF5/xtd5sMjKObnIItcwFqcTWrjvyocm7
 yLyma8hV4vQ4TlC1tgXdLAoqjYmgpLkdve3kGpa0m561dFqb06G7eRlFBvm1StVZhyfj
 qxb8XLy58vvTkJOndYDEg3StI4K3R6TA06xEK0lBGPQgHQ+4oEtEP/yEYAKcR3G0jeFO
 HCfg==
X-Gm-Message-State: APjAAAX1j/3jIugwQ0OHkuukAye9XYxfhsVCfzpo6JREkJWCYNPatsix
 uZ5zPW73zF9u3jmM8en5BkljLs7vz61MJb1Yv1c3eQGpcGz/cWACaaFjoSfw7P5HZFO5smvNupm
 SxPYpD0apPG4N
X-Received: by 2002:a5d:514b:: with SMTP id u11mr72026915wrt.322.1582629633400; 
 Tue, 25 Feb 2020 03:20:33 -0800 (PST)
X-Received: by 2002:a5d:514b:: with SMTP id u11mr72026882wrt.322.1582629633073; 
 Tue, 25 Feb 2020 03:20:33 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id y8sm3631022wma.10.2020.02.25.03.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:20:32 -0800 (PST)
Subject: Re: [PATCH 2/2] hw/arm/gumstix: Use the IEC binary prefix definitions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200223231044.8003-1-philmd@redhat.com>
 <20200223231044.8003-3-philmd@redhat.com>
 <CAFEAcA8MSO4YMEq2FqvpJKUVYE_1CqaB2KLD1YN-YebOhJVgEg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <63b97fb9-02c9-2be4-73e7-19807a2d6aeb@redhat.com>
Date: Tue, 25 Feb 2020 12:20:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8MSO4YMEq2FqvpJKUVYE_1CqaB2KLD1YN-YebOhJVgEg@mail.gmail.com>
Content-Language: en-US
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2KVyCyB9EV8E

On 2/25/20 12:16 PM, Peter Maydell wrote:
> On Sun, 23 Feb 2020 at 23:10, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> IEC binary prefixes ease code review: the unit is explicit.
>>
>> Add a comment describing the Connex uses a Numonyx RC28F128J3F75
>> flash, and the Verdex uses a Micron RC28F256P30TFA.
>>
>> Correct the Verdex machine description (we model the 'Pro' board).
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> This patch is doing somewhat more than the commit Subject line
> suggests. I don't think it's particularly strongly in need
> of splitting into more patches, but could you make the
> subject line a bit closer to what the patch is doing?
>=20
>> ---
>>   hw/arm/gumstix.c | 23 +++++++++--------------
>>   1 file changed, 9 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
>> index 94904d717b..ca918fda0c 100644
>> --- a/hw/arm/gumstix.c
>> +++ b/hw/arm/gumstix.c
>> @@ -35,6 +35,7 @@
>>    */
>>
>>   #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>   #include "qemu/error-report.h"
>>   #include "hw/arm/pxa.h"
>>   #include "net/net.h"
>> @@ -45,18 +46,14 @@
>>   #include "sysemu/qtest.h"
>>   #include "cpu.h"
>>
>> -static const int sector_len =3D 128 * 1024;
>> +static const int sector_len =3D 128 * KiB;
>>
>>   static void connex_init(MachineState *machine)
>>   {
>>       PXA2xxState *cpu;
>>       DriveInfo *dinfo;
>> -    MemoryRegion *address_space_mem =3D get_system_memory();
>>
>> -    uint32_t connex_rom =3D 0x01000000;
>> -    uint32_t connex_ram =3D 0x04000000;
>> -
>> -    cpu =3D pxa255_init(address_space_mem, connex_ram);
>> +    cpu =3D pxa255_init(get_system_memory(), 64 * MiB);
>>
>>       dinfo =3D drive_get(IF_PFLASH, 0, 0);
>>       if (!dinfo && !qtest_enabled()) {
>> @@ -65,7 +62,8 @@ static void connex_init(MachineState *machine)
>>           exit(1);
>>       }
>>
>> -    if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
>> +    /* Numonyx RC28F128J3F75 */
>> +    if (!pflash_cfi01_register(0x00000000, "connext.rom", 16 * MiB,
>>                                  dinfo ? blk_by_legacy_dinfo(dinfo) : NU=
LL,
>>                                  sector_len, 2, 0, 0, 0, 0, 0)) {
>>           error_report("Error registering flash memory");
>=20
> Previously the variable names were helpfully acting as a
> bit of documentation of what the 64MB and 16MB things were.
> Perhaps we could instead have
>=20
> #define CONNEX_ROM_SIZE (16 * MiB)
> #define CONNEX_RAM_SIZE (64 * MiB)
>=20
> and then use those?

OK.

FYI long term plan for the pflash API is to use a white-list of tested=20
flash models, and restrict models when boards have flash soldered.

>=20
>> @@ -81,12 +79,8 @@ static void verdex_init(MachineState *machine)
>>   {
>>       PXA2xxState *cpu;
>>       DriveInfo *dinfo;
>> -    MemoryRegion *address_space_mem =3D get_system_memory();
>>
>> -    uint32_t verdex_rom =3D 0x02000000;
>> -    uint32_t verdex_ram =3D 0x10000000;
>> -
>> -    cpu =3D pxa270_init(address_space_mem, verdex_ram, machine->cpu_typ=
e);
>> +    cpu =3D pxa270_init(get_system_memory(), 256 * MiB, machine->cpu_ty=
pe);
>>
>>       dinfo =3D drive_get(IF_PFLASH, 0, 0);
>>       if (!dinfo && !qtest_enabled()) {
>> @@ -95,7 +89,8 @@ static void verdex_init(MachineState *machine)
>>           exit(1);
>>       }
>>
>> -    if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
>> +    /* Micron RC28F256P30TFA */
>> +    if (!pflash_cfi01_register(0x00000000, "verdex.rom", 32 * MiB,
>>                                  dinfo ? blk_by_legacy_dinfo(dinfo) : NU=
LL,
>>                                  sector_len, 2, 0, 0, 0, 0, 0)) {
>>           error_report("Error registering flash memory");
>=20
> Similarly here.
>=20
>> @@ -126,7 +121,7 @@ static void verdex_class_init(ObjectClass *oc, void =
*data)
>>   {
>>       MachineClass *mc =3D MACHINE_CLASS(oc);
>>
>> -    mc->desc =3D "Gumstix Verdex (PXA270)";
>> +    mc->desc =3D "Gumstix Verdex Pro XL6P COMs (PXA270)";
>>       mc->init =3D verdex_init;
>>       mc->ignore_memory_transaction_failures =3D true;
>>       mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("pxa270-c0");
>> --
>=20
> thanks
> -- PMM
>=20

