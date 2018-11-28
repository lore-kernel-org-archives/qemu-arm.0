Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp548575wrt;
        Tue, 27 Nov 2018 19:50:46 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V4QGof3mN7b5esU1HLywzUWNwnG0netfMp5emm2pUYm1A6D92RA3S0NEH8lVCaozNHqf2c
X-Received: by 2002:a25:3208:: with SMTP id y8-v6mr32249401yby.249.1543377046250;
        Tue, 27 Nov 2018 19:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377046; cv=none;
        d=google.com; s=arc-20160816;
        b=shQgaXL5njkxeKKPQ7GYI+r1PAVTf4jWLw577z3Lo/hhw/WLdtla4mxnvwrrbf9s+J
         Kek38pmMWukYO/4L/oa1uzcXybaiWV1J+d5cvn2B+ZQJnVq8r6P6kVG8T/789GOVXBKJ
         zOuZOPN3qo7x8MjrqUcZOnaGvFrpLJM1J3dFkpUzw8jM3QLMrFJiUYUCkmp0tQi6dP7O
         wDCRGZgZrWscexWk2juNM9TeB5XFiHx/7eAB9aUG0cLHV2MwCYFMF9rtjfKT1AYh+ikJ
         Vsm5pRKHtZWhFob0EvkDRvCsGuon+Wl2TpZhHOuQ82kOALk0zINkWJ4VhLY4kyIb3dsB
         8X7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=S10tQOQx39mj35y3lUIo4KreglQVk1FUpL/DjL+ZUXc=;
        b=G/klczjz8G/mUGA/70t90zmSoN+xgfCii1c18y8yOimiCwu5te9Sn1UUEHib8AXq0Q
         rWhmu2eUAHWBH4/drcHOPLzZkhr/dTbgQLo6AsrmfDj3BbUp400QKStUbmxPXNtrBvq7
         KVZZeynMGwLxLY5cgRekW9sn+J235qanKIluHN2fmk3NmWPPYZSWH8q6VTB23C+FODcK
         Bmu9i7kThQ6kcrXUejTtupOQUSj3pnViNcQzcAKXVJ8T0LTl5Edc+gbvN9ZQC3Cq4Hvq
         2zOooGheiUKA3X/Igy9ta2wYmS26ghjvRX3Z5L/I61jrOr4Z25MJJaDGWlvaaTRpLjvZ
         Vklg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h190-v6si4029269ybb.265.2018.11.27.19.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:50:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqs9-0002u4-Ix
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:50:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrY-0002YB-1F
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrT-0003Ut-1n
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:07 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:33786 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqrS-0003Kg-Mw; Tue, 27 Nov 2018 22:50:02 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 6CC80E44903B832204EB;
	Wed, 28 Nov 2018 11:49:54 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3nlaa058530;
	Wed, 28 Nov 2018 11:49:47 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811500717-13417591 ;
	Wed, 28 Nov 2018 11:50:07 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:43 +0800
Message-Id: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:07,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:39
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAS3nlaa058530
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V10 0/9] add pvpanic mmio support
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
X-TUID: u1YB8y/8EYN9

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
    =20
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

