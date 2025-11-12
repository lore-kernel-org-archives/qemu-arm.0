Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD8CCF9E3
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 15:25:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJCi8-0005JT-Rh; Wed, 12 Nov 2025 10:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vJCgy-0004EI-Pl
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 10:23:31 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vJCgw-0001Vf-RG
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 10:23:28 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-29586626fbeso9198355ad.0
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 07:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762961004; x=1763565804; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aQoFD8HHNCUzu8Xv77GZfmrU4JLWRGqETvU5zFCEuZo=;
 b=DRxFMR0vsjSp3qtlQnRLst3oppyPcAro5wio3FWSB8+NMBDWUa//8NbqIiqgph46sq
 9pjhM9RvTzDHQCDSUmMR2uGar4bNb/BEL+TlyTcG4hJOD9UCSdSb7IgzF7x6z3FXmP3W
 nNsjStKouJK9HPcDIUyXCGbM95YzPM6BWFLqVXGHtumzzpeiYSfSho28R1VLRUkN9VAC
 DnAbK5YmHyaHHB7pqqEWWTSVPkPdV5kbOpyxIyGX0ByMnbJy/kIpI+6nLjB0l5sj0Kj4
 joYhJiOI7sVBpsz2NMNMSiTJ999gj0nuC2OpRkIcBS+F4PrEg6dAtJto7z8cLOiy0HRg
 +elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762961004; x=1763565804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQoFD8HHNCUzu8Xv77GZfmrU4JLWRGqETvU5zFCEuZo=;
 b=jkoInbq9cNSbcMmh/NPSTIzobkl3TCEOpvERiB/EOcAt1YMHkdLx2tAx5zHp3gAJOt
 HqQyaf1SxoxRvPkvUel7i3VjRaPoWW4BUOed03vz//3yEBKtTKxkwkHnuEJDJek9W6hu
 kBPvZ+hXNi3gqL+pmWQR5SqPOHDlscG1vPaikDZNzEceBRdhSHHSm3A9vuuMe6sf3Ib9
 Q+yYONW+IeZilrxtIIUL63WhhOfgSkEyv3v30GEptcuyRaNZAv4veSJ/yRV5N71Y+tcd
 wW2pCh7zKNmDOBKdNR4TgjBEIPHxI5nZ4U9u2j+vhQfYikPHendUn6idcXlfA/okSalV
 eWfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU72a7PYWO3egaBL6AOBVTcfuCcN+e6+VObe+p0Uwnj9v0U/K+Zj9quamk0moDSaVm2HVp6qL3TjA==@nongnu.org
X-Gm-Message-State: AOJu0Yy54jIn8sm6SzkB+632eP/4gXo89p7+T57IP6KGYSOjt6zFiUKL
 nZvCXKdkoKrQtsE8arvt9IRxvAfqIlO4J2O5h6bvJqAw627FC9654TGyAqvaBmS0n3jwPCNXHOh
 gcC2pD4iVOuGh19C+cCN6dN2Tf9dsnQ4=
X-Gm-Gg: ASbGncsclyLuMogHrM0+xW7G9cAdxBWZSDYieNXhETrtVQ4vBj8fHfEfRW2qU+LrrPJ
 n08kZYOrZrMmMD3uMvmnDv9HPOhFqA4GoURuX3424C+c5ahJFqiT9z6ATBfPkJw6xmBj6f4j2Un
 bi1xv+2r3LqGmBu094a3Cah1KubF1Bk9XDvKiSuheHpzQeHROXiVi/9auDZYiUPpxFYuloLW2VX
 JR1oQlHPvyV4k+OcWG8OHrEOdZd17FN/xvgGTCG3PVNr1/ygT7eZ9tGYMDI9255sLZas2h7Qil5
 17Z30G9RVM/Sp4A=
X-Google-Smtp-Source: AGHT+IF3WSJKlxx4PFfnmdF9dVEWavrMVXOkgMhtp3vjRM5O2tUj2a21XIS2+2O1FqyAXifna1jXAEeR1yUyZZsKlYw=
X-Received: by 2002:a17:903:244a:b0:295:1aa7:edf7 with SMTP id
 d9443c01a7336-2984edaaeb0mr42748425ad.30.1762961004324; Wed, 12 Nov 2025
 07:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20251111171724.78201-1-alex.bennee@linaro.org>
 <20251111171724.78201-2-alex.bennee@linaro.org>
In-Reply-To: <20251111171724.78201-2-alex.bennee@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 13 Nov 2025 00:23:12 +0900
X-Gm-Features: AWmQ_bnKMzPbFk434dGlXinTwKvQee_I0gzBdLN9S0ZpzTEkJ-usQIqLqOXaNI0
Message-ID: <CAEDrbUbLNbTkVTYTnodZPXsPyBJ+ci9DoxLDyP8FRyf2u0QGgw@mail.gmail.com>
Subject: Re: [PATCH 01/16] tests/docker: drop --link from COPYs in emsdk docker
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>, 
 Thomas Huth <thuth@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gustavo Romero <gustavo.romero@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006a6e2006436758c1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--0000000000006a6e2006436758c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> As we need to build images in both docker and podman lets not have any
> incompatibilities. I don't think it makes any major difference.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/emsdk-wasm32-cross.docker | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
b/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
> index 6b1642a207c..1f08eb0b855 100644
> --- a/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
> +++ b/tests/docker/dockerfiles/emsdk-wasm32-cross.docker
> @@ -115,8 +115,8 @@ RUN mkdir -p /glib
>  RUN curl -Lks
https://download.gnome.org/sources/glib/${GLIB_MINOR_VERSION}/glib-$GLIB_VE=
RSION.tar.xz
| \
>      tar xJC /glib --strip-components=3D1
>
> -COPY --link --from=3Dzlib-dev /builddeps/ /builddeps/
> -COPY --link --from=3Dlibffi-dev /builddeps/ /builddeps/
> +COPY --from=3Dzlib-dev /builddeps/ /builddeps/
> +COPY --from=3Dlibffi-dev /builddeps/ /builddeps/
>
>  WORKDIR /glib
>  RUN <<EOF
> @@ -141,5 +141,5 @@ RUN sed -i -E "/#define HAVE_PTHREAD_GETNAME_NP 1/d"
./_build/config.h
>  RUN meson install -C _build
>
>  FROM build-base
> -COPY --link --from=3Dglib-dev /builddeps/ /builddeps/
> -COPY --link --from=3Dpixman-dev /builddeps/ /builddeps/
> +COPY --from=3Dglib-dev /builddeps/ /builddeps/
> +COPY --from=3Dpixman-dev /builddeps/ /builddeps/

Reviewed-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>

Regards,
Kohei Tokunaga

--0000000000006a6e2006436758c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; As we need to build images in both d=
ocker and podman lets not have any<br>&gt; incompatibilities. I don&#39;t t=
hink it makes any major difference.<br>&gt; <br>&gt; Signed-off-by: Alex Be=
nn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.=
org</a>&gt;<br>&gt; ---<br>&gt; =C2=A0tests/docker/dockerfiles/emsdk-wasm32=
-cross.docker | 8 ++++----<br>&gt; =C2=A01 file changed, 4 insertions(+), 4=
 deletions(-)<br>&gt; <br>&gt; diff --git a/tests/docker/dockerfiles/emsdk-=
wasm32-cross.docker b/tests/docker/dockerfiles/emsdk-wasm32-cross.docker<br=
>&gt; index 6b1642a207c..1f08eb0b855 100644<br>&gt; --- a/tests/docker/dock=
erfiles/emsdk-wasm32-cross.docker<br>&gt; +++ b/tests/docker/dockerfiles/em=
sdk-wasm32-cross.docker<br>&gt; @@ -115,8 +115,8 @@ RUN mkdir -p /glib<br>&=
gt; =C2=A0RUN curl -Lks <a href=3D"https://download.gnome.org/sources/glib/=
${GLIB_MINOR_VERSION}/glib-$GLIB_VERSION.tar.xz">https://download.gnome.org=
/sources/glib/${GLIB_MINOR_VERSION}/glib-$GLIB_VERSION.tar.xz</a> | \<br>&g=
t; =C2=A0 =C2=A0 =C2=A0tar xJC /glib --strip-components=3D1<br>&gt; <br>&gt=
; -COPY --link --from=3Dzlib-dev /builddeps/ /builddeps/<br>&gt; -COPY --li=
nk --from=3Dlibffi-dev /builddeps/ /builddeps/<br>&gt; +COPY --from=3Dzlib-=
dev /builddeps/ /builddeps/<br>&gt; +COPY --from=3Dlibffi-dev /builddeps/ /=
builddeps/<br>&gt; <br>&gt; =C2=A0WORKDIR /glib<br>&gt; =C2=A0RUN &lt;&lt;E=
OF<br>&gt; @@ -141,5 +141,5 @@ RUN sed -i -E &quot;/#define HAVE_PTHREAD_GE=
TNAME_NP 1/d&quot; ./_build/config.h<br>&gt; =C2=A0RUN meson install -C _bu=
ild<br>&gt; <br>&gt; =C2=A0FROM build-base<br>&gt; -COPY --link --from=3Dgl=
ib-dev /builddeps/ /builddeps/<br>&gt; -COPY --link --from=3Dpixman-dev /bu=
ilddeps/ /builddeps/<br>&gt; +COPY --from=3Dglib-dev /builddeps/ /builddeps=
/<br>&gt; +COPY --from=3Dpixman-dev /builddeps/ /builddeps/<br><br>Reviewed=
-by: Kohei Tokunaga &lt;<a href=3D"mailto:ktokunaga.mail@gmail.com">ktokuna=
ga.mail@gmail.com</a>&gt;<br><br>Regards,<br>Kohei Tokunaga<br><br></div></=
div>

--0000000000006a6e2006436758c1--

