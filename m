Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3953506wru;
        Tue, 2 Jul 2019 09:01:34 -0700 (PDT)
X-Received: by 2002:a2e:95d5:: with SMTP id y21mr1013414ljh.84.1562083294883;
        Tue, 02 Jul 2019 09:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562083294; cv=none;
        d=google.com; s=arc-20160816;
        b=rX0KiiNoc1HvxKeyAOL0BqQcne/gGC2LBl2UB7+d9swQDpQu77sPvrQPLBlqf0DuFa
         wp62UFZHyIKHf+nCNKaMU6N8HupXvSOweRo34TqWsU2dBlfQaJVHmMkuFFaClxrIWv7M
         Act+o1rYoAFvSXD2hJIw9UTfLUk6dkrxaQMSJXS2e+S21AMGlZwjM8wix86qLUwreuCt
         kTH04F7XOo7quf9Ojurn1NdxmsNzTAGS+7i1c2dypb3DLPmjCBOFfA3T/FLE4hB/bmJo
         fEW8DWu24GYJACqUW/hd0BJvYtkHFxcrkhaAUPpLXVCnhjrARzsOE5s5m2hEvyxX02NW
         zixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wIGWLe+5OEpUx2zrWqvM3paus1OxHsxJGQW19htOqMg=;
        b=bzOjYmmEldZCd3hH0ZMGdIBh/RNoTq0Bj0LhBbj7sBxIkWJUA3nX92t9b0rrRYD1DN
         ZZTYcKLgPvJg+W1EUJeXYGV0hjs3hAq+C0RBtpcP+GDpkHVUuH0zcXoObcPIebUKMskw
         V+t9ZFLzJvegbgfdDMes3HPZzPj+C2Jlb8uYcMPmrmu20SwM4+RWePXgEyyratCfPRYN
         Na020jRibIJGb5MIGHyjxhEwxvuNUYPropnZfYGV2bxsZ6kajL8BmSfd+eNnTHx2yWpW
         BH3RkJ0NquYmaK+GidHfDJcaNtzTUo0YPvDcjt858YGPthOI+ocG3IdOGKUYbQrO8tvI
         9rpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IIz0Axiz;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v9sor7808713ljh.19.2019.07.02.09.01.34
        (Google Transport Security);
        Tue, 02 Jul 2019 09:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IIz0Axiz;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wIGWLe+5OEpUx2zrWqvM3paus1OxHsxJGQW19htOqMg=;
        b=IIz0AxizhitucEhEvevqOZ2t4c2bbLEu6u0fZn9+HssqOon5KQs2rtQoLz+vCH46Kg
         oPunA2zcxdzk+9lNYK0MVgbpC1mrxJtcGynkcXhyRGheG3xNc9YOig98XS+eJq66Q4Ho
         WTdHPPJR+Es7V7IcYj9QWioP6yBH2SV4WWDNmgaa97b9sROGPfacVVXX6MfjcCu6Q1xd
         UzKysl8voq/eAC3C85XBJE11bM9hP01q3J/BLvo1YD4vTpYkt2DKvndzq/lQ7wDEL+lL
         Yx7jqW1P68WNc81/E4JcjKXRl7gFl7ioz+qZ8vVwoU8TBDzr1Mr1lG7H3tPUckLJjpF3
         5VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wIGWLe+5OEpUx2zrWqvM3paus1OxHsxJGQW19htOqMg=;
        b=HLV7FZSmWGzstm3v9cq3Q4tUWpY1PW9SWdTNLeWYlCYimucEcA8xyX0xBKCJU9vmqq
         Knyo7EnCL7VoU0GxtWJ5H81bRAFGNJGjHg/zzzWNE3V6qJA1cjiCatywJCvYij2RsAXB
         4uqFJBkHfdV9Trz+jaKpdp+mLHNB1aHH01BcaSHoaP7JIsiOnmvJ++TGqqV6rLRGIH0S
         4vLwp5ksBjax05NdtdpKzcx3uxZ1q5yyDWeaitW+9o4eAUtqywl8ziVgmlN8ipeu8JkL
         DIu4JsnYCwaGpuDNbLIpFok/EC2sqWzxNhtGtO67f+YFCfYlbF6TaRyF7b02E4QByNGp
         SBxw==
X-Gm-Message-State: APjAAAW9FPSXXnZVmBX2HPeXdCGV3mGJR7YNK0dCts8VHCSjxDkU1kIa
	5onA8Fr6C1Bth5ddPr2bd/43ybr7l2bqdz4vF1E=
X-Google-Smtp-Source: APXvYqxzES5gqFeqFyYs9OobCu2LnxrD0eOgZreaht0y3/VzWwERjbqAkozVEGBNoIXkuZKtaJeTgjs3KmzCEkQFYWM=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr17532129ljj.146.1562083294552;
 Tue, 02 Jul 2019 09:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-2-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 08:58:30 -0700
Message-ID: <CAKmqyKOa-C=y7e5iKR2FCxz1-rWc0VJn7B246roSVUhzEWb5iQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] hw/block/pflash_cfi01: Removed an unused timer
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
X-TUID: 5J5+SmiA9nFt

On Mon, Jul 1, 2019 at 5:13 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The 'CFI02' NOR flash was introduced in commit 29133e9a0fff, with
> timing modelled. One year later, the CFI01 model was introduced
> (commit 05ee37ebf630) based on the CFI02 model. As noted in the
> header, "It does not support timings". 12 years later, we never
> had to model the device timings. Time to remove the unused timer,
> we can still add it back if required.
>
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Fixed commit description (Laszlo)
> ---
>  hw/block/pflash_cfi01.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 35080d915f..dcc9885bf0 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -42,7 +42,6 @@
>  #include "hw/block/flash.h"
>  #include "sysemu/block-backend.h"
>  #include "qapi/error.h"
> -#include "qemu/timer.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "qemu/host-utils.h"
> @@ -90,7 +89,6 @@ struct PFlashCFI01 {
>      uint8_t cfi_table[0x52];
>      uint64_t counter;
>      unsigned int writeblock_size;
> -    QEMUTimer *timer;
>      MemoryRegion mem;
>      char *name;
>      void *storage;
> @@ -114,18 +112,6 @@ static const VMStateDescription vmstate_pflash =3D {
>      }
>  };
>
> -static void pflash_timer (void *opaque)
> -{
> -    PFlashCFI01 *pfl =3D opaque;
> -
> -    trace_pflash_timer_expired(pfl->cmd);
> -    /* Reset flash */
> -    pfl->status ^=3D 0x80;
> -    memory_region_rom_device_set_romd(&pfl->mem, true);
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0;
> -}
> -
>  /* Perform a CFI query based on the bank width of the flash.
>   * If this code is called we know we have a device_width set for
>   * this flash.
> @@ -775,7 +761,6 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>          pfl->max_device_width =3D pfl->device_width;
>      }
>
> -    pfl->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
>      pfl->wcycle =3D 0;
>      pfl->cmd =3D 0;
>      pfl->status =3D 0;
> --
> 2.20.1
>
