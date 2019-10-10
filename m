Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1643560wrm;
        Wed, 9 Oct 2019 18:13:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw96z1RT5BMFvgk6fRScFU2J1AE6qKJIqKn52mj7fVnx7ocs6m/4qI4h5Y2WoP4zYkKjyhe
X-Received: by 2002:a17:906:2961:: with SMTP id x1mr5550550ejd.91.1570669991973;
        Wed, 09 Oct 2019 18:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570669991; cv=none;
        d=google.com; s=arc-20160816;
        b=HiSvUECf8ho2Np+BvU9UjAgjuYECi2H8OoQeT92y2mookr+YgQPFxorjF3/gLay0tm
         sWX7IgzfOt/sz45TMWgA8ieJhaP99F3uxKxnGTJq6iESLUWVZ6Fl4jAkOsWnn4V3ZHup
         lwJ3mubM1Icn5UadNrLYe2pk1u5GGB4YBnPmoL65TgdpHmohvdowKvSJE5ZJ4gUrfweu
         q+GXK+M827VrEQ0QnK5TEiTNsyteggQKE666xNqNyJ/OBqPdBldzL1hK5XnlvOmqXMPX
         iJXc/lDxHBCk9Shh2AxirKqj81lb2uvpxqqu4zBhfwpaz/OE3R3YtF61EZvU2U0RNMK0
         MTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kae0VhOmiaTOgO4PffjIZC9BUvc3e3RmbDVH1bwemv4=;
        b=Kc9kTNM3hV58JtXXSg/slzy++iBsu890hRj/v0IMvTrmzq+4ocnw1SrZrAKZsJLTPp
         g059sZ6e6JFO4ZGBQyHEXM9mBxZBE3+Q2/Jc/Mq9/KZMfqRY/J+Si7DpEDF+2gdGg1px
         U72GSfndNxL0OMgNKYejUJbzdXLMbmL4OUep3Qt7g7XRlquV8WpOTlVcebhDg1umpU7L
         SNeTtYzeTUWCJPGUI7het5i79bfgFW+DEok5ggLBjva/E9wMA2JSH5TjetC8s4f+3A0w
         3IR2gKBIxbt+bWk1dyCl02Kw+oBe+E9cj8VSUGXlWmygVMJOMYCTr/c3RYLiok4N3I8s
         u3bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=am4Z2fQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si2289063edb.420.2019.10.09.18.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 18:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=am4Z2fQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIN0w-00070f-Sf
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 21:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1iIN0n-0006vV-6D
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 21:13:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1iIN0l-00058l-Vx
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 21:13:01 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44148)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1iIN0g-00057m-Nf; Wed, 09 Oct 2019 21:12:54 -0400
Received: by mail-oi1-x243.google.com with SMTP id w6so3428303oie.11;
 Wed, 09 Oct 2019 18:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kae0VhOmiaTOgO4PffjIZC9BUvc3e3RmbDVH1bwemv4=;
 b=am4Z2fQFtRm42oU5TkmaE+NCOKEcNtM2FP17TiRtPKDGj+gmUA5KM3PE9TEvPyG51c
 afVkQXz+N0atr3JjXz1I+gzxKk5BFq8efDNzFSgrkkCGFEnLszli5canxjUc24gi55N2
 DudsyOQ/UFJVB0cmzscvZTv/VV6xAOJ9rfLf4pV2O3zQKoKyd8RyXJOkbVF30SVouknF
 h7mOj1eI9aU/2rGCoLqLNsQTwfZ8jctJOan5Qd/VgHAuqj0LhR6gLptNavarzzI+sHH+
 y74okCdlqghSE0JAx/e1Z9CB1vuHOXDc55EXQT4p/Tvg0nsu3WGc8uUDrHORwOAXPeaD
 jFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kae0VhOmiaTOgO4PffjIZC9BUvc3e3RmbDVH1bwemv4=;
 b=PZ3L13kAss7Mx3eMvAwMrI6pwVCvm1MYc3RdXgkQ3vSoSiQs0/c3SlMw/5x7/3efhw
 rU2GHnYZV14zOtbwEgo6+C/aOCxuSNeTUKYl4ELayK1A3wEdobDlovG9sPupEaddbcHb
 kFKih/9E8VmE8CzbuNfFmERylMXqzLvEd8QbxlOB16IEi0E7snvSKXANX+/B3JP6dj2P
 uf8yNpyorzwnlDYx+x31cXQ0+owi1j+ZS5lUtavwh2BsdUGWDVMzO/5SaswB36/wCeAQ
 8noqvp33fSQOoSAYOLsPkZjnVr1jnMqKzqEc/jTmTBPcnqifOrTFyzHdN7oUagUUpaIc
 5JLw==
X-Gm-Message-State: APjAAAUXG5lf9N+WC+htfK+dzvHq/CXoNJqGap8nZypSpuQNJCtd366k
 pR0qOSPuAO6X05O3mysTaThtdsr1h2uPldI2rqo=
X-Received: by 2002:aca:d18:: with SMTP id 24mr5255648oin.56.1570669973410;
 Wed, 09 Oct 2019 18:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191008142539.7793-1-philmd@redhat.com>
 <20191008142539.7793-7-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-7-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 10 Oct 2019 09:12:17 +0800
Message-ID: <CAKXe6SJx-W_WQ6saGdpoWPPubgLfTeQz0+_zQp1UW_Ay-jF8zA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] hw/isa/vt82c686: Convert reset handler to
 DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d318cb05948419ea"
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
X-TUID: FoKNHGsDUQ+B

--000000000000d318cb05948419ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:39=E5=86=99=E9=81=
=93=EF=BC=9A

> The VIA VT82C686 Southbridge is a PCI device, it will be reset
> when the PCI bus it stands on is reset.
>
> Convert its reset handler into a proper Device reset method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
>  hw/isa/vt82c686.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 50bd28fa82..616f67f347 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -23,7 +23,6 @@
>  #include "hw/isa/apm.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/i2c/pm_smbus.h"
> -#include "sysemu/reset.h"
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
>  #include "exec/address-spaces.h"
> @@ -116,11 +115,10 @@ static const MemoryRegionOps superio_ops =3D {
>      },
>  };
>
> -static void vt82c686b_reset(void * opaque)
> +static void vt82c686b_isa_reset(DeviceState *dev)
>  {
> -    PCIDevice *d =3D opaque;
> -    uint8_t *pci_conf =3D d->config;
> -    VT82C686BState *vt82c =3D VT82C686B_DEVICE(d);
> +    VT82C686BState *vt82c =3D VT82C686B_DEVICE(dev);
> +    uint8_t *pci_conf =3D vt82c->dev.config;
>
>      pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
>      pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO |
> PCI_COMMAND_MEMORY |
> @@ -476,8 +474,6 @@ static void vt82c686b_realize(PCIDevice *d, Error
> **errp)
>       * But we do not emulate a floppy, so just set it here. */
>      memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
>                                  &vt82c->superio);
> -
> -    qemu_register_reset(vt82c686b_reset, d);
>  }
>
>  ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
> @@ -501,6 +497,7 @@ static void via_class_init(ObjectClass *klass, void
> *data)
>      k->device_id =3D PCI_DEVICE_ID_VIA_ISA_BRIDGE;
>      k->class_id =3D PCI_CLASS_BRIDGE_ISA;
>      k->revision =3D 0x40;
> +    dc->reset =3D vt82c686b_isa_reset;
>      dc->desc =3D "ISA bridge";
>      dc->vmsd =3D &vmstate_via;
>      /*
> --
> 2.21.0
>
>
>

--000000000000d318cb05948419ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:39=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The VIA VT82C686 Southbridge is a PCI device, it will be reset<br>
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
=C2=A0hw/isa/vt82c686.c | 11 ++++-------<br>
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
index 50bd28fa82..616f67f347 100644<br>
--- a/hw/isa/vt82c686.c<br>
+++ b/hw/isa/vt82c686.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0#include &quot;hw/isa/apm.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi.h&quot;<br>
=C2=A0#include &quot;hw/i2c/pm_smbus.h&quot;<br>
-#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
@@ -116,11 +115,10 @@ static const MemoryRegionOps superio_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0};<br>
<br>
-static void vt82c686b_reset(void * opaque)<br>
+static void vt82c686b_isa_reset(DeviceState *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PCIDevice *d =3D opaque;<br>
-=C2=A0 =C2=A0 uint8_t *pci_conf =3D d-&gt;config;<br>
-=C2=A0 =C2=A0 VT82C686BState *vt82c =3D VT82C686B_DEVICE(d);<br>
+=C2=A0 =C2=A0 VT82C686BState *vt82c =3D VT82C686B_DEVICE(dev);<br>
+=C2=A0 =C2=A0 uint8_t *pci_conf =3D vt82c-&gt;dev.config;<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0=
);<br>
=C2=A0 =C2=A0 =C2=A0pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | P=
CI_COMMAND_MEMORY |<br>
@@ -476,8 +474,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **err=
p)<br>
=C2=A0 =C2=A0 =C2=A0 * But we do not emulate a floppy, so just set it here.=
 */<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(isa_bus-&gt;address_space_i=
o, 0x3f0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vt82c-&gt;superio);<br>
-<br>
-=C2=A0 =C2=A0 qemu_register_reset(vt82c686b_reset, d);<br>
=C2=A0}<br>
<br>
=C2=A0ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)<br>
@@ -501,6 +497,7 @@ static void via_class_init(ObjectClass *klass, void *da=
ta)<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_VIA_ISA_BRIDGE;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;class_id =3D PCI_CLASS_BRIDGE_ISA;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;revision =3D 0x40;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D vt82c686b_isa_reset;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;ISA bridge&quot;;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_via;<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000d318cb05948419ea--
