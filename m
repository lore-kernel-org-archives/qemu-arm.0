Received: by 10.25.208.211 with SMTP id h202csp2779297lfg;
        Thu, 3 Mar 2016 08:16:21 -0800 (PST)
X-Received: by 10.140.160.214 with SMTP id g205mr4347569qhg.88.1457021780991;
        Thu, 03 Mar 2016 08:16:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d193si4443435qka.54.2016.03.03.08.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 08:16:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abVvI-0002Bo-C6
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 11:16:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1abVvG-0002BF-2I
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1abVvA-0003X2-Vf
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:16:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1abVvA-0003WZ-QX; Thu, 03 Mar 2016 11:16:12 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id DAD9B7F087;
	Thu,  3 Mar 2016 16:16:11 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23GGANp019298; Thu, 3 Mar 2016 11:16:11 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 996A7816A2; Thu,  3 Mar 2016 17:16:08 +0100 (CET)
Message-ID: <1457021768.3574.58.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 03 Mar 2016 17:16:08 +0100
In-Reply-To: <CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
References: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
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
X-TUID: /vVeNrq+loiX

  Hi,

> > +        ch->cs |=3D BCM2708_DMA_END;
> > +        if (ch->ti & BCM2708_DMA_INT_EN) {
> > +            ch->cs |=3D BCM2708_DMA_INT;
> > +            s->int_status |=3D (1 << c);
> > +            qemu_set_irq(ch->irq, 1);
> > +        }
> > +
> > +        /* Process next CB */
> > +        ch->conblk_ad =3D ch->nextconbk;
> > +    }
>=20
> This loop allows a guest to make QEMU lock up (stop responding to monitor
> commands, etc) if it feeds the device a circular loop of CBs. On the othe=
r
> hand I don't think we have a good approach to avoiding this problem,
> so never mind.

usb emulation has this problem too.

uhci queue heads can go in circles.  The emulation code keeps a linked
list of active queue heads, which is (among other bookkeeping things)
used to detect when we run in circles.  It's a legal thing to do for a
guest btw, so you can see that happening in practice.

until recently ehci could be tricked into running in loops too, by
creating a circular chain of IDTs.  Which is not legal according to
specs, so this went unnoticed for a while.  But a malicious guest can do
it nevertheless.  That one was fixed by stopping IDT processing in case
no data was transfered.  This is possible because the ehci controller
writes back the status to the IDT, so we can figure there is nothing to
do (because we already processed that IDT) without additional
bookkeeping, by simply checking the status.

=46rom a brief look at the patch it seems you can not use the later for
the bcm2835 dma controller, I can't spot a place where the some status
is written back to the dma contol block ...

cheers,
  Gerd

