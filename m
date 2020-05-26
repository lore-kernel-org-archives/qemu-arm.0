Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp332612lfc;
        Tue, 26 May 2020 10:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSVsu8X3dcUDFhGWNJIHNpR8bIVvtt3fTvXUhdJiN7sDnRacAsU/9ROAYqYTUwuLhPSFn4
X-Received: by 2002:a5b:c87:: with SMTP id i7mr3205380ybq.182.1590514606151;
        Tue, 26 May 2020 10:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590514606; cv=none;
        d=google.com; s=arc-20160816;
        b=JiIKPCoZkZF0oJbX/RqVqZK7oxqTKVXeRCt21Vpkdfr1mT8/lrrqrXqLh5npoWCP6M
         snyzkn+I3X80YPCcJj+7GjOClHAUN15HA0SuyoAaAhd49udOx80I6FtOg/pwqVwAw7a3
         745OGz3chiCZCUKAr55nf5d/v5toNbPtmJozvqnwqbs8vdJAJOyzsvu8eiqZBzQN7D5E
         5ZPj1dMynaDzpffYvSVEIlP0nNlGZU3KTpUnh26HzaK+7VGmYmH88pr2vRXcX0mt2UkC
         XHnYP7fmNkZm5MXmfuLUfgVwu3tn7EQDidjp25YhNVzjW1ZffTKWcuhQLoDRX4JQVad2
         ADYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IF4bqYL45cInc1vCEb+B2MlwDQ7gb2ydcaaJMqPg3B8=;
        b=v6DHp7235+7cqK/3Vz7R4pb7CTpyiwT4CCWlsU3nR7s4C4EJERmvgoqT/C54Si3HNr
         nLevIqKeGji4wxGmdcIJ+s4w0NAyDpsQx2DEIv7Gi10IQQTB6gaxSEIQP/hiLeb5Shye
         nb/a3BJ2jdzeQu/sboywjtr+0O2Neu4u3iuGSIGiwh4lX6TbgbPKrmBzwjy9s05UwYre
         MmVQV6spWsQgsj7NstZHd0adiPj+0fInu3zCy5qPWTG3GFQkDO6ywDm3l5W8NRZRkH0s
         g2jXDSrKFme1L5+bDUYXfAk7lKTCABjvXunVF2l4wSdOsdUfm+DxcmYStMjMP6HnTcUc
         kG/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hieretHr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o71si490372ybc.56.2020.05.26.10.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 10:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hieretHr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jddVN-0007fo-FX
	for alex.bennee@linaro.org; Tue, 26 May 2020 13:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddTb-0005ri-07; Tue, 26 May 2020 13:34:55 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddTZ-0003n4-SH; Tue, 26 May 2020 13:34:54 -0400
Received: by mail-qt1-x844.google.com with SMTP id x12so16784098qts.9;
 Tue, 26 May 2020 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IF4bqYL45cInc1vCEb+B2MlwDQ7gb2ydcaaJMqPg3B8=;
 b=hieretHrX3icv9LgqmaRSLx6ob8Hnjbb8jkpSSRCR78SCRllZNUkV/1eMp/x/P64dS
 msIQK2H0HmjYeKgO9d9zKLYeqqb7BKRD/341uyYLa6P7ritaFSwjEFzq/VSErwdHkQx6
 DBCUfcj8c1iGHxP9I04n9E/cenLHgZCRMsIJD3MNA/VYlHm4hTafJEv36zVGRr6HnxX1
 j4uO/qLXYqPIbO0XxRiqJfpndVqDPSswuoWhPvj7fETpmaz37sy8lLRNgrK/yZV7MX/w
 s7FZUfTmz9Y72ErPLXUcCI1fohE+01KrEPCNMM+ju31JV+Rj6AKTGg9SSBgIXAUA/mZY
 c3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IF4bqYL45cInc1vCEb+B2MlwDQ7gb2ydcaaJMqPg3B8=;
 b=Zjh4k4njsA9YJKeYAkXGmlnec7v84rMf02DlKwbFRCaS8BUF+T1qrkuG01UzMhCsAb
 04gLM0m/9Nq8Z4C3zvExTnK/LA1WnaJTL50FqnRZ+3FAcZwYHIzOtE1jCsRXICPEFbhg
 HeZJGftsygONWb1Qmn6RLCJSv/lXb2vXjoCPFzVuZvpwFHV4dTfnIbZDxHGpR4Nx2goH
 +ru9G2/Hq90bdt+MXgjjflLkMtGHRkQPzN6mSqdezk9Ep/HGT4z3oocd4OB8iFDMCAQ2
 vkybygqdOKJYXvCMmi1C5Rff4Ql9Qd0y6YiUGsKPTr9vVHwadsEhqnvd5SSu7mkMKbrS
 LjVQ==
X-Gm-Message-State: AOAM531xqpESqvCI9Hku49xRyJ4/2aZk+8SOR58amxm3PhDh8yZ1KRWh
 LgV6f4Lt9HpzB0bTQtkDQ0r/RYGCaKJTnSeuJzg=
X-Received: by 2002:ac8:498e:: with SMTP id f14mr2401584qtq.125.1590514491921; 
 Tue, 26 May 2020 10:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-11-f4bug@amsat.org>
In-Reply-To: <20200526062252.19852-11-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 10:25:53 -0700
Message-ID: <CAKmqyKOjJjqfEVH8f24hggh8X_9NL-tPanhKr68Z1PHFrA54vg@mail.gmail.com>
Subject: Re: [PATCH 10/14] hw/display/vmware_vga: Replace printf() calls by
 qemu_log_mask(ERROR)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::844;
 envelope-from=alistair23@gmail.com; helo=mail-qt1-x844.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LyCMTQNLfxUa

On Mon, May 25, 2020 at 11:32 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Avoid flooding stdio by converting printf() calls to
> qemu_log_mask(GUEST_ERROR), which are disabled by default.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/vmware_vga.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index 58ea82e3e5..5c0fc49d9d 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -26,6 +26,7 @@
>  #include "qemu/module.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> +#include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "trace.h"
>  #include "ui/vnc.h"
> @@ -953,7 +954,8 @@ static uint32_t vmsvga_value_read(void *opaque, uint3=
2_t address)
>              ret =3D s->scratch[s->index - SVGA_SCRATCH_BASE];
>              break;
>          }
> -        printf("%s: Bad register %02x\n", __func__, s->index);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad register %02x\n", __func__, s->index);
>          ret =3D 0;
>          break;
>      }
> @@ -1002,7 +1004,8 @@ static void vmsvga_value_write(void *opaque, uint32=
_t address, uint32_t value)
>              s->new_width =3D value;
>              s->invalidated =3D 1;
>          } else {
> -            printf("%s: Bad width: %i\n", __func__, value);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Bad width: %i\n", __func__, value);
>          }
>          break;
>
> @@ -1011,13 +1014,15 @@ static void vmsvga_value_write(void *opaque, uint=
32_t address, uint32_t value)
>              s->new_height =3D value;
>              s->invalidated =3D 1;
>          } else {
> -            printf("%s: Bad height: %i\n", __func__, value);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Bad height: %i\n", __func__, value);
>          }
>          break;
>
>      case SVGA_REG_BITS_PER_PIXEL:
>          if (value !=3D 32) {
> -            printf("%s: Bad bits per pixel: %i bits\n", __func__, value)=
;
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Bad bits per pixel: %i bits\n", __func__,=
 value);
>              s->config =3D 0;
>              s->invalidated =3D 1;
>          }
> @@ -1082,7 +1087,8 @@ static void vmsvga_value_write(void *opaque, uint32=
_t address, uint32_t value)
>              s->scratch[s->index - SVGA_SCRATCH_BASE] =3D value;
>              break;
>          }
> -        printf("%s: Bad register %02x\n", __func__, s->index);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad register %02x\n", __func__, s->index);
>      }
>  }
>
> --
> 2.21.3
>
>
