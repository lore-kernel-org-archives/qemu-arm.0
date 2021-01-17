Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1998562lfq;
        Sun, 17 Jan 2021 12:37:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMlnnLy691qaGp/4+81Nk51PNW2G+mJMshxDFdfHhQGogK7x2a2HauVPYq0tY7Vqm2JcmH
X-Received: by 2002:a25:5052:: with SMTP id e79mr34204687ybb.51.1610915847237;
        Sun, 17 Jan 2021 12:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610915847; cv=none;
        d=google.com; s=arc-20160816;
        b=XSdH4jJmiFEDUl6SAdTNnZHiDBYsgygvekNyGcyTX1yfKP+8uuDl9hOnL/q+ivBxO8
         oPNBKhLADUHPS/fl1NAlhA1tzvytv7alK2vlmzc0HoyY/BiRDd2LQ1tZZq4HatVsBRV9
         3HcTjh1YHuMJPZyoTkcArIH7VDuq2M461teWLvhCZxl+0QXi8SqyVo68Vtl++UbPRTx/
         n3DvFRzMzYIAkyWHa/vx3H2qdeoY/C1/ZRXuCSOZnIut7niA36aACpzWTZLcKx1adzWY
         WpluqAe5NyNByxsZUfvz40fRxJFAtGhuCJJN81LYDidlZLxlY01vjScs+kXKmRdVhI/E
         Wpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRpvBhqXZOEAfJBmLyrRY+P76oZBIjtDuKCtNlyQ4aU=;
        b=H2IQegCErWEsHl1eUlnEglpQLALo21WAQ08t/QJLPZzAGz7MWymsTQmGQeytqsQ0M/
         Dx7lmt6A/1dpxLtPK13YE1VIVZu3zUMykfZLD6/doscpTFmAW+dhmH8T17Yopj2k3zqu
         7R/n239J0toP85E5fAmApfjJPakDni/N3inoVmPznaGzaRKsMwsnoEIT88iVB3P1O/Ky
         viyhSBzyvG3yRIExPUfIyPL3kKA0bBAw0awqeuRgxNL50WjjirnZpvLMczum8/H/DizY
         90ourl6gYFeUYrTUFu+0bwW/anaHNSzBbyPLr/+vqiBzigZHkMlyMZatX3AZ3xVCTpMM
         w7Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qpxaNkKp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si14499014ybo.36.2021.01.17.12.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 12:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qpxaNkKp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1Ene-0006wr-Ih
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 15:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1l1EnW-0006wh-E0; Sun, 17 Jan 2021 15:37:18 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1l1EnU-0003qC-Lj; Sun, 17 Jan 2021 15:37:18 -0500
Received: by mail-qt1-x832.google.com with SMTP id j26so9975487qtq.8;
 Sun, 17 Jan 2021 12:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRpvBhqXZOEAfJBmLyrRY+P76oZBIjtDuKCtNlyQ4aU=;
 b=qpxaNkKpB8uT1cpGltamQpuTBHR8bF5TwzYDW4OHlvBoWulsOFULsVF650Mvz6dsv5
 Uu69LClxW6dFHKJTxItylTybsQ2sc1HkLZ7fLimLJYEKZbCvL9nmZgYhb8ozO/MwpW0K
 4X0YdqA20XMAYwOnIrDPiYNPJU6pfE7FUKwyEgd1kVKv44NkINeoi5vhBCWZ3pRyUuuS
 DUUUKVaWvURo5v5YL4M2vbROFCcMnisEj1Vsjym1enMESH3GLgTNZM34pZvD/vE3q/nv
 x3QZWCb1UffwY+fTD4hQmpzhNyprKQRso8zdeLfhEK8wV2+az7AuFmnpEHqnItNRSsZE
 bbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRpvBhqXZOEAfJBmLyrRY+P76oZBIjtDuKCtNlyQ4aU=;
 b=qvTXQM9+dmq5sTuBJZBisYq6/+PFkemcKPfOAQPjWySz5tzTIive/dmFZIivoDqpTS
 KyTSJWCQtDTJt8kHtWi9gLuqXBshXT75zcxq03RCv1uS3GmJCDnWSnVxYcW2YCQ71B33
 7F5H/7xo3kc1U6Fy1vEKXweAG0Vwh4/8DdS8qIhbYyvEsFXsinY39tHbmyajNDnhjraD
 PXJ12ys1cpkpo5KIQK7TMlkYESP2tQE0EN++78p+5SxSKb+q3J6SdMNVQeD4q8POBViZ
 NfXKdjiZzGUBebTPizBYme00enAzZYHVI68fQVRytjl2gv58sxEraI+xEXNmOB+cx/TU
 0Zkw==
X-Gm-Message-State: AOAM530NZZC3yIA3Fp4NzxTEV8a/kt/SQQgeiknkJtO0d548K7d5BpTf
 /Kjo313D4YR9v3DLux2YFr1HCxOI9g85ceXl6u0=
X-Received: by 2002:ac8:36e2:: with SMTP id b31mr113395qtc.19.1610915834822;
 Sun, 17 Jan 2021 12:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-17-f4bug@amsat.org>
In-Reply-To: <20210117192446.23753-17-f4bug@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Sun, 17 Jan 2021 21:37:02 +0100
Message-ID: <CAAM0arNFowjHaeO8578qTn2Md94-CgZ_RvjBDtRLXRD0Bm=9wg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 16/20] hw/sparc64/sun4u: Mark devices with no
 migratable fields
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000019047505b91e92d1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=a.tarasenko@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pAODgiqdJDp9

--00000000000019047505b91e92d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 17 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3., 20:26 Philippe Mathieu-D=
aud=C3=A9 <f4bug@amsat.org>:

> These devices don't have fields to migrate. Be explicit
> by using vmstate_qdev_no_state_to_migrate.
>
> Add a more descriptive comment to keep a clear separation
> between static property vs runtime changeable.
>

Nice, thanks for this!


> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

---
>  hw/sparc64/sun4u.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 0fa13a73302..fdf0aa875be 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -84,12 +84,15 @@ struct hwdef {
>  struct EbusState {
>      /*< private >*/
>      PCIDevice parent_obj;
> +    /*< public >*/
>
>      ISABus *isa_bus;
>      qemu_irq isa_bus_irqs[ISA_NUM_IRQS];
> -    uint64_t console_serial_base;
>      MemoryRegion bar0;
>      MemoryRegion bar1;
> +
> +    /* Properties */
> +    uint64_t console_serial_base;
>  };
>
>  #define TYPE_EBUS "ebus"
> @@ -386,6 +389,7 @@ static void ebus_class_init(ObjectClass *klass, void
> *data)
>      k->device_id =3D PCI_DEVICE_ID_SUN_EBUS;
>      k->revision =3D 0x01;
>      k->class_id =3D PCI_CLASS_BRIDGE_OTHER;
> +    dc->vmsd =3D vmstate_qdev_no_state_to_migrate;
>      device_class_set_props(dc, ebus_properties);
>  }
>
> --
> 2.26.2
>
>

--00000000000019047505b91e92d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D0=B2=D1=81, 17 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3., 20:=
26 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug=
@amsat.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">These devices d=
on&#39;t have fields to migrate. Be explicit<br>
by using vmstate_qdev_no_state_to_migrate.<br>
<br>
Add a more descriptive comment to keep a clear separation<br>
between static property vs runtime changeable.<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Nice, thanks for this!</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div>=
<div dir=3D"auto">Reviewed-by: Artyom Tarasenko &lt;<a href=3D"mailto:atar4=
qemu@gmail.com">atar4qemu@gmail.com</a>&gt;</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
---<br>
=C2=A0hw/sparc64/sun4u.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c<br>
index 0fa13a73302..fdf0aa875be 100644<br>
--- a/hw/sparc64/sun4u.c<br>
+++ b/hw/sparc64/sun4u.c<br>
@@ -84,12 +84,15 @@ struct hwdef {<br>
=C2=A0struct EbusState {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; private &gt;*/<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
<br>
=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq isa_bus_irqs[ISA_NUM_IRQS];<br>
-=C2=A0 =C2=A0 uint64_t console_serial_base;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion bar0;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion bar1;<br>
+<br>
+=C2=A0 =C2=A0 /* Properties */<br>
+=C2=A0 =C2=A0 uint64_t console_serial_base;<br>
=C2=A0};<br>
<br>
=C2=A0#define TYPE_EBUS &quot;ebus&quot;<br>
@@ -386,6 +389,7 @@ static void ebus_class_init(ObjectClass *klass, void *d=
ata)<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_SUN_EBUS;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;revision =3D 0x01;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;class_id =3D PCI_CLASS_BRIDGE_OTHER;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D vmstate_qdev_no_state_to_migrate;<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, ebus_properties);<br>
=C2=A0}<br>
<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div></div>

--00000000000019047505b91e92d1--
