Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4103180wrt;
        Mon, 10 Dec 2018 13:51:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WnxWh4ylq7nMFmVHeCaAhr+isRXIm9WFrzewtj38LZP5O80EXMlIUKKf5pDXYVVqM0d5lC
X-Received: by 2002:aed:37e3:: with SMTP id j90mr13554923qtb.332.1544478675934;
        Mon, 10 Dec 2018 13:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544478675; cv=none;
        d=google.com; s=arc-20160816;
        b=S6qe2RZf3BRhXYEmMUTARG4PRUD3FlKB9XuVzjXsOvJNmAeti+DyGdgVS0y4Kkfj0X
         OaOis/uar0pLeU2A3nld4rpnGoSrRQ4xDrBguKUlewr+u6CCSyvvysawlB4XE8D+CsOx
         gR+3nYTbYRmumm70ZxBtNtMifP6RJjHwWqh550NTQOw2iAOJ4xVJsUsx1Yrh+bSST55I
         70McDn2BtqWnf1dKuh9bUyLiPR5+ZMqqyEsoPl+8XM6UPn/Rf33yR6bkv1z/3+yuBH21
         itwMreCuc5Dbc7Rk3CsSLe/W/Ew6O233tDn1jE2kyVVgK6FYD2rIq2STNcRUCxnhGKeo
         Uing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :to:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iqxa1hy52EptWy1WV7YZ4FdcRBkWpbFzFV4afUwXMnk=;
        b=ygcKspeg+fe/5jaC12yGfY/Zqm3FwfMQaaqodgtlOQgqh6O+X1Zio0aFuNSjzYzXSl
         tPVwnoG2NdQS+RCjNBafgDl4xh/BDpMMxdXxIktpNcJu98s9seXFmMp6lSy6KDIO9/xS
         e0owJw6MdMZQBiIDEWq/Zo3VUmRARp8J3eAU45FZjsR4bud3dpLpQcPDDLI6/tgDVwRA
         fLAMlPa/1mzeCU5Gj1CHaMEKduHOqyvvsw9nuEz7Wu1NIQwxiJEtf1CLhF5GtBACTU7o
         XcKknCylEmcW3s1YY/nnxTuR7MsK9uZisU7i7BFJ8dS09Acsqj5ftSJSyS/lmFAJ8xp8
         YBag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=Z+Ha2rkB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si2319525qkl.40.2018.12.10.13.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 13:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=Z+Ha2rkB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWTSN-00026j-I7
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 16:51:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wedsonaf@google.com>) id 1gWTA6-0005Bt-VI
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 16:32:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wedsonaf@google.com>) id 1gWTA6-0006sB-2s
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 16:32:22 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:44718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <wedsonaf@google.com>) id 1gWTA5-0006rZ-Qc
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 16:32:21 -0500
Received: by mail-io1-xd43.google.com with SMTP id r200so10011597iod.11
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 13:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iqxa1hy52EptWy1WV7YZ4FdcRBkWpbFzFV4afUwXMnk=;
	b=Z+Ha2rkBqf3Tcr/buxuM8/nYhlLedBBgyn64fkalaBmEK67gm0iq+zMwIQElWejOyv
	im3kgHVHb7v+pbAcSWt+l9tVO0CA8ABT9Tw/S0gisWzJIZnsypIzMc5X5iIWPUMH84w3
	KPasQbJ6D0zhllUq2XG59r7aA8863z+EgRP93d9kJTyLk4LqZD1geTf69YJy+HIpAK8u
	o2Bu4CM4tgDxsjVMPxWIzm4r4scK2Q4oYN8NxDT3Qs+Xba7oK1aj7kuCh2PjcrsuumPz
	DPQaAuFnJ2CH/LfSqMWPIjAtfFxFu/FmGkqHYhy5hB9Q3cQl9ac7fvLGDnZzAdMrUXk4
	ikNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iqxa1hy52EptWy1WV7YZ4FdcRBkWpbFzFV4afUwXMnk=;
	b=RW62aTmSXLgtlgLfyx4FURfpaf/CAV7c4+DGeYRgb/DyGJvonAJv1p/sZTuyyqJdU2
	lyWefa6Jb1ZBb3/DfbwPbjWFG+f9rAKKllU+4pRSSSGApev3/DOHoinayAPhQRJcYYjd
	n44Ev1/WjTtZrbRmwp3RNTpphmLHj7XnQVhuPXU7QnyWlCeLeG9IC4NrnJv7LUWqkBuJ
	27gMQQ4og1EiR+VDEXJmDdMBkRF5iY6vxOat1xSII0v+WLM0XY+Cxtp3NgJEruynFfK8
	qa4FlIpvPQMvdCvtUdcA+lMJHsgvSpHuYIUjsfjntw9KkFXnsvkMd4HBGzLsRTi0DHfa
	5eVQ==
X-Gm-Message-State: AA+aEWZ+VQHabG4DYpyRKoR4Q5n39EZl85OKm1heAfT7HQsEAHXHSzhv
	IRaLYYkJMYQLca0Dhvd6/zNyM9Cmm/paEQSLaVmM
X-Received: by 2002:a5e:d808:: with SMTP id l8mr10770346iok.299.1544477540606; 
	Mon, 10 Dec 2018 13:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20181210183836.20074-1-qwandor@google.com>
	<CAFEAcA9kXXeRkFamN73XREDp4QaokMs3E9TRLThKf4zYufapSQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9kXXeRkFamN73XREDp4QaokMs3E9TRLThKf4zYufapSQ@mail.gmail.com>
Date: Mon, 10 Dec 2018 21:32:09 +0000
Message-ID: <CAMKQLNK2J=JsgEch3G-pQ0mjW5B-n8Xc_4PDGHjFs6CfcA2ngg@mail.gmail.com>
To: peter.maydell@linaro.org
Content-Type: multipart/alternative; boundary="0000000000002c6c1b057cb1b36d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d43
X-Mailman-Approved-At: Mon, 10 Dec 2018 16:50:01 -0500
Subject: Re: [Qemu-arm] [PATCH] target/arm: Implement VI/VF bits
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
From: Wedson Almeida Filho via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Andrew Walbran <qwandor@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7b3JGUb8lZ9y

--0000000000002c6c1b057cb1b36d
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

We put this together months ago and hadn't kept up to date with the changes
here.

We're happy to see that support has been added for the VI bit. Is it going
to be available in the v3.1.0 release?

Thanks,
-Wedson

On Mon, Dec 10, 2018 at 8:41 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 Dec 2018 at 18:38, Andrew Walbran <qwandor@google.com> wrote:
> >
> > From: Wedson Almeida Filho <wedsonaf@google.com>
> >
> > This lets hypervisors running at EL2 inject virtual interrupts into
> guest VMs.
> >
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> > Signed-off-by: Andrew Walbran <qwandor@google.com>
>
> Hi; thanks for this patch. I'm a bit confused -- can you
> explain what the patch provides that isn't already
> implemented by commit 89430fc6f80a5aef1d4cb ?
>
> thanks
> -- PMM
>

--0000000000002c6c1b057cb1b36d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter,<div><br></div><div>We put this =
together months ago and hadn&#39;t kept up to date with the changes here.</=
div><div><br></div><div>We&#39;re happy to see that support has been added =
for the VI bit. Is it going to be available in the=C2=A0v3.1.0 release?</di=
v><div><br></div><div>Thanks,</div><div>-Wedson</div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Mon, Dec 10, 2018 at 8:41 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, 10 Dec 2018 at 18:38, Andrew Walbran &lt;<a href=3D"mailto:qw=
andor@google.com" target=3D"_blank">qwandor@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Wedson Almeida Filho &lt;<a href=3D"mailto:wedsonaf@google.com" =
target=3D"_blank">wedsonaf@google.com</a>&gt;<br>
&gt;<br>
&gt; This lets hypervisors running at EL2 inject virtual interrupts into gu=
est VMs.<br>
&gt;<br>
&gt; Signed-off-by: Wedson Almeida Filho &lt;<a href=3D"mailto:wedsonaf@goo=
gle.com" target=3D"_blank">wedsonaf@google.com</a>&gt;<br>
&gt; Signed-off-by: Andrew Walbran &lt;<a href=3D"mailto:qwandor@google.com=
" target=3D"_blank">qwandor@google.com</a>&gt;<br>
<br>
Hi; thanks for this patch. I&#39;m a bit confused -- can you<br>
explain what the patch provides that isn&#39;t already<br>
implemented by commit 89430fc6f80a5aef1d4cb ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000002c6c1b057cb1b36d--
