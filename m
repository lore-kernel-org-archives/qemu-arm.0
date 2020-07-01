Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4565277lfm;
        Tue, 30 Jun 2020 17:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXK09j3xtI7DJwb3wJd8zdi5g2BC1tui5KnE7YY77otHIreadywiaAxUWlw4ABsT8ZCwzL
X-Received: by 2002:a25:9909:: with SMTP id z9mr37138403ybn.174.1593564538713;
        Tue, 30 Jun 2020 17:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593564538; cv=none;
        d=google.com; s=arc-20160816;
        b=zhnWC7uupGAxn9uZhYVj98RGtok+4eC2qN2Keg6hd/kgwq+bVU+IBiTFmzKDcyPqga
         hF3+/pdvCzKJ2GJtBXBmOld7809Z+PQ2uIjmB2pMA0CdJG4LuDFg3vYOcyWNk7YKwOwi
         sg0kacXIpdptvnQ+/t6EI1nLwx0OwUHFdAcb4t/HkACPw0uvWixYCgUX3AAH08t08U4j
         NxRtVOryQOBFvDL/vpgkiwcPuLhk9ODfKuxp1qVNpgWtbVBrAQGeP+HsDkPa/x/ibAlS
         urYOJYVChJfL2LMTEytl7gfSHziHdtxVZ13podViU4tAxpHTGd3ZBZsfVy5Nb9KcL06U
         9SYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7CtOIRE6zq79/FIIwJKTayfmxdvbxzV7oSi57qtRis8=;
        b=0glDxY7ZF3biapaAX3IP4pKqD+UJm6BnokZqEmhYzgmO0LFllKGCt3weU6NbtLDaFu
         rZ5vbilf8L4rtj9ut9lffB6k9uALudF3KeXhhrJ1Y82iG3A6OIEdTyPef2A1Qq7kxhxt
         JCWNFumCORA4c+S0dqPz1R2KxQMFsv/b8t5NYRLDwAXyxLC15b4JySsl+CrLozk5ynLA
         /1LGmdagWtVLiy/KYLsgmHkDP9zpa9XFaIG6376kjfZSA88R6VZcGglMDXHvnbawx9au
         CYlLtLgyCpjVRswg15BttA1OtT4OxvFcIgh4ljGb7iwXEqsckdBXlkhSUkh8PHiHfvCm
         OU1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VxbYef/k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si4079872ybs.181.2020.06.30.17.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 17:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VxbYef/k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqQvq-0000qd-4Z
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 20:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqQvf-0000qP-BP; Tue, 30 Jun 2020 20:48:47 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:40064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqQvd-0000Ae-E2; Tue, 30 Jun 2020 20:48:47 -0400
Received: by mail-il1-x144.google.com with SMTP id e18so8850232ilr.7;
 Tue, 30 Jun 2020 17:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7CtOIRE6zq79/FIIwJKTayfmxdvbxzV7oSi57qtRis8=;
 b=VxbYef/kJ2tJ5t14pImF0Geizlro4tBgORk0W5Nh0Xz0WglCvaYEnDAO92h+7GsFho
 TuI6zXcE7gtBL6Xe4QPoNqyDJx3m+7nS0mYlmkCm0dqGje6pqnLxdwbEYG3zdV0id3/i
 Gr06dqQ5Roau0ct++kSDZL8l7JchFDeZ+FXYW+aN9Z0EHMkoueVvoLDOr8hXJBVwwXHK
 2Zfkeg+cLzKXsWgWGThWMykIZ1kGmSqJNNxYPcfIKvSZm1AkdazrUeTsF9eIBl9o060/
 GpX2wDGRQrYRW07zTdru8ZNUjlgHHAPOknBOv0cpG2WDPfYuL7LnI/zBi9dDqvzqvI9W
 pZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7CtOIRE6zq79/FIIwJKTayfmxdvbxzV7oSi57qtRis8=;
 b=UNQ+5kzxJ4my/qiqlUwgmxQFuSVUu82HpXQw8T7AWYGKv+bIq/PjemUBuguWc1vbEt
 z13y4y59mePi6WFjR6ARTKyCj+uE8nWqsU2C9GO791uxsJufT0455pZZJ4dzPgkk2UYJ
 MmDqwxFt+XJzxmWVjdzAV8du5nklSplWxa4RILGxrLm7useK6LSqVc9u52oK2hiVeejk
 hdj0Hf6q2I11GpO/mAVRMrp+hD6HiPAyx5bxwVp5IkJQdz0s9p7Qub50Sr8Pb0mc6PEU
 6aQAciSkIk5MxjE6S8c0SCTz2ByTU59cwqZvTsi43mAPjsMQwiz7dFzckZGOCeTqjBP0
 uTPw==
X-Gm-Message-State: AOAM532qD1+9o2s8510kU/fwRi2mFQMt8TVPeKbaKyjwuSwtcjRTfJ/m
 EMfdKVa3j/zu5go0a0HFGRg/LEbPaasPNSvXnAkPVvVg
X-Received: by 2002:a92:5f12:: with SMTP id t18mr5480177ilb.267.1593564523750; 
 Tue, 30 Jun 2020 17:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-14-peter.maydell@linaro.org>
In-Reply-To: <20200628142429.17111-14-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Jun 2020 17:38:59 -0700
Message-ID: <CAKmqyKMuG31E4ij_w=3U55N_0EsH=deDBEsqtaLxKFx=BNEe-g@mail.gmail.com>
Subject: Re: [PATCH 13/17] hw/gpio/zaurus.c: Use LOG_GUEST_ERROR for bad guest
 register accesses
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wviBLwjEGwpn

On Sun, Jun 28, 2020 at 7:35 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Instead of logging guest accesses to invalid register offsets in this
> device using zaurus_printf() (which just prints to stderr), use the
> usual qemu_log_mask(LOG_GUEST_ERROR,...).
>
> Since this was the only use of the zaurus_printf() macro outside
> spitz.c, we can move the definition of that macro from sharpsl.h
> to spitz.c.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/sharpsl.h |  3 ---
>  hw/arm/spitz.c           |  3 +++
>  hw/gpio/zaurus.c         | 12 +++++++-----
>  3 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/arm/sharpsl.h b/include/hw/arm/sharpsl.h
> index 89e168fbff3..e986b28c527 100644
> --- a/include/hw/arm/sharpsl.h
> +++ b/include/hw/arm/sharpsl.h
> @@ -9,9 +9,6 @@
>
>  #include "exec/hwaddr.h"
>
> -#define zaurus_printf(format, ...)     \
> -    fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
> -
>  /* zaurus.c */
>
>  #define SL_PXA_PARAM_BASE      0xa0000a00
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index bab9968ccee..6eb46869157 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -62,6 +62,9 @@ typedef struct {
>  #define SPITZ_MACHINE_CLASS(klass) \
>      OBJECT_CLASS_CHECK(SpitzMachineClass, klass, TYPE_SPITZ_MACHINE)
>
> +#define zaurus_printf(format, ...)                              \
> +    fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
> +
>  #undef REG_FMT
>  #define REG_FMT                         "0x%02lx"
>
> diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
> index 9a12c683420..258e9264930 100644
> --- a/hw/gpio/zaurus.c
> +++ b/hw/gpio/zaurus.c
> @@ -22,9 +22,7 @@
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
> -
> -#undef REG_FMT
> -#define REG_FMT                        "0x%02lx"
> +#include "qemu/log.h"
>
>  /* SCOOP devices */
>
> @@ -104,7 +102,9 @@ static uint64_t scoop_read(void *opaque, hwaddr addr,
>      case SCOOP_GPRR:
>          return s->gpio_level;
>      default:
> -        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "scoop_read: bad register offset 0x%02" HWADDR_PRIx "\n",
> +                      addr);
>      }
>
>      return 0;
> @@ -150,7 +150,9 @@ static void scoop_write(void *opaque, hwaddr addr,
>          scoop_gpio_handler_update(s);
>          break;
>      default:
> -        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "scoop_write: bad register offset 0x%02" HWADDR_PRIx "\n",
> +                      addr);
>      }
>  }
>
> --
> 2.20.1
>
>
