Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n7-20020adff087000000b00337bb0f370dsm6354884wro.40.2024.01.19.03.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:57:03 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A7C1F5F8C8;
	Fri, 19 Jan 2024 11:57:02 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/6] hw/arm/strongarm.c: convert DPRINTF to tracepoints
In-Reply-To: <3c6fbd73a14fdf120a6b0c1e168e5469acd00306.1705662313.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Fri, 19 Jan 2024 13:14:20 +0200")
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
	<3c6fbd73a14fdf120a6b0c1e168e5469acd00306.1705662313.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 19 Jan 2024 11:57:02 +0000
Message-ID: <87plxxfsdt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hwIK+qa3VlL/

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
>  hw/arm/strongarm.c  | 49 +++++++++++++++++++--------------------------
>  hw/arm/trace-events | 18 +++++++++++++++++
>  2 files changed, 39 insertions(+), 28 deletions(-)
>
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index fef3638aca..3ff748e826 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -46,8 +46,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/log.h"
>  #include "qom/object.h"
> -
> -//#define DEBUG
> +#include "trace.h"
>=20=20
>  /*
>   TODO
> @@ -66,12 +65,6 @@
>   - Enhance UART with modem signals
>   */
>=20=20
> -#ifdef DEBUG
> -# define DPRINTF(format, ...) printf(format , ## __VA_ARGS__)
> -#else
> -# define DPRINTF(format, ...) do { } while (0)
> -#endif
> -
>  static struct {
>      hwaddr io_base;
>      int irq;
> @@ -151,8 +144,7 @@ static uint64_t strongarm_pic_mem_read(void *opaque, =
hwaddr offset,
>      case ICPR:
>          return s->pending;
>      default:
> -        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
> -                        __func__, offset);
> +        trace_strongarm_pic_mem_read(offset);

I think these should be:

  qemu_log_mask(LOG_GUEST_ERROR, "...")

>          return 0;
>      }
>  }
> @@ -173,8 +165,7 @@ static void strongarm_pic_mem_write(void *opaque, hwa=
ddr offset,
>          s->int_idle =3D (value & 1) ? 0 : ~0;
>          break;
>      default:
> -        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
> -                        __func__, offset);
> +        trace_strongarm_pic_mem_write(offset);

LOG_GUEST_ERROR again.

>          break;
>      }
>      strongarm_pic_update(s);
> @@ -333,7 +324,7 @@ static uint64_t strongarm_rtc_read(void *opaque, hwad=
dr addr,
>                  ((qemu_clock_get_ms(rtc_clock) - s->last_hz) << 15) /
>                  (1000 * ((s->rttr & 0xffff) + 1));
>      default:
> -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr=
);
> +        trace_strongarm_rtc_read(addr);
>          return 0;
>      }
>  }
> @@ -375,7 +366,7 @@ static void strongarm_rtc_write(void *opaque, hwaddr =
addr,
>          break;
>=20=20
>      default:
> -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr=
);
> +        trace_strongarm_rtc_write(addr);
>      }
>  }
>=20=20
> @@ -581,7 +572,7 @@ static uint64_t strongarm_gpio_read(void *opaque, hwa=
ddr offset,
>          return s->status;
>=20=20
>      default:
> -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset=
);
> +        trace_strongarm_gpio_read(offset);
>      }
>=20=20
>      return 0;
> @@ -626,7 +617,7 @@ static void strongarm_gpio_write(void *opaque, hwaddr=
 offset,
>          break;
>=20=20
>      default:
> -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset=
);
> +        trace_strongarm_gpio_write(offset);
>      }
>  }
>=20=20
> @@ -782,7 +773,7 @@ static uint64_t strongarm_ppc_read(void *opaque, hwad=
dr offset,
>          return s->ppfr | ~0x7f001;
>=20=20
>      default:
> -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset=
);
> +        trace_strongarm_ppc_read(offset);
>      }
>=20=20
>      return 0;
> @@ -817,7 +808,7 @@ static void strongarm_ppc_write(void *opaque, hwaddr =
offset,
>          break;
>=20=20
>      default:
> -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset=
);
> +        trace_strongarm_ppc_write(offset);
>      }
>  }
>

In fact all of the above I thing are LOG_GUEST_ERRORs


> @@ -1029,8 +1020,11 @@ static void strongarm_uart_update_parameters(Stron=
gARMUARTState *s)
>      s->char_transmit_time =3D  (NANOSECONDS_PER_SECOND / speed) * frame_=
size;
>      qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
>=20=20
> -    DPRINTF(stderr, "%s speed=3D%d parity=3D%c data=3D%d stop=3D%d\n", s=
->chr->label,
> -            speed, parity, data_bits, stop_bits);
> +    trace_strongarm_uart_update_parameters(s->chr.chr->label?:"NULL",
> +                                           speed,
> +                                           parity,
> +                                           data_bits,
> +                                           stop_bits);
>  }

This one is good, and the remaining ones are also guest errors.

>=20=20
>  static void strongarm_uart_rx_to(void *opaque)
> @@ -1164,7 +1158,7 @@ static uint64_t strongarm_uart_read(void *opaque, h=
waddr addr,
>          return s->utsr1;
>=20=20
>      default:
> -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr=
);
> +        trace_strongarm_uart_read_bad_register(addr);
>          return 0;
>      }
>  }
> @@ -1221,7 +1215,7 @@ static void strongarm_uart_write(void *opaque, hwad=
dr addr,
>          break;
>=20=20
>      default:
> -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr=
);
> +        trace_strongarm_uart_write_bad_register(addr);
>      }
>  }
>=20=20
> @@ -1434,7 +1428,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hw=
addr addr,
>              return 0xffffffff;
>          }
>          if (s->rx_level < 1) {
> -            printf("%s: SSP Rx Underrun\n", __func__);
> +            trace_strongarm_ssp_read_underrun();

I think is ok for a tracepoint.

>              return 0xffffffff;
>          }
>          s->rx_level--;
> @@ -1443,7 +1437,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hw=
addr addr,
>          strongarm_ssp_fifo_update(s);
>          return retval;
>      default:
> -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr=
);
> +        trace_strongarm_ssp_read(addr);
>          break;
>      }
>      return 0;
> @@ -1458,8 +1452,7 @@ static void strongarm_ssp_write(void *opaque, hwadd=
r addr,
>      case SSCR0:
>          s->sscr[0] =3D value & 0xffbf;
>          if ((s->sscr[0] & SSCR0_SSE) && SSCR0_DSS(value) < 4) {
> -            printf("%s: Wrong data size: %i bits\n", __func__,
> -                   (int)SSCR0_DSS(value));
> +            trace_strongarm_ssp_write_wrong_data_size((int)SSCR0_DSS(val=
ue));
>          }
>          if (!(value & SSCR0_SSE)) {
>              s->sssr =3D 0;
> @@ -1471,7 +1464,7 @@ static void strongarm_ssp_write(void *opaque, hwadd=
r addr,
>      case SSCR1:
>          s->sscr[1] =3D value & 0x2f;
>          if (value & SSCR1_LBM) {
> -            printf("%s: Attempt to use SSP LBM mode\n", __func__);
> +            trace_strongarm_ssp_write_wrong_data_size_invalid();

Maybe it would just be better to have a:

  trace_strongarm_ssp_write(addr, value)

at the top of the function?

>          }
>          strongarm_ssp_fifo_update(s);
>          break;
> @@ -1509,7 +1502,7 @@ static void strongarm_ssp_write(void *opaque, hwadd=
r addr,
>          break;
>=20=20
>      default:
> -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr=
);
> +        trace_strongarm_ssp_write_bad_register(addr);

guest error.

>          break;
>      }
>  }
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index a262ad2e6a..a6a67d5f16 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -63,3 +63,21 @@ z2_lcd_invalid_command(uint8_t value) "0x%x"
>  z2_aer915_send_too_log(int8_t msg) "message too long (%i bytes)"
>  z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
>  z2_aer915_i2c_start_recv(uint16_t len) "I2C_START_RECV: short message wi=
th len %d"
> +
> +# strongarm.c
> +strongarm_uart_update_parameters(const char *label, int speed, char pari=
ty, int data_bits, int stop_bits) "%s speed=3D%d parity=3D%c data=3D%d stop=
=3D%d"
> +strongarm_uart_read_bad_register(uint64_t addr) "Bad uart register 0x%zu"
> +strongarm_uart_write_bad_register(uint64_t addr) "Bad uart register 0x%z=
u"
> +strongarm_pic_mem_read(uint64_t offset) "Bad pic mem register read offse=
t 0x%zu"
> +strongarm_pic_mem_write(uint64_t offset) "Bad pic mem register write off=
set 0x%zu"
> +strongarm_rtc_read(uint64_t addr) "Bad rtc register read 0x%zu"
> +strongarm_rtc_write(uint64_t addr) "Bad rtc register write 0x%zu"
> +strongarm_gpio_read(uint64_t offset) "Bad gpio read offset 0x%zu"
> +strongarm_gpio_write(uint64_t offset) "Bad gpio write offset 0x%zu"
> +strongarm_ppc_write(uint64_t offset) "Bad ppc write offset 0x%zu"
> +strongarm_ppc_read(uint64_t offset) "Bad ppc write offset 0x%zu"
> +strongarm_ssp_read_underrun(void) "SSP Rx Underrun"
> +strongarm_ssp_read(uint64_t addr) "Bad register 0x%zu"
> +strongarm_ssp_write_wrong_data_size(int v) "Wrong data size: %i bits"
> +strongarm_ssp_write_wrong_data_size_invalid(void) "Attempt to use SSP LB=
M mode"
> +strongarm_ssp_write_bad_register(uint64_t addr) "Bad register 0x%zu"

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
