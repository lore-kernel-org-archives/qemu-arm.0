Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1642443wrm;
        Wed, 9 Oct 2019 18:11:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMguwujP8r/0XxLzwqGStBQKkbRnvtRGXtuD0TF6uDip59rbJPLqGNBcQyUVcZe4heXrGp
X-Received: by 2002:aa7:d90d:: with SMTP id a13mr5677138edr.2.1570669913960;
        Wed, 09 Oct 2019 18:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570669913; cv=none;
        d=google.com; s=arc-20160816;
        b=uN3XbdI1/CYEwUCeA8B5YXgRarheM6w2HSBOqohE7C2v+3PJ+jad4yWXAK3HwhiYk7
         HrN69ErE56ZpWFXHR6dvYfb+zwHTw5xsLgmetrEGoxRR/k87dtST4LkpbLsQL+hts341
         Pz2Jrx6McLSJyp0ucegl24zTbmw/g4J+3/Vkhu0QnIN8p319bNZ5oKSXy3KEFfz2kel4
         EsRf4gJkY6an7vw1Su+hbetTgNfj+Jc6ngs78A+aXIN84JaMSosszlnM1L3QCA/e4uCJ
         LuE5FObCg92VRF28JWX9yE+LF44QU03RZ5dbwB44nOSsFybEe9N79OAPYj4PcRSoJ9ag
         rzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgCuZRL1iytUlmLyo+VV4QeDefvrzVM1LT7oPicDtvY=;
        b=KbFjxDqE+2raW14pnLrM4thc/4JLepOBWzb18MUQwYQPhCGSFl9NDCiKywVS83Fc9Q
         gH1KecvI1FuqNunwHhBM5bZJpg95thyFv1kGukBLmk6kTkv/3FzZcYEB90Nov0EbkArP
         SmWIS1pWw7JKo7pRJQ5qBe8rTHyVXtwoXTky11RW0Cb8X3IvyBW8jqvC9fRRW6ueI505
         yPriKsxXKDUAfStPPRdQR2fWbxwLrF4/ywGGuDBCeckPf17guysTmPFM71KJOz4m2PIP
         34bisaQ4d3/KFnsRVLs2DiV3IbhZAMJ5/BPBQof6QwyM/0WSVtRxVLtHXW29NY0WDjE0
         Ot+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ULLEbZyE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ot6si2153890ejb.62.2019.10.09.18.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 18:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ULLEbZyE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIMzg-0005j7-JP
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 21:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1iIMzX-0005hF-QL
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 21:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1iIMzW-0004qH-Ga
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 21:11:43 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41677)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1iIMzR-0004pL-BW; Wed, 09 Oct 2019 21:11:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id g13so3404866otp.8;
 Wed, 09 Oct 2019 18:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hgCuZRL1iytUlmLyo+VV4QeDefvrzVM1LT7oPicDtvY=;
 b=ULLEbZyECT+hWsyCIJ88qsenyUXn2HAQFsUsblZGplOehTeunyOgZSSpk7Y+uVLk5I
 C28UANTITB4vtM1/AqxOryyvDJGSGPdUW9SvYubG6f2tQ7cBwLVsttgwaUiXaIw9MIcN
 tuuv2WhtSyQ7YNo58uVBVZGaYKkSwm7YMLH54VbiOrobDOQsPt8HjwKzrLoChWdyZqU6
 ONcPJvw+u2T0fsvpTNWulBMtfBIoE7InTVcKtwhyqFp8kh9qF7fNa4haTZ0onik/T+dj
 FoWCZ6oFpmSd2bpmvXebb+OpWbqZOJgg9/Qr/eQeiedCVzQVa/x/WlMy+5mEXGtFEm/A
 H5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hgCuZRL1iytUlmLyo+VV4QeDefvrzVM1LT7oPicDtvY=;
 b=SdNqfpsuJuN93G44sLW9puOxnjnprE/mtGmWHqsCNQu2gPk72CTNVoHnS1CMyuZqT+
 bPUzEtHPR/RPCqU0OswMkUgJHBX2mmXmCISCPRjuX1knZacnhppmV4/SYztnOx245kxt
 F7eyscjVRenM34iUUZ5BiqbPnNyah8H6He7KZQhHJrUhNX5jectNbGpZYIe5CONocco+
 FFbJet0XLDD1cjtB3bh47WQlS5395ZnjkLbKV8JskiY8/XK6Q5LVmTQ9HzSTLpWCEyWB
 RhPacAQ+hP1uToV4MKyvQIPuvQWAcq3ikkk6BzU2tEAR6WfF7Cl/aHT/fIIupf+n4UgI
 Kp1w==
X-Gm-Message-State: APjAAAV3Fn1zr/rGZREPkA0+y2DjGJwdsb+6s3Q7XaOX6Unc/nBIRFaL
 ZYJK343oEh3G9OgfkeT808LubW4krxLcuHMv41Y=
X-Received: by 2002:a9d:6d11:: with SMTP id o17mr2302464otp.333.1570669896283; 
 Wed, 09 Oct 2019 18:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191008142539.7793-1-philmd@redhat.com>
 <20191008142539.7793-6-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-6-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 10 Oct 2019 09:10:59 +0800
Message-ID: <CAKXe6SLKroySEwOEasUQt0FNEgok-Upeb_aBop_Enrae7O1fTg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/ide/via82c: Convert reset handler to DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003a3ac305948415ad"
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
X-TUID: slp8T4YZvDwC

--0000000000003a3ac305948415ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:36=E5=86=99=E9=81=
=93=EF=BC=9A

> The VIA82C686B IDE controller is a PCI device, it will be reset
> when the PCI bus it stands on is reset.
>
> Convert its reset handler into a proper Device reset method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
>  hw/ide/via.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 7087dc676e..053622bd82 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -29,7 +29,6 @@
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
>  #include "sysemu/dma.h"
> -#include "sysemu/reset.h"
>
>  #include "hw/ide/pci.h"
>  #include "trace.h"
> @@ -120,10 +119,10 @@ static void via_ide_set_irq(void *opaque, int n, in=
t
> level)
>      }
>  }
>
> -static void via_ide_reset(void *opaque)
> +static void via_ide_reset(DeviceState *dev)
>  {
> -    PCIIDEState *d =3D opaque;
> -    PCIDevice *pd =3D PCI_DEVICE(d);
> +    PCIIDEState *d =3D PCI_IDE(dev);
> +    PCIDevice *pd =3D PCI_DEVICE(dev);
>      uint8_t *pci_conf =3D pd->config;
>      int i;
>
> @@ -172,8 +171,6 @@ static void via_ide_realize(PCIDevice *dev, Error
> **errp)
>      pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
>      dev->wmask[PCI_INTERRUPT_LINE] =3D 0xf;
>
> -    qemu_register_reset(via_ide_reset, d);
> -
>      memory_region_init_io(&d->data_bar[0], OBJECT(d),
> &pci_ide_data_le_ops,
>                            &d->bus[0], "via-ide0-data", 8);
>      pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0])=
;
> @@ -229,6 +226,7 @@ static void via_ide_class_init(ObjectClass *klass,
> void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>
> +    dc->reset =3D via_ide_reset;
>      k->realize =3D via_ide_realize;
>      k->exit =3D via_ide_exitfn;
>      k->vendor_id =3D PCI_VENDOR_ID_VIA;
> --
> 2.21.0
>
>
>

--0000000000003a3ac305948415ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:36=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The VIA82C686B IDE controller is a PCI device, it will be reset<br>
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
=C2=A0hw/ide/via.c | 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/hw/ide/via.c b/hw/ide/via.c<br>
index 7087dc676e..053622bd82 100644<br>
--- a/hw/ide/via.c<br>
+++ b/hw/ide/via.c<br>
@@ -29,7 +29,6 @@<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;sysemu/dma.h&quot;<br>
-#include &quot;sysemu/reset.h&quot;<br>
<br>
=C2=A0#include &quot;hw/ide/pci.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
@@ -120,10 +119,10 @@ static void via_ide_set_irq(void *opaque, int n, int =
level)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void via_ide_reset(void *opaque)<br>
+static void via_ide_reset(DeviceState *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PCIIDEState *d =3D opaque;<br>
-=C2=A0 =C2=A0 PCIDevice *pd =3D PCI_DEVICE(d);<br>
+=C2=A0 =C2=A0 PCIIDEState *d =3D PCI_IDE(dev);<br>
+=C2=A0 =C2=A0 PCIDevice *pd =3D PCI_DEVICE(dev);<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *pci_conf =3D pd-&gt;config;<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
@@ -172,8 +171,6 @@ static void via_ide_realize(PCIDevice *dev, Error **err=
p)<br>
=C2=A0 =C2=A0 =C2=A0pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0=
);<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;wmask[PCI_INTERRUPT_LINE] =3D 0xf;<br>
<br>
-=C2=A0 =C2=A0 qemu_register_reset(via_ide_reset, d);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;d-&gt;data_bar[0], OBJECT(d)=
, &amp;pci_ide_data_le_ops,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;d-&gt;bus[0], &quot;via-ide0-data&quot;, 8);<b=
r>
=C2=A0 =C2=A0 =C2=A0pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &am=
p;d-&gt;data_bar[0]);<br>
@@ -229,6 +226,7 @@ static void via_ide_class_init(ObjectClass *klass, void=
 *data)<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D via_ide_reset;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;realize =3D via_ide_realize;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;exit =3D via_ide_exitfn;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_VIA;<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000003a3ac305948415ad--
