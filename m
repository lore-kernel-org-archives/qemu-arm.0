Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4574355lfm;
        Tue, 30 Jun 2020 18:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVA3t3kBj8aVds+RjPxFvXqZDkhxGzasCf4Pc5Zwi0UwrD92zHv2jjtF9hlKZRG2y0T6t9
X-Received: by 2002:a25:c5c3:: with SMTP id v186mr36659490ybe.233.1593565351386;
        Tue, 30 Jun 2020 18:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593565351; cv=none;
        d=google.com; s=arc-20160816;
        b=HOxRk1RDlHqyv/+fb+uJjYZM0EEU8g8NRAfPag4l81QsqwfcKS3TS2oryE7PyoKzH/
         k5xsFwYVodvdoJeRoHvh0wXsNTOC/P2WBjeJDujQuAY2YAUDXd/GTdAwYgZjijqtuEQx
         uf10DV5iQ6N2sK5e5vGsX0rTAv2j/CX0vXdw9h1vI1+AL/qjwgznvHLV/gJLA8QBi1+U
         /uWP5PkD9CpoJWCxI9dYqdcmnIkzWYcmHEybYSA+Yb/T78dBKDfFM3VCVWreKBiOAqzP
         1RrOwbS5d+pzHigcZmM9lstZIGzvCVtF5ZXjklFnr/yurJbE7/1CGBooO7VlIydSk3S3
         yX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q+ANy+tmYn8jGdx2J/ZJza45S2FkoMYyR2K9DYPm68s=;
        b=ThCH/Uv5+WbyZQxCPRPRWtiKDvlliUvbISXX1IQ6PLYswQHaAzCkJqLVANPWTx0VNe
         AM2PlcWY4ZohprjZCZE6euo2b1QREsWNZ0X/jE0mpZ54BKk6w7RpDu4wuz+YXuYcT58/
         9k/YTrku93qAiYAiG+oSOAPRBi9Rz/B5bhmDJ1AdkPLTH0q2CLxr7KXJ8flwWzn1W3vy
         hbPNdIsSkOj0bCYkbLqfvXjZYJf58h0vzgKnz7dilkUemDH/s/LAEQg++2b3afwnD1No
         IMG0Rc1ut5gf+09UoSy179Xh5K7irw6oVr9laNxlvWvnmHgZp0DwWFodYPbx1ux8lwlB
         rmHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I7kFGLGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si4021950ybk.453.2020.06.30.18.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 18:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I7kFGLGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqR8w-0003Yd-Ly
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 21:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqR8c-0003YS-LY; Tue, 30 Jun 2020 21:02:10 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:36272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqR8b-00028G-0D; Tue, 30 Jun 2020 21:02:10 -0400
Received: by mail-io1-xd42.google.com with SMTP id y2so23174099ioy.3;
 Tue, 30 Jun 2020 18:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+ANy+tmYn8jGdx2J/ZJza45S2FkoMYyR2K9DYPm68s=;
 b=I7kFGLGRN5mXupkJOQSw0Dn8DW+LrztFQYk6ZqOeh/GFg++gwQkJXnP4ZbCzzoX0eT
 IYmWMeft8sJWHcMYHelb5SmBeMKR8DjlVIcyC/0uTI9e+Qx0VCsObNUIYxvs6xqwfctR
 CR8fxFORHu7bw/LkxyMddSUbJyzx77FbaOXHvxKfvPMpQU9VlD3YF2JK9Ta4oT3A5uU8
 98S723BpzEoDnWivFeDXaRFKLPp1FSvpnk50jmmJ9s3KHqwojz44+6wfEYwpX5OJrAa8
 cfGnAiDsOvhWDIceuEJ393cCBpNezD9uaswaycmymVC6Ov0xLjitUFdQA2em2tmBQ5+P
 3YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+ANy+tmYn8jGdx2J/ZJza45S2FkoMYyR2K9DYPm68s=;
 b=KVIrA7EQzK/+jgqBSvZHN6kFWL04OhPecgyK8bWSZkj8xXCjWLOWndGQfbKwTGDzMv
 aesmSFFgHMtp9eUDS634y2t6lxcfwb4fFcHgaTjX2/PrDBk+RDp+oUjREHo6bWrJo3N8
 i3OKOW9I1uWrVe9hStC0aunHVz7OWaAvOAXOwfHwsOCocNVMOmrDLFZD0EyHLwb7jDVD
 PIq/4pjp6xiJNPyHpGQ/KSF0/xnjTbpcpjAazP24xkxoZTbAjzpeByrsAOT36EkyyB/W
 IvztBkNt0FiW0P3iddX/qyEsRkR8Xk/6d7hCesirZPnzGMyTiapQRtBKvk6SvEzI8ap0
 kZSg==
X-Gm-Message-State: AOAM530LFHJHr/gfwrAqExLGOH4vIXVmL2MSj8N5Jh2LJw4As+kC2We8
 uHgmhMIWtQNpWOB+aoELCVLWhGVcZIqYvrZz13Q=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr8934457ios.42.1593565327691; 
 Tue, 30 Jun 2020 18:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-15-peter.maydell@linaro.org>
In-Reply-To: <20200628142429.17111-15-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Jun 2020 17:52:23 -0700
Message-ID: <CAKmqyKNgg20MHE_qo+49b67gR-3NncWHntH+kWXHqsqEKK81dw@mail.gmail.com>
Subject: Re: [PATCH 14/17] hw/arm/spitz: Use LOG_GUEST_ERROR for bad guest
 register accesses
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
X-TUID: qBXKcXf4N5nX

On Sun, Jun 28, 2020 at 7:33 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Instead of logging guest accesses to invalid register offsets in the
> Spitz flash device with zaurus_printf() (which just prints to stderr),
> use the usual qemu_log_mask(LOG_GUEST_ERROR,...).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/spitz.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 6eb46869157..49eae3fce4e 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -23,6 +23,7 @@
>  #include "hw/ssi/ssi.h"
>  #include "hw/block/flash.h"
>  #include "qemu/timer.h"
> +#include "qemu/log.h"
>  #include "hw/arm/sharpsl.h"
>  #include "ui/console.h"
>  #include "hw/audio/wm8750.h"
> @@ -65,9 +66,6 @@ typedef struct {
>  #define zaurus_printf(format, ...)                              \
>      fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
>
> -#undef REG_FMT
> -#define REG_FMT                         "0x%02lx"
> -
>  /* Spitz Flash */
>  #define FLASH_BASE              0x0c000000
>  #define FLASH_ECCLPLB           0x00    /* Line parity 7 - 0 bit */
> @@ -137,7 +135,9 @@ static uint64_t sl_read(void *opaque, hwaddr addr, unsigned size)
>          return ecc_digest(&s->ecc, nand_getio(s->nand));
>
>      default:
> -        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sl_read: bad register offset 0x%02" HWADDR_PRIx "\n",
> +                      addr);
>      }
>      return 0;
>  }
> @@ -168,7 +168,9 @@ static void sl_write(void *opaque, hwaddr addr,
>          break;
>
>      default:
> -        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sl_write: bad register offset 0x%02" HWADDR_PRIx "\n",
> +                      addr);
>      }
>  }
>
> --
> 2.20.1
>
>
