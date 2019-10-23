Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1511799wrq;
        Wed, 23 Oct 2019 15:41:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMrjIg7aL2RPvRneaj+8uvWdx/NZXKFDEFClb3JYefd2zp4ZUb27l7zjKbzkV29xCwBwyZ
X-Received: by 2002:a37:ba46:: with SMTP id k67mr10880388qkf.175.1571870509887;
        Wed, 23 Oct 2019 15:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571870509; cv=none;
        d=google.com; s=arc-20160816;
        b=wUi4fNef6N4zA7GoZqKf+K3cmZ2JGp9W17arl8f6B0JdNkNptLFrajUYfrl9JBaAj6
         vEKG7jS5xUNHF86/NuPa7l9Iv6kU1KxeIMim05wMlKid1Ibyk8aq9YW4AY6CK8feXQfT
         yZB4eG1hwwO/mkfQcIIV4EpZxqHyREDk+c43jTr0T7mWcJ5Pl7eCE/mrp9+04+vwz79M
         y4DKJknx+L76hlYRdNZJy9DJV12+JY2bV4P8gdaUt2LZ8Lze/VVIE95D7nlbiBYD3TKI
         /DySQuwSa8l32ciyZGgvN5+NI0bQIbuTwCkdz6wItg5BHOIfatMpcSIwHJDM5CLxYXvT
         t8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=jkd5chVb9yzaH/X6NVH+2sx7cV2ha4PGVu7Mhnk+Nhc=;
        b=huqtvkNYi02c6eS7OFBAiEGNUKC2J9TrTbYWPA/r1DG+7KQHCLipYg2Ztm/FFTEWO5
         GHyUlWzMpCLtuwLGYEoqrMB08i4yJBwMxonRDGz7x5V+ViYdC7Wjj3GIxo9kEhbfZiKW
         5h5BfjQbXTy6J1e2Jozt9s9l1sxlA0xdlxb2jJZEvn9Zl+jW8Nkdj2fy26w4e0Lw+fuy
         sW6/vyDmAUoCBVegBD2LXiAklVJmh2vuW0eAy4hx6yK77qH6XX/dn/9JWN79eZkcUQhs
         jfKXRsJhs5+k3ox0YaiElUFbNflU7CZb/xHI+KV4Qi9MIxjb73B3C4fD4/3MkG5zeP4s
         8uqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y123si6235645qke.32.2019.10.23.15.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 15:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNPK8-0004IF-Ol
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 18:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPJt-0004B2-5r
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPJr-0000ys-42
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:41:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47332)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPJq-0000yQ-RC
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:41:31 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C95E081F11
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 22:41:29 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id z9so2617098wrq.11
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 15:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pzf+7boHjCKGGmfqlognfYQS8TO2/QfBt1nq6ZNBjTo=;
 b=lPiqiRaejyr2MI5Ebzdzmm824F95JoqT2bMp2SWYwsOPgFN6TH1tlZk+ROJaYfGM6s
 0ZVFH6NcnIl8KENEiRcKVQAtLRxWPKFRITYFxX19N5oI5tYBQUCd3gLvXGnyH4Xi8y8v
 IGkqdhIiHsdCGB4Gg6dtKuhlWdV8FTXsej7JvfttvY9DT8vOLcPpoHPuOEtEiiq0wYN/
 vxzeBOZi9z85QHdaqIgl9vG4CswooeiQkUlOWpLbc1WsOuyBY0fDNPJ1CxsMRv3PTWbt
 +0cMJruxSR5M7A+TXlKSeDyXAaY+Dp95h0FLu+ooTod+pewnPnu0/cD8iH9k7dvLF8ne
 k3vA==
X-Gm-Message-State: APjAAAWd7UDt0uSWeXzSaP0m8SB0PjTPoZfx86qB/MBjR1pqE1UtKvHY
 xhbc1cMTSDWNAHV9Kk1vN2id8GtUuYF4nQbrTiZkLRhGYvVRarPYyu+0yn3FiNSGSW8KztDqIZ+
 my5m2hsU9BM11
X-Received: by 2002:adf:c409:: with SMTP id v9mr870464wrf.41.1571870488517;
 Wed, 23 Oct 2019 15:41:28 -0700 (PDT)
X-Received: by 2002:adf:c409:: with SMTP id v9mr870450wrf.41.1571870488340;
 Wed, 23 Oct 2019 15:41:28 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id s10sm28433136wrr.5.2019.10.23.15.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 15:41:27 -0700 (PDT)
Subject: Re: [PATCH v3 05/33] serial-pci-multi: factor out
 multi_serial_get_nr_ports
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-6-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6918ee75-31e8-7816-b196-5654cda451e0@redhat.com>
Date: Thu, 24 Oct 2019 00:41:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
X-TUID: PStxDb7zlWou

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> Reused in following patch.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/serial-pci-multi.c | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
> index 5f13b5663b..6fa1cc6225 100644
> --- a/hw/char/serial-pci-multi.c
> +++ b/hw/char/serial-pci-multi.c
> @@ -77,24 +77,26 @@ static void multi_serial_irq_mux(void *opaque, int =
n, int level)
>       pci_set_irq(&pci->dev, pending);
>   }
>  =20
> +static int multi_serial_get_nr_ports(PCIDeviceClass *pc)

static size_t multi_serial_get_port_count()?

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +{
> +    switch (pc->device_id) {
> +    case 0x0003:
> +        return 2;
> +    case 0x0004:
> +        return 4;
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +
>   static void multi_serial_pci_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
>       PCIMultiSerialState *pci =3D DO_UPCAST(PCIMultiSerialState, dev, =
dev);
>       SerialState *s;
>       Error *err =3D NULL;
> -    int i, nr_ports =3D 0;
> -
> -    switch (pc->device_id) {
> -    case 0x0003:
> -        nr_ports =3D 2;
> -        break;
> -    case 0x0004:
> -        nr_ports =3D 4;
> -        break;
> -    }
> -    assert(nr_ports > 0);
> -    assert(nr_ports <=3D PCI_SERIAL_MAX_PORTS);
> +    int i, nr_ports =3D multi_serial_get_nr_ports(pc);
>  =20
>       pci->dev.config[PCI_CLASS_PROG] =3D pci->prog_if;
>       pci->dev.config[PCI_INTERRUPT_PIN] =3D 0x01;
>=20
