Received: by 10.25.208.211 with SMTP id h202csp1151598lfg;
        Mon, 22 Feb 2016 04:30:31 -0800 (PST)
X-Received: by 10.140.109.98 with SMTP id k89mr33505307qgf.69.1456144231690;
        Mon, 22 Feb 2016 04:30:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w74si18391285qgw.78.2016.02.22.04.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 04:30:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXpdG-0002sJ-I1
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 07:30:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aXpdD-0002s0-9k
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 07:30:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aXpd8-0001rZ-9y
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 07:30:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aXpd8-0001rQ-2d; Mon, 22 Feb 2016 07:30:22 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id A75AC1F571;
	Mon, 22 Feb 2016 12:30:21 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1MCUGDB031351; Mon, 22 Feb 2016 07:30:17 -0500
Date: Mon, 22 Feb 2016 13:30:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Gabriel L. Somlo" <somlo@cmu.edu>, kraxel@redhat.com
Message-ID: <20160222133015.6eece98e@nial.brq.redhat.com>
In-Reply-To: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, pbonzini@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 0/5] add ACPI node for fw_cfg
 on pc and arm
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
X-TUID: JA98dDpO1aO0

On Fri, 19 Feb 2016 13:20:24 -0500
"Gabriel L. Somlo" <somlo@cmu.edu> wrote:

Gerd,

if you are going to apply it, you'll need to update
expected tables for acpi test (rebuild-expected-aml.sh)
as a commit on top of this series.

> Generate an ACPI DSDT node for fw_cfg on pc and arm guests.
>=20
> New since v8:
>=20
> 	- patch 3/5: on pc/x86, place FWCF node in scope \_SB.PCI0
> 	  (instead of directly under \_SB), to prevent any possible
> 	  resource conflict as might be observed by Windows
> 	  (thanks again to Igor Mammedov for the suggestion!)
>=20
> Thanks,
>   --Gabriel
>=20
> >New since v7:
> >
> >	- edited commit blurb on 3/5 to match updated content, i.e. that
> >	  the ACPI node is now inserted into the DSDT (no longer the SSDT).
> >	  (Thanks to Igor Mammedov for catching that!)
> > =20
> >>New since v6:
> >>	- rebased to fit on top of fb306ff and f264d36, which moved things
> >>	  around in pc's acpi-build.c (only patch 3/5 affected);
> >>	- kernel-side fw_cfg sysfs driver accepted into upstream linux
> >> =20
> >>>New since v5:
> >>>
> >>>	- rebased on top of latest QEMU git master
> >>> =20
> >>>>New since v4:
> >>>>
> >>>>	- rebased on top of Marc's DMA series
> >>>>	- drop machine compat dependency for insertion into x86/ssdt
> >>>>	  (patch 3/5), following agreement between Igor and Eduardo
> >>>>	- [mm]io register range now covers DMA register as well, if
> >>>>	  available.
> >>>>	- s/bios/firmware in doc file updates
> >>>> =20
> >>>>>New since v3:
> >>>>>
> >>>>>	- rebased to work on top of 87e896ab (introducing pc-*-25 classes),
> >>>>>	  inserting fw_cfg acpi node only for machines >=3D 2.5.
> >>>>>
> >>>>>	- reintroduce _STA with value 0x0B (bit 2 for u/i visibility turned
> >>>>>	  off to avoid Windows complaining -- thanks Igor for catching that=
!)
> >>>>>
> >>>>>If there's any other feedback besides questions regarding the
> >>>>>appropriateness of "QEMU0002" as the value of _HID, please don't hes=
itate!
> >>>>> =20
> >>>>>>New since v2:
> >>>>>>
> >>>>>>	- pc/i386 node in ssdt only on machine types *newer* than 2.4
> >>>>>>	  (as suggested by Eduardo)
> >>>>>>
> >>>>>>I appreciate any further comments and reviews. Hopefully we can make
> >>>>>>this palatable for upstream, modulo the lingering concerns about wh=
ether
> >>>>>>"QEMU0002" is ok to use as the value of _HID, which I'll hopefully =
get
> >>>>>>sorted out with the kernel crew...
> >>>>>> =20
> >>>>>>>New since v1:
> >>>>>>>
> >>>>>>>	- expose control register size (suggested by Marc Mar=C3=AD)
> >>>>>>>
> >>>>>>>	- leaving out _UID and _STA fields (thanks Shannon & Igor)
> >>>>>>>
> >>>>>>>	- using "QEMU0002" as the value of _HID (thanks Michael)
> >>>>>>>
> >>>>>>>	- added documentation blurb to docs/specs/fw_cfg.txt
> >>>>>>>	  (mainly to record usage of the "QEMU0002" string with fw_cfg).
> >>>>>>> =20
> >>>>>>>> This series adds a fw_cfg device node to the SSDT (on pc), or to=
 the
> >>>>>>>> DSDT (on arm).
> >>>>>>>>
> >>>>>>>> 	- Patch 1/3 moves (and renames) the BIOS_CFG_IOPORT (0x510)
> >>>>>>>> 	  define from pc.c to pc.h, so that it could be used from
> >>>>>>>> 	  acpi-build.c in patch 2/3.
> >>>>>>>>=20
> >>>>>>>> 	- Patch 2/3 adds a fw_cfg node to the pc SSDT.
> >>>>>>>>=20
> >>>>>>>> 	- Patch 3/3 adds a fw_cfg node to the arm DSDT.
> >>>>>>>>
> >>>>>>>> I made up some names - "FWCF" for the node name, and "FWCF0001"
> >>>>>>>> for _HID; no idea whether that's appropriate, or how else I shou=
ld
> >>>>>>>> figure out what to use instead...
> >>>>>>>>
> >>>>>>>> Also, using scope "\\_SB", based on where fw_cfg shows up in the
> >>>>>>>> output of "info qtree". Again, if that's wrong, please point me =
in
> >>>>>>>> the right direction.
> >>>>>>>>
> >>>>>>>> Re. 3/3 (also mentioned after the commit blurb in the patch itse=
lf),
> >>>>>>>> I noticed none of the other DSDT entries contain a _STA field, w=
ondering
> >>>>>>>> why it would (not) make sense to include that, same as on the PC=
. =20
>=20
> Gabriel L. Somlo (5):
>   fw_cfg: expose control register size in fw_cfg.h
>   pc: fw_cfg: move ioport base constant to pc.h
>   acpi: pc: add fw_cfg device node to dsdt
>   acpi: arm: add fw_cfg device node to dsdt
>   fw_cfg: document ACPI device node information
>=20
>  docs/specs/fw_cfg.txt     |  9 +++++++++
>  hw/arm/virt-acpi-build.c  | 15 +++++++++++++++
>  hw/i386/acpi-build.c      | 29 +++++++++++++++++++++++++++++
>  hw/i386/pc.c              |  5 ++---
>  hw/nvram/fw_cfg.c         |  4 +++-
>  include/hw/i386/pc.h      |  2 ++
>  include/hw/nvram/fw_cfg.h |  3 +++
>  7 files changed, 63 insertions(+), 4 deletions(-)
>=20

