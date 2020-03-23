Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1625657lfi;
        Mon, 23 Mar 2020 09:02:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtgzKo2oM8ssYZvyLLbEBzvBRduHO6cm5LfnJifWihS+hLkNmCUE+TE+f3y/sxlz9Dtr2HC
X-Received: by 2002:ac8:7769:: with SMTP id h9mr3050332qtu.234.1584979343508;
        Mon, 23 Mar 2020 09:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584979343; cv=none;
        d=google.com; s=arc-20160816;
        b=s5ig0sXNgpsFd9FVuO3p2uXD2kLvs4CzA6HmwMYfsWHwOlSPa2wReLkhfcbQdj8/2P
         Q2Zqz6nO6d84L8wbLNPfrNt1fw9Xtcnh6XXDwAU0tDPgGTUnnTwmhMH9/cQL7sKf6yJL
         MCiSrWV1teXp2GzD4IV11xaWYyQrU7sBQagACYe04Zh5Rc0fsCQ8Owo+MG8i1b/yytpZ
         75zp2OM4yDw1s0fy8cuxgOMZB8hCh1kMgJGSR/0/Wm+ZSLK+824EawaGPnxrahPUIvmP
         9QrXZRMkIE6NyRxWY6GQRrFb/N5k38YoUFzoQTp8SoB9LWwNVA0AfX9q1e7pWRQo3MN4
         1gVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1VNaMrSp8YPbwEnbO46igXUns6tuTzgRCPCucupcPrM=;
        b=HVetJSQEezH6v14WfHAi2gF74Wtx981yNE12n4qYPLeGMXpuiJ0GICFYCtR5gJ3LEp
         iE1pMqGcV2fVvXn971kF+xet0te/bPabGTCKc9djbBNAZhlzdqBO4cH8F5dEoA/cxmyx
         oES4RPK1J4w+QlEN/3o+f/vehdgqQzDuzOfkZZxprtocf6EWcVxJKFJEFynCDqq5kyEB
         cZ3/7FE1LjfUbcKbwI7VEti7gUcOltzFWpX7pdvYgFqIT+bansODrAQo5Xjdgued2/Jw
         ecZOAnlKymhmEm/bWpxMXFy73UJP8VtvuAsiBnXRj9IXcEPc2D12248+K+bPNiZKzm/J
         yOhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RS3zMTig;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si8673768qkb.182.2020.03.23.09.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 09:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RS3zMTig;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGPWw-0005NC-P4
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 12:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGPU8-0002Tg-SD
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGPU7-00055U-Lz
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:59:28 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:33988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGPU7-00055D-I8; Mon, 23 Mar 2020 11:59:27 -0400
Received: by mail-vs1-xe41.google.com with SMTP id t10so9108014vsp.1;
 Mon, 23 Mar 2020 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1VNaMrSp8YPbwEnbO46igXUns6tuTzgRCPCucupcPrM=;
 b=RS3zMTig/IS/fkiMCeXiCs5HSb3l8zAbqBq6/mWNXog7ax4Cu0zTVj2BLMrDU71Kf9
 4xu82WTxF2/FTlNDHGtbd7YJI/5N+rhwLlYtWf5Nb0LBCQJVH7A/coI2dN7km9ovDMGj
 ySIRD5ue/du4zV5Q7G6xCOEnb2dscuwWof+LZMJHe2SgC7441v4fsoFgee5EL3XdEhMR
 0OEkJHuyGUfbR7m4kOgfWNEBYxS75XTGpivSaPN/mE3iCj6kNIyFH89c34lqt1pansAf
 6Pr97B5jisdT76dCu+GYFqpeDNQLPyrbGrT0jaQoxEytVMht0RcqQtJlwOWgoxXf9rBY
 JW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1VNaMrSp8YPbwEnbO46igXUns6tuTzgRCPCucupcPrM=;
 b=i8EQmitIIUk5EVJyTQPgvSBEQQHPQEGjf6P5SQCR3HwEd2JirXAlo7dgdoYvw4W27J
 OKVP7xxyWDd1dutr/JfDFtz3LDjfI0PRxAM8d5/AffBEpVvIkuV7I/m1DWVPSTw0nBt4
 FJifxnIM9DkE7m0xSlh+pN2wbf4CquXhL4fvAl2hwnYMq8HaP9m5rpBR0LXrJQkWjl5+
 7GZxijITlRpTbUqu3+Iznef9pcW+DNsEoKQQZZhMtspwRF66hFvkf3XVja/pjfa9L2y+
 8nGUnUTSVKuwYrazMgmJlT+w+VUoWCyoU7jYsBL0Pkf8dZEircCsTT3ofyZThJNze+7t
 BWaA==
X-Gm-Message-State: ANhLgQ11Gpyh8OjJ/hD58QWel9r3Ot463HdTdVlr3qOZPiUEDrJ3MUO7
 NwKbt4lCA0V7GXGZVNFr1VfGrhB4iz0qeMRhBKk=
X-Received: by 2002:a67:902:: with SMTP id 2mr8946031vsj.133.1584979166826;
 Mon, 23 Mar 2020 08:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-7-philmd@redhat.com>
In-Reply-To: <20200321144110.5010-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Mar 2020 08:51:28 -0700
Message-ID: <CAKmqyKMOmdWy=TrDDNR2-pkRQ4XPQaRWfQ2UzQ9rYg6AbPMYCg@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2 06/11] hw/isa/i82378: Remove dead assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e41
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4++FPn0GdsZs

On Sat, Mar 21, 2020 at 7:46 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Rename the unique variable assigned as 'pit' which better
> represents what it holds, to fix a warning reported by the
> Clang static code analyzer:
>
>     CC      hw/isa/i82378.o
>   hw/isa/i82378.c:108:5: warning: Value stored to 'isa' is never read
>       isa =3D isa_create_simple(isabus, "i82374");
>       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/isa/i82378.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
> index dcb6b479ea..d9e6c7fa00 100644
> --- a/hw/isa/i82378.c
> +++ b/hw/isa/i82378.c
> @@ -67,7 +67,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp=
)
>      I82378State *s =3D I82378(dev);
>      uint8_t *pci_conf;
>      ISABus *isabus;
> -    ISADevice *isa;
> +    ISADevice *pit;
>
>      pci_conf =3D pci->config;
>      pci_set_word(pci_conf + PCI_COMMAND,
> @@ -99,13 +99,13 @@ static void i82378_realize(PCIDevice *pci, Error **er=
rp)
>      isa_bus_irqs(isabus, s->i8259);
>
>      /* 1 82C54 (pit) */
> -    isa =3D i8254_pit_init(isabus, 0x40, 0, NULL);
> +    pit =3D i8254_pit_init(isabus, 0x40, 0, NULL);
>
>      /* speaker */
> -    pcspk_init(isabus, isa);
> +    pcspk_init(isabus, pit);
>
>      /* 2 82C37 (dma) */
> -    isa =3D isa_create_simple(isabus, "i82374");
> +    isa_create_simple(isabus, "i82374");
>  }
>
>  static void i82378_init(Object *obj)
> --
> 2.21.1
>
>
