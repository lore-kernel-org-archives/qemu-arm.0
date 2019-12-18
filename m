Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1351437lff;
        Wed, 18 Dec 2019 13:25:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAmuu2QmfNfFg5h5xJ6TfdlQWJoRcDeo6rBxpF3RTxfCTh14j1CZbsi/OZQuFE9g4n9eMV
X-Received: by 2002:ac8:2ffa:: with SMTP id m55mr4165956qta.189.1576704325879;
        Wed, 18 Dec 2019 13:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576704325; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKsBJB7b8iEaXF7Dll9MAMdhAJ6E9wcTZBmBaAnKOrffP18hiljLXgGZ3MUPepeae3
         Q5gNSzpPQFQndlsnvN0M9nMz3BLV+CyDwNDm1P0P3F/TJlaX+K+LlMlAx98yB+UnjeX9
         loQWuqcurA2uAigU1/rUuvh2MIJkJjvaT2WxcNoZ5pC/Z+TZsOhfSmCvrkZM/dgweNXE
         gWSGd+Covguzm7I1SIry7BJbb4+qksxrpr+mgOVjqxSiNTxIzkJdCRemEXPhOTVH7Vph
         8kE2SeHAtY/dJyrWskNVRVx3bspAa2T05lecQvpTJ1rSejWP2/XmDkHb9W8lR9Plupx8
         SvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtKoWcYA4eLIkTD5hhsie5xpQCIYiUwxTm3208IaOxQ=;
        b=tuZYSgf73jFlemhhddpZP+xeM9ppcAjfUjQkttVWSQEayoj8EeF1Ejy78JL1cmPlIa
         1wg7ltmNF6+bLtb2/tk5dnsF8ex2oJoFTcXJgMzXUFJzinDMthin7w4lL0Xe4tODHBRJ
         w7/tTZiGiv7XtJNtzSBh0g2Chy+//mpJdoss8hhmdp0dtbfijeE/Lxa+aLmoV661HuSK
         dL2UV8/cnLkHeDJ3ouQ1wZJlBUzs8Xdl/THqIex3pG4PSxNLhvefnQYF2XuHAjXCO984
         +nRCr2i0mpCBR5aBxwi9zn7FPu41suDhzVfC2y2hukcakiTkgS/sa8onpKGDgGcx+gY1
         tB6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VB+vxT/N";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si2030039qtq.282.2019.12.18.13.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 13:25:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VB+vxT/N";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihgov-0008Dw-9h
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 16:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ihgnJ-0007D9-Fo
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:23:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ihgnI-000465-2s
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:23:45 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:36233)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1ihgnH-00043R-Sm; Wed, 18 Dec 2019 16:23:44 -0500
Received: by mail-io1-xd43.google.com with SMTP id r13so3542887ioa.3;
 Wed, 18 Dec 2019 13:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WtKoWcYA4eLIkTD5hhsie5xpQCIYiUwxTm3208IaOxQ=;
 b=VB+vxT/N6AhQaOfbqc9J8H2pfyaQ1f2YM0CnHaQOsHkvoQf423NiJKfcQ4LlY8QivG
 dTOxiOVp6h6uF7vKsetAHW1zdH2kUY19wofGZOkZvS4DbLi5TfJPMSsAhuJcLBg68MMr
 b6d1s4d3cgaajIu4pHKDh7w+sn7/X3tn/1+W7aPwUN0wJqdD0vuu0Xt6lpH43RFgZI+6
 +JCBiyjCniMu5AlMV8W3eSuOSm7JPKq4lNGUTQJX7xkFNobUB+hDBl6plMB3bsZShVes
 Ntg3G2YETn2Ep7n0XP2QOMAWljtgAh1gixenT8PfYDWbWyJTiC5yl8VWt6fqe2KJDRdt
 qI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WtKoWcYA4eLIkTD5hhsie5xpQCIYiUwxTm3208IaOxQ=;
 b=BEDoeq/+Q/nhjJIrm/FNCVsmEzIE8mV5n5W40I/5eNZ/4Y/Jo/F/0gqAgGfTP65EfZ
 3n1kSdJ2Z5eJ0oV5VDlC4uXXYXeZm2V4VVd+6ZcDZezJqPxF3bN0w8YONyO0rBGXJHL+
 yj+BH+p1rCBlj7hx3rNgeeXXtc1JfhF9eK+oin0X0JaaZkJCm76x1ZxMLHHtqu17AvW2
 yu5UkbRy8FkXLjS7tlKcAl0gAhvQdTpLoALuRtPc6Ke+w30IRuQtyPsCwKV2QTgnoVK8
 QMXjy4/xezH/C/ITde9MDHBFXEYidWGZWT4ViJaawA05l2nyuUKApUIAbSvpH4GbJB1w
 pPwg==
X-Gm-Message-State: APjAAAUydaQHHbh0FZ5UUOj0pL3gz0bSAGztZ8EUbohaUUMfEg73yEon
 a66H/stgkVaVgMuPkAd0IukYiOHCqHpXG5zdsD0=
X-Received: by 2002:a02:7fd0:: with SMTP id r199mr4373763jac.126.1576704223115; 
 Wed, 18 Dec 2019 13:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20191217182730.943-1-f4bug@amsat.org>
 <20191217182730.943-5-f4bug@amsat.org>
In-Reply-To: <20191217182730.943-5-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 18 Dec 2019 22:23:32 +0100
Message-ID: <CAPan3WoW60CgKWhXD8RD0xAjH+g+vRa8aKY7dx4fxC=XPxZ7WQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] !fixup "hw: arm: add Xunlong Orange Pi PC machine"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000002281e1059a010fc4"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mk10FfPEaqZC

--0000000000002281e1059a010fc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

Noted. I'll make sure mc->default_ram_size =3D 1 * GiB is added for the nex=
t
reworked patch set v3.

Regards,
Niek

On Tue, Dec 17, 2019 at 7:27 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Without this, the machine starts with default 128MB, and Ubuntu Bionic
> fails:
>
> [ ***  ] (2 of 4) A start job is running for=E2=80=A6Persistent Storage (=
37s /
> 2min 1s)
> [  *** ] (2 of 4) A start job is running for=E2=80=A6Persistent Storage (=
38s /
> 2min 1s)
> [  OK  ] Started Flush Journal to Persistent Storage.
> Starting Create Volatile Files and Directories...
> Starting Armbian ZRAM config...
> [    **] (3 of 6) A start job is running for=E2=80=A6s and Directories (5=
5s / no
> limit)
> [     *] (3 of 6) A start job is running for=E2=80=A6s and Directories (5=
5s / no
> limit)
> [    **] (3 of 6) A start job is running for=E2=80=A6s and Directories (5=
6s / no
> limit)
> [  OK  ] Started Create Volatile Files and Directories.
> [***   ] (5 of 6) A start job is running for=E2=80=A6 ZRAM config (1min 1=
0s / 1min
> 19s)
> [**    ] (5 of 6) A start job is running for=E2=80=A6 ZRAM config (1min 1=
2s / 1min
> 19s)
> [*     ] (5 of 6) A start job is running for=E2=80=A6 ZRAM config (1min 1=
3s / 1min
> 19s)
> [FAILED] Failed to start Armbian ZRAM config.
> See 'systemctl status armbian-zram-config.service' for details.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/orangepi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index 119f370924..da758d7eba 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -122,6 +122,7 @@ static void orangepi_machine_init(MachineClass *mc)
>      mc->max_cpus =3D AW_H3_NUM_CPUS;
>      mc->default_cpus =3D AW_H3_NUM_CPUS;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7");
> +    mc->default_ram_size =3D 1 * GiB;
>  }
>
>  DEFINE_MACHINE("orangepi-pc", orangepi_machine_init)
> --
> 2.21.0
>
>

--=20
Niek Linnenbank

--0000000000002281e1059a010fc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,</div><div><br></div><div>Noted. I&#39;ll=
 make sure mc-&gt;default_ram_size =3D 1 * GiB is added for the next rework=
ed patch set v3.</div><div><br></div><div>Regards,</div><div>Niek<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Dec 17, 2019 at 7:27 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"=
mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Without this, the machine starts wit=
h default 128MB, and Ubuntu Bionic<br>
fails:<br>
<br>
[ ***=C2=A0 ] (2 of 4) A start job is running for=E2=80=A6Persistent Storag=
e (37s / 2min 1s)<br>
[=C2=A0 *** ] (2 of 4) A start job is running for=E2=80=A6Persistent Storag=
e (38s / 2min 1s)<br>
[=C2=A0 OK=C2=A0 ] Started Flush Journal to Persistent Storage.<br>
Starting Create Volatile Files and Directories...<br>
Starting Armbian ZRAM config...<br>
[=C2=A0 =C2=A0 **] (3 of 6) A start job is running for=E2=80=A6s and Direct=
ories (55s / no limit)<br>
[=C2=A0 =C2=A0 =C2=A0*] (3 of 6) A start job is running for=E2=80=A6s and D=
irectories (55s / no limit)<br>
[=C2=A0 =C2=A0 **] (3 of 6) A start job is running for=E2=80=A6s and Direct=
ories (56s / no limit)<br>
[=C2=A0 OK=C2=A0 ] Started Create Volatile Files and Directories.<br>
[***=C2=A0 =C2=A0] (5 of 6) A start job is running for=E2=80=A6 ZRAM config=
 (1min 10s / 1min 19s)<br>
[**=C2=A0 =C2=A0 ] (5 of 6) A start job is running for=E2=80=A6 ZRAM config=
 (1min 12s / 1min 19s)<br>
[*=C2=A0 =C2=A0 =C2=A0] (5 of 6) A start job is running for=E2=80=A6 ZRAM c=
onfig (1min 13s / 1min 19s)<br>
[FAILED] Failed to start Armbian ZRAM config.<br>
See &#39;systemctl status armbian-zram-config.service&#39; for details.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/arm/orangepi.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c<br>
index 119f370924..da758d7eba 100644<br>
--- a/hw/arm/orangepi.c<br>
+++ b/hw/arm/orangepi.c<br>
@@ -122,6 +122,7 @@ static void orangepi_machine_init(MachineClass *mc)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;max_cpus =3D AW_H3_NUM_CPUS;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_cpus =3D AW_H3_NUM_CPUS;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cor=
tex-a7&quot;);<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1 * GiB;<br>
=C2=A0}<br>
<br>
=C2=A0DEFINE_MACHINE(&quot;orangepi-pc&quot;, orangepi_machine_init)<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--0000000000002281e1059a010fc4--
