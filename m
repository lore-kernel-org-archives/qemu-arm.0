Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5116792wrm;
        Mon, 21 Oct 2019 14:29:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEOBIIPmSSxx0mHSSvSj16R550l+dlCDQhi+IKWfPWYS5wSiqs7UrfLCIj89atbMvarq3Q
X-Received: by 2002:a17:906:3f87:: with SMTP id b7mr23737217ejj.107.1571693355975;
        Mon, 21 Oct 2019 14:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571693355; cv=none;
        d=google.com; s=arc-20160816;
        b=Os1W7wWrIwMEgFfZY57U7RpEPiHZBYsjqYPZeR5pOIl96iNpMr5z3KQUSWTRU0orW8
         XyK927BQ6pUaezsOX6HdNI+iFhsH0UTW363Z42sUjVyUiXgk3yJA+m/RXKrUV0SNbeuW
         haDrr19tDYmgMbxTqM0JNdbvLy7TaK29GGVjckdPFWY2naCLaMRdi2qGBbiCsg73LSiK
         RAfpIOxAuhPaC5UYFs12c1oY0N7EI4yB5F6LhaxZIjmg1w+NkchavbKcJGvotx4fuIFJ
         y0nRC5L9Nfjs2gTnwamcpMFSbijLXFZqGgjU1x/FgSFYIrW+sb+Ukk+zOZ62WEhQh2ab
         Qtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=wvHv4/pASEk9u1Yc3VAQShnjIXIMbC1uUMd2o+6Ac5w=;
        b=C4VHek43IpTi7f6Mp4IzMJQGLILE6gpYqBA+DSR7kuoy5CZoB/iafgrvSCkVcJDOC0
         Ug2RW2v+jHl71mTbEHOaYV1x7PLSmx2jNBH/f/msTEroMOAZqKtATRhdGthAjFbhhzPv
         MWDSxMz2Y1C10VnS0UDpQQ7AaZlDmz3GVo6KYj5f5sBwL2kIpMEmvVZDJrkSUTvULd8H
         YOYLruyWKy/Y7RCYmFp23i87tdVORfUE11F1Th938rXuZ06t64brqU3aDwNp/R8me7G/
         D7XWKF4yLTadt2MzJb/JaMo1nyYdSRPkP/xqa6FpLm/iNJQkQVcd12KEaip+tfFfj5PH
         8vmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pg2si2383436ejb.133.2019.10.21.14.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 14:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMfEp-0001mz-0g
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 17:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iMfEf-0001md-JL
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iMfEd-0008N4-U3
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:29:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iMfEd-0008MS-Ku
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:29:03 -0400
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B37493B58C
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 21:29:01 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id r5so7469275otn.22
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 14:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wvHv4/pASEk9u1Yc3VAQShnjIXIMbC1uUMd2o+6Ac5w=;
 b=PXvcPkrBR20pkb/QNyQxpQJUpnEW44dmNC1IDztHYYfCTNNzZPhLn4JPEtvPgrz120
 4Y12q0P/8qg9PqTb83jVDAjqQi85I/ipYVeperQKJ63rugsOvS+9nxcf+XEjchdvjMZ6
 bOJkPNIYko0UNIBB50ou77I1U0yxIXSE8gCGumklGJGA2SYWMDNmg50df2x4oERWNIkE
 iR7NOYqlhBL6PPpiikK5kBiIcgVlukFQV9FVo8rD4ElIr1srbUxLY7bpi5g8GB2A+ngm
 dUZyk7KQ4I96/sZ1RrGWREVyzV7hCwky2CNfcx9UUcPkdR+alh9yPlZoM0eksYKZLALO
 QX/Q==
X-Gm-Message-State: APjAAAUrhJ1wtsPQZ1sBI/KjVnFvYoxtcD6q6KXsb53vlII7xZIW6VJo
 11D87EDaZuAeYhSLiS8IgzoGMOz9ZmnMIZmcdHPJRexlxQKGHk3ESB5v6hWwucSSMLWqu1+sJqZ
 w7v2u36j9A7JljLWkpXeEu7j9cy53
X-Received: by 2002:a9d:7147:: with SMTP id y7mr37829otj.62.1571693341134;
 Mon, 21 Oct 2019 14:29:01 -0700 (PDT)
X-Received: by 2002:a9d:7147:: with SMTP id y7mr37815otj.62.1571693340887;
 Mon, 21 Oct 2019 14:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-10-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-10-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 21 Oct 2019 23:28:49 +0200
Message-ID: <CAMxuvazBjHBB+ZBcx4Rfk2N2WNjGqmjiLEiwB7x_5-oBF4JPWg@mail.gmail.com>
Subject: Re: [PATCH 09/14] smbus-eeprom: remove PROP_PTR
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A33pY3sk5lx4

Hi

On Fri, Oct 18, 2019 at 5:43 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Instead, set the initial data field directly. Since it is only 256
> bytes, let's simply copy it to avoid invalid pointers issues.

Actually, the commit message is wrong. The patch used to introduce a
init_data[256] array, and copy initial data there, but I changed my
mind because of the risk to introduce regression as the original
buffer may have changed.

I will rephrase.

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/i2c/smbus_eeprom.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> index 54c86a0112..533c728b3b 100644
> --- a/hw/i2c/smbus_eeprom.c
> +++ b/hw/i2c/smbus_eeprom.c
> @@ -44,7 +44,7 @@
>  typedef struct SMBusEEPROMDevice {
>      SMBusDevice smbusdev;
>      uint8_t data[SMBUS_EEPROM_SIZE];
> -    void *init_data;
> +    uint8_t *init_data;
>      uint8_t offset;
>      bool accessed;
>  } SMBusEEPROMDevice;
> @@ -129,14 +129,14 @@ static void smbus_eeprom_reset(DeviceState *dev)
>
>  static void smbus_eeprom_realize(DeviceState *dev, Error **errp)
>  {
> +    SMBusEEPROMDevice *eeprom =3D SMBUS_EEPROM(dev);
> +
>      smbus_eeprom_reset(dev);
> +    if (eeprom->init_data =3D=3D NULL) {
> +        error_setg(errp, "init_data cannot be NULL");
> +    }
>  }
>
> -static Property smbus_eeprom_properties[] =3D {
> -    DEFINE_PROP_PTR("data", SMBusEEPROMDevice, init_data),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>  static void smbus_eeprom_class_initfn(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -146,9 +146,8 @@ static void smbus_eeprom_class_initfn(ObjectClass *kl=
ass, void *data)
>      dc->reset =3D smbus_eeprom_reset;
>      sc->receive_byte =3D eeprom_receive_byte;
>      sc->write_data =3D eeprom_write_data;
> -    dc->props =3D smbus_eeprom_properties;
>      dc->vmsd =3D &vmstate_smbus_eeprom;
> -    /* Reason: pointer property "data" */
> +    /* Reason: init_data */
>      dc->user_creatable =3D false;
>  }
>
> @@ -172,7 +171,7 @@ void smbus_eeprom_init_one(I2CBus *smbus, uint8_t add=
ress, uint8_t *eeprom_buf)
>
>      dev =3D qdev_create((BusState *) smbus, TYPE_SMBUS_EEPROM);
>      qdev_prop_set_uint8(dev, "address", address);
> -    qdev_prop_set_ptr(dev, "data", eeprom_buf);
> +    SMBUS_EEPROM(dev)->init_data =3D eeprom_buf;
>      qdev_init_nofail(dev);
>  }
>
> --
> 2.23.0.606.g08da6496b6
>
