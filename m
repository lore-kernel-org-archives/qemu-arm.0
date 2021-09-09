Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp303849lfb;
        Thu, 9 Sep 2021 09:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMdcDgiMkbNE48PRK2+7jgNYhNjc0y5pyCjmjf+PoIb1LylRIQY/stvjYty4rsy2kbXHds
X-Received: by 2002:a1c:4686:: with SMTP id t128mr3794283wma.183.1631204156573;
        Thu, 09 Sep 2021 09:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631204156; cv=none;
        d=google.com; s=arc-20160816;
        b=KMEJEUVulsVD3MST38ZJlNJq29l1iWCzBxJaE8D9Y4zcy1eAqbdBzqnWzkFFuDPqxv
         8lCarY0yy1BiukTer1XFGvnA6ioArR+NVIR2J4/rR1YkS8x00GvMw1ouoe6qZ2le5jgY
         5ASWRZxXVUf1MUT+rNRUJQE2fsxwUGESasJxSFOe8FTWpCP0tSMQ14qyURxcxdrN0SMz
         YcpGbFcINBskUDDB+bsWSJhm6MKT5UA3Fh7xOdVCPcLRu4Hgx2D8RF+POGErpQLTj4ad
         3oqCZd807vQIEAaSX3s9jlHr444hGjIK98tZZF7Ac2M1z07L8kp0B8ZdrPJ6SQXhh41o
         N09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tUZgld1lpeuvruInoXYt7nRJg7abhgjZthwjnEY9CSc=;
        b=TAT+ZeBYaYhMathwmmNtWhgicvoCRyEaq7CtHmxWFRlPz47mkCk3NETYOMJShlgr5d
         Y86He4TBktq/vKsdF/GX3EWWHbsfwx9O7faAR0gPS5Tzux/KOaxo4d11Sq30vJMALYFc
         1+sqxFseAvWq660gXE6yxYtEcDoSG03OzPxqpHsTL7KMWkYC4EC4Tib0VXoEEfGdT6mC
         6RLdYsiF18lVflXXBbizhEhm7vgsDfqPioEyXZ1ivhtp03NBT8lPn7sXyhCQ8/ziUmzv
         WsfH1dUHL48YIu9hZ/gTnrmlxbbX6EnFrH8/tYb7VSWLC2jrAw7c0HeY4LH3P+cmF44+
         w8Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RgZpXcR3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si2096828wmt.186.2021.09.09.09.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 09:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RgZpXcR3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOMiR-0003Wl-ID
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 12:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mOMiH-0003WO-IF
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 12:15:45 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:43932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mOMiF-0006DH-IF
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 12:15:45 -0400
Received: by mail-ua1-x92e.google.com with SMTP id j31so1264365uad.10
 for <qemu-arm@nongnu.org>; Thu, 09 Sep 2021 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUZgld1lpeuvruInoXYt7nRJg7abhgjZthwjnEY9CSc=;
 b=RgZpXcR3rgZgcv1Gp2dCSJPWinMgmnqxg193t3QfBcZZHtyvjj+hGy3VbhQYsfxiW3
 jiy1gof76Z22zdP9ZTXrx1PlRNB/ijb/rwjvgQ5igpAw+ZdWxNneUUSIpzuCCgY5Oplb
 yTsscn7SPku4tQ8kogLhbq0r2tp1f/DWu3QYQV+V4Z3VXKSduABdk+KrJ1oiBoS1FsiJ
 Ux7ZImEfPTJdwpy5zowGJEIupB3pnK/geufDgzreoN/5o+EloA49jUO4VErAbS/pcEq6
 XzUZovsOPHNQBp81ifTd3/dQnAe3fBB450p6POjq7CFQecBUxT5CLSytdv7eJcpEYJp7
 JGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUZgld1lpeuvruInoXYt7nRJg7abhgjZthwjnEY9CSc=;
 b=oIn3MF9zAbwW0aj+Zhtawfua74kfp4nTZII5xn7XToNCI+7qDpiloNiVwNN97YD9E8
 TDKJ+Ko9uCdI5Vv39adYH1c5WjLIuhe3M3Uf+o7+muYok3kJE2F5nR5mKC+qcXM+aoc3
 sU0yL0qKMNAaMNPnB6KfdP7JAXxPvRcpJfXjrx6VN4uNuQAOrtTUzpd9YebM7IZnEeVX
 gabND3W3Ky4m5wAQZ6A0Akrw9dKlmcdiear9ZCMY1pZPfsB13VEMh31Z1G95Hk7i8kfE
 FH/S8o3mIjkqWawUrGW5eH2B8MI7l2LfvGQvv0rOYp7W0pS7AWxwtd9lmOoANKW+ZvhV
 nkgg==
X-Gm-Message-State: AOAM531cAvBdXNKpIfD0ZPdqckMNOojs1Ut2UxsuW5TKDKObbEl449TP
 s+rSY/THkYRgUehjjUBCtssxIzAmvMzDBdB1dUrdyw==
X-Received: by 2002:ab0:3d11:: with SMTP id f17mr2614033uax.127.1631204141464; 
 Thu, 09 Sep 2021 09:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210907223234.1165705-1-crauer@google.com>
In-Reply-To: <20210907223234.1165705-1-crauer@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 9 Sep 2021 09:15:30 -0700
Message-ID: <CAO=notzph_wBRUY_ps1fgUue1V6_4bcQGbJmeWj5wNST6yS0fw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: Add support for kudo-bmc board.
To: Chris Rauer <crauer@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="00000000000068d81805cb924fb0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=venture@google.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Mk+dQrlutjm

--00000000000068d81805cb924fb0
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 3:35 PM Chris Rauer <crauer@google.com> wrote:

> kudo-bmc is a board supported by OpenBMC.
> https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo
>
> Since v1:
> - hyphenated Cortex-A9
>
> Tested: Booted kudo firmware.
> Signed-off-by: Chris Rauer <crauer@google.com>
>
Reviewed-by: Patrick Venture <venture@google.com>

> ---
>  docs/system/arm/nuvoton.rst |  1 +
>  hw/arm/npcm7xx_boards.c     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index 69f57c2886..adf497e679 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -20,6 +20,7 @@ Hyperscale applications. The following machines are
> based on this chip :
>
>  - ``quanta-gbs-bmc``    Quanta GBS server BMC
>  - ``quanta-gsj``        Quanta GSJ server BMC
> +- ``kudo-bmc``          Fii USA Kudo server BMC
>
>  There are also two more SoCs, NPCM710 and NPCM705, which are single-core
>  variants of NPCM750 and NPCM730, respectively. These are currently not
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index e5a3243995..a656169f61 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -31,6 +31,7 @@
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
>  #define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
> +#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
>
>  static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
>
> @@ -357,6 +358,23 @@ static void quanta_gbs_init(MachineState *machine)
>      npcm7xx_load_kernel(machine, soc);
>  }
>
> +static void kudo_bmc_init(MachineState *machine)
> +{
> +    NPCM7xxState *soc;
> +
> +    soc = npcm7xx_create_soc(machine, KUDO_BMC_POWER_ON_STRAPS);
> +    npcm7xx_connect_dram(soc, machine->ram);
> +    qdev_realize(DEVICE(soc), NULL, &error_fatal);
> +
> +    npcm7xx_load_bootrom(machine, soc);
> +    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
> +                          drive_get(IF_MTD, 0, 0));
> +    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
> +                          drive_get(IF_MTD, 3, 0));
> +
> +    npcm7xx_load_kernel(machine, soc);
> +}
> +
>  static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char
> *type)
>  {
>      NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
> @@ -417,6 +435,18 @@ static void gbs_bmc_machine_class_init(ObjectClass
> *oc, void *data)
>      mc->default_ram_size = 1 * GiB;
>  }
>
> +static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
> +
> +    mc->desc = "Kudo BMC (Cortex-A9)";
> +    mc->init = kudo_bmc_init;
> +    mc->default_ram_size = 1 * GiB;
> +};
> +
>  static const TypeInfo npcm7xx_machine_types[] = {
>      {
>          .name           = TYPE_NPCM7XX_MACHINE,
> @@ -437,6 +467,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
>          .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
>          .parent         = TYPE_NPCM7XX_MACHINE,
>          .class_init     = gbs_bmc_machine_class_init,
> +    }, {
> +        .name           = MACHINE_TYPE_NAME("kudo-bmc"),
> +        .parent         = TYPE_NPCM7XX_MACHINE,
> +        .class_init     = kudo_bmc_machine_class_init,
>      },
>  };
>
> --
> 2.33.0.153.gba50c8fa24-goog
>
>
>

--00000000000068d81805cb924fb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 at 3:35 PM Chris =
Rauer &lt;<a href=3D"mailto:crauer@google.com">crauer@google.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">kudo-bmc is=
 a board supported by OpenBMC.<br>
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kud=
o" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/=
tree/master/meta-fii/meta-kudo</a><br>
<br>
Since v1:<br>
- hyphenated Cortex-A9<br>
<br>
Tested: Booted kudo firmware.<br>
Signed-off-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" target=
=3D"_blank">crauer@google.com</a>&gt;<br></blockquote><div>Reviewed-by: Pat=
rick Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</=
a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/system/arm/nuvoton.rst |=C2=A0 1 +<br>
=C2=A0hw/arm/npcm7xx_boards.c=C2=A0 =C2=A0 =C2=A0| 34 +++++++++++++++++++++=
+++++++++++++<br>
=C2=A02 files changed, 35 insertions(+)<br>
<br>
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst<br>
index 69f57c2886..adf497e679 100644<br>
--- a/docs/system/arm/nuvoton.rst<br>
+++ b/docs/system/arm/nuvoton.rst<br>
@@ -20,6 +20,7 @@ Hyperscale applications. The following machines are based=
 on this chip :<br>
<br>
=C2=A0- ``quanta-gbs-bmc``=C2=A0 =C2=A0 Quanta GBS server BMC<br>
=C2=A0- ``quanta-gsj``=C2=A0 =C2=A0 =C2=A0 =C2=A0 Quanta GSJ server BMC<br>
+- ``kudo-bmc``=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fii USA Kudo server BMC<b=
r>
<br>
=C2=A0There are also two more SoCs, NPCM710 and NPCM705, which are single-c=
ore<br>
=C2=A0variants of NPCM750 and NPCM730, respectively. These are currently no=
t<br>
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c<br>
index e5a3243995..a656169f61 100644<br>
--- a/hw/arm/npcm7xx_boards.c<br>
+++ b/hw/arm/npcm7xx_boards.c<br>
@@ -31,6 +31,7 @@<br>
=C2=A0#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7<br>
=C2=A0#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff<br>
=C2=A0#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff<br>
+#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff<br>
<br>
=C2=A0static const char npcm7xx_default_bootrom[] =3D &quot;npcm7xx_bootrom=
.bin&quot;;<br>
<br>
@@ -357,6 +358,23 @@ static void quanta_gbs_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0npcm7xx_load_kernel(machine, soc);<br>
=C2=A0}<br>
<br>
+static void kudo_bmc_init(MachineState *machine)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxState *soc;<br>
+<br>
+=C2=A0 =C2=A0 soc =3D npcm7xx_create_soc(machine, KUDO_BMC_POWER_ON_STRAPS=
);<br>
+=C2=A0 =C2=A0 npcm7xx_connect_dram(soc, machine-&gt;ram);<br>
+=C2=A0 =C2=A0 qdev_realize(DEVICE(soc), NULL, &amp;error_fatal);<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_load_bootrom(machine, soc);<br>
+=C2=A0 =C2=A0 npcm7xx_connect_flash(&amp;soc-&gt;fiu[0], 0, &quot;mx66u512=
35f&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 drive_get(IF_MTD, 0, 0));<br>
+=C2=A0 =C2=A0 npcm7xx_connect_flash(&amp;soc-&gt;fiu[1], 0, &quot;mx66u512=
35f&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 drive_get(IF_MTD, 3, 0));<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_load_kernel(machine, soc);<br>
+}<br>
+<br>
=C2=A0static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char=
 *type)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxClass *sc =3D NPCM7XX_CLASS(object_class_by_name=
(type));<br>
@@ -417,6 +435,18 @@ static void gbs_bmc_machine_class_init(ObjectClass *oc=
, void *data)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_ram_size =3D 1 * GiB;<br>
=C2=A0}<br>
<br>
+static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxMachineClass *nmc =3D NPCM7XX_MACHINE_CLASS(oc);<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_set_soc_type(nmc, TYPE_NPCM730);<br>
+<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Kudo BMC (Cortex-A9)&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D kudo_bmc_init;<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1 * GiB;<br>
+};<br>
+<br>
=C2=A0static const TypeInfo npcm7xx_machine_types[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TYPE_NPCM7XX_MACHINE,<br>
@@ -437,6 +467,10 @@ static const TypeInfo npcm7xx_machine_types[] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D MACHINE_TYPE_NAME(&quot;quanta-gbs-bmc&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_NPCM7XX_MACHINE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =C2=A0=3D gbs_bm=
c_machine_class_init,<br>
+=C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D MACHINE_TYPE_NAME(&quot;kudo-bmc&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_NPCM7XX_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D kudo_bmc_ma=
chine_class_init,<br>
=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0};<br>
<br>
-- <br>
2.33.0.153.gba50c8fa24-goog<br>
<br>
<br>
</blockquote></div></div>

--00000000000068d81805cb924fb0--
