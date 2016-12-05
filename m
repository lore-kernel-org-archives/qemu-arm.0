Received: by 10.25.159.131 with SMTP id i125csp1570987lfe;
        Mon, 5 Dec 2016 06:15:29 -0800 (PST)
X-Received: by 10.237.53.253 with SMTP id d58mr50508205qte.29.1480947329077;
        Mon, 05 Dec 2016 06:15:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h64si8953092qtd.325.2016.12.05.06.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Dec 2016 06:15:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDu3E-00055M-Dn
	for alex.bennee@linaro.org; Mon, 05 Dec 2016 09:15:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cDu33-00050P-GB
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 09:15:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cDu2z-0003tu-1z
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 09:15:17 -0500
Received: from 5.mo5.mail-out.ovh.net ([87.98.173.103]:51302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cDu2y-0003ry-OC
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 09:15:12 -0500
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 53DCA524AC
	for <qemu-arm@nongnu.org>; Mon,  5 Dec 2016 15:15:11 +0100 (CET)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: postmaster@kaod.org)
	by player773.ha.ovh.net (Postfix) with ESMTPSA id 968D1600096;
	Mon,  5 Dec 2016 15:15:03 +0100 (CET)
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-23-git-send-email-clg@kaod.org>
	<f3a5657c-39db-75a9-3bfc-25e5d03b7e1e@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <09b0e4b9-faae-34aa-4042-aa3704c3457b@kaod.org>
Date: Mon, 5 Dec 2016 15:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f3a5657c-39db-75a9-3bfc-25e5d03b7e1e@gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 8534039823174306736
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrgeekgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.103
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.9 22/30] aspeed/smc:
 handle dummy bytes when doing fast reads
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RIw2flkUoguR

On 12/04/2016 05:46 PM, mar.krzeminski wrote:
>=20
>=20
> W dniu 29.11.2016 o 16:44, C=C3=A9dric Le Goater pisze:
>> When doing fast read, a certain amount of dummy bytes should be sent
>> before the read. This number is configurable in the controler CE0
>> Control Register and needs to be modeled using fake transfers the
>> flash module.
>>
>> When the controller is configured for Command mode, the SPI command
>> used to do the read is stored in the CE0 control register but, in User
>> mode, we need to snoop into the flow of bytes to catch the command. It
>> should be the first byte after CS select.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  hw/ssi/aspeed_smc.c         | 58 ++++++++++++++++++++++++++++++++++++=
++-------
>>  include/hw/ssi/aspeed_smc.h |  1 +
>>  2 files changed, 51 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 9596ea94a3bc..733fd8b09c06 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -71,7 +71,9 @@
>>  #define R_CTRL0           (0x10 / 4)
>>  #define   CTRL_CMD_SHIFT           16
>>  #define   CTRL_CMD_MASK            0xff
>> +#define   CTRL_DUMMY_HIGH_SHIFT    14
>>  #define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
>> +#define   CTRL_DUMMY_LOW_SHIFT     6 /* 2 bits [7:6] */
>>  #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
>>  #define   CTRL_CMD_MODE_MASK       0x3
>>  #define     CTRL_READMODE          0x0
>> @@ -151,6 +153,7 @@
>>  #define SPI_OP_WRDI       0x04    /* Write disable */
>>  #define SPI_OP_RDSR       0x05    /* Read status register */
>>  #define SPI_OP_WREN       0x06    /* Write enable */
>> +#define SPI_OP_READ_FAST  0x0b    /* Read data bytes (high frequency)=
 */
>> =20
>>  /* Used for Macronix and Winbond flashes. */
>>  #define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
>> @@ -510,6 +513,12 @@ static void aspeed_smc_flash_setup_read(AspeedSMC=
Flash *fl, uint32_t addr)
>>      /* access can not exceed CS segment */
>>      addr =3D aspeed_smc_check_segment_addr(fl, addr);
>> =20
>> +    /*
>> +     * Remember command as we might need to send dummy bytes before
>> +     * reading data
>> +     */
>> +    fl->cmd =3D cmd;
>> +
>>      /* TODO: do we have to send 4BYTE each time ? */
>>      if (aspeed_smc_flash_is_4byte(fl)) {
>>          ssi_transfer(s->spi, SPI_OP_EN4B);
>> @@ -525,27 +534,50 @@ static void aspeed_smc_flash_setup_read(AspeedSM=
CFlash *fl, uint32_t addr)
>>      ssi_transfer(s->spi, (addr & 0xff));
>>  }
>> =20
>> +static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
>> +{
>> +    AspeedSMCState *s =3D fl->controller;
>> +    uint32_t r_ctrl0 =3D s->regs[s->r_ctrl0 + fl->id];
>> +    uint32_t dummy_high =3D (r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1;
>> +    uint32_t dummy_low =3D (r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3;
>> +
>> +    return ((dummy_high << 2) | dummy_low) * 8;
>> +}
>> +
>> +static uint64_t aspeed_smc_flash_do_read(AspeedSMCFlash *fl, unsigned=
 size)
>> +{
>> +    AspeedSMCState *s =3D fl->controller;
>> +    uint64_t ret =3D 0;
>> +    int i;
>> +
>> +    if (fl->cmd =3D=3D SPI_OP_READ_FAST) {
>> +        for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
>> +            ssi_transfer(s->spi, 0x0);
>> +        }
>> +    }
> Generally this is wrong, controller should be not aware of any command =
in user mode.
> Currently you are forced to do this by m25p80c dummy cycles implementat=
ion.
> I had no time to improve this since it need to update in Xilinx models,=
 but maybe it is good place to talk about the solution.
> I was thinking to add to ssi function transferN, and use it in flash mo=
dels.
> Firs introduce new state for dummy cycles in m25p80 and then:

This new state would depend on the command op ? fastread would put
the object in a dummy_cycle state ?=20

> a) in case caller use ssi_transfer(transfer8 in flsh models) dummy coun=
t will be incremented by 8.
> This should solve the problem when flash is connected to controller tha=
t is not aware about dummy cycles,
> like this mode or clear SPI controller.
> b) when caller use ssi_trasferN length (in bits) will be the number of =
dummy cycles.
>=20
> What is your opinion?

when you have some time, please send a quick rfc patch for the API :)=20
so that I can experiment on the aspeed controller.

Thanks,

C.=20

>> +    fl->cmd =3D 0;
>> +
>> +    for (i =3D 0; i < size; i++) {
>> +        ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
>> +    }
>> +    return ret;
>> +}
>> +
>>  static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsi=
gned size)
>>  {
>>      AspeedSMCFlash *fl =3D opaque;
>> -    const AspeedSMCState *s =3D fl->controller;
>>      uint64_t ret =3D 0;
>> -    int i;
>> =20
>>      switch (aspeed_smc_flash_mode(fl)) {
>>      case CTRL_USERMODE:
>> -        for (i =3D 0; i < size; i++) {
>> -            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
>> -        }
>> +        ret =3D aspeed_smc_flash_do_read(fl, size);
>>          break;
>>      case CTRL_READMODE:
>>      case CTRL_FREADMODE:
>>          aspeed_smc_flash_select(fl);
>>          aspeed_smc_flash_setup_read(fl, addr);
>> =20
>> -        for (i =3D 0; i < size; i++) {
>> -            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
>> -        }
>> +        ret =3D aspeed_smc_flash_do_read(fl, size);
>> =20
>>          aspeed_smc_flash_unselect(fl);
>>          break;
>> @@ -596,6 +628,15 @@ static void aspeed_smc_flash_write(void *opaque, =
hwaddr addr, uint64_t data,
>> =20
>>      switch (aspeed_smc_flash_mode(fl)) {
>>      case CTRL_USERMODE:
>> +        /*
>> +         * First write after chip select is the chip command. Remembe=
r
>> +         * it as we might need to send dummy bytes before reading
>> +         * data. It will be reseted when the chip is unselected.
>> +         */
>> +        if (!fl->cmd) {
>> +            fl->cmd =3D data & 0xff;
>> +        }
>> +
>>          for (i =3D 0; i < size; i++) {
>>              ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>>          }
>> @@ -629,6 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops =
=3D {
>>  static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
>>  {
>>      AspeedSMCState *s =3D fl->controller;
>> +    fl->cmd =3D 0;
>>      qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl=
));
>>  }
>> =20
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 88a904849801..3ae0a369073d 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -52,6 +52,7 @@ typedef struct AspeedSMCFlash {
>> =20
>>      uint8_t id;
>>      uint32_t size;
>> +    uint8_t cmd;
>> =20
>>      MemoryRegion mmio;
>>      DeviceState *flash;
>=20

