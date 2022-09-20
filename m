Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1687301ejy;
        Tue, 20 Sep 2022 03:32:14 -0700 (PDT)
X-Received: by 2002:a63:df50:0:b0:439:286e:b9f4 with SMTP id h16-20020a63df50000000b00439286eb9f4mr20051706pgj.416.1663669933944;
        Tue, 20 Sep 2022 03:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663669933; cv=none;
        d=google.com; s=arc-20160816;
        b=cqUCfUSV/vuHY9j6EvquVe7fi5uc8qLkjEWyYxAaCvcGau+yGKUnhsk5oXLKHW70BG
         WMkNVzVbtib1CPK1jCIa7D3gpIXyhC3rsWIWjLIV65o01tfcW2NrajcNj8HtmM2f8lva
         s/Wm8XK9n3Z0IV1EpJ3Kt7PzBj22Yb28Cgljx+nM2m4pNyhZlVrZvTNMMIuJuX9MdYwA
         xDzDRlFJXCBIoAlck7T6C1HuAYyLSacDRb7LtqrOUOWav/0HSN+uZjBiBaXy4xBpH9oH
         XBHzNC8NQdqw7pqVO86u6WE+8vUjfd0a6yvmKipuccw9h1CJUs/rUHVsrwzu6wafw1ja
         Vwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=RXO5DDO/Y9cztgXu+tQjNAdDe1mg0NE64fWstEgYTpo=;
        b=0Iao2qOSqxbtKn+IQ8KhE6uNtcmB7Kh+BILy0dE1Q8SdUnprxPZqgkSkwNirBJiFpo
         7YegcQI2QM9qtSDeSLS/mOWCbfKI4Lg4Nzzajse48+oXRTMIsaCigoXqUkhHxIsb42wC
         2OTJBiri0Z2QbDM8GZUypEKYp47yNrJSoT++SqgCZXwzEnZyMDYhMBTeDWjvpoRxEMov
         kXhlFkgOuh0G267LwKCm0YqCwmOYm2ULXFmIlSz6tA3A2kEp8XxNkjv3N19WqaKPDDe0
         IBssChj9b1DWdpef/rl5l+zFxLH+kds1fKSNDDJVbxRpOxSUOVR9SMCvKbkiZMbLuAih
         eLhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=au1hKA7I;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k6-20020a17090a514600b00200ae9267c3sor4471106pjm.17.2022.09.20.03.32.13
        (Google Transport Security);
        Tue, 20 Sep 2022 03:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=au1hKA7I;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RXO5DDO/Y9cztgXu+tQjNAdDe1mg0NE64fWstEgYTpo=;
        b=au1hKA7IsDt3IhzyRlLtgitvSEtBfYlUyJ+glJ6VHzmYzB2OYsyYA/dg8pEnSQimzD
         ItARv6xREbjlBiDemr4GqIsv20bhya7SeaIOyeQh0vEnK+ZU7G9pTbewGB/iY/IiGqc1
         uQ0s0z5lyFUYzo6KXhrYYlmP5SMu5Z3CKUkjFNCxe1OuwTI6oYSbiLqYz2Sf0QgWDNeE
         Ni2rKYSIMqTucJ/i+3s72Uu519yOv4o3cR6h3BuUsB1MJQc0DpZz/MoKnLEauJIninS8
         m0UvzPZjvOj2Mny004NHYq2zAEjSq7ni9LQKnotLqYZCMBuy+B47c+P6WQfo+/2115lR
         vWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RXO5DDO/Y9cztgXu+tQjNAdDe1mg0NE64fWstEgYTpo=;
        b=35aYiO/LwmM4uEOCMv2KwtDe31xDoP/jvj+JVI5fIexKh4Ds1W1siL2djPJeR7yIOl
         dluvV99GHSz+j2G6El0cJYKF7GuzDPSm+sOjz1/2lxMjEFLaqQ6DMVb5+Ve3G/nF7gSC
         pgMUnaSO8BC813hsZbYRwhR74F3SJO9VVzJ7lxX35xJ4xEo4qd83HOXWlJkltC3lfiiF
         umf8HiR+FwpTeoEkprBnMIVU1yrpKoZdI5tDyOysIG2Jct0Zu8g3YpforyO4VNPCy/sK
         zqWDL4zNaphd8G0FNON788+tAm3SuJlNFWQOZO3hWSJudxJQKI8MKOStmqKQLl20CaAN
         QFqw==
X-Gm-Message-State: ACrzQf0oFddhqzb4Ud6mpYL4dL8dqDz4tPflwEISi4jO72P6BBDglbGL
	+UhV3IEktNah0MPYRbA9zlQ=
X-Google-Smtp-Source: AMsMyM6bjaJ7R7QuwM+HGpleC2zShsFnSLm8DEe9HHKt3mILnttp3ivrHJd99ImCBAMYj5lk4lSQGQ==
X-Received: by 2002:a17:90b:35cf:b0:202:6f3d:53a7 with SMTP id nb15-20020a17090b35cf00b002026f3d53a7mr3252967pjb.63.1663669933444;
        Tue, 20 Sep 2022 03:32:13 -0700 (PDT)
Return-Path: <bmeng.cn@gmail.com>
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 03:32:13 -0700 (PDT)
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
	Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Hanna Reitz <hreitz@redhat.com>,
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
	Stefan Hajnoczi <stefanha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 00/39] tests/qtest: Enable running qtest on Windows
Date: Tue, 20 Sep 2022 18:31:20 +0800
Message-Id: <20220920103159.1865256-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9SmlGRRDcKST

In preparation to adding virtio-9p support on Windows, this series
enables running qtest on Windows, so that we can run the virtio-9p
tests on Windows to make sure it does not break accidently.

Changes in v2:
- new patch: "tests: Change to use g_mkdir()"
- new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable"
- Use g_autofree to declare the variable
- Use g_dir_make_tmp(), g_file_open_tmp() when appropriate
- Change to use g_mkdir()
- Change to use g_mkdir()
- Change to use g_mkdir()
- Change to skip only part of the virtio-net-test cases that require
  socketpair() intead of disabling all of them
- Introduce a new variable qtests_filter and add that to the
  qtests_ARCH variables
- Add a comment in the code to explain why test_qmp_oob test case
  is skipped on win32
- Replace signal by the semaphore on posix too
- Use __declspec(selectany) for the common weak symbol on Windows
- Introduce qemu_send_full() and use it
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call
- Change the place that sets IO redirection in the command line
- Drop ahci-test.c changes that are no longer needed
- Update commit message to include the use case why we should set
  FILE_SHARE_WRITE when openning the file for win32
- Change to a busy wait after migration is canceled
- new patch: "hw/pci-host: pnv_phb{3,4}: Fix heap out-of-bound access failure"
- new patch: "io/channel-watch: Drop the unnecessary cast"
- Change the timeout limit to 90 minutes
- new patch: Display meson test logs in the Windows CI
- new patch: "tests/qtest: Enable qtest build on Windows"
- Minor wording changes
- Drop patches that were already applied in the mainline
- Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
- Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
- Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"

Bin Meng (30):
  tests: Change to use g_mkdir()
  tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable
  block: Unify the get_tmp_filename() implementation
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  tests: Avoid using hardcoded /tmp in test cases
  block/vvfat: Unify the mkdir() call
  fsdev/virtfs-proxy-helper: Use g_mkdir()
  hw/usb: dev-mtp: Use g_mkdir()
  tests/qtest: Skip running virtio-net-test cases that require
    socketpair() for win32
  tests/qtest: Build test-filter-{mirror,redirector} cases for posix
    only
  tests/qtest: qmp-test: Skip running test_qmp_oob for win32
  tests/qtest: libqtest: Exclude the *_fds APIs for win32
  tests/qtest: libqtest: Install signal handler via signal()
  tests/qtest: Support libqtest to build and run on Windows
  tests/qtest: {ahci,ide}-test: Use relative path for temporary files
    for win32
  tests/qtest: bios-tables-test: Adapt the case for win32
  tests/qtest: migration-test: Disable IO redirection for win32
  tests/qtest: microbit-test: Fix socket access for win32
  tests/qtest: libqtest: Replace the call to close a socket with
    closesocket()
  tests/qtest: libqtest: Correct the timeout unit of blocking receive
    calls for win32
  io/channel-watch: Drop a superfluous '#ifdef WIN32'
  io/channel-watch: Drop the unnecessary cast
  io/channel-watch: Fix socket watch on Windows
  tests/qtest: migration-test: Skip running some TLS cases for win32
  .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
  .gitlab-ci.d/windows.yml: Display meson test logs
  tests/qtest: Enable qtest build on Windows
  docs/devel: testing: Document writing portable test cases

Xuzhou Cheng (9):
  accel/qtest: Implement a portable qtest accelerator
  tests/qtest: libqtest: Adapt global_qtest declaration for win32
  tests/qtest: Use send/recv for socket communication
  tests/qtest: ide-test: Open file in binary mode
  tests/qtest: virtio-net-failover: Disable migration tests for win32
  chardev/char-file: Add FILE_SHARE_WRITE when openning the file for
    win32
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled
  hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
  hw/pci-host: pnv_phb{3,4}: Fix heap out-of-bound access failure

 docs/devel/testing.rst                  |  30 +++++
 include/hw/core/cpu.h                   |   1 +
 include/qemu/sockets.h                  |   2 +
 tests/qtest/fuzz/generic_fuzz_configs.h |   4 +-
 tests/qtest/libqtest-single.h           |   4 +
 tests/qtest/libqtest.h                  |   8 ++
 accel/dummy-cpus.c                      |  15 +--
 block.c                                 |  16 +--
 block/vvfat.c                           |   9 +-
 chardev/char-file.c                     |   4 +-
 fsdev/virtfs-proxy-helper.c             |   3 +-
 hw/pci-host/pnv_phb3.c                  |   1 +
 hw/pci-host/pnv_phb4.c                  |   1 +
 hw/ppc/spapr.c                          |   2 +-
 hw/usb/dev-mtp.c                        |   4 +-
 io/channel-watch.c                      |  12 +-
 semihosting/arm-compat-semi.c           |   3 +-
 softmmu/cpus.c                          |  10 +-
 tcg/tcg.c                               |   3 +-
 tests/migration/stress.c                |   3 +-
 tests/qtest/ahci-test.c                 |  36 ++++--
 tests/qtest/aspeed_smc-test.c           |   5 +-
 tests/qtest/bios-tables-test.c          |  12 +-
 tests/qtest/boot-serial-test.c          |   9 +-
 tests/qtest/cxl-test.c                  |  15 +--
 tests/qtest/fdc-test.c                  |   5 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c      |   4 +-
 tests/qtest/hd-geo-test.c               |  24 ++--
 tests/qtest/i440fx-test.c               |  53 +++-----
 tests/qtest/ide-test.c                  |  30 ++++-
 tests/qtest/libqmp.c                    |   5 +-
 tests/qtest/libqtest.c                  | 157 ++++++++++++++++++++----
 tests/qtest/microbit-test.c             |  10 +-
 tests/qtest/migration-test.c            |  41 ++++++-
 tests/qtest/pflash-cfi02-test.c         |   8 +-
 tests/qtest/qmp-test.c                  |  13 +-
 tests/qtest/vhost-user-blk-test.c       |   3 +-
 tests/qtest/vhost-user-test.c           |   8 +-
 tests/qtest/virtio-blk-test.c           |   4 +-
 tests/qtest/virtio-net-failover.c       |   9 +-
 tests/qtest/virtio-net-test.c           |  13 +-
 tests/qtest/virtio-scsi-test.c          |   4 +-
 tests/unit/test-crypto-tlscredsx509.c   |   5 +-
 tests/unit/test-crypto-tlssession.c     |   7 +-
 tests/unit/test-image-locking.c         |   8 +-
 tests/unit/test-io-channel-tls.c        |   7 +-
 tests/unit/test-qga.c                   |   2 +-
 tests/vhost-user-bridge.c               |   3 +-
 util/osdep.c                            |  33 +++++
 util/qemu-sockets.c                     |   5 +-
 .gitlab-ci.d/windows.yml                |   8 +-
 accel/meson.build                       |   1 +
 accel/qtest/meson.build                 |   1 +
 tests/qtest/meson.build                 |  41 +++----
 54 files changed, 467 insertions(+), 257 deletions(-)

-- 
2.34.1
