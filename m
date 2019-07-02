Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3957445wru;
        Tue, 2 Jul 2019 09:04:48 -0700 (PDT)
X-Received: by 2002:a2e:9198:: with SMTP id f24mr18148298ljg.221.1562083488093;
        Tue, 02 Jul 2019 09:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562083488; cv=none;
        d=google.com; s=arc-20160816;
        b=l1NAoCa1z/UUuJR4fjbDqehCLWSq90rsPifHTGbx97OsulkPtdYVk8xENZk35B7VOq
         cahcu6QD7/+vwwtaQxhagl8VennyIW/1OmqkYoMFhO4eEWbbbEz0lxNp+Q6ZhvTxzNso
         GoDunbWuYG7lFoSQBvsfQG0bAYCBYWf1UgZUjLUM0zSO9prINntWU4j+eztIZ5K1STlz
         B8h1TDLE4hneJnhTsam6t7eqCJhuQw/8IXcYJN2zOQkSRvGi0cXBcDDuCsUeW9mZiXVK
         yH+HIiL0PovYIUc4cGTCCXhUSB/RFFYCS++VJUZZBXSrCXG/I7PFmI7X9mh4ZyDd7xHH
         JY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nt7CX9pjD84jt91hcxilPIV++TwNUd58utlZEV+OKuw=;
        b=VlrJn9UMPLeQWS6WUdLMBrfF3xGZQ6ZBlGnLLL0uoMNQU3IHzRkCuI4aJ10vIMAmbQ
         wgmMc29Gqp0mHITbio8L0o4IJGhpoBI+qsKuWMkWnvybmg2WlZ/H4sVjMBY96yUOBq1u
         5PSJUNciSFFqpJ7oKz3Mw87Vj+KshDFZg+m35rbrZ0yjGk2jQAZlE12se17dyTMNrK0P
         4ZtfrQo/0UikuGG+1iP16b/4R38J9bdOY9iU1EbWqcKm4AAc8OcPXCFOQN1yG85i88x5
         eesyXzFiW15Wmrfj2Vj6KuBtxvRQjLIMa7CalljFG0YgTa9Jhr/xyg2fERghuis2PQH5
         zrSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tmfnNeK5;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y23sor7802902ljk.21.2019.07.02.09.04.47
        (Google Transport Security);
        Tue, 02 Jul 2019 09:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tmfnNeK5;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nt7CX9pjD84jt91hcxilPIV++TwNUd58utlZEV+OKuw=;
        b=tmfnNeK5GBCB0Tt20RmxWfmzcOBGwixDWEycGp1xuGPOFSHV0UQPqn9uxLZft6RnRz
         oM39xNCaCOeVyw1i1oQvmIUBWviZ6eJFspkxH39zaIkkl9gH2qa+BAxVWPK5YIdzDJg3
         zof5vr5tlP2NxK3RcSlcnD86gn1GPZQdIDdS5h6NRHP/JiQZ0tGfNBcYAD/xc+UcJxZy
         b95+VhvXvI3skeN/KWh644HFu3/g3kjQnMOOCKMDeCTzAJMfqWncEFIMMMRr/WnPthuU
         Ka0AJ9ySeDPVbZf4JxZtfc8sMa0p9eXbC3gP3lBR9gRW+RFoaNR8pxj8sGLyXq7Txwvr
         D7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nt7CX9pjD84jt91hcxilPIV++TwNUd58utlZEV+OKuw=;
        b=E/kZ+P1gzm+itbn0L/P5PHphyCG6qiPDbiB0cK6UZg0+e9hlHDO5R4WkuTXxRnjkDR
         1yDUdey6QZ+Z2sYhBWDgiMt2a6F9gTDgT8RzTw0ZYLaOd0irYfp+QU/CI86QoblZpsL7
         ze6d8fcmq+h0CeIe+aANWHL3NF5AssZaIlj/ON2G6UbsxwiDEUn32gZLTH766APHkeeZ
         FPDUfKwUDqsFnkS6fRPZUXqHtgn/2nhgdBNGgKzhkAPQV4ZEf7/vCEjPj7j5ky34ODNA
         FQ5gJe9LeOaR/AhJZDBpxA0GOMfQW500OvJRCea3wtdSI1gDaGPMlTBeWHVH+gb1tXx8
         nF+w==
X-Gm-Message-State: APjAAAX+DRPeZkbLvGoFD4p3C4GoHuq3HY4z2wzeORQYoNa8qAVzh2xm
	990bDDdwg9fdjB1lzRQxfZ9erEpZMtzIzxjukD8=
X-Google-Smtp-Source: APXvYqxbevUaFTQjL9mTx8kDt/bY7qoIiz0RW4+FCCktoc6YVsovIYsr6IkWMBn7PV9f+Pk/ozj108uD0zCMN4NDzrg=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr1538480ljj.58.1562083487757;
 Tue, 02 Jul 2019 09:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-4-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:01:44 -0700
Message-ID: <CAKmqyKNF=EeuPLRb25sCQz69PQkFws2M=CQs-+sQus9XGdiNaQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] hw/block/pflash_cfi01: Extract pflash_mode_read_array()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Laszlo Ersek <lersek@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, John Snow <jsnow@redhat.com>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Markus Armbruster <armbru@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, 
	Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: z0qphTYuRPaC

On Mon, Jul 1, 2019 at 5:14 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The same pattern is used when setting the flash in READ_ARRAY mode:
> - Set the state machine command to READ_ARRAY
> - Reset the write_cycle counter
> - Reset the memory region in ROMD
>
> Refactor the current code by extracting this pattern.
> It is used twice:
> - On a write access (on command failure, error, or explicitly asked)
> - When the device is initialized. Here the ROMD mode is hidden
>   by the memory_region_init_rom_device() call.
>
> Rename the 'reset_flash' as 'mode_read_array' to make explicit we
> do not reset the device, we simply set its internal state machine
> in the READ_ARRAY mode. We do not reset the status register error
> bits, as a device reset would do.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 36 ++++++++++++++++++++----------------
>  hw/block/trace-events   |  1 +
>  2 files changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 743b5d5794..33c77f6569 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -112,6 +112,14 @@ static const VMStateDescription vmstate_pflash =3D {
>      }
>  };
>
> +static void pflash_mode_read_array(PFlashCFI01 *pfl)
> +{
> +    trace_pflash_mode_read_array();
> +    pfl->cmd =3D 0xff; /* Read Array */
> +    pfl->wcycle =3D 0;
> +    memory_region_rom_device_set_romd(&pfl->mem, true);
> +}
> +
>  /* Perform a CFI query based on the bank width of the flash.
>   * If this code is called we know we have a device_width set for
>   * this flash.
> @@ -470,7 +478,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>          case 0x50: /* Clear status bits */
>              DPRINTF("%s: Clear status bits\n", __func__);
>              pfl->status =3D 0x0;
> -            goto reset_flash;
> +            goto mode_read_array;
>          case 0x60: /* Block (un)lock */
>              DPRINTF("%s: Block unlock\n", __func__);
>              break;
> @@ -495,10 +503,10 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr o=
ffset,
>              break;
>          case 0xf0: /* Probe for AMD flash */
>              DPRINTF("%s: Probe for AMD flash\n", __func__);
> -            goto reset_flash;
> +            goto mode_read_array;
>          case 0xff: /* Read array mode */
>              DPRINTF("%s: Read array mode\n", __func__);
> -            goto reset_flash;
> +            goto mode_read_array;
>          default:
>              goto error_flash;
>          }
> @@ -525,7 +533,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>                  pfl->wcycle =3D 0;
>                  pfl->status |=3D 0x80;
>              } else if (cmd =3D=3D 0xff) { /* Read Array */
> -                goto reset_flash;
> +                goto mode_read_array;
>              } else
>                  goto error_flash;
>
> @@ -552,15 +560,15 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr o=
ffset,
>                  pfl->wcycle =3D 0;
>                  pfl->status |=3D 0x80;
>              } else if (cmd =3D=3D 0xff) { /* read array mode */
> -                goto reset_flash;
> +                goto mode_read_array;
>              } else {
>                  DPRINTF("%s: Unknown (un)locking command\n", __func__);
> -                goto reset_flash;
> +                goto mode_read_array;
>              }
>              break;
>          case 0x98:
>              if (cmd =3D=3D 0xff) {
> -                goto reset_flash;
> +                goto mode_read_array;
>              } else {
>                  DPRINTF("%s: leaving query mode\n", __func__);
>              }
> @@ -620,7 +628,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>                      " the data is already written to storage!\n"
>                      "Flash device reset into READ mode.\n",
>                      __func__);
> -                goto reset_flash;
> +                goto mode_read_array;
>              }
>              break;
>          default:
> @@ -630,7 +638,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>      default:
>          /* Should never happen */
>          DPRINTF("%s: invalid write state\n",  __func__);
> -        goto reset_flash;
> +        goto mode_read_array;
>      }
>      return;
>
> @@ -639,11 +647,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr of=
fset,
>                    "(offset " TARGET_FMT_plx ", wcycle 0x%x cmd 0x%x valu=
e 0x%x)"
>                    "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
>
> - reset_flash:
> -    trace_pflash_reset();
> -    memory_region_rom_device_set_romd(&pfl->mem, true);
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0xff;
> + mode_read_array:
> +    pflash_mode_read_array(pfl);
>  }
>
>
> @@ -758,8 +763,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>          pfl->max_device_width =3D pfl->device_width;
>      }
>
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0xff;
> +    pflash_mode_read_array(pfl);
>      pfl->status =3D 0;
>      /* Hardcoded CFI table */
>      /* Standard "QRY" string */
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 97a17838ed..d627cfc3f5 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -7,6 +7,7 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0=
x%02x val 0x%02x"
>  # pflash_cfi02.c
>  # pflash_cfi01.c
>  pflash_reset(void) "reset"
> +pflash_mode_read_array(void) "mode: read array"
>  pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "of=
fset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
>  pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle)=
 "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
>  pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
> --
> 2.20.1
>
