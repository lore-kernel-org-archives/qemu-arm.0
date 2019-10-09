Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp295302wrm;
        Tue, 8 Oct 2019 18:04:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXl8z36lSOVS/rmjypsQ08mBM0UUlQjhBUlZ/MgMw9cJQgU64/f0JwXLdxtG9nZMmvbXoC
X-Received: by 2002:a17:906:264f:: with SMTP id i15mr483586ejc.333.1570583061533;
        Tue, 08 Oct 2019 18:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570583061; cv=none;
        d=google.com; s=arc-20160816;
        b=LC65kcmIW2QEjUNWDmVAVDtyrV+MURUHzkjKU40zY1mRfN+zpJGG7Ph8Vz66Sm5gwl
         WErCKMZoWoIDKBv4BaBp7pSvuOptSv3E6SZg9UyMeI1qJfQiWd8KE6ERMwoUX4052j9R
         s3oSlPcev0/ogSfQzp/O7wxTefWYacNKvNe6+shfQ6hpnV+YFGBb2hrqYwX6VMDaQz5L
         j68RmWaIJa9kO94Im7yE0FSNqjZGkGCfCqTVfiomi/+DkegSu8LJgp5pG9zauNFlGJ2d
         5+Ol90l5SXKl6O35NkvmG+m+hzkcX6on22/+xwVEqZ2uVazNzyfnthZVtqBOEmcCxBQE
         sHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/hei9vG/efFXI+czAbVE3I8ab8+OB/M64B4C7RIwuok=;
        b=D+HH/rd/xFPDFDZzKO9CXxFOoBcVD+yDmjBA49CJSHP9n3Uutqs5EUVYgNjUpcSYvQ
         JINNeXQa+8eBvs9TuS9sV+QyL6WWazqaVjlD5hr3Ptu9Q5h9wuy54TH8G9LhWNSHyDTs
         L+P4uymiQq9JlW3CUA3TwqXq+SqTa8vrWCoMsaZiGy9usJd8hPcDanUFOHjMCV/9jMLx
         f5GHdvXrxLlTGpkuhnSJf/Hv9wtVceyhD1UR75r1GjspdYxs1mkR+GxLNWFjhQKT++Gp
         ul1RMPfAk/YqcZWYNRX5g/IoGa8SXNnIMZB2+OZzu40D4wq8JNBxzpcixCv+O6d4xAkN
         CvNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j6CLS1BG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28si485401edb.162.2019.10.08.18.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 18:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j6CLS1BG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iI0Oq-0006tD-Db
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 21:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1iI0Nw-0006qC-RZ
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1iI0Nv-00077c-H1
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:03:24 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:32949)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1iI0Nv-00077P-9J; Tue, 08 Oct 2019 21:03:23 -0400
Received: by mail-oi1-x243.google.com with SMTP id a15so378656oic.0;
 Tue, 08 Oct 2019 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/hei9vG/efFXI+czAbVE3I8ab8+OB/M64B4C7RIwuok=;
 b=j6CLS1BG3aEvwGtLuks3ok3Um1pxhIU/0oKQsyi64vZbT3lkmuPJPpup9SofcGoue8
 DfbPNwosKHTw2JO8KTlLBUQpOr8xz4M1gP1z86nl+gAdppgOT/LKmgIKRk4XRs/vTyxK
 t+BMV+w442Qsoec4E4v4jCgngc8PCuFJRSu1a1V9t+4FyijWeq28pDXITPtD8OvhjjVK
 GA0h4xgd+w+/1hfFQS49qDaUAXE+stOaiG4y2S6FV4NxLjBJhO2gDtVoETk87Jbbh4s2
 3FHph7NnxQPizjlsvOL6+gzMreqNeVNp5E660rwbpgBom9HjezP07vXrWjGwlNmyvHbA
 yiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/hei9vG/efFXI+czAbVE3I8ab8+OB/M64B4C7RIwuok=;
 b=WP3L+EPYqIZe+rhrNRpWplXKYY8RjFw3E6gSLyYTLnqO36VEj/ffPkFyum0o2dCBQd
 0c0GlLRBDeSFs+nTW6KgeRZQP2qsm1FChltSWHQ+trN2zEOzjSyqN2R86gVbtiAGfr3J
 wXeVP0cih5zv/2hvh2hhzTgL3tONGk7Qylgg7zBVZVTkrtH4+bLODh5XfgNeYzJ8FX7d
 sUgjbGTAThRvpUWSY4TilOA26DBL/Nivg4t3XXFNesVp0vDt0Fl3wVmHdXCmYYWlxClw
 GLJ2HBHr9Q8Yf8esllwsgTNQG1uCSt8z4y8TFdTGU4gDlH7v6BvRWo7YG74urLhL9clp
 LVUw==
X-Gm-Message-State: APjAAAWLgh94IX9X/vXzyb2Xvh7XbA9AGPjNuIB3kZJFOKqdndNlzPz6
 /MfyVWyBOTRxBisz0Q2LSOTPHLm2A5en8xWHW+A=
X-Received: by 2002:a54:4602:: with SMTP id p2mr356903oip.150.1570583002556;
 Tue, 08 Oct 2019 18:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191008142539.7793-1-philmd@redhat.com>
 <20191008142539.7793-3-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-3-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 9 Oct 2019 09:02:46 +0800
Message-ID: <CAKXe6SJ7VuE3ShiE6N7NDDXWKULhK2d3CoWhxGvjbPSrWr8bfQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] hw/isa/piix4: Convert reset handler to DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f52cb905946fd9e5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Qemu Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/4c0unYTRe7

--000000000000f52cb905946fd9e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:49=E5=86=99=E9=81=
=93=EF=BC=9A

> The PIIX4/ISA is a PCI device within the PIIX4 chipset, it will be reset
> when the PCI bus it stands on is reset.
>
> Convert its reset handler into a proper Device reset method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>



> ---
>  hw/isa/piix4.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 3294056cd5..890d999abf 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -28,7 +28,6 @@
>  #include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> -#include "sysemu/reset.h"
>
>  PCIDevice *piix4_dev;
>
> @@ -40,9 +39,9 @@ typedef struct PIIX4State {
>  #define PIIX4_PCI_DEVICE(obj) \
>      OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
>
> -static void piix4_reset(void *opaque)
> +static void piix4_isa_reset(DeviceState *dev)
>  {
> -    PIIX4State *d =3D opaque;
> +    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
>      uint8_t *pci_conf =3D d->dev.config;
>
>      pci_conf[0x04] =3D 0x07; // master, memory and I/O
> @@ -97,7 +96,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>          return;
>      }
>      piix4_dev =3D &d->dev;
> -    qemu_register_reset(piix4_reset, d);
>  }
>
>  int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
> @@ -118,6 +116,7 @@ static void piix4_class_init(ObjectClass *klass, void
> *data)
>      k->vendor_id =3D PCI_VENDOR_ID_INTEL;
>      k->device_id =3D PCI_DEVICE_ID_INTEL_82371AB_0;
>      k->class_id =3D PCI_CLASS_BRIDGE_ISA;
> +    dc->reset =3D piix4_isa_reset;
>      dc->desc =3D "ISA bridge";
>      dc->vmsd =3D &vmstate_piix4;
>      /*
> --
> 2.21.0
>
>
>

--000000000000f52cb905946fd9e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:49=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The PIIX4/ISA is a PCI device within the PIIX4 chipset, it will be re=
set<br>
when the PCI bus it stands on is reset.<br>
<br>
Convert its reset handler into a proper Device reset method.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com"=
 target=3D"_blank">liq3ea@gmail.com</a>&gt;<div class=3D"gmail-yj6qo gmail-=
ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px 0px">=
<br class=3D"gmail-Apple-interchange-newline"></div></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/isa/piix4.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 3294056cd5..890d999abf 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -28,7 +28,6 @@<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
-#include &quot;sysemu/reset.h&quot;<br>
<br>
=C2=A0PCIDevice *piix4_dev;<br>
<br>
@@ -40,9 +39,9 @@ typedef struct PIIX4State {<br>
=C2=A0#define PIIX4_PCI_DEVICE(obj) \<br>
=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)<=
br>
<br>
-static void piix4_reset(void *opaque)<br>
+static void piix4_isa_reset(DeviceState *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PIIX4State *d =3D opaque;<br>
+=C2=A0 =C2=A0 PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *pci_conf =3D d-&gt;dev.config;<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x04] =3D 0x07; // master, memory and I/O<br>
@@ -97,7 +96,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D &amp;d-&gt;dev;<br>
-=C2=A0 =C2=A0 qemu_register_reset(piix4_reset, d);<br>
=C2=A0}<br>
<br>
=C2=A0int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)<br>
@@ -118,6 +116,7 @@ static void piix4_class_init(ObjectClass *klass, void *=
data)<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_INTEL;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_INTEL_82371AB_0;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;class_id =3D PCI_CLASS_BRIDGE_ISA;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D piix4_isa_reset;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;ISA bridge&quot;;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_piix4;<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000f52cb905946fd9e5--
