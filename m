Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2911246lfo;
        Sun, 31 Jan 2021 13:53:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvSBHbdtndtZBRq/ef7F01iMeUwmPpXDaMsdZ9sjnO05cTUbFhuU6d0TiBRErHtSgDie/7
X-Received: by 2002:a25:1389:: with SMTP id 131mr20579919ybt.210.1612130005567;
        Sun, 31 Jan 2021 13:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612130005; cv=none;
        d=google.com; s=arc-20160816;
        b=tO/Oav+jpBNWIdRuj2TovuM6QPn8qpMeXLjJ5xFszj1caiAiQ0njWCsn589hnNxGLt
         hzyHmv5xgVvq73Uh1VNA57rP64oo3xVNVrphV32dOKMq7P1nWXjfiuYvhmY+OeOaJ60/
         +NJqZsp9E97dyxmEAZjO6GDMZEu2szMJoL3LiXUZcLBSaj/pHSCZaGtCwfRaDZxEh3Jp
         4X57SubuzZHpglIOhjQr9xLvqHoetjUpauLeWIjlo80BQC/qav1LFOpXzYI45Rsj8FD+
         l02vd5fMwQXZa6f2t+P3jgKDjAH6SKXv8ijAB+kr50USRLxZtrLT29uUCtZutI6HxEAJ
         XgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gxsg+A4eqcnjuy62FJK3AkVQE52f/hHvAZknXUxQpyg=;
        b=b7hSC+a7M++jdIGwsp2Hv6ect+q2urankX2mvDxMq42EwqzbhOdlj1spBRwZob6Wr8
         F0Gbj0/D0/7UJzRX7LbT+BdLTys/QSoy3zvLzoxbCjMr4v6okV1eaZzE6H5KO1MP3hdR
         ZTkLYzlRb32Uh8ps+WbLalfuYJJaJXccBxa9RrhbroL1rW2+Fk73frkUm6FhReEd/fzC
         5cQKP0UOI5l3KpDKUFhTKC8UzUA0fIm1oxw8oc2nRXG/JGZNHNdEpo7mGVMMS0hY8Wx1
         s+O2hb5laGik93ugThvreOH2hiaszMRTG10sOUVIeMiQq6AVDV80haXXTbQz+J6EhG05
         vIww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f707zPr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si11168238ybe.114.2021.01.31.13.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 13:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f707zPr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6Keq-0005UY-V5
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 16:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1l6Kej-0005U2-1m; Sun, 31 Jan 2021 16:53:17 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:35141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1l6Keg-00050x-S3; Sun, 31 Jan 2021 16:53:16 -0500
Received: by mail-io1-xd33.google.com with SMTP id y19so15352913iov.2;
 Sun, 31 Jan 2021 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gxsg+A4eqcnjuy62FJK3AkVQE52f/hHvAZknXUxQpyg=;
 b=f707zPr2Jy8PeIuNVNG3PVFoDFyg0MLtFSZA+p2eWpAOg9jScC9NZ+nMDR+kTPJ+0I
 6SPajq18a6nL8WqnD9geqNNVqq5vlKc8pXTAvMvjWz2HUORJ5oacXLizUQbOTcQg7/Jy
 iWCFNttL9bswIqGFnc1NrTPgQAYBhLadC3d4DxGht83kbd3iXLID8yVIuZpNpAYWWLIT
 VjGt7WL0UuqiTvgxNqvoKjfBtmg1U4VOWxaygCbHn5TlCmCXnPPbZMVTJ/YFQzkSro0X
 aXlbHKLgmfonHbNMQL5Nr7yf+x9+nwT7wrIm4iEUyDMcadsN2tvUMa8C36bPGbZIgijp
 OJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gxsg+A4eqcnjuy62FJK3AkVQE52f/hHvAZknXUxQpyg=;
 b=tHNRPFzQzUcHthTcdao+mzVcWpDi42KLXnLKlwbd2YyowwdWY6inEhb+cl4Rr6YOgQ
 EjPd5Mw7hl+tyDe0pnZYF6495+2bIv1TPz09JgpR7tvZK/TjOWNFH3Xz6MUOGtHGrdgV
 9O2nCjZAsbXtZeo1pmfuqq06VVGVgoZrCBLxQNTLmpw9wQqgrzpca0sFIqBUZUcm5ah3
 t5qMHfW7mtkS3JBe5/tILotI5hfXyDTu9/orUDeLvKOQjUccgiLtZtLgtt4rwHdtOErj
 zFHFmghjWT3jjJCHiEoLsj+pW74yJf23slQEv/QmEwljAcMIU+zTVID5FpOGqj+836xF
 wFkA==
X-Gm-Message-State: AOAM531p7ij/u5FflARQ9kcJGj9efrKrTGhJhyD1Ad3o77UsM5LrRPJs
 sg7yt3Bxss6E/ScEo4MT33xHthqAm04+BlN5XUo=
X-Received: by 2002:a6b:d01a:: with SMTP id x26mr10959701ioa.11.1612129992572; 
 Sun, 31 Jan 2021 13:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
 <20210131184449.382425-7-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-7-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 31 Jan 2021 22:53:01 +0100
Message-ID: <CAPan3WquSKehxkvukfJ5xrakc=VzxgCmqzWvhG-WcZ8itaLPNA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] hw/arm: Display CPU type in machine description
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000008a00b405ba39431a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-io1-xd33.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pGeKw/w+6yDq

--0000000000008a00b405ba39431a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For Orange Pi PC:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Op zo 31 jan. 2021 19:45 schreef Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>:

> Most of ARM machines display their CPU when QEMU list the available
> machines (-M help). Some machines do not. Fix to unify the help
> output.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/digic_boards.c  | 2 +-
>  hw/arm/microbit.c      | 2 +-
>  hw/arm/netduino2.c     | 2 +-
>  hw/arm/netduinoplus2.c | 2 +-
>  hw/arm/orangepi.c      | 2 +-
>  hw/arm/stellaris.c     | 4 ++--
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index be12873673b..6cdc1d83fca 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -142,7 +142,7 @@ static void canon_a1100_init(MachineState *machine)
>
>  static void canon_a1100_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Canon PowerShot A1100 IS";
> +    mc->desc =3D "Canon PowerShot A1100 IS (ARM946)";
>      mc->init =3D &canon_a1100_init;
>      mc->ignore_memory_transaction_failures =3D true;
>      mc->default_ram_size =3D 64 * MiB;
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index 0947491cb97..e9494334ce7 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -64,7 +64,7 @@ static void microbit_machine_class_init(ObjectClass *oc=
,
> void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
> -    mc->desc =3D "BBC micro:bit";
> +    mc->desc =3D "BBC micro:bit (Cortex-M0)";
>      mc->init =3D microbit_init;
>      mc->max_cpus =3D 1;
>  }
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 8f103341443..1733b71507c 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -54,7 +54,7 @@ static void netduino2_init(MachineState *machine)
>
>  static void netduino2_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Netduino 2 Machine";
> +    mc->desc =3D "Netduino 2 Machine (Cortex-M3)";
>      mc->init =3D netduino2_init;
>      mc->ignore_memory_transaction_failures =3D true;
>  }
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index 68abd3ec69d..d3ad7a2b675 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -55,7 +55,7 @@ static void netduinoplus2_init(MachineState *machine)
>
>  static void netduinoplus2_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Netduino Plus 2 Machine";
> +    mc->desc =3D "Netduino Plus 2 Machine (Cortex-M4)";
>      mc->init =3D netduinoplus2_init;
>  }
>
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index d6306dfddae..40cdb5c6d2c 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -113,7 +113,7 @@ static void orangepi_init(MachineState *machine)
>
>  static void orangepi_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Orange Pi PC";
> +    mc->desc =3D "Orange Pi PC (Cortex-A7)";
>      mc->init =3D orangepi_init;
>      mc->block_default_type =3D IF_SD;
>      mc->units_per_default_bus =3D 1;
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index ad72c0959f1..27292ec4113 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1538,7 +1538,7 @@ static void lm3s811evb_class_init(ObjectClass *oc,
> void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
> -    mc->desc =3D "Stellaris LM3S811EVB";
> +    mc->desc =3D "Stellaris LM3S811EVB (Cortex-M3)";
>      mc->init =3D lm3s811evb_init;
>      mc->ignore_memory_transaction_failures =3D true;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m3");
> @@ -1554,7 +1554,7 @@ static void lm3s6965evb_class_init(ObjectClass *oc,
> void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
> -    mc->desc =3D "Stellaris LM3S6965EVB";
> +    mc->desc =3D "Stellaris LM3S6965EVB (Cortex-M3)";
>      mc->init =3D lm3s6965evb_init;
>      mc->ignore_memory_transaction_failures =3D true;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m3");
> --
> 2.26.2
>
>

--0000000000008a00b405ba39431a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">For Orange Pi PC:<div dir=3D"auto"><br><div dir=3D"auto">=
Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com=
">nieklinnenbank@gmail.com</a>&gt;</div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op zo 31 jan. 2021 19:45 schr=
eef Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bu=
g@amsat.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Most of ARM ma=
chines display their CPU when QEMU list the available<br>
machines (-M help). Some machines do not. Fix to unify the help<br>
output.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/arm/digic_boards.c=C2=A0 | 2 +-<br>
=C2=A0hw/arm/microbit.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/arm/netduino2.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/arm/netduinoplus2.c | 2 +-<br>
=C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/arm/stellaris.c=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A06 files changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c<br>
index be12873673b..6cdc1d83fca 100644<br>
--- a/hw/arm/digic_boards.c<br>
+++ b/hw/arm/digic_boards.c<br>
@@ -142,7 +142,7 @@ static void canon_a1100_init(MachineState *machine)<br>
<br>
=C2=A0static void canon_a1100_machine_init(MachineClass *mc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Canon PowerShot A1100 IS&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Canon PowerShot A1100 IS (ARM946)&quot=
;;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D &amp;canon_a1100_init;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;ignore_memory_transaction_failures =3D true;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_ram_size =3D 64 * MiB;<br>
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c<br>
index 0947491cb97..e9494334ce7 100644<br>
--- a/hw/arm/microbit.c<br>
+++ b/hw/arm/microbit.c<br>
@@ -64,7 +64,7 @@ static void microbit_machine_class_init(ObjectClass *oc, =
void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);<br>
<br>
-=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;BBC micro:bit&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;BBC micro:bit (Cortex-M0)&quot;;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D microbit_init;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;max_cpus =3D 1;<br>
=C2=A0}<br>
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c<br>
index 8f103341443..1733b71507c 100644<br>
--- a/hw/arm/netduino2.c<br>
+++ b/hw/arm/netduino2.c<br>
@@ -54,7 +54,7 @@ static void netduino2_init(MachineState *machine)<br>
<br>
=C2=A0static void netduino2_machine_init(MachineClass *mc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Netduino 2 Machine&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Netduino 2 Machine (Cortex-M3)&quot;;<=
br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D netduino2_init;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;ignore_memory_transaction_failures =3D true;<br>
=C2=A0}<br>
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c<br>
index 68abd3ec69d..d3ad7a2b675 100644<br>
--- a/hw/arm/netduinoplus2.c<br>
+++ b/hw/arm/netduinoplus2.c<br>
@@ -55,7 +55,7 @@ static void netduinoplus2_init(MachineState *machine)<br>
<br>
=C2=A0static void netduinoplus2_machine_init(MachineClass *mc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Netduino Plus 2 Machine&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Netduino Plus 2 Machine (Cortex-M4)&qu=
ot;;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D netduinoplus2_init;<br>
=C2=A0}<br>
<br>
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c<br>
index d6306dfddae..40cdb5c6d2c 100644<br>
--- a/hw/arm/orangepi.c<br>
+++ b/hw/arm/orangepi.c<br>
@@ -113,7 +113,7 @@ static void orangepi_init(MachineState *machine)<br>
<br>
=C2=A0static void orangepi_machine_init(MachineClass *mc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Orange Pi PC&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Orange Pi PC (Cortex-A7)&quot;;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D orangepi_init;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;block_default_type =3D IF_SD;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;units_per_default_bus =3D 1;<br>
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c<br>
index ad72c0959f1..27292ec4113 100644<br>
--- a/hw/arm/stellaris.c<br>
+++ b/hw/arm/stellaris.c<br>
@@ -1538,7 +1538,7 @@ static void lm3s811evb_class_init(ObjectClass *oc, vo=
id *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);<br>
<br>
-=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Stellaris LM3S811EVB&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Stellaris LM3S811EVB (Cortex-M3)&quot;=
;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D lm3s811evb_init;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;ignore_memory_transaction_failures =3D true;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cor=
tex-m3&quot;);<br>
@@ -1554,7 +1554,7 @@ static void lm3s6965evb_class_init(ObjectClass *oc, v=
oid *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);<br>
<br>
-=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Stellaris LM3S6965EVB&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Stellaris LM3S6965EVB (Cortex-M3)&quot=
;;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D lm3s6965evb_init;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;ignore_memory_transaction_failures =3D true;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cor=
tex-m3&quot;);<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div>

--0000000000008a00b405ba39431a--
