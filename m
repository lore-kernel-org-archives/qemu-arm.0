Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6647222wrt;
        Mon, 3 Dec 2018 03:05:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VcTsGpnCyCndGwJSPteOqzjXXf7N6dMZY+BS04Gwc5MNDNznxAMQsvNsrONQInB1Z2cMww
X-Received: by 2002:a81:7d0b:: with SMTP id y11mr14391092ywc.442.1543835112363;
        Mon, 03 Dec 2018 03:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835112; cv=none;
        d=google.com; s=arc-20160816;
        b=ifLg0HOXmZ7Jjklg1h6xeJUGAH41fFdXPMYjWE4NLsh08zwdk+CEbbhWGj14jscG2m
         xE86XD32gYKiSfZe3JxX2KxrxOFlRe+verGAhgaJAfQW1GNbE1J0Xqvhymj+zeQhXYmj
         tXjeE6ppEHYBOzB42Gi/i82gawXOz4AftBDCesolDojByiMT9JuFjK+HxxqC4vyhtiUd
         lhQlHgiUXnY/MgOJjisXaS5Ov9mXnBIRpN4GZ2YJsC4L8Mgtfp49TO3Lu55RLoF8fo5U
         l8BzZPIqAoyWktfNFxt+uEOwv5qobTIUiOKQl43JJnXDZKjMmFQiqkeVFVsFjyj0z3Yw
         2o5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=bVUHjpoKS7WUnNZ0aulNlwR0QUgeUfyHIz0yRl0c9GQ=;
        b=T5qO9/1a771kpuHKgl5Om7Uu2RG5PgAJWrc3VtSQE9Edo4D7gTMT78+Eyxcs6vhnol
         RXLkEz9tivduJiwVWdReYX5sVVY8257Q5yhVCLGsrvDfI5vcCLO4U3uFZTbtAEaHXXrO
         Bbh+mGxmYOIyPjwP2e5/gnnnkZyNrTaQhp3kF+82bAzICq6PXgPDWlov/XaIxyNpcI9+
         hMlHSq33/9dqOLGrzyV7qYGz8/FrZ+ULwvy5UvwTfatYDpXVInX0ex2M3TTHEvDybV1X
         u2n4L99eSiSvuupeome77ehTfFsKwoAYLVV8CWRywxKabqri3L9OqgTklKeUBgW5OGNr
         R3Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s4si7985147ywf.128.2018.12.03.03.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTm2J-0004T7-OA
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:05:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1f-00045W-A8
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1a-0002Xz-8T
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:31 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:20214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTm1Z-0002Qk-Sc; Mon, 03 Dec 2018 06:04:26 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id D9B4F356A35C5E0B03E4;
	Mon,  3 Dec 2018 19:04:16 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB3B44Wb097813;
	Mon, 3 Dec 2018 19:04:04 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120319041188-14451285 ;
	Mon, 3 Dec 2018 19:04:11 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 4 Dec 2018 03:26:41 +0800
Message-Id: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-03 19:04:12,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-03 19:04:04
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wB3B44Wb097813
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LSEU3ZruKrX6

The first patches are simple cleanups:
     - patch 1 move the pvpanic device with the 'ocmmon objects' so we comp=
ile
               it once for the x86/arm/aarch64 archs,
     - patch 2 simply renames ISA fields/definitions to generic ones.

     Then instead of add/use the MMIO pvpanic device in the virt machine in=
 an
     unique patch, I split it in two distinct patches:
     - patch 3 uses Peng Hao's work, but add the MMIO interface to the exis=
ting
        device (no logical change).
     - patch 4 is Peng Hao's work in the virt machine (no logical change).
     - patch 5 add pvpanic device in acpi table in virt machine
     v2 from Peng Hao is:
     https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.html

v3 --> v4
     patch 1,2 no modification.
     patch 3, add TYPE=5FPANIC=5FMMIO for distinguishing different bus devi=
ce,
              virt + isa=5Fpvpanic will abnormally terminate virtual machin=
e.
     patch 4, "pvpanic,mmio" --> "qemu,pvpanic-mmio".
     patch 5, newly added.

v4 --> v5
     patch 1,2 no modification.
     patch 3 delete PvpanicCommonState structure.
     patch 4 VIRT=5FPVPANIC=5FMMIO --> VIRT=5FPVPANIC
             correct VIRT=5FPVPANIC's overlap start address
     patch 5 no modification.

v5 --> v6
     add document.

v6 --> v7
     patch 5 modify device name from "PANC" to "PEVT".
     patch 6 modify document description.

v7 --> v8
     add configure interface for pvpanic-mmio

v8 --> v9
     revert "moving structure definition to header file"
     because of compile error in x86.

v9 --> v10
     Modify document.
     Repair missing header files.

v10 --> v11
     change configure interface in virt machine configure parameters.

the kernel part of the series:
     https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/l=
og/?h=3Dchar-misc-testing
     misc/pvpanic: remove a redundant comma
     misc/pvpanic: convert to SPDX license tags
     misc/pvpanic: change header file sort style
     misc/pvpanic: remove unnecessary header file
     misc/pvpanic : break dependency on ACPI
     misc/pvpanic : grouping ACPI related stuff
     misc/pvpanic: add support to get pvpanic device info FDT
     dt-bindings: misc/pvpanic: add document for pvpanic-mmio
     misc/pvpanic: add MMIO support
     misc/pvpanic: simplify the code using acpi=5Fdev=5Fresource=5Fio
     pvpanic: move pvpanic to misc as common driver =20

Philippe Mathieu-Daud=C3=A9 (2):
  hw/misc/pvpanic: Build the pvpanic device in $(common-obj)
  hw/misc/pvpanic: Cosmetic renaming

Peng Hao (6):
  hw/misc/pvpanic: Add the MMIO interface
  hw/arm/virt: Use the pvpanic device
  hw/arm/virt: add pvpanic device in virt acpi table
  hw/misc/pvpanic: add configure interface for pvpanic-mmio
  hw/misc/pvpanic: realize the configure interface
  pvpanic : update pvpanic document

 default-configs/arm-softmmu.mak |  1 +
 docs/specs/pvpanic.txt          | 15 ++++++-
 hw/arm/virt-acpi-build.c        | 17 ++++++++
 hw/arm/virt.c                   | 23 ++++++++++-
 hw/misc/Makefile.objs           |  2 +-
 hw/misc/pvpanic.c               | 87 +++++++++++++++++++++++++++++++++----=
----
 include/hw/arm/virt.h           |  1 +
 include/hw/misc/pvpanic.h       |  6 +++
 9 files changed, 134 insertions(+), 20 deletions(-)

--=20
1.8.3.1

