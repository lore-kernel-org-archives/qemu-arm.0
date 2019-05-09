Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp510615wrh;
        Thu, 9 May 2019 01:47:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqys6q6ckrkApfHtwkkMq9j06czOu91iU+kfhshpx2CLsmte19O7XHXMUiL9tJ0Q0u5tJqKG
X-Received: by 2002:adf:e288:: with SMTP id v8mr1939896wri.7.1557391637188;
        Thu, 09 May 2019 01:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557391637; cv=none;
        d=google.com; s=arc-20160816;
        b=0SC4ZJRNhS/KpzbAbf0R55UAVbSgmoXawfSVofiGXiameEar+Bdoix6FTp56kUcd87
         +NDhnHY5hrTYdEl/B0rVDkxXsh6PrhyeH+4r576QaxGd9zq2I+3/Frjl6Q4WPL7YPdcH
         1vRFLd/WtIPeVV+VhjH+sZuZgdZD4NIFUqOXB+gyWN01qlM3Q52eRl0IUWrvP0a3hXI9
         2AeZpVAonZJKhg1TxwJtqiSDAZhIGqjq1c3moTwYG9ilKFD6bHtCpC1UpSJRGd88ETvD
         YH5fyALiYhY2Rs8oVqq52zZitMGzhYd6sNVFlGYeZrhqDmww0znjBrAYJ9CKWMn7hBlO
         QKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JHYBFKd1AZr+xd/gkTPrhACdzrTh+rusGyVuFp13Mps=;
        b=bMcKAt63SryyT4a0QXFY4ww9Na9pblhlGk2fwuOwV+cgBtrAWo7jdL6rTzJmzb7Mzk
         mbNmZ516h9/+enLgd5OLpLHsJzEoeSvkAImOtUdEIhkjRIduMME1cc5DgJoP9qLBTY6R
         QqAYkSAb4zHwF67T9Wrhpml3R/41aKVhxvzaVSGQe5IJ7xHz0FfbsLkxVhksspWr7R/l
         iQyL/4FjJwe51ILT8tGSz/K3VitcFDKPajR3kjprqMknz4vIiRA1ld7i+/bFH1BUFGsz
         Fih1d6AqV3bjtGqO2UA7du59VwOHe0nE4JbCxLURQrX/lNj2iHybxdpa9tlS9pMuLyEy
         jebQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e/2G7eDo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si1246691wrs.169.2019.05.09.01.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 01:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e/2G7eDo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOehw-0004Ym-9Y
	for alex.bennee@linaro.org; Thu, 09 May 2019 04:47:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOeha-0004YW-8F
	for qemu-arm@nongnu.org; Thu, 09 May 2019 04:46:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOehZ-0000nq-7r
	for qemu-arm@nongnu.org; Thu, 09 May 2019 04:46:54 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOehY-0000mr-Vk
	for qemu-arm@nongnu.org; Thu, 09 May 2019 04:46:53 -0400
Received: by mail-ot1-x344.google.com with SMTP id w6so1560908otl.7
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JHYBFKd1AZr+xd/gkTPrhACdzrTh+rusGyVuFp13Mps=;
	b=e/2G7eDoz56jKeA35wWCMFmD1rbNObRMffjkpkDmFXtVW7Z3VYhVgq4I+Jm/MXbUCY
	7Q6OVRBz2a8cRMCEqto6LFBmhnP+N5Fkj4wEPfl+VofHnLzSha+PJ986q3dsXeRLhzlG
	E/596zkn8v+q+Ysb/You5YOZGZdWywfBrAsshn4BV8G2djEyaSdswLWkLN6zaUXBL9e8
	rQtPW3x3725lFGi/ipuK975FZjQTdN5ADSXbL3Akkb1pbMtcXQ8a7UAdu2nMoNO38/Nf
	qoL79T337Ja93rT3oCTGoOCZCV60YfkYizduS/i2n4Jd6lMKDyAGomjIRQ/96smJY0n5
	US/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JHYBFKd1AZr+xd/gkTPrhACdzrTh+rusGyVuFp13Mps=;
	b=GABKsSZHLWCWlPMmi6M4gq4ZnQVTqfwSSN5MiIdGp8e11T9SNlNrl3l1ErKjDB13na
	uj0uTdesQiTL8RslssHyKYlKFLyLNTu8vgq7huwocEOvz31gq+ondNhhY9zPIaCoSpXk
	QNqe8vfQyChqJFQzKmT253VzH+fb1RDFEtXZDt5G1nPi3p+idZUiGxRd8s2mBJ89dFBR
	TRMrowxslE0svCNBu9DFImIiE0qg0qo/bqEyyPCavQgu3ipHT0TWXtid/UESqIXdDrFo
	bzXwUjOq/T6Rf/j++JpwMOrolxCGEfe/BelTH/Z/H/SpEwq/WV/M9KooNS2HYgMqSm+Z
	iEtA==
X-Gm-Message-State: APjAAAVXoud/hjUkVrWPK5IRTD7Ex7U9UdxVxRkMqeJtBeoAmhZb/b1l
	+t0NCKmRMXooJASfvO59I5r1Y4ErnemnpNQW+iWdCw==
X-Received: by 2002:a05:6830:1258:: with SMTP id
	s24mr1632534otp.238.1557391611191; 
	Thu, 09 May 2019 01:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
	<CAHmQWvB4AZGM+MV0LP-vtfoW0kG4RFkf0R6NoRWm8WrFuum+Og@mail.gmail.com>
	<CAEK-wKkiyNYjKKsJzukC_LLi163ngWV4P18-47Z6xxF0azB2uw@mail.gmail.com>
In-Reply-To: <CAEK-wKkiyNYjKKsJzukC_LLi163ngWV4P18-47Z6xxF0azB2uw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 09:46:39 +0100
Message-ID: <CAFEAcA_2fkXSBaLaFX-FPA8AxEhqMF+mzNpZwwy1Ns2Y6Q=0yA@mail.gmail.com>
To: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v7 2/2] hw/arm: Add arm SBSA reference
 machine, devices part
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sKBTxd1BQeVm

On Wed, 8 May 2019 at 18:48, Radoslaw Biernacki
<radoslaw.biernacki@linaro.org> wrote:
>
>
>
> On Wed, 8 May 2019 at 13:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>
>> On Tue, 30 Apr 2019 at 22:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > I don't think we should automatically create the usb keyboard
>> > and mouse devices. The user can do it on the command line if they
>> > want them.
>> >
>> OK.
>
>
> Actually I need to rise an objection to this one.
> As we trying to make SBSA machine as close as possible to real machine, we should have keyboard and mouse.
> Those have the same requirement as for VGA. It's just an expected piece of HW when you for e.g. installing a server.
> We also do a lot of FW work so it is expected to have keyboard (and even mouse) in UEFI.

Real hardware doesn't have the keyboard and mouse built in --
when you unpack the machine from the box you have to plug in
the keyboard and mouse yourself (and often you have to
buy the keyboard and mouse and monitor and maybe the
PCI video card separately).

But more seriously, the philosophy of the QEMU command line
is not "do what the user probably wants automatically". It
is "provide the user with full manual control of everything,
using a complicated but orthogonal set of options". We expect
that if users want a more "friendly" interface to setting
up VMs then they will use a "management layer" on top of
QEMU (such as libvirt).

thanks
-- PMM
