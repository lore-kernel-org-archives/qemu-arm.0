Received: by 10.28.173.206 with SMTP id w197csp5527872wme;
        Wed, 17 Jan 2018 09:25:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBouxiAVXsHWoTS2jWl/fY5UEwNS8EKWXUUnQstJe+DJJ36cMWvpOPQgw5lmt66NTZmp8xT/g
X-Received: by 10.129.46.3 with SMTP id u3mr3299604ywu.481.1516209904474;
        Wed, 17 Jan 2018 09:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516209904; cv=none;
        d=google.com; s=arc-20160816;
        b=CbCPirccYTV9o61K7cT7HIeqsOz7ygzbpwXr7Jm+YPzKtVHxcI6VQ/rUMg7x84SfWf
         /OtHu7wxJ6QxH1yRfn3AgION9AivMqmJ6VxVPgc03dh8qwEUT5wmB8BmCxSyTopdoywP
         PtuvNZT0FrpaAijS60KXtTniEaqwXAXPXKZwZVh5NG/w9XwaKZnFVO/qcTUSxbyHdwJt
         nOY3JsL9jT0L/gL+I9n2w5BohrU4ZNrJ2q6Zx+rwFsHXkykxX04p/9UXlbMIwgG5oFKc
         PhtUuLsRAvPBYkBBBdiyUGjlVP755AW4FTPMzITkQnbyRPBRRpoWBhYv66xL1rbHDjWI
         UyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KNXIMpR6p+LNs288hYOpC0l+pbQVKv542p45mMUZ0JI=;
        b=igQFTVP+6uSp3aNnq7/vGSkpc1Mnu7+EKiND3XGlknXpnTW00+MNymepTMRmWUdV2A
         1WOcX/+L5gzcMhpUgBB2hOZOitL4OcfzgJnGgdT6bGa2wOdA2D+1cnIGzVPQduyNmkXT
         bF5W2mLPGVFUyxuI9ov2knrvZGzTk1I7L2T5wTScqZAxOpjqYooYE0mtFULUgSjn4cT4
         07Q3miXUrQ7CqrETeQ+vedaxr4BUUAZoynMDz9zxJ+3XirARwO813az7zdYTy8g+kCd/
         HudrRdTWVOYJwnglbB73pUp29uxzmP+IAhN7R+nM1+2O/9KTqHO8zvA5k0iNHP2pj6du
         zh3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VGaU4W0B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g26si719545ybe.660.2018.01.17.09.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 09:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VGaU4W0B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebrSR-00021f-Us
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 12:25:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebqpz-0000tD-Tp
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:45:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebqpv-0000Pt-SG
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:45:19 -0500
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242]:41833)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebqpv-0000PD-JZ; Wed, 17 Jan 2018 11:45:15 -0500
Received: by mail-io0-x242.google.com with SMTP id f6so21544280ioh.8;
	Wed, 17 Jan 2018 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=KNXIMpR6p+LNs288hYOpC0l+pbQVKv542p45mMUZ0JI=;
	b=VGaU4W0BGVEMGaVhxtPY0qKKyx02jO9laYyS/xKr9jCCiE6TWTqaT9/uJrdz/tD3mR
	WWFWGXcneWbcuLlGFj1WapmTq+SWI3igc9BeKK12LYGaGrLpGOCSVso2qjFc1tG0QxVv
	GnSyIXHtfwI3vEvWPoYT8yqOKmTq27RAAcEhvjtm+OjgfRBl30Rt3u5Urb2A2Jgu5kkI
	Cm7fytjQ6fMeH4W8UFQweyrslqsjrWnrXrk4rdwGNFKeqgu4gkXu/KJNLxS9D+rVzngl
	3qYyH+i0zxrXPHXqTczPoWL13ozha22XIoBSeUOGaL8tQdXKUthqzVakI0GlsHZzN4Ol
	ajpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=KNXIMpR6p+LNs288hYOpC0l+pbQVKv542p45mMUZ0JI=;
	b=WRaJeEfpd1IPsGFweyvhUILSlcWd3sYFiDqNAoKuB99spR+LCot3nHXDijc1diAdRx
	eFiNP/XqcKyGB8ZzOD6ZDzaBoAkI0p7EkqEoycV6CeinFLiBx6f/oHcWXPtUWdTZe3dI
	j6jQ82FNnqABJPduijbF7cu6WFB73VejfEDJLY/EtdVGX2rYOqfXOHVVp38CODuC+NXr
	VwLel/kXwRgIC6urVOJ8iojhiujo1x3u7oQsNSvHu8C8yMIWKt37xdPQgpLwUzoiuy4/
	ZQCSLnA9/w5KKpSuYVUDUriDxY6icPjNJWRF7ZR+IEEyPpkebRK06G7n0IgrQZFMqEM/
	rBWw==
X-Gm-Message-State: AKwxyteVOhSEXNj78JdGHXI+ElAlOTdrtF2i0UKRNUHH24hgJ1WyMxLY
	Q5ETX9H3Ocsh9ToGGB1p/Kw3hxkdKm6FL4PiJPY=
X-Received: by 10.107.53.221 with SMTP id k90mr22737778ioo.6.1516207514643;
	Wed, 17 Jan 2018 08:45:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.165.135 with HTTP; Wed, 17 Jan 2018 08:45:13 -0800 (PST)
In-Reply-To: <CAHQ1cqFknfW0NmiD-3GFJRedgVE-9bacKhm-pYx0ycviRsmucQ@mail.gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
	<CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
	<b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
	<CAHQ1cqFknfW0NmiD-3GFJRedgVE-9bacKhm-pYx0ycviRsmucQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 17 Jan 2018 13:45:13 -0300
X-Google-Sender-Auth: G8nA_4AGRqU-oyu021WN_iMJTOc
Message-ID: <CAAdtpL65QPW9uW8ppnz1Lz0aaCtHokJqpdHXe48G-chz-T167A@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::242
Subject: Re: [Qemu-devel] [PATCH v4 09/14] pci: Add support for Designware
 IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xq7NFy1NMHnY

Hi Andrey,

On Wed, Jan 17, 2018 at 1:12 PM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> On Wed, Jan 17, 2018 at 7:23 AM, Marcel Apfelbaum
> <marcel.apfelbaum@zoho.com> wrote:
>> That being said, if Andrey can point me to the PCI spec for the Designware
>> PCI host bridge and what parts they implemented for it I can have a look,
>> sure.
>> (I will not be available for a week or so, but right after)
>>
>
> Just in case you still want this:
>
> To the best of my knowledge, Synposys does not provide specification
> for their PCIe IP to general public and I am in no way affiliated with
> them, so I don't have any backchannels to get it any other way.
>
> The next best thing to an actual spec, that I found to be pretty
> useful, is PCIe chapter of i.MX6Q Reference Manual
> (https://www.nxp.com/docs/en/reference-manual/IMX6DQRM.pdf   page
> 4049), which is what I used to implement the code in question.

Please add a comment about it in your respin, such:

Based on "i.MX6 Applications Processor Reference Manual" (Document
Number: IMX6DQRM Rev. 4)

> Last, and probably the most important, "source of truth" was actual
> Linux PCIe driver for i.MX/Designware which I used as a sort of
> inverse reference implementation.

Same here:

Reversed from Linux v4.9 drivers/pci/host/pcie-designware.c
