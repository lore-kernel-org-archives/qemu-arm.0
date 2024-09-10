Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444298njb;
        Tue, 10 Sep 2024 15:16:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqxUtphbqOJrc+3HMKtMBmlT8z4Jof8YjsoNiBJhdiVDEUcBAVCkZCguWHvrtAHnkZAko2t7EPuSKffQ==@linaro.org
X-Received: by 2002:a05:6a00:2f9b:b0:718:d4e4:a10a with SMTP id d2e1a72fcca58-71907ea941emr6541935b3a.4.1726006571148;
        Tue, 10 Sep 2024 15:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006571; cv=none;
        d=google.com; s=arc-20160816;
        b=akpsnGKBMJLQbqVTCttKQX+7J/ou/55HmGP/SJZNNwfTQzUHgwAjkhpE6iki4pipHC
         G2at3JRmvDNnwg+EZoU9FYqZVaufXqhuwnFlyDZVTAFqkA+OEL4GSrrxabsy2Wwal3Ds
         I7xIZOgANvRVM5nYukX+Rn/UKMedtuHMK1iJPFyWAMLL4vv6Zmjmewxqz/0yPj9OPP/x
         Ll1Gg57MSnntzdPUlqX/FW199qEjwTNRL0kz5RQbGhwtjz842NYKNgSDvDUKwX+X2YR3
         LpfravFcuLzkUi1mCPMpM88MhY8buaTH04sJe0lZ1MCHWimHtbZbp1HooQAejq3b3YMS
         xRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=YSyqJppZZS4UpzgxKNiY6ieJzLYfceDr8xhPE0xjFbI=;
        fh=0mfrAVO+RmyK3+HCFbKcz0sQBfbx1g0f2+eygiae/58=;
        b=z6M6JRX7QSUpi0CQO1AR1gZoMtPl2AeS13EyuifMqNM0k/Z5hXKqOs7aWKNemyF/V/
         XggXrERYwrJoIH1mhfaag+FQWt9AAV5gxAVL78+ulH/IjLF1kA4OTN8PDOcUwUlUy7X5
         4G4i2R4tJWDeAz/ZF7GotxXaK4awNHcrVrQHduL7/ozeLRGJn7ExC1gZWHcjGBxCpmHC
         iBdC/buSupwL7+yxKava2uijtTykwaB/cz5eBGw38Q3RSeZwJ5gxPKSrOhoabkJ3nrR/
         eycUy6dBlkBHf3qwaFZ7Pjrz0l9OkPhi5jISo4c0YI+zPuFq1ob2VRMe5JSxq0mh22KA
         weFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/LMF8dJ";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e571b037sor4017428b3a.1.2024.09.10.15.16.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/LMF8dJ";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006571; x=1726611371; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSyqJppZZS4UpzgxKNiY6ieJzLYfceDr8xhPE0xjFbI=;
        b=O/LMF8dJQKzKgHN2rwKGdv1DVWi2CgIaX4B6eGJTnQwnynwvn0sA6AWbRVrZg6v9AX
         5cuaxIFPstkLbwFjGnGWq3NyJdsQXl0rnKqyKJkzdiANZzdrXDygZ5fHXRWyKbH4q1P1
         KeLMc0/j7uHsK24Jnu1jG7fRPS3PyNl+1X97RIjRAoDfQ1iG3GNwGITS/3YThNQgKB2Y
         qgBrlnQvvpcuii3gRovZgCLBRjVg6iPuofHhKrz7gl4fBLwLeHszJ5OOV0Z5ntjEezKt
         /IG4t4v/EtwIJZpckD+3fxBJGaRX0wmAOvC2v+pGkhDrdB2VKVwlNCBsHOfUcqU+ijkY
         ZrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006571; x=1726611371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSyqJppZZS4UpzgxKNiY6ieJzLYfceDr8xhPE0xjFbI=;
        b=sgGSN1i6HTuFYCzRFUq9XZdc8M+FIQtAv0AQ1u2CGgmNj4NmUJwnclk2BLrEAUkMGO
         29l18PqfL4pgvcELQ/ebAIIr+vBEUgEnH4h/BS+RapS3+gmOVgengwq8aNtO/NmVx9Td
         zFsgd52FvflmqjHfEVaw22Fah52pbsVzbUys0C5xCKYrCGIkdvplRGhrGq08tR6FNdnP
         XRuq8hM3UV4/d+HkWbHDNqfgC1v9rN1MvHXhi0Fouzs2H4WR1Y2O9iDNgzC+kPIncUX+
         4d/90kraLcSBI3g6AmYa8jITO3zKeim7uFfFWkfbJ6MAOJHZffT62b1r/UHSGoIJBbYL
         ftgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfHtsr6YLO5Lb1wonHBLenxoDBODQDMBwOBZrPd7ZndC9M7d02qTav7CeD+nA8rnbAuZNjlfWfTwoJtA==@linaro.org
X-Gm-Message-State: AOJu0YzTQg/hsaSRqh9QBJLbGbE/j1irZpy0KjZpMXJgXfs2y1Dv8URX
	MLNG6QrJNIEvyVrTd8xuo/mf63ESF70G/45NAUmjj9f8jYgeICIXujde4b/YJ4Ltpw==
X-Google-Smtp-Source: AGHT+IFq8D12w3lrLR9iZPp9dBLWaCbloOusYWBwljwNqw7WFauubajh8SDyD921iLBgiiedqovYTQ==
X-Received: by 2002:a05:6a00:9484:b0:712:7512:add9 with SMTP id d2e1a72fcca58-71907f2dc50mr6196737b3a.13.1726006570484;
        Tue, 10 Sep 2024 15:16:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 00/39] Use g_assert_not_reached instead of (g_)assert(0,false)
Date: Tue, 10 Sep 2024 15:15:27 -0700
Message-Id: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LyZ2gpUc9hRo

This series cleans up all usages of assert/g_assert who are supposed to stop
execution of QEMU. We replace those by g_assert_not_reached().
It was suggested recently when cleaning codebase to build QEMU with gcc
and tsan: https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/.

In more, cleanup useless break after g_assert_not_reached();

And finally, ensure with scripts/checkpatch.pl that we don't reintroduce
(g_)assert(false) in the future.

Pierrick Bouvier (39):
  docs/spin: replace assert(0) with g_assert_not_reached()
  hw/acpi: replace assert(0) with g_assert_not_reached()
  hw/arm: replace assert(0) with g_assert_not_reached()
  hw/char: replace assert(0) with g_assert_not_reached()
  hw/core: replace assert(0) with g_assert_not_reached()
  hw/net: replace assert(0) with g_assert_not_reached()
  hw/watchdog: replace assert(0) with g_assert_not_reached()
  migration: replace assert(0) with g_assert_not_reached()
  qobject: replace assert(0) with g_assert_not_reached()
  system: replace assert(0) with g_assert_not_reached()
  target/ppc: replace assert(0) with g_assert_not_reached()
  tests/qtest: replace assert(0) with g_assert_not_reached()
  tests/unit: replace assert(0) with g_assert_not_reached()
  include/hw/s390x: replace assert(false) with g_assert_not_reached()
  block: replace assert(false) with g_assert_not_reached()
  hw/hyperv: replace assert(false) with g_assert_not_reached()
  hw/net: replace assert(false) with g_assert_not_reached()
  hw/nvme: replace assert(false) with g_assert_not_reached()
  hw/pci: replace assert(false) with g_assert_not_reached()
  hw/ppc: replace assert(false) with g_assert_not_reached()
  migration: replace assert(false) with g_assert_not_reached()
  target/i386/kvm: replace assert(false) with g_assert_not_reached()
  tests/qtest: replace assert(false) with g_assert_not_reached()
  accel/tcg: remove break after g_assert_not_reached()
  block: remove break after g_assert_not_reached()
  hw/acpi: remove break after g_assert_not_reached()
  hw/gpio: remove break after g_assert_not_reached()
  hw/misc: remove break after g_assert_not_reached()
  hw/net: remove break after g_assert_not_reached()
  hw/pci-host: remove break after g_assert_not_reached()
  hw/scsi: remove break after g_assert_not_reached()
  hw/tpm: remove break after g_assert_not_reached()
  target/arm: remove break after g_assert_not_reached()
  target/riscv: remove break after g_assert_not_reached()
  tests/qtest: remove break after g_assert_not_reached()
  ui: remove break after g_assert_not_reached()
  fpu: remove break after g_assert_not_reached()
  tcg/loongarch64: remove break after g_assert_not_reached()
  scripts/checkpatch.pl: emit error when using assert(false)

 docs/spin/aio_notify_accept.promela     |  6 +++---
 docs/spin/aio_notify_bug.promela        |  6 +++---
 include/hw/s390x/cpu-topology.h         |  2 +-
 accel/tcg/plugin-gen.c                  |  1 -
 block/qcow2.c                           |  2 +-
 block/ssh.c                             |  1 -
 hw/acpi/aml-build.c                     |  3 +--
 hw/arm/highbank.c                       |  2 +-
 hw/char/avr_usart.c                     |  2 +-
 hw/core/numa.c                          |  2 +-
 hw/gpio/nrf51_gpio.c                    |  1 -
 hw/hyperv/hyperv_testdev.c              |  6 +++---
 hw/hyperv/vmbus.c                       | 12 ++++++------
 hw/misc/imx6_ccm.c                      |  1 -
 hw/misc/mac_via.c                       |  2 --
 hw/net/e1000e_core.c                    |  2 +-
 hw/net/i82596.c                         |  2 +-
 hw/net/igb_core.c                       |  2 +-
 hw/net/net_rx_pkt.c                     |  3 +--
 hw/nvme/ctrl.c                          |  8 ++++----
 hw/pci-host/gt64120.c                   |  2 --
 hw/pci/pci-stub.c                       |  4 ++--
 hw/ppc/spapr_events.c                   |  2 +-
 hw/scsi/virtio-scsi.c                   |  1 -
 hw/tpm/tpm_spapr.c                      |  1 -
 hw/watchdog/watchdog.c                  |  2 +-
 migration/dirtyrate.c                   |  2 +-
 migration/migration-hmp-cmds.c          |  2 +-
 migration/postcopy-ram.c                | 14 +++++++-------
 migration/ram.c                         |  6 +++---
 qobject/qlit.c                          |  2 +-
 qobject/qnum.c                          |  8 ++++----
 system/rtc.c                            |  2 +-
 target/arm/hyp_gdbstub.c                |  1 -
 target/i386/kvm/kvm.c                   |  4 ++--
 target/ppc/dfp_helper.c                 |  8 ++++----
 target/ppc/mmu_helper.c                 |  2 +-
 target/riscv/monitor.c                  |  1 -
 tests/qtest/ipmi-bt-test.c              |  2 +-
 tests/qtest/ipmi-kcs-test.c             |  4 ++--
 tests/qtest/migration-helpers.c         |  1 -
 tests/qtest/numa-test.c                 | 10 +++++-----
 tests/qtest/rtl8139-test.c              |  2 +-
 tests/unit/test-xs-node.c               |  4 ++--
 ui/qemu-pixman.c                        |  1 -
 fpu/softfloat-parts.c.inc               |  2 --
 target/riscv/insn_trans/trans_rvv.c.inc |  2 --
 tcg/loongarch64/tcg-target.c.inc        |  1 -
 scripts/checkpatch.pl                   |  3 +++
 49 files changed, 72 insertions(+), 90 deletions(-)

-- 
2.39.2
