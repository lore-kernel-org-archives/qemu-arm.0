Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp480761lfb;
        Thu, 9 Jun 2022 07:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4JdISZDFFZiKJSfJU5M4TPX+LZG7b/MwvWIQhL4xZNuuYVquLxv8P3+4cqkY3480dmy+x
X-Received: by 2002:a37:a097:0:b0:6a6:7bd5:e9fe with SMTP id j145-20020a37a097000000b006a67bd5e9femr25941348qke.432.1654785161194;
        Thu, 09 Jun 2022 07:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654785161; cv=none;
        d=google.com; s=arc-20160816;
        b=Ekam/haFZjmz2wR4PPP54BGDjZaX4ef5mpq6lAUbJo2e5ts03rUZ5dyOZG5wK78E1V
         jSzzfaziINkwe29WG+BTfp937n8OlkRBcsMSSQkA/+XQhjGvVxuEQ70BlfcamoNcUA4m
         YgIQbxek1aHe20UhlxbAh/QEKo+lQGPdkwlHTrknG5Jb5u0talQnFPb28RmcplQ9GlhM
         gdcbKyqDwQeUrbovEBDMW+xHhVbKLEOwVwnrHJoXDuslyJ8t6K+q7RvUhgx6jGwdoaeZ
         vyAvx7FQ11CiKkma7U9gtG5Phrtxyx1nznNXYGV50LzWjn+3joTbKn74fPCXmkLIS7ez
         5yWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QX7WSOmfdAj+2a76Ls2sUy1xnxRT9B8UXZTQolxAxBs=;
        b=pOHTSURgm2m2jAzxIUD2gRBrxrT7Cko3Zety00ZEgElfrwaOWUKqxEo6ejKRbxpM7u
         0B3TnwYpTS7/UZ48a7Yi0R9rqsdOTPu7GioBhmHo9eEEBVOGgnS4kQulbl8M9jAzqG75
         wGykoXAEvpq6CS1d9rCo/lPEtx35rCf9lORX+EylCmrak87cnFEC4jzO1XzjsewcBCiJ
         zWOnGf1sk5t1eE0ilB38FwsHQgiUZSPKBAv7OGPW0TuvUS0LFl32VNChQSyjgCtyaz7R
         HQjih7+aTVotpjEBF6RGIQACTaaQk5qR3/uE5uhs9VuI6XGZr9WC6qoDaJjMv4kg3qQt
         drNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uI/vbidi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br35-20020a05620a462300b006a6c58a5ae4si7184092qkb.168.2022.06.09.07.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 07:32:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uI/vbidi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzJDE-0004MV-Mt
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 10:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHf3-0005Lf-8s
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:53:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHev-0003it-NU
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:53:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id e24so21318598pjt.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QX7WSOmfdAj+2a76Ls2sUy1xnxRT9B8UXZTQolxAxBs=;
 b=uI/vbidic7dE019LE9d24kUwWbq82wrBKPv2yRUh9NxP5NF3WnFlj9SYppRkTWlVcA
 S2VrYOI64B3W3kh6evEqlDFvrYBqPJf5D2AoNsNl5tbcpl/XY7FWbwknUwaYurBR9L23
 ncZinSSsAcUSRmBjjzX1tcrK2Fmq8Y8nD0YS2ccg1bSWjImiB1v1myQcNETNDRm8MAoO
 kfgxRnOAknvVT0RIssiopK1C+FnG/07yQ4vLrcqpUu1GLekXXI11YhIIxW3NnWH4+oFZ
 c2viN5SICaO6cFuC61P1hvFmNHJ96EZ7LAm5iqlsM+Y7VLJoJlsxQs6DVeyjwCophVXw
 WfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QX7WSOmfdAj+2a76Ls2sUy1xnxRT9B8UXZTQolxAxBs=;
 b=gzBo0J8axLrVL+x5maBYD6aBX6SW92PP5j4K7rEgmipx0KW6Dbm6JabwnuS//9trY0
 EdDl2t+q9kdvIeGLp8c3CCduk6ENK9PeCZcttQhrVdKObbKmaZxssMCO5Sdyqvh1WHZD
 H1CEwIiQobfz3jo/deNspr/hNRWmfmTjS8roGSIHHDVKSllMW0JzWEbxzROlOT3PudOj
 Oh7YjzxPJ+lBI7gElamDXTN3TU97Y5MJoDNxT5eheTwhTSJLaiqt8/PfSxfBEF9MXPa7
 T5M4oTRczCek0lFSdvkEW1gnxs7x2fvHE8+NgsuiLMDKRiTLqZTl09PVz8z/cpXeJ6vn
 aB4Q==
X-Gm-Message-State: AOAM531Eu7f4cjjBdkbjTe9BQ3MSbdepTXQfnbnBm/GYwFUm65p+bAKz
 ymGiRjxAbDkD7QORg2Z2rrTK4MVnqFNnuX+FRVjb0w==
X-Received: by 2002:a17:902:e80d:b0:167:5e77:e695 with SMTP id
 u13-20020a170902e80d00b001675e77e695mr28344121plg.144.1654779188165; Thu, 09
 Jun 2022 05:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-50-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-50-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:52:57 +0100
Message-ID: <CAFEAcA_zHBc1FTYa6++8jtOJ42rsedcF01ryk-_3zYgLr=Ptug@mail.gmail.com>
Subject: Re: [PATCH 49/50] pckbd: switch I8042 device from update_irq()
 function to PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: KVG1tnHF0DZb

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Define a new qdev input gpio for handling incoming PS2 IRQs, and then wire up the
> PS2 keyboard and mouse devices to use it. At the same time set update_irq() and
> update_arg to NULL in ps2_kbd_init() and ps2_mouse_init() to ensure that any
> accidental attempt to use the legacy update_irq() function will cause a NULL
> pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index b2fdd1c999..f1eeab9952 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -801,6 +801,18 @@ static const MemoryRegionOps i8042_cmd_ops = {
>      .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
> +static void i8042_set_irq(void *opaque, int n, int level)
> +{
> +    ISAKBDState *s = I8042(opaque);
> +    KBDState *ks = &s->kbd;
> +
> +    if (n) {
> +        kbd_update_aux_irq(ks, level);
> +    } else {
> +        kbd_update_kbd_irq(ks, level);
> +    }
> +}
> +
>  static void i8042_reset(DeviceState *dev)
>  {
>      ISAKBDState *s = I8042(dev);
> @@ -820,6 +832,9 @@ static void i8042_initfn(Object *obj)
>                            "i8042-cmd", 1);
>
>      qdev_init_gpio_out_named(DEVICE(obj), &s->a20_out, I8042_A20_LINE, 1);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->irqs, 2);
> +    qdev_init_gpio_in(DEVICE(obj), i8042_set_irq, 2);
>  }

named gpio inputs, otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
