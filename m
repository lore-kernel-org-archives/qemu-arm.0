Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4500195wrm;
        Mon, 14 Oct 2019 07:23:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJ/51QjedZPre4N3ej7HYn4QZU5i24BajMwWavY/BkzW4ZSfaW04mLb7/+9aAZ1I53sUin
X-Received: by 2002:a17:906:d964:: with SMTP id rp4mr28255778ejb.147.1571063008020;
        Mon, 14 Oct 2019 07:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063008; cv=none;
        d=google.com; s=arc-20160816;
        b=VKhJQLjiI0HESmrSFbPIBrak1dSKhuFFMOdDYBGzIMpUWDhiScK9Ua9vEm/itXu9lD
         3Wg1pRtpYHKLqtLVHwfYhkh5EL5+udUssF3ompC8+f82au5ob5aHe5JYAr3PNSyHX26m
         OPm04Le5nWw+aTvqyTI92rq8RKU40IARQ91RwuRXzQeU4IFCUyXk5QZUiQxYSUGqlTc9
         1jOh7YYAbLb9RX1Ir7C9JWvboH5WoiOJboz22DfGhJRmdlx6Ani8aBOPQEd37xk1iY3r
         LFkpQPi2YGToIBQUb179skVHpJzkRweZ6OkhsXjrtcrZ8QUeX9uAiUOhye3DebwCKLuk
         E5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=sGgbPqr3dIsOz5C3436dAQOeAOy1h0Ja+jKE2eSbaLc=;
        b=ScUrPSEtCcqJ8czwfFCXWSunmgA5JUMNt3Y5A20I4ljrG3RBHyTQ9aypH9b5N6tM/e
         lGD8JtiJyib48+MU7GnmjeYOLQrhzGBiSe/K4ZOFDOPfv6yC3tXTslhpqUcg2HVUGQlC
         ezXnc59xMxDMOxMGItADkDRStzsUFygGPQhXE9rPQsITSXSCJoKqKp/4MfImrbTi5dhw
         e2GFYi3iq9XOrz5k2OJhvy75mXieK6edAzGQ0yE5VX/o4l16s+PYrBSm69wnQkd3pTL7
         lSvZHuhCTY8hmiH2ivBEoLDj/MuIPCM+bhNbavGIFem/XKmpqPFoOggHUTvkFJUxwmoG
         GYqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si10217853ejs.401.2019.10.14.07.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Fu-0005L9-TQ
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Fk-0005Ig-SX
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:23:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Fj-0008Jf-L2
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:23:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Fj-0008JR-DB; Mon, 14 Oct 2019 10:23:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 313B85117D;
 Mon, 14 Oct 2019 14:23:14 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CD7C600CD;
 Mon, 14 Oct 2019 14:22:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 00/20] hw: Clean up hw/i386 headers (and few alpha/hppa)
Date: Mon, 14 Oct 2019 16:22:26 +0200
Message-Id: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 14 Oct 2019 14:23:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPlllQZd10DR

This is a follow-up of Markus's cleanup series:
Tame a few "touch this, recompile the world"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg635748.html

This part is mostly restricted to X86, but since some file from the
Alpha/PA-RISC machines include "hw/i386/pc.h" I had to fix them
too.

Eventually I'll succeed at removing hw/i386/ dependency on non-X86
platforms (Quest I started 2 years ago...).

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (20):
  vl: Add missing "hw/boards.h" include
  hw/southbridge/ich9: Removed unused headers
  hw/input/pckbd: Remove unused "hw/i386/pc.h" header
  hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" header
  hw/timer: Remove unused "ui/console.h" header
  hw/usb/dev-storage: Remove unused "ui/console.h" header
  hw/i386/intel_iommu: Remove unused includes
  hw/xen/xen_pt_load_rom: Remove unused includes
  hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
  hw/alpha/dp264: Include "net/net.h"
  hw/hppa/machine: Include "net/net.h"
  hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
  hw/timer/hpet: Include "exec/address-spaces.h"
  hw/pci-host/q35: Include "qemu/range.h"
  hw/i2c/smbus_ich9: Include "qemu/range.h"
  hw/pci-host/piix: Include "qemu/range.h"
  hw/acpi: Include "hw/mem/nvdimm.h"
  hw/i386: Include "hw/mem/nvdimm.h"
  hw/pci-host/q35: Remove unused includes
  hw/i386/pc: Clean up includes

 hw/acpi/cpu_hotplug.c             |  1 +
 hw/acpi/ich9.c                    |  2 +-
 hw/acpi/piix4.c                   |  1 +
 hw/alpha/alpha_sys.h              |  1 -
 hw/alpha/dp264.c                  |  1 +
 hw/hppa/machine.c                 |  1 +
 hw/i2c/smbus_ich9.c               |  1 +
 hw/i386/acpi-build.c              |  1 +
 hw/i386/pc.c                      |  1 +
 hw/i386/pc_piix.c                 |  1 +
 hw/i386/pc_q35.c                  |  1 +
 hw/input/pckbd.c                  |  1 -
 hw/isa/lpc_ich9.c                 |  2 --
 hw/pci-host/piix.c                |  1 +
 hw/pci-host/q35.c                 |  1 +
 hw/timer/hpet.c                   |  2 +-
 hw/timer/twl92230.c               |  1 -
 hw/usb/dev-storage.c              |  1 -
 hw/xen/xen_pt_load_rom.c          |  4 ----
 include/hw/i386/ich9.h            |  1 -
 include/hw/i386/intel_iommu.h     |  4 ----
 include/hw/i386/ioapic_internal.h |  1 -
 include/hw/i386/pc.h              | 12 +++---------
 include/hw/pci-host/q35.h         |  8 +-------
 vl.c                              |  1 +
 25 files changed, 18 insertions(+), 34 deletions(-)

--=20
2.21.0

