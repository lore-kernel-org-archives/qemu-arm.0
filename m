Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp971448wrd;
        Thu, 13 Sep 2018 10:50:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbujBDhBA4ihZlKNXm4RbJyaDahJv6jMeNeu3ALaArFJF9ArNsnXhE4Sc+k++K9zXkBs5ub
X-Received: by 2002:a0c:ca8e:: with SMTP id a14-v6mr6097841qvk.44.1536861048634;
        Thu, 13 Sep 2018 10:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536861048; cv=none;
        d=google.com; s=arc-20160816;
        b=k2V6ix9y7Tg6as3vPz0P/zroa7VZu+6AChnJqOIVD7QVxs7YWrYCYfXjTw/zY8epEO
         YdpKCSrM3z2iaPNaDFUdv1XfK95FAL4bstIDgYRNxDChPIijXUa7FfNzW2Jn8i0rlZcv
         9pIGIO7S6BN8DTEno2k7uQxc/E7cEiV6tb8Ax9e7h1TdfS0XkPCHYkS4P94QOyvLqrQW
         TA3G2nojXbjOJpil/KB3MF3NzaVHRHQyEhULwp+NqCLKM4NX6u6Wq/e51vi4xW7VxJ2P
         CM7AJvqXwKbwHFf7waSnBvf1PDlgsnZJT5qdU1n+IaVr7LinFYFlBjTvq3q58/3E0u6l
         KSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=UwUf1ydP+BLNSegymoRe1G6/LQEGtlMC9eshPhtXr68=;
        b=p5tjga9hu2MhW+2mEMW9XpHlh64Lk9FufjUL89N2fhX7zuWx4NKHyAz3jnl77x31zt
         Igz0VqFczqONE1M2Jrfk2sMx4Yc3siaxJZ+l2QNal8t1XfjPi0oARg+gctEL3G6ldGWS
         9EsAk/P5wAbjtvzsS2l0/Ys7byWMdnUIFUFL/EUPRPeCzpNqKv5D36eqYudaFka5efnv
         X/nuqwER8a0QKKhGcHtpZCDeObHmQVBZFUMLSeD3YXEAiHm97EuEbCDw6tFYfcpimrpI
         fVBjdVSUxxRVKiS93nhoFBZ3Ck0+R3a2zVWvswQlnv61diTqWuST2DF6LvkFboa7fmjV
         wJmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@iitgn-ac-in.20150623.gappssmtp.com header.s=20150623 header.b=hpSBWWJa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5-v6si3452456qtg.392.2018.09.13.10.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 10:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@iitgn-ac-in.20150623.gappssmtp.com header.s=20150623 header.b=hpSBWWJa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0VlQ-0008Dx-4O
	for alex.bennee@linaro.org; Thu, 13 Sep 2018 13:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gohil.varun@iitgn.ac.in>) id 1g0VSD-0003MV-51
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 13:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gohil.varun@iitgn.ac.in>) id 1g0VS4-00050q-Pt
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 13:30:51 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gohil.varun@iitgn.ac.in>)
	id 1g0VS4-0004zK-4p
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 13:30:48 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e18-v6so3608360ybq.5
	for <qemu-arm@nongnu.org>; Thu, 13 Sep 2018 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iitgn-ac-in.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=UwUf1ydP+BLNSegymoRe1G6/LQEGtlMC9eshPhtXr68=;
	b=hpSBWWJaevpbSt1op6+UlRpg1yB2jdvvn+myo+reMW5DHv9ZGo/Xx1dvxJzg9uwTNd
	eMtsL8GeBk4EiD7TVegzaK/FMq6O1SQgMtiot+kpIAZxTTw3uSFpUAQWMfSNtxNKWwNX
	FF/iOwTbJ5zSpdIcEavtUNaqqJdZgxs4SDCtu/nqsr37QWRyOfw2JF/23b62mVPZCkwm
	CIb789p3GmgPVsRGsh6ylHzKBBTKddYsjoci9kNN4R/K54LKzov4djyy/f/VERxUX02h
	F0HC07IvEEXtXTbGL/shukJyzs7BQSRf25eETio4Q181UkYthbiGZsOCuJSIreVERUWT
	1zMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=UwUf1ydP+BLNSegymoRe1G6/LQEGtlMC9eshPhtXr68=;
	b=WBOQaR0oLZBlGrxvLvcChuZfH0V3YQ1z8QGJMEDDt4MWI/G7mYk7ko+AuqRV4fl7x9
	tancN0TMcH/9HZBAaj4AflrVSt7eBSGYAgcXCgQtsfHBdrZCipYNdRIM9DlOO/V/ITG7
	qSY8nAJhEUbiU13bQRvUL4kQiySU1Ua5EZsb/DR4Qce5hoEUzxOALjhT8mkY+06OzHG0
	jXo9pEnQPAlXapY3MpoVyBdGsLcN2qqHFoaiIV1Vzu6LGponxPeDcyHLHJ2Ogx/C67HZ
	venr7Ja+w27DKhw9D2WyO2VsGOS7wzk6gJ1ULzyV418qWK4NKc9TRWejNFT0VUtUjdnZ
	ElWQ==
X-Gm-Message-State: APzg51Az+VCPTXx0dwYM4rB+U8myzZtDCwHHIHWwfVog9CXrecoE82Sv
	v1x4qEkJlEYPlsP/Cgu7mLmI5duuUDLFI7qNhCgfgmNZp40=
X-Received: by 2002:a25:840c:: with SMTP id
	u12-v6mr4080291ybk.326.1536859846091; 
	Thu, 13 Sep 2018 10:30:46 -0700 (PDT)
MIME-Version: 1.0
From: Varun Gohil <gohil.varun@iitgn.ac.in>
Date: Thu, 13 Sep 2018 23:00:33 +0530
Message-ID: <CAEmUw+VwJBw7m-6ne2AxN7XYyhzMYYOs6aghUpgUiY+RWu5NtA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000032e8e10575c41175"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b2e
X-Mailman-Approved-At: Thu, 13 Sep 2018 13:50:38 -0400
Subject: [Qemu-arm] Getting guest's register values in QEMU
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
X-TUID: brbqZeejPyyL

--00000000000032e8e10575c41175
Content-Type: text/plain; charset="UTF-8"

Hello,

Is there a way to get the register values for ARM ISA when ARM is the guest
architecture.

Thanks,
Varun

--00000000000032e8e10575c41175
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Is there a way to get the regist=
er values for ARM ISA=C2=A0when ARM is the guest architecture.</div><div><b=
r></div><div>Thanks,</div><div>Varun</div></div>

--00000000000032e8e10575c41175--
