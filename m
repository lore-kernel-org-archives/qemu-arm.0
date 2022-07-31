Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2051247lfg;
        Sun, 31 Jul 2022 09:57:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4YJqhYBbGVxO6RiA0eu1CPWGI/d+aIBbhCnvwbbBCAnqdQ1/2KCWDt9FI+xnvTlDNswOXI
X-Received: by 2002:ad4:4ee8:0:b0:474:6f9c:a103 with SMTP id dv8-20020ad44ee8000000b004746f9ca103mr11254269qvb.47.1659286673189;
        Sun, 31 Jul 2022 09:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659286673; cv=none;
        d=google.com; s=arc-20160816;
        b=wyuQ51Vh72p2GrZq9MR8N0mp2sXDMftE4FZVtmVYTdVbzonyQavlFSP9NGz5H3qEhB
         QujR4OLnrkzGZl/V5r7OV16nVOBlEQm9f/DZGKdw8aDtbC0zdUtnT3iy8uYe54Mn6Ivp
         VD0EamwIAk54WxeFMQj9hRCP2pDTUcRoUAETsTMeeRbTujnW604WV8C9JP1+u5n6V6jx
         VVGT+Xzz4WkqPeT3OZoWyxGdvsAEB+nR6GCZEDqR75u9P5yheV6/cuYBrjhfm9R1mJ2L
         pDFSaS+DS59fRPKlwS0GooRO0Ybh3rKgRB8Ck5ucPTWFwHPDOj2E1BuMnicYxhnGpwoC
         yVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=v8EkYReevnLVurivgrCXYPvraEnYGiMC5caSy0jh1Go=;
        b=yFLlIo9qnwqpa48r1xWrUhBcwxD0lhrU5BKhXbsEYFkUMMXlr632DqdzRBQKisy5XJ
         ai5KHGzpM39a2rASaKDRoHKBj2FYH2pYx8vUsKOuHO010eTylHaNxtXag4TYfb7EtN85
         CowjGRssbw+MHcwaxfLObvsHUThWZVZ+K1waKx+k/MzPoorUkLk/jsEeUC5OBtPsswVm
         5BhPn+9j/o/eHTuQZ6yhgC8PMskxwelsV+fuC5D6tKC5TOlOebJUeugSP3YG7DyszGtu
         Fkj1mKkNz5QigEbTRew0DP0Xz0KPEkx0vLFhda/tqG3ysiVYBgPCOS0w8Rn5Ico00p+U
         I3pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CcJ9RD0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb27-20020a05622a1f9b00b0031ed83e3cc6si5399166qtb.197.2022.07.31.09.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jul 2022 09:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CcJ9RD0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oICGG-0007pF-My
	for alex.bennee@linaro.org; Sun, 31 Jul 2022 12:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <misakamm20001@gmail.com>)
 id 1oIAXp-0003uf-0f
 for qemu-arm@nongnu.org; Sun, 31 Jul 2022 11:07:53 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <misakamm20001@gmail.com>)
 id 1oIAXn-0004ji-2b
 for qemu-arm@nongnu.org; Sun, 31 Jul 2022 11:07:52 -0400
Received: by mail-lf1-x136.google.com with SMTP id e15so3654540lfs.0
 for <qemu-arm@nongnu.org>; Sun, 31 Jul 2022 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=v8EkYReevnLVurivgrCXYPvraEnYGiMC5caSy0jh1Go=;
 b=CcJ9RD0O7uwU122AdR0WrBQwzQlMPAH1C7STSlmnkhAXBxoC85Rl4uss3cFoSuYTLp
 hokq1kjkBbsMgEzDeTZD5xzn7exIGcUcO8iWw/j+QNfb+0QKN5ElcGcwsIvVzyiyJUnE
 bZ4Hvth4fCLamPYP6a7qDJ4qzLl/OP8kWkU4vuK5i1W94AMBX2BTzWn/w8n8rszk7nxI
 4yjrFTh6+PpCIYGxySUfxPlZa/eY8uENcD/38UHD3lplQX/bNUUiyhpK7o6+kXiHKlpM
 lAdIVwSRQ2i965ULekj/00XeovcGUTbv6TGaWA9vVtfyEA84mLCW9Keq9Pd3PUiqGR58
 t6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=v8EkYReevnLVurivgrCXYPvraEnYGiMC5caSy0jh1Go=;
 b=H8BxcuZLMfOc4siT8rw7ACkCg/Cc1B295tGnyIwv7KFG+M9MxLjaZ+frdMtEzI8AHW
 NSSRXtCa7RsHiExt3IlnPHnJ41bWdGkUUsewpNTpp8eNfNxNXh6xMgUZROl2nf6sUxUs
 GCqJCKuJJuCXcOPRVUH3310vcmS9SqMH+S6KQRRUSml/Gxe/txpQzrOi+B89fOkHMDrS
 A2GAj4DbY+WfkMdxJiLaLkfeOSAyOO8Jg2DSu8j3FnXCbwXtOI9cV7CX3dpsysCr8/J9
 uZtYUaiT91BCGr3pOeAgD4Z+m/JDH/0tDXUhVm/klqZeuFp1GDCx3/rweGobgXdCyJX/
 +mhw==
X-Gm-Message-State: AJIora9HOJutl3SaHiz2rZrcO6FSLIqphXYaGL9x7ujVpFTc1u+khOiK
 4klAtHTswJkwqt3GG5kxPsoFtnAdu4IdQF0sqz29IYaA3u0=
X-Received: by 2002:a05:6512:5d7:b0:48a:83e0:a507 with SMTP id
 o23-20020a05651205d700b0048a83e0a507mr4509367lfo.452.1659280068698; Sun, 31
 Jul 2022 08:07:48 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5aSP56OK5p2w?= <misakamm20001@gmail.com>
Date: Sun, 31 Jul 2022 23:07:37 +0800
Message-ID: <CAAT5=SW9ihmFR_G=_BSqC_ss5C6zV6F2vu48ds=uah+eYM-dNA@mail.gmail.com>
Subject: why the below code can't attach alias bus
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000013e6fd05e51b3f81"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=misakamm20001@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 31 Jul 2022 12:57:40 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y2m737Ci3GEO

--00000000000013e6fd05e51b3f81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

In sabrelite, all 4 sd controller bus name is sd-bus, in order to attach a
specific sd controller, I have already tested below two ways in v6.0.0, I
want to understand why alias is not working in this case:
1. overwrite bus name in fsl-imx6.c, this is working, so I can attach a
specific sd controller by passing such parameters  "bus=3Dsd-bus2=E2=80=9C =
to qemu,
also from "info qtree", I can see the bus name was been overwrote.
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62..b68212b5a9 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -314,6 +314,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error
**errp)
             { FSL_IMX6_uSDHC3_ADDR, FSL_IMX6_uSDHC3_IRQ },
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
+       //g_autofree char *bus_name =3D NULL;
+       BusState *bus =3D NULL;

         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
         object_property_set_uint(OBJECT(&s->esdhc[i]), "sd-spec-version",
3,
@@ -329,6 +331,15 @@ static void fsl_imx6_realize(DeviceState *dev, Error
**errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             esdhc_table[i].irq));
+
+       /* give unique name with index for all 4 sd controller bus, simply
overwrite origin name */
+       bus =3D qdev_get_child_bus(DEVICE(&s->esdhc[i]), "sd-bus");
+       bus->name =3D g_strdup_printf("sd-bus%d", i);
+
+        /* Alias controller SD bus to the SoC itself */
+       //bus_name =3D g_strdup_printf("sd-bus%d", i);
+       //object_property_add_alias(OBJECT(s), bus_name,
+                                 //OBJECT(&s->esdhc[i]), "sd-bus");

2. as suggested in some related thread, by create an alias for bus name,
this is not working, when I checked "info qtree", I didn't even find my
alias bus. I debugged a little, seems the alias property waas been created,
but the type is link<sdhci-bus>, not child<sdhci-bus>.

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62..1d631583e5 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -314,6 +314,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error
**errp)
             { FSL_IMX6_uSDHC3_ADDR, FSL_IMX6_uSDHC3_IRQ },
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
+       g_autofree char *bus_name =3D NULL;
+       //BusState *bus =3D NULL;

         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
         object_property_set_uint(OBJECT(&s->esdhc[i]), "sd-spec-version",
3,
@@ -329,6 +331,15 @@ static void fsl_imx6_realize(DeviceState *dev, Error
**errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             esdhc_table[i].irq));
+
+       /* give unique name with index for all 4 sd controller bus, simply
overwrite origin name */
+       //bus =3D qdev_get_child_bus(DEVICE(&s->esdhc[i]), "sd-bus");
+       //bus->name =3D g_strdup_printf("sd-bus%d", i);
+
+        /* Alias controller SD bus to the SoC itself */
+       bus_name =3D g_strdup_printf("sd-bus%d", i);
+       object_property_add_alias(OBJECT(s), bus_name,
+                                 OBJECT(&s->esdhc[i]), "sd-bus");

So I want to understand why the second way is not working, I understand
read the implementation of object_property_add_alias can answer this
question=EF=BC=8C
but here just want to get some comments from you. Thanks in advance

--00000000000013e6fd05e51b3f81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>In sabrelite, all 4 sd controll=
er bus name is sd-bus, in order to attach a specific sd controller, I have =
already tested below two ways in v6.0.0, I want to understand why alias is =
not working in this case:</div><div>1. overwrite bus name in fsl-imx6.c, th=
is is working, so I can attach a specific sd controller by passing such par=
ameters=C2=A0 &quot;bus=3Dsd-bus2=E2=80=9C to qemu, also from &quot;info qt=
ree&quot;, I can see the bus name was been overwrote.</div><div>diff --git =
a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c<br>index 00dafe3f62..b68212b5a9 100=
644<br>--- a/hw/arm/fsl-imx6.c<br>+++ b/hw/arm/fsl-imx6.c<br>@@ -314,6 +314=
,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ FSL_IMX6_uSDHC3_ADDR, FSL_IM=
X6_uSDHC3_IRQ },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ FSL_I=
MX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0};<br>+ =C2=A0 =C2=A0 =C2=A0 //g_autofree char *bus_name =3D NULL;<br>+ =
=C2=A0 =C2=A0 =C2=A0 BusState *bus =3D NULL;<br><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* UHS-I SDIO3.0 SDR104 1.8V ADMA */<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0object_property_set_uint(OBJECT(&amp;s-&gt;esdhc[i]), &quot;sd=
-spec-version&quot;, 3,<br>@@ -329,6 +331,15 @@ static void fsl_imx6_realiz=
e(DeviceState *dev, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysb=
us_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;esdhc[i]), 0,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;a9mpcore),<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esdhc_=
table[i].irq));<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 /* give unique name with ind=
ex for all 4 sd controller bus, simply overwrite origin name */<br>+ =C2=A0=
 =C2=A0 =C2=A0 bus =3D qdev_get_child_bus(DEVICE(&amp;s-&gt;esdhc[i]), &quo=
t;sd-bus&quot;);<br>+ =C2=A0 =C2=A0 =C2=A0 bus-&gt;name =3D g_strdup_printf=
(&quot;sd-bus%d&quot;, i);<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Alias co=
ntroller SD bus to the SoC itself */<br>+ =C2=A0 =C2=A0 =C2=A0 //bus_name =
=3D g_strdup_printf(&quot;sd-bus%d&quot;, i);<br>+ =C2=A0 =C2=A0 =C2=A0 //o=
bject_property_add_alias(OBJECT(s), bus_name,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 //OBJECT(&amp;s-&gt;esdhc[i]), &quot;sd-bus&quot;);<br></div>=
<div><br></div><div>2. as suggested in some related thread, by create an al=
ias for bus name, this is not working, when I checked &quot;info qtree&quot=
;, I didn&#39;t even find my alias bus. I debugged a little, seems the alia=
s property waas been created, but the type is=C2=A0link&lt;sdhci-bus&gt;, n=
ot child&lt;sdhci-bus&gt;.</div><div><br></div><div>diff --git a/hw/arm/fsl=
-imx6.c b/hw/arm/fsl-imx6.c<br>index 00dafe3f62..1d631583e5 100644<br>--- a=
/hw/arm/fsl-imx6.c<br>+++ b/hw/arm/fsl-imx6.c<br>@@ -314,6 +314,8 @@ static=
 void fsl_imx6_realize(DeviceState *dev, Error **errp)<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ FSL_IMX6_uSDHC3_ADDR, FSL_IMX6_uSDHC3_IRQ =
},<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ FSL_IMX6_uSDHC4_ADD=
R, FSL_IMX6_uSDHC4_IRQ },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>+ =C2=
=A0 =C2=A0 =C2=A0 g_autofree char *bus_name =3D NULL;<br>+ =C2=A0 =C2=A0 =
=C2=A0 //BusState *bus =3D NULL;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* UHS-I SDIO3.0 SDR104 1.8V ADMA */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ob=
ject_property_set_uint(OBJECT(&amp;s-&gt;esdhc[i]), &quot;sd-spec-version&q=
uot;, 3,<br>@@ -329,6 +331,15 @@ static void fsl_imx6_realize(DeviceState *=
dev, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(=
SYS_BUS_DEVICE(&amp;s-&gt;esdhc[i]), 0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get=
_gpio_in(DEVICE(&amp;s-&gt;a9mpcore),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esdhc_table[i].irq));<b=
r>+<br>+ =C2=A0 =C2=A0 =C2=A0 /* give unique name with index for all 4 sd c=
ontroller bus, simply overwrite origin name */<br>+ =C2=A0 =C2=A0 =C2=A0 //=
bus =3D qdev_get_child_bus(DEVICE(&amp;s-&gt;esdhc[i]), &quot;sd-bus&quot;)=
;<br>+ =C2=A0 =C2=A0 =C2=A0 //bus-&gt;name =3D g_strdup_printf(&quot;sd-bus=
%d&quot;, i);<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Alias controller SD b=
us to the SoC itself */<br>+ =C2=A0 =C2=A0 =C2=A0 bus_name =3D g_strdup_pri=
ntf(&quot;sd-bus%d&quot;, i);<br>+ =C2=A0 =C2=A0 =C2=A0 object_property_add=
_alias(OBJECT(s), bus_name,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJEC=
T(&amp;s-&gt;esdhc[i]), &quot;sd-bus&quot;);<br></div><div><br></div><div>S=
o I want to understand why the second way is not working, I understand read=
 the implementation of object_property_add_alias can answer this question=
=EF=BC=8C</div><div>but here just want to get some comments from you. Thank=
s in advance</div></div>

--00000000000013e6fd05e51b3f81--
