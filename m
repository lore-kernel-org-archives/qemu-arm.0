Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4586266wrt;
        Mon, 24 Dec 2018 23:30:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Ros7dYqkmAonm6pRhxT/JFIC5Dg4DM9hW8HRmi1EObZcUXBqDQedH2a5S1itbh0P/yuS6
X-Received: by 2002:a37:f23:: with SMTP id z35mr13700445qkg.171.1545723024641;
        Mon, 24 Dec 2018 23:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545723024; cv=none;
        d=google.com; s=arc-20160816;
        b=H6eD2f2888NdtON5Gy4IiyqrFyr3fiO4I2ucVMjvIbuduh71oJ/i1ZD7rOPrF1ZagZ
         wz28DRqeScMqxefZu4v/JBofA9NN0Sofd4PZKUHhASJ+AncVmbxNPlLGBvAjg2xzScaj
         3MbJmaEq5tHBHEqxDp+oi8F3dBqpxZ8fKEsxQS2r+BjmkxpK5CaRfVMeJ1Rn0qz6sXjI
         sUmQ99qHc1hhTG+CEtCED3CMaPtBQVToEspq5YisXWDjo78rrokvwbT79hdaOzEi4M+e
         rSFlwCfVr2ACx2J+YKdZ95suP6mZ9LrmmccT8TDVwxe9mC/iE+UKKFFAr/MEXOwO441I
         2LxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y3KTP5SiCIOyk/YbMz9m+FuhAZletio3asdDQtmy6Fk=;
        b=ajcjC1WaBb/iHFU+OpXvsxy35QKazz6VOC4eUmebIzMtdN/ww4VUQOZz0yH0oiMNy5
         QNjUCkucmjTBw0QgH9Ynh3ce2elWxpzA1smCnYFfJT9H9UwNa49VoQTBIz+ujCb7hmHU
         ku1VVh90D0j7ngLBul1uhrBZDil2V8qXYr1DOFpUm5LRT4rWsdTZ/gGCNcV6vsLCTzFq
         IZ0vc8KWhzpgYN7mJRMJ2P8P9r4IXSVvTIJeONSA2598fmFU1pD623s9Xi1QZDtbDdme
         hAFM55zvR22CGMyAuma+vKujP41x8KkdkM6MUMrTrCH8v2zrZQInvwNxxVOxvTrqIWfj
         nTfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mEG7vn1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j35si4930910qtc.137.2018.12.24.23.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Dec 2018 23:30:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mEG7vn1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:39982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gbhAW-00011v-6R
	for alex.bennee@linaro.org; Tue, 25 Dec 2018 02:30:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbhAM-0000xY-Pu
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:30:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbhAM-0004zB-64
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:30:14 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:41774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stast.3vium@gmail.com>)
	id 1gbhAM-0004yj-1I
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:30:14 -0500
Received: by mail-oi1-x22c.google.com with SMTP id j21so11102851oii.8
	for <qemu-arm@nongnu.org>; Mon, 24 Dec 2018 23:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Y3KTP5SiCIOyk/YbMz9m+FuhAZletio3asdDQtmy6Fk=;
	b=mEG7vn1h49Ue2vB+zP8VOuxenPuRr2F/2YBFmMO92TwBU9ni8BcAfdoeuPxZJqpTso
	qfrHwroQKGB3Ho8FokOk2djmc3Cri8OXJj5nSRhREATJdECXaB8fHglC6P1hIQUKAB0/
	8x5BAESSLYmE1Gz6lXhiTn9vi7B0pxF2MV/kopF2efvCp6I66sPPNda/69/U8p0EOwut
	Z8ddooGJKQYqfzkS06/ecatsGelfyR/gXWhu8UuwpWqB3wu+5ElBT1HE/onI2IqqV271
	JxVSH43UG27cRVToRkwdQwn8JaCKKSYWj6mK1lcqqcFflWyxaco7ViooigZrFRfRwbvI
	PhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Y3KTP5SiCIOyk/YbMz9m+FuhAZletio3asdDQtmy6Fk=;
	b=g6cfV3F6HZwmdU2CtIs1GuWlAy5bPCRzubDJHNNOUl4f2pVA73zToiF3wmGLFCYtk2
	3THdO1AeEpDRX3WYUsJIfJFfRoZ0dOvRmpd0HDZ5VOLmALGHzO8qIsnCoDe9jUSeMB1x
	Re3TbuGIWX9fxJKEZUZBTjMJGFVvIZpprOv0DIxsuwNB0PbzCtnN7HjUWo79JQgQxjte
	XHwpKKYWX8wnLm9EjIAzge6Ie0+dT8suiJbX8pMzhssEQZdC2L66vyUaGA8aR1D+b5eb
	dSAmwgbTi3TJ38dwUUUuiPvqGjrqIMyhYT4OFiiCFQ3C6My635P6ho3XWjdQdcsfM58K
	5Oxg==
X-Gm-Message-State: AA+aEWbMDNdzK9pZwhyevhy+TMbxqo3ZSG6W0ruZVp80JzB0AhTfxfJN
	4mUkuymMfeO1E7i1667P+d2ZgGPozTcfY37pj1KnswSf
X-Received: by 2002:aca:d804:: with SMTP id p4mr10307871oig.304.1545723013327; 
	Mon, 24 Dec 2018 23:30:13 -0800 (PST)
MIME-Version: 1.0
References: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
	<CAFEAcA8qqzPxwYmjGG1Y940RFyuf0AccNy+N51HODnoKEuYSfQ@mail.gmail.com>
	<CAC-7+Cix_s3xdzqre8r4c8f2djDBi42k4oOvyG6C4VCC29Ww6g@mail.gmail.com>
	<CAC-7+CidVH8KGBaCKxeEricWKhago1w+-j7fDB88gnN1bXVy1A@mail.gmail.com>
	<CAC-7+Cg-VJ9wivBYM+15mUs6cPUZ-Zu1Q818KieyjEVz02eLig@mail.gmail.com>
In-Reply-To: <CAC-7+Cg-VJ9wivBYM+15mUs6cPUZ-Zu1Q818KieyjEVz02eLig@mail.gmail.com>
From: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCi0YPQvNCw0YHQvtCy?=
	<stast.3vium@gmail.com>
Date: Tue, 25 Dec 2018 10:30:02 +0300
Message-ID: <CAC-7+Cg2muWTajKd-nSEz37oHPug6AD-WGyXJ8E7yASGc9p-dA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002190fc057dd3af32"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22c
Subject: Re: [Qemu-arm] Run Kernel+rootfs for ARM Cortex-A72 on QEMU
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QahOKn2AbiyG

--0000000000002190fc057dd3af32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for information!
Yes, I mean "virt" board.

Although there is no big difference now. I really want to see the logs.
If the board is not suitable for the kernel, the logs will not be displayed=
?

With best regards, Stanislav.

=D0=B2=D1=82, 25 =D0=B4=D0=B5=D0=BA. 2018 =D0=B3. =D0=B2 10:28, =D0=A1=D1=
=82=D0=B0=D0=BD=D0=B8=D1=81=D0=BB=D0=B0=D0=B2 =D0=A2=D1=83=D0=BC=D0=B0=D1=
=81=D0=BE=D0=B2 <stast.3vium@gmail.com>:

> Thank you for information!
> Yes, I mean "virt" board.
>
> Although there is no big difference now. I really want to see the logs.
> If the board is not suitable for the kernel, the logs will not be
> displayed?
>
> With best regards, Stanislav.
>

--0000000000002190fc057dd3af32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for information!<br><div class=3D"gmail_quote"><=
div dir=3D"ltr"><div>Yes, I mean &quot;virt&quot; board.<br><br><span class=
=3D"gmail-m_-5067172010316508731gmail-m_-1222285124536088059m_-802535751559=
6374928gmail-tlid-translation gmail-m_-5067172010316508731gmail-m_-12222851=
24536088059m_-8025357515596374928gmail-translation"><span title=3D"">Althou=
gh there is no big difference now.</span> <span title=3D"">I really want to=
 see the logs.</span><br><span title=3D"" class=3D"gmail-m_-506717201031650=
8731gmail-m_-1222285124536088059m_-8025357515596374928gmail-">If the board =
is not suitable for the kernel, the logs will not be displayed?<br><br></sp=
an></span></div><span class=3D"gmail-m_-5067172010316508731gmail-m_-1222285=
124536088059m_-8025357515596374928gmail-tlid-translation gmail-m_-506717201=
0316508731gmail-m_-1222285124536088059m_-8025357515596374928gmail-translati=
on"><span title=3D"" class=3D"gmail-m_-5067172010316508731gmail-m_-12222851=
24536088059m_-8025357515596374928gmail-">With best regards, Stanislav.</spa=
n></span></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
=D0=B2=D1=82, 25 =D0=B4=D0=B5=D0=BA. 2018 =D0=B3. =D0=B2 10:28, =D0=A1=D1=
=82=D0=B0=D0=BD=D0=B8=D1=81=D0=BB=D0=B0=D0=B2 =D0=A2=D1=83=D0=BC=D0=B0=D1=
=81=D0=BE=D0=B2 &lt;<a href=3D"mailto:stast.3vium@gmail.com">stast.3vium@gm=
ail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr">Thank you for information!<br><div class=3D"gmail_quote">=
<div dir=3D"ltr"><div>Yes, I mean &quot;virt&quot; board.<br><br><span clas=
s=3D"gmail-m_-5067172010316508731gmail-m_-1222285124536088059m_-80253575155=
96374928gmail-tlid-translation gmail-m_-5067172010316508731gmail-m_-1222285=
124536088059m_-8025357515596374928gmail-translation"><span title=3D"">Altho=
ugh there is no big difference now.</span> <span title=3D"">I really want t=
o see the logs.</span><br><span title=3D"" class=3D"gmail-m_-50671720103165=
08731gmail-m_-1222285124536088059m_-8025357515596374928gmail-">If the board=
 is not suitable for the kernel, the logs will not be displayed?<br><br></s=
pan></span></div><span class=3D"gmail-m_-5067172010316508731gmail-m_-122228=
5124536088059m_-8025357515596374928gmail-tlid-translation gmail-m_-50671720=
10316508731gmail-m_-1222285124536088059m_-8025357515596374928gmail-translat=
ion"><span title=3D"" class=3D"gmail-m_-5067172010316508731gmail-m_-1222285=
124536088059m_-8025357515596374928gmail-">With best regards, Stanislav.</sp=
an></span></div></div></div>
</blockquote></div>

--0000000000002190fc057dd3af32--
