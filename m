Received: by 10.25.159.19 with SMTP id i19csp2575521lfe;
        Wed, 10 Feb 2016 08:18:05 -0800 (PST)
X-Received: by 10.140.93.65 with SMTP id c59mr40460553qge.101.1455121085214;
        Wed, 10 Feb 2016 08:18:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a88si4361468qkj.13.2016.02.10.08.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Feb 2016 08:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTXSu-0003SV-LE
	for alex.bennee@linaro.org; Wed, 10 Feb 2016 11:18:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTXS7-0002n0-S5
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 11:17:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTXS6-0007uk-AP
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 11:17:15 -0500
Received: from smtp.andrew.cmu.edu ([128.2.157.37]:58245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aTXRy-0007sT-QH; Wed, 10 Feb 2016 11:17:06 -0500
Received: from HEDWIG.INI.CMU.EDU (HEDWIG.INI.CMU.EDU [128.2.16.51])
	(user=somlo mech=LOGIN (0 bits))
	by smtp.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1AGGwVw007011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
	Wed, 10 Feb 2016 11:16:59 -0500
Date: Wed, 10 Feb 2016 11:16:58 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, lersek@redhat.com,
	mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org,
	pbonzini@redhat.com, kraxel@redhat.com, ehabkost@redhat.com,
	luto@amacapital.net, stefanha@gmail.com, matt@codeblueprint.co.uk,
	rth@twiddle.net
Message-ID: <20160210161657.GG16357@HEDWIG.INI.CMU.EDU>
References: <1453950057-13176-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1453950057-13176-1-git-send-email-somlo@cmu.edu>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.5.24 (2015-08-30)
X-PMX-Version: 6.0.3.2322014, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.2.10.160316
X-SMTP-Spam-Clean: 8% ( MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05,
	BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0,
	BODY_SIZE_7000_LESS 0, DATE_TZ_NA 0, FROM_EDU_TLD 0,
	NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0,
	__BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CD 0,
	__CP_URI_IN_BODY 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0,
	__FORWARDED_MSG 0, __HAS_FROM 0, __HAS_MSGID 0, __IN_REP_TO 0,
	__MIME_TEXT_ONLY 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_TO_X5 0,
	__MULTIPLE_URI_TEXT 0, __PHISH_SPEAR_STRUCTURE_1 0,
	__REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0,
	__SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
	__URI_IN_BODY 0, __URI_NO_MAILTO 0, __URI_NO_WWW 0, __URI_NS ,
	__USER_AGENT 0)
X-SMTP-Spam-Score: 8%
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.37
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.andrew.cmu.edu id
	u1AGGwVw007011
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.37
Subject: Re: [Qemu-devel] [PATCH v6 0/5] add ACPI node for fw_cfg on pc and
	arm
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QQzSoR4BP4cV

Ping.

Now that the kernel side seems to have been accepted (Thanks again
Laszlo and Matt for all the help and advice!!!), is there anything
left to clean up before this series could be applied to QEMU ?

gmane.org quick links:
1/5: http://article.gmane.org/gmane.comp.emulators.qemu/389896/raw
2/5: http://article.gmane.org/gmane.comp.emulators.qemu/389894/raw
3/5: http://article.gmane.org/gmane.comp.emulators.qemu/389895/raw
4/5: http://article.gmane.org/gmane.comp.emulators.qemu/389900/raw
5/5: http://article.gmane.org/gmane.comp.emulators.qemu/389898/raw

Thanks much,
--Gabriel


On Wed, Jan 27, 2016 at 10:00:52PM -0500, Gabriel L. Somlo wrote:
> New since v5:
>=20
> 	- rebased on top of latest QEMU git master
>=20
> Thanks,
>   --Gabriel
>=20
> >New since v4:
> >
> >	- rebased on top of Marc's DMA series
> >	- drop machine compat dependency for insertion into x86/ssdt
> >	  (patch 3/5), following agreement between Igor and Eduardo
> >	- [mm]io register range now covers DMA register as well, if
> >	  available.
> >	- s/bios/firmware in doc file updates
> >
> >>New since v3:
> >>
> >>	- rebased to work on top of 87e896ab (introducing pc-*-25 classes),
> >>	  inserting fw_cfg acpi node only for machines >=3D 2.5.
> >>
> >>	- reintroduce _STA with value 0x0B (bit 2 for u/i visibility turned
> >>	  off to avoid Windows complaining -- thanks Igor for catching that!=
)
> >>
> >>If there's any other feedback besides questions regarding the
> >>appropriateness of "QEMU0002" as the value of _HID, please don't hesi=
tate!
> >>
> >>>New since v2:
> >>>
> >>>	- pc/i386 node in ssdt only on machine types *newer* than 2.4
> >>>	  (as suggested by Eduardo)
> >>>
> >>>I appreciate any further comments and reviews. Hopefully we can make
> >>>this palatable for upstream, modulo the lingering concerns about whe=
ther
> >>>"QEMU0002" is ok to use as the value of _HID, which I'll hopefully g=
et
> >>>sorted out with the kernel crew...
> >>>
> >>>>New since v1:
> >>>>
> >>>>	- expose control register size (suggested by Marc Mar=ED)
> >>>>
> >>>>	- leaving out _UID and _STA fields (thanks Shannon & Igor)
> >>>>
> >>>>	- using "QEMU0002" as the value of _HID (thanks Michael)
> >>>>
> >>>>	- added documentation blurb to docs/specs/fw_cfg.txt
> >>>>	  (mainly to record usage of the "QEMU0002" string with fw_cfg).
> >>>>
> >>>>> This series adds a fw_cfg device node to the SSDT (on pc), or to =
the
> >>>>> DSDT (on arm).
> >>>>>
> >>>>> 	- Patch 1/3 moves (and renames) the BIOS_CFG_IOPORT (0x510)
> >>>>> 	  define from pc.c to pc.h, so that it could be used from
> >>>>> 	  acpi-build.c in patch 2/3.
> >>>>>=20
> >>>>> 	- Patch 2/3 adds a fw_cfg node to the pc SSDT.
> >>>>>=20
> >>>>> 	- Patch 3/3 adds a fw_cfg node to the arm DSDT.
> >>>>>
> >>>>> I made up some names - "FWCF" for the node name, and "FWCF0001"
> >>>>> for _HID; no idea whether that's appropriate, or how else I shoul=
d
> >>>>> figure out what to use instead...
> >>>>>
> >>>>> Also, using scope "\\_SB", based on where fw_cfg shows up in the
> >>>>> output of "info qtree". Again, if that's wrong, please point me i=
n
> >>>>> the right direction.
> >>>>>
> >>>>> Re. 3/3 (also mentioned after the commit blurb in the patch itsel=
f),
> >>>>> I noticed none of the other DSDT entries contain a _STA field, wo=
ndering
> >>>>> why it would (not) make sense to include that, same as on the PC.
>=20
> Gabriel L. Somlo (5):
>   fw_cfg: expose control register size in fw_cfg.h
>   pc: fw_cfg: move ioport base constant to pc.h
>   acpi: pc: add fw_cfg device node to ssdt
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
> --=20
> 2.4.3
>=20
