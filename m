Received: by 10.223.197.9 with SMTP id q9csp2576557wrf;
        Mon, 9 Oct 2017 08:38:19 -0700 (PDT)
X-Received: by 10.55.102.215 with SMTP id a206mr9851363qkc.269.1507563498899;
        Mon, 09 Oct 2017 08:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507563498; cv=none;
        d=google.com; s=arc-20160816;
        b=0oUM0u3Di1dyKdehalcpw6yWYNz+7NipiAiKqIL3927SOsQS9UUUgVrwSStWhL0kLO
         CF7TWoV8a0HrmVVqoBGK2xhvBm0SnJZirioVrJryG5KLSjhqEK0lFCIbcjWHKN1a9D2Z
         vQMxhkErscAJGfVlDKNvzu91+BKqX0ARMbjwAq3u5d0TZy9j8Ik8uQ/D7zFhB27+TRQA
         zQDRVuQDVb7CCFnpHQj+gd4/PHX7U1urJnsazaORh8bMBei3aLEURcDeB7qaHOxRwSrr
         oL5w7u6y2PRtbky8EunYgEI/1VMq0Ang6DSEj+XkBy3GWg2VVRDrfxG7vn9kxmDizrbN
         9gIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6mupNoYRvxYIOyaXVFulrb1u2CCE8fiw/zQ2tMaELDI=;
        b=VznDEgFK5vBAPxlcdaXSfydLgDLHFPIoSOHyB91PVczTBxzELQLNIf0uaXxfPMF0jY
         lPWrrTpdAAWCw/KNKlkdrQp4qlLmq+d1mUmo2jYc6vqkInebKO67w/66xT3csSyrbvH7
         NNirO5UlM52oI50nFbO4BrBg87DZ+uOv861maZ7VsrZJAmoI65ADUSw5Cw+zRfuWvIVQ
         u7Nk8G1aZf7I9Un9ui086EKDPKs/FgoVOoixcHLSfdAvnDz7V0jU47DulDvvUYmDeVbp
         6sEWkqb9KHxHXmOfF/l3biyeS8wiiCcxHH5mmN0yUxEPzh4LznoHSxqvewz3Yyx9z4FP
         oGOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TorIEC2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4si4339013qte.343.2017.10.09.08.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 08:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TorIEC2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1a8I-0007PV-DS
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 11:38:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1a87-0007OK-Lh
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:38:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1a86-0005up-8W
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:38:07 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1a86-0005ui-1d; Mon, 09 Oct 2017 11:38:06 -0400
Received: by mail-qk0-x243.google.com with SMTP id a12so13913650qka.4;
	Mon, 09 Oct 2017 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6mupNoYRvxYIOyaXVFulrb1u2CCE8fiw/zQ2tMaELDI=;
	b=TorIEC2tWGbAm0f7jnAi4vM/qn7EU7lfg73uw4LhBGDfMDitEIteQMZ5ZpKzhsSaAy
	NUBozI/+LWUyuoBxwk+U24RXCBOmP/lop+EZv283dXfUbzDruOrgcp1/G4hnZr0TukwM
	0YrDMMSgkO+cfxJp3A5J6lNWzSZR1qAoT+Mv3ttEvwwVGTssVd9DrH0nTLj/vdhkTxF/
	95JctoVhKcK9q9xT5UI513/RCxqO4/iN2mfvBOjLOtyuFPzIiLxqFuPoNolyHrXDrfxg
	UH/zs+flybGX1ptJj++BrKFnKmEpi8WLEx5nDC0/kTRGQ7zZ2Tfm+Y8JUDHP4t86+8N5
	Lllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6mupNoYRvxYIOyaXVFulrb1u2CCE8fiw/zQ2tMaELDI=;
	b=A5cgoR7/AMN3Mb9Zf/PX6HIg/yhF3k6ukqWIwUqF/kniWi99pT4aVBfYPn81WRnFTC
	HJC8YBYsXXOk+dw9/rqujjr1nauk75NbQwkh/LOw7hr2EL8zQDxBecnu8AUNHkM9GxiP
	Ze6E6L+/t68hrbMSxEvMdoMHpmUBmojIloOjgqAsOAI2lJ1HSyZUPjEeQ6J9pXnqpZRv
	zXP0LSkeOlFQ29KaCzfXdhh8iyCv/W37G9PDoeseasbVVFhuOLiLJTgpNYL+n/8+yaY8
	JhcdnoKv6mDbWzWwDc1DxXQFdnWjk8hLwOnoglzQYxlFqQCv61X+/GwdQguBriQKli5F
	5INA==
X-Gm-Message-State: AMCzsaVKB2cF/Nfo04PRzmNdXOyk7GzxSRgoSLKqWIPcqvN0AOsP+Ytw
	kTtoggUu3a0vAOAA2cI2o8dTlqC2W33ymXshHnU=
X-Google-Smtp-Source: AOwi7QD+Ko0D4Ie7XPYw9WQogp40HyIzRZgrtmRzAAEV1aFpNkGMWWHoNGyHagJ1+Hb/g2uteUT++dMjlXCKiy8k/ZY=
X-Received: by 10.55.201.135 with SMTP id m7mr10236759qkl.97.1507563485271;
	Mon, 09 Oct 2017 08:38:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 08:38:04 -0700 (PDT)
In-Reply-To: <CAFEAcA_5Yt4a3gE8pHAdE9RnY-SZoucMkt8CParasA1YQxKUfg@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-9-andrew.smirnov@gmail.com>
	<CAFEAcA_5Yt4a3gE8pHAdE9RnY-SZoucMkt8CParasA1YQxKUfg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 08:38:04 -0700
Message-ID: <CAHQ1cqFdjYgj9s2yz_LUv=uheK5Yy0YQ9o-3McLopAFqeVx43Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 08/17] imx_fec: Add support for multiple Tx
 DMA rings
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r4n3/ihbDy3M

On Fri, Oct 6, 2017 at 7:10 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> More recent version of the IP block support more than one Tx DMA ring,
>> so add the code implementing that feature.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> I'm surprised this doesn't mean "we have a property on the device
> to indicate what IP version it is, which the boards set". Or are
> all our current boards mismodelling their ethernet devices with the
> wrong number of TX rings ?
>

As far as I know the only already emulated SoC that this affects is
i.MX6, and, no, it doesn't mismodel its Ethernet device since it has
version of the IP block with only one Tx ring. I didn't add any notion
of versioning because it didn't seem necessary, since 3-ring IP block
should be backwards compatible with 1-ring version and host drivers
written for the latter will end up using only ring #1 of the 3-ring
block.

>> ---
>>  hw/net/imx_fec.c         | 97 +++++++++++++++++++++++++++++++++++++++---------
>>  include/hw/net/imx_fec.h | 23 +++++++++++-
>>  2 files changed, 101 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index bd62d7a75f..6045ffe673 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -196,6 +196,17 @@ static const char *imx_eth_reg_name(IMXFECState *s, uint32_t index)
>>      }
>>  }
>>
>> +static const VMStateDescription vmstate_imx_eth_tx_ring = {
>> +    .name = "fec-tx-ring",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(descriptor, IMXFECTxRing),
>> +        VMSTATE_UINT32(tdsr, IMXFECTxRing),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +
>>  static const VMStateDescription vmstate_imx_eth = {
>>      .name = TYPE_IMX_FEC,
>>      .version_id = 2,
>> @@ -203,8 +214,10 @@ static const VMStateDescription vmstate_imx_eth = {
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT32_ARRAY(regs, IMXFECState, ENET_MAX),
>>          VMSTATE_UINT32(rx_descriptor, IMXFECState),
>> -        VMSTATE_UINT32(tx_descriptor, IMXFECState),
>> -
>> +        VMSTATE_STRUCT_ARRAY(tx_ring, IMXFECState,
>> +                             ENET_TX_RING_NUM,
>> +                             1, vmstate_imx_eth_tx_ring,
>> +                             IMXFECTxRing),
>>          VMSTATE_UINT32(phy_status, IMXFECState),
>>          VMSTATE_UINT32(phy_control, IMXFECState),
>>          VMSTATE_UINT32(phy_advertise, IMXFECState),
>
> This breaks migration compatibility, so you need to figure out
> how you want to handle that. The simple solution is to increment
> the version_id and minimum_version_id fields in vmstate_imx_eth;
> that will mean migration from an old QEMU to a new one doesn't
> work but it fails in a clean way. The complex way is to put the
> new state into a migration subsection with a .needed function
> to determine whether to use it or not. For imx I think we can
> get away with the simple solution.
>

OK, will do in v2.

>> @@ -407,7 +420,7 @@ static void imx_fec_do_tx(IMXFECState *s)
>>      int frame_size = 0, descnt = 0;
>>      uint8_t frame[ENET_MAX_FRAME_SIZE];
>>      uint8_t *ptr = frame;
>> -    uint32_t addr = s->tx_descriptor;
>> +    uint32_t addr = s->tx_ring[0].descriptor;
>>
>>      while (descnt++ < IMX_MAX_DESC) {
>>          IMXFECBufDesc bd;
>> @@ -448,17 +461,38 @@ static void imx_fec_do_tx(IMXFECState *s)
>>          }
>>      }
>>
>> -    s->tx_descriptor = addr;
>> +    s->tx_ring[0].descriptor = addr;
>>
>>      imx_eth_update(s);
>>  }
>>
>> -static void imx_enet_do_tx(IMXFECState *s)
>> +static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
>>  {
>>      int frame_size = 0, descnt = 0;
>>      uint8_t frame[ENET_MAX_FRAME_SIZE];
>>      uint8_t *ptr = frame;
>> -    uint32_t addr = s->tx_descriptor;
>> +    IMXFECTxRing *ring;
>> +    uint32_t addr;
>> +
>> +    switch (index) {
>> +    case ENET_TDAR:
>> +        ring = &s->tx_ring[0];
>> +        break;
>> +    case ENET_TDAR1:
>> +        ring = &s->tx_ring[1];
>> +        break;
>> +    case ENET_TDAR2:
>> +        ring = &s->tx_ring[2];
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: bogus value for index %x\n",
>> +                      __func__, index);
>> +        abort();
>> +        break;
>> +    }
>> +
>> +    addr = ring->descriptor;
>>
>>      while (descnt++ < IMX_MAX_DESC) {
>>          IMXENETBufDesc bd;
>> @@ -502,32 +536,32 @@ static void imx_enet_do_tx(IMXFECState *s)
>>              ptr = frame;
>>              frame_size = 0;
>>              if (bd.option & ENET_BD_TX_INT) {
>> -                s->regs[ENET_EIR] |= ENET_INT_TXF;
>> +                s->regs[ENET_EIR] |= ring->int_txf;
>>              }
>>          }
>>          if (bd.option & ENET_BD_TX_INT) {
>> -            s->regs[ENET_EIR] |= ENET_INT_TXB;
>> +            s->regs[ENET_EIR] |= ring->int_txb;
>>          }
>>          bd.flags &= ~ENET_BD_R;
>>          /* Write back the modified descriptor.  */
>>          imx_enet_write_bd(&bd, addr);
>>          /* Advance to the next descriptor.  */
>>          if ((bd.flags & ENET_BD_W) != 0) {
>> -            addr = s->regs[ENET_TDSR];
>> +            addr = s->regs[ring->tdsr];
>>          } else {
>>              addr += sizeof(bd);
>>          }
>>      }
>>
>> -    s->tx_descriptor = addr;
>> +    ring->descriptor = addr;
>>
>>      imx_eth_update(s);
>>  }
>>
>> -static void imx_eth_do_tx(IMXFECState *s)
>> +static void imx_eth_do_tx(IMXFECState *s, uint32_t index)
>>  {
>>      if (!s->is_fec && (s->regs[ENET_ECR] & ENET_ECR_EN1588)) {
>> -        imx_enet_do_tx(s);
>> +        imx_enet_do_tx(s, index);
>>      } else {
>>          imx_fec_do_tx(s);
>>      }
>> @@ -586,7 +620,22 @@ static void imx_eth_reset(DeviceState *d)
>>      }
>>
>>      s->rx_descriptor = 0;
>> -    s->tx_descriptor = 0;
>> +
>> +    s->tx_ring[0].tdsr = ENET_TDSR;
>> +    s->tx_ring[1].tdsr = ENET_TDSR1;
>> +    s->tx_ring[2].tdsr = ENET_TDSR2;
>> +
>> +    s->tx_ring[0].int_txf = ENET_INT_TXF;
>> +    s->tx_ring[1].int_txf = ENET_INT_TXF1;
>> +    s->tx_ring[2].int_txf = ENET_INT_TXF2;
>> +
>> +    s->tx_ring[0].int_txb = ENET_INT_TXB;
>> +    s->tx_ring[1].int_txb = ENET_INT_TXB1;
>> +    s->tx_ring[2].int_txb = ENET_INT_TXB2;
>> +
>> +    s->tx_ring[0].descriptor = 0;
>> +    s->tx_ring[1].descriptor = 0;
>> +    s->tx_ring[2].descriptor = 0;
>>
>>      /* We also reset the PHY */
>>      phy_reset(s);
>> @@ -814,10 +863,12 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
>>              s->regs[index] = 0;
>>          }
>>          break;
>> +    case ENET_TDAR1:    /* FALLTHROUGH */
>> +    case ENET_TDAR2:    /* FALLTHROUGH */
>>      case ENET_TDAR:
>>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>>              s->regs[index] = ENET_TDAR_TDAR;
>> -            imx_eth_do_tx(s);
>> +            imx_eth_do_tx(s, index);
>>          }
>>          s->regs[index] = 0;
>>          break;
>> @@ -829,8 +880,12 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
>>          if ((s->regs[index] & ENET_ECR_ETHEREN) == 0) {
>>              s->regs[ENET_RDAR] = 0;
>>              s->rx_descriptor = s->regs[ENET_RDSR];
>> -            s->regs[ENET_TDAR] = 0;
>> -            s->tx_descriptor = s->regs[ENET_TDSR];
>> +            s->regs[ENET_TDAR]  = 0;
>> +            s->regs[ENET_TDAR1] = 0;
>> +            s->regs[ENET_TDAR2] = 0;
>> +            s->tx_ring[0].descriptor = s->regs[ENET_TDSR];
>> +            s->tx_ring[1].descriptor = s->regs[ENET_TDSR1];
>> +            s->tx_ring[2].descriptor = s->regs[ENET_TDSR2];
>>          }
>>          break;
>>      case ENET_MMFR:
>> @@ -908,7 +963,15 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
>>          } else {
>>              s->regs[index] = value & ~7;
>>          }
>> -        s->tx_descriptor = s->regs[index];
>> +        s->tx_ring[0].descriptor = s->regs[index];
>> +        break;
>> +    case ENET_TDSR1:
>> +        s->regs[index] = value & ~7;
>> +        s->tx_ring[1].descriptor = s->regs[index];
>> +        break;
>> +    case ENET_TDSR2:
>> +        s->regs[index] = value & ~7;
>> +        s->tx_ring[2].descriptor = s->regs[index];
>>          break;
>>      case ENET_MRBR:
>>          s->regs[index] = value & 0x00003ff0;
>> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
>> index 20a6aa98b4..40bd29771f 100644
>> --- a/include/hw/net/imx_fec.h
>> +++ b/include/hw/net/imx_fec.h
>> @@ -52,6 +52,8 @@
>>  #define ENET_TFWR              81
>>  #define ENET_FRBR              83
>>  #define ENET_FRSR              84
>> +#define ENET_TDSR1             89
>> +#define ENET_TDSR2             92
>>  #define ENET_RDSR              96
>>  #define ENET_TDSR              97
>>  #define ENET_MRBR              98
>> @@ -66,6 +68,8 @@
>>  #define ENET_FTRL              108
>>  #define ENET_TACC              112
>>  #define ENET_RACC              113
>> +#define ENET_TDAR1             121
>> +#define ENET_TDAR2             123
>>  #define ENET_MIIGSK_CFGR       192
>>  #define ENET_MIIGSK_ENR        194
>>  #define ENET_ATCR              256
>> @@ -106,13 +110,18 @@
>>  #define ENET_INT_WAKEUP        (1 << 17)
>>  #define ENET_INT_TS_AVAIL      (1 << 16)
>>  #define ENET_INT_TS_TIMER      (1 << 15)
>> +#define ENET_INT_TXF2          (1 <<  7)
>> +#define ENET_INT_TXB2          (1 <<  6)
>> +#define ENET_INT_TXF1          (1 <<  3)
>> +#define ENET_INT_TXB1          (1 <<  2)
>>
>>  #define ENET_INT_MAC           (ENET_INT_HB | ENET_INT_BABR | ENET_INT_BABT | \
>>                                  ENET_INT_GRA | ENET_INT_TXF | ENET_INT_TXB | \
>>                                  ENET_INT_RXF | ENET_INT_RXB | ENET_INT_MII | \
>>                                  ENET_INT_EBERR | ENET_INT_LC | ENET_INT_RL | \
>>                                  ENET_INT_UN | ENET_INT_PLR | ENET_INT_WAKEUP | \
>> -                                ENET_INT_TS_AVAIL)
>> +                                ENET_INT_TS_AVAIL | ENET_INT_TXF1 | ENET_INT_TXB1 |\
>> +                                ENET_INT_TXF2 | ENET_INT_TXB2)
>>
>>  /* RDAR */
>>  #define ENET_RDAR_RDAR         (1 << 24)
>> @@ -233,6 +242,15 @@ typedef struct {
>>
>>  #define ENET_BD_BDU            (1 << 31)
>>
>> +#define ENET_TX_RING_NUM       3
>> +
>> +typedef struct IMXFECTxRing {
>> +    uint32_t descriptor;
>> +    uint32_t tdsr;
>> +    uint32_t int_txf;
>> +    uint32_t int_txb;
>
> Why aren't the int_txf and int_txb fields in the migration state?
> What are they for? It looks from the code like they're just constants
> indicating the tx interrupt bits to use for this tx ring, in which
> case they'd be better implemented using a utility function which
> returns the tx bit when given a ring number, I think.
>

I think I just forgot to add those fields to migration data. Any you
are right about their purpose. I'll change the patch to use functions
in v2.

Thanks,
Andrey Smirnov
