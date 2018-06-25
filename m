Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3765215wrq;
        Mon, 25 Jun 2018 05:43:18 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKImJh9v4o/mOM9ngopOcEm+OrfvO1C8XQ843al96AIsKUxDYO5JsFEbH/qE/FCACjETHK2S
X-Received: by 2002:aed:3e6f:: with SMTP id m44-v6mr10959016qtf.4.1529930598859;
        Mon, 25 Jun 2018 05:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529930598; cv=none;
        d=google.com; s=arc-20160816;
        b=OeRcuZXRWyPp3EWzleuZTkQeipBr2htW0hv7K6Uh/odTSmOHb4g8cxyyOY64OXM+qg
         bWN1qsT704K9hqo+4p5dcm40e/35h13FVEAOZCIhEnihUF/3BWFvNlmu+d0MTd4j+GfN
         ZLV9Snq/ZPWHPTCnFtnKAN3JDhwUmxm2BWPcDq+/xkFBsx65gw2M9/DwXmpc0j/WA5dl
         KvXz6kn0IKqM2obFGnBmZIiCmtFVh+uxMIbcm0YvaxD1ev1CP0ZUMV7BCrYp8Qm/K4Ks
         u1o0KQUjstL+deVA+5aAUkhQ9LP/w+pPt3EQ1bvOrJdyHYhEm7GT4uOH5DhUOreZDzwI
         uVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=eziCuLFZrh43/1Hb1WMAJVzkJ4QguEHZVdI85rIEBxA=;
        b=dzkxk/7aQ09Pvis25c7JZp6daPnD60YMWhpjWxjGSIwId6mJUmcQsqeFkDdFTg2Ypf
         eM7fRYj76Nh1k8ZbXAewdsYeuA8VTO9NYYPTb4Ji+XtZ9hUsO7cLXZxvVgBGyv3d+yX7
         jxx4Mxj3wd2HtAacmY/FZliFHb81i6iWc5cJXFnN2xsCC5Vne2EPmj6Tl3mRxokwKhWx
         POLxLoP2m3BRKmsM2Hguu4sD5A4eebkoo58pgE6WSUQhLm86GIui9IMYX0oAM5OJc1Iq
         NKa1FJh0aiDuTgNbykWbrcXOMfebdayMYys+zTl8VfQG9xF+D1gIGDoNZigw+GLQnpqj
         +oYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ah1OWeH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b187-v6si199052qke.333.2018.06.25.05.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 05:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ah1OWeH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXQpy-0000s9-7w
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 08:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpm-0000r8-1Z
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 08:43:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpi-0007Ol-S5
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 08:43:06 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpi-0007NY-KQ; Mon, 25 Jun 2018 08:43:02 -0400
Received: by mail-qk0-x241.google.com with SMTP id y4-v6so7364150qka.5;
	Mon, 25 Jun 2018 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eziCuLFZrh43/1Hb1WMAJVzkJ4QguEHZVdI85rIEBxA=;
	b=ah1OWeH7konNPwfb74EDa3rT2WeCedq/dvDvjccUL4BXeUBqRYYcKnvbaJQsI0UU9t
	Zwn8bqzxyNPKOWmWWjKzVbJmsODxpmvifkyX561048gA31xCEPlIRI7tJmQ2TP2gCtL2
	mJuFZlbF3anhkBSacpi+t3HcLVjgcgom5fpJSFa3CLtJQTs1iJT7N2z9Vdib0VfZPbKE
	XAwhksDPcUBxqeqHfW/WxJXbuh2TnpDdb41vU5CImdBEm2yz8mmFC3W9p1RFE0VpUlPo
	SYgTQkhn0jOgfWM60vMDL/cK3GDbokdsIYKsP1DbKZeRgESCdcfMAHqJNYZpAFa9msXr
	Orig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=eziCuLFZrh43/1Hb1WMAJVzkJ4QguEHZVdI85rIEBxA=;
	b=qtDp/dcrRT2c/k7vxqSmGIqTisRlbbf3ehuzg/pS1vpL5x/w9Qv1Y4/2NdWyZt0JxX
	ZsBQWDbWrNfKkKvJQQGMykW4NuBWEO4mz0VI7Y6pjOa1Ivzc2gKFYQx3EypUuwfGxkGJ
	q2xadPjOMlmh6VsRO4SEuZ7NwQPPuGJRV7irbg/kcBC7B6cCTngLEddJZVrlr6q74OOt
	xSqz6muqulsjdmI8WbTDdfmY9tS4Bwrzb85npr3t6ldr84Big+cK8g50uzcIbZFDWsSe
	F36s7/JOmLwwI8ae0N0iJtk6BjWVaqFqddn4mddtUx8uc8WznofVqCvxPDNenJBA2sNO
	nXkQ==
X-Gm-Message-State: APt69E0krOVuy0bJRMk6V2q56HbMm9bGKDm2SUjFX0WV0qOO+qzI7Itt
	cIjeF0usN12hjWzXJl3QbhI=
X-Received: by 2002:a37:85c5:: with SMTP id
	h188-v6mr10748675qkd.40.1529930581569; 
	Mon, 25 Jun 2018 05:43:01 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.42.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Mon, 25 Jun 2018 09:41:52 -0300
Message-Id: <20180625124238.25339-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v5 00/46] Use the IEC binary prefix definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>, Jiri Slaby <jslaby@suse.cz>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xW7NfZ8QMuRh

Hi,

This series:

- split the byte-based definitions from "qemu/cutils.h" to "qemu/units.h"
  (this now triggers WARNING: 1 added file, does MAINTAINERS need updating?)
- clean hw/ includes;
- replace different constants used for byte size with their corresponding
  IEC binary prefix definitions.

Since v4:
- fixed checkpatch (do not match the IEC binary prefix as camelcase typedefs)
- use signed format for size (Richard)
- fix 32-bit (Thomas)
- update '[<>][<>]= ?[1-5]0', adding 5 new patches (Eric)

Since v3:
- use IEC binary prefix definitions (Stefan Weil)
- rebased
- added R-b tags

Since v2:
- use "qemu/units.h" instead of "qemu/cunits.h" (Daniel P. Berrangé)
- avoid rebuilding the world including "qemu/units.h" in "hw/hw.h" (Thomas Huth)
- more constant replaced

Since v1:
- corrected Xen mult -> div (Alan Robinson)
- tagged 'include "qemu/cunits.h" in "hw/hw.h" as RFC
- fixed mips_r4k 'params_size' (Thomas Huth)
- added command used to generate patch in each commit (Alistair Francis)
- use G_BYTE for the raspi3 machine
- added Reviewed-by tags

Regards,

Phil.

[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/46:[0012] [FC] 'include: Add IEC binary prefixes in "qemu/units.h"'
002/46:[0005] [FC] 'vdi: Use definitions from "qemu/units.h"'
003/46:[----] [--] 'x86/cpu: Use definitions from "qemu/units.h"'
004/46:[0002] [FC] 'checkpatch: Recognize IEC binary prefix definitions'
005/46:[----] [-C] 'hw: Use IEC binary prefix definitions from "qemu/units.h"'
006/46:[----] [--] 'hw: Directly use "qemu/units.h" instead of "qemu/cutils.h"'
007/46:[----] [--] 'hw/ivshmem: Use the IEC binary prefix definitions'
008/46:[----] [--] 'hw/ipack: Use the IEC binary prefix definitions'
009/46:[----] [--] 'hw/scsi: Use the IEC binary prefix definitions'
010/46:[----] [--] 'hw/smbios: Use the IEC binary prefix definitions'
011/46:[0002] [FC] 'hw/xen: Use the IEC binary prefix definitions'
012/46:[----] [--] 'hw/tpm: Use the IEC binary prefix definitions'
013/46:[----] [--] 'hw/block: Use the IEC binary prefix definitions'
014/46:[0008] [FC] 'hw/display: Use the IEC binary prefix definitions'
015/46:[----] [--] 'hw/misc: Use the IEC binary prefix definitions'
016/46:[----] [--] 'hw/riscv: Use the IEC binary prefix definitions'
017/46:[----] [--] 'hw/m68k: Use the IEC binary prefix definitions'
018/46:[0006] [FC] 'hw/sparc: Use the IEC binary prefix definitions'
019/46:[0003] [FC] 'hw/s390x: Use the IEC binary prefix definitions'
020/46:[0004] [FC] 'hw/hppa: Use the IEC binary prefix definitions'
021/46:[0009] [FC] 'hw/xtensa: Use the IEC binary prefix definitions'
022/46:[----] [--] 'hw/alpha: Use the IEC binary prefix definitions'
023/46:[----] [--] 'hw/tricore: Use the IEC binary prefix definitions'
024/46:[----] [--] 'hw/microblaze: Use the IEC binary prefix definitions'
025/46:[----] [--] 'hw/nios2: Use the IEC binary prefix definitions'
026/46:[----] [--] 'hw/cris: Use the IEC binary prefix definitions'
027/46:[----] [--] 'hw/lm32: Use the IEC binary prefix definitions'
028/46:[----] [--] 'hw/sh4: Use the IEC binary prefix definitions'
029/46:[----] [--] 'hw/mips/r4k: Constify params_size'
030/46:[0012] [FC] 'hw/mips: Use the IEC binary prefix definitions'
031/46:[----] [--] 'hw/arm: Use the IEC binary prefix definitions'
032/46:[0022] [FC] 'hw/ppc: Use the IEC binary prefix definitions'
033/46:[0006] [FC] 'hw/i386: Use the IEC binary prefix definitions'
034/46:[----] [--] 'hw/net: Use the IEC binary prefix definitions'
035/46:[0002] [FC] 'hw/usb: Use the IEC binary prefix definitions'
036/46:[0002] [FC] 'hw/sd: Use the IEC binary prefix definitions'
037/46:[----] [--] 'hw/vfio: Use the IEC binary prefix definitions'
038/46:[----] [--] 'hw/virtio: Use the IEC binary prefix definitions'
039/46:[----] [--] 'hw/rdma: Use the IEC binary prefix definitions'
040/46:[----] [--] 'cutils: Do not include "qemu/units.h" directly'
041/46:[0148] [FC] 'hw/ppc: Use the IEC binary prefix definitions'
042/46:[down] 'monitor: Use the IEC binary prefix definitions'
043/46:[down] 'vl: Use the IEC binary prefix definitions'
044/46:[down] 'tests/crypto: Use the IEC binary prefix definitions'
045/46:[down] 'linux-user: Use the IEC binary prefix definitions'
046/46:[down] 'bsd-user: Use the IEC binary prefix definitions'

Philippe Mathieu-Daudé (46):
  include: Add IEC binary prefixes in "qemu/units.h"
  vdi: Use definitions from "qemu/units.h"
  x86/cpu: Use definitions from "qemu/units.h"
  checkpatch: Recognize IEC binary prefix definitions
  hw: Use IEC binary prefix definitions from "qemu/units.h"
  hw: Directly use "qemu/units.h" instead of "qemu/cutils.h"
  hw/ivshmem: Use the IEC binary prefix definitions
  hw/ipack: Use the IEC binary prefix definitions
  hw/scsi: Use the IEC binary prefix definitions
  hw/smbios: Use the IEC binary prefix definitions
  hw/xen: Use the IEC binary prefix definitions
  hw/tpm: Use the IEC binary prefix definitions
  hw/block: Use the IEC binary prefix definitions
  hw/display: Use the IEC binary prefix definitions
  hw/misc: Use the IEC binary prefix definitions
  hw/riscv: Use the IEC binary prefix definitions
  hw/m68k: Use the IEC binary prefix definitions
  hw/sparc: Use the IEC binary prefix definitions
  hw/s390x: Use the IEC binary prefix definitions
  hw/hppa: Use the IEC binary prefix definitions
  hw/xtensa: Use the IEC binary prefix definitions
  hw/alpha: Use the IEC binary prefix definitions
  hw/tricore: Use the IEC binary prefix definitions
  hw/microblaze: Use the IEC binary prefix definitions
  hw/nios2: Use the IEC binary prefix definitions
  hw/cris: Use the IEC binary prefix definitions
  hw/lm32: Use the IEC binary prefix definitions
  hw/sh4: Use the IEC binary prefix definitions
  hw/mips/r4k: Constify params_size
  hw/mips: Use the IEC binary prefix definitions
  hw/arm: Use the IEC binary prefix definitions
  hw/ppc: Use the IEC binary prefix definitions
  hw/i386: Use the IEC binary prefix definitions
  hw/net: Use the IEC binary prefix definitions
  hw/usb: Use the IEC binary prefix definitions
  hw/sd: Use the IEC binary prefix definitions
  hw/vfio: Use the IEC binary prefix definitions
  hw/virtio: Use the IEC binary prefix definitions
  hw/rdma: Use the IEC binary prefix definitions
  cutils: Do not include "qemu/units.h" directly
  hw/ppc: Use the IEC binary prefix definitions
  monitor: Use the IEC binary prefix definitions
  vl: Use the IEC binary prefix definitions
  tests/crypto: Use the IEC binary prefix definitions
  linux-user: Use the IEC binary prefix definitions
  bsd-user: Use the IEC binary prefix definitions

 hw/net/ne2000.h                          |  5 ++--
 hw/ppc/mac.h                             |  3 ++-
 hw/rdma/vmw/pvrdma.h                     |  3 ++-
 include/hw/acpi/tpm.h                    |  3 ++-
 include/hw/arm/fsl-imx7.h                |  5 ++--
 include/hw/arm/stm32f205_soc.h           |  5 ++--
 include/hw/display/xlnx_dp.h             |  5 ++--
 include/hw/i386/ich9.h                   |  3 ++-
 include/hw/intc/mips_gic.h               |  3 ++-
 include/hw/mips/bios.h                   |  3 ++-
 include/hw/net/allwinner_emac.h          |  5 ++--
 include/hw/ppc/spapr.h                   |  5 ++--
 include/hw/virtio/virtio-net.h           |  3 ++-
 include/qemu/cutils.h                    |  7 ------
 include/qemu/units.h                     | 20 ++++++++++++++++
 block/vdi.c                              |  7 +++---
 bsd-user/main.c                          |  5 ++--
 hw/alpha/typhoon.c                       | 17 +++++++-------
 hw/arm/bcm2835_peripherals.c             |  3 ++-
 hw/arm/boot.c                            |  7 +++---
 hw/arm/collie.c                          |  5 ++--
 hw/arm/digic_boards.c                    |  7 +++---
 hw/arm/exynos4_boards.c                  |  3 ++-
 hw/arm/gumstix.c                         |  3 ++-
 hw/arm/integratorcp.c                    |  3 ++-
 hw/arm/mainstone.c                       |  3 ++-
 hw/arm/msf2-soc.c                        |  6 ++---
 hw/arm/msf2-som.c                        |  8 +++----
 hw/arm/musicpal.c                        |  9 +++----
 hw/arm/omap_sx1.c                        | 11 +++++----
 hw/arm/raspi.c                           |  5 ++--
 hw/arm/smmu-common.c                     |  3 ++-
 hw/arm/stellaris.c                       |  5 ++--
 hw/arm/versatilepb.c                     |  5 ++--
 hw/arm/vexpress.c                        |  7 +++---
 hw/arm/virt.c                            |  5 ++--
 hw/arm/xilinx_zynq.c                     |  7 +++---
 hw/block/m25p80.c                        |  5 ++--
 hw/block/nvme.c                          |  3 ++-
 hw/block/tc58128.c                       |  3 ++-
 hw/block/xen_disk.c                      |  3 ++-
 hw/core/loader-fit.c                     |  3 ++-
 hw/core/machine.c                        |  4 ++--
 hw/cris/axis_dev88.c                     |  3 ++-
 hw/display/bochs-display.c               |  9 +++----
 hw/display/cirrus_vga.c                  | 10 ++++----
 hw/display/g364fb.c                      |  4 ++--
 hw/display/qxl.c                         | 30 +++++++++++-------------
 hw/display/sm501.c                       | 16 ++++++-------
 hw/display/vga-isa-mm.c                  |  5 ++--
 hw/display/vga.c                         |  5 ++--
 hw/display/virtio-gpu.c                  |  4 ++--
 hw/display/vmware_vga.c                  |  3 ++-
 hw/display/xenfb.c                       |  3 ++-
 hw/hppa/dino.c                           |  5 ++--
 hw/hppa/machine.c                        | 12 +++++-----
 hw/i386/acpi-build.c                     |  5 ++--
 hw/i386/pc.c                             | 19 ++++++++-------
 hw/i386/pc_piix.c                        |  4 ++--
 hw/i386/pc_q35.c                         |  3 ++-
 hw/i386/pc_sysfw.c                       |  9 +++----
 hw/i386/xen/xen-mapcache.c               |  3 ++-
 hw/intc/apic_common.c                    |  3 ++-
 hw/ipack/tpci200.c                       |  5 ++--
 hw/lm32/lm32_boards.c                    | 13 +++++-----
 hw/lm32/milkymist.c                      | 10 ++++----
 hw/m68k/mcf5208.c                        |  3 ++-
 hw/microblaze/petalogix_ml605_mmu.c      |  7 +++---
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 +++---
 hw/mips/boston.c                         | 30 ++++++++++++------------
 hw/mips/mips_fulong2e.c                  |  7 +++---
 hw/mips/mips_malta.c                     | 25 +++++++++++---------
 hw/mips/mips_r4k.c                       | 15 ++++++------
 hw/misc/aspeed_sdmc.c                    |  9 +++----
 hw/misc/auxbus.c                         |  3 ++-
 hw/misc/edu.c                            |  3 ++-
 hw/misc/imx7_gpr.c                       |  3 ++-
 hw/misc/ivshmem.c                        |  3 ++-
 hw/misc/mips_itu.c                       |  3 ++-
 hw/misc/omap_gpmc.c                      |  5 ++--
 hw/net/e1000e.c                          |  7 +++---
 hw/net/e1000x_common.c                   |  3 ++-
 hw/net/eepro100.c                        |  3 +--
 hw/nios2/boot.c                          |  6 ++---
 hw/nvram/spapr_nvram.c                   | 11 +++++----
 hw/pci-host/designware.c                 |  3 ++-
 hw/pci-host/gpex.c                       |  3 ++-
 hw/pci-host/piix.c                       |  5 ++--
 hw/pci-host/prep.c                       |  3 ++-
 hw/pci-host/q35.c                        | 17 +++++++-------
 hw/pci-host/xilinx-pcie.c                |  5 ++--
 hw/ppc/e500.c                            | 13 +++++-----
 hw/ppc/e500plat.c                        |  3 ++-
 hw/ppc/mac_newworld.c                    |  1 -
 hw/ppc/mac_oldworld.c                    |  9 ++++---
 hw/ppc/pnv.c                             |  6 ++---
 hw/ppc/ppc405_boards.c                   |  9 +++----
 hw/ppc/ppc405_uc.c                       |  7 +++---
 hw/ppc/ppc440_bamboo.c                   |  5 ++--
 hw/ppc/ppc440_uc.c                       | 28 +++++++++++-----------
 hw/ppc/ppc4xx_devs.c                     | 22 +++++++++--------
 hw/ppc/ppce500_spin.c                    |  3 ++-
 hw/ppc/prep.c                            |  6 ++---
 hw/ppc/rs6000_mc.c                       | 13 +++++-----
 hw/ppc/sam460ex.c                        | 18 +++++++-------
 hw/ppc/spapr.c                           | 12 +++++-----
 hw/ppc/spapr_rtas.c                      |  2 +-
 hw/ppc/virtex_ml507.c                    |  7 +++---
 hw/riscv/virt.c                          |  3 ++-
 hw/s390x/s390-skeys.c                    |  3 ++-
 hw/s390x/s390-stattrib.c                 |  3 ++-
 hw/s390x/sclp.c                          |  3 ++-
 hw/scsi/scsi-disk.c                      |  9 +++----
 hw/sd/sd.c                               |  8 +++----
 hw/sd/sdhci.c                            |  8 +++----
 hw/sh4/r2d.c                             |  3 ++-
 hw/smbios/smbios.c                       | 15 +++++-------
 hw/sparc/leon3.c                         | 10 ++++----
 hw/sparc/sun4m.c                         | 10 ++++----
 hw/sparc64/niagara.c                     |  3 ++-
 hw/sparc64/sun4u.c                       |  4 ++--
 hw/ssi/aspeed_smc.c                      | 29 ++++++++++++-----------
 hw/tricore/tricore_testboard.c           | 13 +++++-----
 hw/usb/ccid-card-passthru.c              |  5 ++--
 hw/usb/combined-packet.c                 |  3 ++-
 hw/usb/dev-smartcard-reader.c            |  3 ++-
 hw/usb/redirect.c                        |  3 ++-
 hw/vfio/pci-quirks.c                     |  9 +++----
 hw/vfio/pci.c                            |  3 ++-
 hw/xenpv/xen_domainbuild.c               | 13 +++++-----
 hw/xtensa/xtfpga.c                       |  9 +++----
 linux-user/main.c                        |  5 ++--
 monitor.c                                |  3 ++-
 target/i386/cpu.c                        |  4 +---
 target/ppc/mmu_helper.c                  |  8 +++----
 target/xtensa/helper.c                   |  5 ++--
 tests/benchmark-crypto-cipher.c          |  6 ++---
 tests/benchmark-crypto-hash.c            |  5 ++--
 tests/benchmark-crypto-hmac.c            |  6 ++---
 tests/test-cutils.c                      | 18 +++++++-------
 tests/test-keyval.c                      |  6 ++---
 tests/test-qemu-opts.c                   |  7 +++---
 vl.c                                     |  3 ++-
 scripts/checkpatch.pl                    |  1 +
 144 files changed, 565 insertions(+), 453 deletions(-)
 create mode 100644 include/qemu/units.h

-- 
2.18.0

