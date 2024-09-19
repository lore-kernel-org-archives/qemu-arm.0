Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161216njg;
        Wed, 18 Sep 2024 21:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmlou73rbg9L1wFawSf4NVvBF5lyR01tslb/9YibETHUUuc4edK0pBJPwu1C4+11h3joQqjlqOy0HxPw==@linaro.org
X-Received: by 2002:a05:6a21:a4c4:b0:1d2:e793:9fa with SMTP id adf61e73a8af0-1d2e7930c98mr12065563637.47.1726721207556;
        Wed, 18 Sep 2024 21:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721207; cv=none;
        d=google.com; s=arc-20160816;
        b=hhK4wmBku4sZhEAXp/XqS5BSeVV+YL5MDcy6bacVa5y4Dm6E/n3TFFow7NnXUOnNGV
         nFjEvf0+6hdFSxtmVdRUjB+ioED9ST4eH8upVjRXayuvrvSffgOX722uXLMgHnxJtmy+
         V1HCZHWmYMd941+9xy3v3tmoRfFImnIQgPMaVuhkdr2W7g7iaEEhNPTulP+aoDzke5e/
         GmA5EDfjcBQ3UApxLOaOqex9M68G/Bc1djcgDty4fOtFzR2JuZrNnozhkvik67/pbKqe
         s6UDR5Q+j07HlJ1PK620uyjLcWIMzwdlL00psbgwlurQSESDZgR9oQX5B0kjZRDR+0si
         PuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=okWQnCc9i+a9qTeP/CljeFJtPOK3zSl+MYdGWF+XBiU=;
        fh=PZBSs29mit4jCJQodYb8+k83FCH/eNycFk3zOw71Hg8=;
        b=CSIo7q4XBTwlVdMTmhc8UY4BK0JjZaCLgw9QIi4Y6BkCCkD7aHkd7vpZUD66uPncxD
         RBmBUGKgHbW2NSBPjapIhAERFVQu+dsEhXVhIH5HQKdXblnvOfXknTL5s9M8epfUepu5
         msJ/3fJiPcgQqrHxsC7jE/QNT3U9Lq+az4FydNcagSrvMS9i3eZ/bzys8s1edVXFg4XL
         L5PKdfNNqB1rQ5bEs8rXSxpnU+X/3FcymFDX8ucAtMypWtwn/1Zgl4qnYzR4Y8aND1Dq
         cRzORZVN6kY42rGYkekciTnxPc1i65opkTcpeHkjoSM+5bRa2f75CtvDLWfFydsZmmtp
         iejA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJPbxbwK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db49a14f64sor4235050a12.9.2024.09.18.21.46.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJPbxbwK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721207; x=1727326007; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okWQnCc9i+a9qTeP/CljeFJtPOK3zSl+MYdGWF+XBiU=;
        b=gJPbxbwKf9PO4H/oQ/PiOMgCqB3H8uiJutiHUClTn02HNt2kpgAxxeNCUcYW6XxXFJ
         nHe0QTtJzo/mXSZ0C45uD7wV+xNEOJ3lXIKEdloCa09TXwpOWBjcRLdft6pWJdvtWRGe
         lKo/kBw46SOepeHfkELi4Vo/TWQB0tRhEjxkR4DMlgozJHzsGCopHb5P3vwsOLvLDcQF
         rhZn315dk4CvDVPPiK9H9B0+/ub4+Xashptb0mgA0CL1FBIS0TZkjgob4QCNJoqgHusH
         d6m6TNYJDooizoo1JuOx2+SV/I+18uxlM0eAJEDdPhtaPVSK4z9PZ5hUR+eWr0uSQk+S
         hnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721207; x=1727326007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okWQnCc9i+a9qTeP/CljeFJtPOK3zSl+MYdGWF+XBiU=;
        b=FGH/5Pfd0aMtGozD3zHQubyuSSj1KOQ4R68meCA2guEA/tSfoqTYnVaLUXUS85yzSH
         46D/VFk9TCmMjvtz4vGw8egsmXYBGstwBvb6t7iPJQ8mUP8tcB6f2RaOCOmBjNVHh2us
         X8rmd8wtrWFcPQFpgQb1vG+ffKPRbW2ABtLaFlpstADuNVhDuUDw11t3genA5R0b8sRE
         cOGcx65dm+vj3jdgiqudPvAIwG0ftF1BYeoTuietU5EGl5mg6a61EzL+BRDiE8hrTuvR
         giwDFCThsDTJHBwi5oJWOHbMrRLuxyGOuu361ctUw3U+t6swl6JX/woydoJKd+LR9dxs
         L41w==
X-Forwarded-Encrypted: i=1; AJvYcCX+2cJWyYO+YY5Q7Fk4OAxvxnBbmiZFkfvl/NQhvezxDVvahPg/ikwhINlLiSF8hlQ06mp5u2ehAcaczw==@linaro.org
X-Gm-Message-State: AOJu0YxlKhgoKc48zudAS7WxCDGDfdiZ3gae+OeKRrVDjf1E2Fhj3DZM
	9Z1706piqisb4l2r0g5gITK3diznPZ8JOiOLpxjBI9g+CWhp/yvnCHKaJfKMDSn7cA==
X-Google-Smtp-Source: AGHT+IFTeoz0sc18zegnRwG9uqK1i/tdvMiZIsB+jYHs0tQzrYbWKu22/eeI4GvU6Dyul2n7o0JIuw==
X-Received: by 2002:a05:6a21:1690:b0:1cf:4348:d5c8 with SMTP id adf61e73a8af0-1d112e8bfaemr31800828637.39.1726721206933;
        Wed, 18 Sep 2024 21:46:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:46:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 00/34] Use g_assert_not_reached instead of (g_)assert(0,false)
Date: Wed, 18 Sep 2024 21:46:07 -0700
Message-Id: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: z3OBWhxypE3P

This series cleans up all usages of assert/g_assert who are supposed to stop
execution of QEMU. We replace those by g_assert_not_reached().
It was suggested recently when cleaning codebase to build QEMU with gcc
and tsan: https://lore.kernel.org/qemu-devel/54bb02a6-1b12-460a-97f6-3f478ef766c6@linaro.org/.

In more, cleanup useless break and return after g_assert_not_reached();

And finally, ensure with scripts/checkpatch.pl that we don't reintroduce
(g_)assert(false) in the future.

New commits (removing return) need review.

Tested that it build warning free with gcc and clang.

If a maintainer could pull the whole series, this would be much more easier than
integrating various parts of it in different subsystems. Thanks!

v3
- drop changes on .promela files
- some changes were already merged

v2
- align backslashes for some changes
- add summary in all commits message
- remove redundant comment

v1
https://lore.kernel.org/qemu-devel/20240910221606.1817478-1-pierrick.bouvier@linaro.org/T/#t

Pierrick Bouvier (34):
  hw/acpi: replace assert(0) with g_assert_not_reached()
  hw/arm: replace assert(0) with g_assert_not_reached()
  hw/net: replace assert(0) with g_assert_not_reached()
  migration: replace assert(0) with g_assert_not_reached()
  qobject: replace assert(0) with g_assert_not_reached()
  target/ppc: replace assert(0) with g_assert_not_reached()
  block: replace assert(false) with g_assert_not_reached()
  hw/hyperv: replace assert(false) with g_assert_not_reached()
  hw/net: replace assert(false) with g_assert_not_reached()
  hw/nvme: replace assert(false) with g_assert_not_reached()
  hw/pci: replace assert(false) with g_assert_not_reached()
  hw/ppc: replace assert(false) with g_assert_not_reached()
  migration: replace assert(false) with g_assert_not_reached()
  target/i386/kvm: replace assert(false) with g_assert_not_reached()
  accel/tcg: remove break after g_assert_not_reached()
  block: remove break after g_assert_not_reached()
  hw/acpi: remove break after g_assert_not_reached()
  hw/net: remove break after g_assert_not_reached()
  hw/scsi: remove break after g_assert_not_reached()
  hw/tpm: remove break after g_assert_not_reached()
  target/arm: remove break after g_assert_not_reached()
  target/riscv: remove break after g_assert_not_reached()
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

 include/qemu/pmem.h                     |  1 -
 accel/tcg/plugin-gen.c                  |  1 -
 block/qcow2.c                           |  2 +-
 block/ssh.c                             |  1 -
 hw/acpi/aml-build.c                     |  3 +--
 hw/arm/highbank.c                       |  2 +-
 hw/hyperv/hyperv_testdev.c              |  7 +++----
 hw/hyperv/vmbus.c                       | 15 ++++++---------
 hw/net/e1000e_core.c                    |  4 +---
 hw/net/i82596.c                         |  2 +-
 hw/net/igb_core.c                       |  4 +---
 hw/net/net_rx_pkt.c                     |  3 +--
 hw/net/vmxnet3.c                        |  1 -
 hw/nvme/ctrl.c                          |  8 ++++----
 hw/pci/pci-stub.c                       |  6 ++----
 hw/ppc/ppc.c                            |  1 -
 hw/ppc/spapr_events.c                   |  3 +--
 hw/scsi/virtio-scsi.c                   |  1 -
 hw/tpm/tpm_spapr.c                      |  1 -
 migration/dirtyrate.c                   |  3 +--
 migration/migration-hmp-cmds.c          |  2 +-
 migration/postcopy-ram.c                | 21 +++++++--------------
 migration/ram.c                         |  8 +++-----
 qobject/qlit.c                          |  2 +-
 qobject/qnum.c                          | 12 ++++--------
 qom/object.c                            |  1 -
 target/arm/hyp_gdbstub.c                |  1 -
 target/i386/kvm/kvm.c                   |  4 ++--
 target/ppc/dfp_helper.c                 |  8 ++++----
 target/ppc/mmu_helper.c                 |  2 +-
 target/riscv/monitor.c                  |  1 -
 tests/qtest/acpi-utils.c                |  1 -
 fpu/softfloat-parts.c.inc               |  2 --
 target/riscv/insn_trans/trans_rvv.c.inc |  2 --
 tcg/loongarch64/tcg-target.c.inc        |  1 -
 scripts/checkpatch.pl                   |  3 +++
 36 files changed, 50 insertions(+), 90 deletions(-)

-- 
2.39.5
