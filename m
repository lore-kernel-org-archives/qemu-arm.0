Received: by 10.25.21.96 with SMTP id l93csp1056831lfi;
        Fri, 24 Jun 2016 06:50:08 -0700 (PDT)
X-Received: by 10.55.43.81 with SMTP id r78mr5135581qkh.50.1466776208818;
        Fri, 24 Jun 2016 06:50:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si4961429qkn.82.2016.06.24.06.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 06:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGRUm-0008Ft-4N
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 09:50:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGRSh-0006Ws-Li
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 09:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGRSa-0005MW-QL
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 09:47:58 -0400
Received: from 20.mo1.mail-out.ovh.net ([188.165.45.168]:59023)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bGRSa-0005Lx-H7
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 09:47:52 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id BA291FF96C8
	for <qemu-devel@nongnu.org>; Fri, 24 Jun 2016 15:47:48 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 475722C00A0;
	Fri, 24 Jun 2016 15:47:42 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-4-git-send-email-clg@kaod.org>
	<CAFEAcA9F517Zs1eRjnHTDZb1a7RTX5rGq1YMB-mvtak=hopN=A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0608c19e-33c1-02dd-b97b-126c55be6303@kaod.org>
Date: Fri, 24 Jun 2016 15:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9F517Zs1eRjnHTDZb1a7RTX5rGq1YMB-mvtak=hopN=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 4180466358385675179
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.45.168
Subject: Re: [Qemu-devel] [PATCH v3 3/5] ast2400: add SPI flash slave object
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GBIaCTj0Q7T7

On 06/23/2016 08:56 PM, Peter Maydell wrote:
> On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Each SPI flash slave can operate in two modes: Command and User. When
>> in User mode, accesses to the memory segment of the slaves are
>> translated in SPI transfers. When in Command mode, the HW generates
>> the SPI commands automatically and the memory segment is accessed as
>> if doing a MMIO. Other SPI controllers call that mode linear
>> addressing mode.
>>
>> This object is a model proposal for a SPI flash module, gathering SPI
>> slave properties and a MemoryRegion handling the memory accesses.
>> Only the User mode is supported for now but we are preparing ground
>> for the Command mode.
>>
>> The framework below is sufficient to support Linux which only uses
>> User Mode.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/ssi/aspeed_smc.c         | 97 ++++++++++++++++++++++++++++++++++++=
+++++++++
>>  include/hw/ssi/aspeed_smc.h | 16 ++++++++
>>  2 files changed, 113 insertions(+)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 6b52123a67bb..d97c077565c3 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -112,6 +112,21 @@ static bool aspeed_smc_is_ce_stop_active(AspeedSM=
CState *s, int cs)
>>      return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
>>  }
>>
>> +static inline int aspeed_smc_flash_mode(AspeedSMCState *s, int cs)
>> +{
>> +    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
>> +}
>> +
>> +static inline bool aspeed_smc_is_usermode(AspeedSMCState *s, int cs)
>> +{
>> +    return (aspeed_smc_flash_mode(s, cs) =3D=3D CTRL_USERMODE);
>=20
> You don't need these brackets.

true.

>> +}
>> +
>> +static inline bool aspeed_smc_is_writable(AspeedSMCState *s, int cs)
>> +{
>> +    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
>> +}
>> +
>>  static void aspeed_smc_update_cs(AspeedSMCState *s)
>>  {
>>      int i;
>> @@ -296,3 +311,85 @@ static void aspeed_smc_register_types(void)
>>  }
>>
>>  type_init(aspeed_smc_register_types)
>> +
>> +static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsi=
gned size)
>> +{
>> +    AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opaque);
>> +    AspeedSMCState *s =3D fl->controller;
>> +    uint64_t ret =3D 0;
>> +    int i;
>> +
>> +    if (aspeed_smc_is_usermode(s, fl->id)) {
>> +        for (i =3D 0; i < size; i++) {
>> +            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
>> +        }
>> +    } else {
>> +        error_report("%s: flash not in usermode", __func__);
>=20
> This should probably be a LOG_UNIMP or LOG_GUEST_ERROR qemu_log
> message. (Similarly below.)

ok.

>> +        ret =3D -1;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_=
t data,
>> +                           unsigned size)
>> +{
>> +    AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opaque);
>> +    AspeedSMCState *s =3D fl->controller;
>> +    int i;
>> +
>> +    if (!aspeed_smc_is_writable(s, fl->id)) {
>> +        error_report("%s: flash is not writable", __func__);
>> +        return;
>> +    }
>> +
>> +    if (!aspeed_smc_is_usermode(s, fl->id)) {
>> +        error_report("%s: flash not in usermode", __func__);
>> +        return;
>> +    }
>> +
>> +    for (i =3D 0; i < size; i++) {
>> +        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_smc_flash_ops =3D {
>> +    .read =3D aspeed_smc_flash_read,
>> +    .write =3D aspeed_smc_flash_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 1,
>> +        .max_access_size =3D 4,
>> +    },
>> +};
>> +
>> +static const VMStateDescription vmstate_aspeed_smc_flash =3D {
>> +    .name =3D "aspeed.smc_flash",
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT8(id, AspeedSMCFlashState),
>=20
> I can see where we read this, but not where we write it.
> If it's read only, it doesn't need to be migrated. If it's
> writeable, the device needs a reset function to reset it.
> ("currently r/o but will become r/w when later functionality
> is added, and don't want to make a migration break later" is
> ok, but we should be consistent about whether we treat it as
> r/w for reset and migration purposes.)

I have not given enough attention to the migration of this object.
I will check that.

Thanks,

C.


>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void aspeed_smc_flash_class_init(ObjectClass *klass, void *dat=
a)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd =3D &vmstate_aspeed_smc_flash;
>> +}
>> +
>> +static const TypeInfo aspeed_smc_flash_info =3D {
>> +    .name           =3D TYPE_ASPEED_SMC_FLASH,
>> +    .parent         =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size  =3D sizeof(AspeedSMCState),
>> +    .class_init     =3D aspeed_smc_flash_class_init,
>> +};
>> +
>> +static void aspeed_smc_flash_register_types(void)
>> +{
>> +    type_register_static(&aspeed_smc_flash_info);
>> +}
>> +
>> +type_init(aspeed_smc_flash_register_types)
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 2d3e9f6b46d5..abd0005b01c2 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -27,6 +27,22 @@
>>
>>  #include "hw/ssi/ssi.h"
>>
>> +struct AspeedSMCState;
>> +
>> +typedef struct AspeedSMCFlashState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion mmio;
>> +    uint8_t id;
>> +    size_t size;
>> +    struct AspeedSMCState *controller;
>> +    DeviceState *flash;
>> +} AspeedSMCFlashState;
>> +
>> +#define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
>> +#define ASPEED_SMC_FLASH(obj) \
>> +    OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
>> +
>>  typedef struct AspeedSMCController {
>>      const char *name;
>>      uint8_t r_conf;
>=20
> thanks
> -- PMM
>=20

