Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2009095lfm;
        Sat, 11 Jul 2020 17:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZqNHG6TJ3TER1KGYN5OybR+3SSVzO/qqXjujT8JCtxkn1r1Tap9ZVjYXdrfnhf05onoOf
X-Received: by 2002:a25:8007:: with SMTP id m7mr64094148ybk.60.1594513170536;
        Sat, 11 Jul 2020 17:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594513170; cv=none;
        d=google.com; s=arc-20160816;
        b=BPPcDmIcvoVvcmr8BwRxP/mSEgIrtSPrBybfuUGXqokJSW0CTHoAFyc28XB1eUgGAT
         f+RThLdyottH8wxA8UomG89EXYgCBIzWWfE7dyhWsXTVtCOc9v5cCDoNe0FWV6UQ0wmH
         UJaG6taw7HGmhey2Vw/lxlUnLLPrsXTSMYt/ncTUV7xpgK88VQTrupyD4VFrvtTTnaUL
         j7yNZD9AV3XGygdabkbmS6XwIpSuZIkH91guwrgA2cs8FIG6xGE13glQDtHqzqKspZB3
         JgJl2GfalBAVj92oHWt0MAKCG/XES+QzhcfjGlC6K/9RrFkR/AZ/eYEdlV+DWC9LOJ9q
         702A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9cPmQGTSAin+ostGOfnapRULbeSJoIJ3JP1SIdBHZbc=;
        b=pvc+kbYqV4z21nLN0S0YWh9s7yFAXe44GZTdgmFc/pAt3PKDeqBD69QjKzQ8fAiSKT
         r0WRHAB1E+BqBaVQ/rma2IESL2H6iHgMD5mrjwJNK8wwPvcDk7ls7rsxKUP0yAY/NKxn
         zd8lTfN5JhnzezcYodskZaEU+P6S5JWodR4LDqAKEFNWCyUhgVwN6FPPJyQ6RaQeXMww
         Y8VhbmcIZZ0pioXrJtEG3RuwkaMWubnjm4EPQQzw69fJ/XMO/tdftDJCgDbDFsy2dpO4
         UIMj4j+xHdZgHYrJjX2YsDiYaL8AHhS5O7wCUbb8mymgp+NN/fZd3oJcJDle6P+OAxGK
         3P4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gDqAqq2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k29si4840757ybj.291.2020.07.11.17.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 17:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gDqAqq2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juPiL-00009S-TA
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 20:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1juPiE-00009E-SE; Sat, 11 Jul 2020 20:19:22 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1juPiD-000396-8N; Sat, 11 Jul 2020 20:19:22 -0400
Received: by mail-oo1-xc43.google.com with SMTP id o36so1688521ooi.11;
 Sat, 11 Jul 2020 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9cPmQGTSAin+ostGOfnapRULbeSJoIJ3JP1SIdBHZbc=;
 b=gDqAqq2a60yT5D3G8IZNlrzhoJknRclLX9kFVb02zPFqOSz3M/t/C/D2dasSJyvFFC
 /KTVizx+cRDUnV+ZBoBmxAFEhExumxkoumFw9Mj2YX1JZJsrceC+ntmSIJp3FvkOXYwa
 EI6p0tOLTAxqr2STJqlLN9r6eEPHsZEfuN9snidFPeX3osSiwBEDRwG1C/R+ydiMFfpa
 2i/74TjGLb9/ynkp9edVFooXkEZmIFertH5j+mZuUUqjeXc5m90CY6GxxT21UUn9iXkO
 4yn3lVR1VkAlUkrpE7iHFcxH8v9N123LUdvd68G3sfRx3Qyt/lEDjpgW7plyH6v3S4fU
 zJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9cPmQGTSAin+ostGOfnapRULbeSJoIJ3JP1SIdBHZbc=;
 b=EayEIMCUQek36YvaHZPqutNesu9od8La0khTPQdpqF8hM5Jz42C3YBNhXIAyvI4F6U
 9wrlmychjoMUhX6XhT/Z6Wgck7Z19A7WP9HHCOOOZwB9PKwVlO4AqhaAAZwHpMQo1p00
 cYLPqE9YLIs/sZ7FkuUF/mJThE3oE9kvdix6Pcndh+l7nDjKga5xnuwob9+/pXlun0FO
 TKhPDNkOq5wJoeXkVXfXVZLH11ZZnOFo6AYfYrm+7W+XGAcOjDlIvU+BgK14PFtGMVqi
 +yPOtFTvq6x+VIhE2mdF0Wh2Lvk8o4a+Gto1CS1oaytDXKdLFjjk9LlkicgPghvd+0LH
 aDow==
X-Gm-Message-State: AOAM531XrsFu8qBq7VAF7aUZgHjkQDfFQMQIAGRe+6OoeXRtZVmG0oCm
 XKid6EIFJONOORDxuYWY3PKsUdvnPtEl9v/txL8=
X-Received: by 2002:a4a:8257:: with SMTP id t23mr65770171oog.60.1594513159338; 
 Sat, 11 Jul 2020 17:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200628214230.2592-1-peter.maydell@linaro.org>
 <20200628214230.2592-2-peter.maydell@linaro.org>
In-Reply-To: <20200628214230.2592-2-peter.maydell@linaro.org>
From: Li Qiang <liq3ea@gmail.com>
Date: Sun, 12 Jul 2020 08:18:43 +0800
Message-ID: <CAKXe6SJts9hBWrFCZY8+fa+2iqEoH-5N9rfTeUA8th=sOq46MQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/palm.c: Detabify
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Equ96CeSLBX3

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2020=E5=B9=B46=E6=9C=8829=
=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=885:45=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Remove hard-tabs from palm.c.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/arm/palm.c | 64 +++++++++++++++++++++++++--------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/hw/arm/palm.c b/hw/arm/palm.c
> index 97ca105d297..569836178f6 100644
> --- a/hw/arm/palm.c
> +++ b/hw/arm/palm.c
> @@ -61,21 +61,21 @@ static const MemoryRegionOps static_ops =3D {
>  /* Palm Tunsgten|E support */
>
>  /* Shared GPIOs */
> -#define PALMTE_USBDETECT_GPIO  0
> -#define PALMTE_USB_OR_DC_GPIO  1
> -#define PALMTE_TSC_GPIO                4
> -#define PALMTE_PINTDAV_GPIO    6
> -#define PALMTE_MMC_WP_GPIO     8
> -#define PALMTE_MMC_POWER_GPIO  9
> -#define PALMTE_HDQ_GPIO                11
> -#define PALMTE_HEADPHONES_GPIO 14
> -#define PALMTE_SPEAKER_GPIO    15
> +#define PALMTE_USBDETECT_GPIO   0
> +#define PALMTE_USB_OR_DC_GPIO   1
> +#define PALMTE_TSC_GPIO                 4
> +#define PALMTE_PINTDAV_GPIO     6
> +#define PALMTE_MMC_WP_GPIO      8
> +#define PALMTE_MMC_POWER_GPIO   9
> +#define PALMTE_HDQ_GPIO                 11
> +#define PALMTE_HEADPHONES_GPIO  14
> +#define PALMTE_SPEAKER_GPIO     15
>  /* MPU private GPIOs */
> -#define PALMTE_DC_GPIO         2
> -#define PALMTE_MMC_SWITCH_GPIO 4
> -#define PALMTE_MMC1_GPIO       6
> -#define PALMTE_MMC2_GPIO       7
> -#define PALMTE_MMC3_GPIO       11
> +#define PALMTE_DC_GPIO          2
> +#define PALMTE_MMC_SWITCH_GPIO  4
> +#define PALMTE_MMC1_GPIO        6
> +#define PALMTE_MMC2_GPIO        7
> +#define PALMTE_MMC3_GPIO        11
>
>  static MouseTransformInfo palmte_pointercal =3D {
>      .x =3D 320,
> @@ -100,17 +100,17 @@ static struct {
>      int column;
>  } palmte_keymap[0x80] =3D {
>      [0 ... 0x7f] =3D { -1, -1 },
> -    [0x3b] =3D { 0, 0 }, /* F1   -> Calendar */
> -    [0x3c] =3D { 1, 0 }, /* F2   -> Contacts */
> -    [0x3d] =3D { 2, 0 }, /* F3   -> Tasks List */
> -    [0x3e] =3D { 3, 0 }, /* F4   -> Note Pad */
> -    [0x01] =3D { 4, 0 }, /* Esc  -> Power */
> -    [0x4b] =3D { 0, 1 }, /*         Left */
> -    [0x50] =3D { 1, 1 }, /*         Down */
> -    [0x48] =3D { 2, 1 }, /*         Up */
> -    [0x4d] =3D { 3, 1 }, /*         Right */
> -    [0x4c] =3D { 4, 1 }, /*         Centre */
> -    [0x39] =3D { 4, 1 }, /* Spc  -> Centre */
> +    [0x3b] =3D { 0, 0 },  /* F1   -> Calendar */
> +    [0x3c] =3D { 1, 0 },  /* F2   -> Contacts */
> +    [0x3d] =3D { 2, 0 },  /* F3   -> Tasks List */
> +    [0x3e] =3D { 3, 0 },  /* F4   -> Note Pad */
> +    [0x01] =3D { 4, 0 },  /* Esc  -> Power */
> +    [0x4b] =3D { 0, 1 },  /*         Left */
> +    [0x50] =3D { 1, 1 },  /*         Down */
> +    [0x48] =3D { 2, 1 },  /*         Up */
> +    [0x4d] =3D { 3, 1 },  /*         Right */
> +    [0x4c] =3D { 4, 1 },  /*         Centre */
> +    [0x39] =3D { 4, 1 },  /* Spc  -> Centre */
>  };
>
>  static void palmte_button_event(void *opaque, int keycode)
> @@ -161,13 +161,13 @@ static void palmte_gpio_setup(struct omap_mpu_state=
_s *cpu)
>                              [PALMTE_MMC_SWITCH_GPIO]));
>
>      misc_gpio =3D qemu_allocate_irqs(palmte_onoff_gpios, cpu, 7);
> -    qdev_connect_gpio_out(cpu->gpio, PALMTE_MMC_POWER_GPIO,    misc_gpio=
[0]);
> -    qdev_connect_gpio_out(cpu->gpio, PALMTE_SPEAKER_GPIO,      misc_gpio=
[1]);
> -    qdev_connect_gpio_out(cpu->gpio, 11,                       misc_gpio=
[2]);
> -    qdev_connect_gpio_out(cpu->gpio, 12,                       misc_gpio=
[3]);
> -    qdev_connect_gpio_out(cpu->gpio, 13,                       misc_gpio=
[4]);
> -    omap_mpuio_out_set(cpu->mpuio, 1,                          misc_gpio=
[5]);
> -    omap_mpuio_out_set(cpu->mpuio, 3,                          misc_gpio=
[6]);
> +    qdev_connect_gpio_out(cpu->gpio, PALMTE_MMC_POWER_GPIO,     misc_gpi=
o[0]);
> +    qdev_connect_gpio_out(cpu->gpio, PALMTE_SPEAKER_GPIO,       misc_gpi=
o[1]);
> +    qdev_connect_gpio_out(cpu->gpio, 11,                        misc_gpi=
o[2]);
> +    qdev_connect_gpio_out(cpu->gpio, 12,                        misc_gpi=
o[3]);
> +    qdev_connect_gpio_out(cpu->gpio, 13,                        misc_gpi=
o[4]);
> +    omap_mpuio_out_set(cpu->mpuio, 1,                           misc_gpi=
o[5]);
> +    omap_mpuio_out_set(cpu->mpuio, 3,                           misc_gpi=
o[6]);
>
>      /* Reset some inputs to initial state.  */
>      qemu_irq_lower(qdev_get_gpio_in(cpu->gpio, PALMTE_USBDETECT_GPIO));
> --
> 2.20.1
>
>
