Received: by 10.25.208.211 with SMTP id h202csp1582847lfg;
        Tue, 16 Feb 2016 15:50:21 -0800 (PST)
X-Received: by 10.55.80.9 with SMTP id e9mr30248028qkb.94.1455666621167;
        Tue, 16 Feb 2016 15:50:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 187si43163705qhu.11.2016.02.16.15.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 15:50:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVpNs-0002wm-Ln
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 18:50:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aVpNp-0002wQ-MV
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 18:50:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aVpNm-0002Um-Fk
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 18:50:17 -0500
Received: from smtp.andrew.cmu.edu ([128.2.105.203]:48430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aVpNm-0002UW-9Y; Tue, 16 Feb 2016 18:50:14 -0500
Received: from GLSMBP.INI.CMU.EDU (pool-108-39-135-65.pitbpa.fios.verizon.net
	[108.39.135.65]) (user=somlo mech=LOGIN (0 bits))
	by smtp.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1GNnxIl008930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
	Tue, 16 Feb 2016 18:50:05 -0500
Date: Tue, 16 Feb 2016 18:49:59 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Message-ID: <20160216234959.GA25564@GLSMBP.INI.CMU.EDU>
References: <1455228365-13666-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1455228365-13666-1-git-send-email-somlo@cmu.edu>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.5.24 (2015-08-30)
X-PMX-Version: 6.0.3.2322014, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.2.16.233916
X-SMTP-Spam-Clean: 28% (
	SXL_IP_DYNAMIC 3, MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05,
	BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0,
	BODY_SIZE_7000_LESS 0, DATE_TZ_NA 0, FROM_EDU_TLD 0,
	NO_URI_HTTPS 0, RDNS_GENERIC_POOLED 0, RDNS_POOLED 0,
	RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, RDNS_SUSP_SPECIFIC 0,
	REFERENCES 0, SINGLE_URI_IN_BODY 0, __ANY_URI 0,
	__BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CD 0,
	__CP_URI_IN_BODY 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0,
	__FORWARDED_MSG 0, __HAS_FROM 0, __HAS_MSGID 0, __IN_REP_TO 0,
	__MIME_TEXT_ONLY 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0,
	__PHISH_SPEAR_STRUCTURE_1 0, __RDNS_POOLED_10 0, __REFERENCES 0,
	__SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0,
	__SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
	__URI_IN_BODY 0, __URI_NO_MAILTO 0, __URI_NO_WWW 0, __URI_NS ,
	__USER_AGENT 0)
X-SMTP-Spam-Score: 28%
X-Scanned-By: MIMEDefang 2.74 on 128.2.105.203
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.andrew.cmu.edu id
	u1GNnxIl008930
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.105.203
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: Re: [Qemu-arm] [PATCH v8 0/5] add ACPI node for fw_cfg on pc and arm
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
X-TUID: vPCLIKViLpPn

On Thu, Feb 11, 2016 at 05:06:00PM -0500, Gabriel L. Somlo wrote:
> Generate an ACPI DSDT node for fw_cfg on pc and arm guests.
>=20
> New since v7:
>=20
> 	- edited commit blurb on 3/5 to match updated content, i.e. that
> 	  the ACPI node is now inserted into the DSDT (no longer the SSDT).
> 	  (Thanks to Igor Mammedov for catching that!)

BTW, regarding Igor's question about Windows starting to search for a
driver: Just for grins, I installed Windows 10 (with qemu git master
*before* this series was applied). Then, after applying the series,
DeviceManager was happy and had no unknown hardware listed.

Only after setting the fw_cfg _STA to 0x0F did I get an unknown device
like so: http://imagebin.ca/v/2XDUfONVF3bY

So, on XP, Windows 7, and Windows 10, the fw_cfg device showing up in
ACPI with a _STA set to 0x0B will *NOT* prompt the device manager to=20
start making trouble :)

Thanks,
--Gabriel

> >New since v6:
> >	- rebased to fit on top of fb306ff and f264d36, which moved things
> >	  around in pc's acpi-build.c (only patch 3/5 affected);
> >	- kernel-side fw_cfg sysfs driver accepted into upstream linux
> >
> >>New since v5:
> >>
> >>	- rebased on top of latest QEMU git master
> >>
> >>>New since v4:
> >>>
> >>>	- rebased on top of Marc's DMA series
> >>>	- drop machine compat dependency for insertion into x86/ssdt
> >>>	  (patch 3/5), following agreement between Igor and Eduardo
> >>>	- [mm]io register range now covers DMA register as well, if
> >>>	  available.
> >>>	- s/bios/firmware in doc file updates
> >>>
> >>>>New since v3:
> >>>>
> >>>>	- rebased to work on top of 87e896ab (introducing pc-*-25 classes)=
,
> >>>>	  inserting fw_cfg acpi node only for machines >=3D 2.5.
> >>>>
> >>>>	- reintroduce _STA with value 0x0B (bit 2 for u/i visibility turne=
d
> >>>>	  off to avoid Windows complaining -- thanks Igor for catching tha=
t!)
> >>>>
> >>>>If there's any other feedback besides questions regarding the
> >>>>appropriateness of "QEMU0002" as the value of _HID, please don't he=
sitate!
> >>>>
> >>>>>New since v2:
> >>>>>
> >>>>>	- pc/i386 node in ssdt only on machine types *newer* than 2.4
> >>>>>	  (as suggested by Eduardo)
> >>>>>
> >>>>>I appreciate any further comments and reviews. Hopefully we can ma=
ke
> >>>>>this palatable for upstream, modulo the lingering concerns about w=
hether
> >>>>>"QEMU0002" is ok to use as the value of _HID, which I'll hopefully=
 get
> >>>>>sorted out with the kernel crew...
> >>>>>
> >>>>>>New since v1:
> >>>>>>
> >>>>>>	- expose control register size (suggested by Marc Mar=ED)
> >>>>>>
> >>>>>>	- leaving out _UID and _STA fields (thanks Shannon & Igor)
> >>>>>>
> >>>>>>	- using "QEMU0002" as the value of _HID (thanks Michael)
> >>>>>>
> >>>>>>	- added documentation blurb to docs/specs/fw_cfg.txt
> >>>>>>	  (mainly to record usage of the "QEMU0002" string with fw_cfg).
> >>>>>>
> >>>>>>> This series adds a fw_cfg device node to the SSDT (on pc), or t=
o the
> >>>>>>> DSDT (on arm).
> >>>>>>>
> >>>>>>> 	- Patch 1/3 moves (and renames) the BIOS_CFG_IOPORT (0x510)
> >>>>>>> 	  define from pc.c to pc.h, so that it could be used from
> >>>>>>> 	  acpi-build.c in patch 2/3.
> >>>>>>>=20
> >>>>>>> 	- Patch 2/3 adds a fw_cfg node to the pc SSDT.
> >>>>>>>=20
> >>>>>>> 	- Patch 3/3 adds a fw_cfg node to the arm DSDT.
> >>>>>>>
> >>>>>>> I made up some names - "FWCF" for the node name, and "FWCF0001"
> >>>>>>> for _HID; no idea whether that's appropriate, or how else I sho=
uld
> >>>>>>> figure out what to use instead...
> >>>>>>>
> >>>>>>> Also, using scope "\\_SB", based on where fw_cfg shows up in th=
e
> >>>>>>> output of "info qtree". Again, if that's wrong, please point me=
 in
> >>>>>>> the right direction.
> >>>>>>>
> >>>>>>> Re. 3/3 (also mentioned after the commit blurb in the patch its=
elf),
> >>>>>>> I noticed none of the other DSDT entries contain a _STA field, =
wondering
> >>>>>>> why it would (not) make sense to include that, same as on the P=
C.
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
> --=20
> 2.4.3
>=20
