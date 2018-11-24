Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3065914wrt;
        Sat, 24 Nov 2018 00:44:26 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UG3rz7tpBWLY4t6600sWvNKwHeYqUozjCxUBrnWZZfm/yjMetOYkAkHzafyCQkHHjXm18i
X-Received: by 2002:a81:b542:: with SMTP id c2mr15443084ywk.268.1543049066161;
        Sat, 24 Nov 2018 00:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543049066; cv=none;
        d=google.com; s=arc-20160816;
        b=YAc4PtKkmpcD7BvmpFOXYycicQ1XTnDRMqI+z8VFkKMiKrqy5Rm2NFd8jBLVlUvJ7e
         R507QIlHXipcBByg1n0IkPkh0pMge/aujTUm03f3yKh8J36i/WyVenJg+gmBSChs+kWc
         6bKbKHZcAIXE4GUCVqEY+m5EHkhW3kb+DARNSWDzrploJcHFloUoMkzASoDb1fLJp2/3
         VwftkzdqMhB/N31wRu0jPsCYqAhpkWhdqVmHfBsl9RilE6SgFALE0cIqexzi4VsoLR7X
         t9CWTKUO3ln6MllFwWRbPIcsPIQ9FU/F2ijHjV4g6Ea7xGso+ba4YLk0St0wrGK/xj5y
         8Hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=aP8JOofeiEmRunqrlMVXUN1dE1eVM0EPpj2yKM3NDMg=;
        b=d8qAkQQCrsIY6UlukFbpDX4ObUhkDy3XAftQupVFfnFfwFxcHbypp+OPLFUgd79MsB
         QitepegpTA1emupupXAOTEHAQ9vkI961ElsiMHoNWpDtoOir7MKtMxDkyZG6ZHk8/s46
         rPF/1amudxI1QHvqqc9yl2QfbziersvIC+KyibebqcDBbwKgsJEB8bK2A5/5DBc1Wh+Q
         1L0DKjSfomw0JjpjLul6Wv0cUeGMer5Y2blFRHNdF0IFWmwbieA5K/A4eXMZzOyPDxAM
         pjEO5c90EMtuArNELpjvoGIgYSB2s7tdXmTq2gItMgXyrDFlaZikofwn7zCnjwdJUMYC
         joog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i14si16543894ywg.15.2018.11.24.00.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTY9-0005vF-HD
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:44:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUJ-0002oQ-SK
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSW-000084-5F
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:38:41 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:55402 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSV-0008Vu-RA; Sat, 24 Nov 2018 03:38:36 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 6B4F16FFE5062498993F;
	Sat, 24 Nov 2018 16:38:33 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cRq9035000;
	Sat, 24 Nov 2018 16:38:27 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391384-12702397 ;
	Sat, 24 Nov 2018 16:39:13 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:11 +0800
Message-Id: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:14,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAO8cRq9035000
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V8 00/10] add pvpanic mmio support
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
X-TUID: GNJ5yFKMsZaV

The first patches are simple cleanups:
     - patch 1 move the pvpanic device with the 'ocmmon objects' so we comp=
ile
               it once for the x86/arm/aarch64 archs,
     - patch 2 simply renames ISA fields/definitions to generic ones.
    =20
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
   =20
v5 --> v6
     add document.
 =20
v6 --> v7
     patch 5 modify device name from "PANC" to "PEVT".
     patch 6 modify document description.

v7 --> v8
     add configure interface for pvpanic-mmio

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
     pvpanic: move pvpanic to misc as common driver

Philippe Mathieu-Daud=C3=A9 (2):
  hw/misc/pvpanic: Build the pvpanic device in $(common-obj)
  hw/misc/pvpanic: Cosmetic renaming

Peng Hao (8):
  hw/misc/pvpanic: Add the MMIO interface
  hw/misc/pvpanic: moving structure definition to header file
  hw/arm/virt: Use the pvpanic device
  hw/arm/virt: add pvpanic device in virt acpi table
  hw/misc/pvpanic: add configure query interface
  hw/misc/pvpanic: preparing for adding configure interface
  hw/misc/pvpanic: realize the configure interface
  pvpanic : update pvpanic document
 =20
 default-configs/arm-softmmu.mak |  1 +
 docs/specs/pvpanic.txt          | 18 +++++++++--
 hw/arm/sysbus-fdt.c             |  2 ++
 hw/arm/virt-acpi-build.c        | 18 +++++++++++
 hw/arm/virt.c                   | 22 +++++++++++++
 hw/misc/Makefile.objs           |  2 +-
 hw/misc/pvpanic.c               | 68 ++++++++++++++++++++++++++++---------=
----
 include/hw/arm/virt.h           |  1 +
 include/hw/misc/pvpanic.h       | 34 +++++++++++++++++++++
 9 files changed, 140 insertions(+), 26 deletions(-)

--=20
1.8.3.1

