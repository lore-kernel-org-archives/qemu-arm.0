Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1198851lfc;
        Tue, 10 Mar 2020 14:00:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuMHZj3yugsTzATl03irYOoThcu25KZWmhTpl9zEx9pk9U/ta/l+JMcIBaKeUjCFLAPZPsk
X-Received: by 2002:ad4:4f47:: with SMTP id eu7mr86499qvb.69.1583874050445;
        Tue, 10 Mar 2020 14:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583874050; cv=none;
        d=google.com; s=arc-20160816;
        b=s1XdcQrFWc4Wpa+Vwac74ueXvsZrQiu2b/UMD5msQGg7pFFGEGoHdl8GdN5kzctVGM
         74dBbZlH+rCp0Fz1Eulx+QuZcu+urz4PAYt4DUpC8d6G5oZZeUnaBmgmAlzjVh4Rh+ha
         PsEQTCTzaMrFxPIoUkJQh9Y8YTcSegtW1X8V81JqkuPady6GKLpJs9ztGMN2fNpJlE1C
         FhNdeNB2+4FYNSrU7hXmayqdl6VhoHWOBxeQnyk94c6F/zQ4Vz69cldDnJS08t9IbN99
         LFP1kG48QX7S+z1um/CVoT3XPGVjTloMGZDUOfi0JHn5NBYnGsXSnaOUYs3lFAAh+K/D
         n1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+k539H0wdv25YofOsGPJ1QwrqIJwYGHEDLwgvx5ARbE=;
        b=q+JafG9wOwbnjQdhr686D7LEE7H45UuA6Oe8MyQ85mGM5/YKrPLQQSaySA1+c8e/85
         Pe6B3NBdubkFEI03TpDpuTSq/TW3JoEHh8JlCvIoO+ldBALITciRRpEduwPWZO6bhEih
         UldYP109NoGCIJd6qpROU/ifO3zwTEA00jr0zdVfpKrzE7BsWU/VCWw1bcIqFr9T6GFX
         4H2fmS9uoaFCOqTRyLYw1Jdh3t95/tKE0EqNez8getoMOn4MlToDXA1awDSHZ3UCbrMo
         hIU1PAnFn8NVzhJC8x3nM1aPoTnIm+JJvXOZlHtoC/f6fGQvSpz5gngkFwtYN9JpHGQx
         Dz4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rCG+CtDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si8688808qkc.129.2020.03.10.14.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 14:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rCG+CtDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBlzc-0005lL-Sq
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 17:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jBlz9-0005kW-KF
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:00:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jBlz8-0002NM-BB
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:00:19 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:39710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jBlz8-0002LX-4c; Tue, 10 Mar 2020 17:00:18 -0400
Received: by mail-io1-xd44.google.com with SMTP id f21so10120809iol.6;
 Tue, 10 Mar 2020 14:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+k539H0wdv25YofOsGPJ1QwrqIJwYGHEDLwgvx5ARbE=;
 b=rCG+CtDdTlmVmj/OnvhBXBifN8Lm57OJagmRYnPWVZX+ZKSeO+XuaX+k72FsTEUDmi
 x/lf/w3DJnyMJrfSYgUW0RiE1xPgxVtNmmNem9lwUowxsdmxvDFD+EfQyw4Q4xHXkip/
 GlRxXmcOSfBsU2EQ8Q+RgILy37EdzjdzfgWtVzec72JuNiL4dD3YR7XRLKNQMwai0/nf
 j9ve55BbPrD+4GNty3hR8lStSZ1k6iXlw4QhGlFK/wNPmd7Fua3wJylnQRnzUxIOF5Ss
 pfAR+TyjPPpGp6RK1nKMB6MaONeKhAF8enaylKeyueUg29CtHQbQ4h7rRhrTWoYwq4C3
 n7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+k539H0wdv25YofOsGPJ1QwrqIJwYGHEDLwgvx5ARbE=;
 b=A5r5p30wqkp6juLGQgE4guTlJ2UX7RpRg5sndG/uJ/IiFWaTXgZ0Y5yGZVe9n2z0lv
 5G2rnu7JPQl4hoVXBet2e0cE6sQGZ9FwBnOMM2qHOFytL8u/ZBftCqGwG920gEFp1nZ+
 ocikD5u1+kMUy9Dh7hl9ORUX7GPApgHZLJNjJuXnVXrCKKStbRNFgnk3rQmeJdLvuB68
 sVDkQRB5CBFCLz08NtAXEJhM493NrX8aUhVVBBHpMVwPJioX+icPp547J4CtVWKx6GcR
 yPZFMOHU1NutKT2w8CgGCL/eYAjeFOcc9dSchIyrJXT1j/8YvvqfDF2WysM6jBrrLRtM
 uXNA==
X-Gm-Message-State: ANhLgQ2gf9WMGRpE2Mjhrjwfqnw6ySA4yyJGO+J7mXHUWNMggon7A7I+
 HeSp9K3YYEbhuOceoGi+jZwEfQBjsvy/5BxkDfE=
X-Received: by 2002:a02:856a:: with SMTP id g97mr9689jai.97.1583874016786;
 Tue, 10 Mar 2020 14:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200309215818.2021-1-peter.maydell@linaro.org>
 <20200309215818.2021-5-peter.maydell@linaro.org>
In-Reply-To: <20200309215818.2021-5-peter.maydell@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 10 Mar 2020 22:00:04 +0100
Message-ID: <CAPan3WrNQRbnx-bTjPpEbW=wNQS2tR0EGien18mPimn5YGmTZg@mail.gmail.com>
Subject: Re: [PATCH 4/5] docs: Move arm-cpu-features.rst into the system manual
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000023bd3d05a08668a1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y7tQFQ8IzM4g

--00000000000023bd3d05a08668a1
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

On Mon, Mar 9, 2020 at 10:58 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Now we have somewhere to put arm-specific rst documentation,
> we can move arm-cpu-features.rst from the docs/ top level
> directory into docs/system/arm/.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .../{arm-cpu-features.rst => system/arm/cpu-features.rst} | 8 +-------
>  docs/system/target-arm.rst                                | 6 ++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename docs/{arm-cpu-features.rst => system/arm/cpu-features.rst} (99%)
>
> diff --git a/docs/arm-cpu-features.rst b/docs/system/arm/cpu-features.rst
> similarity index 99%
> rename from docs/arm-cpu-features.rst
> rename to docs/system/arm/cpu-features.rst
> index fc1623aeca5..7495b7b672b 100644
> --- a/docs/arm-cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -1,11 +1,5 @@
> +Arm CPU Features
>  ================
> -ARM CPU Features
> -================
> -
> -Examples of probing and using ARM CPU features
> -
> -Introduction
> -============
>
>  CPU features are optional features that a CPU of supporting type may
>  choose to implement or not.  In QEMU, optional CPU features have
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 86ea6f2f568..1425bd5303a 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -78,3 +78,9 @@ undocumented; you can get a complete list by running
>     arm/stellaris
>     arm/musicpal
>     arm/sx1
> +
> +Arm CPU features
> +================
> +
> +.. toctree::
> +   arm/cpu-features
> --
> 2.20.1
>
>

-- 
Niek Linnenbank

--00000000000023bd3d05a08668a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklin=
nenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2020 =
at 10:58 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">p=
eter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Now we have somewhere to put arm-specific rst docume=
ntation,<br>
we can move arm-cpu-features.rst from the docs/ top level<br>
directory into docs/system/arm/.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../{arm-cpu-features.rst =3D&gt; system/arm/cpu-features.rst} | 8 +-=
------<br>
=C2=A0docs/system/target-arm.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +=
+++++<br>
=C2=A02 files changed, 7 insertions(+), 7 deletions(-)<br>
=C2=A0rename docs/{arm-cpu-features.rst =3D&gt; system/arm/cpu-features.rst=
} (99%)<br>
<br>
diff --git a/docs/arm-cpu-features.rst b/docs/system/arm/cpu-features.rst<b=
r>
similarity index 99%<br>
rename from docs/arm-cpu-features.rst<br>
rename to docs/system/arm/cpu-features.rst<br>
index fc1623aeca5..7495b7b672b 100644<br>
--- a/docs/arm-cpu-features.rst<br>
+++ b/docs/system/arm/cpu-features.rst<br>
@@ -1,11 +1,5 @@<br>
+Arm CPU Features<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-ARM CPU Features<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-Examples of probing and using ARM CPU features<br>
-<br>
-Introduction<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0CPU features are optional features that a CPU of supporting type may<=
br>
=C2=A0choose to implement or not.=C2=A0 In QEMU, optional CPU features have=
<br>
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst<br>
index 86ea6f2f568..1425bd5303a 100644<br>
--- a/docs/system/target-arm.rst<br>
+++ b/docs/system/target-arm.rst<br>
@@ -78,3 +78,9 @@ undocumented; you can get a complete list by running<br>
=C2=A0 =C2=A0 arm/stellaris<br>
=C2=A0 =C2=A0 arm/musicpal<br>
=C2=A0 =C2=A0 arm/sx1<br>
+<br>
+Arm CPU features<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+.. toctree::<br>
+=C2=A0 =C2=A0arm/cpu-features<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--00000000000023bd3d05a08668a1--
