Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp438642lfb;
        Thu, 9 Jun 2022 06:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF/PgBBFYqkNHIqCLU4PsIBNZNSqxYMb9DKdV9HTX6Uqia89A21kUX25mkL5dtkBcM1Y6L
X-Received: by 2002:a37:e110:0:b0:6a6:80f0:5192 with SMTP id c16-20020a37e110000000b006a680f05192mr24309617qkm.706.1654781329501;
        Thu, 09 Jun 2022 06:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781329; cv=none;
        d=google.com; s=arc-20160816;
        b=dZOX0LyRuvoJBxdG9jkGm8sTmasNXUkos9wQ5n5S8RVi3Ofg0FdyHZOOWODfD9JjAs
         Hn2JDTB+9X3WswTpP38gax/W8FzFANkqMgKNAlnZoHgoJ23pWfG5G7i+Cabd92/m2kH9
         qwJ3xhsvVm9Qz2Juwg1HHpCEsiPnyyZqmNKRlrbst1/fQSHvqXKyRG3kdaLzJkBlDOyf
         +uSwTSruaDeF20JUynNXercE6bHCUjSNKf+Zmrts6782LGQTdanTbzp0uIbESsQyCcpX
         AXYVKWhse9TnzM4AOLo/BvCPHZ2A+ZS9xrhUDeu0Z9112kLEcvH9zfAXMZw4XcJEmisW
         oLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gJKUTd63tpf6HZVWqwf6cv40NQZYq8+b+3+Ks9emEmY=;
        b=z/h1fvqvFKtZMrUTJvMm3+q/zCqZgBlAVe8y6/mYKda29cetWyOLqZQxdUbJ4b26LO
         TeCE+FW9QJgpsQyQuTKcy3+RLzSfqegK2SKE5AeIEfbyNrEoAYf5g34BTE8CBCNBaebT
         U5k8ChZ1lcTuHK8PJ7Vb0eZMsSPuVQUU2oP0RkvRpbSA025hwuJGBPG0voj7EYYxKHxM
         9+OJE1JqK2Y3jU5d1a9X3ecRfnv7O22exgv3/AFhwcmS1xfTh9VUVvdHmSG0zh6mcI3y
         G4+029VNpcFSfrQOtObxsZlOHbHXQ7sAthmphqn+u5hi18BQlxfWPm8fPdYD2lm/T1xn
         HIfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9CzZSur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05622a170900b003051524006csi349738qtk.277.2022.06.09.06.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9CzZSur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIDQ-00039v-VI
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzGBQ-0000Qj-V3
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:18:40 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:37095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzGBO-0003EJ-QU
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:18:36 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31332df12a6so89429697b3.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJKUTd63tpf6HZVWqwf6cv40NQZYq8+b+3+Ks9emEmY=;
 b=R9CzZSurBjMDw4DWHthGoouXawYeBgPVvOvEl1S9CEEpNfakysz2pdjVXFpr9IxHx0
 98E6tBBMjt/8ONsyZef0/0Nv36ImKEuzR+od5G7Mgsb+5AyukEtcRiM8YZ/KM1KPqWVJ
 5BBURzLOCiC9HPJmUnU/Y0g3vIpLSY4JYdXuJh291ByLZEAIP6fFhV7/cBrR/001yFF0
 6RfAUajbk97utRNPJEBXURYEdT0ufIp4LTD2/yRct7UP6aVRpDIhNu9lgkdqzywLerPj
 tw0ATlepTeXDPNsrjfX0181Cf9Ll1A8FH9Iz4695ptFAVjs8c1hUvBctPNpKqluxKHz8
 CsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJKUTd63tpf6HZVWqwf6cv40NQZYq8+b+3+Ks9emEmY=;
 b=4BczIx7c02E34wNHVIcof8uLchp10fTN8SmrHaphXFX4c0Gk2jinZz3vaERI3gJw9+
 LC6jYMWgm8iqItNK2CgRC8CGGzkXiRkT12E+z422JkSeyFMMHAeuvZYvwK/VZD06kh49
 c33lOVb6aSJ/7dgHvI2P5uz6Oha0s8Z8S2s2nwEZfbCq5RrequYtR3EfMQCZaU8vnyuB
 lV3WUyW1DOl2pNa1lez8+mfUTQdIPA0+JJ43ahCKC51mlxFaOTlEFBCLEpBO3MGZKjBT
 Ip2oKIvxDL4zlT+0e9f+oULd/u5gbPFSuhXAq36G/7U+gP4PlVhwgLcfmAP+zT8snyZg
 sCqw==
X-Gm-Message-State: AOAM531A43FlMonvh9oR8NkDHT8/W1q1kA2Oo+j50i+s7Qp/cZu8vN69
 OJwYM0u21pBjv1OQ2UVH9MAAlAVWXwcYolHx8E5WSA==
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr40890026ywb.64.1654773513344; Thu, 09
 Jun 2022 04:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:18:23 +0100
Message-ID: <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: u+XlbsvC2J+I

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables the IRQ to be wired up using qdev_connect_gpio_out() in
> lasips2_initfn().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 8 ++++----
>  include/hw/input/lasips2.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 6849b71e5c..644cf70955 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -247,16 +247,14 @@ static void lasips2_port_set_irq(void *opaque, int level)
>
>  LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
>  {
> -    LASIPS2State *s;
>      DeviceState *dev;
>
>      dev = qdev_new(TYPE_LASIPS2);
>      qdev_prop_set_uint64(dev, "base", base);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    s = LASIPS2(dev);
> +    qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
>
> -    s->irq = irq;
> -    return s;
> +    return LASIPS2(dev);
>  }
>
>  static void lasips2_realize(DeviceState *dev, Error **errp)
> @@ -285,6 +283,8 @@ static void lasips2_init(Object *obj)
>
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
> +
> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>  }
>
>  static Property lasips2_properties[] = {
> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
> index 7e4437b925..d3e9719d65 100644
> --- a/include/hw/input/lasips2.h
> +++ b/include/hw/input/lasips2.h
> @@ -22,6 +22,8 @@ typedef struct LASIPS2Port {
>      bool irq;
>  } LASIPS2Port;
>
> +#define LASIPS2_IRQ    0

If you find yourself #defining names for IRQ lines then this is
probably a sign you should be using named GPIO lines :-)

Alternatively, maybe use sysbus_init_irq()? By convention the
only sysbus IRQ on a device is generally "its IRQ line".

-- PMM
