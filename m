Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2013829ejc;
        Wed, 24 Aug 2022 02:40:43 -0700 (PDT)
X-Received: by 2002:aa7:88c6:0:b0:537:9d6:2c76 with SMTP id k6-20020aa788c6000000b0053709d62c76mr5652333pff.41.1661334043602;
        Wed, 24 Aug 2022 02:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661334043; cv=none;
        d=google.com; s=arc-20160816;
        b=qjVeXmUIj8bbzqsRq33CDh6AaAIT4vz5AwSqzCd/8RCiJmDAETu5p+Blivp80D00ld
         HbAOW0LgcNuTQpboqWuQ8GdEFtnyTrbNNSXmXA+KBuwCC0o15IQGe3T8VmbK/8qa4lcR
         wjBvrbpufm2SRDPIuc3aHUMyjPFMI7gTwdJAxmitMndbNAh0j9gQ6rU9kFFFGOcwsywb
         rzcJTPQkYA2Tnu6kMXkW+rTn3qeL2UqRoB2mxwBqSIarH27VBVGAwZVBtO9B2jALZlBu
         yp+fzKkhTvza/drbZMLrSzyinVoSO+7kQqiY/Qu9UKEkAtzv/ZSX2I/3bM9WkvxET60j
         gG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=xZ1STzqzVyE8e3GIXlbfpcBakVQpvSLsxTiPOgOYGl8=;
        b=PRMQBQAEer26pPXf2GSJ5N2ULgU62u0edLzhuRwNx8Oy5Im7hfonUEZh6GNMilpx2d
         QtkXXhp1XqdBmtUICTaZ+jtmEjvgbFcXYTRiDCCqNTGbkSXnN/e72y3Pr8d1mhfS2x5i
         XJYuIJUc5Ggue/qd9dTw775IoIrb+cVRTCBX6iLeJqj4qjQtLTzvw469FGvGM0lavtiv
         /j3nUM7368/YV5/Zlm02F5fwiiEniO13V+j4Jty982+LIIvxnO5W+d09rK2MvL5hg1r0
         8/YyEHYmj4HrvcPJ/T0tBXwQLt0J2JQUkI2FP+DnCIh7vy4BwDWb535KyC37iffitT/N
         2Q2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOnfuZKd;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x22-20020a656ab6000000b0040c74303958sor7593701pgu.57.2022.08.24.02.40.43
        (Google Transport Security);
        Wed, 24 Aug 2022 02:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOnfuZKd;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=xZ1STzqzVyE8e3GIXlbfpcBakVQpvSLsxTiPOgOYGl8=;
        b=dOnfuZKd0SF0sM88hkaUfu1QlqRUzSpfJb0Tb7pHqcBuKqiws3QLYaV0WybqYNa7uN
         UJDBunX1m7NsDQMaxg0eq+qPSPj3a8i/fq1rYZmXxjrK4xeMU3XMzYpTVDlVE29ziS/C
         nJIKXpkHMrIOvLuO7F7fl26L9FWae2YfPPwA00UFCYqy+q3LxyNsAT/UCu8nZxPWHwHL
         TrtnN6Fxslss3QUg5t8KoLda8xI0fWhX5K/9NhENQAl1p6AReGvBtSct+PLMqP/Z2Oe3
         iVbHHzDcs7TXFwStUD4B5ffLWLSdFCi4BZWj3eZIiVPidm7y7X6a2EOz4wmfhdg8MRFY
         OTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=xZ1STzqzVyE8e3GIXlbfpcBakVQpvSLsxTiPOgOYGl8=;
        b=GSJ2P8iCopfGWmzw/q+1p/g8yAm6WNDv0sBrsOAwM0wR+fXovf5Hkq+ChpE74KvswF
         wHdg3IFr/nyxJZf7+VvB1ybLee5dIRw3waq54rbIf2NS7l9h/QoC52fHL8EhnMDpGfLu
         QtVkU2HH3RlnbF3JlrRnZSfXFzNL2sBtiyVWOc+KB4ebq6MPTGqsqDVDmOD/Hxd3jhKM
         vve4rH1K8shM0PlO1/j64dEXppPJzcZG1n3mSNMs+SX8QbKKLJ99alKLE9207T8ZiKK0
         kbhzD+0TmAM5iTysBFRuB08vvMXsPAxyUF+tc6lDeNoA1Ob1V0AMC3q7OLnVs3cHkJLM
         zkuw==
X-Gm-Message-State: ACgBeo1S63lVYU0urjA6MSGqNAmPKXLAyuoUJCi2mbI+xBeEhd/+FBYE
	NKhnMDwIgL8BGLR+h7Tph+A=
X-Google-Smtp-Source: AA6agR6pq0HSjFj7TegvFFgYLOCtAp7I3Vh3ZOT9H0f/NXGeKEA8bkSuZpufqQHzRM2AdiKY6jy4PA==
X-Received: by 2002:a63:90c8:0:b0:41d:f6f6:49cc with SMTP id a191-20020a6390c8000000b0041df6f649ccmr19463239pge.223.1661334043135;
        Wed, 24 Aug 2022 02:40:43 -0700 (PDT)
Return-Path: <bmeng.cn@gmail.com>
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 02:40:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Bulekov <alxndr@bu.edu>,
	Andrew Jeffery <andrew@aj.id.au>,
	Ani Sinha <ani@anisinha.ca>,
	Bandan Das <bsd@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	John Snow <jsnow@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 00/51] tests/qtest: Enable running qtest on Windows
Date: Wed, 24 Aug 2022 17:39:38 +0800
Message-Id: <20220824094029.1634519-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3JP2ghel1fPT

In prepartion to adding virtio-9p support on Windows, this series
enables running qtest on Windows, so that we can run the virtio-9p
tests on Windows to make sure it does not break accidently.

Patch 1-22 updates various components (mostly test cases) so that
they can build on Windows with the same functionality.

Patch 23 supports the qtest accelerator for Windows.

Patch 31 updates the libqtest core for Windows.

Patch 32-47 are the fixes of qtest errors exposed when running on Windows.

Patch 49 fixes the instability of running qtests on Windows.

Patch 50 updates the CI to run qtests on Windows.

Patch 51 documents best practices of writing portable test cases as
we learned during the enablement of running qtest on Windows.

Based-on: <20220802075200.907360-1-bmeng.cn@gmail.com>


Bin Meng (41):
  tests/qtest: Use g_setenv()
  tests/qtest: Use g_mkdtemp()
  block: Unify the get_tmp_filename() implementation
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  tests: Avoid using hardcoded /tmp in test cases
  block/vvfat: Unify the mkdir() call
  fsdev/virtfs-proxy-helper: Use g_mkdir_with_parents()
  hw/usb: dev-mtp: Use g_mkdir_with_parents()
  qga/commands-posix-ssh: Use g_mkdir_with_parents()
  tests: Use g_mkdir_with_parents()
  tests/qtest: migration-test: Handle link() for win32
  backends/tpm: Exclude headers and macros that don't exist on win32
  tests/qtest: Adapt {m48t59,rtc}-test cases for win32
  tests/qtest: Build e1000e-test for posix only
  tests/qtest: Build virtio-net-test for posix only
  tests/qtest: Build cases that use memory-backend-file for posix only
  tests/qtest: Build test-filter-{mirror,redirector} cases for posix
    only
  tests/qtest: i440fx-test: Skip running request_{bios,pflash} for win32
  tests/qtest: migration-test: Skip running test_migrate_fd_proto on
    win32
  tests/qtest: qmp-test: Skip running test_qmp_oob for win32
  tests/qtest: libqtest: Exclude the *_fds APIs for win32
  tests/qtest: libqtest: Install signal handler via signal()
  tests: Skip iotests and qtest when '--without-default-devices'
  tests/qtest: Support libqtest to build and run on Windows
  tests/qtest: Fix ERROR_SHARING_VIOLATION for win32
  tests/qtest: {ahci,ide}-test: Use relative path for temporary files
  tests/qtest: bios-tables-test: Adapt the case for win32
  tests/qtest: device-plug-test: Reverse the usage of double/single
    quotes
  tests/qtest: machine-none-test: Use double quotes to pass the cpu
    option
  tests/qtest: migration-test: Disable IO redirection for win32
  tests/qtest: npcm7xx_emc-test: Skip running test_{tx,rx} on win32
  tests/qtest: microbit-test: Fix socket access for win32
  tests/qtest: prom-env-test: Use double quotes to pass the prom-env
    option
  tests/qtest: libqtest: Replace the call to close a socket with
    closesocket()
  tests/qtest: libqtest: Correct the timeout unit of blocking receive
    calls for win32
  io/channel-watch: Drop a superfluous '#ifdef WIN32'
  io/channel-watch: Fix socket watch on Windows
  .gitlab-ci.d/windows.yml: Increase the timeout to the runner limit
  docs/devel: testing: Document writing portable test cases

Xuzhou Cheng (10):
  accel/qtest: Support qtest accelerator for Windows
  tests/qtest: libqos: Drop inclusion of <sys/wait.h>
  tests/qtest: libqos: Rename malloc.h to libqos-malloc.h
  tests/qtest: libqtest: Move global_qtest definition back to libqtest.c
  tests/qtest: Use send/recv for socket communication
  tests/qtest: {ahci,ide}-test: Open file in binary mode
  tests/qtest: virtio-net-failover: Disable migration tests for win32
  chardev/char-file: Add FILE_SHARE_WRITE when openning the file for
    win32
  tests/qtest: migration-test: Kill "to" after migration is canceled
  hw/ppc: spapr: Use qemu_vfree() to free spapr->htab

 docs/devel/testing.rst                        |  30 ++++
 backends/tpm/tpm_ioctl.h                      |   4 +
 include/hw/core/cpu.h                         |   1 +
 tests/qtest/fuzz/generic_fuzz_configs.h       |   8 +-
 tests/qtest/libqos/generic-pcihost.h          |   2 +-
 .../libqos/{malloc.h => libqos-malloc.h}      |   0
 tests/qtest/libqos/libqos.h                   |   2 +-
 tests/qtest/libqos/malloc-pc.h                |   2 +-
 tests/qtest/libqos/malloc-spapr.h             |   2 +-
 tests/qtest/libqos/pci-pc.h                   |   2 +-
 tests/qtest/libqos/pci-spapr.h                |   2 +-
 tests/qtest/libqos/qgraph.h                   |   2 +-
 tests/qtest/libqos/qos_external.h             |   2 +-
 tests/qtest/libqos/rtas.h                     |   2 +-
 tests/qtest/libqos/virtio.h                   |   2 +-
 tests/qtest/libqtest-single.h                 |   2 +-
 tests/qtest/libqtest.h                        |   8 +
 tests/qtest/migration-helpers.h               |   2 +
 accel/dummy-cpus.c                            |  14 +-
 block.c                                       |  16 +-
 block/vvfat.c                                 |   8 +-
 chardev/char-file.c                           |   4 +-
 fsdev/virtfs-proxy-helper.c                   |   2 +-
 hw/ppc/spapr.c                                |   2 +-
 hw/usb/dev-mtp.c                              |   2 +-
 io/channel-watch.c                            |   6 -
 qga/commands-posix-ssh.c                      |   2 +-
 semihosting/arm-compat-semi.c                 |   3 +-
 softmmu/cpus.c                                |   9 +-
 tcg/tcg.c                                     |   4 +-
 tests/migration/stress.c                      |   2 +-
 tests/qtest/ahci-test.c                       |  44 ++++-
 tests/qtest/aspeed_smc-test.c                 |   4 +-
 tests/qtest/bios-tables-test.c                |  22 ++-
 tests/qtest/boot-serial-test.c                |  21 ++-
 tests/qtest/cdrom-test.c                      |   2 +-
 tests/qtest/cxl-test.c                        |  19 +-
 tests/qtest/device-plug-test.c                |   2 +-
 tests/qtest/e1000e-test.c                     |   2 +-
 tests/qtest/fdc-test.c                        |   4 +-
 tests/qtest/fuzz/generic_fuzz.c               |   8 +-
 tests/qtest/fuzz/qos_fuzz.c                   |   2 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c            |   2 +-
 tests/qtest/hd-geo-test.c                     |   8 +-
 tests/qtest/i440fx-test.c                     |   6 +
 tests/qtest/ide-test.c                        |  26 ++-
 tests/qtest/ivshmem-test.c                    |   4 +-
 tests/qtest/libqmp.c                          |   4 +-
 .../libqos/aarch64-xlnx-zcu102-machine.c      |   2 +-
 tests/qtest/libqos/arm-imx25-pdk-machine.c    |   2 +-
 tests/qtest/libqos/arm-n800-machine.c         |   2 +-
 tests/qtest/libqos/arm-raspi2-machine.c       |   2 +-
 tests/qtest/libqos/arm-sabrelite-machine.c    |   2 +-
 tests/qtest/libqos/arm-smdkc210-machine.c     |   2 +-
 tests/qtest/libqos/arm-virt-machine.c         |   2 +-
 .../qtest/libqos/arm-xilinx-zynq-a9-machine.c |   2 +-
 tests/qtest/libqos/e1000e.c                   |   2 +-
 .../libqos/{malloc.c => libqos-malloc.c}      |   2 +-
 tests/qtest/libqos/libqos.c                   |   2 -
 tests/qtest/libqos/qos_external.c             |   2 +-
 tests/qtest/libqos/virtio-9p.c                |   4 +-
 tests/qtest/libqos/virtio-mmio.c              |   2 +-
 tests/qtest/libqos/virtio-pci.c               |   2 +-
 tests/qtest/libqtest.c                        | 164 +++++++++++++++---
 tests/qtest/m48t59-test.c                     |   2 +-
 tests/qtest/machine-none-test.c               |   2 +-
 tests/qtest/microbit-test.c                   |  10 +-
 tests/qtest/migration-helpers.c               |   2 +
 tests/qtest/migration-test.c                  |  69 +++++---
 tests/qtest/npcm7xx_emc-test.c                |   8 +
 tests/qtest/pflash-cfi02-test.c               |   7 +-
 tests/qtest/prom-env-test.c                   |   4 +-
 tests/qtest/qmp-test.c                        |  14 +-
 tests/qtest/qos-test.c                        |   2 +-
 tests/qtest/rtc-test.c                        |   2 +-
 tests/qtest/vhost-user-blk-test.c             |   3 +-
 tests/qtest/vhost-user-test.c                 |   7 +-
 tests/qtest/virtio-blk-test.c                 |   2 +-
 tests/qtest/virtio-net-failover.c             |   9 +-
 tests/qtest/virtio-net-test.c                 |   6 -
 tests/qtest/virtio-scsi-test.c                |   3 +-
 tests/unit/test-crypto-tlscredsx509.c         |   4 +-
 tests/unit/test-crypto-tlssession.c           |   6 +-
 tests/unit/test-image-locking.c               |   6 +-
 tests/unit/test-io-channel-tls.c              |   6 +-
 tests/unit/test-qga.c                         |   4 +-
 tests/vhost-user-bridge.c                     |   3 +-
 util/qemu-sockets.c                           |   5 +-
 .gitlab-ci.d/windows.yml                      |   4 +-
 accel/meson.build                             |   1 +
 accel/qtest/meson.build                       |   1 +
 tests/qemu-iotests/meson.build                |   5 +
 tests/qtest/libqos/meson.build                |   2 +-
 tests/qtest/meson.build                       |  46 +++--
 94 files changed, 549 insertions(+), 221 deletions(-)
 rename tests/qtest/libqos/{malloc.h => libqos-malloc.h} (100%)
 rename tests/qtest/libqos/{malloc.c => libqos-malloc.c} (99%)

-- 
2.34.1
