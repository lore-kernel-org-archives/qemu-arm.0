Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B94CD8CA8
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 10:57:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXzZD-0001ay-EI; Fri, 12 Jun 2026 06:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wXzZB-0001aN-Qo
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 06:56:49 -0400
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wXzZ8-00065T-RA
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 06:56:49 -0400
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-30759632453so1793210eec.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 03:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781261805; cv=none;
 d=google.com; s=arc-20240605;
 b=DglmqmbhLi9UdUiHjaTvSADT7JjQrVA0+T6IN9Jls4GOKQHmwcxFhFNwvFtdd+KRHD
 stsVd+JEDl9CbVjtRTMCrLCJ12QLNFZ8P30QW3w8F6PUlMjGqLwqXhO1cfxFIVQXoNs3
 B6Q5cnY0n3FCmlYRXj2MU3SUdeSdYdeu0USQXjdKXUmXiHh+jdgw9H/a/5nnU5UbcDOS
 KxENqhuG7B96vh5IT3u9nArIVm3JhBR5XPZbGlr0cgcd4quFBeoSCe3NZ7/OnDohBKk/
 KYTIZirjZKQgWiNhjM2QNuwm4khaVkgZLxlz3F7IrRLMvuH+YrfDs2lmIl/6aruITo5C
 ATFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nYYpCvm2SZmMpv6tV3ILno5Ow5s3NTn/DerpNOVdXmo=;
 fh=t4kSLwFVQ+RUcEAUGkHTPXd6+V8eKBtynxydYAI4h3Y=;
 b=FvYORwEG1BRNT4/GdqigjGrE8RgohP5DdbWn4CoZutf/JMDht0gn+iyXW3xxsgK2eG
 HZS7Onv17uFsTOV+g5e/udrY1P02O8DiwU1ptHSjkm0kwMJrxzqShpamyGfY8oeBu8DE
 0ZErZi4bz/vSBa6zz72wWBx4+/6CskmI4y33RZnrQXTrRyn8r1qJq+2xjeDeJn2a2jD1
 QhDZoJDu/O6g6Ro4KtZWGOvhRK3rpByc6fx2jowRlaFL8sV73eQLO9TGsWi+VMc9IxmK
 mrO5vuce4fzZlQjo0Cj/ept2I+pjyvf92uFN9ZoJiusTeok1j/AbY9B4D9ZE3GMek7HA
 YoAg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1781261805; x=1781866605; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYYpCvm2SZmMpv6tV3ILno5Ow5s3NTn/DerpNOVdXmo=;
 b=DrOTerSKT7xn5jp77GrtVx13h9Pix6BHiE+JWNDesapY3NhKpB1rEU1duwXgpV1xJs
 DC0Wy/3O5ZI77WzeMOcAWCiK/rDKFOelW2LS8iggMTIlJC+O+0JdL70kb37KOvopouTt
 P6RDsEue16eeWEK9SFvV/JElw9/JgnB6a/paibUHk8e1mdKojqYcTGd9I0ItVDECfLCl
 sRBaF4Fr4b6px8KobTM3/pVgPj+5UL+IvP+XG+9Dw1bGdkXWa8SVbMQpxPSr7yyQ+H4s
 0SmIwcik2kdj6ERVlrsDxAAYUUO/0etEPWxMZbQcOmFesMEiCJgua/ZCDkvoavKOvGHi
 HS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781261805; x=1781866605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nYYpCvm2SZmMpv6tV3ILno5Ow5s3NTn/DerpNOVdXmo=;
 b=jdfAC2jI2qIVfFYqi4Wby34E+eFvHB+QAI9KLG+QrfGdu7apsv8y7HKWlymBZgxRpF
 39P645sUthwykR3HiGTgxgrEkr/1PsV8qFG5pZ8oZmUK7XSeU67NUdHAiBycpGmSd5fj
 9OeZIAmmD16N7LNudsil4/IMDNbhq+m2anR7qexMFb2b5bDnynYogHb1N6VUb7cRYu14
 1D4r6rHeSEpdHt+PBFwgQ3NaC+5qbeUqeqfeMTDumsGI4gtVLaW+L5Pf0wh5AzYWEmb6
 Y4C0+foi60zbGxiPOvhnGR0Jy8tw7p/G2SVPZEAOWltc2wL3D6jfjnYlaVNyGpSioRYj
 uk4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9dh42mx/nALXCOff6dC+DY0GrAdQjT6auIEVmGJ7MbzRcyFfneqjwJ5ZMDscjMGlabkXciFyUvMA==@nongnu.org
X-Gm-Message-State: AOJu0YwnYBKToHSZJgHoqJ6BD0GEh9Lhl5MeaZg0qTiuniSvbk5cctLe
 XBW0gqDt6b/1LaBbQBCFgQO6rvVdmM7nE3KJ9OXmnDMkAH+ufqNS1IXADD8AGageub2h+1S24jH
 yi6IoZ2FsMAhVPu37BDNjxKCss1vqo6o=
X-Gm-Gg: Acq92OGsnUGVuy36LC8QLfNubva4VSeqDl/8jxTmQDinh7JuYaT3+P18gnW4EIrJOG/
 lm0EEBK0uBVF0Dr4tZqG4bQPZzRKLfKFKieaxCNdw3+dtZkt37bOH1lpFXpk1IX4kYdTJ59uv+T
 EvW6ocEjAac5CdV0lVFPpjTMKkGveKvuKmbgURgaXuasiRMQSFfp6DQh+GEfuipML7U3KBcHqBe
 wDH2MOBznB8WmpxwTg5NDveP8QBCF7xv8zif3XousD1MTgKIRkEEz/VFJW/vGu8ApzY81rTe4hq
 Z7GbAxm3Ywv0ikSqzOir5iWQSIzwnY1oBJlGRD0=
X-Received: by 2002:a05:7300:6da8:b0:2dd:6937:79d1 with SMTP id
 5a478bee46e88-3081ffba7e9mr1545747eec.15.1781261804971; Fri, 12 Jun 2026
 03:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
 <20260610-ui-input-v2-4-f68452dd6a22@redhat.com>
In-Reply-To: <20260610-ui-input-v2-4-f68452dd6a22@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 12 Jun 2026 14:56:32 +0400
X-Gm-Features: AVVi8CerR3BtCOIEAB087ohne4DH40vYf9KgCByeNXYWKBlDq9MgojrXBnKR5v4
Message-ID: <CAJ+F1CLQbTf8tnJ5eJe2r3K7r0x1ZKatjopr0KYaU-RmdBqw-Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] hw/usb/dev-wacom: convert to modern
 QemuInputHandler API
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org, 
 Thomas Huth <th.huth+qemu@posteo.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi

On Wed, Jun 10, 2026 at 2:58=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Replace the legacy QEMUPutMouseEvent callbacks with a proper
> QemuInputHandler registration. The device now receives typed
> input events (BTN/ABS/REL) directly.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

One of the 2 patches missing ack/review in this series,

thanks


> ---
>  hw/usb/dev-wacom.c | 155 ++++++++++++++++++++++++++++++++---------------=
------
>  1 file changed, 94 insertions(+), 61 deletions(-)
>
> diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> index 14d07e81281..c69e247f7b7 100644
> --- a/hw/usb/dev-wacom.c
> +++ b/hw/usb/dev-wacom.c
> @@ -42,10 +42,10 @@
>  struct USBWacomState {
>      USBDevice dev;
>      USBEndpoint *intr;
> -    QEMUPutMouseEntry *eh_entry;
> -    int dx, dy, dz, buttons_state;
> -    int x, y;
> -    int mouse_grabbed;
> +    QemuInputHandlerState *hs;
> +    int axis[INPUT_AXIS__MAX];
> +    int dz;
> +    bool btns[INPUT_BUTTON__MAX];
>      enum {
>          WACOM_MODE_HID =3D 1,
>          WACOM_MODE_WACOM =3D 2,
> @@ -188,29 +188,37 @@ static const USBDesc desc_wacom =3D {
>      .str  =3D desc_strings,
>  };
>
> -static void usb_mouse_event(void *opaque,
> -                            int dx1, int dy1, int dz1, int buttons_state=
)
> +static void usb_wacom_input_event(DeviceState *dev, QemuConsole *src,
> +                                  QemuInputEvent *evt)
>  {
> -    USBWacomState *s =3D opaque;
> +    USBWacomState *s =3D USB_WACOM(dev);
>
> -    s->dx +=3D dx1;
> -    s->dy +=3D dy1;
> -    s->dz +=3D dz1;
> -    s->buttons_state =3D buttons_state;
> -    s->changed =3D 1;
> -    usb_wakeup(s->intr, 0);
> +    switch (evt->type) {
> +    case INPUT_EVENT_KIND_BTN:
> +        if (evt->btn.down) {
> +            if (evt->btn.button =3D=3D INPUT_BUTTON_WHEEL_UP) {
> +                s->dz--;
> +            } else if (evt->btn.button =3D=3D INPUT_BUTTON_WHEEL_DOWN) {
> +                s->dz++;
> +            }
> +        }
> +        s->btns[evt->btn.button] =3D evt->btn.down;
> +        break;
> +    case INPUT_EVENT_KIND_ABS:
> +        s->axis[evt->abs.axis] =3D evt->abs.value;
> +        break;
> +    case INPUT_EVENT_KIND_REL:
> +        s->axis[evt->rel.axis] +=3D evt->rel.value;
> +        break;
> +    default:
> +        break;
> +    }
>  }
>
> -static void usb_wacom_event(void *opaque,
> -                            int x, int y, int dz, int buttons_state)
> +static void usb_wacom_input_sync(DeviceState *dev)
>  {
> -    USBWacomState *s =3D opaque;
> +    USBWacomState *s =3D USB_WACOM(dev);
>
> -    /* scale to Penpartner resolution */
> -    s->x =3D (x * 5040 / 0x7FFF);
> -    s->y =3D (y * 3780 / 0x7FFF);
> -    s->dz +=3D dz;
> -    s->buttons_state =3D buttons_state;
>      s->changed =3D 1;
>      usb_wakeup(s->intr, 0);
>  }
> @@ -225,32 +233,57 @@ static inline int int_clamp(int val, int vmin, int =
vmax)
>          return val;
>  }
>
> +static void usb_wacom_register_input_handler(USBWacomState *s, bool abso=
lute)
> +{
> +    static const QemuInputHandler usb_wacom_abs_handler =3D {
> +        .name  =3D "QEMU PenPartner tablet",
> +        .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
> +        .event =3D usb_wacom_input_event,
> +        .sync  =3D usb_wacom_input_sync,
> +    };
> +
> +    static const QemuInputHandler usb_wacom_rel_handler =3D {
> +        .name  =3D "QEMU PenPartner tablet",
> +        .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
> +        .event =3D usb_wacom_input_event,
> +        .sync  =3D usb_wacom_input_sync,
> +    };
> +
> +    const QemuInputHandler *h =3D absolute ?
> +        &usb_wacom_abs_handler : &usb_wacom_rel_handler;
> +
> +    g_clear_pointer(&s->hs, qemu_input_handler_unregister);
> +
> +    s->hs =3D qemu_input_handler_register(DEVICE(s), h);
> +    qemu_input_handler_activate(s->hs);
> +}
> +
>  static int usb_mouse_poll(USBWacomState *s, uint8_t *buf, int len)
>  {
>      int dx, dy, dz, b, l;
>
> -    if (!s->mouse_grabbed) {
> -        s->eh_entry =3D qemu_add_mouse_event_handler(usb_mouse_event, s,=
 0,
> -                        "QEMU PenPartner tablet");
> -        qemu_activate_mouse_event_handler(s->eh_entry);
> -        s->mouse_grabbed =3D 1;
> +    if (!s->hs) {
> +        usb_wacom_register_input_handler(s, false);
>      }
>
> -    dx =3D int_clamp(s->dx, -128, 127);
> -    dy =3D int_clamp(s->dy, -128, 127);
> +    dx =3D int_clamp(s->axis[INPUT_AXIS_X], -128, 127);
> +    dy =3D int_clamp(s->axis[INPUT_AXIS_Y], -128, 127);
>      dz =3D int_clamp(s->dz, -128, 127);
>
> -    s->dx -=3D dx;
> -    s->dy -=3D dy;
> +    s->axis[INPUT_AXIS_X] -=3D dx;
> +    s->axis[INPUT_AXIS_Y] -=3D dy;
>      s->dz -=3D dz;
>
>      b =3D 0;
> -    if (s->buttons_state & MOUSE_EVENT_LBUTTON)
> +    if (s->btns[INPUT_BUTTON_LEFT]) {
>          b |=3D 0x01;
> -    if (s->buttons_state & MOUSE_EVENT_RBUTTON)
> +    }
> +    if (s->btns[INPUT_BUTTON_RIGHT]) {
>          b |=3D 0x02;
> -    if (s->buttons_state & MOUSE_EVENT_MBUTTON)
> +    }
> +    if (s->btns[INPUT_BUTTON_MIDDLE]) {
>          b |=3D 0x04;
> +    }
>
>      buf[0] =3D b;
>      buf[1] =3D dx;
> @@ -265,32 +298,40 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t=
 *buf, int len)
>
>  static int usb_wacom_poll(USBWacomState *s, uint8_t *buf, int len)
>  {
> -    int b;
> +    int b, x, y;
>
> -    if (!s->mouse_grabbed) {
> -        s->eh_entry =3D qemu_add_mouse_event_handler(usb_wacom_event, s,=
 1,
> -                        "QEMU PenPartner tablet");
> -        qemu_activate_mouse_event_handler(s->eh_entry);
> -        s->mouse_grabbed =3D 1;
> +    if (!s->hs) {
> +        usb_wacom_register_input_handler(s, true);
>      }
>
>      b =3D 0;
> -    if (s->buttons_state & MOUSE_EVENT_LBUTTON)
> +    if (s->btns[INPUT_BUTTON_LEFT]) {
>          b |=3D 0x01;
> -    if (s->buttons_state & MOUSE_EVENT_RBUTTON)
> +    }
> +    if (s->btns[INPUT_BUTTON_RIGHT]) {
>          b |=3D 0x40;
> -    if (s->buttons_state & MOUSE_EVENT_MBUTTON)
> +    }
> +    if (s->btns[INPUT_BUTTON_MIDDLE]) {
>          b |=3D 0x20; /* eraser */
> +    }
>
> -    if (len < 7)
> +    if (len < 7) {
>          return 0;
> +    }
> +
> +    x =3D qemu_input_scale_axis(s->axis[INPUT_AXIS_X],
> +                              INPUT_EVENT_ABS_MIN, INPUT_EVENT_ABS_MAX,
> +                              0, 5040);
> +    y =3D qemu_input_scale_axis(s->axis[INPUT_AXIS_Y],
> +                              INPUT_EVENT_ABS_MIN, INPUT_EVENT_ABS_MAX,
> +                              0, 3780);
>
>      buf[0] =3D s->mode;
>      buf[5] =3D 0x00 | (b & 0xf0);
> -    buf[1] =3D s->x & 0xff;
> -    buf[2] =3D s->x >> 8;
> -    buf[3] =3D s->y & 0xff;
> -    buf[4] =3D s->y >> 8;
> +    buf[1] =3D x & 0xff;
> +    buf[2] =3D x >> 8;
> +    buf[3] =3D y & 0xff;
> +    buf[4] =3D y >> 8;
>      if (b & 0x3f) {
>          buf[6] =3D 0;
>      } else {
> @@ -302,15 +343,13 @@ static int usb_wacom_poll(USBWacomState *s, uint8_t=
 *buf, int len)
>
>  static void usb_wacom_handle_reset(USBDevice *dev)
>  {
> -    USBWacomState *s =3D (USBWacomState *) dev;
> +    USBWacomState *s =3D USB_WACOM(dev);
>
> -    s->dx =3D 0;
> -    s->dy =3D 0;
> +    memset(s->axis, 0, sizeof(s->axis));
> +    memset(s->btns, 0, sizeof(s->btns));
>      s->dz =3D 0;
> -    s->x =3D 0;
> -    s->y =3D 0;
> -    s->buttons_state =3D 0;
>      s->mode =3D WACOM_MODE_HID;
> +    g_clear_pointer(&s->hs, qemu_input_handler_unregister);
>  }
>
>  static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
> @@ -337,10 +376,7 @@ static void usb_wacom_handle_control(USBDevice *dev,=
 USBPacket *p,
>          }
>          break;
>      case WACOM_SET_REPORT:
> -        if (s->mouse_grabbed) {
> -            qemu_remove_mouse_event_handler(s->eh_entry);
> -            s->mouse_grabbed =3D 0;
> -        }
> +        g_clear_pointer(&s->hs, qemu_input_handler_unregister);
>          s->mode =3D data[0];
>          break;
>      case WACOM_GET_REPORT:
> @@ -400,10 +436,7 @@ static void usb_wacom_unrealize(USBDevice *dev)
>  {
>      USBWacomState *s =3D (USBWacomState *) dev;
>
> -    if (s->mouse_grabbed) {
> -        qemu_remove_mouse_event_handler(s->eh_entry);
> -        s->mouse_grabbed =3D 0;
> -    }
> +    g_clear_pointer(&s->hs, qemu_input_handler_unregister);
>  }
>
>  static void usb_wacom_realize(USBDevice *dev, Error **errp)
>
> --
> 2.54.0
>
>

