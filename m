Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4075252wrx;
        Tue, 16 Apr 2019 08:42:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBOe0M8h1gOia5uCZNQb6XvOd8mMMCQ4JSCGv5yF6hTr3O7rRKcJ40uvadofLeP4o2fvxq
X-Received: by 2002:a1c:a9d7:: with SMTP id s206mr28114207wme.126.1555429367557;
        Tue, 16 Apr 2019 08:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555429367; cv=none;
        d=google.com; s=arc-20160816;
        b=XR82GpFcAVwrNHhaAjRmgDwU5MIH8xe8WiAQ46vExqIsbMQHH+5+vM1wrRyM8JWcdl
         fBsAVnhtpOn/tnUKMiBntIRpiVIBpva5jiq4wUMeoAcKf50O5n2qrrcY0iYFBu55yBF2
         VZyhmc38RMvAgTp/uSwFCpQKkndX6QrBGDGTVy621JKEW9Mhbqx5byzrlOeGh8nVn4jO
         5PlPisbVRWBPbSkcXMVuaWhgAfMZxV8fLKRQ27Pvcg6RHv08bAQyxf0SpApRBCqGOeP2
         cLvswAlKFnDvGtwtcSLLAXHajOGPINayA7GJlO1uSjngcWXgrbdggkJEwFduVmJvMsix
         v6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Fjj+unwBFrb6LtNpSdIvB/YQ4y98VQu49FxiiSxxOY8=;
        b=NFq/BZPYjt7uq1cyMoEBp+d9keQ1PXwJy4vIFn801LvZZmsqaGqx8edDuxz/Tt5FeJ
         ZdpOAgiboZRJuANfGvtFNiRPozXkuDFLyqP0L/MkaGNlASepCKY8+dqCFYUBrVfqU2yf
         8Wf091hYAFggFh4ooqRDbF0e38RPW4ZATAp9lbXfRT1rvMKNVqMdD+y4F1iebICw3k5k
         qNny3/U5tqlehVmj0K5anrmlQLELPJuP/cKw5uF3huLxgMfeZ99a4byK5uooE0xtSAA0
         PrmOhC8BAcp6QQp9fNwfZdoiYs3x0/OHKT4Z5rRbXSBlCBx7dNstRGk1tbrqVfUg2CQX
         BpYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ywiT50tP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si36670456wrm.306.2019.04.16.08.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 08:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ywiT50tP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGQEQ-0006k4-LI
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 11:42:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGQEF-0006jv-C8
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 11:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGQED-0002wa-Fx
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 11:42:35 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:34051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGQED-0002vl-7L
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 11:42:33 -0400
Received: by mail-oi1-x233.google.com with SMTP id v10so17384974oib.1
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Fjj+unwBFrb6LtNpSdIvB/YQ4y98VQu49FxiiSxxOY8=;
	b=ywiT50tPQff4vjYJAzLazcT0yjGaiaWy6Tyo1xlUmPr/rWuXtpwLWWKLtQoK8Nx8m8
	Xmgg2yqx8KDvzZncCNlzWXYtUF0B6QDYu1tP2KgBY1R7s5rybhULdLCbDX+VK7s2U1xH
	4QGw7+oGF3nLJVLGAAVwij/qzGVoB1YcccysKiCoX3wJm8/4o/+C9H/9ZFzCa8tikjvG
	MKRq0ghmXhiPH5VNlNv5d7o/oc52WvgJOyt1UuSyQQ89c3DwYVWtSHkNSIA8K2YuO7vC
	DG6eL2j3FX6sIm+TJUWTk8Z5SO7OYzr3HP+hDbNiwokgyw6GSQNi7Z3MeK5S5XalPjur
	Iw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Fjj+unwBFrb6LtNpSdIvB/YQ4y98VQu49FxiiSxxOY8=;
	b=NBUQz9WHWPNTtz0lczbvHJfVlXOey5Rqv/0+OiIOUmBN5DeZVyz1mffyGXZkS/MNvI
	gSLyp9Aq2GW0MDgkhvqwufvwuPcdmy/D40oZhyxXaWtZIWPclWczHdQKIPDW+MHV2Hd6
	OA2k5D0tS+7/r6XEIWgfYma2eAyeeR8pNdaUmVYs6xWHoyw1pSutreO+iTiSNY+D4k4H
	auH2HpcDwCJhZDGHrjO1w1haocGC7KbYzRJ8070hivquyaWFhRtpgAKVNb8KVbVA7j84
	xR6OMgYfjUex6a19BdTNjYnFuzLVhmn+R7OZ11ZgFLlsehJGV7ePFNQFxgeB61pVD6t9
	aAxA==
X-Gm-Message-State: APjAAAUl0TjmRIIVYwkqXBdKljQQkdgooBwnpZl/rdUKI35AhkJnifEk
	Cc/qwG6cwTaLDXTNFQeHeB3by5k5MUi5Xu3A97IV7Q==
X-Received: by 2002:aca:e054:: with SMTP id x81mr23173230oig.146.1555429352199;
	Tue, 16 Apr 2019 08:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
	<CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
	<CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
	<CANY2w+3qJgQ_HVai6trQ_gDXxPLruj1-L6LaTkcUZQbtQBofpg@mail.gmail.com>
	<CAFEAcA9gciZ3_zY-XMoC8o0P4ffvHhC0w=ZDA6biXyovx_H2cQ@mail.gmail.com>
	<CANY2w+1UhFKHOfgVEmPDGwMsH8o3nWi7VsNFRkx2Yw3N5nO5dQ@mail.gmail.com>
	<CAFEAcA_r2MTgVA-e1ozP0ySNzWWYTu2sKk52sk5a3_Hd__KO9A@mail.gmail.com>
	<CANY2w+2Wz-5CRcOf3Xn8WF0o-j3o2RNtS-drqBQ-QSKXYOJdAg@mail.gmail.com>
In-Reply-To: <CANY2w+2Wz-5CRcOf3Xn8WF0o-j3o2RNtS-drqBQ-QSKXYOJdAg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Apr 2019 16:42:21 +0100
Message-ID: <CAFEAcA-Xp5rEC+ZNVQ6dLqQx6h269EWtpLyDjBcZHFmW5zbRfQ@mail.gmail.com>
To: Da Zhang <daz3@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::233
Subject: Re: [Qemu-arm] Ubuntu installation shows "No network interfaces
 detected"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A5hIupHGT8HW

On Tue, 16 Apr 2019 at 16:33, Da Zhang <daz3@vt.edu> wrote:
> This is my gem5 simulation output. My goal is using qemu-system-aarch64 t=
o create an ARM disk image for my gem5 simulations, since qemu provides a b=
etter solution to modify the image (e.g., apt-get install) for different pu=
rposes.
>
> Firstly, I created a qcow2 image and used the qemu-system-aarch64 command=
 shown in the previous emails to install Ubuntu.
> Secondly, I converted the qcow2 disk image to raw format and rebooted fro=
m the raw disk image via qemu-system-aarch64 (without cdrom) again to make =
sure the Ubuntu system work.
> Thirdly, I put gem5's m5 executable in the guest system's /sbin/ and crea=
te gem5.service, and reran qemu to make sure the disk image still work afte=
r modifications.
> Finally, I ran my gem5 simulation using the disk image and encountered th=
e kernel panic. The linux kernel used in my gem5 simulation was built from =
repository "https://gem5.googlesource.com/arm/linux" branch gem5/v4.4 for l=
inux kernel version 4.4.
>
> I am not sure if gem5 support vda or not. Since both our X86 disk image a=
nd the official ARM disk image used sda, I thought I might give it a quick =
try. That's why I asked how to run qemu-system-aarch64 with sda. I tried -h=
da and -cdrom, but qemu-system-aarch64 didn't recognize the disk image and =
the iso. I also tried to use device like scsi-hd, but qemu complained about=
 no SCSI bus.


Now I'm really confused. Why have you put a gem5 executable
into the *guest* system's filesystem?

Anyway, it sounds like:
 * QEMU is working fine
 * you've created a disk image
 * you're trying to run GEM5 with that disk image and some other
   kernel, but it isn't doing what you expect

If so, then you'd be better off asking GEM5 people what the right
GEM5 command line is to pass a disk image to it. This will be
completely unrelated to what QEMU command line options you need
to get QEMU to treat a disk image as scsi vs virtio.

thanks
-- PMM
