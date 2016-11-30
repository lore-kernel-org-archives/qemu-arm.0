Received: by 10.25.159.131 with SMTP id i125csp357749lfe;
        Wed, 30 Nov 2016 07:56:02 -0800 (PST)
X-Received: by 10.200.40.66 with SMTP id 2mr29188814qtr.287.1480521361985;
        Wed, 30 Nov 2016 07:56:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w128si37920519qkd.147.2016.11.30.07.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 07:56:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC7Em-00085e-QZ
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 10:56:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1cC7Eh-00084L-WE
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 10:55:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1cC7Ed-0003jD-4q
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 10:55:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1cC7Ec-0003iu-Uh; Wed, 30 Nov 2016 10:55:51 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C3AA3B712;
	Wed, 30 Nov 2016 15:55:49 +0000 (UTC)
Received: from noname.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uAUFtkl6027209; Wed, 30 Nov 2016 10:55:47 -0500
Date: Wed, 30 Nov 2016 16:55:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20161130155546.GA4703@noname.redhat.com>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-26-git-send-email-clg@kaod.org>
	<921d5257-fff3-5cde-3da2-b58c94e5c792@kaod.org>
	<20161129180803.GC7080@noname.redhat.com>
	<fc7bced6-9e03-f0a5-b991-52566a42d288@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <fc7bced6-9e03-f0a5-b991-52566a42d288@kaod.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 30 Nov 2016 15:55:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.9 25/30] block: add a model option for
 MTD devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ddUnf3vbuugi

Am 30.11.2016 um 16:09 hat C=E9dric Le Goater geschrieben:
> On 11/29/2016 07:08 PM, Kevin Wolf wrote:
> > Am 29.11.2016 um 18:30 hat C=E9dric Le Goater geschrieben:
> >> On 11/29/2016 04:44 PM, C=E9dric Le Goater wrote:
> >>> This could be used to define the flash model to use on some boards
> >>> definitions.
> >>
> >> As this patch was part of a larger set, I did not send the whole=20
> >> set to qemu-block@ list. Could you please take a look at the proposa=
l ?=20
> >=20
> > This is a device level option rather than a block backend one. We mes=
sed
> > up -drive in its early days by including some device options, but we
> > don't generally want to add to this.
> >=20
> > The correct way would be to add a qdev property for this and specify =
it
> > with -device or -global.
>=20
> OK. I see. I should use something like this on the command line :
>=20
> 	-drive file=3Dflash-romulus-test,format=3Draw,if=3Dmtd,id=3Dbmc \
> 	-device mx25l25635e,drive=3Dbmc \
> 	-drive file=3Dflash-romulus-test2,format=3Draw,if=3Dmtd,id=3Dbmc2 \
> 	-device mx25l25635e,drive=3Dbmc2 \
> 	-drive file=3Dromulus.pnor,format=3Draw,if=3Dmtd,id=3Dpnor \
> 	-device mx66l1g45g,drive=3Dpnor=20

I think you mean if=3Dnone instead of if=3Dmtd everywhere, now that you'r=
e
using an explicit -device.

> and retrieve the attached m25p80 device from the drive with the=20
> routine blk_get_attached_dev(). That is changing a bit the way
> the platform is initialized but it is cleaner as no default=20
> devices are automatically added.

Right. For compatibility (and convenience) you can and probably should
still support if=3Dmtd to create the device automatically, but then the
user just gets the defaults for the options that -drive doesn't allow to
specify.

Kevin
