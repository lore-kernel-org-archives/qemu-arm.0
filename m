Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1640038wrm;
        Wed, 9 Oct 2019 18:09:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0unk7M79D9g8Q3/n/QhpNZGEEmz0RWXI00ztKs10frKYIJgb3inGqtOe8GGftx9NsHclK
X-Received: by 2002:a05:620a:4c9:: with SMTP id 9mr6620268qks.243.1570669757040;
        Wed, 09 Oct 2019 18:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570669757; cv=none;
        d=google.com; s=arc-20160816;
        b=Vd+HibnFeSh63QUzpJBRi31fHWt72eumiAcBqtE1sbCpu+HrgEMlTx/E3rLD/iG3y8
         iaVMUl1K9ztcruuoJHbOxphsrAq0G6MDI5aUeRTZAddcyJ2jzzutmvbLiVB+xyepwgcV
         So1Vp/M6015pkTjPwVXVIsiCT1KTu6tRF5VqUF8Qi+6LcPA/JkZQCMwHRVLRDuBxNNBN
         H7WbzAJK5cyjGedGlWzr0RdoWtHd+6FTKa+Xf4MuWzTl7MXYpJg2oLflEQixXHpUrnb2
         s4ePwL1GxZnX50qddBTjOVKl7/L/ardMxAM9aeR6Cst4LR6pvO/8JmXbZMl0IE2RJlWy
         kR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cQgKqo4Zm+d2yvn/nXV1xi2A6NAmW83+V/vyQ+Oucws=;
        b=DQniR92EQvM/Slu9L071z8hVelCZ4HS34RoJGmrZi2Sk71KQhTlqLRxJ8o+A6wj3f9
         JcCU6IO//R7tA2LI5Bq/fU934dlySp7feZXLHFnNjjrJRcuMEWoD8B1MhymaKq4KEWvI
         59u1Mju76XMxwAhdUo9896MtaagZSioOSEIhfUv3xKHwWT9sCqKmUIadQxsP1LTFkhMq
         6++PqeI3zvY28AXURhuqE+4K8kgwRgd3UuXB/Y1B20D3nHVI6naxnB5HZHSz4AUEuu0P
         HEmQsUVp1tqDG7s5HDhxOgaeNvUrWHl8OrRnGneIQEENdiK5sFc9QCvE0e6wVQLL8geN
         s9ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ino9JGfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k63si3767227qkc.270.2019.10.09.18.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 18:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ino9JGfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIMxA-0004Rp-96
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 21:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1iIMwu-0004O2-9F
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 21:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1iIMws-00042T-WF
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 21:09:00 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41658)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1iIMwn-00040o-JO; Wed, 09 Oct 2019 21:08:53 -0400
Received: by mail-ot1-x342.google.com with SMTP id g13so3400546otp.8;
 Wed, 09 Oct 2019 18:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cQgKqo4Zm+d2yvn/nXV1xi2A6NAmW83+V/vyQ+Oucws=;
 b=Ino9JGfGZdJZfuvKy6iV1hJD2wn46PWx+YUb3Bd5zFzIzP2J1P/y12KVskBtIfcdTD
 wkglYPI5nK3PofEbDshRPO+O7mnqjyeQ7ptGg2sTDmoSKFxiG7KoEHJk+pj6hE6CozKA
 L1FZH7ZOfYBb0qEoqkCeYULejYSHrwJOltFqU3dNVrtRu95SkMPFQkyde3HaxFAyyUBO
 2KtDI/FFJBM9saK7kdOOZOA5RYjcvv11Z+esGmrVbfz5hj0jdPjBAnpznVHiOHsqfyCt
 6ItZBq2s6oS/UxSzXe05I8qo8TYucfeDUs20v6SNh1nJb+te2Ym4gGQLm7Ib6M44+MIN
 x2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cQgKqo4Zm+d2yvn/nXV1xi2A6NAmW83+V/vyQ+Oucws=;
 b=pag56Bi+dL2N26VXFP7F1ffG/Z7GroqjhENhoIo8TUIEw9jUA8osNBLFv/5kevFbJi
 W03bylrPG+f8KZJuCTID1W9qtWrl4pbm1uhzDLMkSkefRelc8K9zuqPUksOX/7A9WE3S
 VrP0i2W4xfmwa8aKeql76YzDq9ldfKeA59YUjV0qdK4iAnw14FakBHKnv5FeSD0FrM1t
 qLSr3WqY8iTOU23OZyzMtnsH1JmlVkefFOo3rzS/Mh+yuw4IfJ19WPSHsA0HxF04q/xR
 6KfCPNm888RTPPHxwI3R8V+3KC5Bmx0BLFuiV3k63N3PYLfp+LOdi/oDgJ1ZANkovvzU
 Jgpw==
X-Gm-Message-State: APjAAAVjpdOifuRdLDyE5dW6RkN5r1ZTzANtx18ZiRSfvZDvneqry2lz
 JBYMnp8IDbGKs3cpavnSLI9TIGDYVgahxRon1Ew=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr5538314otr.194.1570669732810; 
 Wed, 09 Oct 2019 18:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191008142539.7793-1-philmd@redhat.com>
 <20191008142539.7793-5-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-5-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 10 Oct 2019 09:08:16 +0800
Message-ID: <CAKXe6SJZfW450Jv-=62Y1=1sACsa7gFXuy01pRgOt3e__YsPBA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] hw/ide/sii3112: Convert reset handler to
 DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007bd5f30594840b57"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: SfmCVeg2M/3w

--0000000000007bd5f30594840b57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:32=E5=86=99=E9=81=
=93=EF=BC=9A

> The SiI3112A SATA controller is a PCI device, it will be reset
> when the PCI bus it stands on is reset.
>
> Convert its reset handler into a proper Device reset method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
>  hw/ide/sii3112.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 2181260531..06605d7af2 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -15,7 +15,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/ide/pci.h"
>  #include "qemu/module.h"
> -#include "sysemu/reset.h"
>  #include "trace.h"
>
>  #define TYPE_SII3112_PCI "sii3112"
> @@ -237,9 +236,9 @@ static void sii3112_set_irq(void *opaque, int channel=
,
> int level)
>      sii3112_update_irq(s);
>  }
>
> -static void sii3112_reset(void *opaque)
> +static void sii3112_reset(DeviceState *dev)
>  {
> -    SiI3112PCIState *s =3D opaque;
> +    SiI3112PCIState *s =3D SII3112_PCI(dev);
>      int i;
>
>      for (i =3D 0; i < 2; i++) {
> @@ -290,7 +289,6 @@ static void sii3112_pci_realize(PCIDevice *dev, Error
> **errp)
>          s->bmdma[i].bus =3D &s->bus[i];
>          ide_register_restart_cb(&s->bus[i]);
>      }
> -    qemu_register_reset(sii3112_reset, s);
>  }
>
>  static void sii3112_pci_class_init(ObjectClass *klass, void *data)
> @@ -303,6 +301,7 @@ static void sii3112_pci_class_init(ObjectClass *klass=
,
> void *data)
>      pd->class_id =3D PCI_CLASS_STORAGE_RAID;
>      pd->revision =3D 1;
>      pd->realize =3D sii3112_pci_realize;
> +    dc->reset =3D sii3112_reset;
>      dc->desc =3D "SiI3112A SATA controller";
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
> --
> 2.21.0
>
>
>

--0000000000007bd5f30594840b57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:32=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The SiI3112A SATA controller is a PCI device, it will be reset<br>
when the PCI bus it stands on is reset.<br>
<br>
Convert its reset handler into a proper Device reset method.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com"=
 target=3D"_blank">liq3ea@gmail.com</a>&gt;<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/ide/sii3112.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c<br>
index 2181260531..06605d7af2 100644<br>
--- a/hw/ide/sii3112.c<br>
+++ b/hw/ide/sii3112.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;hw/ide/pci.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
=C2=A0#define TYPE_SII3112_PCI &quot;sii3112&quot;<br>
@@ -237,9 +236,9 @@ static void sii3112_set_irq(void *opaque, int channel, =
int level)<br>
=C2=A0 =C2=A0 =C2=A0sii3112_update_irq(s);<br>
=C2=A0}<br>
<br>
-static void sii3112_reset(void *opaque)<br>
+static void sii3112_reset(DeviceState *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 SiI3112PCIState *s =3D opaque;<br>
+=C2=A0 =C2=A0 SiI3112PCIState *s =3D SII3112_PCI(dev);<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 2; i++) {<br>
@@ -290,7 +289,6 @@ static void sii3112_pci_realize(PCIDevice *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;bmdma[i].bus =3D &amp;s-&gt;bus[i];=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_register_restart_cb(&amp;s-&gt;bus[i]=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_register_reset(sii3112_reset, s);<br>
=C2=A0}<br>
<br>
=C2=A0static void sii3112_pci_class_init(ObjectClass *klass, void *data)<br=
>
@@ -303,6 +301,7 @@ static void sii3112_pci_class_init(ObjectClass *klass, =
void *data)<br>
=C2=A0 =C2=A0 =C2=A0pd-&gt;class_id =3D PCI_CLASS_STORAGE_RAID;<br>
=C2=A0 =C2=A0 =C2=A0pd-&gt;revision =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0pd-&gt;realize =3D sii3112_pci_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D sii3112_reset;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;SiI3112A SATA controller&quot;;<b=
r>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_STORAGE, dc-&gt;categories);<br=
>
=C2=A0}<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000007bd5f30594840b57--
