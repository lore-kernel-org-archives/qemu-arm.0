Received: by 10.223.159.74 with SMTP id f10csp768601wrg;
        Fri, 15 Dec 2017 10:51:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBov/iQp9bdFvslJ4ueUCw9H5uY7ZOYNJmecJncgZHvWAHQ4ReWgLiqdf37V5f3/RaE9V5hTq
X-Received: by 10.129.148.196 with SMTP id l187mr8085665ywg.3.1513363904884;
        Fri, 15 Dec 2017 10:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513363904; cv=none;
        d=google.com; s=arc-20160816;
        b=UBUIxtds8AWX+1Db3vZ9O32XBYdeqSTWfsUvg0ILv3MEAHzxXOELMw/elzZLwmw21+
         x+JYOCrNbVpwFoW4EZsrcvXyuNN8VAeEC6ouYKJXT04PFqsq5sL1GyzAO9MR5ftufPF6
         nRpt0OGnoGZrq73FRJEDEDUdJf+BLck2GI2gfjyEoGNJCSfjuNHGWAx+WTUWlzWu4/mS
         s6rCZ92bXPi3LNc3aQuD4r82wyp4hSf7u7uUtikowUcpsvRLfl0AwrwCbh0x3ii4yBo7
         7HNygCLExy61/avLhtI/Wn1xMP8hU9kxmmY4nq27eNfQdS5qxnTwaSParg7s+NvX66OV
         VAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=uw8t+nalKWiOaSnTVhXyUBvKgFLag7Xd2OOojMHqYXU=;
        b=D1eEvGBx679ogDRoZKwdgk6TydR00YnWqtQv0RYncTKggeK6V7cnyUTkTOh0/B6aLJ
         hYVpcCbnmL1YXVj+58ogQGg8xzUOZdl2yFOTOHBZKOl+LwNeWqnulsqVcpFBsEV4MO7C
         wmMjPrjpuY6+RAvYJUH7jnE+J6tv8dgiGsEPSXREgPa0v2QJmM3TEZcClSqvqWkqZOjV
         eWIsRhVNDu01VJa9qRfu1UT6SpC9ss72drZmNzJaYwK7Fq6EayJBPH/QZvk9Gg+h9qio
         w7vMr63pXcvkB2raaEcH1cKJdYjF5K4IbAHdVzUOcvKsQ64OvkWKU7hj5E6reMywnnx9
         K81A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vRj2tQtM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c188si1392206ybb.610.2017.12.15.10.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 10:51:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vRj2tQtM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePv5E-0004wr-7p
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 13:51:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePv4w-0004tQ-AB
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 13:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePv4u-00048C-MR
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 13:51:26 -0500
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:37884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePv4u-000467-Fy; Fri, 15 Dec 2017 13:51:24 -0500
Received: by mail-qt0-x231.google.com with SMTP id f2so13284467qtj.4;
	Fri, 15 Dec 2017 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uw8t+nalKWiOaSnTVhXyUBvKgFLag7Xd2OOojMHqYXU=;
	b=vRj2tQtMibbMAU/1FZFekKGHb4qj883bfnNJkj0NDMG6rgyq1RIBmuMxAJ/DH2h3LG
	xWv1Sd1rwA9Y61xU7glsX47OJDdIk0YWWE8M/BcESWSfqptleeCehwR4No27dwlVW1U+
	/UjFhNSQ0xzmaYRNH9KgnP4TIle/jAi/xSaqPUcB1cpTXLEeY8lRowixmmFEoIEAJOrN
	0tpDxw0TelZKKfRPkSRmV3WqGrQxwh7k085Fk3U4YewTQ+1UiWZzhZNgomp8BFx1ST2F
	AXnkgegrcqxe7GzRUQz/ncfbRUYBc6vT8WTcQMMw2nNK/8ho0fIo0rcdXEOPlz4DnCKi
	Lz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uw8t+nalKWiOaSnTVhXyUBvKgFLag7Xd2OOojMHqYXU=;
	b=W0iufc3uGD9rEb6sz08FgVktCX0/s9m0LemNJs0Mj1njZZZCajBNYXzESBzrbvpJcs
	tRTGf474xvZTYJ0JWQY0V87fV+VR2uvU6RrSby2iVUUVUzpAD6Qm7+uyutXSjd17WKvJ
	88iPdYSD75S+MLLPoXTHs9kvvjic9mm0WmMJxF/orJJjD7Rfn/9h2A5ySyUIuzknnmI1
	BEEA7Jb8M1Ayi2/+POK5wLvOKs2mOgGPKUPRF9BE8TU6QPPBGJQddsqP7KQPC77bbXgo
	Pk42r46Ka6pmEtRvnaSy01RuU7GihBe9EFFCFfcqEyVwGbKj4rzntfKm2IWphLBjnzE8
	iWfw==
X-Gm-Message-State: AKGB3mJRFNJXUGbryg8v1cxnaPtQffV51/RpLSeGiifP4xdJBWp09Jrb
	Lq/MQ6uVs75wu7Kr2uzUeX5wsyAwPpswsSOWk9o=
X-Received: by 10.200.27.43 with SMTP id y40mr23978038qtj.126.1513363882247;
	Fri, 15 Dec 2017 10:51:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Fri, 15 Dec 2017 10:51:21 -0800 (PST)
In-Reply-To: <c0810d46-60df-2239-fab6-6c1c11f1c274@amsat.org>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
	<20171214145255.31545-13-andrew.smirnov@gmail.com>
	<c0810d46-60df-2239-fab6-6c1c11f1c274@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 15 Dec 2017 10:51:21 -0800
Message-ID: <CAHQ1cqFAzRSXGsLJOiqiyBHDAwNBuLkFNLocydWii7QEdkdP7Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-arm] [PATCH v2 12/15] sdhci: Add i.MX specific subtype of
 SDHCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9P7GtcrosZAI

On Thu, Dec 14, 2017 at 6:31 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Andrey, Peter.
>
> I rather disagree with this patch, however I applied it on top of my
> current tree and plan to refactor it. But if it is applied before, I can
> survive :) Not a strong NACK.
>

Umm, Philippe, I didn't really ask you to refactor my code and I'd
really appreciate if you'd engage into a proper review process with me
on this patch, instead of just telling me "I don't like the code, but,
worry not, I'll bulldoze it away later anyway".


> See comment inlined.
>
> On 12/14/2017 11:52 AM, Andrey Smirnov wrote:
>> IP block found on several generations of i.MX family does not use
>> vanilla SDHCI implementation and it comes with a number of quirks.
>>
>> Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
>> support unmodified Linux guest driver.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/sd/sdhci-internal.h |  19 +++++
>>  hw/sd/sdhci.c          | 228 ++++++++++++++++++++++++++++++++++++++++++=
++++++-
>>  include/hw/sd/sdhci.h  |  14 +++
>>  3 files changed, 259 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
>> index 161177cf39..b86ac0791b 100644
>> --- a/hw/sd/sdhci-internal.h
>> +++ b/hw/sd/sdhci-internal.h
>> @@ -85,12 +85,18 @@
>>
>>  /* R/W Host control Register 0x0 */
>>  #define SDHC_HOSTCTL                   0x28
>> +#define SDHC_CTRL_LED                  0x01
>>  #define SDHC_CTRL_DMA_CHECK_MASK       0x18
>>  #define SDHC_CTRL_SDMA                 0x00
>>  #define SDHC_CTRL_ADMA1_32             0x08
>>  #define SDHC_CTRL_ADMA2_32             0x10
>>  #define SDHC_CTRL_ADMA2_64             0x18
>>  #define SDHC_DMA_TYPE(x)               ((x) & SDHC_CTRL_DMA_CHECK_MASK)
>> +#define SDHC_CTRL_4BITBUS              0x02
>> +#define SDHC_CTRL_8BITBUS              0x20
>> +#define SDHC_CTRL_CDTEST_INS           0x40
>> +#define SDHC_CTRL_CDTEST_EN            0x80
>> +
>>
>>  /* R/W Power Control Register 0x0 */
>>  #define SDHC_PWRCON                    0x29
>> @@ -229,4 +235,17 @@ enum {
>>
>>  extern const VMStateDescription sdhci_vmstate;
>>
>> +
>> +#define ESDHC_MIX_CTRL                  0x48
>> +#define ESDHC_VENDOR_SPEC               0xc0
>> +#define ESDHC_DLL_CTRL                  0x60
>> +
>> +#define ESDHC_TUNING_CTRL               0xcc
>> +#define ESDHC_TUNE_CTRL_STATUS          0x68
>> +#define ESDHC_WTMK_LVL                  0x44
>> +
>> +#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
>> +#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
>> +
>> +
>>  #endif
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index 6d6a791ee9..758af067f9 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -265,7 +265,8 @@ static void sdhci_send_command(SDHCIState *s)
>>              }
>>          }
>>
>> -        if ((s->norintstsen & SDHC_NISEN_TRSCMP) &&
>> +        if (!(s->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
>> +            (s->norintstsen & SDHC_NISEN_TRSCMP) &&
>>              (s->cmdreg & SDHC_CMD_RESPONSE) =3D=3D SDHC_CMD_RSP_WITH_BU=
SY) {
>>              s->norintsts |=3D SDHC_NIS_TRSCMP;
>>          }
>> @@ -1191,6 +1192,8 @@ static void sdhci_initfn(SDHCIState *s)
>>
>>      s->insert_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_in=
sertion_irq, s);
>>      s->transfer_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_t=
ransfer, s);
>> +
>> +    s->io_ops =3D &sdhci_mmio_ops;
>>  }
>>
>>  static void sdhci_uninitfn(SDHCIState *s)
>> @@ -1347,7 +1350,7 @@ static void sdhci_sysbus_realize(DeviceState *dev,=
 Error ** errp)
>>      s->buf_maxsz =3D sdhci_get_fifolen(s);
>>      s->fifo_buffer =3D g_malloc0(s->buf_maxsz);
>>      sysbus_init_irq(sbd, &s->irq);
>> -    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sd=
hci",
>> +    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
>>              SDHC_REGISTERS_MAP_SIZE);
>>      sysbus_init_mmio(sbd, &s->iomem);
>>  }
>> @@ -1386,11 +1389,232 @@ static const TypeInfo sdhci_bus_info =3D {
>>      .class_init =3D sdhci_bus_class_init,
>>  };
>>
>> +static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
>> +{
>> +    SDHCIState *s =3D SYSBUS_SDHCI(opaque);
>> +    uint32_t ret;
>> +    uint16_t hostctl;
>> +
>> +    switch (offset) {
>> +    default:
>> +        return sdhci_read(opaque, offset, size);
>> +
>> +    case SDHC_HOSTCTL:
>> +        /*
>> +         * For a detailed explanation on the following bit
>> +         * manipulation code see comments in a similar part of
>> +         * usdhc_write()
>> +         */
>> +        hostctl =3D SDHC_DMA_TYPE(s->hostctl) << (8 - 3);
>> +
>> +        if (s->hostctl & SDHC_CTRL_8BITBUS) {
>> +            hostctl |=3D ESDHC_CTRL_8BITBUS;
>> +        }
>> +
>> +        if (s->hostctl & SDHC_CTRL_4BITBUS) {
>> +            hostctl |=3D ESDHC_CTRL_4BITBUS;
>> +        }
>> +
>> +        ret  =3D hostctl;
>> +        ret |=3D (uint32_t)s->blkgap << 16;
>> +        ret |=3D (uint32_t)s->wakcon << 24;
>> +
>> +        break;
>> +
>> +    case ESDHC_DLL_CTRL:
>> +    case ESDHC_TUNE_CTRL_STATUS:
>> +    case 0x6c:
>> +    case ESDHC_TUNING_CTRL:
>> +    case ESDHC_VENDOR_SPEC:
>> +    case ESDHC_MIX_CTRL:
>> +    case ESDHC_WTMK_LVL:
>> +        ret =3D 0;
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void
>> +usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>> +{
>> +    SDHCIState *s =3D SYSBUS_SDHCI(opaque);
>> +    uint8_t hostctl;
>> +    uint32_t value =3D (uint32_t)val;
>> +
>> +    switch (offset) {
>> +    case ESDHC_DLL_CTRL:
>> +    case ESDHC_TUNE_CTRL_STATUS:
>> +    case 0x6c:
>> +    case ESDHC_TUNING_CTRL:
>> +    case ESDHC_WTMK_LVL:
>> +    case ESDHC_VENDOR_SPEC:
>> +        break;
>> +
>> +    case SDHC_HOSTCTL:
>> +        /*
>> +         * Here's What ESDHCI has at offset 0x28 (SDHC_HOSTCTL)
>> +         *
>> +         *       7         6     5      4      3      2        1      0
>> +         * |-----------+--------+--------+-----------+----------+------=
---|
>> +         * | Card      | Card   | Endian | DATA3     | Data     | Led  =
   |
>> +         * | Detect    | Detect | Mode   | as Card   | Transfer | Contr=
ol |
>> +         * | Signal    | Test   |        | Detection | Width    |      =
   |
>> +         * | Selection | Level  |        | Pin       |          |      =
   |
>> +         * |-----------+--------+--------+-----------+----------+------=
---|
>> +         *
>> +         * and 0x29
>> +         *
>> +         *  15      10 9    8
>> +         * |----------+------|
>> +         * | Reserved | DMA  |
>> +         * |          | Sel. |
>> +         * |          |      |
>> +         * |----------+------|
>> +         *
>> +         * and here's what SDCHI spec expects those offsets to be:
>> +         *
>> +         * 0x28 (Host Control Register)
>> +         *
>> +         *     7        6         5       4  3      2         1        =
0
>> +         * |--------+--------+----------+------+--------+----------+---=
------|
>> +         * | Card   | Card   | Extended | DMA  | High   | Data     | LE=
D     |
>> +         * | Detect | Detect | Data     | Sel. | Speed  | Transfer | Co=
ntrol |
>> +         * | Signal | Test   | Transfer |      | Enable | Width    |   =
      |
>> +         * | Sel.   | Level  | Width    |      |        |          |   =
      |
>> +         * |--------+--------+----------+------+--------+----------+---=
------|
>> +         *
>> +         * and 0x29 (Power Control Register)
>> +         *
>> +         * |----------------------------------|
>> +         * | Power Control Register           |
>> +         * |                                  |
>> +         * | Description omitted,             |
>> +         * | since it has no analog in ESDHCI |
>> +         * |                                  |
>> +         * |----------------------------------|
>> +         *
>> +         * Since offsets 0x2A and 0x2B should be compatible between
>> +         * both IP specs we only need to reconcile least 16-bit of the
>> +         * word we've been given.
>> +         */
>> +
>> +        /*
>> +         * First, save bits 7 6 and 0 since they are identical
>> +         */
>> +        hostctl =3D value & (SDHC_CTRL_LED |
>> +                           SDHC_CTRL_CDTEST_INS |
>> +                           SDHC_CTRL_CDTEST_EN);
>> +        /*
>> +         * Second, split "Data Transfer Width" from bits 2 and 1 in to
>> +         * bits 5 and 1
>> +         */
>> +        if (value & ESDHC_CTRL_8BITBUS) {
>> +            hostctl |=3D SDHC_CTRL_8BITBUS;
>> +        }
>> +
>> +        if (value & ESDHC_CTRL_4BITBUS) {
>> +            hostctl |=3D ESDHC_CTRL_4BITBUS;
>> +        }
>> +
>> +        /*
>> +         * Third, move DMA select from bits 9 and 8 to bits 4 and 3
>> +         */
>> +        hostctl |=3D SDHC_DMA_TYPE(value >> (8 - 3));
>> +
>> +        /*
>> +         * Now place the corrected value into low 16-bit of the value
>> +         * we are going to give standard SDHCI write function
>> +         *
>> +         * NOTE: This transformation should be the inverse of what can
>> +         * be found in drivers/mmc/host/sdhci-esdhc-imx.c in Linux
>> +         * kernel
>> +         */
>> +        value &=3D ~UINT16_MAX;
>> +        value |=3D hostctl;
>> +        value |=3D (uint16_t)s->pwrcon << 8;
>> +
>> +        sdhci_write(opaque, offset, value, size);
>> +        break;
>> +
>> +    case ESDHC_MIX_CTRL:
>> +        /*
>> +         * So, when SD/MMC stack in Linux tries to write to "Transfer
>> +         * Mode Register", ESDHC i.MX quirk code will translate it
>> +         * into a write to ESDHC_MIX_CTRL, so we do the opposite in
>> +         * order to get where we started
>> +         *
>> +         * Note that Auto CMD23 Enable bit is located in a wrong place
>> +         * on i.MX, but since it is not used by QEMU we do not care.
>> +         *
>> +         * We don't want to call sdhci_write(.., SDHC_TRNMOD, ...)
>> +         * here becuase it will result in a call to
>> +         * sdhci_send_command(s) which we don't want.
>> +         *
>> +         */
>> +        s->trnmod =3D value & UINT16_MAX;
>> +        break;
>> +    case SDHC_TRNMOD:
>> +        /*
>> +         * Similar to above, but this time a write to "Command
>> +         * Register" will be translated into a 4-byte write to
>> +         * "Transfer Mode register" where lower 16-bit of value would
>> +         * be set to zero. So what we do is fill those bits with
>> +         * cached value from s->trnmod and let the SDHCI
>> +         * infrastructure handle the rest
>> +         */
>> +        sdhci_write(opaque, offset, val | s->trnmod, size);
>> +        break;
>> +    case SDHC_BLKSIZE:
>> +        /*
>> +         * ESDHCI does not implement "Host SDMA Buffer Boundary", and
>> +         * Linux driver will try to zero this field out which will
>> +         * break the rest of SDHCI emulation.
>> +         *
>> +         * Linux defaults to maximum possible setting (512K boundary)
>> +         * and it seems to be the only option that i.MX IP implements,
>> +         * so we artificially set it to that value.
>> +         */
>> +        val |=3D 0x7 << 12;
>> +        /* FALLTHROUGH */
>> +    default:
>> +        sdhci_write(opaque, offset, val, size);
>> +        break;
>> +    }
>> +}
>> +
>> +
>> +static const MemoryRegionOps usdhc_mmio_ops =3D {
>> +    .read =3D usdhc_read,
>> +    .write =3D usdhc_write,
>> +    .valid =3D {
>> +        .min_access_size =3D 1,
>> +        .max_access_size =3D 4,
>> +        .unaligned =3D false
>> +    },
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +};
>
> I think the usdhc_mmio_ops can be avoided.
>

OK, care to actually elaborate on this?

>> +
>> +static void imx_usdhc_init(Object *obj)
>> +{
>> +    SDHCIState *s =3D SYSBUS_SDHCI(obj);
>> +
>> +    s->io_ops =3D &usdhc_mmio_ops;
>> +    s->quirks =3D SDHCI_QUIRK_NO_BUSY_IRQ;
>> +}
>> +
>> +static const TypeInfo imx_usdhc_info =3D {
>> +    .name =3D TYPE_IMX_USDHC,
>> +    .parent =3D TYPE_SYSBUS_SDHCI,
>> +    .instance_init =3D imx_usdhc_init,
>> +};
>
> there is no need to add yet another device. You can achieve the same
> using a property bit (like the "pending-insert-quirk" one).
>
> I think the correct way is to add a DEFINE_PROP_BIT64("quirks*").
>

And how's that better? Now, every i.MX user instead of instantiating a
uSDCH IP block, which matches what i.MX RM say, would have to instead
create SDHCI (confusing) as well as to set an quirk, which means they
have to know what SDHCI_QUIRK_NO_BUSY_IRQ means. What's the point of
spilling those internal implementation guts all of the place just to
avoid re-defining "yet another device"?

Thanks,
Andrey Smirnov
