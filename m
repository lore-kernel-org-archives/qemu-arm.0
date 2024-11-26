Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp335362njb;
        Tue, 26 Nov 2024 12:10:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjIpBYYlnyzcWUVzffjeqK7eTkXcnpvseymNm5j109KHPDlHBIFLs6kHUwg3iA4q8zCtUlL1gRw0M/PA==@linaro.org
X-Received: by 2002:a92:c243:0:b0:3a7:65fb:b3da with SMTP id e9e14a558f8ab-3a7c55cff9fmr3995515ab.15.1732651840802;
        Tue, 26 Nov 2024 12:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732651840; cv=none;
        d=google.com; s=arc-20240605;
        b=EQVmZGuwljz6YMmExrdDgfBzRcjXfrb5sJqsEjaznbFIolYv+eZg7/hkM8XpSFub10
         DJbL/1/9Nenu9ZNql11D/0oL3SghBlXU5PdfPg+2hYmVp+0ky0HioKhXPb8TWLGqOm7y
         B8XOHDVLTlEv5bbkYdEGcdURHII6tjTPJzDVL4VuwpOEcrXhkbElYloIoePjqa5YhZbq
         VOHJB5tCrBr0zjOk20E7zMP7SHfERMKeuPlcLYWJiHItHF/VZhkI6S9qWyXVNn+PEqY6
         yVtymp4praImN/LavAPtaCnZVCpeBpxqsAH9x4jjmEFHKos372dFyx8nG+hy+y81f1kd
         BN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OZcPBE+v7KMTwCQ8k9OZyOuvM0Ux/flzgVHYBPLK/rU=;
        fh=Jiawyf+SA2F1ZgMH8jnobe+uVT3GJkf5J5unX4L3kRA=;
        b=RK3pNcW3DwAQLHCnEuv+kISKi36VsTh3ctZdJc3tqxP+zHlhIFL2AIbXNqsccSHiV/
         pWOSo5yMrWO4oeQnfDv6yvUraBKHiFCLVA3oCI/pkVZww8ApIHOFDsODdd2J3eI/BqG6
         OS+uiL5Ukz6VIJGztlx6fj9RxND8Ib4g0DI4mYNqZO6bNlUFdBHmcLwyns7YCAuAXvOf
         wi00oW9L48QXyIS0LiKbW8OJurCnGQUWdFVoy7Uy7nI0OcTjYRQMrVIBER9NAIE/J+N1
         cXt+THPypHxAl0UFqwsfnKmP8f/ecImg+JxU6eja38JhCoqnx0K9jfWaqGhboqRiIyiZ
         v8EQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="ahWIQ7/k";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a7ba4bd64csor15908305ab.7.2024.11.26.12.10.40
        (Google Transport Security);
        Tue, 26 Nov 2024 12:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="ahWIQ7/k";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732651840; x=1733256640; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OZcPBE+v7KMTwCQ8k9OZyOuvM0Ux/flzgVHYBPLK/rU=;
        b=ahWIQ7/kw3Qr1/95ojNUTKeFCXoJ8fZMu4Av6bNRbVmUeMC9Sxwt0uFpbQnMsMxPy5
         fWO2FTOpt8AIoNtneNa/2ave6oOVU40P8R8SXXGZKZOhG2Vasb7xwDJiRMBPpXXzMsqn
         XavqLTkWTaHkRKjp8zocAnsElRXDMZjtMzPavZkr/W7VrAjRwLibCLO9oO9nBTwSj2Kg
         v7ocd5o1Q1yMRIbizimez+U1UCwIDY4O2K/Mi3HgEyztjHSnq7vjaE+iIqdtFdV1LAyT
         wh4ucotwwHD1yK/pxdXyjV5B1ZLZaJj+sTktzo4YAem6qIh3tCuiti4KM3hJiWYZRYEI
         3S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732651840; x=1733256640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZcPBE+v7KMTwCQ8k9OZyOuvM0Ux/flzgVHYBPLK/rU=;
        b=Iw/+Uhfx3Ehzn2DveFCnQyizxyPiR0SdRlNB3lU+SeHDAqE7KeBUInDLIZopHzFKeM
         Ba9dsU8m+Uz05TGDWhQMPL9s2HY8VzWackEIwPn37HoW6XjH0f4vU3UNjWsFFKfHY04o
         0KDCrtOl1EN5RzXkew+c0zyQBqz2H4LImX0MM15pPpRYgWNx5rXHMfMJ+57+wTbbkrjG
         sDpDDMgjxsrfmcvGD0iFbwe/S+IeelIix1FyQEaRX5CR0ZFzaEPx/z53i2AZYVRxztlR
         pHAN3mTSX2XprtUzP8jCWUlIAxSCoVrAWJla7KqO1A2CLx2dvYAGuXH9qMdWXACaD30U
         g3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWpYv8GoIHRzsxYsNAIvA/bCexNVYU9f7ncNWL7fCfvY5ZQK02bwzU+bnnTZKmcI7rPMHv96pSyjvK9TPd0/G2VarQ=@linaro.org, AJvYcCXCBpywjNrgqDjGaaLKve677uisQqA7K2N0NLv/qBDavrbDV6njOWQ7KfwYP2q0WIW3Pp8jwJKq+WrggLG/fQ==@linaro.org, AJvYcCXhlJOquggSgPwG9swZNOOPUJxAaA0mEaErN1kr4FWlZO8SJSzum5Hj8e56o43Lol/Wc4Une0DG5l34VQ==@linaro.org
X-Gm-Message-State: AOJu0Yx6jvW7+Q7KXv5GnzJ1gWR1BuAiwk0ukPwPtXOWgv5grYw2kdXX
	TyiJfRV20rAsy5waKaMgMNnQAsUAGcYJrC5tFV1lkrrg2rlW5fUB0Snt0Ef6EL2LMsKRjqjM/3U
	2Hb5VoKM+jdtcTW1yQIXvIBM/WKTuvg==
X-Gm-Gg: ASbGncttWEfNGqP6gD3EMrNs73D5qqXC0J7ZK6naWo1+JY+wQrQ1XjHM4lgZueCyZQH
	SwSEzqTL3W2ZERI1CWRJt4CrkF3LNgPcllSV6byAyNo8wc5j84VugCgYbfdveaA==
X-Google-Smtp-Source: AGHT+IHGkVovRLTc9S8HzRFYl+KODBFIBIgOxgtVslpQuXwW+3p9gnBcneyFvj8OWSGZoxtiAdX4ghkN09xcvjBep50=
X-Received: by 2002:a92:c243:0:b0:3a7:65fb:b3da with SMTP id
 e9e14a558f8ab-3a7c55cff9fmr3995005ab.15.1732651840028; Tue, 26 Nov 2024
 12:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
 <20241122225049.1617774-9-pierrick.bouvier@linaro.org> <c18bc538-2036-49ad-b629-ae40486934cc@linaro.org>
In-Reply-To: <c18bc538-2036-49ad-b629-ae40486934cc@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 26 Nov 2024 21:10:29 +0100
Message-ID: <CAPan3Wqw+LG1hNx3RFR6SbN4FGzO+fCZvgDNfcPG=dU3heU5yQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] docs/system/arm/orangepi: update links
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org, 
	Steven Lee <steven_lee@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: multipart/alternative; boundary="00000000000071cf1d0627d67107"
X-TUID: 3jkGWEpHNktv

--00000000000071cf1d0627d67107
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Pierrick,

Thanks for including orangepi documentation in your updates.

On Tue, Nov 26, 2024 at 8:00=E2=80=AFPM Pierrick Bouvier <
pierrick.bouvier@linaro.org> wrote:

> On 11/22/24 14:50, Pierrick Bouvier wrote:
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >   docs/system/arm/orangepi.rst | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rs=
t
> > index 9afa54213b0..db87e81fec4 100644
> > --- a/docs/system/arm/orangepi.rst
> > +++ b/docs/system/arm/orangepi.rst
> > @@ -119,7 +119,7 @@ Orange Pi PC images
> >   Note that the mainline kernel does not have a root filesystem. You ma=
y
> provide it
> >   with an official Orange Pi PC image from the official website:
> >
> > -  http://www.orangepi.org/downloadresources/
> > +  http://www.orangepi.org/html/serviceAndSupport/index.html
> >
> >   Another possibility is to run an Armbian image for Orange Pi PC which
> >   can be downloaded from:
> > @@ -213,7 +213,7 @@ including the Orange Pi PC. NetBSD 9.0 is known to
> work best for the Orange Pi P
> >   board and provides a fully working system with serial console,
> networking and storage.
> >   For the Orange Pi PC machine, get the 'evbarm-earmv7hf' based image
> from:
> >
> > -
> https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg=
/armv7.img.gz
> > +
> https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-9.0/evbarm-earmv7hf/=
binary/gzimg/armv7.img.gz
> >
> >   The image requires manually installing U-Boot in the image. Build
> U-Boot with
> >   the orangepi_pc_defconfig configuration as described in the previous
> section.
>
> Regarding our conversation on IRC with Peter, is seems that google
> reference www.orangepi.org only through http, and not https.
> As the host is currently down, I'm not sure if https really works or
> not. So maybe it's better to stick with http for now.
>

Yes, I also just noted that the orangepi.org website is not responding.
However earlier this week, I was able to load the new URL above to the
official website.
Perhaps it is only temporary down, but we can only be sure once it comes
back up.
The NetBSD image URL is OK, ive also verified that the hash is the same.

So for me:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek

--=20
Niek Linnenbank

--00000000000071cf1d0627d67107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Pierrick,</div><div><br></div>=
<div>Thanks for including orangepi documentation in your updates.<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Nov 26, 2024 at 8:00=E2=80=AFPM Pierrick Bouvier &lt;<a href=3D"mai=
lto:pierrick.bouvier@linaro.org">pierrick.bouvier@linaro.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 11/22/24 14:=
50, Pierrick Bouvier wrote:<br>
&gt; Signed-off-by: Pierrick Bouvier &lt;<a href=3D"mailto:pierrick.bouvier=
@linaro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0docs/system/arm/orangepi.rst | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.r=
st<br>
&gt; index 9afa54213b0..db87e81fec4 100644<br>
&gt; --- a/docs/system/arm/orangepi.rst<br>
&gt; +++ b/docs/system/arm/orangepi.rst<br>
&gt; @@ -119,7 +119,7 @@ Orange Pi PC images<br>
&gt;=C2=A0 =C2=A0Note that the mainline kernel does not have a root filesys=
tem. You may provide it<br>
&gt;=C2=A0 =C2=A0with an official Orange Pi PC image from the official webs=
ite:<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 <a href=3D"http://www.orangepi.org/downloadresources/" rel=3D"=
noreferrer" target=3D"_blank">http://www.orangepi.org/downloadresources/</a=
><br>
&gt; +=C2=A0 <a href=3D"http://www.orangepi.org/html/serviceAndSupport/inde=
x.html" rel=3D"noreferrer" target=3D"_blank">http://www.orangepi.org/html/s=
erviceAndSupport/index.html</a><br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Another possibility is to run an Armbian image for Orange =
Pi PC which<br>
&gt;=C2=A0 =C2=A0can be downloaded from:<br>
&gt; @@ -213,7 +213,7 @@ including the Orange Pi PC. NetBSD 9.0 is known to=
 work best for the Orange Pi P<br>
&gt;=C2=A0 =C2=A0board and provides a fully working system with serial cons=
ole, networking and storage.<br>
&gt;=C2=A0 =C2=A0For the Orange Pi PC machine, get the &#39;evbarm-earmv7hf=
&#39; based image from:<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 <a href=3D"https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm=
-earmv7hf/binary/gzimg/armv7.img.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/ar=
mv7.img.gz</a><br>
&gt; +=C2=A0 <a href=3D"https://archive.netbsd.org/pub/NetBSD-archive/NetBS=
D-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz" rel=3D"noreferrer" target=
=3D"_blank">https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-9.0/evbarm=
-earmv7hf/binary/gzimg/armv7.img.gz</a><br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0The image requires manually installing U-Boot in the image=
. Build U-Boot with<br>
&gt;=C2=A0 =C2=A0the orangepi_pc_defconfig configuration as described in th=
e previous section.<br>
<br>
Regarding our conversation on IRC with Peter, is seems that google <br>
reference <a href=3D"http://www.orangepi.org" rel=3D"noreferrer" target=3D"=
_blank">www.orangepi.org</a> only through http, and not https.<br>
As the host is currently down, I&#39;m not sure if https really works or <b=
r>
not. So maybe it&#39;s better to stick with http for now.<br></blockquote><=
div>=C2=A0</div><div>Yes, I also just noted that the <a href=3D"http://oran=
gepi.org">orangepi.org</a> website is not responding. However earlier this =
week, I was able to load the new URL above to the official website.</div><d=
iv>Perhaps it is only temporary down, but we can only be sure once it comes=
 back up.</div><div>The NetBSD image URL is OK, ive also verified that the =
hash is the same.</div><div><br></div><div>So for me:<br></div><div><br></d=
iv><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@g=
mail.com">nieklinnenbank@gmail.com</a>&gt;<br></div></div><div><br></div><d=
iv>Regards,</div><div>Niek<br clear=3D"all"></div><br><span class=3D"gmail_=
signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div></div>

--00000000000071cf1d0627d67107--
