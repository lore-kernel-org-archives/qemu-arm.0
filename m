Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp487316lff;
        Fri, 10 Jan 2020 02:15:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrS7kUub73Vizr3914/e8KtxSWsirp9AJd3icbToz3VfwXWWVJHVmf383h0X6l7TwKlzfZ
X-Received: by 2002:a05:6402:1d08:: with SMTP id dg8mr2491965edb.117.1578651310482;
        Fri, 10 Jan 2020 02:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578651310; cv=none;
        d=google.com; s=arc-20160816;
        b=PMgdltU4CD0Md3iVoMNgkDjimC2hUGRXfjJFjQUPL83pa2qYQtuOpP0207QM2ejnwM
         Xko1WB7gKMpPq5vVTOQ+CeS8GATGk5S5mJxM9d2Fh1UqRcpPWTpA3Zojj4T8SD76GzU3
         Sjj6JeTAMGhFamph9LsMzV2UdLhD1XSJfCZozTfuN5uoL7XBYwZDWLq1jbFMoT715ITG
         bP85Nw4Drl3/eTD1D8K6m9oomy3s03zdK572zgsqCPWrpXQorAkFKIWw+gzbTqhgOLAi
         Qh4gaFdrFWj9hLcu2u0NUDy17CbrlYj3pZy0foEEHCNPzQKqlmYPGjf1pZGtnBzCtv+G
         QjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mFmax1gFyTFenrxnrLUZRBtNlgGoD2BPSDd4b/7JvKo=;
        b=DO4cTSRrjBg/2WXyH4gUfRAKPZI4lX7Wh4W60mUMULwvwwC989r9FKs0etP41h8nVo
         6YhdRfnJRVG6mL7u1UnvVB4ytW9dumUvIml1ZvpFPF/fXjSWY/emzLCZft2MkIfSC8F/
         rlOVPLQeopTN5BtJxjNyk8CKvqbmOqgRjd81JjaSjq4TxD7kFnvlT5QHjMMPlKwwPCpC
         LFd28n87Kx19CEy5AMDp78/c390Zgno6cK1S86dU+O1NdhGskr2ag7b689eLZ43ix67f
         2sF1NjmywUPfwFp0024/LrTqp1dZWI+fhJlsJpFeSPupn/tLAYsJpolSbgFfzVVjxNYj
         VmUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si1326600edy.323.2020.01.10.02.15.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 02:15:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iprJt-0003s4-8P
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 05:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iprJf-0003rB-LE
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:14:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iprJe-0001MD-6O
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:14:55 -0500
Received: from 6.mo6.mail-out.ovh.net ([87.98.177.69]:52428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iprJd-0001EN-TI
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:14:54 -0500
Received: from player750.ha.ovh.net (unknown [10.108.42.75])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id A15301F8922
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 11:14:51 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id DDCC6E07DDD6;
 Fri, 10 Jan 2020 10:14:44 +0000 (UTC)
Subject: Re: [PATCH 4/5] hw/arm/aspeed: add a 'execute-in-place' property to
 boot directly from CE0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
 <20200107073423.30043-5-clg@kaod.org>
 <949c0ad0-40b5-9c7d-4d5a-58e519166142@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ec6d268c-6fcc-4c28-26ee-6003a2a12b7f@kaod.org>
Date: Fri, 10 Jan 2020 11:14:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <949c0ad0-40b5-9c7d-4d5a-58e519166142@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 5663839482681133888
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.177.69
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hyLRy2dqel0i

On 1/7/20 9:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/7/20 8:34 AM, C=C3=A9dric Le Goater wrote:
>> The overhead for the OpenBMC firmware images using the a custom U-Boot
>> is around 2 seconds, which is fine, but with a U-Boot from mainline,
>> it takes an extra 50 seconds or so to reach Linux. A quick survey on
>> the number of reads performed on the flash memory region gives the
>> following figures :
>>
>> =C2=A0=C2=A0 OpenBMC U-Boot=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 922478 (~ 3.=
5 MBytes)
>> =C2=A0=C2=A0 Mainline U-Boot=C2=A0=C2=A0 20569977 (~ 80=C2=A0 MBytes)
>>
>> QEMU must be trashing the TCG TBs and reloading text very often. Some
>> addresses are read more than 250.000 times. Until we find a solution
>> to improve boot time, execution from MMIO is not activated by default.
>>
>> Setting this option also breaks migration compatibility.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> =C2=A0 include/hw/arm/aspeed.h |=C2=A0 2 ++
>> =C2=A0 hw/arm/aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 44 ++++++++++++++++++++++++++++++++++++-----
>> =C2=A0 2 files changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
>> index 4423cd0cda71..18521484b90e 100644
>> --- a/include/hw/arm/aspeed.h
>> +++ b/include/hw/arm/aspeed.h
>> @@ -19,6 +19,8 @@ typedef struct AspeedBoardState AspeedBoardState;
>> =C2=A0 =C2=A0 typedef struct AspeedMachine {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MachineState parent_obj;
>> +
>> +=C2=A0=C2=A0=C2=A0 bool mmio_exec;
>> =C2=A0 } AspeedMachine;
>> =C2=A0 =C2=A0 #define ASPEED_MACHINE_CLASS(klass) \
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 0a7dfd29868b..bf23579fa53d 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -260,11 +260,18 @@ static void aspeed_machine_init(MachineState *ma=
chine)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * SoC and=
 128MB for the AST2500 SoC, which is twice as big as
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * needed =
by the flash modules of the Aspeed machines.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_init_rom(boo=
t_rom, OBJECT(bmc), "aspeed.boot_rom",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fl->size, &error_abort);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_add_subregio=
n(get_system_memory(), FIRMWARE_ADDR,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot_r=
om);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_boot_rom(drive0, FIR=
MWARE_ADDR, fl->size, &error_abort);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ASPEED_MACHINE(machine=
)->mmio_exec) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 me=
mory_region_init_alias(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&fl->mmio, 0, fl->size);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 me=
mory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 boot_rom);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 me=
mory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fl->size, &e=
rror_abort);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 me=
mory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 boot_rom);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wr=
ite_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Nitpick: I'd use rom_add_file_mr() in write_boot_rom(), and keep the me=
mory_region_add_subregion() call after the if/else statement.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I would rather address changes in follow-up  patches.

Thanks for the hint.=20

C.=20

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_board_binfo.ram_size =3D =
ram_size;
>> @@ -398,6 +405,30 @@ static void witherspoon_bmc_i2c_init(AspeedBoardS=
tate *bmc)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Bus 11: TODO ucd90160@64 */
>> =C2=A0 }
>> =C2=A0 +static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return ASPEED_MACHINE(obj)->mmio_exec;
>> +}
>> +
>> +static void aspeed_set_mmio_exec(Object *obj, bool value, Error **err=
p)
>> +{
>> +=C2=A0=C2=A0=C2=A0 ASPEED_MACHINE(obj)->mmio_exec =3D value;
>> +}
>> +
>> +static void aspeed_machine_instance_init(Object *obj)
>> +{
>> +=C2=A0=C2=A0=C2=A0 ASPEED_MACHINE(obj)->mmio_exec =3D false;
>> +}
>> +
>> +static void aspeed_machine_class_props_init(ObjectClass *oc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 object_class_property_add_bool(oc, "execute-in-pla=
ce",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_get_m=
mio_exec,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_set_m=
mio_exec, &error_abort);
>> +=C2=A0=C2=A0=C2=A0 object_class_property_set_description(oc, "execute=
-in-place",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "boot directly from CE0 flash device", &error_abort);
>> +}
>> +
>> =C2=A0 static void aspeed_machine_class_init(ObjectClass *oc, void *da=
ta)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);
>> @@ -407,6 +438,8 @@ static void aspeed_machine_class_init(ObjectClass =
*oc, void *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mc->no_floppy =3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mc->no_cdrom =3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mc->no_parallel =3D 1;
>> +
>> +=C2=A0=C2=A0=C2=A0 aspeed_machine_class_props_init(oc);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static void aspeed_machine_palmetto_class_init(ObjectCla=
ss *oc, void *data)
>> @@ -549,6 +582,7 @@ static const TypeInfo aspeed_machine_types[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D TYPE_ASPEED_MACHINE,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parent=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D TYPE_MACHINE,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .instance_size =
=3D sizeof(AspeedMachine),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .instance_init =3D aspeed_=
machine_instance_init,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .class_size=C2=A0=
=C2=A0=C2=A0 =3D sizeof(AspeedMachineClass),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .class_init=C2=A0=
=C2=A0=C2=A0 =3D aspeed_machine_class_init,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .abstract=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D true,
>>
>=20

