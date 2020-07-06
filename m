Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp173001lfm;
        Mon, 6 Jul 2020 10:18:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKfAH5FSofEPNZdQJfE5+Ce6K/lZ/+L84g8XUDd+2sXw/tW5uhUdSGfo+5A4gkrGAbsysL
X-Received: by 2002:a5b:282:: with SMTP id x2mr80026414ybl.304.1594055895698;
        Mon, 06 Jul 2020 10:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594055895; cv=none;
        d=google.com; s=arc-20160816;
        b=T5yrzcgI9LuwrWNoXDu3SfX9tucnrJvidne74zw2wrbvXHBGFocE6av9pgEWrt1OJ+
         14N3o1ky+Ow9EVH/3mbywxONsobSZC6zJ2di54hkqXuXChA4HgIb8wjDeL7lezeWN7Yj
         qRJkOYdehDS17ct4Wpd8EeUtrHP4ZbUkRT8p6OrCumrXjpJ7JZUoRdBqqXH/Ol61gxv5
         EG6rwpnjMqjaFQV/Inx5fWw58VjsjW7gSIt85Eyg3DvA0sLEtLxwmlo4r7U45j6AM2/n
         /7/THz9iLGd+OcnQ2vsSdQh23HAwS1D+GE96MO9mq2konLFS6RNinxTfhI61W7iA2s/3
         m+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aJ+NMNUyWOSeU76/wZH/xOla8z/F8BGLKK6NO+daT7c=;
        b=TLTco2Hk6CPFVLtVGe4Eq0xRgusNIE3zIhk40Q4hK4MiqTdPn7afMzdktJPSciMCP3
         GiQ9BSakcmiY1CHrq5rg94ZWWZ+zjqAMy1D69JHIVZHXBFbBSO76roEjwf3LEtothuZY
         8Z5E9mJxRBcY0kUJXFKmQy7LctzZ46PWaKMp+wjAawfxs0/9eS89kamtvRt8xDLlhrmx
         gzfSIwPnO5GebGeo/1eiHkbplFVjG0jo1Gt95UwHlZZAdugz94aCqcDI3urZLgEyu6su
         m2tBp6FqURWBthx8r3OG1PXIkxA7Rl1b50suOMwVEWNMPTBrJLzBPz5AeI1DgMbqEIm7
         CdfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DCtHRVbf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n186si21673037ybn.323.2020.07.06.10.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DCtHRVbf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUkx-0003Id-3Z
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUbX-0007tm-Jb; Mon, 06 Jul 2020 13:08:31 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:33334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUbV-0007UH-Rb; Mon, 06 Jul 2020 13:08:31 -0400
Received: by mail-il1-x141.google.com with SMTP id a11so25295635ilk.0;
 Mon, 06 Jul 2020 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aJ+NMNUyWOSeU76/wZH/xOla8z/F8BGLKK6NO+daT7c=;
 b=DCtHRVbfbNdZdHrkno7Pg0sSHF/TO28JTJSsk4CQyuv3rpTGwPimzgtRdeipMmeYC8
 aUYtMHdn8ZYb548p0TC5sD7ZpYCJiiGQvNkmx5Fh+Y1+2AWdNXgyTbZF5g/nSA0CaFXC
 xiRGdWCgbqjAb5Jb4EW+JexNsAlDtpzx8H6+qoa4BE4MW1vaDJzHgM4Qc/aMXC3ErDa+
 xscFDbu167g1VZgMknCoWSYpzxdRsorPrRCP5QF0sWCErssL7NXmx5bWwMfBYg4XsY6P
 iFeF9TqxPGvbOg5sN22Y7ZvG9cGuDvhz6MRZPNAzvoxaV4xjYoy11GgiUBRGvz6pcpCz
 OlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aJ+NMNUyWOSeU76/wZH/xOla8z/F8BGLKK6NO+daT7c=;
 b=AhhNL8AIYDlSaWvbY1o8X+zvRFnpYqjHdm9SZWnctSBq4IdnegoEp2RXjl53CjUYci
 F7zLOxCUR68oV1IKYJspcDYJy6XIAyUx81Ofhk6e1Q0UwY3Lfcl+gprZxSi6B67XocTq
 gvmNxRDpmt1cRG546Sykv8vREAoHqZY0i6I/lPOOKZWB4wFNmV/aAV9OLQvntUOiOkwk
 /upZFkdjknvxG57Ee2VLf/GyBmDQiSNfbIDlaB9yx5aYHstU3X5DCQxDpcspFdiigQKZ
 vQDBaU1Pw6XbnuaIixQUvNLbdHZhd7YMwnIdt3oQ+Bn0f8nVgI5Kg2iHDbwfrPkowR79
 ZjFA==
X-Gm-Message-State: AOAM530EMvGmhUGDeva1CxJlh0KnWFOUlIdy0waiL0NfsP97STV66EGh
 UIduvUoCg9QkvR+T0/y7+OxFQESV5t9PX0oM5u4=
X-Received: by 2002:a92:c213:: with SMTP id j19mr31628274ilo.40.1594055308108; 
 Mon, 06 Jul 2020 10:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-13-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-13-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:58:41 -0700
Message-ID: <CAKmqyKP1PJVHc=At4EM_60NZrdkokwOW9iwvqTHBoaYShWLUYg@mail.gmail.com>
Subject: Re: [PATCH 12/26] hw/usb/hcd-musb: Restrict header scope
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x7CPhpOcPqrF

On Sat, Jul 4, 2020 at 7:56 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> "hcd-musb.h" is only required by USB device implementions.
> As we keep these implementations in the hw/usb/ directory,
> move the header there.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  {include/hw =3D> hw}/usb/hcd-musb.h | 0
>  hw/usb/hcd-musb.c                 | 2 +-
>  hw/usb/tusb6010.c                 | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename {include/hw =3D> hw}/usb/hcd-musb.h (100%)
>
> diff --git a/include/hw/usb/hcd-musb.h b/hw/usb/hcd-musb.h
> similarity index 100%
> rename from include/hw/usb/hcd-musb.h
> rename to hw/usb/hcd-musb.h
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index 85f5ff5bd4..b8d8766a4a 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -23,9 +23,9 @@
>  #include "qemu/osdep.h"
>  #include "qemu/timer.h"
>  #include "hw/usb.h"
> -#include "hw/usb/hcd-musb.h"
>  #include "hw/irq.h"
>  #include "hw/hw.h"
> +#include "hcd-musb.h"
>
>  /* Common USB registers */
>  #define MUSB_HDRC_FADDR                0x00    /* 8-bit */
> diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
> index 27eb28d3e4..9f9b81b09d 100644
> --- a/hw/usb/tusb6010.c
> +++ b/hw/usb/tusb6010.c
> @@ -23,11 +23,11 @@
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
>  #include "hw/usb.h"
> -#include "hw/usb/hcd-musb.h"
>  #include "hw/arm/omap.h"
>  #include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
> +#include "hcd-musb.h"
>
>  #define TYPE_TUSB6010 "tusb6010"
>  #define TUSB(obj) OBJECT_CHECK(TUSBState, (obj), TYPE_TUSB6010)
> --
> 2.21.3
>
>
