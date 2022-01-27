Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4161491lfk;
        Thu, 27 Jan 2022 07:11:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyATfaIq6cmo8sYjzMRdLDRlRiOZwBwQW0jxSpizfQOCmVBOBUTktu3lMlqYt+hh9EiKyJp
X-Received: by 2002:ac5:c3cf:: with SMTP id t15mr1679820vkk.29.1643296291217;
        Thu, 27 Jan 2022 07:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643296291; cv=none;
        d=google.com; s=arc-20160816;
        b=RCQNBF8aQJHAFW9Wc0IsfvcQp4s346+YUhFfMEBjzyfqrcInm1bfd6YLAp3o4aOSU2
         2NdFy48uiFuhZ/xQ3GMOEWkq5H+AHt596wQzhnJ9rQMgxUXQNNvSJkSKRZIE5IMp0s5d
         TLA9cpU5yDu5uzYVcwzJZOgzy0agyQKzOcJ1rlzXmGF9lo0YOwaUSvci9NpWemV7xNVx
         ZOu4qmMXF9BCDUfy2SKx5vXVG1mX1XYF1Bunmpf3Xyul7u8Hd2enmsWUdFG4YEjAdh24
         nP7PhFDerVBUOn3WZCZSeUTVZKi6X3p0L8944EqATLW9JaJYpw4/lMmnuGxJgjfvu9fd
         UPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=dUe6MFDlmu15VfgDseddfdQEGxnIRUSrsyYoORC8GY4=;
        b=kMb3jMuoyAphX2urNI/2Y3UprPCvQ5+fgARCJMjFbD0kIl4N/iFWHB2uQTL+smBsGo
         khAw2MNpv9Xtvy98ZvKPTo1jbzg6L8EtSivpCGaUV3YQ3knEoXCg0pLx53YKxWvP3ghy
         S4U+l/jTiSvzQ86nW29n3OrWYBfNIyP3u1bVCw9Zj/cmAb8+5Inj0VtIMR2sgNYH4Ray
         hWfGRqOjdRi7ri0sQnNmPSXSt+sQGFSM1lPxE8X3zmI+rZZWqwoJFFUd5tQ21+GBkM+T
         97IZa4lxbGgC+COEFBTIpvmRBpbbXp4PgdmROl8YHie6cf53hFSfb+d7W17XVunMHidi
         Gj4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iAEj+nzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24si1793386vsi.173.2022.01.27.07.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:11:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iAEj+nzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6Qs-0002fi-8M
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Lf-0007Bl-LX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Ld-0001ZI-Iw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643295965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dUe6MFDlmu15VfgDseddfdQEGxnIRUSrsyYoORC8GY4=;
 b=iAEj+nzS3VdhKq9TQn8zPmq9f1xBlddUINpelp8YKZc/2ByrTBRh5xlDUU6Uq8NqfRw/Y2
 fX/ShNEpK09DNJ+bcmik4m7QCvYFiKsEB9IjP6tr6kzDk9979EkMFQrb8s+V1SESOgUIZc
 3FXLSqp0ay0G4SqdcZNgEo1YH41/zfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-0e4G6XsoPO2XwD6HlX9MNw-1; Thu, 27 Jan 2022 10:06:01 -0500
X-MC-Unique: 0e4G6XsoPO2XwD6HlX9MNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08F4283DD24;
 Thu, 27 Jan 2022 15:05:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7219770D2D;
 Thu, 27 Jan 2022 15:05:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/38] Migration 20220127 patches
Date: Thu, 27 Jan 2022 16:05:10 +0100
Message-Id: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: toh7EbQywDqK

The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-=
20220126' into staging (2022-01-26 10:59:50 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/juan.quintela/qemu.git tags/migration-20220127-pull-re=
quest=0D
=0D
for you to fetch changes up to 4e29a822de430e8d0d8bf5c61aaff0561a713d84:=0D
=0D
  migration: Move temp page setup and cleanup into separate functions (2022=
-01-27 13:37:55 +0100)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
Hi=0D
=0D
This pull request includes every patch ack'd on the list for migration.  In=
 no particular order:=0D
=0D
- ram_transferred_add() - (Edmondson)=0D
- vmstate canary (dgilbert)=0D
- minimum_version_id_old removal (peter maydell)=0D
- postcopy cleanups (peter xu)=0D
- more cleanups (Philippe)=0D
- yet more cleanups (zheng)=0D
- colo and cleanups (zhang)=0D
=0D
Please, Apply.=0D
=0D
----------------------------------------------------------------=0D
=0D
David Edmondson (3):=0D
  migration: Report the error returned when save_live_iterate fails=0D
  migration: Introduce ram_transferred_add()=0D
  migration: Tally pre-copy, downtime and post-copy bytes independently=0D
=0D
Dr. David Alan Gilbert (2):=0D
  migration: Add canary to VMSTATE_END_OF_LIST=0D
  migration: Perform vmsd structure check during tests=0D
=0D
Juan Quintela (17):=0D
  migration: All this fields are unsigned=0D
  migration: We only need last_stage in two places=0D
  migration: ram_release_pages() always receive 1 page as argument=0D
  migration: Remove masking for compression=0D
  migration: simplify do_compress_ram_page=0D
  migration: Move ram_release_pages() call to save_zero_page_to_file()=0D
  multifd: Use proper maximum compression values=0D
  multifd: Move iov from pages to params=0D
  multifd: Make zlib use iov's=0D
  multifd: Make zstd use iov's=0D
  multifd: Remove send_write() method=0D
  multifd: Use a single writev on the send side=0D
  multifd: Unfold "used" variable by its value=0D
  multifd: Use normal pages array on the send side=0D
  multifd: Use normal pages array on the recv side=0D
  multifd: recv side only needs the RAMBlock host address=0D
  multifd: Rename pages_used to normal_pages=0D
=0D
Peter Maydell (1):=0D
  Remove unnecessary minimum_version_id_old fields=0D
=0D
Peter Xu (10):=0D
  migration: Drop dead code of ram_debug_dump_bitmap()=0D
  migration: Don't return for postcopy_chunk_hostpages()=0D
  migration: Drop postcopy_chunk_hostpages()=0D
  migration: Do chunk page in postcopy_each_ram_send_discard()=0D
  migration: Drop return code for disgard ram process=0D
  migration: No off-by-one for pss->page update in host page size=0D
  migration: Enable UFFD_FEATURE_THREAD_ID even without blocktime feat=0D
  migration: Add postcopy_has_request()=0D
  migration: Simplify unqueue_page()=0D
  migration: Move temp page setup and cleanup into separate functions=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  migration: Don't return for postcopy_send_discard_bm_ram()=0D
=0D
Xu Zheng (1):=0D
  migration/ram: clean up unused comment.=0D
=0D
Zhang Chen (3):=0D
  migration/migration.c: Add missed default error handler for migration=0D
    state=0D
  migration/migration.c: Avoid COLO boot in postcopy migration=0D
  migration/migration.c: Remove the MIGRATION_STATUS_ACTIVE when=0D
    migration finished=0D
=0D
 qapi/migration.json           |  13 +-=0D
 include/migration/vmstate.h   |   7 +-=0D
 migration/multifd.h           |  33 ++--=0D
 migration/ram.h               |   4 +-=0D
 hw/acpi/cpu.c                 |   2 -=0D
 hw/acpi/ich9.c                |   3 -=0D
 hw/acpi/memory_hotplug.c      |   2 -=0D
 hw/acpi/piix4.c               |   2 -=0D
 hw/acpi/tco.c                 |   1 -=0D
 hw/audio/pcspk.c              |   1 -=0D
 hw/display/macfb.c            |   1 -=0D
 hw/dma/xlnx-zdma.c            |   1 -=0D
 hw/dma/xlnx_csu_dma.c         |   1 -=0D
 hw/gpio/imx_gpio.c            |   1 -=0D
 hw/misc/bcm2835_mbox.c        |   1 -=0D
 hw/net/can/can_kvaser_pci.c   |   1 -=0D
 hw/net/can/can_mioe3680_pci.c |   1 -=0D
 hw/net/can/can_pcm3680_pci.c  |   1 -=0D
 hw/net/can/can_sja1000.c      |   2 -=0D
 hw/net/can/ctucan_core.c      |   2 -=0D
 hw/net/can/ctucan_pci.c       |   1 -=0D
 hw/ppc/ppc.c                  |   1 -=0D
 hw/scsi/megasas.c             |   1 -=0D
 hw/scsi/mptsas.c              |   1 -=0D
 hw/virtio/virtio-mmio.c       |   1 -=0D
 hw/virtio/virtio-pci.c        |   1 -=0D
 hw/virtio/virtio.c            |   1 -=0D
 migration/migration.c         |  26 ++-=0D
 migration/multifd-zlib.c      |  61 +++----=0D
 migration/multifd-zstd.c      |  63 +++-----=0D
 migration/multifd.c           | 148 ++++++++---------=0D
 migration/postcopy-ram.c      |  96 ++++++-----=0D
 migration/ram.c               | 291 ++++++++++++----------------------=0D
 migration/savevm.c            |  45 +++++-=0D
 migration/vmstate.c           |   2 +=0D
 monitor/hmp-cmds.c            |  12 ++=0D
 target/openrisc/machine.c     |   1 -=0D
 target/ppc/machine.c          |   2 -=0D
 target/sparc/machine.c        |   4 -=0D
 migration/trace-events        |  29 ++--=0D
 40 files changed, 398 insertions(+), 469 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D

