Received: by 10.25.208.211 with SMTP id h202csp275802lfg;
        Fri, 4 Mar 2016 00:03:28 -0800 (PST)
X-Received: by 10.140.144.83 with SMTP id 80mr8821652qhq.102.1457078608762;
        Fri, 04 Mar 2016 00:03:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si2649839qkw.52.2016.03.04.00.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 00:03:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abkhs-0002dq-BB
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 03:03:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1abkhP-00024c-Pb
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 03:03:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1abkhM-0003ys-I5
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 03:02:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1abkhM-0003ym-DD; Fri, 04 Mar 2016 03:02:56 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id D0DADC0005D6;
	Fri,  4 Mar 2016 08:02:55 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-34.ams2.redhat.com
	[10.36.116.34])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2482rY5025114; Fri, 4 Mar 2016 03:02:54 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 6B847816A2; Fri,  4 Mar 2016 09:02:48 +0100 (CET)
Message-ID: <1457078568.3574.67.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 04 Mar 2016 09:02:48 +0100
In-Reply-To: <CAFEAcA83d79ta+-40_M_mXYs9E=eSQMH9jL7kw-UpPLxK-8Kyw@mail.gmail.com>
References: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
	<1457021768.3574.58.camel@redhat.com>
	<CAFEAcA83d79ta+-40_M_mXYs9E=eSQMH9jL7kw-UpPLxK-8Kyw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Stefan Weil <sw@weilnetz.de>,
	=?ISO-8859-1?Q?Gr=E9gory?= ESTRADE <gregory.estrade@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC] bcm2835_dma: add emulation
 of Raspberry Pi DMA controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cFunAbh6VjMU

  Hi,

> I guess a more general approach to the problem would be to have
> a (hopefully easy) way to say "if this has been going on for too
> long then arrange to defer continued processing of it til later,
> and for now resume the guest".

Doable today, by simply applying some limit and if we hit it schedule a
timer to continue later.

uhci emulation does this, but it's basically no extra work there as usb
emulation is timer based _anyway_.

> That's too big a can of worms for
> this patch, though. (And for something that's only used in TCG
> emulation we care much less about malicious guests than for devices
> that can be used with KVM.)

Agree, given the use case this isn't critical by any means.

cheers,
  Gerd
