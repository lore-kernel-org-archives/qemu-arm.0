Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5933543lfp;
        Tue, 18 Feb 2020 01:37:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuGUlq+BiG+XKMaYnRaTRmBseZerPGiIB22WXU4qQgMwlHLmxRRns+4alm9K2VY5Y7mMyg
X-Received: by 2002:ae9:f016:: with SMTP id l22mr17890381qkg.101.1582018627027;
        Tue, 18 Feb 2020 01:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582018627; cv=none;
        d=google.com; s=arc-20160816;
        b=C5aKuhJjS3jNnl2znY4BEeM1jg3o94DWYknuXveolesBax2aq94s4YiCqzHGA5N3/3
         p/N2SymvLZHe6gXJXMeqY8cQ8t/FDfZY6FkpBDdxqIci1Vi4LRsrpBsbT9Ho8hLzOOOc
         SOYtvOx7eLjKhHx0GUYTaUpr8ft6+mUneNSkJsnKHh0HhxYjVDkYA+p5dG7GCliV0gQW
         NGUhaQOIY+IeuUe9pT/NHyYtyXMgjnOSXGgamcJVI9CWE3FpB5/dFz9ZZ6Te08JMVqb1
         Uls6hHP6xWzHwjcp4insn27G0SAZyyWVDX/7/Cq0Orehjbo5Av91xFm7M8mXWCSxhjs4
         82Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RcjxodsOG8DMb48WnefJcdzANdJn3aiE9oA0FpueFxs=;
        b=TcqLJYubawnPfBCXgok7TtFxcJxLgq539xE3llTQu/+eE7jwuh9w8leHxL2bjTI/C8
         DPvShyNggedUVEm6lrkI/vmm15vxTgyAuMdOjVfF3Xnr6TmpcJ5V+LK9dEiyniBEwQ7j
         Qe/9PJ+Jw01qW+cJxMYo7bWknx4mG0Q7WElRePC8kh1X2QQqdNYs8WAhoZqx7ZJTtbCZ
         dbHX6rPSjSkycHAiPpR+4yZLlX+DD75QS9Y7mjfpbJ/3Jl8ryRpE732b6QAwPutAFQNe
         cc2Y20W9zqCceuuDSCSTynUf1pTYQVeQ1Bg6ZRmZFctZx7qh7MO1jwzwBMSq9F4ki6+F
         7eag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ahz3EcZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a188si1669348qkg.243.2020.02.18.01.37.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:37:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ahz3EcZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zJS-0001uq-FS
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zIF-0000tX-Qm
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:35:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zIE-0002Mo-It
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:35:51 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28012
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zIE-0002MJ-F8
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcjxodsOG8DMb48WnefJcdzANdJn3aiE9oA0FpueFxs=;
 b=Ahz3EcZCvAS3GT6v8uUZ7HUDL7TL6FI+IHxKjgwMKwE87y1gFyVfCIQ2F2Jo/AwsNV6Mcs
 H4eBWeCVqVJAD/Ts943RcceO5vXgV68gVXtn4gOCbUr3THOIKtXEXLaQSCcj1ZCywSFxmY
 312WUaRqNmKdoOSg0MPEA1+7E75KUME=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-Tp2GIuxfPhutXIpwpEuw8Q-1; Tue, 18 Feb 2020 04:35:47 -0500
Received: by mail-wm1-f69.google.com with SMTP id g26so781126wmk.6
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TUjVBiCP7gp2AiEE7R6Zpq5tUxB3Z8DJ7tISQBl8wxM=;
 b=rSkycfgCDpK5T244YlA5ReC1HqmImBUDXwDwLffHmgfkC0kLznk2JFwfdXlojsc6ce
 C21rhRtj9Iv65qJDEFEMresCSG49SfwAjmnlLqhUdFuRNnose6Kn7MgPRdBsLAKMKr+p
 sjuA+T455bA7iFwaLXBo2g0+RCkMY8E75sq2+TMRuk4X6sJ3WJmVeC3qVzjboIy6JrDM
 fLhLCzRysd/ZHCLOjlV/wdIh+8o9Sq/O17pQmiwJoFK0zzWzRg9iyCyiLYe3m03XFm33
 GwJqLoUbVd9dmT/vLhu61m+4FgmoZWoB8xOigv2iVoxnjqk/mRqPetcuva81UYBHhncS
 oTsg==
X-Gm-Message-State: APjAAAUBubV751qmntHjRCMgYNypg3uTUytEuH3IZjEMEeUIzv2C+cx0
 jIKSCjhuPZguYybzYUi/JzyrfoanQ+7b2AAD2AMIXXwX5yltMWWhdxesD9B0SC4TqEq0sA3oytb
 NXs4irysOIgmC
X-Received: by 2002:adf:fe50:: with SMTP id m16mr29243337wrs.217.1582018545101; 
 Tue, 18 Feb 2020 01:35:45 -0800 (PST)
X-Received: by 2002:adf:fe50:: with SMTP id m16mr29243310wrs.217.1582018544852; 
 Tue, 18 Feb 2020 01:35:44 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id v8sm5159607wrw.2.2020.02.18.01.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:35:44 -0800 (PST)
Subject: Re: [PATCH v2 12/13] hw/arm/raspi: Add the Raspberry Pi B+ machine
To: Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200217114533.17779-1-f4bug@amsat.org>
 <20200217114533.17779-13-f4bug@amsat.org>
 <26d85b1f-b2b7-ff9f-1236-43e9cb761c30@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c56d4f85-b4df-643c-c017-350b7f64aec2@redhat.com>
Date: Tue, 18 Feb 2020 10:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <26d85b1f-b2b7-ff9f-1236-43e9cb761c30@greensocs.com>
Content-Language: en-US
X-MC-Unique: Tp2GIuxfPhutXIpwpEuw8Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZY4+en9vGKJ4

Cc'ing Eduardo/Igor.

On 2/18/20 9:48 AM, Luc Michel wrote:
> On 2/17/20 12:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>    $ qemu-system-arm -M raspi1b -serial stdio \
>>        -kernel raspberrypi/firmware/boot/kernel.img \
>>        -dtb raspberrypi/firmware/boot/bcm2708-rpi-b.dtb \
>>        -append 'printk.time=3D0 earlycon=3Dpl011,0x20201000 console=3Dtt=
yAMA0'
>>    [    0.000000] Booting Linux on physical CPU 0x0
>>    [    0.000000] Linux version 4.19.69+ (dom@buildbot) (gcc version 4.9=
.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1261 Tue Sep 3 20:21:01=
 BST 2019
>>    [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 =
(ARMv7), cr=3D00c5387d
>>    [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cac=
he
>>    [    0.000000] OF: fdt: Machine model: Raspberry Pi Model B
>>    [    0.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
>>    [    0.000000] bootconsole [pl11] enabled
>>    [    0.000000] Memory policy: Data cache writeback
>>    [    0.000000] cma: Reserved 8 MiB at 0x1b800000
>>    [    0.000000] random: get_random_bytes called from start_kernel+0x8c=
/0x49c with crng_init=3D0
>>    [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:=
 113680
>>    [    0.000000] Kernel command line: printk.time=3D0 earlycon=3Dpl011,=
0x20201000 console=3DttyAMA0
>>    Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
>>    Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
>>    Memory: 434380K/458752K available (6971K kernel code, 635K rwdata, 20=
80K rodata, 464K init, 797K bss, 16180K reserved, 8192K cma-reserved)
>>    ...
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   hw/arm/raspi.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 3537a329ac..2d9f4e3085 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -324,6 +324,15 @@ static void raspi_machine_class_common_init(Machine=
Class *mc,
>>       mc->default_ram_size =3D board_ram_size(board_rev);
>>   };
>>  =20
>> +static void raspi1b_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc =3D MACHINE_CLASS(oc);
>> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
>> +
>> +    rmc->board_rev =3D 0x900032;
>> +    raspi_machine_class_common_init(mc, rmc->board_rev);
>> +};
>> +
>>   static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc =3D MACHINE_CLASS(oc);
>> @@ -348,6 +357,10 @@ static void raspi3b_machine_class_init(ObjectClass =
*oc, void *data)
>>  =20
>>   static const TypeInfo raspi_machine_types[] =3D {
>>       {
>> +        .name           =3D MACHINE_TYPE_NAME("raspi1b"),
> If it's the B+ model, why not call it raspi1b+ ?

I thought about it (and prefer it), but I'm not sure this can have some=20
side-effect.

Eduardo, Igor, is that OK to use a '+' in a machine name?

So far the names used match [a-zA-Z0-9-].

>=20
>> +        .parent         =3D TYPE_RASPI_MACHINE,
>> +        .class_init     =3D raspi1b_machine_class_init,
>> +    }, {
>>           .name           =3D MACHINE_TYPE_NAME("raspi2b"),
>>           .parent         =3D TYPE_RASPI_MACHINE,
>>           .class_init     =3D raspi2b_machine_class_init,
>>
>=20

