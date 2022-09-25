Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1405815ejy;
        Sun, 25 Sep 2022 04:30:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:1fa:e0be:4dcb with SMTP id pa4-20020a17090b264400b001fae0be4dcbmr18924174pjb.85.1664105444580;
        Sun, 25 Sep 2022 04:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664105444; cv=none;
        d=google.com; s=arc-20160816;
        b=j4/g+KS/seIQDxLBzVZbH3EPa3fjox/U+ZB0ORMn7569wM84t37p5/UJ9kRdMChesf
         ZtbReNancGHwXpb5B59VD+w7g2YFLbyZyklHfIlYttjKxZTgWN5S+aIPwgC1MSsaBz7k
         sLzgtaDrWfcZeFAf3eBYGRDm9LbmBTpol2eXDvsCVBhbJEtjI7ysYSCpFMaoFPakwgWY
         zmINHeeUm1EFZnomjkl31KwmeQtrwMcyJhE3mRo3Fx6rqKdcG8dscjoXVSoswwHwTgt5
         sZbmCY2/jgbVEzN/d5SrW6fO5+kc8OUsCLfV3UD1coJDEvDsmw9l8dHsGaC7o6bNer9n
         3zcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Zp5giA2kRSF1lz0xFRUnMvvjddvZ7lgPW2FiTZDhO1o=;
        b=KDiqD+/YWWSO/CsQ5OyO/Pdww8tJdoEhTbAxCDAUyiTzR4cn1/LHi1wWsCbs8Ynr5v
         VScn8UjQ+DmXph/0+lQpv8HxkPX39sKBhubW4Tr0tu7klhmTKt2tocqmrbdUzOAHxZ4c
         EDwPY4Han45F4o/dxd1Ik7Lpc9L6xmAX2BL3Llux1i4jdi0rF7Kt+pRJCZb6LzcCIyy1
         lbstD+hIZKP8J+rlLqKKg8tHorKzZYyOIRbMyDa+3uLjv0d8D2tehp/4vNraJBE88+Ci
         /szIDpOYGx2lHhM54SR5GW6qBh2lX5HmMyBDrKxtJyfMkw3U7Qh0GwLFqoPw+46atHqR
         uQFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QMYuHCW5;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b10-20020a621b0a000000b0052b778fc7absor6952957pfb.44.2022.09.25.04.30.44
        (Google Transport Security);
        Sun, 25 Sep 2022 04:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QMYuHCW5;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Zp5giA2kRSF1lz0xFRUnMvvjddvZ7lgPW2FiTZDhO1o=;
        b=QMYuHCW5GMdd+nHqZypLPQPFPCdSTaQP67paCME9C4iOYq/xhKWM7VOPrQQlXLQ+el
         oos5dfJ/1/94eEV18nKQq7DFQqHM/+d/THONhJBoDWODra4m1OnaWfgEvsuOcQRP1b+O
         qcEVKyZeSd8rohtYtqK7sINNlxmxc0TB2rn/tYmhpcNIVGN40+XXIMaFa1Rhne7uZcrk
         rLbBs2tB93o3na8aYjPUzPL9hIIZW6VaWSwgKwVUGyA2idaA37qcxKej863WuDxBSrbT
         +26+GSQFR9z5FZRI5jigz/I2DLNLEZvXMii+GY/StBVMZbqkQ4bTrmaos/zvnF0jsMo7
         EckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Zp5giA2kRSF1lz0xFRUnMvvjddvZ7lgPW2FiTZDhO1o=;
        b=hSZGrQbOlgioxeJthoLwtCeNKQ6+c5glQuh316eIetuJxfeKW2TDsJmtOVRjnF3xt6
         5MSSCdsl0xXrT5UsnjArl0/SeyHLtdn5cpMvjK/gxAXvgZDQzTMZGQELWrJjsdzlo6r+
         sfFAtd/5BswtbdTxIzFh80K3Mp744U6yP7DKOmaqtVokM2liwpDiDmhHHoL7VQcA034o
         LbsLRScbODr49el3pl3dctyd3lHke+TvTRPyFO7XrPlRApLLmMx/OgfeVhx2derzo9rO
         +VB3LR+Uoc9O21OtkIZrLbs2ss+ppjjVPLTQn2HmBo4gA14WDAk1tH9SqLCCNG5du3MS
         BvtQ==
X-Gm-Message-State: ACrzQf1fOUVdhFLO8uL8sefik6eyEf9EPzhkwk+m2h0YUmXTlGeTgdvy
	Xbf7gR7fBJaGcWQfDLFQ6BA=
X-Google-Smtp-Source: AMsMyM4bIXi3El/6a5a4MK4FGT+PK4GvMym1NmXLjSRuq1gSt+cH9iU+INPT7ZLQPU+Tznr4AZXOpQ==
X-Received: by 2002:a05:6a00:acb:b0:555:ac02:433e with SMTP id c11-20020a056a000acb00b00555ac02433emr15994295pfl.3.1664105444062;
        Sun, 25 Sep 2022 04:30:44 -0700 (PDT)
Return-Path: <bmeng.cn@gmail.com>
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:30:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Bulekov <alxndr@bu.edu>,
	Andrew Jeffery <andrew@aj.id.au>,
	Ani Sinha <ani@anisinha.ca>,
	Bandan Das <bsd@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
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
	qemu-block@nongnu.org
Subject: [PATCH v3 00/54] tests/qtest: Enable running qtest on Windows
Date: Sun, 25 Sep 2022 19:29:38 +0800
Message-Id: <20220925113032.1949844-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lkJjypyeQCG7

In preparation to adding virtio-9p support on Windows, this series
enables running qtest on Windows, so that we can run the virtio-9p
tests on Windows to make sure it does not break accidently.

Changes in v3:
- Remove unnecessary "error = NULL" statements
- Split patch "tests: Avoid using hardcoded /tmp in test cases" to separate patches
- Ensure g_autofree variable is initialized
- Use g_steal_pointer() in create_test_img()
- Add another case "boot-serial-test" to justify the change
- Add a usleep(1) in the busy wait loop
- Drop the host test
- Drop patch: "tests: Change to use g_mkdir()"
- Drop patch: "block: Unify the get_tmp_filename() implementation",
  and send it as a separate patch
- Drop patch: "chardev/char-file: Add FILE_SHARE_WRITE when openning the file for win32"

Changes in v2:
- new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable"
- Use g_autofree to declare the variable
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
  FILE_SHARE_WRITE when opening the file for win32
- Change to a busy wait after migration is canceled
- new patch: "io/channel-watch: Drop the unnecessary cast"
- Change the timeout limit to 90 minutes
- new patch: Display meson test logs in the Windows CI
- new patch: "tests/qtest: Enable qtest build on Windows"
- Minor wording changes
- Drop patches that were already applied in the mainline
- Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
- Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
- Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"

Bin Meng (47):
  tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  tests/qtest: ahci-test: Avoid using hardcoded /tmp
  tests/qtest: aspeed_smc-test: Avoid using hardcoded /tmp
  tests/qtest: boot-serial-test: Avoid using hardcoded /tmp
  tests/qtest: cxl-test: Avoid using hardcoded /tmp
  tests/qtest: fdc-test: Avoid using hardcoded /tmp
  tests/qtest: generic_fuzz: Avoid using hardcoded /tmp
  tests/qtest: virtio_blk_fuzz: Avoid using hardcoded /tmp
  tests/qtest: hd-geo-test: Avoid using hardcoded /tmp
  tests/qtest: ide-test: Avoid using hardcoded /tmp
  tests/qtest: migration-test: Avoid using hardcoded /tmp
  tests/qtest: pflash-cfi02-test: Avoid using hardcoded /tmp
  tests/qtest: qmp-test: Avoid using hardcoded /tmp
  tests/qtest: vhost-user-blk-test: Avoid using hardcoded /tmp
  tests/qtest: vhost-user-test: Avoid using hardcoded /tmp
  tests/qtest: virtio-blk-test: Avoid using hardcoded /tmp
  tests/qtest: virtio-scsi-test: Avoid using hardcoded /tmp
  tests/qtest: libqtest: Avoid using hardcoded /tmp
  tests/unit: test-image-locking: Avoid using hardcoded /tmp
  tests/unit: test-qga: Avoid using hardcoded /tmp
  tests: vhost-user-bridge: Avoid using hardcoded /tmp
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

Xuzhou Cheng (7):
  accel/qtest: Implement a portable qtest accelerator
  tests/qtest: libqtest: Adapt global_qtest declaration for win32
  tests/qtest: Use send/recv for socket communication
  tests/qtest: ide-test: Open file in binary mode
  tests/qtest: virtio-net-failover: Disable migration tests for win32
  chardev/char-file: Add FILE_SHARE_WRITE when opening the file for
    win32
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled

 docs/devel/testing.rst                  |  30 +++++
 include/hw/core/cpu.h                   |   1 +
 include/qemu/sockets.h                  |   2 +
 tests/qtest/fuzz/generic_fuzz_configs.h |   4 +-
 tests/qtest/libqtest-single.h           |   4 +
 tests/qtest/libqtest.h                  |   8 ++
 accel/dummy-cpus.c                      |  15 +--
 block/vvfat.c                           |   9 +-
 chardev/char-file.c                     |   4 +-
 fsdev/virtfs-proxy-helper.c             |   3 +-
 hw/usb/dev-mtp.c                        |   4 +-
 io/channel-watch.c                      |  12 +-
 semihosting/arm-compat-semi.c           |   3 +-
 softmmu/cpus.c                          |  10 +-
 tcg/tcg.c                               |   3 +-
 tests/qtest/ahci-test.c                 |  36 ++++--
 tests/qtest/aspeed_smc-test.c           |   5 +-
 tests/qtest/bios-tables-test.c          |  12 +-
 tests/qtest/boot-serial-test.c          |   8 +-
 tests/qtest/cxl-test.c                  |  15 +--
 tests/qtest/fdc-test.c                  |   5 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c      |   4 +-
 tests/qtest/hd-geo-test.c               |  25 ++--
 tests/qtest/i440fx-test.c               |  54 +++-----
 tests/qtest/ide-test.c                  |  30 ++++-
 tests/qtest/libqmp.c                    |   5 +-
 tests/qtest/libqtest.c                  | 157 ++++++++++++++++++++----
 tests/qtest/microbit-test.c             |  10 +-
 tests/qtest/migration-test.c            |  34 ++++-
 tests/qtest/pflash-cfi02-test.c         |   8 +-
 tests/qtest/qmp-test.c                  |  13 +-
 tests/qtest/vhost-user-blk-test.c       |   3 +-
 tests/qtest/vhost-user-test.c           |   8 +-
 tests/qtest/virtio-blk-test.c           |   4 +-
 tests/qtest/virtio-net-failover.c       |   9 +-
 tests/qtest/virtio-net-test.c           |  13 +-
 tests/qtest/virtio-scsi-test.c          |   4 +-
 tests/unit/test-image-locking.c         |   8 +-
 tests/unit/test-qga.c                   |   2 +-
 tests/vhost-user-bridge.c               |   3 +-
 util/osdep.c                            |  33 +++++
 util/qemu-sockets.c                     |   5 +-
 .gitlab-ci.d/windows.yml                |   8 +-
 accel/meson.build                       |   1 +
 accel/qtest/meson.build                 |   1 +
 tests/qtest/meson.build                 |  42 +++----
 46 files changed, 442 insertions(+), 235 deletions(-)

-- 
2.34.1
