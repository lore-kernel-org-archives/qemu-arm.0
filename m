Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp335608lfc;
        Tue, 26 May 2020 10:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvFhGD7oLYzymdcLyEaa1Rku3Lh+qypk9c1OvS4ueAzfeGZ2CukflxnZc5ARdGgQjdxoYV
X-Received: by 2002:a25:d64d:: with SMTP id n74mr3395334ybg.276.1590514859430;
        Tue, 26 May 2020 10:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590514859; cv=none;
        d=google.com; s=arc-20160816;
        b=QlEVLKMUaGtEG7qFp21zEJUWkFTWlbUXAAkBXTtVQTk1+d1N1Q/H9vwPp+Ufub+rPj
         Yj2TnqE7qtpQBOaOfaMDxAWScT+DbQPMr9FMAYfUuW5atfY0oUB2JiAk5Gr9+IaWxcDA
         8ifU/Gu1szO3UPJoUPfor8agpGmWseaoM26GtxIb35+kcGPGc7XGE+xzYoc3w7+ddGua
         vtRMfmPBT6Uzsr8MjFKIYwDPCRf3J033CbmPQ/riEGvGtbOxnh8l5zUgkYnOUzW8NFrs
         hW992K373COsC8jIGMW+RkHljLGrRWp5u7bj9GnMHP+icijyoFLDA0r9LxfaGK0TsXJn
         l+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7dIEbDvjdPSgiC8KM+8KpNw2JYaYxr6R5A6LSlImonY=;
        b=UCdC/3pbcgSXRlVd4oKoyPQRGVDfwtT10aknIKsdPK/B06FppOg/5d3WbOgG6t38qO
         iCDS17tYEZaaUpmM0l9WZu93ljiVvab1pYcu+TZdM9yF02MgxRgK1zfgebjEHHkikd0v
         tA5jTHfk74oaHlQk6LXOt+LYYOFS7lq8kMMnjIY5oeM87n5Fe4RMLovmHrsyLb6ZrjWF
         nCzKMeeAu8FK4Z1i8QItbq+YWBdLo9q2bgTAL4QCJh++Gvi4jf5mzhLbsTKGBgWx0QdN
         NHMqPQBazc0Tw/Z3/WyF1CtlsthsgIptOJzJ67zyjc+DdC1DVovQzSRp4AuD2RxKKThk
         ZOqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jQgFVP3z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si771515ybt.108.2020.05.26.10.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 10:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jQgFVP3z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jddZS-0005uu-J0
	for alex.bennee@linaro.org; Tue, 26 May 2020 13:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddW8-0001j9-Vn; Tue, 26 May 2020 13:37:33 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddW7-0005ll-4D; Tue, 26 May 2020 13:37:31 -0400
Received: by mail-il1-x141.google.com with SMTP id 17so21344269ilj.3;
 Tue, 26 May 2020 10:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7dIEbDvjdPSgiC8KM+8KpNw2JYaYxr6R5A6LSlImonY=;
 b=jQgFVP3zBEvCFOi/6th7JnPuipZCfzltmxZv+SAGJbagvzWUylgKGdXJTbxZ/wqNIR
 8cr9l+hXsuY3MfkvyUYE2FDHVv3Q++ZKvgJN12jdv6C11BrFVr8RuJIDJHhjKWpFlWCF
 WMiEC/9BdIics6oxDXdqi8E0eVKzqCrtmbnhAti77ZtRsYE4/M0+S/09dw474ZJKbHFi
 9FG1QRJwvkjk8fCT7C1Yi2EFxnGD4V5TRfY/JR88nqPkikv90yNpkhvXgf0RGrpsWA0R
 hiWYEYaGOKd3+tFwn62+jvI55mmfQo+HE0MxDmAK3XsYJuGFIFHXxNzb/XBeggEgzxex
 ndkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7dIEbDvjdPSgiC8KM+8KpNw2JYaYxr6R5A6LSlImonY=;
 b=UE4WoQ+LhGxQtUFXVwXHAQreVzRAKJZjCPke00y1jxpypceB8Mf4cMqSEIZ8q95iCS
 VT8ZvSqBrtocBWLXV5bkqzZJhpYZZ2xnX18lfkDiXIi2fto2/kiPycKFurTuu0LhCGKn
 3LyVNpQKfgCK4uoyd6Si4wZjC8yTTv92bg9FSFQ16itZ+hZXetLqOz00Bc0KgzwnLRhM
 GS5nspLPiJw8ju3DwZ/LJo8fcavkvgVbOHu+OQr5ZblghVE8igCzD3STGIIbNe7nkFy4
 aR5RPfYkB9esspp3xDJUSvRhHQ2J8oX6T9/i7Biz7QvSWp3w6gH7cNf/v5ErddFwAuGx
 PDTA==
X-Gm-Message-State: AOAM533l0ZZO5ohZftrRntKIDgoKjrq+mBRTK+G4h1mEy6kMW8KcX4Uq
 mBO7OAI76YucMStKaluufn97Y6MQNH04jGYHil4=
X-Received: by 2002:a92:d087:: with SMTP id h7mr2336786ilh.227.1590514649527; 
 Tue, 26 May 2020 10:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-15-f4bug@amsat.org>
In-Reply-To: <20200526062252.19852-15-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 10:28:29 -0700
Message-ID: <CAKmqyKM9r2QXppfiEW4RVrXNbYzhx-Ds2CsODKVUk0Sxei0JwA@mail.gmail.com>
Subject: Re: [PATCH 14/14] hw/display/pxa2xx_lcd: Replace printf() call by
 qemu_log_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
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
X-TUID: Ow9eKHHDQlnp

On Mon, May 25, 2020 at 11:36 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Replace printf() calls by qemu_log_mask(UNIMP), which is
> disabled by default. This avoid flooding the terminal when
> fuzzing the device.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/pxa2xx_lcd.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
> index d5f2e82a4e..ff90104b80 100644
> --- a/hw/display/pxa2xx_lcd.c
> +++ b/hw/display/pxa2xx_lcd.c
> @@ -426,9 +426,10 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr o=
ffset,
>          if ((s->control[0] & LCCR0_ENB) && !(value & LCCR0_ENB))
>              s->status[0] |=3D LCSR0_QD;
>
> -        if (!(s->control[0] & LCCR0_LCDT) && (value & LCCR0_LCDT))
> -            printf("%s: internal frame buffer unsupported\n", __func__);
> -
> +        if (!(s->control[0] & LCCR0_LCDT) && (value & LCCR0_LCDT)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: internal frame buffer unsupported\n", __f=
unc__);
> +        }
>          if ((s->control[3] & LCCR3_API) &&
>                  (value & LCCR0_ENB) && !(value & LCCR0_LCDT))
>              s->status[0] |=3D LCSR0_ABC;
> @@ -462,9 +463,9 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr of=
fset,
>          break;
>
>      case OVL1C1:
> -        if (!(s->ovl1c[0] & OVLC1_EN) && (value & OVLC1_EN))
> -            printf("%s: Overlay 1 not supported\n", __func__);
> -
> +        if (!(s->ovl1c[0] & OVLC1_EN) && (value & OVLC1_EN)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: Overlay 1 not supported\n", __=
func__);
> +        }
>          s->ovl1c[0] =3D value & 0x80ffffff;
>          s->dma_ch[1].up =3D (value & OVLC1_EN) || (s->control[0] & LCCR0=
_SDS);
>          break;
> @@ -474,9 +475,9 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr of=
fset,
>          break;
>
>      case OVL2C1:
> -        if (!(s->ovl2c[0] & OVLC1_EN) && (value & OVLC1_EN))
> -            printf("%s: Overlay 2 not supported\n", __func__);
> -
> +        if (!(s->ovl2c[0] & OVLC1_EN) && (value & OVLC1_EN)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: Overlay 2 not supported\n", __=
func__);
> +        }
>          s->ovl2c[0] =3D value & 0x80ffffff;
>          s->dma_ch[2].up =3D !!(value & OVLC1_EN);
>          s->dma_ch[3].up =3D !!(value & OVLC1_EN);
> @@ -488,9 +489,10 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr o=
ffset,
>          break;
>
>      case CCR:
> -        if (!(s->ccr & CCR_CEN) && (value & CCR_CEN))
> -            printf("%s: Hardware cursor unimplemented\n", __func__);
> -
> +        if (!(s->ccr & CCR_CEN) && (value & CCR_CEN)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Hardware cursor unimplemented\n", __func_=
_);
> +        }
>          s->ccr =3D value & 0x81ffffe7;
>          s->dma_ch[5].up =3D !!(value & CCR_CEN);
>          break;
> --
> 2.21.3
>
>
