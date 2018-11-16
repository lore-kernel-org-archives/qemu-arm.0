Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7766434wrw;
        Thu, 15 Nov 2018 18:28:13 -0800 (PST)
X-Google-Smtp-Source: AJdET5dVu+BAY0hZCPqbP15gUaCZRTbhKdFP6vaAz51r7s4+XTNuztQWfzhaMoGtwq8e4z1bis/Y
X-Received: by 2002:a37:7d05:: with SMTP id y5mr8066168qkc.310.1542335293416;
        Thu, 15 Nov 2018 18:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542335293; cv=none;
        d=google.com; s=arc-20160816;
        b=BzakgFeuJ19lHZrLMtCrvUd4HvhCHm/I00Vhvp6JoHSSunCIKzgVdnYUjVJvGFzYoA
         WU1bKrj0d4pI1b6XuCgFMlWHtHDNoU79M8E7s9tI/5nEIlFTZdrgxB2tsgs25Udz2hR+
         wAQnHFM4bUBt4ZrvsFB1UyMcFh0C3a2qDtKtxi9lnOSEVn3d6moikrblcI+88ricELjG
         4fm7kquIAgYXl0jhd3g3LYmjnjliu+ALvyXFAgOLXy9aQvHN9+1p38aaC/35obVHxWWl
         Mq0CaxTXoUg5AB199n4QeLFLl5YdCX388hGNxp7ch8C8WJ8dv5NyqgAXcNCY12iLjLFd
         LZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=4wdsh89OLwmoorLw+ZJOLwsbNylad8xYFvlaMPxI4B8=;
        b=Th85SFK622Hubg5Cph5mCIAd1dvr6CUqNWhAVlBvNS6abGUtGOGA3FhXeS0t98/nLS
         +vf85AKWziRp1G7R58CjQBT/TVjoO8dpUIZ0OBHHF75t4YPOVCAaBhalLYGHY7X16qjo
         RlwC5CkjHi9ZgnGGGKiBnI6MwxgXXvhc1RGDhnv7JA7encBo76uEXMVQ9M9OV+svg57l
         GNcHFSrq/H88zhGquu/vKgjTa2J6FbCrV4NF6qaMEHnU/hqMXOuVpLySXuGaJnMAmjJn
         q1ZZdQv+hbAiv6ple/D9hw2KuyRsbUeGV0jgz9w27E+BqwrxJqwe9he2K6Tcq9E/QVtN
         1ayw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si7995414qvp.28.2018.11.15.18.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 18:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNTrg-00037C-T0
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 21:28:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTrS-00036f-5z
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:28:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTrN-0007Wl-0C
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:27:58 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:16720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNTrM-0007OD-Lj; Thu, 15 Nov 2018 21:27:52 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 3C7D284F80ED1F3E2EB7;
	Fri, 16 Nov 2018 10:27:48 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAG2Rgih028482;
	Fri, 16 Nov 2018 10:27:42 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111610281800-11036236 ;
	Fri, 16 Nov 2018 10:28:18 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Fri, 16 Nov 2018 18:50:00 +0800
Message-Id: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-16 10:28:18,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-16 10:27:26
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAG2Rgih028482
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V7 0/5]  add pvpanic mmio support
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
X-TUID: w+R8JDsE2Wgm

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

v6 --> v7
  patch 5 modify device name from "PANC" to "PEVT".
  patch 6 modify document description.
 =20
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

