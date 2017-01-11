Received: by 10.25.205.13 with SMTP id d13csp866645lfg;
        Wed, 11 Jan 2017 10:26:06 -0800 (PST)
X-Received: by 10.55.92.199 with SMTP id q190mr9261464qkb.303.1484159166122;
        Wed, 11 Jan 2017 10:26:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a123si440476qkf.96.2017.01.11.10.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jan 2017 10:26:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRNb3-0006W4-FU
	for alex.bennee@linaro.org; Wed, 11 Jan 2017 13:26:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cRMnn-0005AH-Ev
	for qemu-arm@nongnu.org; Wed, 11 Jan 2017 12:35:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cRMnj-0007la-JB
	for qemu-arm@nongnu.org; Wed, 11 Jan 2017 12:35:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52600)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cRMnj-0007lQ-Bt; Wed, 11 Jan 2017 12:35:07 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63CC24DB14;
	Wed, 11 Jan 2017 17:35:06 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-80.phx2.redhat.com
	[10.3.116.80])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0BHZ1rV004547; Wed, 11 Jan 2017 12:35:02 -0500
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Date: Wed, 11 Jan 2017 18:34:53 +0100
Message-Id: <20170111173457.30455-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 11 Jan 2017 17:35:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 wave 1 0/4] fw-cfg: support writeable blobs
 and more files
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Gabriel L. Somlo" <somlo@cmu.edu>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, Michael Walle <michael@walle.cc>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CEcO51JLuMyH

This is the first (fw_cfg) half of the v5 iteration of the series posted
here:
<http://lists.nongnu.org/archive/html/qemu-devel/2016-12/msg00129.html>.

In this version, the fw_cfg patches have been separated into a
standalone "wave", for helping review / maintenance, and also for
enabling independent features on top of writeable blobs. More
importantly, I've addressed Igor's v4 feedback. See the individual
patches for the details.

Patch #3 is included verbatim from Eduardo's pending series (see the
patch notes for the archive URL), as a dependency for patch #4. If
Eduardo's series is merged first, patch #3 can be dropped (in fact
git-rebase should do it automatically).

Please excuse the surprisingly long list of CC's, it's due to the fact
that fw_cfg is quite widely used (see patch #4).

Cc: "Gabriel L. Somlo" <somlo@cmu.edu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael Walle <michael@walle.cc>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <zhaoshenglong@huawei.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-arm@nongnu.org

Thanks
Laszlo


Eduardo Habkost (1):
  pc: Add 2.9 machine-types

Laszlo Ersek (2):
  fw-cfg: turn FW_CFG_FILE_SLOTS into a device property
  fw-cfg: bump "file_slots" to 0x20 for 2.9+ machine types

Michael S. Tsirkin (1):
  fw-cfg: support writeable blobs

 docs/specs/fw_cfg.txt          |  36 ++++++++++----
 hw/lm32/lm32_hwsetup.h         |   2 +-
 include/hw/compat.h            |  10 +++-
 include/hw/i386/pc.h           |   2 +
 include/hw/loader.h            |   7 +--
 include/hw/nvram/fw_cfg.h      |   3 +-
 include/hw/nvram/fw_cfg_keys.h |   3 +-
 hw/arm/virt-acpi-build.c       |   2 +-
 hw/core/loader.c               |  18 ++++---
 hw/i386/acpi-build.c           |   4 +-
 hw/i386/pc_piix.c              |  15 ++++--
 hw/i386/pc_q35.c               |  13 ++++-
 hw/nvram/fw_cfg.c              | 110 +++++++++++++++++++++++++++++++++++------
 13 files changed, 177 insertions(+), 48 deletions(-)

-- 
2.9.3

