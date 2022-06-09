Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp438909lfb;
        Thu, 9 Jun 2022 06:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8JSE9sNgANveMYdD/ZsqqMhGQUmqr5UB++728Q9UPb9c8Bp86tShYltGuzcdCKWesfr4P
X-Received: by 2002:a05:620a:4310:b0:67b:3fc1:86eb with SMTP id u16-20020a05620a431000b0067b3fc186ebmr26527609qko.495.1654781356701;
        Thu, 09 Jun 2022 06:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781356; cv=none;
        d=google.com; s=arc-20160816;
        b=RmsYv0ic4uOpdVZWd4y52+iXgWPi7e5msqUXDHzQkBMTp68qf7hK2xK5IUtB1+Kmn0
         Kzs8umPwNAPWVBsmNCpPRXlSrmYPsWU3m5zQwQD9anZYpWSdWBbWKRQVg7khv8XLFOky
         ydTaylCRt5elYcYTU27eP8RhnbP/soEtDpD833xcJBydC1dNBR2BxQlobbdgpo4VZ97I
         gaE4fA+Bib3ZlCe67ZGvduuBcuNG/gx8zQWEIFYo9NSKet6kXICiKcFd2R8vNzJnK9Ok
         /xQfRQ7MBm+l4hcJYWVtLxtUTgXPzZkup9ww/2oCuS1hSk3UYncbtJ4MuW6OsSab1EGo
         jE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CGIib3qTHZCuc50MfO31ZS2l4HpnSKXdLfuKVMP4604=;
        b=GMuqQtxvFIYB5esjs2femUqdnteMrwfP+kNWxJzFVEfhbLul0grVFMk0mJma2F2Q7Q
         rTcNN7CQFZU0d2idsEywulc+XNfX8684kBvhDo3nw8v7RloYqESQDz69Tt5qaMe39VRa
         GS8YxfPcNLeOkuVPpHXoHlziFHia1u7cOiDIh2IftKnYGB4amfcK4Ob/1TilxyE3B0Z9
         hfaPEpzZpvYbWyI3iy+BcpVMWJ063mw5uUeMDglibTePYsMXd6lY0SqlAtfHIa/AmJs9
         TICltmtavxlAzT/L8VaymwCtrQgDTs7CQe7mBW8HXZujx3lFWRUxoQ9ow5idz3+UteNq
         k4mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yjzdD1sp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a056214202800b004562dfa4544si1310313qvf.152.2022.06.09.06.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yjzdD1sp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIDs-00040m-0i
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG20-0001xO-43
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:08:52 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:44292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG1y-00013s-Je
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:08:51 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso236787467b3.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGIib3qTHZCuc50MfO31ZS2l4HpnSKXdLfuKVMP4604=;
 b=yjzdD1sp7YFzYLthUryG7w0VwwNVxLuwR29g1/X3sWRL6yBX3Vxh18zurjAjSvpM7j
 jKwBfvL6LJj9QzP5XV1R59odUZKMnkJjTgDBMJBvHSubWCSm8WiK0p1fHVQMfrsINb7g
 gnybt0d9Q81IJr5zXZF4z/6DLTqco9aQ+Fs2F2xpo6umkFIBvdQVEZ7wdQHJ7oFafhIN
 PHXZSXGSvw9XVMtVqsNvh8L9bwVknr+Ksj8iHluzuDl5qlF9WL5AGENv/EVkZOmQj6oc
 XWA1H3gNCIzMaxkV/THjQCGGwx2PPbkWpDjK7YhaOzRRk6WFHR0uDlNh91iYJoO4Z+L3
 dxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGIib3qTHZCuc50MfO31ZS2l4HpnSKXdLfuKVMP4604=;
 b=1uroGYRDXxK+Za3NY7Yk5DTIoCi6axdB2m0JfVwUNHK1nr+cYfWMco8Oy7XYHUQWVa
 45bqO05eFxDJbmsFpjtEZVrEUuVqcdmyKwBYpdai8wMhGW8rJrV0n1Fu0J9uG5tANDCN
 NSAIPJXi1U4slOFz0uZFi5cU4NFo/GjAe3Vu1xKSCyiXJCCo5l89Ant3hLGoUNSL6f1F
 AKnH4S0+a4f/pOMc3h87pvZXlKEHAF92gfVKiWfzlPucBPEC7Za6L+hDRrs1s380o7wH
 IuqV/i/EKwtQqdzKYiNAUlkpGj2I//puMFKKTg6Fyz9r/ixS67k+QFkCwZ94UX0nAcYK
 D1WQ==
X-Gm-Message-State: AOAM533aLDzuZPdvqJZb6rI5rppnBkLlHkJU0Gv5g6PZN6XOBUVZFcOE
 ugSuCYo63+RanW472RICGKXFD6amAXdKpZz+JnG4RQ==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr41123543ywc.329.1654772928975; Thu, 09
 Jun 2022 04:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-37-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-37-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:08:38 +0100
Message-ID: <CAFEAcA94H+X34LD8+gm+i4uxNgLvazADbd2Dwym6phsR8ERVXA@mail.gmail.com>
Subject: Re: [PATCH 36/50] pl050: switch over from update_irq() function to
 PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4lwURAIeEzHL

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Add a new pl050_init() function which initialises a qdev input gpio for handling
> incoming PS2 IRQs, and then wire up the PS2 device to use it. At the same time
> set update_irq() and update_arg to NULL in ps2_kbd_init() and ps2_mouse_init()
> to ensure that any accidental attempt to use the legacy update_irq() function will
> cause a NULL pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pl050.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index 66f8c20d9f..fe6a281307 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -32,6 +32,8 @@ struct PL050State {
>      bool is_mouse;
>  };
>
> +#define PL050_INPUT_IRQ

> +
>  static const VMStateDescription vmstate_pl050 = {
>      .name = "pl050",
>      .version_id = 2,
> @@ -65,7 +67,7 @@ static void pl050_update_irq(PL050State *s)
>      qemu_set_irq(s->irq, level);
>  }
>
> -static void pl050_set_irq(void *opaque, int level)
> +static void pl050_set_irq(void *opaque, int n, int level)
>  {
>      PL050State *s = (PL050State *)opaque;
>
> @@ -164,10 +166,12 @@ static void pl050_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
>      if (s->is_mouse) {
> -        s->dev = ps2_mouse_init(pl050_set_irq, s);
> +        s->dev = ps2_mouse_init(NULL, NULL);
>      } else {
> -        s->dev = ps2_kbd_init(pl050_set_irq, s);
> +        s->dev = ps2_kbd_init(NULL, NULL);
>      }
> +    qdev_connect_gpio_out(DEVICE(s->dev), PS2_DEVICE_IRQ,
> +                          qdev_get_gpio_in(dev, PL050_INPUT_IRQ));
>  }
>
>  static void pl050_keyboard_init(Object *obj)
> @@ -196,6 +200,11 @@ static const TypeInfo pl050_mouse_info = {
>      .instance_init = pl050_mouse_init,
>  };
>
> +static void pl050_init(Object *obj)
> +{
> +    qdev_init_gpio_in(DEVICE(obj), pl050_set_irq, 1);
> +}

Better to use a named GPIO input here I think, especially
since it's kind of an internal implementation detail of the device.

thanks
-- PMM
