Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1405027wrm;
        Wed, 9 Oct 2019 13:42:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEepJAr/KXmot7M8N0rcgCOKrsme5RuaOAIWpYvf4osPvwzM1XxtavgkJ/8enU0kmTBE8u
X-Received: by 2002:a1c:bc07:: with SMTP id m7mr4142748wmf.117.1570653769320;
        Wed, 09 Oct 2019 13:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570653769; cv=none;
        d=google.com; s=arc-20160816;
        b=AZZxL/rBhO2pUjlGr574BmCEGd5HqvYOW1/yNXqmoPA3tvuq5duk/h+vbI8eoaD7+J
         mFv5gNlXoJPuIDS4FYGqG7FufQi0MkVXIUxxvLDXY1AMH8ioG2oKk+ip2RKKWJdurvi0
         HgC2tHqfp6pIXqQ0s7t1wtYZR9RwQKkWFjualORMV9qr0WrIR/I6DuIG1rt/P0j+1Hk/
         js1AnNLDWrscffxUDqkowqT9XixNOIX7gZ2d4rautBZzXSTQ7Pw7zEieXJmUknsC9eb9
         Nem/5XEZsXENgLDEkz1FGzQEtHT9uh8dg8364rMidTxv5HzaYJSPOXFjyMi8j58JoIyT
         Q9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date;
        bh=fuq5o3gcGDr/qBxsQ6XZi6SLUN1v+DGhxRDaaIx+oGc=;
        b=rgMUsllkewQzkDRUKjdF7faTIoAxpUc+QzQKFJm1kHufIOz9hAuES6D7L0WoK+Ygsl
         6FQsr8Vm057TpxJm+PkRU99xMRoydll4AtxUnZnJyarzCKmaM+xNxqGZpLO4XTP1BOYJ
         sw/qpgw4boPVnlR6eNmNiASMkNDry+Rj3RVAMPP/R5+zzUebkJDvDmTa6Kq1wGpdCNy8
         HNJlF4nKO1lBTej4f3qC3EsasAzpnXeAqkOn9leC+HHsw97rM1v3cX7ZbeA8grir9axs
         sBwojFR0BBoMu8A4DlycQGgu8RLLFkOkkjCvfsI74GSr088Q69kWvAtTWeW5OCOb8t1I
         mqdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j35si2191623eda.144.2019.10.09.13.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 13:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIInI-0002NU-Dc
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 16:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iIHT9-0002jH-VG
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 15:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iIHT7-0006gZ-NI
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 15:17:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45526)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iIHT7-0006g2-Bn
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 15:17:53 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C1DB2CE95A
 for <qemu-arm@nongnu.org>; Wed,  9 Oct 2019 19:17:52 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id r15so3139922qtn.12
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 12:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5Z1lbJyLmfkG493rnJvBSTwZ4AJSxGiXUH6MwWMjsvA=;
 b=cFrOW3rUpyKqO4RAG+a1ZPQ9z1GZqTxW+LXkegBHAEeatqGlbBvzehpOcoTEChalAi
 WjFYEGsDleZ+dPxfQwj+4U18hycp2sIxUQrmQt9Vr3lLxs2J7Gr5S8WsNrPKdLCmjSMZ
 wsJ2gMIgVwOIVNm71Sp3dO47jGRb1YctAoTYaHbkPIbq9NzvmFT20sVB0kwPoWN+1yks
 WYfc9QZjV4ZbC+oFUxB8IbK5ufbw554KWvgDbeau6P2zkV/YS8C9SeI4qRmw54Qt+H9T
 dgfOxgYUdNjpP7y2CPy46TRbCTE7ymitpJEf0i/LhBebk23X7A4UCQvjlCBYb6eoCbeu
 q6dg==
X-Gm-Message-State: APjAAAXKrLE7rsl66JZptXfAfGRZluREPZqVQxEl//9JcpRkvw28ZdcL
 eOrXq2Op/okGzXXljF13Me596rC2Ig9ZsOSc615wW0JOl7kqG3ZpILrbF5n89lWjgJbZFf1wx/0
 1kLgDO8l05Q0v
X-Received: by 2002:a0c:8964:: with SMTP id 33mr2135279qvq.241.1570648671491; 
 Wed, 09 Oct 2019 12:17:51 -0700 (PDT)
X-Received: by 2002:a0c:8964:: with SMTP id 33mr2135250qvq.241.1570648671239; 
 Wed, 09 Oct 2019 12:17:51 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 139sm1418694qkf.14.2019.10.09.12.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 12:17:50 -0700 (PDT)
Date: Wed, 9 Oct 2019 15:17:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/8] hw/acpi/piix4: Convert reset handler to DeviceReset
Message-ID: <20191009151638-mutt-send-email-mst@kernel.org>
References: <20191008142539.7793-1-philmd@redhat.com>
 <20191008142539.7793-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20191008142539.7793-2-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ki1GIyUtiBFF

On Tue, Oct 08, 2019 at 04:25:32PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The PIIX4/PM is a PCI device within the PIIX4 chipset, it will be reset
> when the PCI bus it stands on is reset.
>=20
> Convert its reset handler into a proper Device reset method.
>=20
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to take through the misc tree.


> ---
>  hw/acpi/piix4.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 5742c3df87..4e079b39bd 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -27,7 +27,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/acpi/acpi.h"
> -#include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "qapi/error.h"
> @@ -344,9 +343,9 @@ static const VMStateDescription vmstate_acpi =3D {
>      }
>  };
> =20
> -static void piix4_reset(void *opaque)
> +static void piix4_pm_reset(DeviceState *dev)
>  {
> -    PIIX4PMState *s =3D opaque;
> +    PIIX4PMState *s =3D PIIX4_PM(dev);
>      PCIDevice *d =3D PCI_DEVICE(s);
>      uint8_t *pci_conf =3D d->config;
> =20
> @@ -542,7 +541,6 @@ static void piix4_pm_realize(PCIDevice *dev, Error =
**errp)
> =20
>      s->machine_ready.notify =3D piix4_pm_machine_ready;
>      qemu_add_machine_init_done_notifier(&s->machine_ready);
> -    qemu_register_reset(piix4_reset, s);
> =20
>      piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
>                                     pci_get_bus(dev), s);
> @@ -692,6 +690,7 @@ static void piix4_pm_class_init(ObjectClass *klass,=
 void *data)
>      k->device_id =3D PCI_DEVICE_ID_INTEL_82371AB_3;
>      k->revision =3D 0x03;
>      k->class_id =3D PCI_CLASS_BRIDGE_OTHER;
> +    dc->reset =3D piix4_pm_reset;
>      dc->desc =3D "PM";
>      dc->vmsd =3D &vmstate_acpi;
>      dc->props =3D piix4_pm_properties;
> --=20
> 2.21.0
