Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp300111wrm;
        Tue, 8 Oct 2019 18:09:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwaNX0Iun8zq0bsbOkKrAOOj6tIuvYoFAeI7o1AY8d0FKC+zCKWnp3QBxQ+qAH4vkvwzMB9
X-Received: by 2002:a17:906:6bcd:: with SMTP id t13mr500615ejs.133.1570583370298;
        Tue, 08 Oct 2019 18:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570583370; cv=none;
        d=google.com; s=arc-20160816;
        b=qlhERXOA/dQ8n5szHfdmE/rtzGBD2jhZuJI1fsX34d4vsvIwW81CZnIDqVD/8B7U/F
         Zzl6XPnhuVSFHI/YeYeim0qa2wT28QVyIdXpfP6SNqEPa9pSU/l82hkRlfhVP1fk1vg/
         kGOC4xR8wgCvqehh4vvvrYy2lOhIZzCYRYji0SThDdUstx4ncYBDhddUJSxQcEc+xNsE
         lRLlHepb4gmBdUzxwyn/w2GD1SXdjJmI7Cl0jFx3Fdog4TR3BZkQpRc17pE3qzsbg/sN
         huz1t3psc11secW0haMHC01ZQLyAui/PK4Nnvd0LULMg1DVG3u363nJRK03Xf9NdVwiN
         o+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qa0hiKGQ1LdAXEe+gYjM+shYjUAw3dBrIwlAh0NC/L4=;
        b=jMuAKcDLlGJz9VOoOS/Hhw9ZGeTDSC3y5Uaphpn4AmRCc1f/vYhE/xVePzjwWX8Z7i
         e2kMyLo3Qk6bWJ6bT3hiLIOK4Zj5E31ekTuCNzxrhcDBsHBZ8rJ/WZEH1eAE8QhUsFHq
         dN7yk7QZY9DMqYRfwgZUA4eTsHNYxKR/xaOIprmLy+xyvPJioXZlfyIgvDSJXExplyR1
         wI6GTRjFSi2NEHt8jwMcAmmf7rnNP5EZw3+l+6XDZgdwpReCgEctkm4NBVGro3xugdGd
         rgfb530jjCo6QEbLxj0w41bfJ2i92wR8YeTQ8qp+RJAP38FgJ55olIHJLwSx9SaKKmYB
         qn2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JD4dGOD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si331254eji.152.2019.10.08.18.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 18:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JD4dGOD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iI0Tp-0001ax-03
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 21:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1iI0TQ-0001Y7-AY
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:09:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1iI0TO-00019h-Gi
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:09:04 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1iI0TH-00012W-Tl; Tue, 08 Oct 2019 21:08:56 -0400
Received: by mail-oi1-x243.google.com with SMTP id i16so371395oie.4;
 Tue, 08 Oct 2019 18:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qa0hiKGQ1LdAXEe+gYjM+shYjUAw3dBrIwlAh0NC/L4=;
 b=JD4dGOD2QT2lhijBCyN6zEg/oE0zUOGa3vJb5lSgdbP0V4XFUv3riGK0iRyoNiVKwb
 xFQgjI9H+V1Xs+ECjbTyRoQ4tVnQ862mUj9S3Ommg2mtO9DuihJ9rnYMNbTAVXl8SaUR
 ljX43we1z68IE3YQi2msRO5rdRbYGnUB6hifgonpTx5eN/5Q07vFUYwiYqe7RNHzAcUR
 2zTRo7RKUZgH3OAFkpKopb5Z67ZaVSSd+0ja4J7KDXyKlMamhy1KisSfFGej3ZGhiFVu
 iZdO3XIhbwVKMRWVk5S1ZdeCZSPpntbDzMDaaV0knG4DxoBRhszNo8GJymw84PBbVoqo
 U4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qa0hiKGQ1LdAXEe+gYjM+shYjUAw3dBrIwlAh0NC/L4=;
 b=p3WWGzLBO0Uxbir+ymJj56YJDCWWuRfoEZUTnDFlme7F+SIUFJbDFYSwX21WZlKBKV
 YxP0sTnmzfSg9O2DbT9SjY1aWYOGLgvK9Mspow3SrTLqFyQnglt3kQ6V7bvpGpcRT8m+
 jlPcc0TxdBhCfsNzEtnjbPtxYVCXLyDp2M4s9CkG4SgB7BDB1JLcuGchULCvNcqzQGBR
 PdayB3li/0B2wrLWSJqthJoSaRtHxmWIgI/6BuKVIpvJhy9juw5R7nsAWBeO1wNytitl
 uDJ1RuOAz5PB/GnFdJsirSJSYGYoPmsWLdessRcCr+FcRfRH3IAkD22/sVIgvR6x6VyB
 gFvg==
X-Gm-Message-State: APjAAAWmMAlkyLsffe2zRjLI28SbKsJszgr9bMizhq9OwkJu2KMDXr2p
 cfJEOJz/3GA4bJtwXDAehVQE4gBiV4yTlcFVKl4=
X-Received: by 2002:aca:f1d7:: with SMTP id p206mr377192oih.97.1570583335172; 
 Tue, 08 Oct 2019 18:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191008142539.7793-1-philmd@redhat.com>
 <20191008142539.7793-4-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-4-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 9 Oct 2019 09:08:18 +0800
Message-ID: <CAKXe6SJae07AS4OGaBt-WJoxCRpxZNGrOhfy1r68BfGK6wE5xQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] hw/ide/piix: Convert reset handler to DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c87f7505946fedef"
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
 Qemu Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Tb19BZp7ym5

--000000000000c87f7505946fedef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:32=E5=86=99=E9=81=
=93=EF=BC=9A

> The PIIX3/IDE is a PCI device within the PIIX3 chipset, it will be reset
> when the PCI bus it stands on is reset.
>
> Convert its reset handler into a proper Device reset method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/ide/piix.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index fba6bc8bff..18b2c3b722 100644
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
> +static void piix3_ide_reset(DeviceState *dev)
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
> +    dc->reset =3D piix3_ide_reset;
>      k->realize =3D pci_piix_ide_realize;
>      k->exit =3D pci_piix_ide_exitfn;
>      k->vendor_id =3D PCI_VENDOR_ID_INTEL;
> --
>


Shouldn't we also add the reset callback for piix4 ide device?

Thanks,
Li Qiang



> 2.21.0
>
>
>

--000000000000c87f7505946fedef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:32=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The PIIX3/IDE is a PCI device within the PIIX3 chipset, it will be re=
set<br>
when the PCI bus it stands on is reset.<br>
<br>
Convert its reset handler into a proper Device reset method.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/ide/piix.c | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/ide/piix.c b/hw/ide/piix.c<br>
index fba6bc8bff..18b2c3b722 100644<br>
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
+static void piix3_ide_reset(DeviceState *dev)<br>
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
+=C2=A0 =C2=A0 dc-&gt;reset =3D piix3_ide_reset;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;realize =3D pci_piix_ide_realize;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;exit =3D pci_piix_ide_exitfn;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_INTEL;<br>
-- <br></blockquote><div><br></div><div><br></div><div>Shouldn&#39;t we als=
o add the reset callback for piix4 ide device?</div><div><br></div><div>Tha=
nks,</div><div>Li Qiang</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000c87f7505946fedef--
