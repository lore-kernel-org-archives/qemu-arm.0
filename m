Received: by 10.25.159.19 with SMTP id i19csp470446lfe;
        Thu, 11 Feb 2016 14:06:24 -0800 (PST)
X-Received: by 10.140.141.69 with SMTP id 66mr63397583qhn.68.1455228379596;
        Thu, 11 Feb 2016 14:06:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t203si11776945qhc.129.2016.02.11.14.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 14:06:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTzNT-0002HR-2P
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 17:06:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTzNQ-0002Es-4d
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 17:06:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTzNM-0006sf-44
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 17:06:16 -0500
Received: from relay-06.andrew.cmu.edu ([128.2.157.21]:44126
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aTzNL-0006sR-Uq; Thu, 11 Feb 2016 17:06:12 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1BM6633030587;
	Thu, 11 Feb 2016 17:06:06 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 17:06:00 -0500
Message-Id: <1455228365-13666-1-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.21
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1BM6633030587
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.21
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-arm] [PATCH v8 0/5] add ACPI node for fw_cfg on pc and arm
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
X-TUID: K9Hv/xc+2Wz3

Generate an ACPI DSDT node for fw_cfg on pc and arm guests.

New since v7:

	- edited commit blurb on 3/5 to match updated content, i.e. that
	  the ACPI node is now inserted into the DSDT (no longer the SSDT).
	  (Thanks to Igor Mammedov for catching that!)

Thanks,
  --Gabriel

>New since v6:
>	- rebased to fit on top of fb306ff and f264d36, which moved things
>	  around in pc's acpi-build.c (only patch 3/5 affected);
>	- kernel-side fw_cfg sysfs driver accepted into upstream linux
>
>>New since v5:
>>
>>	- rebased on top of latest QEMU git master
>>
>>>New since v4:
>>>
>>>	- rebased on top of Marc's DMA series
>>>	- drop machine compat dependency for insertion into x86/ssdt
>>>	  (patch 3/5), following agreement between Igor and Eduardo
>>>	- [mm]io register range now covers DMA register as well, if
>>>	  available.
>>>	- s/bios/firmware in doc file updates
>>>
>>>>New since v3:
>>>>
>>>>	- rebased to work on top of 87e896ab (introducing pc-*-25 classes),
>>>>	  inserting fw_cfg acpi node only for machines >=3D 2.5.
>>>>
>>>>	- reintroduce _STA with value 0x0B (bit 2 for u/i visibility turned
>>>>	  off to avoid Windows complaining -- thanks Igor for catching that!=
)
>>>>
>>>>If there's any other feedback besides questions regarding the
>>>>appropriateness of "QEMU0002" as the value of _HID, please don't hesi=
tate!
>>>>
>>>>>New since v2:
>>>>>
>>>>>	- pc/i386 node in ssdt only on machine types *newer* than 2.4
>>>>>	  (as suggested by Eduardo)
>>>>>
>>>>>I appreciate any further comments and reviews. Hopefully we can make
>>>>>this palatable for upstream, modulo the lingering concerns about whe=
ther
>>>>>"QEMU0002" is ok to use as the value of _HID, which I'll hopefully g=
et
>>>>>sorted out with the kernel crew...
>>>>>
>>>>>>New since v1:
>>>>>>
>>>>>>	- expose control register size (suggested by Marc Mar=C3=AD)
>>>>>>
>>>>>>	- leaving out _UID and _STA fields (thanks Shannon & Igor)
>>>>>>
>>>>>>	- using "QEMU0002" as the value of _HID (thanks Michael)
>>>>>>
>>>>>>	- added documentation blurb to docs/specs/fw_cfg.txt
>>>>>>	  (mainly to record usage of the "QEMU0002" string with fw_cfg).
>>>>>>
>>>>>>> This series adds a fw_cfg device node to the SSDT (on pc), or to =
the
>>>>>>> DSDT (on arm).
>>>>>>>
>>>>>>> 	- Patch 1/3 moves (and renames) the BIOS_CFG_IOPORT (0x510)
>>>>>>> 	  define from pc.c to pc.h, so that it could be used from
>>>>>>> 	  acpi-build.c in patch 2/3.
>>>>>>>=20
>>>>>>> 	- Patch 2/3 adds a fw_cfg node to the pc SSDT.
>>>>>>>=20
>>>>>>> 	- Patch 3/3 adds a fw_cfg node to the arm DSDT.
>>>>>>>
>>>>>>> I made up some names - "FWCF" for the node name, and "FWCF0001"
>>>>>>> for _HID; no idea whether that's appropriate, or how else I shoul=
d
>>>>>>> figure out what to use instead...
>>>>>>>
>>>>>>> Also, using scope "\\_SB", based on where fw_cfg shows up in the
>>>>>>> output of "info qtree". Again, if that's wrong, please point me i=
n
>>>>>>> the right direction.
>>>>>>>
>>>>>>> Re. 3/3 (also mentioned after the commit blurb in the patch itsel=
f),
>>>>>>> I noticed none of the other DSDT entries contain a _STA field, wo=
ndering
>>>>>>> why it would (not) make sense to include that, same as on the PC.

Gabriel L. Somlo (5):
  fw_cfg: expose control register size in fw_cfg.h
  pc: fw_cfg: move ioport base constant to pc.h
  acpi: pc: add fw_cfg device node to dsdt
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

