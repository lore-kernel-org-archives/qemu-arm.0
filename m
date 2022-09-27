Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp472186ocs;
        Tue, 27 Sep 2022 04:06:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:3492:b0:540:b30d:8396 with SMTP id cp18-20020a056a00349200b00540b30d8396mr28798790pfb.81.1664276804604;
        Tue, 27 Sep 2022 04:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664276804; cv=none;
        d=google.com; s=arc-20160816;
        b=KWgXj7TtVZKZfGpE7lwcXz7zshzRS05nbDRY7QujYA9rlvX3iBB6priKha2vvmZz4H
         csUpj3PF1vnR/s7mBJpdd4wVq7l2KnMYngw6w5wbbmeo19m2sHhzU/VETvNnLLZPa6ZM
         RWd7tzafwEKkyUqvT1BWzohhUTaBzpsP21OOQVJyI0DWS4m529/Ei/HJlxQ/FOF2irwu
         Ic9Q/Bwi/U8sfVbzAfGUdH7mI5AZEADhb09ehtwTITA/m6WCtqaInsK1S+878DzvZujM
         JugJzEBNXFK1eSdqpkqRPoZuL91/IAQ+tZ+uPauesGBuTqnQjMiOZuHnAEmqUDLQVPXm
         79dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4VqkvBcmyJ1SDADHumwlbH8XpmBtUgxcNWus4EgsnaE=;
        b=jQQrWKRZh6U3mTolj1ndpv2jsWvIbq135RnNXavWmx/q91VC88jr4CQQdxEZMAmwTs
         9alEqe52j5Bn8Z5P+wRuI1M8FPy7JESQb4hD5UAYXOiS96Zw5fo9vsuLH1KBzouqyvrp
         vFISQV5zRabomMUeFIIyRLvFvC0yFBtN/gi96bk3fN+UDJ6wmNzi6li/zjBtgZsVgcI6
         Tow/gmc1JQbU8MYHd+90p9d4Ko6vFMh6AmWAKpLICsZeOSWQbmgiixwE1MIHzv41gMmy
         jgk2nr4YG8ZkFAFnOo5U0qL4j/0PjmwY92uGXDUhugsPK0lnKQd1cGYyHtKL53CfTl11
         cwhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dy8ko2gR;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h2-20020a170902704200b0016c433f7c0fsor643354plt.160.2022.09.27.04.06.44
        (Google Transport Security);
        Tue, 27 Sep 2022 04:06:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dy8ko2gR;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=4VqkvBcmyJ1SDADHumwlbH8XpmBtUgxcNWus4EgsnaE=;
        b=Dy8ko2gRmXX/twTFi8cm1AmXNwN18wtLJAJBq74Iu4WWUgsRFhlM9du+gW9U5z4jJv
         zXUwJCIm7tkWThuTn5HVE2BUz7Iq/uiVUK5SQaQGiXjOaV7AXE40Ws0ay3AtURVpdV9c
         +gMr7tzeDTWLyij04I6R/drHzBcKiqbq4g0g8OVV3Fd18NF3D1DruLIR0vSUf3repOTj
         2z0uYHbtSqdwCFpVMHqUqtmW7j2yYTDFVP85h/FpFgeeruDxOsLifjOVZF9LTfNrwNaG
         m4/6HXgVjqqkbUnCfWZt1qkWcFAHeZ93zGfEUkGbubR90DLjeBBUFnrtwvFKpMLI4g8V
         Ydqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=4VqkvBcmyJ1SDADHumwlbH8XpmBtUgxcNWus4EgsnaE=;
        b=LIy9Xcsk5rWsce8Eab4YK+1AKlU8iffdxj66n3WWMeaDIfgAqYYQexAFMmDCb2S8/t
         KJW9auhZciT4UJ/vwX5Stt5ammeZRCqTYfBZepdZQfnVX2g+1T1CJE58VakVmxa4ORrF
         oukZsRCzt9j73PmM+Kz8BnH+6hvxn54SVgZmmpaH2BYdWlfiUXspUoD0TEqsC2YjujvF
         aMj+zSNW6q/JWY2TKbDtHAlOl2R1r7YdxhDBUWDBSVLx/iibmqadt0E5MYNG91CsPcYX
         vU1IUoOao/ZDDGHyx7nEOVQpQETJz0D5v5qRLy8HIqNK52u80MwU4/0fjvf04CES2Qnm
         OqkA==
X-Gm-Message-State: ACrzQf0tdflRY9knwMRuMBQ65cf+cJ7i67Mj9uOE6pwNP0i8LoBjdju5
	NUfibl27Fap8uBzIeshHu2I=
X-Google-Smtp-Source: AMsMyM50wdfkzZCJp2bwuvJabxQQSL7wNpCOUgLIaRvbkQFU9SeIcQywVaquPdnSOCgL68ImN24uhg==
X-Received: by 2002:a17:902:76c7:b0:178:ab0a:19af with SMTP id j7-20020a17090276c700b00178ab0a19afmr26449696plt.164.1664276804096;
        Tue, 27 Sep 2022 04:06:44 -0700 (PDT)
Return-Path: <bmeng.cn@gmail.com>
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 04:06:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
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
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
Date: Tue, 27 Sep 2022 19:05:38 +0800
Message-Id: <20220927110632.1973965-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 82KqGysbo+mq

In preparation to adding virtio-9p support on Windows, this series
enables running qtest on Windows, so that we can run the virtio-9p
tests on Windows to make sure it does not break accidently.

Changes in v4:
- Do not use g_autofree and g_steal_pointer
- Update the error reporting by using the GError "error" argument
  of g_dir_make_tmp()
- Remove the const from tmpfs declaration
- Replace the whole block with a g_assert_no_error()
- Replace the error reporting with g_assert_no_error()
- Update error reporting
- Move the new text section after the "QTest" section instead
- Use plural in both cases: "on POSIX hosts as well as Windows hosts"
- Use "The following list shows some best practices"
- Fix typo of delimiter
- New patch: "tests/qtest: boot-serial-test: Close the serial file before starting QEMU"
- Drop patch: "chardev/char-file: Add FILE_SHARE_WRITE when openning the file for win32"

Changes in v3:
- Remove unnecessary "error = NULL" statements
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Use g_steal_pointer() in create_test_img()
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Split to a separate patch
- Add a usleep(1) in the busy wait loop
- Drop the host test
- Drop patch: "tests: Change to use g_mkdir()"
- Drop patch: "block: Unify the get_tmp_filename() implementation",
  and send it as a separate patch

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
- Drop ahci-test.c changes that are no longer needed
- Change the place that sets IO redirection in the command line
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

Bin Meng (48):
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
  tests/qtest: boot-serial-test: Close the serial file before starting
    QEMU
  tests/qtest: microbit-test: Fix socket access for win32
  tests/qtest: migration-test: Disable IO redirection for win32
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

Xuzhou Cheng (6):
  accel/qtest: Implement a portable qtest accelerator
  tests/qtest: libqtest: Adapt global_qtest declaration for win32
  tests/qtest: Use send/recv for socket communication
  tests/qtest: ide-test: Open file in binary mode
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled
  tests/qtest: virtio-net-failover: Disable migration tests for win32

 docs/devel/testing.rst                  |  30 +++++
 include/hw/core/cpu.h                   |   1 +
 include/qemu/sockets.h                  |   2 +
 tests/qtest/fuzz/generic_fuzz_configs.h |   4 +-
 tests/qtest/libqtest-single.h           |   4 +
 tests/qtest/libqtest.h                  |   8 ++
 accel/dummy-cpus.c                      |  15 +--
 block/vvfat.c                           |   9 +-
 fsdev/virtfs-proxy-helper.c             |   3 +-
 hw/usb/dev-mtp.c                        |   4 +-
 io/channel-watch.c                      |  12 +-
 semihosting/arm-compat-semi.c           |   3 +-
 softmmu/cpus.c                          |  10 +-
 tcg/tcg.c                               |   3 +-
 tests/qtest/ahci-test.c                 |  36 ++++--
 tests/qtest/aspeed_smc-test.c           |   5 +-
 tests/qtest/bios-tables-test.c          |  12 +-
 tests/qtest/boot-serial-test.c          |  11 +-
 tests/qtest/cxl-test.c                  |  15 +--
 tests/qtest/fdc-test.c                  |   5 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c      |   4 +-
 tests/qtest/hd-geo-test.c               |  24 ++--
 tests/qtest/i440fx-test.c               |  54 +++-----
 tests/qtest/ide-test.c                  |  30 ++++-
 tests/qtest/libqmp.c                    |   5 +-
 tests/qtest/libqtest.c                  | 157 ++++++++++++++++++++----
 tests/qtest/microbit-test.c             |  10 +-
 tests/qtest/migration-test.c            |  38 +++++-
 tests/qtest/pflash-cfi02-test.c         |  15 ++-
 tests/qtest/qmp-test.c                  |  17 ++-
 tests/qtest/vhost-user-blk-test.c       |   3 +-
 tests/qtest/vhost-user-test.c           |  10 +-
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
 45 files changed, 452 insertions(+), 240 deletions(-)

-- 
2.34.1
