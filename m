Received: by 10.25.159.19 with SMTP id i19csp2703374lfe;
        Wed, 10 Feb 2016 12:42:46 -0800 (PST)
X-Received: by 10.140.94.46 with SMTP id f43mr50821545qge.95.1455136964615;
        Wed, 10 Feb 2016 12:42:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a140si5445686qhc.57.2016.02.10.12.42.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Feb 2016 12:42:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTbb2-0008Qf-5n
	for alex.bennee@linaro.org; Wed, 10 Feb 2016 15:42:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTbaB-0007Ag-Ct
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTbaA-0008OS-4h
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:51 -0500
Received: from relay-05.andrew.cmu.edu ([128.2.157.12]:39545
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aTba4-0008Jl-6s; Wed, 10 Feb 2016 15:41:44 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.7/8.14.7) with ESMTP id u1AKfeYA004670;
	Wed, 10 Feb 2016 15:41:40 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Wed, 10 Feb 2016 15:41:35 -0500
Message-Id: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1AKfeYA004670
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.12
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-devel] [PATCH v7 0/5] add ACPI node for fw_cfg on pc and arm
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
X-TUID: VwQaR9YzWMej

Generate an ACPI DSDT node for fw_cfg on pc and arm guests.

New since v6:
	- rebased to fit on top of fb306ff and f264d36, which moved things
	  around in pc's acpi-build.c (only patch 3/5 affected);
	- kernel-side fw_cfg sysfs driver accepted into upstream linux

Thanks,
 --Gabriel

>New since v5:
>
>	- rebased on top of latest QEMU git master
>
>>New since v4:
>>
>>	- rebased on top of Marc's DMA series
>>	- drop machine compat dependency for insertion into x86/ssdt
>>	  (patch 3/5), following agreement between Igor and Eduardo
>>	- [mm]io register range now covers DMA register as well, if
>>	  available.
>>	- s/bios/firmware in doc file updates
>>
>>>New since v3:
>>>
>>>	- rebased to work on top of 87e896ab (introducing pc-*-25 classes),
>>>	  inserting fw_cfg acpi node only for machines >=3D 2.5.
>>>
>>>	- reintroduce _STA with value 0x0B (bit 2 for u/i visibility turned
>>>	  off to avoid Windows complaining -- thanks Igor for catching that!)
>>>
>>>If there's any other feedback besides questions regarding the
>>>appropriateness of "QEMU0002" as the value of _HID, please don't hesit=
ate!
>>>
>>>>New since v2:
>>>>
>>>>	- pc/i386 node in ssdt only on machine types *newer* than 2.4
>>>>	  (as suggested by Eduardo)
>>>>
>>>>I appreciate any further comments and reviews. Hopefully we can make
>>>>this palatable for upstream, modulo the lingering concerns about whet=
her
>>>>"QEMU0002" is ok to use as the value of _HID, which I'll hopefully ge=
t
>>>>sorted out with the kernel crew...
>>>>
>>>>>New since v1:
>>>>>
>>>>>	- expose control register size (suggested by Marc Mar=C3=AD)
>>>>>
>>>>>	- leaving out _UID and _STA fields (thanks Shannon & Igor)
>>>>>
>>>>>	- using "QEMU0002" as the value of _HID (thanks Michael)
>>>>>
>>>>>	- added documentation blurb to docs/specs/fw_cfg.txt
>>>>>	  (mainly to record usage of the "QEMU0002" string with fw_cfg).
>>>>>
>>>>>> This series adds a fw_cfg device node to the SSDT (on pc), or to t=
he
>>>>>> DSDT (on arm).
>>>>>>
>>>>>> 	- Patch 1/3 moves (and renames) the BIOS_CFG_IOPORT (0x510)
>>>>>> 	  define from pc.c to pc.h, so that it could be used from
>>>>>> 	  acpi-build.c in patch 2/3.
>>>>>>=20
>>>>>> 	- Patch 2/3 adds a fw_cfg node to the pc SSDT.
>>>>>>=20
>>>>>> 	- Patch 3/3 adds a fw_cfg node to the arm DSDT.
>>>>>>
>>>>>> I made up some names - "FWCF" for the node name, and "FWCF0001"
>>>>>> for _HID; no idea whether that's appropriate, or how else I should
>>>>>> figure out what to use instead...
>>>>>>
>>>>>> Also, using scope "\\_SB", based on where fw_cfg shows up in the
>>>>>> output of "info qtree". Again, if that's wrong, please point me in
>>>>>> the right direction.
>>>>>>
>>>>>> Re. 3/3 (also mentioned after the commit blurb in the patch itself=
),
>>>>>> I noticed none of the other DSDT entries contain a _STA field, won=
dering
>>>>>> why it would (not) make sense to include that, same as on the PC.

Gabriel L. Somlo (5):
  fw_cfg: expose control register size in fw_cfg.h
  pc: fw_cfg: move ioport base constant to pc.h
  acpi: pc: add fw_cfg device node to ssdt
  acpi: arm: add fw_cfg device node to dsdt
  fw_cfg: document ACPI device node information

 docs/specs/fw_cfg.txt     |  9 +++++++++
 hw/arm/virt-acpi-build.c  | 15 +++++++++++++++
 hw/i386/acpi-build.c      | 29 +++++++++++++++++++++++++++++
 hw/i386/pc.c              |  5 ++---
 hw/nvram/fw_cfg.c         |  4 +++-
 include/hw/i386/pc.h      |  2 ++
 include/hw/nvram/fw_cfg.h |  3 +++
 7 files changed, 63 insertions(+), 4 deletions(-)

--=20
2.4.3

