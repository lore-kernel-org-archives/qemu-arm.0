Received: by 10.223.172.38 with SMTP id v35csp4903507wrc;
        Tue, 19 Sep 2017 06:00:24 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAwr5ruZ4aWjjqw5rrKd86kAEcgvNWnFSuDzdOW1RP0EfoGQ91d2itmHqQUTh55ipf6efAF
X-Received: by 10.55.181.129 with SMTP id e123mr1847432qkf.128.1505826024040;
        Tue, 19 Sep 2017 06:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505826024; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9/F0bOigVVD94a9JxgyNjGR48JqbHveaSTxy0M3onTRRGMufXfD1ow1xwQiBxD2wX
         /FhIlB1VxmntNoMsk3bw5cp04rw6/wf03YFDHeD3RLLpaZ9pXgbWhaQNIFTMSm5b1Dmw
         zjGMoa2Ax4Sz40Sem0R1PAqOsbnp27zY57UU3UNwqEEo32lp3YiAoDzm64kAwqPjuXvd
         9vfa0fme5E555/nB7/V72+mYVgMcs/Aq94Cx6Yp4CtLKYGulj1MqCTJtf9jq9QRN3UKw
         ssdjutDz1T8SMGin/z58L6bryLWjEDR3WTKBD8VD5YU12VY6neqPBEF4a4SjFRMxumJa
         J8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=EBbTqJt6hdb0ed2APQM/iiDgY4GYOdRf+u45+FQERCE=;
        b=N2YU7BX4fjewC0mM+/v+TexqqBm23N/AQ44nGuzLU83e3qmSPoY2fS3w905dRZP5BY
         FpiYblYogYfecD1JAEnvRt0t4wS3uH4484Jy9j8eeheO0GGDFBtE328rtnafC9O0zHIT
         mBi+yyAlghLmy5T9tkid/t2k9POXOhx1f25GObhiH5UujTREsZiAYnnO4/LJ+v5ThP1I
         eTYbRnjf+DGq4N7BjavToPeTNM+NlOox/RhenS/u6U09naV0QE6qiFx9Bapi5i5tDSIJ
         4zPdfgzHFe7R5aZAxYzIJD9CeFvVVnD5DoqSZTPJbEvMwtG9keElV5/S31tWOmqYpVT6
         u7Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si7257417qke.423.2017.09.19.06.00.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 06:00:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duI8T-0004Di-Nr
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 09:00:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duHr3-0005tC-RM
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 08:42:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duHr0-0005Wm-Li
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 08:42:21 -0400
Received: from 14.mo3.mail-out.ovh.net ([188.165.43.98]:46176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duHr0-0005Vs-F5
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 08:42:18 -0400
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id EA8C415961F
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 14:42:16 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n4.emea.ibm.com
	[195.212.29.166]) (Authenticated sender: postmaster@kaod.org)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id E25CC2E0098;
	Tue, 19 Sep 2017 14:42:08 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20170919112645.8574-1-clg@kaod.org>
	<20170919112645.8574-4-clg@kaod.org>
	<472ff629-39bd-9fe2-c1f8-a08ba6997b53@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f510d607-b328-90e6-3727-c6f554864e2f@kaod.org>
Date: Tue, 19 Sep 2017 14:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <472ff629-39bd-9fe2-c1f8-a08ba6997b53@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1199927829588315091
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheejgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.43.98
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/5] aspeed: Add EEPROM I2C
 devices
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0krbnqMqfjiK

On 09/19/2017 02:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi C=C3=A9dric,
>=20
> On 09/19/2017 08:26 AM, C=C3=A9dric Le Goater wrote:
>> The Aspeed boards have at least one EEPROM to hold the Vital Product
>> Data (VPD).
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>> =C2=A0 hw/arm/aspeed.c | 20 ++++++++++++++++++++
>> =C2=A0 1 file changed, 20 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 362b683e9021..3e74970d7ad2 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -251,6 +251,17 @@ static void aspeed_board_init(MachineState *machi=
ne,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_load_kernel(ARM_CPU(first_cpu), &as=
peed_board_binfo);
>> =C2=A0 }
>> =C2=A0 +static void aspeed_i2c_add_eeprom(I2CBus *bus, uint8_t address=
, size_t size)
>> +{
>> +=C2=A0=C2=A0=C2=A0 uint8_t *eeprom_buf =3D g_malloc0(size);
>> +=C2=A0=C2=A0=C2=A0 DeviceState *dev;
>> +
>> +=C2=A0=C2=A0=C2=A0 dev =3D qdev_create((BusState *) bus, "smbus-eepro=
m");
>> +=C2=A0=C2=A0=C2=A0 qdev_prop_set_uint8(dev, "address", address);
>> +=C2=A0=C2=A0=C2=A0 qdev_prop_set_ptr(dev, "data", eeprom_buf);
>> +=C2=A0=C2=A0=C2=A0 qdev_init_nofail(dev);
>=20
> Can you merge this with smbus_eeprom_init() ?
> I think the cleaner way would be add "include/hw/i2c/eeprom.h" defining=
 SMB_EEPROM_TYPE "smbus-eeprom" and declare smbus_eeprom_init() there or =
as inlined.

yes. That would remove some duplicated code.

I will wait for some feedback before doing a resend or a followup.

Thanks,

C.


>=20
>> +}
>> +
>> =C2=A0 static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AspeedSoCState *soc =3D &bmc->soc;
>> @@ -260,6 +271,9 @@ static void palmetto_bmc_i2c_init(AspeedBoardState=
 *bmc)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * enough to provide basic RTC fea=
tures. Alarms will be missing */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_create_slave(aspeed_i2c_get_bus(DEV=
ICE(&soc->i2c), 0), "ds1338", 0x68);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DE=
VICE(&soc->i2c), 0), 0x50,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 256 * 1024);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* add a TMP423 temperature sensor */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev =3D i2c_create_slave(aspeed_i2c_get=
_bus(DEVICE(&soc->i2c), 2),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "tmp423", 0x4c);
>> @@ -298,6 +312,9 @@ static void ast2500_evb_i2c_init(AspeedBoardState =
*bmc)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AspeedSoCState *soc =3D &bmc->soc;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DE=
VICE(&soc->i2c), 3), 0x50,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 8 * 1024);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The AST2500 EVB expects a LM75 but a=
 TMP105 is compatible */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_create_slave(aspeed_i2c_get_bus(DEV=
ICE(&soc->i2c), 7), "tmp105", 0x4d);
>> =C2=A0 @@ -377,6 +394,9 @@ static void witherspoon_bmc_i2c_init(Aspeed=
BoardState *bmc)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The witherspoon board expects Epson =
RX8900 I2C RTC but a ds1338 is
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * good enough */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_create_slave(aspeed_i2c_get_bus(DEV=
ICE(&soc->i2c), 11), "ds1338", 0x32);
>> +
>> +=C2=A0=C2=A0=C2=A0 aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&s=
oc->i2c), 11), 0x51,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 8 * 1024);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static void witherspoon_bmc_init(MachineState *machine)
>>

