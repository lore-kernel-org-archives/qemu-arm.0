Received: by 10.25.77.65 with SMTP id a62csp2047194lfb;
        Mon, 6 Feb 2017 23:42:54 -0800 (PST)
X-Received: by 10.55.162.138 with SMTP id l132mr12804720qke.204.1486453374717;
        Mon, 06 Feb 2017 23:42:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p130si2372215qka.10.2017.02.06.23.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Feb 2017 23:42:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cb0QO-0002HA-9P
	for alex.bennee@linaro.org; Tue, 07 Feb 2017 02:42:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cb0QJ-0002Gt-8d
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 02:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cb0QG-0004Ne-5o
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 02:42:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1cb0QG-0004Mn-0P
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 02:42:44 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB7E0624A9;
	Tue,  7 Feb 2017 07:42:43 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-105.ams2.redhat.com
	[10.36.116.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D80516A73;
	Tue,  7 Feb 2017 07:42:43 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 8F19C8084E; Tue,  7 Feb 2017 08:42:40 +0100 (CET)
Message-ID: <1486453360.24589.14.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Date: Tue, 07 Feb 2017 08:42:40 +0100
In-Reply-To: <20170207000824.8L0ShHJx@smtp1m.mail.yandex.net>
References: <20170207000824.8L0ShHJx@smtp1m.mail.yandex.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 07 Feb 2017 07:42:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/2] usb/ehci: Add SysBus EHCI device for
 Allwinner SoCs
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c0BvWS7BP9aM

On Mo, 2017-01-30 at 21:59 +0800, Icenowy Zheng wrote:
> 2017=E5=B9=B41=E6=9C=8830=E6=97=A5 16:19=E4=BA=8E Gerd Hoffmann <kraxel@r=
edhat.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On So, 2017-01-29 at 09:00 +0800, Icenowy Zheng wrote:=20
> > > It uses a register map like the one in Exynos SoCs.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> >
> > I guess this goes through the arm queue?=20
>=20
> I don't know about the QEMU development process, sorry.

The question was for Peter who maintains the arm queue.

And as patch 2/2 (which clearly belongs to arm) depends on 1/2 it is
easier to just take both through the same queue even though 2/2 is a usb
patch.

cheers,
  Gerd

