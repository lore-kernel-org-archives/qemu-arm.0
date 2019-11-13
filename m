Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g184sm2323052wma.8.2019.11.13.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 04:30:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9BBEA1FF87;
	Wed, 13 Nov 2019 12:30:34 +0000 (GMT)
References: <20191113005201.19005-1-joel@jms.id.au>
 <20191113005201.19005-3-joel@jms.id.au>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] aspeed/scu: Fix W1C behavior
In-reply-to: <20191113005201.19005-3-joel@jms.id.au>
Date: Wed, 13 Nov 2019 12:30:34 +0000
Message-ID: <877e447yc5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zkxzSmvMXe4q


Joel Stanley <joel@jms.id.au> writes:

> This models the clock write one to clear registers, and fixes up some
> incorrect behavior in all of the write to clear registers.
>
> There was also a typo in one of the register definitions.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/aspeed_scu.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 717509bc5460..aac4645f8c3c 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -98,7 +98,7 @@
>  #define AST2600_CLK_STOP_CTRL     TO_REG(0x80)
>  #define AST2600_CLK_STOP_CTRL_CLR TO_REG(0x84)
>  #define AST2600_CLK_STOP_CTRL2     TO_REG(0x90)
> -#define AST2600_CLK_STOP_CTR2L_CLR TO_REG(0x94)
> +#define AST2600_CLK_STOP_CTRL2_CLR TO_REG(0x94)
>  #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
>  #define AST2600_HPLL_PARAM        TO_REG(0x200)
>  #define AST2600_HPLL_EXT          TO_REG(0x204)
> @@ -532,11 +532,12 @@ static uint64_t aspeed_ast2600_scu_read(void *opaqu=
e, hwaddr offset,
>      return s->regs[reg];
>  }
>
> -static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64=
_t data,
> +static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset, uint64=
_t data64,
>                                       unsigned size)
>  {
>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
>      int reg =3D TO_REG(offset);
> +    uint32_t data =3D data64;

Does it make much difference silently truncating to 32 bit here vs in
the actual set further down? AFAICT most _write functions just deal with
it at the final set.

>
>      if (reg >=3D ASPEED_AST2600_SCU_NR_REGS) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -563,15 +564,19 @@ static void aspeed_ast2600_scu_write(void *opaque, =
hwaddr offset, uint64_t data,
>          /* fall through */
>      case AST2600_SYS_RST_CTRL:
>      case AST2600_SYS_RST_CTRL2:
> +    case AST2600_CLK_STOP_CTRL:
> +    case AST2600_CLK_STOP_CTRL2:
>          /* W1S (Write 1 to set) registers */
>          s->regs[reg] |=3D data;
>          return;
>      case AST2600_SYS_RST_CTRL_CLR:
>      case AST2600_SYS_RST_CTRL2_CLR:
> +    case AST2600_CLK_STOP_CTRL_CLR:
> +    case AST2600_CLK_STOP_CTRL2_CLR:
>      case AST2600_HW_STRAP1_CLR:
>      case AST2600_HW_STRAP2_CLR:
>          /* W1C (Write 1 to clear) registers */
> -        s->regs[reg] &=3D ~data;
> +        s->regs[reg - 1] &=3D ~data;

It might be worth expanding the W1C comment just to mention the
alignment of _CLR vs _CTRL registers.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>          return;
>
>      case AST2600_RNG_DATA:


--
Alex Benn=C3=A9e
