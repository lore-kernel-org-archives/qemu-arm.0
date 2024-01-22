Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2664235ejg;
        Mon, 22 Jan 2024 10:20:42 -0800 (PST)
X-Received: by 2002:a2e:5c49:0:b0:2cd:cfdb:c2b3 with SMTP id q70-20020a2e5c49000000b002cdcfdbc2b3mr1941698ljb.101.1705947642188;
        Mon, 22 Jan 2024 10:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705947642; cv=none;
        d=google.com; s=arc-20160816;
        b=IZFz4W9U++0P5wJpSSgtHnpdrqQUzdpq/6AHnwjgLfvC/0jLRy7Q+EL6CVxc9FbioT
         mOGXDzK/XjcROGNGttXLjT/PT1g0yK8sQSQ9onw+w/TGoUFJJxffvSKR0aLV54Lkm6jG
         gCaCTMIVB+5TuqybzXxZDSHiYW5700hcoId+NY9kAkYTm0JI4BOY7FgzoGhopkDEUr33
         FDta7w8U1FAckIHehaSwvjyH3V4FiuWxtRKlUyWqtpR1shDyDAxVzpP2fYLziNj0T+Y1
         wRpxZhu0kVKnm8fm5BkfkEo+7jmEOffpskHGA8U5oK7qLYj+pO0ak6ApwEdSvNEELVX3
         hQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uZ/1/rHerXAfPqeRODXv/KHpt4Wstv33M1/Pr1QvYPc=;
        fh=iR/S8hedz7bDZ6Q+XkAKT/FanUdUwATkaNRGif7H9gA=;
        b=RTLzxsc3Lw+b5E5pzODHYwbgtE8B+bfobLZsQIqdQd+WwrodwvhJ5pCnflxIZMCG6m
         cGyTyD4TLGmLMs+5q1AMC5qKUUt/NGbbXmNS268CpC3ZfOB0Rb59RumF2aag0kZeOidk
         /NgYLub4SJUs0tmXf+CY7djNv3ZZ8SyP1H3Fx4BuLTJf7NfG9b29H7S17P3W4GDCol/d
         BnbdD8b0pWzyz3YQ2d2nYnKMXfbl5bGJXveBkxhlfT4wR3O0nwuwF+qcaV4IPOfyOOYU
         NV7n4ldMtmyHKjxIDqCjhRyf/8VfmAWcRyIkXZGVbS+zlZCWyhUy3ZfpgvInRQ3Bx2E4
         4m5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pn2vsjE8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m19-20020a2e9113000000b002cd80b97eeesor854333ljg.0.2024.01.22.10.20.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jan 2024 10:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pn2vsjE8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705947642; x=1706552442; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ/1/rHerXAfPqeRODXv/KHpt4Wstv33M1/Pr1QvYPc=;
        b=pn2vsjE804V8kT/h3P/wq/ilPfsvrEZ0pGn6Xy8j27XM4oKVC3HxmZ8Ommz1dDuFCn
         s8xrx12pUdwz0Jc4+QimEIs2h4tli/QR9/vQaVi53NGyBBuX73vFbjiIM3yy0I9WWSOC
         k8IhxuhGJg0hgzrYQxzVyt3+rHTntakGORULi1eJ/1Uut3ocDI8Iv4nLQ15v+10PSoGn
         ezvquzvIs0JfJIuObhRkVE4NnF84O/6WwPqx2dkilzXIy7fru7jh/IsM4xeqJQN2ZGwr
         O7X0XdJgcbE6H/4i+EkGzQ5gPVmYP0qM1dGZQGStLEAE5Hrbp0Hn85qMMrkoUkSw26VZ
         iZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705947642; x=1706552442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZ/1/rHerXAfPqeRODXv/KHpt4Wstv33M1/Pr1QvYPc=;
        b=HKdq5GSs22wlIiGRA5LeE70TWWdYjaG/hrDBFZEdKBFEEOmalbhhz2M+yggoGltkT8
         Ju1ql9KPgCH0lNdZVdb4JOl4kwREtFsVNJM6wynkbRtjPQLVHEry8/k+b3fz5bzKsDxd
         6F1FdidFlG//2KmdFmsFmhOWYOx79DR3N7lTNdlZuMjt6rk1VzX6IiV8B8kgfogvn1bB
         Jr9rNIWJ+xdSKTg1JsmR2ixrOHIj+GtOzUvUPfm34S7Z9pvwJNxev6F0OCGcv8Z6Gxd+
         6KlaPCNNm/lPST4+37IZQJEBDnVx2+pBodXxum5sIQlAfIyycbuiDTq0YhxL59DRVcxT
         C6Iw==
X-Gm-Message-State: AOJu0YyaU9aYf4n9XvUTNDd3XSwh9EcSsUTIcf6JuLK6R4SaE2K5V229
	g12ExFLWeay4+u+ccuLqlN4D+f+VEA9GuOcoJ/R+UduqM/H7oaD9QcUF7lgFs0TI2G89DJi5zZ2
	+F46LSsj64S99qzHdg/Atl0fzFyIzYpaaSSLJAaAW8LJ7clrjIYk=
X-Google-Smtp-Source: AGHT+IE4xBKpLVXRqkrsWFVoSZ6Ltxm2fprn/gnfZ+ScHbYRIR+Yyy5YCdG6g2rzH1yVUzjGX79nVtCIauGzWvb8vHg=
X-Received: by 2002:a2e:a585:0:b0:2cc:d4cd:18a3 with SMTP id
 m5-20020a2ea585000000b002ccd4cd18a3mr2560723ljp.89.1705947641733; Mon, 22 Jan
 2024 10:20:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org> <339219e962d90f47cf125f2be2d64afb0833e905.1705670342.git.manos.pitsidianakis@linaro.org>
In-Reply-To: <339219e962d90f47cf125f2be2d64afb0833e905.1705670342.git.manos.pitsidianakis@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2024 18:20:30 +0000
Message-ID: <CAFEAcA9sqoDju6vpD_AN2=At_BbChGsMSckumfYL+u3+g9SJ2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/arm/z2: convert DPRINTF to trace events and
 guest errors
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Sph+d8rNCOo/

On Fri, 19 Jan 2024 at 13:24, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Tracing DPRINTFs to stderr might not be desired. A developer that relies
> on trace events should be able to opt-in to each trace event and rely on
> QEMU's log redirection, instead of stderr by default.
>
> This commit converts DPRINTFs in this file that are used for tracing
> into trace events. DPRINTFs that report guest errors are logged with
> LOG_GUEST_ERROR.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  hw/arm/strongarm.c  | 55 ++++++++++++++++++++++-----------------------
>  hw/arm/trace-events | 10 +++++++++
>  hw/arm/z2.c         | 27 +++++++---------------

Hi; thanks for sending these patches.

The strongarm.c and z2.c files aren't related (z2 uses
the pxa2xx CPU, not strongarm), so I think these are better
as two separate patches.

>  3 files changed, 45 insertions(+), 47 deletions(-)
>
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index fef3638aca..9fca0b302c 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -46,8 +46,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/log.h"
>  #include "qom/object.h"
> -
> -//#define DEBUG
> +#include "trace.h"
>
>  /*
>   TODO
> @@ -66,12 +65,6 @@
>   - Enhance UART with modem signals
>   */
>
> -#ifdef DEBUG
> -# define DPRINTF(format, ...) printf(format , ## __VA_ARGS__)
> -#else
> -# define DPRINTF(format, ...) do { } while (0)
> -#endif
> -
>  static struct {
>      hwaddr io_base;
>      int irq;
> @@ -151,8 +144,9 @@ static uint64_t strongarm_pic_mem_read(void *opaque, hwaddr offset,
>      case ICPR:
>          return s->pending;
>      default:
> -        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
> -                        __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Bad pic mem register read offset 0x%zu",
> +                      offset);

Message strings for qemu_log_mask() need a trailing "\n"
(unlike trace-event strings).

'offset' is type 'hwaddr', so the correct format string is
HWADDR_FMT_plx as the printf already has, not %zu. (Watch out
that the HWADDR_FMT_* macros include the "%", unlike the
POSIX style PRIx64 etc macros.) Getting the format string
wrong can cause compilation failures on some hosts (eg
32-bit hosts where the size_t etc types are different sizes.)

It's nice with these error messages to be a bit more
precise about the device that's produced them than
just "pic mem". In this case you could say "strongarm_pic".
(The 'mem' isn't really part of the device name.) Or
we are often lazy and use __func__.

Similarly with the other qemu_log_mask() calls below.

>          return 0;
>      }
>  }

> @@ -1029,8 +1024,11 @@ static void strongarm_uart_update_parameters(StrongARMUARTState *s)
>      s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) * frame_size;
>      qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
>
> -    DPRINTF(stderr, "%s speed=%d parity=%c data=%d stop=%d\n", s->chr->label,
> -            speed, parity, data_bits, stop_bits);
> +    trace_strongarm_uart_update_parameters(s->chr.chr->label?:"NULL",

Something's gone wrong here. The old code had 's->chr->label'
and the new code has got an extra '.chr' in it from somewhere.

(Did this really compile ? Check your configure options were
such that the file is being recompiled and the trace events
are being emitted.)

The code needs to handle s->chr being NULL (this will happen
if you start a strongarm machine with the command line argument
"-serial none").

> +                                           speed,
> +                                           parity,
> +                                           data_bits,
> +                                           stop_bits);
>  }
>

> @@ -1458,8 +1456,9 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
>      case SSCR0:
>          s->sscr[0] = value & 0xffbf;
>          if ((s->sscr[0] & SSCR0_SSE) && SSCR0_DSS(value) < 4) {
> -            printf("%s: Wrong data size: %i bits\n", __func__,
> -                   (int)SSCR0_DSS(value));
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "Wrong data size: %i bits",
> +                          (int)SSCR0_DSS(value));

This message has no indication at all of what device is producing it.

>          }
>          if (!(value & SSCR0_SSE)) {
>              s->sssr = 0;

> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index cdc1ea06a8..b0a56fcdc6 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -55,3 +55,13 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>  smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
>
> +# z2.c
> +z2_lcd_reg_update(uint8_t cur, uint8_t _0, uint8_t _1, uint8_t _2, uint32_t value) "cur_reg = 0x%xd, buf = [0x%xd, 0x%xd, 0x%xd], value = 0x%x"

Don't use argument names starting with underscores; those are
reserved for the compiler and the system. Here I would
suggest buf0, buf1, buf2.

"%xd" will print the number in hex followed by a literal 'd' character.
For hex numbers, just "0x%x" is sufficient. (Look at other
trace lines in this file for examples.)

> +z2_lcd_enable_disable_result(const char * result) "LCD %s"

No space after the '*' in the argument type.

> +z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
> +z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
> +z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
> +
> +# strongarm.c
> +strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
> +strongarm_ssp_read_underrun(void) "SSP rx underrun"

thanks
-- PMM
