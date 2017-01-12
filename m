Received: by 10.25.205.13 with SMTP id d13csp1379222lfg;
        Thu, 12 Jan 2017 10:28:46 -0800 (PST)
X-Received: by 10.237.43.36 with SMTP id p33mr13081395qtd.199.1484245726587;
        Thu, 12 Jan 2017 10:28:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l37si6681938qtl.48.2017.01.12.10.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jan 2017 10:28:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRk7C-0005fb-2D
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 13:28:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cRk36-0000ta-Bs
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 13:24:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cRk33-0002Jc-5t
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 13:24:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cRk32-0002He-Vy; Thu, 12 Jan 2017 13:24:29 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EFCAC04D2F1;
	Thu, 12 Jan 2017 18:24:27 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-42.phx2.redhat.com
	[10.3.116.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB1D01585E;
	Thu, 12 Jan 2017 18:24:22 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Date: Thu, 12 Jan 2017 19:24:13 +0100
Message-Id: <20170112182417.9548-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 12 Jan 2017 18:24:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 wave 1 0/4] fw-cfg: support writeable blobs
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
X-TUID: kul8CRbQHHVT

Previous version (v5):
http://lists.nongnu.org/archive/html/qemu-devel/2017-01/msg01897.html

Changes in v6 (see the individual patches for details):
- pick up feedback tags
- rename the "file_slots" property to "x-file-slots" [Eduardo, Michael]

Cc: "Gabriel L. Somlo" <somlo@cmu.edu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Gabriel Somlo <somlo@cmu.edu>
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

Thanks!
Laszlo

Eduardo Habkost (1):
  pc: Add 2.9 machine-types

Laszlo Ersek (2):
  fw-cfg: turn FW_CFG_FILE_SLOTS into a device property
  fw-cfg: bump "x-file-slots" to 0x20 for 2.9+ machine types

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

