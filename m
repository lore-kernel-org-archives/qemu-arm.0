Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4424333wrq;
        Mon, 25 Jun 2018 18:08:42 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLmK6EogzT52Bv7wPxPZZpAQbfNCSIrFXd9fXLqMgQjr/OsDtLIyNJuY7Q9aoAuTWQqzKjW
X-Received: by 2002:ac8:28a4:: with SMTP id i33-v6mr13391003qti.112.1529975322150;
        Mon, 25 Jun 2018 18:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529975322; cv=none;
        d=google.com; s=arc-20160816;
        b=giBaB9Ndbvl3EFKe3QjV0bXqqumR73ie+fjgNtrd0mvwKXwFRJWYmtvhGFa7MsdClO
         GfFp3pKc7nwZ5N4vkm0VMMRrLtAEcqbiJfo5OlFf2FBpomNHJ/8x6IbwoG4KCmsoKV1P
         wDcdqPde25GTgmhdRisnhNzw0qyRF+FfzIc4pVq7lGNfAzNABWAxAGsJIO2MWj5I5kAY
         8yok+uxKcLKrdAi7oKyKpI69CMR1BeIAS7aCeGLF6jd71IG11TeHHuj7eGcG1Dfn0Ifa
         J8fNbJnLDBnk6lRmspTCQe62+bRl2O/TqFLPB7IHqzC4+cixGr3WjpmS+IPGaIMaN7O9
         DZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=zw0I2+ucYh9uwPphPjzDgxRBAUM/vy3vaSdxgUjaX48=;
        b=dz+657M6VL73md/aWG8kXLi4nHr1gSJfNB9P5sW48vBTcuz5eeDc7QonmzUwcA1hGG
         Bt6AO1pWG5RDLPM9qKNtPMeAZL5ZeUskVmAkdQuPo9b7BkO3lLoO7GeRxeI76H+/VHXW
         OWNlynJvnMg5lnwgGMXmTX+5mh9QsRRW7Ak4vfLb+yx6jVKV6qnUQHllGgsP4GAG1m5m
         MxmS+BzJ06aCjHTSgCBWmU7ri/c1zptzpR1Pc/cYm/PLfq/RRuJjq2CEtacNoTF39P5q
         CYeGUkaQK6cBHLeOsU7Tu9P98hn9fPosPr2vBZihmujsyzxwd9hn5f55APnVTFQS+Rvs
         7Q4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p79-v6si356994qkl.154.2018.06.25.18.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 18:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXcTJ-0004PJ-8p
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 21:08:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fXcTA-0004P1-3c
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 21:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fXcT4-0004WX-PY
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 21:08:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45948 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fXcT4-0004VA-HV; Mon, 25 Jun 2018 21:08:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC0C581A4EA3;
	Tue, 26 Jun 2018 01:08:24 +0000 (UTC)
Received: from redhat.com (ovpn-122-22.rdu2.redhat.com [10.10.122.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D11242026D67;
	Tue, 26 Jun 2018 01:08:11 +0000 (UTC)
Date: Tue, 26 Jun 2018 04:08:11 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180626040800-mutt-send-email-mst@kernel.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 01:08:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 01:08:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v5 00/46] Use the IEC binary prefix
 definitions
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
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Igor Mammedov <imammedo@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DZHwybH3lLXd

On Mon, Jun 25, 2018 at 09:41:52AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>=20
> This series:
>=20
> - split the byte-based definitions from "qemu/cutils.h" to "qemu/units.=
h"
>   (this now triggers WARNING: 1 added file, does MAINTAINERS need updat=
ing?)
> - clean hw/ includes;
> - replace different constants used for byte size with their correspondi=
ng
>   IEC binary prefix definitions.

Series:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> Since v4:
> - fixed checkpatch (do not match the IEC binary prefix as camelcase typ=
edefs)
> - use signed format for size (Richard)
> - fix 32-bit (Thomas)
> - update '[<>][<>]=3D ?[1-5]0', adding 5 new patches (Eric)
>=20
> Since v3:
> - use IEC binary prefix definitions (Stefan Weil)
> - rebased
> - added R-b tags
>=20
> Since v2:
> - use "qemu/units.h" instead of "qemu/cunits.h" (Daniel P. Berrang=E9)
> - avoid rebuilding the world including "qemu/units.h" in "hw/hw.h" (Tho=
mas Huth)
> - more constant replaced
>=20
> Since v1:
> - corrected Xen mult -> div (Alan Robinson)
> - tagged 'include "qemu/cunits.h" in "hw/hw.h" as RFC
> - fixed mips_r4k 'params_size' (Thomas Huth)
> - added command used to generate patch in each commit (Alistair Francis=
)
> - use G_BYTE for the raspi3 machine
> - added Reviewed-by tags
>=20
> Regards,
>=20
> Phil.
>=20
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream p=
atch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, resp=
ectively
>=20
> 001/46:[0012] [FC] 'include: Add IEC binary prefixes in "qemu/units.h"'
> 002/46:[0005] [FC] 'vdi: Use definitions from "qemu/units.h"'
> 003/46:[----] [--] 'x86/cpu: Use definitions from "qemu/units.h"'
> 004/46:[0002] [FC] 'checkpatch: Recognize IEC binary prefix definitions=
'
> 005/46:[----] [-C] 'hw: Use IEC binary prefix definitions from "qemu/un=
its.h"'
> 006/46:[----] [--] 'hw: Directly use "qemu/units.h" instead of "qemu/cu=
tils.h"'
> 007/46:[----] [--] 'hw/ivshmem: Use the IEC binary prefix definitions'
> 008/46:[----] [--] 'hw/ipack: Use the IEC binary prefix definitions'
> 009/46:[----] [--] 'hw/scsi: Use the IEC binary prefix definitions'
> 010/46:[----] [--] 'hw/smbios: Use the IEC binary prefix definitions'
> 011/46:[0002] [FC] 'hw/xen: Use the IEC binary prefix definitions'
> 012/46:[----] [--] 'hw/tpm: Use the IEC binary prefix definitions'
> 013/46:[----] [--] 'hw/block: Use the IEC binary prefix definitions'
> 014/46:[0008] [FC] 'hw/display: Use the IEC binary prefix definitions'
> 015/46:[----] [--] 'hw/misc: Use the IEC binary prefix definitions'
> 016/46:[----] [--] 'hw/riscv: Use the IEC binary prefix definitions'
> 017/46:[----] [--] 'hw/m68k: Use the IEC binary prefix definitions'
> 018/46:[0006] [FC] 'hw/sparc: Use the IEC binary prefix definitions'
> 019/46:[0003] [FC] 'hw/s390x: Use the IEC binary prefix definitions'
> 020/46:[0004] [FC] 'hw/hppa: Use the IEC binary prefix definitions'
> 021/46:[0009] [FC] 'hw/xtensa: Use the IEC binary prefix definitions'
> 022/46:[----] [--] 'hw/alpha: Use the IEC binary prefix definitions'
> 023/46:[----] [--] 'hw/tricore: Use the IEC binary prefix definitions'
> 024/46:[----] [--] 'hw/microblaze: Use the IEC binary prefix definition=
s'
> 025/46:[----] [--] 'hw/nios2: Use the IEC binary prefix definitions'
> 026/46:[----] [--] 'hw/cris: Use the IEC binary prefix definitions'
> 027/46:[----] [--] 'hw/lm32: Use the IEC binary prefix definitions'
> 028/46:[----] [--] 'hw/sh4: Use the IEC binary prefix definitions'
> 029/46:[----] [--] 'hw/mips/r4k: Constify params_size'
> 030/46:[0012] [FC] 'hw/mips: Use the IEC binary prefix definitions'
> 031/46:[----] [--] 'hw/arm: Use the IEC binary prefix definitions'
> 032/46:[0022] [FC] 'hw/ppc: Use the IEC binary prefix definitions'
> 033/46:[0006] [FC] 'hw/i386: Use the IEC binary prefix definitions'
> 034/46:[----] [--] 'hw/net: Use the IEC binary prefix definitions'
> 035/46:[0002] [FC] 'hw/usb: Use the IEC binary prefix definitions'
> 036/46:[0002] [FC] 'hw/sd: Use the IEC binary prefix definitions'
> 037/46:[----] [--] 'hw/vfio: Use the IEC binary prefix definitions'
> 038/46:[----] [--] 'hw/virtio: Use the IEC binary prefix definitions'
> 039/46:[----] [--] 'hw/rdma: Use the IEC binary prefix definitions'
> 040/46:[----] [--] 'cutils: Do not include "qemu/units.h" directly'
> 041/46:[0148] [FC] 'hw/ppc: Use the IEC binary prefix definitions'
> 042/46:[down] 'monitor: Use the IEC binary prefix definitions'
> 043/46:[down] 'vl: Use the IEC binary prefix definitions'
> 044/46:[down] 'tests/crypto: Use the IEC binary prefix definitions'
> 045/46:[down] 'linux-user: Use the IEC binary prefix definitions'
> 046/46:[down] 'bsd-user: Use the IEC binary prefix definitions'
>=20
> Philippe Mathieu-Daud=E9 (46):
>   include: Add IEC binary prefixes in "qemu/units.h"
>   vdi: Use definitions from "qemu/units.h"
>   x86/cpu: Use definitions from "qemu/units.h"
>   checkpatch: Recognize IEC binary prefix definitions
>   hw: Use IEC binary prefix definitions from "qemu/units.h"
>   hw: Directly use "qemu/units.h" instead of "qemu/cutils.h"
>   hw/ivshmem: Use the IEC binary prefix definitions
>   hw/ipack: Use the IEC binary prefix definitions
>   hw/scsi: Use the IEC binary prefix definitions
>   hw/smbios: Use the IEC binary prefix definitions
>   hw/xen: Use the IEC binary prefix definitions
>   hw/tpm: Use the IEC binary prefix definitions
>   hw/block: Use the IEC binary prefix definitions
>   hw/display: Use the IEC binary prefix definitions
>   hw/misc: Use the IEC binary prefix definitions
>   hw/riscv: Use the IEC binary prefix definitions
>   hw/m68k: Use the IEC binary prefix definitions
>   hw/sparc: Use the IEC binary prefix definitions
>   hw/s390x: Use the IEC binary prefix definitions
>   hw/hppa: Use the IEC binary prefix definitions
>   hw/xtensa: Use the IEC binary prefix definitions
>   hw/alpha: Use the IEC binary prefix definitions
>   hw/tricore: Use the IEC binary prefix definitions
>   hw/microblaze: Use the IEC binary prefix definitions
>   hw/nios2: Use the IEC binary prefix definitions
>   hw/cris: Use the IEC binary prefix definitions
>   hw/lm32: Use the IEC binary prefix definitions
>   hw/sh4: Use the IEC binary prefix definitions
>   hw/mips/r4k: Constify params_size
>   hw/mips: Use the IEC binary prefix definitions
>   hw/arm: Use the IEC binary prefix definitions
>   hw/ppc: Use the IEC binary prefix definitions
>   hw/i386: Use the IEC binary prefix definitions
>   hw/net: Use the IEC binary prefix definitions
>   hw/usb: Use the IEC binary prefix definitions
>   hw/sd: Use the IEC binary prefix definitions
>   hw/vfio: Use the IEC binary prefix definitions
>   hw/virtio: Use the IEC binary prefix definitions
>   hw/rdma: Use the IEC binary prefix definitions
>   cutils: Do not include "qemu/units.h" directly
>   hw/ppc: Use the IEC binary prefix definitions
>   monitor: Use the IEC binary prefix definitions
>   vl: Use the IEC binary prefix definitions
>   tests/crypto: Use the IEC binary prefix definitions
>   linux-user: Use the IEC binary prefix definitions
>   bsd-user: Use the IEC binary prefix definitions
>=20
>  hw/net/ne2000.h                          |  5 ++--
>  hw/ppc/mac.h                             |  3 ++-
>  hw/rdma/vmw/pvrdma.h                     |  3 ++-
>  include/hw/acpi/tpm.h                    |  3 ++-
>  include/hw/arm/fsl-imx7.h                |  5 ++--
>  include/hw/arm/stm32f205_soc.h           |  5 ++--
>  include/hw/display/xlnx_dp.h             |  5 ++--
>  include/hw/i386/ich9.h                   |  3 ++-
>  include/hw/intc/mips_gic.h               |  3 ++-
>  include/hw/mips/bios.h                   |  3 ++-
>  include/hw/net/allwinner_emac.h          |  5 ++--
>  include/hw/ppc/spapr.h                   |  5 ++--
>  include/hw/virtio/virtio-net.h           |  3 ++-
>  include/qemu/cutils.h                    |  7 ------
>  include/qemu/units.h                     | 20 ++++++++++++++++
>  block/vdi.c                              |  7 +++---
>  bsd-user/main.c                          |  5 ++--
>  hw/alpha/typhoon.c                       | 17 +++++++-------
>  hw/arm/bcm2835_peripherals.c             |  3 ++-
>  hw/arm/boot.c                            |  7 +++---
>  hw/arm/collie.c                          |  5 ++--
>  hw/arm/digic_boards.c                    |  7 +++---
>  hw/arm/exynos4_boards.c                  |  3 ++-
>  hw/arm/gumstix.c                         |  3 ++-
>  hw/arm/integratorcp.c                    |  3 ++-
>  hw/arm/mainstone.c                       |  3 ++-
>  hw/arm/msf2-soc.c                        |  6 ++---
>  hw/arm/msf2-som.c                        |  8 +++----
>  hw/arm/musicpal.c                        |  9 +++----
>  hw/arm/omap_sx1.c                        | 11 +++++----
>  hw/arm/raspi.c                           |  5 ++--
>  hw/arm/smmu-common.c                     |  3 ++-
>  hw/arm/stellaris.c                       |  5 ++--
>  hw/arm/versatilepb.c                     |  5 ++--
>  hw/arm/vexpress.c                        |  7 +++---
>  hw/arm/virt.c                            |  5 ++--
>  hw/arm/xilinx_zynq.c                     |  7 +++---
>  hw/block/m25p80.c                        |  5 ++--
>  hw/block/nvme.c                          |  3 ++-
>  hw/block/tc58128.c                       |  3 ++-
>  hw/block/xen_disk.c                      |  3 ++-
>  hw/core/loader-fit.c                     |  3 ++-
>  hw/core/machine.c                        |  4 ++--
>  hw/cris/axis_dev88.c                     |  3 ++-
>  hw/display/bochs-display.c               |  9 +++----
>  hw/display/cirrus_vga.c                  | 10 ++++----
>  hw/display/g364fb.c                      |  4 ++--
>  hw/display/qxl.c                         | 30 +++++++++++-------------
>  hw/display/sm501.c                       | 16 ++++++-------
>  hw/display/vga-isa-mm.c                  |  5 ++--
>  hw/display/vga.c                         |  5 ++--
>  hw/display/virtio-gpu.c                  |  4 ++--
>  hw/display/vmware_vga.c                  |  3 ++-
>  hw/display/xenfb.c                       |  3 ++-
>  hw/hppa/dino.c                           |  5 ++--
>  hw/hppa/machine.c                        | 12 +++++-----
>  hw/i386/acpi-build.c                     |  5 ++--
>  hw/i386/pc.c                             | 19 ++++++++-------
>  hw/i386/pc_piix.c                        |  4 ++--
>  hw/i386/pc_q35.c                         |  3 ++-
>  hw/i386/pc_sysfw.c                       |  9 +++----
>  hw/i386/xen/xen-mapcache.c               |  3 ++-
>  hw/intc/apic_common.c                    |  3 ++-
>  hw/ipack/tpci200.c                       |  5 ++--
>  hw/lm32/lm32_boards.c                    | 13 +++++-----
>  hw/lm32/milkymist.c                      | 10 ++++----
>  hw/m68k/mcf5208.c                        |  3 ++-
>  hw/microblaze/petalogix_ml605_mmu.c      |  7 +++---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 +++---
>  hw/mips/boston.c                         | 30 ++++++++++++------------
>  hw/mips/mips_fulong2e.c                  |  7 +++---
>  hw/mips/mips_malta.c                     | 25 +++++++++++---------
>  hw/mips/mips_r4k.c                       | 15 ++++++------
>  hw/misc/aspeed_sdmc.c                    |  9 +++----
>  hw/misc/auxbus.c                         |  3 ++-
>  hw/misc/edu.c                            |  3 ++-
>  hw/misc/imx7_gpr.c                       |  3 ++-
>  hw/misc/ivshmem.c                        |  3 ++-
>  hw/misc/mips_itu.c                       |  3 ++-
>  hw/misc/omap_gpmc.c                      |  5 ++--
>  hw/net/e1000e.c                          |  7 +++---
>  hw/net/e1000x_common.c                   |  3 ++-
>  hw/net/eepro100.c                        |  3 +--
>  hw/nios2/boot.c                          |  6 ++---
>  hw/nvram/spapr_nvram.c                   | 11 +++++----
>  hw/pci-host/designware.c                 |  3 ++-
>  hw/pci-host/gpex.c                       |  3 ++-
>  hw/pci-host/piix.c                       |  5 ++--
>  hw/pci-host/prep.c                       |  3 ++-
>  hw/pci-host/q35.c                        | 17 +++++++-------
>  hw/pci-host/xilinx-pcie.c                |  5 ++--
>  hw/ppc/e500.c                            | 13 +++++-----
>  hw/ppc/e500plat.c                        |  3 ++-
>  hw/ppc/mac_newworld.c                    |  1 -
>  hw/ppc/mac_oldworld.c                    |  9 ++++---
>  hw/ppc/pnv.c                             |  6 ++---
>  hw/ppc/ppc405_boards.c                   |  9 +++----
>  hw/ppc/ppc405_uc.c                       |  7 +++---
>  hw/ppc/ppc440_bamboo.c                   |  5 ++--
>  hw/ppc/ppc440_uc.c                       | 28 +++++++++++-----------
>  hw/ppc/ppc4xx_devs.c                     | 22 +++++++++--------
>  hw/ppc/ppce500_spin.c                    |  3 ++-
>  hw/ppc/prep.c                            |  6 ++---
>  hw/ppc/rs6000_mc.c                       | 13 +++++-----
>  hw/ppc/sam460ex.c                        | 18 +++++++-------
>  hw/ppc/spapr.c                           | 12 +++++-----
>  hw/ppc/spapr_rtas.c                      |  2 +-
>  hw/ppc/virtex_ml507.c                    |  7 +++---
>  hw/riscv/virt.c                          |  3 ++-
>  hw/s390x/s390-skeys.c                    |  3 ++-
>  hw/s390x/s390-stattrib.c                 |  3 ++-
>  hw/s390x/sclp.c                          |  3 ++-
>  hw/scsi/scsi-disk.c                      |  9 +++----
>  hw/sd/sd.c                               |  8 +++----
>  hw/sd/sdhci.c                            |  8 +++----
>  hw/sh4/r2d.c                             |  3 ++-
>  hw/smbios/smbios.c                       | 15 +++++-------
>  hw/sparc/leon3.c                         | 10 ++++----
>  hw/sparc/sun4m.c                         | 10 ++++----
>  hw/sparc64/niagara.c                     |  3 ++-
>  hw/sparc64/sun4u.c                       |  4 ++--
>  hw/ssi/aspeed_smc.c                      | 29 ++++++++++++-----------
>  hw/tricore/tricore_testboard.c           | 13 +++++-----
>  hw/usb/ccid-card-passthru.c              |  5 ++--
>  hw/usb/combined-packet.c                 |  3 ++-
>  hw/usb/dev-smartcard-reader.c            |  3 ++-
>  hw/usb/redirect.c                        |  3 ++-
>  hw/vfio/pci-quirks.c                     |  9 +++----
>  hw/vfio/pci.c                            |  3 ++-
>  hw/xenpv/xen_domainbuild.c               | 13 +++++-----
>  hw/xtensa/xtfpga.c                       |  9 +++----
>  linux-user/main.c                        |  5 ++--
>  monitor.c                                |  3 ++-
>  target/i386/cpu.c                        |  4 +---
>  target/ppc/mmu_helper.c                  |  8 +++----
>  target/xtensa/helper.c                   |  5 ++--
>  tests/benchmark-crypto-cipher.c          |  6 ++---
>  tests/benchmark-crypto-hash.c            |  5 ++--
>  tests/benchmark-crypto-hmac.c            |  6 ++---
>  tests/test-cutils.c                      | 18 +++++++-------
>  tests/test-keyval.c                      |  6 ++---
>  tests/test-qemu-opts.c                   |  7 +++---
>  vl.c                                     |  3 ++-
>  scripts/checkpatch.pl                    |  1 +
>  144 files changed, 565 insertions(+), 453 deletions(-)
>  create mode 100644 include/qemu/units.h
>=20
> --=20
> 2.18.0
