Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2663329wrw;
        Sun, 11 Nov 2018 19:24:17 -0800 (PST)
X-Google-Smtp-Source: AJdET5eSPBOFwe9GompmQek8L1zQetzK9ekcE4NMMPLGnsx2UqQbYHD0GqTdgofNdbU5wn121xij
X-Received: by 2002:aed:31a3:: with SMTP id 32mr17921384qth.234.1541993057704;
        Sun, 11 Nov 2018 19:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541993057; cv=none;
        d=google.com; s=arc-20160816;
        b=rxlNio+oHLzqcTWc6ZuZsMKFwkDsOuLb8U9AUFtJ6EyiZEj2iHJcqylztmIAdMYeT6
         nioJEtn38hGWIT8v7F1Yi198V2Q8vlYm8eEpYXEwlVIDj+5a4mkF/QL7laztS7f2fgt9
         /X1jkPbHchEC5avepBpQwATa3lPi0Exj4/8QUc3+bQdb07Oiq2hIOPVsWbx71oXePGKI
         nAekbEd3Q9ADrEnyPqFDEKH631JMO42xDk6mnu9ssijsozrNN6/YoAuLfALxz3qmEkRM
         lweOWQ7fFdZRx4tqt/etM3Eo2w7YisuBNGS/lmK+i0QV+82Dow9JUE+ASV3lDL0LXUZ/
         DIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=hfZGPB6jzXIkYuNdrO40/56RCpaCUKXaAm4i5qRBTXE=;
        b=Xk8uurjbA1mH/gZKIB4zBD0akYstr5o9FYwefvutkWIgjk6X1uIfv6GBv59XmIEKPN
         TpF8RXsYGQTU4NC/dttM852PMUqYN4vmKfuWATbmIX7UngAEgwOE8iahm4ceYNu67Hod
         Ru4mU0dvpPRm2nM+sk9QwNHzVQ0oep0ubRWRmbZu7Q6HwvWCN1GhPNI9bq4Bg8Zjhb3R
         1WE/d1BZr3XA6pxLYXv/o3DFnwLyi2YSHeHms2NgTThYNiENz0qw3Y5Ro9bzWh6jtnm1
         WJsvm1Z/KiA2opVd2leRW+idhxIw8/xC0Ka4jXTSu0aCaQ2lZ6fxnB/joGW9mSA07xX6
         IaHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a18si6157378qtd.222.2018.11.11.19.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 19:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM2pk-0004H7-V8
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 22:24:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2nS-0002uF-Jl
	for qemu-devel@nongnu.org; Sun, 11 Nov 2018 22:21:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2nR-0006K2-Fm
	for qemu-devel@nongnu.org; Sun, 11 Nov 2018 22:21:54 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:33600 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gM2nM-0005bB-FH; Sun, 11 Nov 2018 22:21:48 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id D9599BD693E37A5E28C3;
	Mon, 12 Nov 2018 11:19:53 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAC3Ji3e084764;
	Mon, 12 Nov 2018 11:19:44 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111211194827-10076066 ;
	Mon, 12 Nov 2018 11:19:48 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Mon, 12 Nov 2018 19:42:14 +0800
Message-Id: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-12 11:19:48,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-12 11:19:44
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAC3Ji3e084764
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH V6 0/5]  add pvpanic mmio support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3BCiZlo3h8/j

The first patches are simple cleanups:
- patch 1 move the pvpanic device with the 'ocmmon objects' so we compile
  it once for the x86/arm/aarch64 archs,
- patch 2 simply renames ISA fields/definitions to generic ones.

Then instead of add/use the MMIO pvpanic device in the virt machine in an
unique patch, I split it in two distinct patches:
- patch 3 uses Peng Hao's work, but add the MMIO interface to the existing
  device (no logical change).
- patch 4 is Peng Hao's work in the virt machine (no logical change).
- patch 5 add pvpanic device in acpi table in virt machine
v2 from Peng Hao is:
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.html

v3 --> v4
  patch 1,2 no modification.
  patch 3, add TYPE=5FPANIC=5FMMIO for distinguishing different bus device,
           virt + isa=5Fpvpanic will abnormally terminate virtual machine. =

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

the kernel part of the series:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/log/?h=
=3Dchar-misc-testing
misc/pvpanic: remove a redundant comma=20
misc/pvpanic: convert to SPDX license tags=20
misc/pvpanic: change header file sort style=20
misc/pvpanic: remove unnecessary header file =20
misc/pvpanic : break dependency on ACPI=20
misc/pvpanic : grouping ACPI related stuff =20
misc/pvpanic: add support to get pvpanic device info FDT =20
dt-bindings: misc/pvpanic: add document for pvpanic-mmio =20
misc/pvpanic: add MMIO support =20
misc/pvpanic: simplify the code using acpi=5Fdev=5Fresource=5Fio =20
pvpanic: move pvpanic to misc as common driver=20

Philippe Mathieu-Daud=C3=A9 (2):
  hw/misc/pvpanic: Build the pvpanic device in $(common-obj)
  hw/misc/pvpanic: Cosmetic renaming

Peng Hao (3):
  hw/misc/pvpanic: Add the MMIO interface
  hw/arm/virt: Use the pvpanic device
  hw/arm/virt: add pvpanic device in virt acpi table
  pvpanic : update pvpanic document

 default-configs/aarch64-softmmu.mak |  1 +
 hw/arm/virt-acpi-build.c            | 16 ++++++++
 hw/arm/virt.c                       | 21 ++++++++++
 hw/misc/Makefile.objs               |  2 +-
 hw/misc/pvpanic.c                   | 78 ++++++++++++++++++++++++++++++---=
----
 include/hw/arm/virt.h               |  1 +
 include/hw/misc/pvpanic.h           |  2 +
 docs/specs/pvpanic.txt              | 13 ++++++++++++-
 8 files changed, 118 insertions(+), 17 deletions(-)

--=20
1.8.3.1

