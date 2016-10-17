Received: by 10.80.166.35 with SMTP id d32csp703237edc;
        Mon, 17 Oct 2016 16:03:08 -0700 (PDT)
X-Received: by 10.55.48.10 with SMTP id w10mr26063586qkw.43.1476745387957;
        Mon, 17 Oct 2016 16:03:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l82si19158855qki.229.2016.10.17.16.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 16:03:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwGvz-0000BX-Hl
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 19:03:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bwGvu-0000BN-BP
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 19:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bwGvq-0003hF-7P
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 19:03:02 -0400
Received: from ozlabs.org ([103.22.144.67]:51029)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1bwGvp-0003d1-4l; Mon, 17 Oct 2016 19:02:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3syYdS6q1dz9sD6; Tue, 18 Oct 2016 10:02:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1476745372;
	bh=GmC8aWEkmFHk+I28v3HWHIxY8l3IHavN7ZLwEejEXDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qBk4BpW4LS6CZIQv2H1rTM6OmB27Ow3ZbAys4X2+wKhqWruxJtiY0uGcHeGmN0pgC
	/omPUxdmgCJw+PNWsjAVECkx0GM11vi+hCLGqg/Dp7E2tL1Kt2yh4NYuX0HzKXimed
	6GbT52jQHbUziOgHNyCwPqlMhmIevto6QyvuCQOw=
Date: Tue, 18 Oct 2016 09:50:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20161017225005.GW25390@umbus.fritz.box>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<20161017034404.GT25390@umbus.fritz.box>
	<20161017184734.GZ3275@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+epxrXWOh++2HLjY"
Content-Disposition: inline
In-Reply-To: <20161017184734.GZ3275@thinpad.lan.raisama.net>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v3 0/3] Split cpu_exec_init() into an init
 and a realize part
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
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tGYZyo3sD51F


--+epxrXWOh++2HLjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2016 at 04:47:34PM -0200, Eduardo Habkost wrote:
> On Mon, Oct 17, 2016 at 02:44:04PM +1100, David Gibson wrote:
> > On Sat, Oct 15, 2016 at 12:52:46AM +0200, Laurent Vivier wrote:
> > > Since commit 42ecaba ("target-i386: Call cpu_exec_init() on realize"),
> > > , commit 6dd0f83 ("target-ppc: Move cpu_exec_init() call to realize f=
unction"),
> > > and commit c6644fc ("s390x/cpu: Get rid of side effects when creating=
 a vcpu"),
> > > cpu_exec_init() has been moved to realize function for some architect=
ures
> > > to implement CPU htoplug. This allows any failures from cpu_exec_init=
() to be
> > > handled appropriately.
> > >=20
> > > This series tries to do the same work for all the other CPUs.
> > >=20
> > > But as the ARM Virtual Machine ("virt") needs the "memory" property o=
f the CPU
> > > in the machine init function (the "memory" property is created in
> > > cpu_exec_init() we want to move to the realize part), split cpu_exec_=
init() in
> > > two parts: a realize part (cpu_exec_realizefn(), adding the CPU in the
> > > environment) and an init part (cpu_exec_initfn(), initializing the CP=
U, like
> > > adding the "memory" property). To mirror the realize part, add an unr=
ealize
> > > part, and remove the cpu_exec_exit() call from the finalize part.
> > >=20
> > > This also allows to remove all the "cannot_destroy_with_object_finali=
ze_yet"
> > > properties from the CPU device class.
> >=20
> > This is looking good to me - the v3 re-org has made it quite a bit
> > easier to follow.
> >=20
> > Whose tree should this go via?
>=20
> I can merge it through the machine tree, if others agree.

Fine my me, fwiw.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+epxrXWOh++2HLjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBVWaAAoJEGw4ysog2bOS3wwP/RaKYuiHxPgtFaN/c4IXtnyX
n1/iEe3UNhCyuepAIODPan42549VuVAdi806dlV6K+6b8QwVic8H0cJJ5q2y2FSb
S5ag+QcxtttQh2v86VIj+S4dVkGmAdDH7YF3jPyHQKX121psfi0VkBwXTnVj4Q9n
vHcsEMnruxVba6DJgJ9MH4q6C7q5upScmR4BKuq4usQM92HkJWmgPu+T36ymfOkX
z/2rGqLrfT2rPTTz/z1FXzWoTHhdy9G/nJ/DkmFzxQgJbx2jojuly2YAFKBrIMyo
baASTvlBSDhl29DWkWVf6wySftVgiTRGaTdpzHeWkBDFDZ5EGDyMFmdQoaRjfbNB
ZUZ7XuRBsBm5Hx1QNu9CB/n1t2WytAkAYSK81kZj2KDcNe+cUahu5YG0sAtVatio
hXNrpY686qcDKxK/lbHS2EBgDef9XbAxe8JJpYWFmOVgZDHfves+NXECvXGsymbI
dIsDMrzUhC+Gix9cpK16WmcOWBgrQv1kHbWoHIbv44n3UpmReceKN9IGmQ/4bQXi
34TKjQArL4aU19DGtmRdOv4Wq3BnjfZ6NMljMsT96+jbfgFeGMBkuWsbPdJ6oeDZ
5544fuKe4AziCgT/eM5HMjw1eAeors/bffd0B+6UFNKi6Mk1gblgHvLcVF6S2NGS
eHh+uDq/CTm8lvt1mCcB
=A4Xa
-----END PGP SIGNATURE-----

--+epxrXWOh++2HLjY--
