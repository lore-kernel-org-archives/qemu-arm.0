Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2651360wru;
        Fri, 28 Jun 2019 08:58:57 -0700 (PDT)
X-Received: by 2002:a19:3804:: with SMTP id f4mr5227740lfa.69.1561737537735;
        Fri, 28 Jun 2019 08:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561737537; cv=none;
        d=google.com; s=arc-20160816;
        b=v7+gouMSTSHR4zLsQMjdnzVSQYY1Tnf1krqmORNTIGLe2M9Nd0k8eXkjsArCnsRPBk
         +lFXqGxvUYJNCWCl6RhC/GYY/ByKgrbsfp+wRzGcP9MWHvOJVJtYCsdOn57WBVhK+mCN
         5qeaIrez3CW6kAwypyLgwGxphOwO8tYZ8FACfshoFPeM2KI3Ww0RxSBGiwbkOtAu37oQ
         6gbbkntTzXBBRhQvZ1URac7b3VJ88UTvDaNb5X1UZp42THVwRPR0w4h0Veci3Zr0BaSY
         uQta3TctuUmazkXmM6hymay2FjGJMac2e03HXOfWi8uWooagaccHYIh/Wxr6vn4HmOm8
         r5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nTecwUNICFBnPJuivHvyec7tJWuxumCuvk8mOqdjk5U=;
        b=pE/Tt+51HQh1uxidootHso/syz4a/KnQxAZyp6lNkz5qRIb+9TEOS+ZiRPJg0Cijli
         Scso/P4ahoyJ2MALcCExJH/sACiQMijrtr6r3Q9gfzeH+oTjJfRPuQRWWyw/fJ7cIp0M
         7G87X/5vp/f8CXphsPHChnkzKuKeNp0I1R6ZEzDwaxb5YY5F6q8M2Dukd8dzfVEBU5AA
         yduYEs9+NK/y9jWMGwg7dJ6vNL8oP9i3Swdh5tcKYJIbpgQDuLpI2KKDijwTJaDqv8hI
         yxozkbtfjm7SEzngR7hwTKI41IPaWPyz52soy5JElueLimeWkV1QwOmRfXYHslNMWXdx
         0eiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="CFKX1k/M";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o6sor1784553lji.36.2019.06.28.08.58.57
        (Google Transport Security);
        Fri, 28 Jun 2019 08:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="CFKX1k/M";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nTecwUNICFBnPJuivHvyec7tJWuxumCuvk8mOqdjk5U=;
        b=CFKX1k/M97Xj0qvxURCC51SzZY9MvohoYs3sQYbtYHhh9xiEXkpGO27VJ0KEH7de6r
         VPhrFEV7//63aeMD2Q4ChA1asPg4b/wt2DruiP51xxAUPP1PuR7HJCfIX3LyiIbe0+mI
         gEV7UwZ0pAQCiJ7VIEifUvcFw7DoGnbBRnsYLSWs0lqyjVC9OAok/AkYMlZr+p8nJwIz
         Qhm5Jg52jAl58CvsZFGICJKJqGFXKTWiSYwfYp5xY+IlUZx0/XxrpplbuSYSQYDeolys
         Rfiv+bCE6jKPvmwBNVlCUs98P99QZCRar6x3YJENDfSh0ykXY7qk9Fg7uW8zQc+jxrPn
         Z7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nTecwUNICFBnPJuivHvyec7tJWuxumCuvk8mOqdjk5U=;
        b=NiRzdwu2IzMj6NKwWICcm37a8kwX+xdINMLcy89Vd1Uo8fwwx4aZOLB3lSoq4MjkeX
         Gs3v0sTabb3TjBTU4lqZ4B2EsWDT1otmcAeD2DYXK+s4YNP6xmL9RP61CG6UZQkBML90
         t3PDSN5mq+GTQqriIn6QAe3tRYL0+qtJH/mzY/kbEGBEiCedob04JqSzTY3WB5LNwbrI
         6JvnVmaAyr587yM4a4iu31XyMg/OSAu61a1rMi7+RDKVM01hF39su+cD0WnG0SfvAjFj
         63z37uveUAh5Gopx1+Lf1OUC/qrX9LQ9zwdVYW+XRbSrso05WaR6MV5KEZYbdKXcQ5RB
         p4VA==
X-Gm-Message-State: APjAAAU8w2W3EtA0y2qQxae+a4Bkia0cI5aO0we9Mn3kIAGJKHAg+DHh
	Y8AgI+m3i49+K8TK7fEEK6Rzq9HXTuqoFVCQuLE=
X-Google-Smtp-Source: APXvYqz7Lco6wbhRaovTv3wWiVBo4Vv3zjgnJjO/aYJr67hI90YxOon3yll691JDmQ1GfkPqtOts/H1q2UdzW1dyBVA=
X-Received: by 2002:a2e:5d5a:: with SMTP id r87mr6648846ljb.196.1561737537434;
 Fri, 28 Jun 2019 08:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-5-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 08:55:57 -0700
Message-ID: <CAKmqyKMwbr+FL+B+EH0W7Jpr03hex2i-H7TReyU8oVRA3kRpuQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 04/28] hw/block/pflash_cfi02: Fix debug
 format string
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: i8CzkHb3Sukd

On Thu, Jun 27, 2019 at 1:36 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Always compile the debug code to prevent format string to bitrot.
> Delete dead code.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch, use PRIx32]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 6cdfc85264..43796e551a 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -47,15 +47,13 @@
>  #include "hw/sysbus.h"
>  #include "trace.h"
>
> -//#define PFLASH_DEBUG
> -#ifdef PFLASH_DEBUG
> +#define PFLASH_DEBUG false
>  #define DPRINTF(fmt, ...)                                  \
>  do {                                                       \
> -    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
> +    if (PFLASH_DEBUG) {                                    \
> +        fprintf(stderr, "PFLASH: " fmt, ## __VA_ARGS__);   \
> +    }                                                      \
>  } while (0)
> -#else
> -#define DPRINTF(fmt, ...) do { } while (0)
> -#endif
>
>  #define PFLASH_LAZY_ROMD_THRESHOLD 42
>
> @@ -218,14 +216,14 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwadd=
r offset,
>          default:
>              goto flash_read;
>          }
> -        DPRINTF("%s: ID " TARGET_FMT_plx " %x\n", __func__, boff, ret);
> +        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx32 "\n", __func__, bof=
f, ret);
>          break;
>      case 0xA0:
>      case 0x10:
>      case 0x30:
>          /* Status register read */
>          ret =3D pfl->status;
> -        DPRINTF("%s: status %x\n", __func__, ret);
> +        DPRINTF("%s: status %" PRIx32 "\n", __func__, ret);
>          /* Toggle bit 6 */
>          pfl->status ^=3D 0x40;
>          break;
> @@ -268,10 +266,6 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr of=
fset,
>      trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle)=
;
>      cmd =3D value;
>      if (pfl->cmd !=3D 0xA0 && cmd =3D=3D 0xF0) {
> -#if 0
> -        DPRINTF("%s: flash reset asked (%02x %02x)\n",
> -                __func__, pfl->cmd, cmd);
> -#endif
>          goto reset_flash;
>      }
>      offset &=3D pfl->chip_len - 1;
> --
> 2.20.1
>
>
