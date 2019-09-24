Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4337794wrp;
        Tue, 24 Sep 2019 13:11:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZULbz3XcfdM6gsY9r6ZlKSjntGpYq64RoUF30x+WqonleH1MArcWdcraXhH8iY0CDeAFE
X-Received: by 2002:a0c:a988:: with SMTP id a8mr4064477qvb.34.1569355864799;
        Tue, 24 Sep 2019 13:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569355864; cv=none;
        d=google.com; s=arc-20160816;
        b=gGpMG8pNLlGCulmKPAcOfG+FixZX2oORHXWJ5rZlLvTl1d9fWO4D0TYTLRk4Hbg531
         HGYqFQb/qe0LGrvu6UotscN8z5larDbqQB/wN1AtE1+JEEqxCUTBpMBi82goaaAw4igP
         c98LXpKlGnK0s0ukcjtNeW57Nbmd+MRl3O30ZvgmKS449auxyGLFGBUNv/XC0Nr8/3c5
         GRBue2tDFK1i+rbuF1CjHKHMGa8WjSnCJ+uFzzDRRUwNyydDJglexiOi5HJoThzmLJqv
         cSPPqsWyAfMAEJTLtxrBV1fGPYXXdSlA5kgECIKePBN6AzD1wPjZJuDgZs+jzOoYxL0q
         AeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=4Wg3mmWs24pjAlm29jFSuNKZ90UOsKEw51heL7I+oUE=;
        b=WymKtVfsrTWoh1FPF+6wQhUT1TdNHxPZq2NRlBR2Dvjgp/oQoHJjUgV5ldTXWuoeAd
         euxw/HTsf0f/JaIkFQ8vxT0UlcPdvZCQo05+cf0EgdY3PdtleFXMI3HlcEG07x0M4RpM
         F/uk7ac1nZtNkE0gP904BoRpaiIID+mjNvnCrgmwAgha3nR+mvLnzh3yNKcIdi4FhOY0
         uTI0uFbqGygMlcPL9aqAsT/ee+GlR55JkzJXPNDnYVLJ6I1Brm1gW0gWmnABJMfJaSI1
         4+sr45s/COnNnjFgEyJnt4pye0Oh5VyTbQuYJZ5MuFu6U733jcu9ZAjwGiEq7ZlToHh8
         b8gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si2006576qkg.203.2019.09.24.13.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 13:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCr9L-0000fL-PY
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 16:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr85-0000PC-DL
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr83-0002ox-ML
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:38020)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr83-0002np-F4; Tue, 24 Sep 2019 16:09:43 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr7r-0001Mk-Gw; Tue, 24 Sep 2019 23:09:31 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/25] error: auto propagated local_err
Date: Tue, 24 Sep 2019 23:08:37 +0300
Message-Id: <20190924200902.4703-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fep+9fbZHkTh

Hi all!

Here is a proposal of auto propagation for local_err, to not call
error_propagate on every exit point, when we deal with local_err.

There are also two issues with errp:

1. error_fatal & error_append_hint: user can't see these
hints, because exit() happens in error_setg earlier than hint is
appended. [Reported by Greg Kurz]

2. error_abort & error_propagate: when we wrap
error_abort by local_err+error_propagate, resulting coredump will
refer to error_propagate and not to the place where error happened.
(the macro itself don't fix the issue, but it allows to [3.] drop all
local_err+error_propagate pattern, which will definitely fix the issue)
[Reported by Kevin Wolf]

Still, applying new macro to all errp-functions is a huge task, which is
impossible to solve in one series.

So, here is a minimum: solve only [1.], by adding new macro to all
errp-functions which wants to call error_append_hint.

v3: plan B: fix only error_append_hint users, as a first step.
01: - new errp-based API dropped, so now patch is smaller.
    - slightly adjust commit message
    - keep Eric's r-b
02: - no new API, so just open-code fix
    - keep Eric's r-b
03: - simplify the code [Eric]
04: - grammar and wording
    - drop extra unused variable
others: new

Vladimir Sementsov-Ogievskiy (25):
  errp: rename errp to errp_in where it is IN-argument
  hw/core/loader-fit: fix freeing errp in fit_load_fdt
  net/net: fix local variable shadowing in net_client_init
  error: auto propagated local_err
  scripts: add coccinelle script to fix error_append_hint usage
  python: add commit-per-subsystem.py
  s390: Fix error_append_hint usage
  ARM TCG CPUs: Fix error_append_hint usage
  PowerPC TCG CPUs: Fix error_append_hint usage
  arm: Fix error_append_hint usage
  SmartFusion2: Fix error_append_hint usage
  PCI: Fix error_append_hint usage
  SCSI: Fix error_append_hint usage
  USB: Fix error_append_hint usage
  VFIO: Fix error_append_hint usage
  virtio: Fix error_append_hint usage
  virtio-9p: Fix error_append_hint usage
  block: Fix error_append_hint usage
  chardev: Fix error_append_hint usage
  cmdline: Fix error_append_hint usage
  QOM: Fix error_append_hint usage
  Migration: Fix error_append_hint usage
  Sockets: Fix error_append_hint usage
  nbd: Fix error_append_hint usage
  PVRDMA: Fix error_append_hint usage

 include/monitor/hmp.h                         |  2 +-
 include/qapi/error.h                          | 37 +++++++++-
 ui/vnc.h                                      |  2 +-
 block/backup.c                                |  1 +
 block/dirty-bitmap.c                          |  1 +
 block/file-posix.c                            |  3 +
 block/gluster.c                               |  2 +
 block/qcow.c                                  |  1 +
 block/qcow2.c                                 |  1 +
 block/vhdx-log.c                              |  1 +
 block/vpc.c                                   |  1 +
 chardev/spice.c                               |  1 +
 hw/9pfs/9p-local.c                            |  1 +
 hw/9pfs/9p-proxy.c                            |  1 +
 hw/arm/msf2-soc.c                             |  1 +
 hw/arm/virt.c                                 |  2 +
 hw/core/loader-fit.c                          |  1 +
 hw/intc/arm_gicv3_kvm.c                       |  1 +
 hw/misc/msf2-sysreg.c                         |  1 +
 hw/pci-bridge/pcie_root_port.c                |  1 +
 hw/ppc/mac_newworld.c                         |  1 +
 hw/ppc/spapr.c                                |  1 +
 hw/ppc/spapr_pci.c                            |  1 +
 hw/rdma/vmw/pvrdma_main.c                     |  1 +
 hw/s390x/s390-ccw.c                           |  1 +
 hw/scsi/scsi-disk.c                           |  1 +
 hw/scsi/scsi-generic.c                        |  1 +
 hw/usb/ccid-card-emulated.c                   |  1 +
 hw/vfio/common.c                              |  2 +
 hw/vfio/pci.c                                 |  2 +
 hw/virtio/virtio-pci.c                        |  2 +
 migration/migration.c                         |  1 +
 monitor/hmp-cmds.c                            |  8 +--
 nbd/client.c                                  |  1 +
 nbd/server.c                                  |  1 +
 net/net.c                                     | 17 ++---
 qdev-monitor.c                                |  2 +
 target/ppc/kvm.c                              |  2 +
 ui/vnc.c                                      | 10 +--
 util/error.c                                  |  8 +--
 util/qemu-option.c                            |  2 +
 util/qemu-sockets.c                           |  2 +
 python/commit-per-subsystem.py                | 69 +++++++++++++++++++
 .../fix-error_append_hint-usage.cocci         | 25 +++++++
 44 files changed, 198 insertions(+), 26 deletions(-)
 create mode 100755 python/commit-per-subsystem.py
 create mode 100644 scripts/coccinelle/fix-error_append_hint-usage.cocci

CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Jeff Cody <codyprime@gmail.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Greg Kurz <groug@kaod.org>
CC: Subbaraya Sundeep <sundeep.lkml@gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Paul Burton <pburton@wavecomp.com>
CC: Aleksandar Rikalo <arikalo@wavecomp.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Eric Farman <farman@linux.ibm.com>
CC: Richard Henderson <rth@twiddle.net>
CC: David Hildenbrand <david@redhat.com>
CC: Halil Pasic <pasic@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@de.ibm.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: Michael Roth <mdroth@linux.vnet.ibm.com>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Eric Blake <eblake@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: "Daniel P. Berrangé" <berrange@redhat.com>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: qemu-block@nongnu.org
CC: qemu-devel@nongnu.org
CC: integration@gluster.org
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: qemu-s390x@nongnu.org

-- 
2.21.0

