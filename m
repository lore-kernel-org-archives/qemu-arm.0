Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422440nji;
        Thu, 12 Sep 2024 00:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwFiW9zYnoL10gKOqrg4vAFRlV827fvU5JKMFO7S/0Kimny1QN+2xp0EM8pT+MkcKOFb5swx3CawDrXg==@linaro.org
X-Received: by 2002:a05:6a00:2393:b0:718:dc55:728a with SMTP id d2e1a72fcca58-7192607f65amr2955704b3a.8.1726126767425;
        Thu, 12 Sep 2024 00:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126767; cv=none;
        d=google.com; s=arc-20160816;
        b=fE0r3HuH10qPsFFL0awVDkQaDCNX/ZubbG5jLhijllpxlQkirralew5r1t3lT3KQ7K
         te7BEvEPdg08+8dtxWacPFYXSKSImGsMudH5gPXmp1zxuALxk5kNh/oHw60F8jES9/X0
         qff77J+n4TAnLf33pBT+qWk8JrdhkNz9vWkvMWqSJV4Jn03Iy3ymjd6mx8TYqhx5UTN1
         HBuCgX94XpmxEYrjsk3bqhV31x6kdMWlEflh91xi0yxUtuffITWwMe1x2jo4l2e9Tl7x
         7/L5/g2H0Xoob+xen5viZl9EdMX1MnkoS8m07kLbkzP+GXkMSUNjop674t2Wa42FsecN
         Ga4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=6KTOZZpVPdK9NLch9CdYyKy3h5bRy7LFaAKYeIfSuvw=;
        fh=ngIYfJtBTMUpzr/Iux3Rwg+sfVz1WuiFnWNw8SyGRVs=;
        b=Mj/O1oxfwfgxb0qVCYs0+hQdRCYG+jUJLyYeus6gxNpS92NAd5r6hFQnjZR5S6fYY8
         P8ste3kzaqZ/A/dXgzzbbTbzeb5XSqAPdnUWGpXulRSCJ+h/MpUY52+0GXtqv9/57Kqx
         tUseVlOd+KohAgs4e7TL5RvzODvvWWWiDipBjw/m1mFSxCsCY5ipUJvYfsHyJvTqbtO/
         7tpygizbFsPkpbpDXgdy3DscxnICUWHUVWtFmGe2rFyb+bDchRrjTWul3vfY1Xx4Bl7L
         5XhzagjNAavMmmS+9WbxvxXfnluKfGv6mGAUx/O6jK+S3DL0Y5yJ5soXxEsRHcvSnxr3
         jNQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lw6zVjvj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e597ec36sor8419409b3a.9.2024.09.12.00.39.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lw6zVjvj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126767; x=1726731567; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KTOZZpVPdK9NLch9CdYyKy3h5bRy7LFaAKYeIfSuvw=;
        b=Lw6zVjvjMuTMUjkUDn0+DgdIRZ+JdkbVOd5sAJZZNDm6hM+0CBdVCTccBGSLb27ZhR
         ycJS9zfI8NdCgOKW21p/oP/p0q99yfEy/vfUqG5O1S2FZ1b9+aiZloxxOjNKhzoJUlIe
         Yz2sdeUIVLrgrLkAUtGbg5fkcaTOwJw5JnrIyWrrghKGeBp2io0mO90qYTPNFcFKo2td
         /VyAkk8Q9DxucP7PUD1Tv3NrtWAS+Cg/RTYOBuRU+C30qBj/qcX3tm0WS/mHUXixLfGn
         HeELccwySxpHofoBp3iWiDO5SWuOvpO5srm12IxJwVhjl8Wjl+g8k8xOzvuLce/euTQY
         LbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126767; x=1726731567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KTOZZpVPdK9NLch9CdYyKy3h5bRy7LFaAKYeIfSuvw=;
        b=UOTV6z6v+1m+dp9DwIqmljiGpWdrFdi4m6kmIhKcVchcAMoqQ+qSJzlhi/u0RmV7tU
         fG8AVom6tiDQ+Xtgc4kJcoSycDMkXTnTqcn6xav1V6K+TU54AbnSE0t52NayMfW41QfY
         wAr1Joz6RRsAH4d742l2pH+rJUdNuom0Kx69f1pXQMtuBgpNUNVhfOrbJS7YbZoUTlnB
         +/X/fRyo8ujMIsOgffiL6RRvS8PS+jEQzWB6wXyecLg7BGmA+uhjI9O5tEnvbDEuMQ/U
         x7GKxuKpiiToV8DOLMwWw/AupiLoW4gKM9i2CksSI4sOmmjHDw6kus7zLdiTfbWb9vML
         lLVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnWao1qcM2tX9aLUdZopLacjENPeDkxBe9e4AFDmRZlddrxnYlQYlc6kZY/lt/48uR9BBkh/BBT8lbIw==@linaro.org
X-Gm-Message-State: AOJu0YwUvj8ezmmWu0jMKHem7bTeWto+I0zM/Cf4Y/Z3lOd+jJADniRE
	rFG1v2pcq2L03nilpd78VXyQsmhSQ/ZOwHINJk3ne3iqJXeo6poEeYP4iuozOvL7cw==
X-Google-Smtp-Source: AGHT+IFDHcH9yYygsOOy6F9cWKwp6ExszFi//61KJ3XywRQafJBSbtA6oO7fB2lrh3DyPlfq88Ey5A==
X-Received: by 2002:a05:6a21:114d:b0:1cc:ce91:8459 with SMTP id adf61e73a8af0-1cf75ea2351mr2933012637.5.1726126766203;
        Thu, 12 Sep 2024 00:39:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 00/48] Use g_assert_not_reached instead of (g_)assert(0,false)
Date: Thu, 12 Sep 2024 00:38:33 -0700
Message-Id: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: l/CqG+liINw1

This series cleans up all usages of assert/g_assert who are supposed to stop
execution of QEMU. We replace those by g_assert_not_reached().
It was suggested recently when cleaning codebase to build QEMU with gcc
and tsan: https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/.

In more, cleanup useless break and return after g_assert_not_reached();

And finally, ensure with scripts/checkpatch.pl that we don't reintroduce
(g_)assert(false) in the future.

New commits (removing return) need review.

Tested that it build warning free with gcc and clang.

v2
- align backslashes for some changes
- add summary in all commits message
- remove redundant comment

v1
https://lore.kernel.org/qemu-devel/20240910221606.1817478-1-pierrick.bouvier@linaro.org/T/#t

Pierrick Bouvier (48):
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
  include/qemu: remove return after g_assert_not_reached()
  hw/hyperv: remove return after g_assert_not_reached()
  hw/net: remove return after g_assert_not_reached()
  hw/pci: remove return after g_assert_not_reached()
  hw/ppc: remove return after g_assert_not_reached()
  migration: remove return after g_assert_not_reached()
  qobject: remove return after g_assert_not_reached()
  qom: remove return after g_assert_not_reached()
  tests/qtest: remove return after g_assert_not_reached()
  scripts/checkpatch.pl: emit error when using assert(false)

 docs/spin/aio_notify_accept.promela     |  6 +++---
 docs/spin/aio_notify_bug.promela        |  6 +++---
 include/hw/s390x/cpu-topology.h         |  2 +-
 include/qemu/pmem.h                     |  1 -
 accel/tcg/plugin-gen.c                  |  1 -
 block/qcow2.c                           |  2 +-
 block/ssh.c                             |  1 -
 hw/acpi/aml-build.c                     |  3 +--
 hw/arm/highbank.c                       |  2 +-
 hw/char/avr_usart.c                     |  2 +-
 hw/core/numa.c                          |  2 +-
 hw/gpio/nrf51_gpio.c                    |  1 -
 hw/hyperv/hyperv_testdev.c              |  7 +++----
 hw/hyperv/vmbus.c                       | 15 ++++++---------
 hw/misc/imx6_ccm.c                      |  1 -
 hw/misc/mac_via.c                       |  2 --
 hw/net/e1000e_core.c                    |  4 +---
 hw/net/i82596.c                         |  2 +-
 hw/net/igb_core.c                       |  4 +---
 hw/net/net_rx_pkt.c                     |  3 +--
 hw/net/vmxnet3.c                        |  1 -
 hw/nvme/ctrl.c                          |  8 ++++----
 hw/pci-host/gt64120.c                   |  2 --
 hw/pci/pci-stub.c                       |  6 ++----
 hw/ppc/ppc.c                            |  1 -
 hw/ppc/spapr_events.c                   |  3 +--
 hw/scsi/virtio-scsi.c                   |  1 -
 hw/tpm/tpm_spapr.c                      |  1 -
 hw/watchdog/watchdog.c                  |  2 +-
 migration/dirtyrate.c                   |  3 +--
 migration/migration-hmp-cmds.c          |  2 +-
 migration/postcopy-ram.c                | 21 +++++++--------------
 migration/ram.c                         |  8 +++-----
 qobject/qlit.c                          |  2 +-
 qobject/qnum.c                          | 12 ++++--------
 qom/object.c                            |  1 -
 system/rtc.c                            |  2 +-
 target/arm/hyp_gdbstub.c                |  1 -
 target/i386/kvm/kvm.c                   |  4 ++--
 target/ppc/dfp_helper.c                 |  8 ++++----
 target/ppc/mmu_helper.c                 |  2 +-
 target/riscv/monitor.c                  |  1 -
 tests/qtest/acpi-utils.c                |  1 -
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
 54 files changed, 72 insertions(+), 120 deletions(-)

-- 
2.39.2
