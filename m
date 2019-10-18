Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1199315wrm;
        Fri, 18 Oct 2019 10:21:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoNs+kFk7CZRAkNarQ2m6GVk5CLA1zQ8gBxcG6TW0Holeh0mLwb2msQCiD5NHtvCxlHCIR
X-Received: by 2002:a0c:a8ea:: with SMTP id h42mr10801244qvc.130.1571419281640;
        Fri, 18 Oct 2019 10:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571419281; cv=none;
        d=google.com; s=arc-20160816;
        b=GlboPGNmoZ1F+CJ8ronJXvXbnNvZ5t+bdXNAtdpnFX+GaoKcukNv15WxX/BKKiYQ6m
         WPzYqZ+wIvkHEoWHEl5urGicgAEmBlTgRQ/roixATrAkIgUkgoHN9LIXh11TJr/3kdRL
         nH/YOSQwApB4/Dm+CH7sxgkM4n413VVHwhd3esXv1TE0H7gagBER0b9CFRqJF8vGZNKd
         SFPjyFf6C42auNBFEaXx3pzycRQnBYFbwaegTNgM7i1UDq4nyVKbNDntxoclvKhe0leo
         J8ukrbGXY3DD/oqimgbd1i2hFCMUKfKUj8d8r+TW8tXE80k+iGC37FBgdSmvIyr1HZFQ
         vs5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KYFHr2QH+Mh8sUuSrEf+c+4lYoqdIymj+MmvPuItesU=;
        b=r+DgxjQEeI7uD5cyKqwePb27Vl3NLrghuLxKiYkNZqI3aVHHyTFOA/o0oHROfAZG6J
         my8kqC8aP+VGQ5wIx2E8LEhYK5qai+Eio/FPhTVaQJTOT6N5nP9LE4JOy32gR3OpMLiw
         YVlyLy7bJj7CpZivjvCPPIOYBDgP58h9U3LMIE2XKN4MJOapT7JMfvRFoeXEXpojyl4x
         pjRiQpkwHXyTiBfRp96b44oWsYxvO/X/rrVm5FCVk+mJ2b65KEG1wXxMecIQd9WOlHkq
         NYdrUoBP9zVAqE6U1AJ/wV1jnlso6X1PJkOk+fCh3rWH4JbQXbEN2sRI44gSGi9JAqrB
         gdwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLfRrk7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si6614070qvv.119.2019.10.18.10.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLfRrk7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVwH-0000Em-3L
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVw1-0000EN-SN
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:21:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVw0-0007De-F7
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:21:05 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40572)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVw0-00078y-1x
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:21:04 -0400
Received: by mail-ot1-x341.google.com with SMTP id y39so5594354ota.7
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KYFHr2QH+Mh8sUuSrEf+c+4lYoqdIymj+MmvPuItesU=;
 b=JLfRrk7W9WegyYQL3RpcfDgOHDsxh50BxlSGmzyKAvn72XSwA2Hagwy1Hy9C7lYxwW
 BTY2XG2MZdRCqDjqD/AAQKftYU4bIaAO8wl2bsEkPGlpXx9kX6HgP8tb0l2HJXppqHu8
 y0lwuItzsVXpoIThs+0HGSGFfKGOTTial+TL8S178RibZe+LTSyOuCCeUaslwh2N9zIS
 dMwqBegbQbP+A2PPlwgzLw1hfCO9Rz2rf2v5Bo+e9S3dSsHtXE2xFbXp4wZrZSEVgfCB
 Hyo+6drruyGnH4PpKcDxKNsTckIEd9BNRsk6LW9iWY1r9WSSayMVs0hlbU1hdGTtFjqS
 Jo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KYFHr2QH+Mh8sUuSrEf+c+4lYoqdIymj+MmvPuItesU=;
 b=RKivISIK/+rToo/jpQqA3ZWzWfn42PAYteGtBRKfk5NxcO8VxNEanbmGTwiG4h8vOM
 l/BrZDDJjScdmT0s+FducGYfidSXqBjhKha3b8YZbcYpKaKpdEKvDovGxd8r3SXNNpiZ
 B2CWL1XvaP1ZHFpZkoIT9Rs2T1CSvChOf3LXXj/UOho1Whm0kw7pdVVpAzuSWOsqA+Zm
 WwyRPEnsSWvjGXpOc4z33oThGZ/tP/vYnOuoLd1l9OuQ/EZ/VLo494iiYKWT7tf4rE6h
 xlC+kvliCBmspTz/ka875tvJlGccPwlAjwVjtxCqjRt44kRhSvFvCm484OJHIWuMLd3m
 cLLQ==
X-Gm-Message-State: APjAAAW2+8zCyvrx04M5BUWkvavbBRoKsTmd8X+lDu5o1JXFEJ5R5mTb
 xOoYXU2J4Q6MgikyES2CRhMtcTQH7upvZtZDdXXdhg==
X-Received: by 2002:a9d:708e:: with SMTP id l14mr8582067otj.135.1571419251924; 
 Fri, 18 Oct 2019 10:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-10-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-10-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 18:20:40 +0100
Message-ID: <CAFEAcA-4A=SyrxsMwN0_HzSi89JAYZz8KzuDWh8O47X_WF0NtQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] smbus-eeprom: remove PROP_PTR
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
X-TUID: U1Y5AxoIqXel

On Fri, 18 Oct 2019 at 16:43, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Instead, set the initial data field directly. Since it is only 256
> bytes, let's simply copy it to avoid invalid pointers issues.

(Commit message says you copy the 256 bytes, but the code
doesn't seem to do any copying?)

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Ah, the smbus code. Corey had a go at cleaning this up
a while back; I can't remember if we found a reason why
we had to keep the weird use of a pointer property here, or
if we just wanted to avoid dragging yet another thing into
an already large patchset.

What we're actually trying to set up here is always 256
bytes of data. What's the right way to pass a QOM device
a small chunk of data like that?

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

thanks
-- PMM
