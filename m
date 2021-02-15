Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5914701lfc;
        Mon, 15 Feb 2021 12:31:04 -0800 (PST)
X-Received: by 2002:a02:660b:: with SMTP id k11mr17237212jac.120.1613421064347;
        Mon, 15 Feb 2021 12:31:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613421064; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJiT3sTQxSH1Ay+D1DC/39mTs56gbVdyVzAyRkcXQ0UJTDN+gnFd6wPmAy4y8D552K
         S864GphVRFeOfigs87jHLB8NefwL/idEMsaU5mj+lqkhqZZvlS3D3UUZpdlu1f2vkEM2
         CghQrj4lBBrl5ibDbDSfnn5Azvb7hmEh4BXOQZskC3RviELL1eLkvb0ucihlbie6rcwt
         qzUK2VGIrhCGThh/EQZwXKx51yHjLjbui6tdFoxkQoSHyuX7ainsRlPj53MdZcETpx2P
         w6pS8LomhvydvL4Y0J2omex0Kfmj4ReYZv9adq40YyXAhmGqzwTCMJrZKd2P2XeGN2mU
         zE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=78fwAa+Rsw01RxG2wWugKvlSZtpYHUe6+3hnhVfYDCw=;
        b=joGdGECWJXLeEjNKlsywOwGMqb+gKtTnLpFqQl9o/o9YsBmD6mdafbOz9EbkoymjMe
         3n8FCRje4KJ5e8ScOXWGIr8YVIu1njY84NurLP3bMi3Jdp96opzqMxB8opOs8xrtnNMA
         u7nPZyLGE2qMfqIOnAkxB8i1nMloi2myjjfvtAb30XdqUPA4dfnvbh44P/fNV7xS9rB0
         kKhPWZpOPQG2BsRB9sfmz/FmwhonjrsXekYFRZq8s+2T4WG8C/QwUmb4X1FyZQAlPl7z
         MzNGdj3bGbJ2VAEl5EVpq8hqM4IgV+G9DRGNepfBMs+8DdfaD9kGsdjesvkaMcOA8YMj
         oGQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBmHsztu;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z18sor491119ilp.70.2021.02.15.12.31.04
        (Google Transport Security);
        Mon, 15 Feb 2021 12:31:04 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBmHsztu;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=78fwAa+Rsw01RxG2wWugKvlSZtpYHUe6+3hnhVfYDCw=;
        b=dBmHsztun12FVOFpF17R10e1VYCMWEoXBvlw8Z8j0AN0FJfejEV32fZT+Z2JR5zqVN
         mrDmFCBmq9sneXUbG4nb/opxppy2C59ct0e/b4XfdDuL8qYZUdSi4QN65vNIyUMTaBlR
         O1HjeBVukFmRisuWTxMtWl1QOozRgO9MCf+PDhUgg65mfeZm1V9HZ+S4q+LNjmdNG6De
         Kno5bokmRLKtqgltOmF99L5tQ4bhjcckC+QiD8zb4oR0XmbaA0xGKxW4cze3azYrnAGO
         sjn3A2TN7UX7DcRdoMvbKnoroFEIxMu9y7s8cxpevHK5Y94plmrIG7+8MaHsnF8Vn9JG
         KeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=78fwAa+Rsw01RxG2wWugKvlSZtpYHUe6+3hnhVfYDCw=;
        b=DstSONgTZsAz3ZM79JC4eezhnNviZ//+aCE8jmID7wlqU58r0v1qP/ghGWRPmcQ4tQ
         VVF56syvB5LDxC07/rT2Ptq2L8tzVfFXfAoOmTy8dgcW8ID1Haq7pPac3PcMe4XWRStG
         vJeSBJTllJNh89pFm2gTk0Tvo8wJHObDKsZYIm2l55GVU2Lluc6cbu5U4X1dB2Rfiudn
         Tj4A2GWty1eqgB3mYShmqqMha5LabUl9ffz9zgIYBf3+ANyo0w/nUr7o/XzQ9/V/DwCu
         jqHfyr8sa2+Tdn1+T9aIj+9iv+jngOwOIps1/UMJDGzso2T4Woov4PB40ktCYGp1TuwD
         k3Zg==
X-Gm-Message-State: AOAM530US+xpHKyp6oZl3dVxmCNWETf9mMRXyCaKKWSLehp3jjntWarJ
	ACGbHCDYzkIL4fSX2Oq+x+fPM88vQtfn0S5ck6Q=
X-Google-Smtp-Source: ABdhPJwzVKUpmn3bDjEe/zsrPx9tWHxoe/D3cCpjlQGJFjzzpriQX7+HxtVGjMrL7gmr93UBHC9N3nJWhz6lb7ovhZ4=
X-Received: by 2002:a92:cc03:: with SMTP id s3mr13278062ilp.45.1613421064003;
 Mon, 15 Feb 2021 12:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20210211220055.19047-1-nieklinnenbank@gmail.com> <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
In-Reply-To: <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 15 Feb 2021 21:30:52 +0100
Message-ID: <CAPan3WqGAzWE+gCqo0Rggu70GpQAbWYyA2thH6LX=oTxhnvRfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "Daniel P . Berrange" <berrange@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org, f4bug@amsat.org, crosa@redhat.com, 
	Pavel.Dovgaluk@ispras.ru, b.galvani@gmail.com, 
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000064a2cb05bb65ddfe"
X-TUID: Pyla6un6nv+h

--00000000000064a2cb05bb65ddfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Op vr 12 feb. 2021 15:10 schreef Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>:

> Hi Niek and QEMU community,
>
> On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> > The following are maintenance patches for the Allwinner H3. The first
> patch
> > is a proposal to relocate the binary artifacts of the acceptance tests
> away
> > from the apt.armbian.com domain. In the past we had problems with
> artifacts being
> > removed, and now the recently added Armbian 20.08.1 image has been
> removed as well:
> >
> > $ wget
> https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bion=
ic_current_5.8.5.img.xz
> > Connecting to dl.armbian.com (dl.armbian.com)|2605:7900:20::5|:443...
> connected.
> > ...
> > HTTP request sent, awaiting response... 404 Not Found
> > 2021-02-11 22:34:45 ERROR 404: Not Found.
> >
> > I've now added the artifacts to a server maintained by me. The machine
> has a stable
> > uptime of several years, ~100Mbit bandwidth and plenty of available
> storage.
> > Also for other artifacts if needed. I'm open to discuss if there is a
> proposal
> > for a better location for these artifacts or a more generic qemu
> location.
>
> Thanks for trying to fix this long standing problem.
>
> While this works in your case, this doesn't scale to the community,
> as not all contributors have access to such hardware and bandwidth /
> storage.
>
> While your first patch is useful in showing where the artifacts are
> stored doesn't matter - as long as we use cryptographic hashes - I
> think it is a step in the wrong direction, so I am not keen on
> accepting it.


> My personal view is that any contributor should have the same
> possibilities to add tests to the project.


Hi Philippe,

I see your point. How about I simply upload the artifacts to github
instead? There are already multiple tests right now that use artifacts
stored on github. And github is available to everyone. For me that would
work fine. If you agree, I can respin the patch.

Regards
Niek

Now I am also open to
> discuss with the others :) I might be proven wrong, and it could
> be better to rely on good willing contributors rather than having
> nothing useful at all.


> Regards,
>
> Phil.
>
>

--00000000000064a2cb05bb65ddfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Op vr 12 feb. 2021 15:10 schreef Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt;:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Niek and QEMU community,<br>
<br>
On 2/11/21 11:00 PM, Niek Linnenbank wrote:<br>
&gt; The following are maintenance patches for the Allwinner H3. The first =
patch<br>
&gt; is a proposal to relocate the binary artifacts of the acceptance tests=
 away<br>
&gt; from the <a href=3D"http://apt.armbian.com" rel=3D"noreferrer noreferr=
er" target=3D"_blank">apt.armbian.com</a> domain. In the past we had proble=
ms with artifacts being<br>
&gt; removed, and now the recently added Armbian 20.08.1 image has been rem=
oved as well:<br>
&gt; <br>
&gt; $ wget <a href=3D"https://dl.armbian.com/orangepipc/archive/Armbian_20=
.08.1_Orangepipc_bionic_current_5.8.5.img.xz" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://dl.armbian.com/orangepipc/archive/Armbian_20.08.=
1_Orangepipc_bionic_current_5.8.5.img.xz</a><br>
&gt; Connecting to <a href=3D"http://dl.armbian.com" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">dl.armbian.com</a> (<a href=3D"http://dl.armbian.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">dl.armbian.com</a>)|26=
05:7900:20::5|:443... connected.<br>
&gt; ...<br>
&gt; HTTP request sent, awaiting response... 404 Not Found<br>
&gt; 2021-02-11 22:34:45 ERROR 404: Not Found.<br>
&gt; <br>
&gt; I&#39;ve now added the artifacts to a server maintained by me. The mac=
hine has a stable<br>
&gt; uptime of several years, ~100Mbit bandwidth and plenty of available st=
orage.<br>
&gt; Also for other artifacts if needed. I&#39;m open to discuss if there i=
s a proposal<br>
&gt; for a better location for these artifacts or a more generic qemu locat=
ion.<br>
<br>
Thanks for trying to fix this long standing problem.<br>
<br>
While this works in your case, this doesn&#39;t scale to the community,<br>
as not all contributors have access to such hardware and bandwidth /<br>
storage.<br>
<br>
While your first patch is useful in showing where the artifacts are<br>
stored doesn&#39;t matter - as long as we use cryptographic hashes - I<br>
think it is a step in the wrong direction, so I am not keen on<br>
accepting it.</blockquote></div></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
My personal view is that any contributor should have the same<br>
possibilities to add tests to the project. </blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Hi Philippe,</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I see your point. How about I simply upload the=
 artifacts to github instead? There are already multiple tests right now th=
at use artifacts stored on github. And github is available to everyone. For=
 me that would work fine. If you agree, I can respin the patch.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Niek=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Now I am also open to<br>
discuss with the others :) I might be proven wrong, and it could<br>
be better to rely on good willing contributors rather than having<br>
nothing useful at all.</blockquote></div></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
<br>
Phil.<br>
<br>
</blockquote></div></div></div>

--00000000000064a2cb05bb65ddfe--
