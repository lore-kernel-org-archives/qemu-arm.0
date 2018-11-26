Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5411180wrt;
        Mon, 26 Nov 2018 03:33:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5csRayoYBnq3Cyiy5+jlgBJ4t9ml7rdw15cdbmvgE0xzQ/f1DUBL+OIPRGMvER3cuTUSKO3
X-Received: by 2002:a81:1b09:: with SMTP id b9-v6mr27789695ywb.248.1543232002342;
        Mon, 26 Nov 2018 03:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232002; cv=none;
        d=google.com; s=arc-20160816;
        b=xPYSD7r++/I+lubIu8Lmb4bXmOR+th08totXj5JFnbn1XKe7LRThAF7cx1ggiivjv4
         NcztYaDXhgNrVw9t5n64ScLyl5Pzg7brIBWr1DWkqacRVtNa2UnjG84JgPpzrvO/WOX7
         WC6fvcDBZQ6OD+SGmGgXiKvFH8kYqNvYb5dE7vyz+/3RyjZ2wX3NmrCq/IIs1gAH8fdi
         yHngbIASkIKoPTlHYXksh753vyWQQtJlTTJ68Ea/5s/ZPaGSgZtrRUBBSfuKODIS8VHn
         d08LvUyvVJ2Bq3tN0o98pTYSLivLRXnfLzeDyyCAy1zNn6PCGTSRAso4vtbhwv6C7qv2
         0WJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ziBkGp8QdzwSLzLsm2rR/2JebrrVkRXnWdk79tzswGU=;
        b=CdHMa1Po/5ha1XgULn3fauiZkdn5HHalWxo7pgrQgOzM3OM7t8JEhDFRJJJ6A/8d/1
         ja77hootW29PtdxMg4+nuUIm9mokFTkuvkwh1gLFaEQHNtio+t6ELET9JW1/CfbosqQ1
         g49vh3QgbEk3LhyvDr+g/Eoi7UCmjiQ17UexqNazEK6CZDF5PaEfn9VOLg+qjKRqzul6
         JG9ZZmpnmQouz8xWv3LY4Pqk1lNZsQGLGzCYq5ZmkIFRdnAHkCUSbQ/Cs9OEw/np0ifk
         Xy5VqyqcKv3TtWxZyANjPIPkzXqEa1pv/WUdohOevrHVO8RkIDP2xWKRicdO5rc7upVp
         TYqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64-v6si26340ybs.233.2018.11.26.03.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF8j-0000DA-M4
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:33:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8X-0000Cm-8A
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8U-0001qW-HQ
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:09 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:20460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8U-0001lR-4Z; Mon, 26 Nov 2018 06:33:06 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 341DF34CFD8B3F4EA918;
	Mon, 26 Nov 2018 19:32:58 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBWo9t031644;
	Mon, 26 Nov 2018 19:32:50 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619325831-13057758 ;
	Mon, 26 Nov 2018 19:32:58 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:55:53 +0800
Message-Id: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:32:58,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:32:50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAQBWo9t031644
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V9 0/9] add pvpanic mmio support
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
X-TUID: wu6UjRDrNivB

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

Peng Hao (7):
  hw/misc/pvpanic: Add the MMIO interface
  hw/arm/virt: Use the pvpanic device
  hw/arm/virt: add pvpanic device in virt acpi table
  hw/misc/pvpanic: add configure query interface
  hw/misc/pvpanic: preparing for adding configure interface
  hw/misc/pvpanic: realize the configure interface
  pvpanic : update pvpanic document

 default-configs/arm-softmmu.mak |  1 +
 docs/specs/pvpanic.txt          | 15 ++++++-
 hw/arm/sysbus-fdt.c             |  2 +
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

