Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4387861wrm;
        Mon, 21 Oct 2019 03:42:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxd22VpqwJD+1aESuK73kpgGlXVmpiNL9MEyZKBCQKDF2PFkmWFp75cPlJFeXia+6dy9iPL
X-Received: by 2002:a37:9c14:: with SMTP id f20mr21690870qke.500.1571654541117;
        Mon, 21 Oct 2019 03:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571654541; cv=none;
        d=google.com; s=arc-20160816;
        b=FRSahQ737yC/oKa4RtApbRSSEYEhz1fSn0oFvm7srBNt1pS3z50ts4bR8UGKMfJ3dX
         2BVltLbRrnM3Et39RMhACAll+mxcv8OvkX2x7ogI+WZqQa8RdcdE6jYAnDOIdl1kg7Sa
         bOZXG5oJg2kitwuUJsJx5Sz5h24jq+2EgD95agz6Marlsb1DK7FHyGFQd727SFrXVtcG
         64g7Pif4Yg+5mP4QAtM2BBZJBVZ0vcWFK/4mHpbYCo4CLQJ+IJD7rJvPMlvUckpBDinc
         eGLsBYxVTCcyAit+RG79Ss4vHtzwRsAu6lQVU4Pbsu8dJUo96goeXQGfGtCz3XELwC5w
         y0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cDT6q2a0t8Xgwc0bORZyO/VOCMrdP0NenOQLNjg7QCg=;
        b=dBdiam0mlhK/QQc4OpfF2YPsAprJZtHSPu9e/5FxNm+Ysk5s93lm2MILDHfdabd+QT
         4PQUDvugpguadB2ZokOS6x3aCypiMQgUa03wZAiZ+0/G62iIZ7O0MBaGngCaMvVsvZM4
         Zw6QiHZTyTLvxY8P7EvlpLE+YUGCbd3WVzpt/3P4h+FUch5jq13QlMOW9u8siK75ypFi
         r25Yne5Li6d25gQI6A0/3TYUFNaF8K6Yez4PtMD3AoqaVKBEhYDDnJziDTnfOHQq+IYC
         2+OiYLIcLFfhjmsJhJOZKVwnqvLKPdD1VCZAghKg1mycBTzpuSMm9YbPMe0ylRTF9TQJ
         UOPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DW/YIsSo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28si13023507qta.386.2019.10.21.03.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DW/YIsSo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMV8m-0006i8-Eh
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 06:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMV8X-0006fz-NE
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 06:42:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMV8W-0004wB-Ci
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 06:42:05 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMV8W-0004u0-3x
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 06:42:04 -0400
Received: by mail-ot1-x341.google.com with SMTP id 67so10554083oto.3
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cDT6q2a0t8Xgwc0bORZyO/VOCMrdP0NenOQLNjg7QCg=;
 b=DW/YIsSoxXGkphEFRQfiCpppZB3hJ8LXGKGuF0p1XFhZ/cXrtDMxCesIfDPEUG+F8x
 ue1HzDhN0+mZvzHL53IpRpgFQQQTHHP5cA3SIa82yTfxAWx3GqmylNr2XWSvdZE2Z8nW
 Kepdj7DwGQuzKqeQM8CIvFhCjaqZlPJGEub1ycmKui4GlQTylKwCj6v45UhOqyDiHoSh
 4WdeQmZQNu4DGDlbkXXRtCQnVvv9cnu4/9BJVoA5X3dDxhvNjk54X1HGoLX38hSHI01M
 tR3wc9z8wTB4lGkPgH2NHjIyfR3Zff8+spxnED4mT39rldxvb85cS/CxcXADeEzunrAh
 wdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cDT6q2a0t8Xgwc0bORZyO/VOCMrdP0NenOQLNjg7QCg=;
 b=kQMN2ZmkAJqG8Pqo4sKG2sa8Y7MlFhwtSkQmIwQ2zKiXAKp093Inpp6S+sS8vueaQX
 B/1aEJVTvR6tL8Ovvm2rER7Hu07WRCwISRlSHEaiR4ntHM2vTOmDqexcSLx6V8w/nujy
 hjGjcI7FqTP/ihmQdEbCdjmBTTbNrBlywYdXsy2UlS1IIf4OB1khV7o+GY0qv8y27t2m
 NyQvq5qBgUIFBCGxICGd1BhaJERIAGeiXHk5h9RK2oNrJ0E1n6YwbHuDDgV2vbak0A+T
 37TwAMdqW/iD6/2Z0+0Y5sqK0vgxLqabEmx4VFft8+EvbQH7wt8W5lBU0+zHSlp7EYDl
 f+Sw==
X-Gm-Message-State: APjAAAXdhozE2BhAtM7eyS1AmccXBoMAYR5vNJe1Q7whZimy2GbyP1yX
 KSurQVxQNZCAyKBVGvsBMaBegi6fq8xKZrZj8Yn6KA==
X-Received: by 2002:a9d:398a:: with SMTP id y10mr17222497otb.97.1571654522551; 
 Mon, 21 Oct 2019 03:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-5-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-5-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 11:41:50 +0100
Message-ID: <CAFEAcA9mTOR1JNgMYHBSxWmU2PofPLfqKEe8TTVEOtBnRfWe3w@mail.gmail.com>
Subject: Re: [PATCH 04/14] etraxfs: remove PROP_PTR usage
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RsBDPH3NZ0Pn

On Fri, 18 Oct 2019 at 16:42, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> etraxfs_dma_client are not Object, so can't be exposed to user with
> QOM path. Let's remove property usage and move the constructor to the
> .c unit, simplifying some code on the way.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> +/* Instantiate an ETRAXFS Ethernet MAC.  */
> +DeviceState *
> +etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
> +                 struct etraxfs_dma_client *dma_out,
> +                 struct etraxfs_dma_client *dma_in)
> +{
> +    DeviceState *dev;
> +    qemu_check_nic_model(nd, "fseth");
> +
> +    dev =3D qdev_create(NULL, "etraxfs-eth");
> +    qdev_set_nic_properties(dev, nd);
> +    qdev_prop_set_uint32(dev, "phyaddr", phyaddr);
> +    ETRAX_FS_ETH(dev)->dma_out =3D dma_out;
> +    ETRAX_FS_ETH(dev)->dma_in =3D dma_in;
> +    qdev_init_nofail(dev);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> +
> +    return dev;
> +}

I think the right way to do this in a QOM design would be
to define a QOM interface for "I am an etraxfs DMA client"
(which replaces the current 'struct etraxfs_dma_client'
ad-hoc interface), implement it on the ethernet device,
and then have QOM link properties on the DMA controller
device so that you can pass the interface implementations
to it.

If that seems like too much hassle right now, I guess we
can add a TODO comment here explaining what we ought to
be doing instead.

thanks
-- PMM
