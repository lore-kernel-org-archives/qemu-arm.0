Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1510540wrq;
        Wed, 23 Oct 2019 15:40:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwk6ChSn3VzjBUF+Ubqg6M/3R5akcgxQGaVfWBrC176VO/BlK2539ub9JDF9Z7izMnbGTlw
X-Received: by 2002:a50:da0f:: with SMTP id z15mr12628744edj.137.1571870422547;
        Wed, 23 Oct 2019 15:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571870422; cv=none;
        d=google.com; s=arc-20160816;
        b=iP1S90a1V+M0nO+gsiY2SyrOf0s5w++S+LQ3zAljcZr/Tu/VNbCj7joAd7wLvOaIVL
         9TLAprnsrBWVtaNjDYRCoqjIwHPUaGEXxOlpcSzigCYNvNu4dZ6ncGMBNo8Ju2Ep8GCs
         s5/kWMqEA6xF2Au3ebyFOy08k6U1whPMvkDIurKixBhqL06I6vdlr1mI9THy2nZxTjom
         +wQioM7qY5mZCRqG1ohB98yHqUmqt+PWTWhwvSQdJ0aOZA6b6qq0LE71dJmxoCXxas99
         QKvo23Tpa1uCLCnWTbNAuQ//ycq2MU6oJxfseeM9y6Rv03jLU2KUfdDbiy1A93kSMD8b
         eCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=zug2/p4TvZSdnth7nVmGa3yh0r+ou49g1wyQXSonXlE=;
        b=FHcaDUNSatEw4T/xOWG8rW0XVuq3dbJbrLC1JT5xHcZVd526WDP+RfydkII8wjuqGU
         gwwwAC5/Ck4b0OMg0WKWk1oqMOX6eNkQGn/3V9kfW+tbJjQaTOD0o8WyCXTs7y0ZJ6fj
         Po45CM0+ck3IpbSTKX4McT6h6RoQbP11eyt/lLMCViUqNIDqgLMW6APBDV9bNG1wnTnx
         x3sZMW9QadCBm/gC0KF0YKc425ItYDTUS68exlCDZUQ/5RY7okytzRKXyCjgM767QBWm
         czSGB87j9Tvef5JUoV7PEH2pcYty9s4GVPcWkTMVPYYtg10CqOGj1unfdMe4eVfr6Vmc
         dkpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a60si5368923edf.169.2019.10.23.15.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 15:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNPIi-0001ge-MF
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 18:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPIH-0001b3-Jt
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPIG-0000BH-HH
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:39:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPIG-0000Aj-8r
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:39:52 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 41888C057F20
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 22:39:51 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id h4so11770139wrx.15
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 15:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2d+e4Ggzpxfb7QDQFDgQozuUXUmaOle5Uf7KEetu8g=;
 b=Ts8MiGaYhkgmdKtVmS9OOM6l3RUK2gPz2tMC3BaD9xIQ+FipQzuh+LFRmdHM3Xj/w0
 3GpB9WFhm4rJDyDn0Hyv3EORVaIhvg6X20BNeLoo1yR/1sHNJdmZnRjMNLaxvIbdWdiq
 9Ul7V+54Op9I3eBqrg2BjgVPZwwHJz3FDbbai1/S1Q8FMz2DFxwfiL05mzuWG+rEE41w
 KSALMtXNdrIcikV8Zm0H7NtynffOi1ou+J50BScG8OfXl9kneJUO270Ewu387HcE4zNV
 uKsvfzGp81ELM8JQ2Isu+RjMGQgtCDk6SnB8J5xkdtD5kSM/+s7RLxW+k+bQfNDPJ2Uq
 ufeQ==
X-Gm-Message-State: APjAAAXYRUjmsEVCzz3ZKqq3sm/shaxe62VF2Z/biRAvkocOEMK7M5qH
 1BpX9FTQEdwq6CpMh6wFiQpXoM5NjmEIWrkAYMSDCWYbssETevcXCnhKYa0fv4vy3ftLG9jtQHb
 +axIKS7QovvxX
X-Received: by 2002:a5d:538e:: with SMTP id d14mr849159wrv.86.1571870389982;
 Wed, 23 Oct 2019 15:39:49 -0700 (PDT)
X-Received: by 2002:a5d:538e:: with SMTP id d14mr849135wrv.86.1571870389796;
 Wed, 23 Oct 2019 15:39:49 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id q196sm1171454wme.23.2019.10.23.15.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 15:39:49 -0700 (PDT)
Subject: Re: [PATCH v3 08/33] serial: add "chardev" property
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5190425d-1246-3eaa-dcb7-84cc346a7102@redhat.com>
Date: Thu, 24 Oct 2019 00:39:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-9-marcandre.lureau@redhat.com>
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
X-TUID: 3/Zay2fv6I0D

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> This is more QOM-friendly, callers may set/get the property themself.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/serial.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 4af8b0ce4c..09e89727a6 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -34,6 +34,7 @@
>   #include "sysemu/runstate.h"
>   #include "qemu/error-report.h"
>   #include "trace.h"
> +#include "hw/qdev-properties.h"
>  =20
>   //#define DEBUG_SERIAL
>  =20
> @@ -988,7 +989,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
>  =20
>       s->irq =3D irq;
>       s->baudbase =3D baudbase;
> -    qemu_chr_fe_init(&s->chr, chr, &error_abort);
> +    qdev_prop_set_chr(dev, "chardev", chr);
>       serial_realize_core(s, &error_fatal);
>       qdev_set_legacy_instance_id(dev, base, 2);
>       qdev_init_nofail(dev);
> @@ -999,11 +1000,17 @@ SerialState *serial_init(int base, qemu_irq irq,=
 int baudbase,
>       return s;
>   }
>  =20
> +static Property serial_properties[] =3D {
> +    DEFINE_PROP_CHR("chardev", SerialState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void serial_class_init(ObjectClass *klass, void* data)
>   {
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
>       dc->vmsd =3D &vmstate_serial;
> +    dc->props =3D serial_properties;
>   }
>  =20
>   static const TypeInfo serial_info =3D {
> @@ -1064,7 +1071,7 @@ SerialState *serial_mm_init(MemoryRegion *address=
_space,
>       s->it_shift =3D it_shift;
>       s->irq =3D irq;
>       s->baudbase =3D baudbase;
> -    qemu_chr_fe_init(&s->chr, chr, &error_abort);
> +    qdev_prop_set_chr(dev, "chardev", chr);
>  =20
>       serial_realize_core(s, &error_fatal);
>       qdev_set_legacy_instance_id(dev, base, 2);
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
