Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1932961lfc;
        Wed, 20 Nov 2019 04:32:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqz69v+vv65fyv08HAALsZnjXwrY1q25x5SgKYejwACUUzOQCHn3BCUEQA2GIeOAizIG6CcO
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr2133915qkg.430.1574253158592;
        Wed, 20 Nov 2019 04:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574253158; cv=none;
        d=google.com; s=arc-20160816;
        b=Kcfoka4OeNrdzT0R+cn4q9tCJX2yHkTmMCzIsQY+Aiqa5NjD56LUG11J5uvxAGWxIk
         Tqg71qSmd6yPRyO2/c+jENEk1TWWrOL8D7CZ7ahif/2kOHJL/WfX8yi9jjzKfmt3jrQ2
         Y0RgmFajbzZLRAmXYBUuSRSJwvR35YEqIpkTuT+9rpn9Sln23sEE6LzPYEuRiexHS11s
         vvbFaIeJnaza1b1WRFmbQJj71Ajob7/tUdtjtOKlzTkQzl3l1u65/BzgAcn9z5uzqNvn
         uYXYbXE3WdNjjuYALtZQCcZm9sj8ySzGS3OBsMeiISg0zWMDeaNJxMJbcDNFvh7uMff5
         cAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HNr91VHOHr+EjZehfhxVDFvZzrBBHC3X4uXRcPLqpE0=;
        b=x5/aMXk8QwlVoiJhel5M5r2xUW7id7lvq+zLGMqjrQgbZGR2dLGJTWzSxT63YFE6eE
         df50gjGuOj3Kn0vfyO8GMZhCArXZgo879QP6e9xeUlBXQNefQTH0oPC/YP6aTXPeGrDB
         b4ExTMKP58t9QnwlsUYmEWkhmm68tvxpZKq13WAIGvbP4yRg82z4rji+S5vfwvuVQtXQ
         MFjq81eX7V64BtM8EOaxE3oq601u4wb/I2dp/bLWqihrY0lbB1o9TzJ+QrF5k/WbZeY4
         fgt3qWlK4eK9RORGBU9Ut/kt2B6BN+7XGTSxhjvINwv8TE4UEogXb4n+nqzpv1yx9zIM
         Fq6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FwMBFdYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si15626533qtk.72.2019.11.20.04.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 04:32:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FwMBFdYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXP9x-00023Z-IE
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 07:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iXP9l-000216-Eu
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 07:32:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iXP9k-00047U-4E
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 07:32:25 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59455
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iXP9k-00043B-0i
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 07:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574253137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNr91VHOHr+EjZehfhxVDFvZzrBBHC3X4uXRcPLqpE0=;
 b=FwMBFdYlZdFmrHaJ95q8GGOiRAq6X+Up6bhvws8D9yy1+u8+GkR0jAk6wrI7b42RBXhovB
 BXGNrDWhYtTmPlPExzi9GQFQrrqc1Kll8SDD8/iq6FA6PHj33JFFK6hcCB/pWr2rChDIrd
 MC47kxXNMBQ5xC5fpnyGuHdnWoG0H5I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-L5A9ikL_N3KZ-v_nJQykHA-1; Wed, 20 Nov 2019 07:32:14 -0500
Received: by mail-wr1-f72.google.com with SMTP id w9so21126009wrn.9
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 04:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fyra5V6iUSdWSbfZeV/HRb8fo7AY542XDy1yURjY304=;
 b=Lxe9cBBN/G1IILGUGqkfQ+VCxRMfx9fk2luUgYc/cLCq9Ibz6v2b+SBSO3sfkhO4uB
 UMdBNSwnk7M2fQonZMKZYNX2Pb3UAqNTp4eQwktT3cHeZkKWSY7rxBbRWzGN7eOPLdBD
 +tUD0JOo2rxOQKXtNUd8AdpIp8mKsQWhDYMGPQivSCFmDIYEpNiGlollnNlJcroPECSy
 S0ZGUMmDE9uUNyw+M28wKZrNt9U4axMxjla8D7VZmsxiWyC1AAFLHVt2h2HFFRFFxSmH
 D0tO7aZGEci6TqmDDLp6QeEmCPbeU2+wObL8YDdNPhZLcmwrT08AV2Ai4S0KhZ48SloI
 RKcA==
X-Gm-Message-State: APjAAAXVtU9AY80rZcN386otaC5bpBZKrl0hp20UdkvGp4dqsrQeTOwv
 589L9yeZ3YtiZw+Z5vvhqaw3oPX63qxnjO/iFWFKLcu6ZRuR1qaWmTOCmRzDC602jFZRWlYSSQ8
 zlvx+FOA3wrYQ
X-Received: by 2002:adf:9323:: with SMTP id 32mr3022950wro.15.1574253133122;
 Wed, 20 Nov 2019 04:32:13 -0800 (PST)
X-Received: by 2002:adf:9323:: with SMTP id 32mr3022903wro.15.1574253132875;
 Wed, 20 Nov 2019 04:32:12 -0800 (PST)
Received: from [10.201.33.134] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id g138sm6672647wmg.11.2019.11.20.04.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 04:32:12 -0800 (PST)
Subject: Re: [PATCH v3 12/33] serial: replace serial_exit_core() with unrealize
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-13-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <58a2eeb4-9241-2beb-d5fd-41e306f5376e@redhat.com>
Date: Wed, 20 Nov 2019 13:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-13-marcandre.lureau@redhat.com>
Content-Language: en-US
X-MC-Unique: L5A9ikL_N3KZ-v_nJQykHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ft57EOuZc9KV

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> Instead of calling serial_exit_core() directly, use the QDev unrealize
> callback.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/serial-pci-multi.c | 2 +-
>   hw/char/serial-pci.c       | 2 +-
>   hw/char/serial.c           | 5 ++++-
>   include/hw/char/serial.h   | 1 -
>   4 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
> index 60c1c948b8..a3200555aa 100644
> --- a/hw/char/serial-pci-multi.c
> +++ b/hw/char/serial-pci-multi.c
> @@ -56,7 +56,7 @@ static void multi_serial_pci_exit(PCIDevice *dev)
>  =20
>       for (i =3D 0; i < pci->ports; i++) {
>           s =3D pci->state + i;
> -        serial_exit_core(s);
> +        object_property_set_bool(OBJECT(s), false, "realized", NULL);
>           memory_region_del_subregion(&pci->iobar, &s->io);
>           g_free(pci->name[i]);
>       }
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index 35a8552674..54bdd98325 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -69,7 +69,7 @@ static void serial_pci_exit(PCIDevice *dev)
>       PCISerialState *pci =3D DO_UPCAST(PCISerialState, dev, dev);
>       SerialState *s =3D &pci->state;
>  =20
> -    serial_exit_core(s);
> +    object_property_set_bool(OBJECT(s), false, "realized", NULL);
>       qemu_free_irq(s->irq);
>   }
>  =20
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index bf34d9594e..667570e310 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -951,8 +951,10 @@ static void serial_realize(DeviceState *dev, Error *=
*errp)
>       qdev_set_legacy_instance_id(dev, s->instance_id, 2);
>   }
>  =20
> -void serial_exit_core(SerialState *s)
> +static void serial_unrealize(DeviceState *dev, Error **errp)
>   {
> +    SerialState *s =3D SERIAL(dev);
> +
>       qemu_chr_fe_deinit(&s->chr, false);
>  =20
>       timer_del(s->modem_status_poll);
> @@ -1014,6 +1016,7 @@ static void serial_class_init(ObjectClass *klass, v=
oid* data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
>       dc->realize =3D serial_realize;
> +    dc->unrealize =3D serial_unrealize;
>       dc->vmsd =3D &vmstate_serial;
>       dc->props =3D serial_properties;
>   }
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index b445df5951..7cc6304f1d 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -84,7 +84,6 @@ typedef struct SerialState {
>   extern const VMStateDescription vmstate_serial;
>   extern const MemoryRegionOps serial_io_ops;
>  =20
> -void serial_exit_core(SerialState *s);
>   void serial_set_frequency(SerialState *s, uint32_t frequency);
>  =20
>   #define TYPE_SERIAL "serial"
>=20

Nice.
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

