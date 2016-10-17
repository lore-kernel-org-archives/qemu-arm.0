Received: by 10.80.166.35 with SMTP id d32csp260828edc;
        Sun, 16 Oct 2016 20:44:30 -0700 (PDT)
X-Received: by 10.55.142.130 with SMTP id q124mr20817320qkd.220.1476675869919;
        Sun, 16 Oct 2016 20:44:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a72si16814006qkc.39.2016.10.16.20.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Oct 2016 20:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bvyqj-0003Ty-7P
	for alex.bennee@linaro.org; Sun, 16 Oct 2016 23:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqd-0003SX-HY
	for qemu-arm@nongnu.org; Sun, 16 Oct 2016 23:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqZ-000145-Dt
	for qemu-arm@nongnu.org; Sun, 16 Oct 2016 23:44:23 -0400
Received: from ozlabs.org ([103.22.144.67]:45473)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1bvyqY-000130-RN; Sun, 16 Oct 2016 23:44:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sy3wc4YLVz9sD5; Mon, 17 Oct 2016 14:44:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1476675856;
	bh=qTnI8Wfvsyh72dC35Zdhn7i/uEzAD65TIDKZhHCuVTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcv6AVPMkiBXzMoYcamzwUsBG8qhrMr2/ZPb9kztuoNj1amGi/7uhEv3H+fM92KL9
	CYq2ZzIT1F2g5+hGUw26WzbSzDccVGubKleqtsklwCc0ZtTnASrmGGhMP1YOBIQKIc
	psxeATLpPsNzj78JZlpuSwrEy0GvAupWV2962Hxw=
Date: Mon, 17 Oct 2016 14:44:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161017034404.GT25390@umbus.fritz.box>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JMCz+drDJ1SjddZX"
Content-Disposition: inline
In-Reply-To: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
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
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: voIw1FdekOgh


--JMCz+drDJ1SjddZX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2016 at 12:52:46AM +0200, Laurent Vivier wrote:
> Since commit 42ecaba ("target-i386: Call cpu_exec_init() on realize"),
> , commit 6dd0f83 ("target-ppc: Move cpu_exec_init() call to realize funct=
ion"),
> and commit c6644fc ("s390x/cpu: Get rid of side effects when creating a v=
cpu"),
> cpu_exec_init() has been moved to realize function for some architectures
> to implement CPU htoplug. This allows any failures from cpu_exec_init() t=
o be
> handled appropriately.
>=20
> This series tries to do the same work for all the other CPUs.
>=20
> But as the ARM Virtual Machine ("virt") needs the "memory" property of th=
e CPU
> in the machine init function (the "memory" property is created in
> cpu_exec_init() we want to move to the realize part), split cpu_exec_init=
() in
> two parts: a realize part (cpu_exec_realizefn(), adding the CPU in the
> environment) and an init part (cpu_exec_initfn(), initializing the CPU, l=
ike
> adding the "memory" property). To mirror the realize part, add an unreali=
ze
> part, and remove the cpu_exec_exit() call from the finalize part.
>=20
> This also allows to remove all the "cannot_destroy_with_object_finalize_y=
et"
> properties from the CPU device class.

This is looking good to me - the v3 re-org has made it quite a bit
easier to follow.

Whose tree should this go via?

> v3:
> - reorganize the series in 3 patches:
>   1- split cpu_exec_init() and call the init part from
>      cpu_common_initfn()
>   2- move all the cpu_exec_realize() calls to the
>      XXX_cpu_realizefn() functions
>   3- create a cpu_common_unrealizefn() function
>       and call the cpu_exec_unrealize() function from here,
>       except for ppc64 and i386 that have their own XX_cpu_unrealizefn()
>       functions
> - rename cpu_exec_init(), cpu_exec_realize(), cpu_exec_unrealize()
>   to cpu_exec_initfn(), cpu_exec_realizefn() and cpu_exec_unrealizefn(),
> - move cpu_exec_unrealizefn() to the device class unrealize
>   and declare it in qom/cpu.h instead of exec/exec-all.h
>=20
> v2:
> - rename cpu_exec_exit() as cpu_exec_unrealize(),
>   as it un-does what cpu_exec_realize() does,
> - remove cpu_exec_exit() from ppc_cpu_unrealizefn() as
>   it is called from cpu_common_finalize(),
> - add a patch to move all cpu_exec_init() from
>   all XX_cpu_initfn() to cpu_common_initfn(),
> - arm: move setting of cpu->mp_affinity to
>   arm_cpu_realizefn() as the cpu_index is now set in
>   cpu_exec_realizefn().
> - update some commit messages
>=20
> Laurent Vivier (3):
>   exec: split cpu_exec_init()
>   exec: rename cpu_exec_init() as cpu_exec_realizefn()
>   exec: call cpu_exec_exit() from a CPU unrealize common function
>=20
>  exec.c                      | 12 +++++++-----
>  include/exec/exec-all.h     |  1 -
>  include/qom/cpu.h           |  4 +++-
>  qom/cpu.c                   | 10 +++++++++-
>  target-alpha/cpu.c          | 15 +++++++--------
>  target-arm/cpu.c            | 39 +++++++++++++++++----------------------
>  target-cris/cpu.c           | 15 +++++++--------
>  target-i386/cpu.c           | 13 +++++++------
>  target-lm32/cpu.c           | 15 +++++++--------
>  target-m68k/cpu.c           | 15 +++++++--------
>  target-microblaze/cpu.c     | 14 +++++++-------
>  target-mips/cpu.c           | 15 +++++++--------
>  target-moxie/cpu.c          | 15 +++++++--------
>  target-openrisc/cpu.c       | 15 +++++++--------
>  target-ppc/translate_init.c |  4 ++--
>  target-s390x/cpu.c          |  8 +-------
>  target-sh4/cpu.c            | 15 +++++++--------
>  target-sparc/cpu.c          | 18 +++++++++---------
>  target-tilegx/cpu.c         | 15 +++++++--------
>  target-tricore/cpu.c        | 15 +++++++--------
>  target-unicore32/cpu.c      | 18 +++++++++---------
>  target-xtensa/cpu.c         | 15 +++++++--------
>  22 files changed, 148 insertions(+), 158 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JMCz+drDJ1SjddZX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBEkEAAoJEGw4ysog2bOSmJQQAI8dJj3HvHy53YaDFnPsowdZ
OfGTgctqPwDN5DOQHj07fFomWN3vWksKADPcQ09VaNENJ+bp1MvVxrLWflAVL1Ah
5M5DBoQvU2cmVmrwMkkYWV4ZFwuGB2+36xuVov4EkwXCYkvu33EA4YSmKUftQ3v9
4JFTP7H5OteO3XDJM/4uDOV5q9I1g1cJGKWg+rOiOhfOur1IABtTaJ+ZQJwC/Voj
G3EprFfMiVjx2hPattLppedWSqD+A+f0zZdQ3n8DOaFb7HxaMThA4lVwShYptJTo
KprDSzCcQoz+XOIVu/KdFhndKHrCfaUyLuSOMIc0jUYL4ijG/Ui+Sv9EV0/ksGfn
0kpoAzbTqEKoN0fp7vnNGCLDtDdgn/Kr1F5No5kZZO0C5zsHYk6qGoXdtzY0JeSC
rk+Hw0vuzp1Cr2kjszES3AVRwubXu9fdL/kogereSD7X6raVBFPdPY5dmdumoyr/
NSiQejEX5qFU0Os4vNUz7AbPllNwCNflXa8ZnCQVFf8jhXmdo0halRSuuILlHkCB
Jvbk3Ksg0IugYAcIpcx8Ve2u5Nb4DkT6k448+nByxfTk52XQmOAyNwG+dlNeGUhm
n01M8xQ7sGs2pMOEwYRb9+zX0rzzdp7+aVa8C/IkMAxgV1BDmJjKI/1fuHobITGB
ZCsQ92t2xFWpUEoe6G/0
=ZL45
-----END PGP SIGNATURE-----

--JMCz+drDJ1SjddZX--
