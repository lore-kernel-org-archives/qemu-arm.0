Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3651557lfp;
        Mon, 10 Feb 2020 02:04:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzkERuFu+1W2sCv3cK0dSXpZwQSRX2EbhG9uBR2KlU3yhp/8vQGESxszfPRdeTaYA5ov/h
X-Received: by 2002:a05:6214:162c:: with SMTP id e12mr9039922qvw.3.1581329055647;
        Mon, 10 Feb 2020 02:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581329055; cv=none;
        d=google.com; s=arc-20160816;
        b=rwtWXILSa5jTCY7EfosVl91YcGcH9RxYTK/hxY6MBPyMoOZxowOKTgPMfJbZ947FcC
         YujxhvAAJhUvHN7t1VaCkiZuiHjrG2nahSeC3WVJVhjg+blCMsYu0cs0KR3Jit78g18i
         Et4yclMZov7MRUrSegR0oeVjEkxPSoM+nIcczE9YLSEnNPwksDv5KOWXFXA8iVexwrdQ
         G1vXZLE5jWWwqokaNopDudjtoJCcnSM2g1+eZvDalcYd0KCkj4OhVQE4Td8fW8x7N8sB
         FUYH1YUvscR3cW2ioMg13c6FNbFT4jx4EL4l4T5alvGjNCg/D07s3nOhw+lfplLE0ln8
         UsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wLYpZlV9+uDIFJrGMqLMbQayl69T21ST4M8dMLeBfp8=;
        b=LDF1FxxL+nH2CQAmYdpu58OR45X1ZtJe92ACghAImfvK3Y9aymk9t4mmrPEz/lbbvb
         RVia3Y1Xie8pPhWTDrQsu9S1mmbPNKvO0U27xPO7VbuH8waIMHacOSHLbXb8pO7sMQO7
         D/VeKcWJVmknc0bGOxaWylJHr/akrv5b/VLxI3bLgZYqvS1bZNLRcGqgC76tn8lv+nJt
         HjRou98UKAuzhI/S2jxVuApWN8EKP/QvCPmR+BUeLhZfG6X9olD+UKhynxWxAceGW3hh
         2gyy/8iGsX+4uUyrjcfFZl3DaOj5Vaue+E6BTyKE4W1E+F2qDekvp1D/JBL4oRtrTCeM
         T3iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c8kJZz+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si3938597qka.3.2020.02.10.02.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 02:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c8kJZz+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j15vL-00068b-04
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 05:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j15uw-00061Z-Fc
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:03:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j15uv-0000aS-1u
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:03:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20064
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j15uu-0000a8-UG
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581329028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLYpZlV9+uDIFJrGMqLMbQayl69T21ST4M8dMLeBfp8=;
 b=c8kJZz+PeOK7/rcHn1lJSFFJBB6X5vRQWQsa2NPOVLp2iDIj5ySqQIO+DvSbrAB8tn6nH4
 3YHMk5ScwGBg7LCS7tftWJ+VlodLbTwA1H6ar8veLar/gbn1hzbJ9RmXsMXL28GzuWd0gY
 QhqMowWZHOdAiqpuL1ApUrDzUxulrUA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-ujGRKrXKNESJwTjQHdYrPg-1; Mon, 10 Feb 2020 05:03:43 -0500
Received: by mail-wm1-f72.google.com with SMTP id s25so1332389wmj.6
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2020 02:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lEhnb6Cth6xROqsu5iiv/oZfGsAEK7hLaGuWixp3v6M=;
 b=OA1iFR++x9RpbrcsLEEyjwNKEkzg+DinCIhJLS0x/I03npYFneTjjgxjHAM+Gt3rZq
 M+3T6O6fEUMIdQjV6eJ9oxRFVlrniCn4i6xl4C7kFpiY/6QKsk2YpRDttxQDTnNJNnQD
 ltQl62ihrUwHyK7RvUd3Bs2TgWqhKqRNvnDwJehQtZO0++Un4GSAq6ZFh5copqetCgkd
 8PVdWF2A5oClwF2oGEMwstT4QqTgA4PoncJr6TLHY8uDKLIKVFr2TfdFqkAw1RNHBd3r
 F2cOPTVlncljtx9VfevD7Re8H64OsV9QBkqVicosLQ3dsqMzB7MqbohGAnT55JLAuQBc
 FQPw==
X-Gm-Message-State: APjAAAUCD18AOox+21cIDLGZscuF4kIxYJylE9c9iFr/U/8BtlhtuPfI
 T5HKeqMmMc23Wq+2Xw0HoKLhLx8OLxgTsjfgqMpXndlD/SKdU3J1AaPhMDcOVipP+RPihZ7DalF
 Y7U8O35vk8aj2
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr14447755wmh.35.1581329022753; 
 Mon, 10 Feb 2020 02:03:42 -0800 (PST)
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr14447732wmh.35.1581329022505; 
 Mon, 10 Feb 2020 02:03:42 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id q3sm14482691wmj.38.2020.02.10.02.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 02:03:42 -0800 (PST)
Subject: Re: [PATCH v3 08/13] hw/arm/raspi: Make board_rev a field of
 RaspiMachineClass
To: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-9-f4bug@amsat.org> <20200210105042.7e76e4e6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2adc51a2-b526-7f6a-4c01-775f3ac06444@redhat.com>
Date: Mon, 10 Feb 2020 11:03:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210105042.7e76e4e6@redhat.com>
Content-Language: en-US
X-MC-Unique: ujGRKrXKNESJwTjQHdYrPg-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l7DQuDbZALlr

On 2/10/20 10:50 AM, Igor Mammedov wrote:
> On Sat,  8 Feb 2020 17:56:40 +0100
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>=20
>> We want to have a common class_init(). The only value that
>> matters (and changes) is the board revision.
>> Pass the board_rev as class_data to class_init().
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   hw/arm/raspi.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 62b8df3c2e..fbfcd29732 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -46,6 +46,7 @@ typedef struct RaspiMachineClass {
>>       /*< private >*/
>>       MachineClass parent_obj;
>>       /*< public >*/
>> +    uint32_t board_rev;
>>   } RaspiMachineClass;
>>  =20
>>   #define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
>> @@ -227,9 +228,11 @@ static void setup_boot(MachineState *machine, int v=
ersion, size_t ram_size)
>>       arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
>>   }
>>  =20
>> -static void raspi_init(MachineState *machine, uint32_t board_rev)
>> +static void raspi_init(MachineState *machine)
>>   {
>> +    RaspiMachineClass *mc =3D RASPI_MACHINE_GET_CLASS(machine);
>>       RaspiMachineState *s =3D RASPI_MACHINE(machine);
>> +    uint32_t board_rev =3D mc->board_rev;
>>       int version =3D board_version(board_rev);
>>       uint64_t ram_size =3D board_ram_size(board_rev);
>>       uint32_t vcram_size;
>> @@ -279,13 +282,16 @@ static void raspi_init(MachineState *machine, uint=
32_t board_rev)
>>  =20
>>   static void raspi2_init(MachineState *machine)
>>   {
>> -    raspi_init(machine, 0xa21041);
>> +    raspi_init(machine);
>>   }
>>  =20
>>   static void raspi2_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc =3D MACHINE_CLASS(oc);
>> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
>> +    uint32_t board_rev =3D (uint32_t)(uintptr_t)data;
>>  =20
>> +    rmc->board_rev =3D board_rev;
>=20
> instead of doing a bit obscure ".class_data     =3D (void *)0xa21041," an=
d
> using it here, I'd just do
>=20
>         rmc->board_rev =3D 0xa21041;
>=20
> using value specific for each leaf class

Leaf classes are removed in patch #12 "Use a unique=20
raspi_machine_class_init() method", see more uses of .class_data from v2:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg677164.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg677166.html

Are you disagreeing with them? Then we should document .class_data as=20
deprecated and show example of good code.

> with this change
>   Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>=20
>>       mc->desc =3D "Raspberry Pi 2B";
>>       mc->init =3D raspi2_init;
>>       mc->block_default_type =3D IF_SD;
>> @@ -302,13 +308,16 @@ static void raspi2_machine_class_init(ObjectClass =
*oc, void *data)
>>   #ifdef TARGET_AARCH64
>>   static void raspi3_init(MachineState *machine)
>>   {
>> -    raspi_init(machine, 0xa02082);
>> +    raspi_init(machine);
>>   }
>>  =20
>>   static void raspi3_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc =3D MACHINE_CLASS(oc);
>> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
>> +    uint32_t board_rev =3D (uint32_t)(uintptr_t)data;
>>  =20
>> +    rmc->board_rev =3D board_rev;
>>       mc->desc =3D "Raspberry Pi 3B";
>>       mc->init =3D raspi3_init;
>>       mc->block_default_type =3D IF_SD;
>> @@ -327,11 +336,13 @@ static const TypeInfo raspi_machine_types[] =3D {
>>           .name           =3D MACHINE_TYPE_NAME("raspi2"),
>>           .parent         =3D TYPE_RASPI_MACHINE,
>>           .class_init     =3D raspi2_machine_class_init,
>> +        .class_data     =3D (void *)0xa21041,
>>   #ifdef TARGET_AARCH64
>>       }, {
>>           .name           =3D MACHINE_TYPE_NAME("raspi3"),
>>           .parent         =3D TYPE_RASPI_MACHINE,
>>           .class_init     =3D raspi3_machine_class_init,
>> +        .class_data     =3D (void *)0xa02082,
>>   #endif
>>       }, {
>>           .name           =3D TYPE_RASPI_MACHINE,
>=20

