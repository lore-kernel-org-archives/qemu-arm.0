Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp320161eja;
        Thu, 2 Nov 2023 04:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE277gDJb66yWNBJJYAUx1vEBX/fBbEwn/wrdSqMIluxF3s9FYhDqOvwE0oX9p2fC4inIuL
X-Received: by 2002:a05:6870:d88b:b0:1ea:1510:d8e0 with SMTP id oe11-20020a056870d88b00b001ea1510d8e0mr21971508oac.36.1698925283203;
        Thu, 02 Nov 2023 04:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925283; cv=none;
        d=google.com; s=arc-20160816;
        b=YGqFhLqCJpRl0aYf6lr6pMeBZrIgZWVjUbwW7yg/HxxqrlGC+3iYiEgCZNziwWn4YP
         eYZo23skQ6MOBtWZKL92ICb6R9KrREtWMTgnk0EiPLJp8mRfktohnWdObD3Hs1qCswxL
         wQuSy3oICGhCKUFAkugkmZNu8UmB4amU+BilflozK8p8qHCjSaIyB2aN/hIGPKxX+w60
         2MuuAX3sPqiwKAnX76gtcNee5Q4JlFLIAizT0EOLohTGuFVJuG1/mBLntsOiYZfnG1GR
         DiNIJMgkXQFbyLDGymDzTpv+yrSdm3qAFFsxoncea+/sh311nAJMmEqxUMTLgzPe6pfo
         +JjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WhT+P8/6U+nvarAERVRiWE+tWgt2ygDJenHlyXLV7rs=;
        fh=T4EM+6jbLn5eRwObk7JR2S+dK3nM2HMDfFhJxfrmv8w=;
        b=RTTS5fCrmS2M6rInpwesZFMJKGl5hohkDIGXXF/nST05U5jjgbgD/SMPNnPj5h14Zl
         aPEU2LZj+PjJ7H9PwOwN/lhguSjE9uUEjgrNOuvvdFPkXNxJ2wHpyMjSv3hvn3RZ3Vd7
         pSgVhDL3fT8Zzf9/gkigvmtaLvFx60tTw3WIJz4kHF2tMWwjAYywSUdWVIHXRKSi+oo1
         UvYLCAFY1CXQAWHURqJoVvRtGyKXUQk959TsDb0NbhG/ZCmphrZrcm8bIq+UljLvxc2l
         E+d6IXEXiEb3/BdxXQ+OpMEt07GxBMhR3OSbbyjovMAuYdMZgZRXevZumJqT2DmkaenZ
         YGTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YyY8FrZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020ac85cd0000000b0041972bc1dd8si4439789qta.93.2023.11.02.04.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YyY8FrZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW4Y-0001vO-Ti; Thu, 02 Nov 2023 07:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW4X-0001uM-Pq
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW4U-00044z-N7
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WhT+P8/6U+nvarAERVRiWE+tWgt2ygDJenHlyXLV7rs=;
 b=YyY8FrZhfwiSNzdqXnUVv4BtM4kkqa4I94RQZFsi2cYcDeXfeU5PjlAKcn+YC1pwq5xkSx
 cvJ7xGgnvcwNQC9F5V5A93iIrcCQcFDFPTgBT/WZWCxuis+gN7036U+pISJpKDEq/dAQUl
 4xwOzw2rEQA884Q57yghNevUFG41uWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-ecR3ctlSOKi1jNIWgYyUGA-1; Thu, 02 Nov 2023 07:41:05 -0400
X-MC-Unique: ecR3ctlSOKi1jNIWgYyUGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB338185A782;
 Thu,  2 Nov 2023 11:41:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8701A2026D4C;
 Thu,  2 Nov 2023 11:40:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 00/40] Migration 20231102 patches
Date: Thu,  2 Nov 2023 12:40:14 +0100
Message-ID: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YxPdMlWNu+/e

The following changes since commit 6c9ae1ce82b65faa3f266fd103729878cf11e07e:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-11-01 06:58:11 +0900)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20231102-pull-request

for you to fetch changes up to 8e3766eefbb4036cbc280c1f1a0d28537929f7fb:

  migration: modify test_multifd_tcp_none() to use new QAPI syntax. (2023-11-02 11:35:04 +0100)

----------------------------------------------------------------
Migration Pull request (20231102)

Hi

In this pull request:

- migration reboot mode (steve)
  * I disabled the test because our CI don't like programs using so
    much shared memory.  Searching for a fix.
- test for postcopy recover (fabiano)
- MigrateAddress QAPI (het)
- better return path error handling (peter)
- traces for downtime (peter)
- vmstate_register() check for duplicates (juan)
  thomas find better solutions for s390x and ipmi.
  now also works on s390x

Please, apply.

----------------------------------------------------------------

Fabiano Rosas (2):
  tests/migration-test: Add a test for postcopy hangs during RECOVER
  migration: Convert the file backend to the new QAPI syntax

Het Gala (10):
  migration: New QAPI type 'MigrateAddress'
  migration: convert migration 'uri' into 'MigrateAddress'
  migration: convert socket backend to accept MigrateAddress
  migration: convert rdma backend to accept MigrateAddress
  migration: convert exec backend to accept MigrateAddress.
  migration: New migrate and migrate-incoming argument 'channels'
  migration: modify migration_channels_and_uri_compatible() for new QAPI
    syntax
  migration: Implement MigrateChannelList to qmp migration flow.
  migration: Implement MigrateChannelList to hmp migration flow.
  migration: modify test_multifd_tcp_none() to use new QAPI syntax.

Juan Quintela (9):
  migration: Create vmstate_register_any()
  migration: Use vmstate_register_any()
  migration: Use vmstate_register_any() for isa-ide
  migration: Use VMSTATE_INSTANCE_ID_ANY for slirp
  migration: Hack to maintain backwards compatibility for ppc
  migration: Improve example and documentation of vmstate_register()
  migration: Use vmstate_register_any() for audio
  migration: Use vmstate_register_any() for eeprom93xx
  migration: Use vmstate_register_any() for vmware_vga

Peter Xu (9):
  migration: Check in savevm_state_handler_insert for dups
  migration: Set downtime_start even for postcopy
  migration: Add migration_downtime_start|end() helpers
  migration: Add per vmstate downtime tracepoints
  migration: migration_stop_vm() helper
  migration: Add tracepoints for downtime checkpoints
  migration: Refactor error handling in source return path
  migration: Allow network to fail even during recovery
  migration: Change ram_dirty_bitmap_reload() retval to bool

Steve Sistare (6):
  migration: mode parameter
  migration: per-mode blockers
  cpr: relax blockdev migration blockers
  cpr: relax vhost migration blockers
  cpr: reboot mode
  tests/qtest: migration: add reboot mode test

Thomas Huth (4):
  hw/ipmi: Don't call vmstate_register() from instance_init() functions
  hw/s390x/s390-skeys: Don't call register_savevm_live() during
    instance_init()
  hw/s390x/s390-stattrib: Simplify handling of the "migration-enabled"
    property
  hw/s390x/s390-stattrib: Don't call register_savevm_live() during
    instance_init()

 docs/devel/migration.rst            |  12 +-
 qapi/migration.json                 | 210 ++++++++++-
 include/hw/qdev-properties-system.h |   4 +
 include/migration/blocker.h         |  44 ++-
 include/migration/misc.h            |   1 +
 include/migration/vmstate.h         |  28 ++
 migration/exec.h                    |   8 +-
 migration/file.h                    |  10 +-
 migration/migration.h               |  14 +-
 migration/options.h                 |   1 +
 migration/qemu-file.h               |   1 +
 migration/ram.h                     |   5 +-
 migration/rdma.h                    |   6 +-
 migration/socket.h                  |   7 +-
 audio/audio.c                       |   2 +-
 backends/dbus-vmstate.c             |   3 +-
 backends/tpm/tpm_emulator.c         |   3 +-
 block/parallels.c                   |   2 +-
 block/qcow.c                        |   2 +-
 block/vdi.c                         |   2 +-
 block/vhdx.c                        |   2 +-
 block/vmdk.c                        |   2 +-
 block/vpc.c                         |   2 +-
 block/vvfat.c                       |   2 +-
 hw/core/qdev-properties-system.c    |  14 +
 hw/display/vmware_vga.c             |   2 +-
 hw/i2c/core.c                       |   2 +-
 hw/ide/isa.c                        |   2 +-
 hw/input/adb.c                      |   2 +-
 hw/input/ads7846.c                  |   2 +-
 hw/input/stellaris_input.c          |   3 +-
 hw/intc/xics.c                      |  18 +-
 hw/ipmi/ipmi_bmc_extern.c           |  29 +-
 hw/ipmi/isa_ipmi_bt.c               |  34 +-
 hw/ipmi/isa_ipmi_kcs.c              |  50 +--
 hw/net/eepro100.c                   |   3 +-
 hw/nvram/eeprom93xx.c               |   2 +-
 hw/pci/pci.c                        |   2 +-
 hw/ppc/spapr.c                      |  25 +-
 hw/ppc/spapr_nvdimm.c               |   3 +-
 hw/s390x/s390-skeys.c               |  36 +-
 hw/s390x/s390-stattrib.c            |  72 ++--
 hw/scsi/vhost-scsi.c                |   2 +-
 hw/timer/arm_timer.c                |   2 +-
 hw/virtio/vhost.c                   |   2 +-
 hw/virtio/virtio-mem.c              |   4 +-
 migration/exec.c                    |  74 ++--
 migration/file.c                    |  24 +-
 migration/migration-hmp-cmds.c      |  34 +-
 migration/migration.c               | 550 ++++++++++++++++++++--------
 migration/options.c                 |  21 ++
 migration/qemu-file.c               |   2 +-
 migration/ram.c                     |  61 +--
 migration/rdma.c                    |  33 +-
 migration/savevm.c                  |  95 ++++-
 migration/socket.c                  |  39 +-
 net/slirp.c                         |   5 +-
 stubs/migr-blocker.c                |  10 +
 system/vl.c                         |   2 +-
 tests/qtest/migration-test.c        | 150 +++++++-
 migration/trace-events              |   8 +-
 61 files changed, 1316 insertions(+), 476 deletions(-)

-- 
2.41.0

