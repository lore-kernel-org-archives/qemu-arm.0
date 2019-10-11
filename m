Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp174836wrm;
        Thu, 10 Oct 2019 17:52:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrj+p/DRKi0Rr9aAn5WSl5MkAE7VsdE5Bu1jDjKHwm0o/9/Om9oer1YRX2bZqqqUbQuHnv
X-Received: by 2002:a17:906:556:: with SMTP id k22mr11080208eja.66.1570755131913;
        Thu, 10 Oct 2019 17:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570755131; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqHWObkJF1KECfZxDrfuS1pZ0QV98XsaoRglZ3rpzueLA1PURF3HSLNguQ5NF2CSgS
         I6ISpzlqmadE/XVDOh4BuiUMqnj5YNdTFkevpZIH4N0Y2SKg0A79OPQP9sdfrab0haDT
         Aw7PSR8x8fbyfNLYP6JxVNazDG/WdxiE8TggwNDz0VpOConpZOCSrBNbh6JcCbzaDMSs
         qKfKBFL1lniw9d3fPTo7KG/MYtIbFRsy9j+Bpqx62lCTDRmpoXAR5TnDC3YZ8VgGnv6z
         B8ucqdYeXrItiJrZTed/6SvM6Vcvvu7A4NrCGwIFmWNNUcApQ2O8VC8oCTLewDfjU2bo
         +Izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmnVA7cbTiWs7045i8nyYbdn5hb53ty4ft5sWASYB7o=;
        b=nLsxfu2B2H+5KiOd9EDenxIY3mNExIxH28wC1aWK/CZAd/bNAY1QLlPrkBu2MmIbeC
         6ZwtzyAtVu5IkRpgaFT6/wq9gjpOjSGHpEMzDwiEsQFCQPzy5YO+oko/MZ0M0khXmao5
         sLpY2pHgaNtED8QjpeCEZgj2d1FhxtJnRRRz8Avm4VRyzmxnm9Kdgv6uYcNC9Cv06AI5
         o+4EzDo/deLQa6JAEWXwLGwSBNtu757msBnAqGncFMcARwHhfVm2p5OPtaweufmv3Tdg
         18fssvkLFx6x61SDsNwbBDxUWVQZ0IicqkWBdUCelu39vv5g1p8fKnK16HXS5Wq1aXVn
         TdHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IPhBN8bv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si4085265eju.265.2019.10.10.17.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 17:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IPhBN8bv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIjAA-00035J-Qi
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 20:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1iIj9K-0002fv-Jv
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 20:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1iIj9J-0004ON-BM
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 20:51:18 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34850)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1iIj9B-0004EG-Kb; Thu, 10 Oct 2019 20:51:09 -0400
Received: by mail-oi1-x243.google.com with SMTP id x3so6603039oig.2;
 Thu, 10 Oct 2019 17:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kmnVA7cbTiWs7045i8nyYbdn5hb53ty4ft5sWASYB7o=;
 b=IPhBN8bvn0EY6lwYxK6Vq7TU2EAFymi3iYHpSn/e2xmiv77Nfkxu3hWinMIkHwRgBb
 kQnq2sfycJHi2iaE3LnOUwMPeyNhNBPC8vX36MtYpX/9wRL006MuYDGR1VJyZj6Iivdw
 dPiZHl8ZibUBcEgxSCO0jeHYrdnrRMI7ShFW4P2GVRMpDhvi07YaBs4/SVftubVr7BLY
 93KIj+nLfDXv7l45FO/gz9cO3kgqsJ1jaoLxh/lwRDqQZ36g+M+0cazJfDpXwB9azY8Z
 qnj8Ct7yxvz85/ICkJfwuNK+J5qqeX+8fj2R4UJHym70H4xm4DGF7e4DLmhdxVGtaybW
 NlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kmnVA7cbTiWs7045i8nyYbdn5hb53ty4ft5sWASYB7o=;
 b=TrBPhGZlv/xCVTBbTvxA+19AMrkwmPm5gXVMbwJTx9U0zUYm8Ok4BRsuS+q0a7hO5d
 jvdDqYl7pNRvQNbrFJ5ZdfSlT+P2pBSmHv2//WX4euHI9gHYk8AnjSPgRFbjAdaBuGYm
 VEQitP5wXNwjHrufGCvuyA/yXPqMuxIUNeSbGAjws/V39is81F3GBp85Vo8DYYJpViur
 mDhmZa0zH7XuGLsJb4g4mmGRM2+F6vIa/L1DFFjxCP2w3gvU1DjhFk3eksEATh6c1Tzy
 x7Lu4Bw6qwo/Jr8Y9BaA0dZ1vqPvXfD3BEjJLqgYAcNicd02H7bkYbDUcvcQXcanA5S1
 13wQ==
X-Gm-Message-State: APjAAAWUurJpmGHXBh8kCtCo3ZqqkXOswA1Q5W9LN7hGwJ+89gp1lIA5
 vZUlpnhtzNDLgvTFzXvlUjDUnQSdz/iUZkqPQaA=
X-Received: by 2002:aca:cd4d:: with SMTP id d74mr10242317oig.157.1570755068693; 
 Thu, 10 Oct 2019 17:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191010131527.32513-1-philmd@redhat.com>
 <20191010131527.32513-4-philmd@redhat.com>
In-Reply-To: <20191010131527.32513-4-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 11 Oct 2019 08:50:32 +0800
Message-ID: <CAKXe6SKEK4jzWimnxuWp-aVXYxgkqoPcZqAtJWSgFrSBzfnZpA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] hw/ide/piix: Convert reset handler to DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e61350059497e940"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Qemu Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BI/ySqCDCm+J

--000000000000e61350059497e940
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=889:16=E5=86=99=E9=81=
=93=EF=BC=9A

> The PIIX/IDE is a PCI device within a PIIX chipset, it will be reset
> when the PCI bus it stands on is reset.
>
> Convert its reset handler into a proper Device reset method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>


Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
> v3: Also convert PIIX4 (Li Qiang)
> ---
>  hw/ide/piix.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index fba6bc8bff..db313dd3b1 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -30,7 +30,6 @@
>  #include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "sysemu/dma.h"
> -#include "sysemu/reset.h"
>
>  #include "hw/ide/pci.h"
>  #include "trace.h"
> @@ -103,9 +102,9 @@ static void bmdma_setup_bar(PCIIDEState *d)
>      }
>  }
>
> -static void piix3_reset(void *opaque)
> +static void piix_ide_reset(DeviceState *dev)
>  {
> -    PCIIDEState *d =3D opaque;
> +    PCIIDEState *d =3D PCI_IDE(dev);
>      PCIDevice *pd =3D PCI_DEVICE(d);
>      uint8_t *pci_conf =3D pd->config;
>      int i;
> @@ -154,8 +153,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Erro=
r
> **errp)
>
>      pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode
>
> -    qemu_register_reset(piix3_reset, d);
> -
>      bmdma_setup_bar(d);
>      pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>
> @@ -247,6 +244,7 @@ static void piix3_ide_class_init(ObjectClass *klass,
> void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>
> +    dc->reset =3D piix_ide_reset;
>      k->realize =3D pci_piix_ide_realize;
>      k->exit =3D pci_piix_ide_exitfn;
>      k->vendor_id =3D PCI_VENDOR_ID_INTEL;
> @@ -273,6 +271,7 @@ static void piix4_ide_class_init(ObjectClass *klass,
> void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>
> +    dc->reset =3D piix_ide_reset;
>      k->realize =3D pci_piix_ide_realize;
>      k->exit =3D pci_piix_ide_exitfn;
>      k->vendor_id =3D PCI_VENDOR_ID_INTEL;
> --
> 2.21.0
>
>

--000000000000e61350059497e940
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=889:16=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The PIIX/IDE is a PCI device within a PIIX chipset, it will be reset<=
br>
when the PCI bus it stands on is reset.<br>
<br>
Convert its reset handler into a proper Device reset method.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div><br></div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@=
gmail.com">liq3ea@gmail.com</a>&gt;<br><div>=C2=A0<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
---<br>
v3: Also convert PIIX4 (Li Qiang)<br>
---<br>
=C2=A0hw/ide/piix.c | 9 ++++-----<br>
=C2=A01 file changed, 4 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/ide/piix.c b/hw/ide/piix.c<br>
index fba6bc8bff..db313dd3b1 100644<br>
--- a/hw/ide/piix.c<br>
+++ b/hw/ide/piix.c<br>
@@ -30,7 +30,6 @@<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;sysemu/blockdev.h&quot;<br>
=C2=A0#include &quot;sysemu/dma.h&quot;<br>
-#include &quot;sysemu/reset.h&quot;<br>
<br>
=C2=A0#include &quot;hw/ide/pci.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
@@ -103,9 +102,9 @@ static void bmdma_setup_bar(PCIIDEState *d)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void piix3_reset(void *opaque)<br>
+static void piix_ide_reset(DeviceState *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PCIIDEState *d =3D opaque;<br>
+=C2=A0 =C2=A0 PCIIDEState *d =3D PCI_IDE(dev);<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice *pd =3D PCI_DEVICE(d);<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *pci_conf =3D pd-&gt;config;<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -154,8 +153,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error =
**errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode<b=
r>
<br>
-=C2=A0 =C2=A0 qemu_register_reset(piix3_reset, d);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0bmdma_setup_bar(d);<br>
=C2=A0 =C2=A0 =C2=A0pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &am=
p;d-&gt;bmdma_bar);<br>
<br>
@@ -247,6 +244,7 @@ static void piix3_ide_class_init(ObjectClass *klass, vo=
id *data)<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D piix_ide_reset;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;realize =3D pci_piix_ide_realize;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;exit =3D pci_piix_ide_exitfn;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_INTEL;<br>
@@ -273,6 +271,7 @@ static void piix4_ide_class_init(ObjectClass *klass, vo=
id *data)<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D piix_ide_reset;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;realize =3D pci_piix_ide_realize;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;exit =3D pci_piix_ide_exitfn;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_INTEL;<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div></div>

--000000000000e61350059497e940--
