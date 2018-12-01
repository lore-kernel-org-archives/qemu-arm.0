Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4695647wrt;
        Sat, 1 Dec 2018 04:05:26 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XAfSV3ReWHhsa8M23W1tuSO9qWN1PRgDD1B8meMAcOisrsB2osIN62mBbBwALsFBvLWAIJ
X-Received: by 2002:a0d:c306:: with SMTP id f6-v6mr9257996ywd.356.1543665926069;
        Sat, 01 Dec 2018 04:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543665926; cv=none;
        d=google.com; s=arc-20160816;
        b=cwgFfCTotrFAQHW4k4T9lR9v6TKeNvNUQr8ljvr1wdDJEqmNI2XN5gGbolfvMg6wkj
         /9WJeF/g1fj3WIL/vgqv/hu0EAi95Sw27tWaUHnAkRR0JYjYaxPfa8Bs9CYWplhcL+4Q
         ZXwKuOWARugF41uNx4hqRGQF7VIq9Tn3f6ImSt2fsAYaaUMhxa2vYZSdZ844zdeAczoB
         BO5hR8272WHJWdpaNKypiibgXJnji1R3LObuYytF1nPWHBLeMrg0YyLqdMztOGHSCRxC
         W9T2PxycRTDuxfWrzej0CE/r2p4q596YeDZEbm8sTOw7hdG6rpsOTesfyLO1ioa9SlVq
         jntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eihTjDnGdFn3dD/GVopIa7vai10Y0+6h83aCf2K6jtc=;
        b=WrfSdx1dEz+lCvcgcvIh5PW+ZtM/FsFXqjqq7ywp41AIcHTqtPQy5KND7JSn0qfofv
         t6PEAhDrYLs9oWp4dCIaK/wGzCEGKcBMTeTPj7MkdZKwupr9MMt1FHOp+ULZZRnDDPv0
         hJ/4NBQ78/wEr8cAABMOLkXEx3d79PSrpYONJwj9eZRrPvHT2BuN5xx4vzlPFmZ7ehAz
         RXt+wae9IkSUXdmvLz5/mjyawZKrAqTY2qxt2XHVGmcir5LzThQnk1/G/EM3f4ui++b/
         UXeoLSsE87RATcxTF/egBfBkDIKQAJLo5PeEQp0QG4mmozdSk/kAIYUr7QJa5YSTSMIZ
         ItWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WnXa0jYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si4851623ywe.426.2018.12.01.04.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Dec 2018 04:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WnXa0jYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gT41V-0002Kd-Hz
	for alex.bennee@linaro.org; Sat, 01 Dec 2018 07:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gT41M-0002KN-AA
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 07:05:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gT41L-00057y-4E
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 07:05:16 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gT41K-00057d-Vd
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 07:05:15 -0500
Received: by mail-oi1-x241.google.com with SMTP id y23so7092007oia.4
	for <qemu-arm@nongnu.org>; Sat, 01 Dec 2018 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eihTjDnGdFn3dD/GVopIa7vai10Y0+6h83aCf2K6jtc=;
	b=WnXa0jYlCzIROCLeFe+zzNTkSUJRr5kux8uWZBT4MeiJou/gBF9ES6TYkkn+LVxyat
	L3ZxKXr4UbjT2GoNIowpHEZM7h8Fl3M1zypx7SGO3vG5d9jDcXDzMTVMuF9b/v4Az9L5
	Iz8rzVcBhfuOdVMPvh1ylZHsEfjR6r3w8qo6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eihTjDnGdFn3dD/GVopIa7vai10Y0+6h83aCf2K6jtc=;
	b=RmR6JB5LV1rwJkDQJBIkibSUTWTZIYv8jzNINAZpP0uc/JY9zFvp5rnpfwHsVBUBmI
	Txy5ppuDJDfcUCE5HyonwWdekvlHO2oGBOGanb7iWPOUouGgCVQJzrsKY5iDH3iJVfOk
	f+qIP9zr40AzWuO56D/w8CBAOYFnRiD9BdHjpzIxf4V6nTaUO/KmBPOQGAvkO7RUWY3x
	DYhWO7vZczt2yB9/MAqsS/ypP7q1pfWQatcOXHqarbGcn7MVoSSENgmk160hXoI2wIqh
	9GrIECpcndVeuHWwT38ZjXTvQ1lyE7lH20ARmFjPKvl04M0slzKQPzcyWvMGfcbnxDXb
	TAYw==
X-Gm-Message-State: AA+aEWZRVVzr8jM+OH0FWccxGMrciHtDGNFskhz4vggtHznuBzFjbH/e
	3p1ahLejDZdRKZae/weip3fPZRlRjuuqKHeC2gLueQ==
X-Received: by 2002:aca:5c05:: with SMTP id q5mr5290127oib.146.1543665914233; 
	Sat, 01 Dec 2018 04:05:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9Od4vjo2EeEXhP1iE_XONaK8H22L9eq1qw3w6C2nR_cQ@mail.gmail.com>
	<201812011728499706543@zte.com.cn>
In-Reply-To: <201812011728499706543@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 Dec 2018 12:05:02 +0000
Message-ID: <CAFEAcA-0DPo=4vzHtfD-bmAsfguOd7RiQUnHMpg0Q0e8aNZ_vA@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V10 7/9] hw/misc/pvpanic:
 preparing foradding configure interface
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RPo+D2TIC37F

On Sat, 1 Dec 2018 at 09:28, <peng.hao2@zte.com.cn> wrote:
> Peter Maydell wrote:
> >This kind of thing is why a PCI device is cleaner -- it just
> >works on any machine with a PCI controller, it by default is
> >something that the user can provide if they want to and not if
> >they don't, and it's not a custom UI that management layers
> >might need to special-case. The guest does need to do a bit
> >of PCI probing and setup initially, but then it can just leave
> >the MMIO BAR permanently mapped and write to that address
> >when the guest panics.

> Usually, it doesn't matter if there is this pvpanic device or not, so I
> haven't considered configurability from the beginning.

It matters to people who don't want it, because it increases
the attack surface presented to the guest.

>  I didn't expect you to strongly recommend the use of PCI devices.
> Doing so is not just going to roll back some of the code in the kernel...
> I'll think about your suggestions.

My view on this hasn't changed since October:
https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03861.html
if this really really needs to be an MMIO device then it can
be done, but a PCI device is a much cleaner interface which
is more widely usable than just the virt board.

thanks
-- PMM
