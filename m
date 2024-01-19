Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d4b81000000b0033920dfd287sm1245582wrt.19.2024.01.19.03.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:41:40 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 92DFD5F8C8;
	Fri, 19 Jan 2024 11:41:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/6] hw/arm/z2: convert DPRINTF to tracepoints
In-Reply-To: <021405f5ef53ebe80c7218e1df537635d34889b3.1705662313.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Fri, 19 Jan 2024 13:14:19 +0200")
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
	<021405f5ef53ebe80c7218e1df537635d34889b3.1705662313.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 19 Jan 2024 11:41:40 +0000
Message-ID: <87v87pft3f.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4kH/2bOJhVEj

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Tracing DPRINTFs to stderr might not be desired. A developer that relies
> on tracepoints should be able to opt-in to each tracepoint and rely on
> QEMU's log redirection, instead of stderr by default.
>
> This commit converts DPRINTFs in this file that are used for tracing
> into tracepoints.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  hw/arm/trace-events |  8 ++++++++
>  hw/arm/z2.c         | 26 +++++++++-----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index cdc1ea06a8..a262ad2e6a 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -55,3 +55,11 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNot=
ifier node for iommu mr=3D%s
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iom=
mu mr=3D%s"
>  smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid=
, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=3D%s asid=3D%d v=
mid=3D%d iova=3D0x%"PRIx64" tg=3D%d num_pages=3D0x%"PRIx64
>=20=20
> +# z2.c
> +z2_lcd_cur_reg_update(uint8_t r) "reg: 0x%x"
> +z2_lcd_enable_disable(uint16_t v) "value: 0x%x"
> +z2_lcd_enable_disable_result(const char * result) "LCD %s"
> +z2_lcd_invalid_command(uint8_t value) "0x%x"
> +z2_aer915_send_too_log(int8_t msg) "message too long (%i bytes)"
> +z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
> +z2_aer915_i2c_start_recv(uint16_t len) "I2C_START_RECV: short message wi=
th len %d"
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 83741a4909..6c0889d698 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -28,13 +28,7 @@
>  #include "cpu.h"
>  #include "qom/object.h"
>  #include "qapi/error.h"
> -
> -#ifdef DEBUG_Z2
> -#define DPRINTF(fmt, ...) \
> -        printf(fmt, ## __VA_ARGS__)
> -#else
> -#define DPRINTF(fmt, ...)
> -#endif
> +#include "trace.h"
>=20=20
>  static const struct keymap map[0x100] =3D {
>      [0 ... 0xff] =3D { -1, -1 },
> @@ -127,22 +121,22 @@ static uint32_t zipit_lcd_transfer(SSIPeripheral *d=
ev, uint32_t value)
>      if (z->pos =3D=3D 3) {

Maybe we could just have:

   trace_z2_lcd_reg_update(z->buf[0], z->buf[1], z->buf[2]);

here

>          switch (z->buf[0]) {
>          case 0x74:
> -            DPRINTF("%s: reg: 0x%.2x\n", __func__, z->buf[2]);
> +            trace_z2_lcd_cur_reg_update(z->buf[2]);

drop this

>              z->cur_reg =3D z->buf[2];
>              break;
>          case 0x76:
>              val =3D z->buf[1] << 8 | z->buf[2];
> -            DPRINTF("%s: value: 0x%.4x\n", __func__, val);
> +            trace_z2_lcd_enable_disable(val);

and this

>              if (z->cur_reg =3D=3D 0x22 && val =3D=3D 0x0000) {
>                  z->enabled =3D 1;
> -                printf("%s: LCD enabled\n", __func__);
> +                trace_z2_lcd_enable_disable_result("enabled");
>              } else if (z->cur_reg =3D=3D 0x10 && val =3D=3D 0x0000) {
>                  z->enabled =3D 0;
> -                printf("%s: LCD disabled\n", __func__);
> +                trace_z2_lcd_enable_disable_result("disabled");

and just have two trace points, one for enable and one for disable to
save spamming a string into the log.

>              }
>              break;
>          default:
> -            DPRINTF("%s: unknown command!\n", __func__);
> +            trace_z2_lcd_invalid_command(z->buf[0]);

drop this, it can be inferred if we trace the command stream above.

>              break;
>          }
>          z->pos =3D 0;
> @@ -212,14 +206,12 @@ static int aer915_send(I2CSlave *i2c, uint8_t data)
>=20=20
>      s->buf[s->len] =3D data;
>      if (s->len++ > 2) {
> -        DPRINTF("%s: message too long (%i bytes)\n",
> -            __func__, s->len);
> +        trace_z2_aer915_send_too_log(s->len);

long

>          return 1;
>      }
>=20=20
>      if (s->len =3D=3D 2) {
> -        DPRINTF("%s: reg %d value 0x%02x\n", __func__,
> -                s->buf[0], s->buf[1]);
> +        trace_z2_aer915_send(s->buf[0], s->buf[1]);
>      }
>=20=20
>      return 0;
> @@ -235,7 +227,7 @@ static int aer915_event(I2CSlave *i2c, enum i2c_event=
 event)
>          break;
>      case I2C_START_RECV:
>          if (s->len !=3D 1) {
> -            DPRINTF("%s: short message!?\n", __func__);
> +            trace_z2_aer915_i2c_start_recv(s->len);
>          }
>          break;
>      case I2C_FINISH:

maybe better just to have a:

  trace_aer915_event(event, s->len)

before the return?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
