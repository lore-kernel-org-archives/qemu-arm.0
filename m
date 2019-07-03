Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp113130wru;
        Tue, 2 Jul 2019 18:15:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQkxDcf+9Wu6ccJ5dQnVDM1HKcqqG+7BH8rdR2Zw2tWIBIFXAhVFyy2uik4ihiuGxLNmA7
X-Received: by 2002:a17:906:7901:: with SMTP id b1mr31119997ejo.244.1562116517646;
        Tue, 02 Jul 2019 18:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562116517; cv=none;
        d=google.com; s=arc-20160816;
        b=it/blStLbpC87nRkBNnP7lYywRvf32L2CY0M0rrQvwFc++OnYcroPLERn2zlhMjgo0
         IAapCm5LvmEs02z0xj1kMRWY183+A40Z3JiSrXyXkE5hKQvi7UyEslZQYo6kY8egavEs
         6mtCe3ggF63J4LnkosHCap+Trp2dukHA7b2YZJ2JnTXl5WlVOTmh9K03TkXwjnA3MPzu
         f8xUMag9pXVNCtNR+ESZW5U315PBBsO9KyjNOYAH85D0WO5B9UTeB/LzDoJDUhTXcbDN
         TE/YzNCeWnu3vdfWbi0Bid2RP+a0BiGRTzOSDPmAbdKFtopw0rMcvmkv1sqfgbXk/ynB
         cOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=8cClkCurLXfrK8PwNpquiuz+KOgZI4xC9aBfq7ykICQ=;
        b=r7gLU1oP+jM48a178kjB5L1C3zta5TeQNj7/lyxXR6vfU3Ts+2ASw04OTrOP2nakxz
         4PiNPq04alXsDTumFKp1Qn6U47jY6E05HQyLbRaZspSs3+MtiAckEkZWjY3gKfewdJd7
         anRPOfkGFr/HmY4J+BTZv0t3BWvHlhs+jC+sAc0kJ7yC+95lN4pzOSKQDcOhcnkr9XDz
         2+ff4B+ny4c4xKg51YLMB30H+idFTp1gQYs9g6za/qkkT4ncFMeuhgdX+/DcV3kEZ1je
         zzcYJbBaAYUY6bN3qT1HQu9/zkYe4PtvX1j583iRX0CX7yYyLywfawMOyEpZ/8MemIKz
         /uqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=lCcl7fBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si576611edg.35.2019.07.02.18.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 18:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=lCcl7fBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiTrg-0005AQ-Kc
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 21:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiTrW-00058B-Nl
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 21:15:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiTrU-0006KW-VE
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 21:15:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47453 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiTrT-0006FD-Fv; Tue, 02 Jul 2019 21:15:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45djnq6P1pz9s00; Wed,  3 Jul 2019 11:14:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562116495;
 bh=mTwyN+Coe+fwICxexR4PTnM8gG6UnNs4Ivi96ggvhJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lCcl7fBys0hGBlCjgv/nvU7vyWXal+Xdir6sGDOCfCR7MEB70bVUKsaSernKY4Yt1
 CDcthNGm3PGij6Sh+QHDhUERXaaVdvL9LOlAKQ3CQxkglsysi7fvuKgKE7GNYY4+u4
 t/Olp8yHWbHhwL6zqedRPm4QliI2sjqhAuqzm1hM=
Date: Wed, 3 Jul 2019 10:45:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190703004522.GB9442@umbus.fritz.box>
References: <20190702163844.20458-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <20190702163844.20458-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH for-4.1] hw/i2c/bitbang_i2c: Use in-place
 rather than malloc'd bitbang_i2c_interface struct
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
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ckp+aA6Gne1x


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2019 at 05:38:44PM +0100, Peter Maydell wrote:
> Currently the bitbang_i2c_init() function allocates a
> bitbang_i2c_interface struct which it returns.  This is unfortunate
> because it means that if the function is used from a DeviceState
> init method then the memory will be leaked by an "init then delete"
> cycle, as used by the qmp/hmp commands that list device properties.
>=20
> Since three out of four of the uses of this function are in
> device init methods, switch the function to do an in-place
> initialization of a struct that can be embedded in the
> device state struct of the caller.
>=20
> This fixes LeakSanitizer leak warnings that have appeared in the
> patchew configuration (which only tries to run the sanitizers
> for the x86_64-softmmu target) now that we use the bitbang-i2c
> code in an x86-64 config.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> This isn't the only problem with this code : it is also
> missing reset and migration handling and generally looks like
> it needs proper conversion to QOM somehow. But this will shut
> the patchew complaints up and seems ok for 4.1.
>=20
> Disclaimer: checked only that the leak-sanitizer is now happy
> and with a 'make check'.
> ---
>  hw/display/ati_int.h         |  2 +-
>  include/hw/i2c/bitbang_i2c.h | 38 ++++++++++++++++++++++++++++-
>  include/hw/i2c/ppc4xx_i2c.h  |  2 +-
>  hw/display/ati.c             |  7 +++---
>  hw/i2c/bitbang_i2c.c         | 47 +++---------------------------------
>  hw/i2c/ppc4xx_i2c.c          |  6 ++---
>  hw/i2c/versatile_i2c.c       |  8 +++---
>  7 files changed, 53 insertions(+), 57 deletions(-)
>=20
> diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
> index 9b67d0022ad..31a1927b3ec 100644
> --- a/hw/display/ati_int.h
> +++ b/hw/display/ati_int.h
> @@ -88,7 +88,7 @@ typedef struct ATIVGAState {
>      uint16_t cursor_size;
>      uint32_t cursor_offset;
>      QEMUCursor *cursor;
> -    bitbang_i2c_interface *bbi2c;
> +    bitbang_i2c_interface bbi2c;
>      MemoryRegion io;
>      MemoryRegion mm;
>      ATIVGARegs regs;
> diff --git a/include/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2c.h
> index 3a7126d5dee..92334e9016a 100644
> --- a/include/hw/i2c/bitbang_i2c.h
> +++ b/include/hw/i2c/bitbang_i2c.h
> @@ -8,7 +8,43 @@ typedef struct bitbang_i2c_interface bitbang_i2c_interfa=
ce;
>  #define BITBANG_I2C_SDA 0
>  #define BITBANG_I2C_SCL 1
> =20
> -bitbang_i2c_interface *bitbang_i2c_init(I2CBus *bus);
> +typedef enum bitbang_i2c_state {
> +    STOPPED =3D 0,
> +    SENDING_BIT7,
> +    SENDING_BIT6,
> +    SENDING_BIT5,
> +    SENDING_BIT4,
> +    SENDING_BIT3,
> +    SENDING_BIT2,
> +    SENDING_BIT1,
> +    SENDING_BIT0,
> +    WAITING_FOR_ACK,
> +    RECEIVING_BIT7,
> +    RECEIVING_BIT6,
> +    RECEIVING_BIT5,
> +    RECEIVING_BIT4,
> +    RECEIVING_BIT3,
> +    RECEIVING_BIT2,
> +    RECEIVING_BIT1,
> +    RECEIVING_BIT0,
> +    SENDING_ACK,
> +    SENT_NACK
> +} bitbang_i2c_state;
> +
> +struct bitbang_i2c_interface {
> +    I2CBus *bus;
> +    bitbang_i2c_state state;
> +    int last_data;
> +    int last_clock;
> +    int device_out;
> +    uint8_t buffer;
> +    int current_addr;
> +};
> +
> +/**
> + * bitbang_i2c_init: in-place initialize the bitbang_i2c_interface struct
> + */
> +void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus);
>  int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level);
> =20
>  #endif
> diff --git a/include/hw/i2c/ppc4xx_i2c.h b/include/hw/i2c/ppc4xx_i2c.h
> index 8437bf070b8..f6f837fbec0 100644
> --- a/include/hw/i2c/ppc4xx_i2c.h
> +++ b/include/hw/i2c/ppc4xx_i2c.h
> @@ -41,7 +41,7 @@ typedef struct PPC4xxI2CState {
>      I2CBus *bus;
>      qemu_irq irq;
>      MemoryRegion iomem;
> -    bitbang_i2c_interface *bitbang;
> +    bitbang_i2c_interface bitbang;
>      int mdidx;
>      uint8_t mdata[4];
>      uint8_t lmadr;
> diff --git a/hw/display/ati.c b/hw/display/ati.c
> index 0cb11738483..c1d9d1518f4 100644
> --- a/hw/display/ati.c
> +++ b/hw/display/ati.c
> @@ -538,7 +538,7 @@ static void ati_mm_write(void *opaque, hwaddr addr,
>          break;
>      case GPIO_DVI_DDC:
>          if (s->dev_id !=3D PCI_DEVICE_ID_ATI_RAGE128_PF) {
> -            s->regs.gpio_dvi_ddc =3D ati_i2c(s->bbi2c, data, 0);
> +            s->regs.gpio_dvi_ddc =3D ati_i2c(&s->bbi2c, data, 0);
>          }
>          break;
>      case GPIO_MONID ... GPIO_MONID + 3:
> @@ -554,7 +554,7 @@ static void ati_mm_write(void *opaque, hwaddr addr,
>               */
>              if ((s->regs.gpio_monid & BIT(25)) &&
>                  addr <=3D GPIO_MONID + 2 && addr + size > GPIO_MONID + 2=
) {
> -                s->regs.gpio_monid =3D ati_i2c(s->bbi2c, s->regs.gpio_mo=
nid, 1);
> +                s->regs.gpio_monid =3D ati_i2c(&s->bbi2c, s->regs.gpio_m=
onid, 1);
>              }
>          }
>          break;
> @@ -856,7 +856,7 @@ static void ati_vga_realize(PCIDevice *dev, Error **e=
rrp)
> =20
>      /* ddc, edid */
>      I2CBus *i2cbus =3D i2c_init_bus(DEVICE(s), "ati-vga.ddc");
> -    s->bbi2c =3D bitbang_i2c_init(i2cbus);
> +    bitbang_i2c_init(&s->bbi2c, i2cbus);
>      I2CSlave *i2cddc =3D I2C_SLAVE(qdev_create(BUS(i2cbus), TYPE_I2CDDC)=
);
>      i2c_set_slave_address(i2cddc, 0x50);
> =20
> @@ -885,7 +885,6 @@ static void ati_vga_exit(PCIDevice *dev)
>      ATIVGAState *s =3D ATI_VGA(dev);
> =20
>      graphic_console_close(s->vga.con);
> -    g_free(s->bbi2c);
>  }
> =20
>  static Property ati_vga_properties[] =3D {
> diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
> index 3cb0509b020..60c7a9be0bc 100644
> --- a/hw/i2c/bitbang_i2c.c
> +++ b/hw/i2c/bitbang_i2c.c
> @@ -25,39 +25,6 @@ do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } w=
hile (0)
>  #define DPRINTF(fmt, ...) do {} while(0)
>  #endif
> =20
> -typedef enum bitbang_i2c_state {
> -    STOPPED =3D 0,
> -    SENDING_BIT7,
> -    SENDING_BIT6,
> -    SENDING_BIT5,
> -    SENDING_BIT4,
> -    SENDING_BIT3,
> -    SENDING_BIT2,
> -    SENDING_BIT1,
> -    SENDING_BIT0,
> -    WAITING_FOR_ACK,
> -    RECEIVING_BIT7,
> -    RECEIVING_BIT6,
> -    RECEIVING_BIT5,
> -    RECEIVING_BIT4,
> -    RECEIVING_BIT3,
> -    RECEIVING_BIT2,
> -    RECEIVING_BIT1,
> -    RECEIVING_BIT0,
> -    SENDING_ACK,
> -    SENT_NACK
> -} bitbang_i2c_state;
> -
> -struct bitbang_i2c_interface {
> -    I2CBus *bus;
> -    bitbang_i2c_state state;
> -    int last_data;
> -    int last_clock;
> -    int device_out;
> -    uint8_t buffer;
> -    int current_addr;
> -};
> -
>  static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
>  {
>      DPRINTF("STOP\n");
> @@ -184,18 +151,12 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int=
 line, int level)
>      abort();
>  }
> =20
> -bitbang_i2c_interface *bitbang_i2c_init(I2CBus *bus)
> +void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
>  {
> -    bitbang_i2c_interface *s;
> -
> -    s =3D g_malloc0(sizeof(bitbang_i2c_interface));
> -
>      s->bus =3D bus;
>      s->last_data =3D 1;
>      s->last_clock =3D 1;
>      s->device_out =3D 1;
> -
> -    return s;
>  }
> =20
>  /* GPIO interface.  */
> @@ -207,7 +168,7 @@ typedef struct GPIOI2CState {
>      SysBusDevice parent_obj;
> =20
>      MemoryRegion dummy_iomem;
> -    bitbang_i2c_interface *bitbang;
> +    bitbang_i2c_interface bitbang;
>      int last_level;
>      qemu_irq out;
>  } GPIOI2CState;
> @@ -216,7 +177,7 @@ static void bitbang_i2c_gpio_set(void *opaque, int ir=
q, int level)
>  {
>      GPIOI2CState *s =3D opaque;
> =20
> -    level =3D bitbang_i2c_set(s->bitbang, irq, level);
> +    level =3D bitbang_i2c_set(&s->bitbang, irq, level);
>      if (level !=3D s->last_level) {
>          s->last_level =3D level;
>          qemu_set_irq(s->out, level);
> @@ -234,7 +195,7 @@ static void gpio_i2c_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->dummy_iomem);
> =20
>      bus =3D i2c_init_bus(dev, "i2c");
> -    s->bitbang =3D bitbang_i2c_init(bus);
> +    bitbang_i2c_init(&s->bitbang, bus);
> =20
>      qdev_init_gpio_in(dev, bitbang_i2c_gpio_set, 2);
>      qdev_init_gpio_out(dev, &s->out, 1);
> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
> index 5fb4f86c38f..462729db4ea 100644
> --- a/hw/i2c/ppc4xx_i2c.c
> +++ b/hw/i2c/ppc4xx_i2c.c
> @@ -311,9 +311,9 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr ad=
dr, uint64_t value,
>      case IIC_DIRECTCNTL:
>          i2c->directcntl =3D value & (IIC_DIRECTCNTL_SDAC & IIC_DIRECTCNT=
L_SCLC);
>          i2c->directcntl |=3D (value & IIC_DIRECTCNTL_SCLC ? 1 : 0);
> -        bitbang_i2c_set(i2c->bitbang, BITBANG_I2C_SCL,
> +        bitbang_i2c_set(&i2c->bitbang, BITBANG_I2C_SCL,
>                          i2c->directcntl & IIC_DIRECTCNTL_MSCL);
> -        i2c->directcntl |=3D bitbang_i2c_set(i2c->bitbang, BITBANG_I2C_S=
DA,
> +        i2c->directcntl |=3D bitbang_i2c_set(&i2c->bitbang, BITBANG_I2C_=
SDA,
>                                 (value & IIC_DIRECTCNTL_SDAC) !=3D 0) << =
1;
>          break;
>      default:
> @@ -347,7 +347,7 @@ static void ppc4xx_i2c_init(Object *o)
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(s), &s->irq);
>      s->bus =3D i2c_init_bus(DEVICE(s), "i2c");
> -    s->bitbang =3D bitbang_i2c_init(s->bus);
> +    bitbang_i2c_init(&s->bitbang, s->bus);
>  }
> =20
>  static void ppc4xx_i2c_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
> index 24b6e36b6d5..1ac2a6f59a0 100644
> --- a/hw/i2c/versatile_i2c.c
> +++ b/hw/i2c/versatile_i2c.c
> @@ -35,7 +35,7 @@ typedef struct VersatileI2CState {
>      SysBusDevice parent_obj;
> =20
>      MemoryRegion iomem;
> -    bitbang_i2c_interface *bitbang;
> +    bitbang_i2c_interface bitbang;
>      int out;
>      int in;
>  } VersatileI2CState;
> @@ -70,8 +70,8 @@ static void versatile_i2c_write(void *opaque, hwaddr of=
fset,
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Bad offset 0x%x\n", __func__, (int)offset);
>      }
> -    bitbang_i2c_set(s->bitbang, BITBANG_I2C_SCL, (s->out & 1) !=3D 0);
> -    s->in =3D bitbang_i2c_set(s->bitbang, BITBANG_I2C_SDA, (s->out & 2) =
!=3D 0);
> +    bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SCL, (s->out & 1) !=3D 0);
> +    s->in =3D bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SDA, (s->out & 2)=
 !=3D 0);
>  }
> =20
>  static const MemoryRegionOps versatile_i2c_ops =3D {
> @@ -88,7 +88,7 @@ static void versatile_i2c_init(Object *obj)
>      I2CBus *bus;
> =20
>      bus =3D i2c_init_bus(dev, "i2c");
> -    s->bitbang =3D bitbang_i2c_init(bus);
> +    bitbang_i2c_init(&s->bitbang, bus);
>      memory_region_init_io(&s->iomem, obj, &versatile_i2c_ops, s,
>                            "versatile_i2c", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0b+qAACgkQbDjKyiDZ
s5JJ8RAAqj/6HRSK1zkm4Ewzw8Br6/0GXCP+cNrrQqciXIq+9a9LxUIET7gBRV6u
X5l8sqS8VGlbp2Gpv2k+SFg8opmYR2Y6tPhQ2kAgh9NVdiZHizzGuivcRGODh8LX
n1e8D2bIpWdk9+ra0J4uAlRgAXz/0CwuXYfpKvGyv9CVO1qRIPO+odIL4gAWoxEr
8de62hG8GtdsgyWgGvUs4AJM2XHVo+dHX1ddet3Hz9k+ir/kYLSvUXoTJQSE0T5F
mq3Gwhha4zIC8eXmY9beFWNl9Bh+rLjUNqtqtfuqDKQ2sVoyROdUZlV0lJt3iE8d
Ju5EhEJhpITr6LgeD9qKQKpus4+tEPb4Yr2+EHgHVh3uK1r1PcZYyBr3QCorqQpX
/IGNQv3C0Jr61YrhwfYZdWwH1j8Y2+APKJJ/bpn06nrAmI1Wm60jxDKhkDVqb/7O
AM/pT1lhLQScxz2iFmtPjZ15P7kDWz3Cl9h+fhpalfd74iO2XsMYDPnwprcH2M3+
w/C3vjhvShv4YGkLW9O8dxGNX1w/wnChJxMP/2mBXZcu6GzyqMpyalzXxP0ux8PO
yCpD096f5Wcqfnz8SIOout66/7kx+ghG6J2XJ4GI3VAj2OLb7qCHDsrnqD6xj9bU
uGaOb00kai4TiOwtEBDHyEYuW2Fx+F58hnscIQxBAoEMA9Bj7EQ=
=uKyX
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
