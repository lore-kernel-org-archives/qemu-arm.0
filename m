Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp3059251ejo;
        Fri, 15 Dec 2023 06:08:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnGKNF2FVP+x42Gf5MawOTYraw49jRMl/Cb3MSYh4gwR9P6DrISzOPAIhAxcsCXDAtKMfn
X-Received: by 2002:a9d:6751:0:b0:6d9:f6c3:9504 with SMTP id w17-20020a9d6751000000b006d9f6c39504mr11763856otm.64.1702649297996;
        Fri, 15 Dec 2023 06:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702649297; cv=none;
        d=google.com; s=arc-20160816;
        b=AJNaY+uizSUyYRHWyFOYWZdpHqTCgB1CBqeDcCy7dkPH8QBsaLKO9XKImOfQmEn/8S
         n+JoK+h4v5iABAstBjcnSQe5at89AEey6wGyzntLpKDlurz2wXnGD0l6EAUdNcP4YScC
         IjWC88yGuBgmZxNjHKGPlWMwaXZ0K7VQovJ1uEfQstnR8OcuCRdkiOMzoN242RkGicR8
         XhcYewTfJESrBUSAsetWOrr1QkKQgmhHaqEcZqRQGg7UFjEExvBemMBRDcuiIBcPzC9M
         5e5dYlom4h160FJ/VBbNrwDsrebqjdd1wRf2OR4dZU+G7+tYkUUWm4vf9cVZauYtZPhZ
         irEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c4HT5F+UK7/71bqtR8jPcbK9fR7Z9VZ3+y4MRuMODng=;
        fh=v045sp/n/mLZv49zCKO2LE5RLzVm9wU5iQpoO1Uergo=;
        b=eP/6QJ/GvntIORCSBHYOlmdq3kO3s8YAF0K8z6P79hfL43anlddNum6ur9Rht4oYSA
         9suJoLLzQRlTeS/ZBBZBod7RAA3ZaHFDQSuayr3DNsGJddnbm+Rlgycqvh+XUMqmlXUz
         JJnikrP9eqjfAolQW0zUPGrxQooXcx4TC/bBxpIS0Dmd4fja51yZH5ltqD6PgiN3/6cB
         rzIqcjCfdW7KorL34PrXirq4mC2G0XU1cJMesDpsreGMJemPv+nvKq2W5xo+K8Lb1y2a
         FHEuuD6nbdY0dnwiSiVlHQR2ji9/5taZgtZbQ/Y2oMrK5CX4NvfL2xkwO6qJAzaLaV6i
         0Xyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBwwgtw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23-20020ab07617000000b007cb76480ce5si611456uap.43.2023.12.15.06.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Dec 2023 06:08:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBwwgtw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rE8qd-000216-Af; Fri, 15 Dec 2023 09:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rE8qX-0001vN-Lz
 for qemu-arm@nongnu.org; Fri, 15 Dec 2023 09:07:23 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rE8qV-00082d-EO
 for qemu-arm@nongnu.org; Fri, 15 Dec 2023 09:07:21 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-551e6b99490so761253a12.0
 for <qemu-arm@nongnu.org>; Fri, 15 Dec 2023 06:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702649238; x=1703254038; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c4HT5F+UK7/71bqtR8jPcbK9fR7Z9VZ3+y4MRuMODng=;
 b=ZBwwgtw5ILQkjAk07Mg39rtdFqqm9nx8jw5SjdqO/FuvvWiRe2ZdUJt5AnO7DvV2q5
 SL+noiIhwGCxhjdNIjcZyK/N67xDZfn6a1xg8h9GypKRgj9ni1tef/CyfohEKjqL2sHa
 okxeuCEhAfD2QwoCYE16CeWYl+y+OkyPxcRzX3gl7sbeprPDjTbGt8G/i8OXN8B/0AJx
 8Zmx9h/2K1JkSuACgNc2d8/LWOWFp39DkwYR5+Bkplb4JqxzfnqUNcniM6iFKSQKogGe
 mdqGHKn5pDkTyzkMIVKjVi7gax/Advv01E6RyOadY+TwLkq+RSrWovtrzfz0J7q1LSeD
 zzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702649238; x=1703254038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c4HT5F+UK7/71bqtR8jPcbK9fR7Z9VZ3+y4MRuMODng=;
 b=lH9EzpiWV8/FQMtvvN4SCDN/EVQ4V8nP1GbynY9YD4MxGg8zgX5QI8UI4c2R2lhQzj
 VCqIlf5GbaSXd05WaeLJceXh07yZtr9YPZPJ0qop/vEbmGU+SKVWYQHG/Wyz8cqwhV4t
 o5a+6T3gVxj+53e4qMtyhWn6m1g5R6O/vOIo15fkquLElJ07qUlxEjfxyWuc/epD9qkL
 uPEpbAYISwbgC05wyw7IsTrM7hDmfqjKlIRwaR64YHqHlJ6Kh759d+cgCbJsgszrQ0L6
 DMtndYm6IdH4Twnmgz3zdPKOdoCQbK3qWfGLcLvX4agy/uNANEkC/gfsw7Aa12CsuAbw
 V5WQ==
X-Gm-Message-State: AOJu0Yx9PmMP5PYLhTeeuqeQ06pqseg6niziHDPBmr/seZ23BFz0hJpA
 P7PtliXFbr7fLKBbV4omHG+Vs0tRB3/QX4H5bWt8y/9hcFlcQCJ8
X-Received: by 2002:a50:9b5c:0:b0:551:8766:7296 with SMTP id
 a28-20020a509b5c000000b0055187667296mr2014998edj.105.1702649237658; Fri, 15
 Dec 2023 06:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20231103182750.855577-1-peter.maydell@linaro.org>
In-Reply-To: <20231103182750.855577-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Dec 2023 14:07:06 +0000
Message-ID: <CAFEAcA-QXorAggMFLEknvkrrBtCZSEWpcW_Fx_GTrxD0RfqUFg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/musicpal: Convert to qemu_add_kbd_event_handler()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iWVuX0qI/9LA

Ping for code review, since we're approaching the end of the
8.2 freeze ?

thanks
-- PMM

On Fri, 3 Nov 2023 at 18:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Convert the musicpal key input device to use
> qemu_add_kbd_event_handler().  This lets us simplify it because we no
> longer need to track whether we're in the middle of a PS/2 multibyte
> key sequence.
>
> In the conversion we move the keyboard handler registration from init
> to realize, because devices shouldn't disturb the state of the
> simulation by doing things like registering input handlers until
> they're realized, so that device objects can be introspected
> safely.
>
> The behaviour where key-repeat is permitted for the arrow-keys only
> is intentional (added in commit 7c6ce4baedfcd0c), so we retain it,
> and add a comment to that effect.
>
> This is a migration compatibility break for musicpal.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/musicpal.c | 131 +++++++++++++++++++++-------------------------
>  1 file changed, 61 insertions(+), 70 deletions(-)
>
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 9703bfb97fb..e8c1250ab04 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1043,20 +1043,6 @@ static const TypeInfo musicpal_gpio_info = {
>  };
>
>  /* Keyboard codes & masks */
> -#define KEY_RELEASED            0x80
> -#define KEY_CODE                0x7f
> -
> -#define KEYCODE_TAB             0x0f
> -#define KEYCODE_ENTER           0x1c
> -#define KEYCODE_F               0x21
> -#define KEYCODE_M               0x32
> -
> -#define KEYCODE_EXTENDED        0xe0
> -#define KEYCODE_UP              0x48
> -#define KEYCODE_DOWN            0x50
> -#define KEYCODE_LEFT            0x4b
> -#define KEYCODE_RIGHT           0x4d
> -
>  #define MP_KEY_WHEEL_VOL       (1 << 0)
>  #define MP_KEY_WHEEL_VOL_INV   (1 << 1)
>  #define MP_KEY_WHEEL_NAV       (1 << 2)
> @@ -1074,67 +1060,66 @@ struct musicpal_key_state {
>      SysBusDevice parent_obj;
>      /*< public >*/
>
> -    uint32_t kbd_extended;
>      uint32_t pressed_keys;
>      qemu_irq out[8];
>  };
>
> -static void musicpal_key_event(void *opaque, int keycode)
> +static void musicpal_key_event(DeviceState *dev, QemuConsole *src,
> +                               InputEvent *evt)
>  {
> -    musicpal_key_state *s = opaque;
> +    musicpal_key_state *s = MUSICPAL_KEY(dev);
> +    InputKeyEvent *key = evt->u.key.data;
> +    int qcode = qemu_input_key_value_to_qcode(key->key);
>      uint32_t event = 0;
>      int i;
>
> -    if (keycode == KEYCODE_EXTENDED) {
> -        s->kbd_extended = 1;
> -        return;
> +    switch (qcode) {
> +    case Q_KEY_CODE_UP:
> +        event = MP_KEY_WHEEL_NAV | MP_KEY_WHEEL_NAV_INV;
> +        break;
> +
> +    case Q_KEY_CODE_DOWN:
> +        event = MP_KEY_WHEEL_NAV;
> +        break;
> +
> +    case Q_KEY_CODE_LEFT:
> +        event = MP_KEY_WHEEL_VOL | MP_KEY_WHEEL_VOL_INV;
> +        break;
> +
> +    case Q_KEY_CODE_RIGHT:
> +        event = MP_KEY_WHEEL_VOL;
> +        break;
> +
> +    case Q_KEY_CODE_F:
> +        event = MP_KEY_BTN_FAVORITS;
> +        break;
> +
> +    case Q_KEY_CODE_TAB:
> +        event = MP_KEY_BTN_VOLUME;
> +        break;
> +
> +    case Q_KEY_CODE_RET:
> +        event = MP_KEY_BTN_NAVIGATION;
> +        break;
> +
> +    case Q_KEY_CODE_M:
> +        event = MP_KEY_BTN_MENU;
> +        break;
>      }
>
> -    if (s->kbd_extended) {
> -        switch (keycode & KEY_CODE) {
> -        case KEYCODE_UP:
> -            event = MP_KEY_WHEEL_NAV | MP_KEY_WHEEL_NAV_INV;
> -            break;
> -
> -        case KEYCODE_DOWN:
> -            event = MP_KEY_WHEEL_NAV;
> -            break;
> -
> -        case KEYCODE_LEFT:
> -            event = MP_KEY_WHEEL_VOL | MP_KEY_WHEEL_VOL_INV;
> -            break;
> -
> -        case KEYCODE_RIGHT:
> -            event = MP_KEY_WHEEL_VOL;
> -            break;
> -        }
> -    } else {
> -        switch (keycode & KEY_CODE) {
> -        case KEYCODE_F:
> -            event = MP_KEY_BTN_FAVORITS;
> -            break;
> -
> -        case KEYCODE_TAB:
> -            event = MP_KEY_BTN_VOLUME;
> -            break;
> -
> -        case KEYCODE_ENTER:
> -            event = MP_KEY_BTN_NAVIGATION;
> -            break;
> -
> -        case KEYCODE_M:
> -            event = MP_KEY_BTN_MENU;
> -            break;
> -        }
> -        /* Do not repeat already pressed buttons */
> -        if (!(keycode & KEY_RELEASED) && (s->pressed_keys & event)) {
> +    /*
> +     * We allow repeated wheel-events when the arrow keys are held down,
> +     * but do not repeat already-pressed buttons for the other key inputs.
> +     */
> +    if (!(event & (MP_KEY_WHEEL_NAV | MP_KEY_WHEEL_VOL))) {
> +        if (key->down && (s->pressed_keys & event)) {
>              event = 0;
>          }
>      }
>
>      if (event) {
>          /* Raise GPIO pin first if repeating a key */
> -        if (!(keycode & KEY_RELEASED) && (s->pressed_keys & event)) {
> +        if (key->down && (s->pressed_keys & event)) {
>              for (i = 0; i <= 7; i++) {
>                  if (event & (1 << i)) {
>                      qemu_set_irq(s->out[i], 1);
> @@ -1143,17 +1128,15 @@ static void musicpal_key_event(void *opaque, int keycode)
>          }
>          for (i = 0; i <= 7; i++) {
>              if (event & (1 << i)) {
> -                qemu_set_irq(s->out[i], !!(keycode & KEY_RELEASED));
> +                qemu_set_irq(s->out[i], !key->down);
>              }
>          }
> -        if (keycode & KEY_RELEASED) {
> -            s->pressed_keys &= ~event;
> -        } else {
> +        if (key->down) {
>              s->pressed_keys |= event;
> +        } else {
> +            s->pressed_keys &= ~event;
>          }
>      }
> -
> -    s->kbd_extended = 0;
>  }
>
>  static void musicpal_key_init(Object *obj)
> @@ -1162,20 +1145,27 @@ static void musicpal_key_init(Object *obj)
>      DeviceState *dev = DEVICE(sbd);
>      musicpal_key_state *s = MUSICPAL_KEY(dev);
>
> -    s->kbd_extended = 0;
>      s->pressed_keys = 0;
>
>      qdev_init_gpio_out(dev, s->out, ARRAY_SIZE(s->out));
> +}
>
> -    qemu_add_kbd_event_handler(musicpal_key_event, s);
> +static const QemuInputHandler musicpal_key_handler = {
> +    .name = "musicpal_key",
> +    .mask = INPUT_EVENT_MASK_KEY,
> +    .event = musicpal_key_event,
> +};
> +
> +static void musicpal_key_realize(DeviceState *dev, Error **errp)
> +{
> +    qemu_input_handler_register(dev, &musicpal_key_handler);
>  }
>
>  static const VMStateDescription musicpal_key_vmsd = {
>      .name = "musicpal_key",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT32(kbd_extended, musicpal_key_state),
>          VMSTATE_UINT32(pressed_keys, musicpal_key_state),
>          VMSTATE_END_OF_LIST()
>      }
> @@ -1186,6 +1176,7 @@ static void musicpal_key_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
>      dc->vmsd = &musicpal_key_vmsd;
> +    dc->realize = musicpal_key_realize;
>  }
>
>  static const TypeInfo musicpal_key_info = {
> --
> 2.34.1
>
