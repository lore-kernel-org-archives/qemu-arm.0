Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1180378lfc;
        Tue, 10 Mar 2020 13:38:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vshabzkON3r26LcZoYuFFbqJtkWzCRfKXrye1m66TgShmzKYaJN/QuqZ6Shf1Vo/W3Oh/0J
X-Received: by 2002:a05:620a:1517:: with SMTP id i23mr20741852qkk.459.1583872680054;
        Tue, 10 Mar 2020 13:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583872680; cv=none;
        d=google.com; s=arc-20160816;
        b=IlbShYY5ZxQ+b8y+bzuJqLJu1bfxaqGLO7MaCVxxw6xLxs+/WPh8aUwsatQQuDgiut
         yYsOFybBoZY9wlksvtaCXNCeRYD3hW3V5IhOwhOuzV1RLpsgYNT3dYLfSXdxiRSR8YQF
         Vnfh7c2RhbHTGFWxhQ/5fbihrsVuq/KO/OmNNEmFLRcvL4eAxJ/8HmRe3I4EKCvS9Up4
         FRWUvR35szZczKLJ9IuYb+ulGGLzwEnJTGJkfaxB04iV/eLmM8USDz8/GrJorYe6FxMQ
         3mo1j1z/dfC5xk5smqhJoIzG/5lgxj19RaFv2pki94n9PbqjcB3Dm98OmIix8ln1m7X8
         j8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MvAZVxuil2DxjBj7rVmkBNCfZoBmbXssfX+/IEcrzlc=;
        b=0r9aeWCAeAWvw/Issb/F0x+qTAvh51zFHg3wSdbgZr+PPUXg+rHP4wPrZ9eLnJvp6m
         k7s6HKYvtIHCafmXzw3KArQgTdJTjIICdk/JQUqeuwoCDgUM7cH1qQ9RWirp/XT7WvON
         K+MAEFzRAvxNJwa5ChoCKs87tPIe1el1+hAbUlPxqKCAIAbWnsA7uP85gLpOY6jOcHOE
         PgBN9HhF9g4fyrQ6fdfKIvYjU4jX8RJXaeaTPudt3gx2/LacvmPf5VRQ1FuBjfaaYFvp
         +tOiiwKmcWBLIbPBxGQNwyUWTH3bphWmpXBSAyjt1n0HVZ7ks/QbwXJD9b8wUavHC0tC
         f7LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="QaqF/EMe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l34si7036563qta.41.2020.03.10.13.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 13:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="QaqF/EMe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBldX-00025C-FV
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 16:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jBldP-000255-ED
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 16:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jBldO-0002dU-0o
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 16:37:51 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:37323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jBldN-0002dK-SN; Tue, 10 Mar 2020 16:37:49 -0400
Received: by mail-io1-xd43.google.com with SMTP id k4so14227235ior.4;
 Tue, 10 Mar 2020 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MvAZVxuil2DxjBj7rVmkBNCfZoBmbXssfX+/IEcrzlc=;
 b=QaqF/EMeKtroURm0XbhyO7p57iwdEtTS3beUzi0GidKNQhhZ1qKkWeqKlKVKYXkJ/b
 vEn9Uov/mFXUxrkDv5nY0wSo5vbdbwCUULBi6WCPv0eCOD/1m6uH29jUMcD5fQqbyfhM
 X4bTV8Y6JPzHO1aStG3xMPrWPFsJ5CH5xpTCgBoXbzbdmOIH1BM37oA7w4ePgxM+UQVn
 HdzG9rMjV0ALYNgRvLbP8ggIHRTB5XbObxGpNDkeGTiWjkIcGbskl0cMJnpBXcZ17uPF
 DISlt7frKIHW3NGt1w1GLhXHAtXfSPQtKS6WLnypmAc28ZhFeA56UdWne3UFG5vHPKvJ
 Ggog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvAZVxuil2DxjBj7rVmkBNCfZoBmbXssfX+/IEcrzlc=;
 b=fn13HsIs7CJtAWP0tEeFwpcoJaEyg0xdS12mXWhELMdwHTMOpSgHjwTdiiQP02AyP4
 7dUA7dQaKJUo6T88kI1lD43UuLfl3bLxjJ2pBDuQt2Ert7uFFTU7PC2Gx2jkSilA9xWM
 W5oMJcv98VILrnrVuUyTi5r+9NDnZVJr0A3SmmXd6QuhF6Xin2x9m4K0rtPCjR8yXW6Z
 z99vJl9auYwdwxhR5qXiOf8beJwdcQBbalRvXEuimbEadW94xC9rlPefR0JPiscEoGTi
 5r2+0dUmhPgjmHZiX+dRezCsuabR4MdwJyk36DS2MRQNXpdWu6H8HsN/6claSBumaFwh
 A7OA==
X-Gm-Message-State: ANhLgQ2g+EfLaJukYeLyI7Y65MgEGrI7dP2jZP/dOySRrIxHVCuUatzE
 yedt3s3kuze/imWFOEBz40SVyuqNzu/xL66scQk=
X-Received: by 2002:a02:7b13:: with SMTP id q19mr21941727jac.73.1583872669058; 
 Tue, 10 Mar 2020 13:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200309215818.2021-1-peter.maydell@linaro.org>
 <20200309215818.2021-2-peter.maydell@linaro.org>
In-Reply-To: <20200309215818.2021-2-peter.maydell@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 10 Mar 2020 21:37:37 +0100
Message-ID: <CAPan3WqtE6NGTd=yCG2zCirgeCDtv+eSgg4DSF+hCtn9rihk7A@mail.gmail.com>
Subject: Re: [PATCH 1/5] Makefile: Allow for subdirectories in Sphinx manual
 dependencies
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cf090905a086173a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
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
X-TUID: SZhadzvSLNZM

--000000000000cf090905a086173a
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

On Mon, Mar 9, 2020 at 10:58 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Currently we put 'docs/foo/*.rst' in the Make list of dependencies
> for the Sphinx 'foo' manual, which means all the files must be
> in the top level of that manual's directory. We'd like to be
> able to have subdirectories inside some of the manuals, so add
> 'docs/foo/*/*.rst' to the dependencies too.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 2e930688942..5dba949947a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1081,7 +1081,7 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \
>  # a single doctree: https://github.com/sphinx-doc/sphinx/issues/2946
>  build-manual = $(call quiet-command,CONFDIR="$(qemu_confdir)"
> $(SPHINX_BUILD) $(if $(V),,-q) -W -b $2 -D version=$(VERSION) -D
> release="$(FULL_VERSION)" -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1
> $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$1")
>  # We assume all RST files in the manual's directory are used in it
> -manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst) \
> +manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst
> $(SRC_PATH)/docs/$1/*/*.rst) \
>                $(SRC_PATH)/docs/defs.rst.inc \
>                $(SRC_PATH)/docs/$1/conf.py $(SRC_PATH)/docs/conf.py
>  # Macro to write out the rule and dependencies for building manpages
> --
> 2.20.1
>
>

-- 
Niek Linnenbank

--000000000000cf090905a086173a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklin=
nenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2020 =
at 10:58 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">p=
eter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Currently we put &#39;docs/foo/*.rst&#39; in the Mak=
e list of dependencies<br>
for the Sphinx &#39;foo&#39; manual, which means all the files must be<br>
in the top level of that manual&#39;s directory. We&#39;d like to be<br>
able to have subdirectories inside some of the manuals, so add<br>
&#39;docs/foo/*/*.rst&#39; to the dependencies too.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0Makefile | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/Makefile b/Makefile<br>
index 2e930688942..5dba949947a 100644<br>
--- a/Makefile<br>
+++ b/Makefile<br>
@@ -1081,7 +1081,7 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \<br>
=C2=A0# a single doctree: <a href=3D"https://github.com/sphinx-doc/sphinx/i=
ssues/2946" rel=3D"noreferrer" target=3D"_blank">https://github.com/sphinx-=
doc/sphinx/issues/2946</a><br>
=C2=A0build-manual =3D $(call quiet-command,CONFDIR=3D&quot;$(qemu_confdir)=
&quot; $(SPHINX_BUILD) $(if $(V),,-q) -W -b $2 -D version=3D$(VERSION) -D r=
elease=3D&quot;$(FULL_VERSION)&quot; -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1=
 $(MANUAL_BUILDDIR)/$1 ,&quot;SPHINX&quot;,&quot;$(MANUAL_BUILDDIR)/$1&quot=
;)<br>
=C2=A0# We assume all RST files in the manual&#39;s directory are used in i=
t<br>
-manual-deps =3D $(wildcard $(SRC_PATH)/docs/$1/*.rst) \<br>
+manual-deps =3D $(wildcard $(SRC_PATH)/docs/$1/*.rst $(SRC_PATH)/docs/$1/*=
/*.rst) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SRC_PATH)/docs/def=
s.rst.inc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SRC_PATH)/docs/$1/=
conf.py $(SRC_PATH)/docs/conf.py<br>
=C2=A0# Macro to write out the rule and dependencies for building manpages<=
br>
-- <br>
2.20.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--000000000000cf090905a086173a--
