Received: by 10.25.21.156 with SMTP id 28csp1246311lfv;
        Mon, 25 Jul 2016 08:58:02 -0700 (PDT)
X-Received: by 10.55.46.130 with SMTP id u124mr22424140qkh.35.1469462268365;
        Mon, 25 Jul 2016 08:57:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d185si18267905qke.286.2016.07.25.08.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 08:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRiGJ-0001VB-Np
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 11:57:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bRiEp-0000MY-QI
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bRiEm-0005FM-KN
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:56:15 -0400
Received: from 16.mo1.mail-out.ovh.net ([178.33.104.224]:60100)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bRiEm-0005F7-AQ
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:56:12 -0400
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 32127FF93F6
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 17:56:11 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player726.ha.ovh.net (Postfix) with ESMTPSA id 535502A0068;
	Mon, 25 Jul 2016 17:56:06 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
	<1467994016-11678-6-git-send-email-clg@kaod.org>
	<CAFEAcA_zfaVt1Yzs-o6fZr5rjg8+YNdfLGYAoAAYpoqW6XwaMA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1f7682da-fb70-8cc0-84b0-a3c2ec908f4c@kaod.org>
Date: Mon, 25 Jul 2016 17:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_zfaVt1Yzs-o6fZr5rjg8+YNdfLGYAoAAYpoqW6XwaMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3934738700616174507
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddriedugdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.104.224
Subject: Re: [Qemu-arm] [PATCH 5/5] ast2400: add a memory controller device
 model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sKnnjeMxRlyd

On 07/25/2016 05:12 PM, Peter Maydell wrote:
> On 8 July 2016 at 17:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> The uboot in the previous release of the SDK was using a hardcoded
>> value for memory size. This is not true anymore, the value is now
>> retrieved from the memory controller.
>>
>> Below is a model for this device, only supporting unlock and
>> configuration. Without it, we endup running a guest with 64MB, which
>> is a bit low nowdays. It uses a 'silicon-rev' property and ram_size to
>> build a default value. Some bits should be linked to SCU strapping
>> registers but it seems a bit complex to add for the current need.
>>
>> The model is ready for the AST2500 SOC.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>=20
> Just a few nits below.
>=20
>> +/*
>> + * Configuration register Ox4 (for Aspeed AST2400 SOC)
>> + *
>> + * These are for the record and future use. ASPEED_SDMC_DRAM_SIZE is
>> + * what we care about right now as it is checked by U-Boot to
>> + * determine the RAM size.
>> + */
>> +
>> +#define ASPEED_SDMC_AST2300_COMPAT      (1 << 10)
>> +#define ASPEED_SDMC_SCRAMBLE_PATTERN    (1 << 9)
>> +#define ASPEED_SDMC_DATA_SCRAMBLE       (1 << 8)
>> +#define ASPEED_SDMC_ECC_ENABLE          (1 << 7)
>> +#define ASPEED_SDMC_VGA_COMPAT          (1 << 6) /* readonly */
>> +#define ASPEED_SDMC_DRAM_BANK           (1 << 5)
>> +#define ASPEED_SDMC_DRAM_BURST          (1 << 4)
>> +#define ASPEED_SDMC_VGA_APERTURE(x)     ((x & 0x3) << 2) /* readonly =
*/
>> +#define     ASPEED_SDMC_VGA_8MB             0x0
>> +#define     ASPEED_SDMC_VGA_16MB            0x1
>> +#define     ASPEED_SDMC_VGA_32MB            0x2
>> +#define     ASPEED_SDMC_VGA_64MB            0x3
>> +#define ASPEED_SDMC_DRAM_SIZE(x)        (x & 0x3)
>> +#define     ASPEED_SDMC_DRAM_64MB           0x0
>> +#define     ASPEED_SDMC_DRAM_128MB          0x1
>> +#define     ASPEED_SDMC_DRAM_256MB          0x2
>> +#define     ASPEED_SDMC_DRAM_512MB          0x3
>> +
>> +/*
>> + * Configuration register Ox4 (for Aspeed AST2500 SOC and higher)
>> + *
>> + * Incompatibilities are annoted in the list. ASPEED_SDMC_HW_VERSION
>=20
> "noted" or "annotated".
>=20
>> + * should be set to 1 for the AST2500 SOC.
>> + */
>> +#define ASPEED_SDMC_HW_VERSION(x)       ((x & 0xf) << 28) /* readonly=
 */
>> +#define ASPEED_SDMC_SW_VERSION          ((x & 0xff) << 20)
>> +#define ASPEED_SDMC_CACHE_INITIAL_DONE  (1 << 19) /* readonly */
>> +#define ASPEED_SDMC_CACHE_DDR4_CONF     (1 << 13)
>> +#define ASPEED_SDMC_CACHE_INITIAL       (1 << 12)
>> +#define ASPEED_SDMC_CACHE_RANGE_CTRL    (1 << 11)
>> +#define ASPEED_SDMC_CACHE_ENABLE        (1 << 10) /* differs from AST=
2400 */
>> +#define ASPEED_SDMC_DRAM_TYPE           (1 << 4)  /* differs from AST=
2400 */
>> +
>> +/* DRAM size definitions differs */
>> +#define     ASPEED_SDMC_AST2500_128MB       0x0
>> +#define     ASPEED_SDMC_AST2500_256MB       0x1
>> +#define     ASPEED_SDMC_AST2500_512MB       0x2
>> +#define     ASPEED_SDMC_AST2500_1024MB      0x3
>> +
>=20
>> +    if (addr =3D=3D R_CONF) {
>> +        /* Make sure readonly bits are kept */
>> +        switch (s->silicon_rev) {
>> +        case AST2400_A0_SILICON_REV:
>> +            data &=3D 0x000007B3;
>> +            break;
>> +        case AST2500_A0_SILICON_REV:
>> +            data &=3D 0x0FF03FB3;
>> +            break;
>=20
> Maybe these would be more readable using the symbolic constant
> names you #defined above? (Or maybe not; your choice.)

symbolic constants are better but I was lazy for these. I will see=20
if I can build a mask from the above defines.

>=20
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>> +    }
>> +
>> +    s->regs[addr] =3D data;
>> +}
>> +
>> +static const MemoryRegionOps aspeed_sdmc_ops =3D {
>> +    .read =3D aspeed_sdmc_read,
>> +    .write =3D aspeed_sdmc_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid.min_access_size =3D 4,
>> +    .valid.max_access_size =3D 4,
>> +    .valid.unaligned =3D false,
>=20
> .valid.unaligned =3D false is the default, you don't need to
> specify it explicitly.
>=20
>> +};
>> +
>> +static int ast2400_rambits(void)
>> +{
>> +    switch (ram_size >> 20) {
>> +    case   64: return ASPEED_SDMC_DRAM_64MB;
>> +    case  128: return ASPEED_SDMC_DRAM_128MB;
>> +    case  256: return ASPEED_SDMC_DRAM_256MB;
>> +    case  512: return ASPEED_SDMC_DRAM_512MB;
>=20
> These should have newlines between the case line and the code.

OK will do.=20

>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x%"
>> +                      HWADDR_PRIx "\n", __func__, ram_size);
>> +        break;
>> +    }
>> +
>> +    /* set a minimum default */
>> +    return ASPEED_SDMC_DRAM_64MB;
>> +}
>> +
>> +static int ast2500_rambits(void)
>> +{
>> +    switch (ram_size >> 20) {
>> +    case  128: return ASPEED_SDMC_AST2500_128MB;
>> +    case  256: return ASPEED_SDMC_AST2500_256MB;
>> +    case  512: return ASPEED_SDMC_AST2500_512MB;
>> +    case 1024: return ASPEED_SDMC_AST2500_1024MB;
>=20
> Ditto.
>=20
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x%"
>> +                      HWADDR_PRIx "\n", __func__, ram_size);
>> +        break;
>> +    }
>> +
>> +    /* set a minimum default */
>> +    return ASPEED_SDMC_AST2500_128MB;
>> +}
>> +
>> +static void aspeed_sdmc_reset(DeviceState *dev)
>> +{
>> +    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
>> +
>> +    memset(s->regs, 0, sizeof(s->regs));
>> +
>> +    /* Set ram size bit and defaults values */
>> +    switch (s->silicon_rev) {
>> +    case AST2400_A0_SILICON_REV:
>> +        s->regs[R_CONF] |=3D
>> +            ASPEED_SDMC_VGA_COMPAT |
>> +            ASPEED_SDMC_DRAM_SIZE(ast2400_rambits());
>> +        break;
>> +
>> +    case AST2500_A0_SILICON_REV:
>> +        s->regs[R_CONF] |=3D
>> +            ASPEED_SDMC_HW_VERSION(1) |
>> +            ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
>> +            ASPEED_SDMC_DRAM_SIZE(ast2500_rambits());
>=20
> Missing "break;".

Indeed.

>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>=20
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks for the review, I will send an updated version.

C.=20


> thanks
> -- PMM
>

