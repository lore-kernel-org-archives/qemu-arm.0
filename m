Received: by 10.80.163.71 with SMTP id 65csp2497314edn;
        Tue, 4 Oct 2016 23:15:08 -0700 (PDT)
X-Received: by 10.233.223.195 with SMTP id t186mr7333924qkf.46.1475648107970;
        Tue, 04 Oct 2016 23:15:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q78si4793155qka.315.2016.10.04.23.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 23:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brfTv-00055k-Cj
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 02:15:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1brfTp-000558-AQ
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 02:15:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1brfTl-00050s-6b
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 02:15:01 -0400
Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]:45701)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1brfTk-00050L-UB
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 02:14:57 -0400
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id EC2AEFCAF
	for <qemu-arm@nongnu.org>; Wed,  5 Oct 2016 08:14:55 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player726.ha.ovh.net (Postfix) with ESMTPSA id 8A5472A006F;
	Wed,  5 Oct 2016 08:14:51 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
	<1474977462-28032-7-git-send-email-clg@kaod.org>
	<1475625198.5030.13.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <aa0ae030-2fad-b2f7-6994-cc631220cf3c@kaod.org>
Date: Wed, 5 Oct 2016 08:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475625198.5030.13.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 11123609607888604080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrvdelgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.108.172
Subject: Re: [Qemu-arm] [PATCH 6/6] aspeed: add support for the SMC segment
 registers
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z5kOMzeWRSnj

On 10/05/2016 01:53 AM, Andrew Jeffery wrote:
> On Tue, 2016-09-27 at 13:57 +0200, C=C3=A9dric Le Goater wrote:
>> The SMC controller on the Aspeed SoC has a set of registers to
>> configure the mapping of each flash module in the SoC address
>> space. Writing to these registers triggers a remap of the memory
>> region and the spec requires a certain number of checks before doing
>> so.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>=20
>> ---
>>  hw/ssi/aspeed_smc.c | 135 +++++++++++++++++++++++++++++++++++++++++++=
+++++++--
>>  1 file changed, 130 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index ecf39ccfde0e..6e8403ebc246 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -79,10 +79,10 @@
>> =20
>>  /* CEx Segment Address Register */
>>  #define R_SEG_ADDR0       (0x30 / 4)
>> -#define   SEG_SIZE_SHIFT       24   /* 8MB units */
>> -#define   SEG_SIZE_MASK        0x7f
>> +#define   SEG_END_SHIFT        24   /* 8MB units */
>> +#define   SEG_END_MASK         0xff
>=20
> Was this a bug? The top bit is reserved as 0 in the 2500 datasheet, but
> valid as your change suggests in the 2400.

This true that the allowed bits in the mask are smaller but they are=20
also different on all SPI controllers. There is at least three=20
different ranges, on the AST2400 FMC, the AST2500 FMC and on the=20
AST2500 SPI.=20

So I tried to find a common ground, that is a larger definition,
to avoid complexity in this first step and support all SoC.

A Next step could be to modify :=20

	uint32_t aspeed_smc_segment_to_reg(const AspeedSegments *seg)
	void aspeed_smc_reg_to_segment(uint32_t reg, AspeedSegments *seg)

to add the extra complexity and handle the range differences. Or add
a new routine for this purpose with clear values for a human. The
register definitions in the spec are really foggy.

Thanks

C.=20

>>  #define   SEG_START_SHIFT      16   /* address bit [A29-A23] */
>>
>>  #define   SEG_START_SHIFT      16   /* address bit [A29-A23] */
>> -#define   SEG_START_MASK       0x7f
>> +#define   SEG_START_MASK       0xff
>=20
> As above.
>=20
>>  #define R_SEG_ADDR1       (0x34 / 4)
>>  #define R_SEG_ADDR2       (0x38 / 4)
>>  #define R_SEG_ADDR3       (0x3C / 4)
>> @@ -135,8 +135,7 @@
>>  /*
>>   * Default segments mapping addresses and size for each slave per
>>   * controller. These can be changed when board is initialized with th=
e
>> - * Segment Address Registers but they don't seem do be used on the
>> - * field.
>> + * Segment Address Registers.
>>   */
>>  static const AspeedSegments aspeed_segments_legacy[] =3D {
>>      { 0x10000000, 32 * 1024 * 1024 },
>> @@ -191,6 +190,118 @@ static const AspeedSMCController controllers[] =3D=
 {
>>        ASPEED_SOC_SPI2_FLASH_BASE, 0x8000000 },
>>  };
>> =20
>> +/*
>> + * The Segment Register uses a 8MB unit to encode the start address
>> + * and the end address of the mapping window of a flash SPI slave :
>> + *
>> + *        | byte 1 | byte 2 | byte 3 | byte 4 |
>> + *        +--------+--------+--------+--------+
>> + *        |  end   |  start |   0    |   0    |
>> + *
>> + */
>> +static inline uint32_t aspeed_smc_segment_to_reg(const AspeedSegments=
 *seg)
>> +{
>> +    uint32_t reg =3D 0;
>> +    reg |=3D ((seg->addr >> 23) & SEG_START_MASK) << SEG_START_SHIFT;
>> +    reg |=3D (((seg->addr + seg->size) >> 23) & SEG_END_MASK) << SEG_=
END_SHIFT;
>> +    return reg;
>> +}
>> +
>> +static inline void aspeed_smc_reg_to_segment(uint32_t reg, AspeedSegm=
ents *seg)
>> +{
>> +    seg->addr =3D ((reg >> SEG_START_SHIFT) & SEG_START_MASK) << 23;
>> +    seg->size =3D (((reg >> SEG_END_SHIFT) & SEG_END_MASK) << 23) - s=
eg->addr;
>> +}
>> +
>> +static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
>> +                                     const AspeedSegments *new,
>> +                                     int cs)
>> +{
>> +    AspeedSegments seg;
>> +    int i;
>> +
>> +    for (i =3D 0; i < s->ctrl->max_slaves; i++) {
>> +        if (i =3D=3D cs) {
>> +            continue;
>> +        }
>> +
>> +        aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + i], &seg);
>> +
>> +        if (new->addr + new->size > seg.addr &&
>> +            new->addr < seg.addr + seg.size) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment CS%d [ 0x=
%"
>> +                          HWADDR_PRIx" - 0x%"HWADDR_PRIx" ] overlaps =
with "
>> +                          "CS%d [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx"=
 ]\n",
>> +                          s->ctrl->name, cs, new->addr, new->addr + n=
ew->size,
>> +                          i, seg.addr, seg.addr + seg.size);
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
>> +                                         uint64_t new)
>> +{
>> +    AspeedSMCFlash *fl =3D &s->flashes[cs];
>> +    AspeedSegments seg;
>> +
>> +    aspeed_smc_reg_to_segment(new, &seg);
>> +
>> +    /* The start address of CS0 is read-only */
>> +    if (cs =3D=3D 0 && seg.addr !=3D s->ctrl->flash_window_base) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Tried to change CS0 start address to 0x%"
>> +                      HWADDR_PRIx "\n", s->ctrl->name, seg.addr);
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * The end address of the AST2500 spi controllers is also
>> +     * read-only.
>> +     */
>> +    if ((s->ctrl->segments =3D=3D aspeed_segments_ast2500_spi1 ||
>> +         s->ctrl->segments =3D=3D aspeed_segments_ast2500_spi2) &&
>> +        cs =3D=3D s->ctrl->max_slaves &&
>> +        seg.addr + seg.size !=3D s->ctrl->segments[cs].addr +
>> +        s->ctrl->segments[cs].size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Tried to change CS%d end address to 0x%"
>> +                      HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr);
>> +        return;
>> +    }
>> +
>> +    /* Keep the segment in the overall flash window */
>> +    if (seg.addr + seg.size <=3D s->ctrl->flash_window_base ||
>> +        seg.addr > s->ctrl->flash_window_base + s->ctrl->flash_window=
_size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is i=
nvalid : "
>> +                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
>> +                      s->ctrl->name, cs, seg.addr, seg.addr + seg.siz=
e);
>> +        return;
>> +    }
>> +
>> +    /* Check start address vs. alignment */
>> +    if (seg.addr % seg.size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is n=
ot "
>> +                      "aligned : [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx=
" ]\n",
>> +                      s->ctrl->name, cs, seg.addr, seg.addr + seg.siz=
e);
>> +    }
>> +
>> +    /* And segments should not overlap */
>> +    if (aspeed_smc_flash_overlap(s, &seg, cs)) {
>> +        return;
>> +    }
>> +
>> +    /* All should be fine now to move the region */
>> +    memory_region_transaction_begin();
>> +    memory_region_set_size(&fl->mmio, seg.size);
>> +    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_wi=
ndow_base);
>> +    memory_region_set_enabled(&fl->mmio, true);
>> +    memory_region_transaction_commit();
>> +
>> +    s->regs[R_SEG_ADDR0 + cs] =3D new;
>> +}
>> +
>>  static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr ad=
dr,
>>                                                unsigned size)
>>  {
>> @@ -314,6 +425,12 @@ static void aspeed_smc_reset(DeviceState *d)
>>          s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
>>      }
>> =20
>> +    /* setup default segment register values for all */
>> +    for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
>> +        s->regs[R_SEG_ADDR0 + i] =3D
>> +            aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
>> +    }
>> +
>>      aspeed_smc_update_cs(s);
>>  }
>> =20
>> @@ -334,6 +451,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwad=
dr addr, unsigned int size)
>>          addr =3D=3D s->r_timings ||
>>          addr =3D=3D s->r_ce_ctrl ||
>>          addr =3D=3D R_INTR_CTRL ||
>> +        (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_s=
laves) ||
>>          (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
>>          return s->regs[addr];
>>      } else {
>> @@ -365,6 +483,13 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
>>      } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)=
 {
>>          s->regs[addr] =3D value;
>>          aspeed_smc_update_cs(s);
>> +    } else if (addr >=3D R_SEG_ADDR0 &&
>> +               addr < R_SEG_ADDR0 + s->ctrl->max_slaves) {
>> +        int cs =3D addr - R_SEG_ADDR0;
>> +
>> +        if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
>> +            aspeed_smc_flash_set_segment(s, cs, value);
>> +        }
>>      } else {
>>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PR=
Ix "\n",
>>                        __func__, addr);

