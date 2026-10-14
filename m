Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9716CC6B1F
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:34:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvLO-0002Dd-HX; Wed, 14 Oct 2026 05:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvLL-0002Cc-1p
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:32:16 -0400
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvLH-0000JA-8H
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:32:14 -0400
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-33e6279a1d7so36313eec.1
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970328; x=1792575128; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=J92u3jh5IVhh1ZDZ9lHw4KtvVkJdMtuAI/fxMRrNnRs=;
 b=HGLxOzZZ9c1431eNc9TfQi1IUj0FD0G52JIV4xsLV6Cg7OE0fKVvE/jya/euAcerQm
 aNgZm0x3nFncUKqUlEH/AW5VvXbdWvY/06TyhSNGuzWakrbYrOW+4NlR25Y4LPUbV0pd
 P813TnoP9PAwApMLN86L8u9MIkleIles4o7M7Db1hdsHldbYGnw+h7fl36AsxsXMuWtI
 zsxFKKtrWCDADbEYHBU24XlHKmSRV5MynlZ+G+7uC8JwzcS4HVWIP1ZKQaUev6pgk9PU
 5mU/iCAbsuVEt2smvIhrNrrtQE4cAgvCv23veXqi12iFhgJSFKWfrlsRwpqAXu2j9qUN
 5qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970328; x=1792575128;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J92u3jh5IVhh1ZDZ9lHw4KtvVkJdMtuAI/fxMRrNnRs=;
 b=M5zDGT3fDU6v1VkF5PJiXG1vV71551gHjuB25jxQbhvMyAO374n8NlpP57XOdDSjFW
 R/EO3Pu8f1NaFsqvXBpm89UJpQgzUg5ZFPhz1spjuVopLe6MGLnWdGi6Q40a3hr3nVCm
 lNfznTqVPwr45Ttzodc3bz+YG98ayfluQf9xeiN3IZizTex0zs1dnfQWZK61nYdfKrn6
 kkfkNTId7T3f0Gc247uz9EqFe38tVEpyEuppdBrsh88XPwK6uFARPQ/8jyYoOktqHpP5
 HeMr3p1laWsy8KNRBx02UYQJRdL1VlhP1E87xmInVpD139T3a63CSZYz2yv+6YRcxLsN
 +ZPw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1TFWQhbWuGoHTM1+VUW2lqyoYDaXcOQKzSQiNZi6AS9tow/98RU6jVkvrozgpg+s9fNNXlpxklQ==@nongnu.org
X-Gm-Message-State: AFq9FYJL+n0Uw8Ty/NLeVwTRbB21CLWX2STRIjGD/QETSYpYF9RCxMNB
 VgH8m6QCmZbADpmm7+FD6qqKgwrcPB2Ft2DY7BN3mSF8OYlU8CxA7SIb
X-Gm-Gg: AYBFou2LCzR+Gy2GemdkIM6enOdRWy4QJ4nI0VNZ2oyIjaelAi0ywD9oEPb524dDh1A
 SYi+mmxzlici1aC1DizB9bT1wwlymoSq/UkmXJaPZ1YhvPc3Ksex7tVJxYDIR95/Nc3KrED+JVK
 W//CJRuuKNHiI17ydV8X6ikQSXWUbPLA1Re/WyrFcvr9OBiEK3u+zXLnBh2kk6pl4uj3o5381Yh
 yjA83/HROyybbDysqEmurSjbbrs6/cH7UGHcLNlQ207Riee6SwnSi6VPo7B30k3hWp0dOesjTa3
 rLBLx86jQWDLhA3K3EeduREVN3mfrEZjni7Di2we9ftd3IA1p991D4C4uX0Nd0lttXKRsMqHJPx
 5q6Rf0cln8KJLXA0yLXOdt7ij/XRrtbsgotg9gvDTLlkg3RELzQkFA8Yf1hBSV8iKfOrY71wQNj
 KS3dYhsNb9GHa7efTH/JzhEJYipB6LarD5/XYAOu5PHr7wsRbil5/910HRCIieV6xd6uivgv/Jo
 f+FuMtqXr8cwd5PAg==
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id
 a92af1059eb24-16a6187f08amr24706546c88.16.1791970327404; 
 Wed, 14 Oct 2026 02:32:07 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:32:06 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 00/34] single-binary: Select the softmmu target through
 -machine <type>
Date: Wed, 14 Oct 2026 17:31:10 +0800
Message-ID: <20261014093152.834-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

MachineClass::targets declares each machine's supported targets as a
uint64_t QEMU_ARCH_* mask.

In the combined executable, a machine can be selected from
<target>-<machine-name> when <machine-name> is ambitious.
Otherwise we can use <machine-name> to directly select a target.

Renaming SysEmuTarget to EmuTarget prepares the enum for both system and
user-mode targets before introducing more usage of it.
Rationale:
https://lore.kernel.org/qemu-devel/d6217459-1e55-4da0-a49f-bde8215d8c0e@oss.qualcomm.com/

The "virt" machines need distinct QOM names to coexist in a combined binary
or test. Their existing CLI names and aliases are preserved.

Other indirect call of target_info() in class_init/type_init is removed by
serveral commits, this is a prepare for select <target> by -machine $type.
As target_info() will be NULL till the target is selected under machine_select.

The commits through "hw: add MachineClass::targets with a usage and test"
add a minimal demo/test for introduce MachineClass::targets

The next group, through
"meson: build combined qemu-system for multi-target configurations",
enabled the test guard to prevent introduce future calling
target_info() in type_init or class_init

These two boundaries provide possible merge points.

"targets" be exported along with MachineInfo in commit
"qmp: Expose supported targets in query-machines", so that the qmp know
how to set proper $<target>-<machine-name>.

The rest commits is the introduce of support of <target> select from
`-machine $type`.

Yonggang Luo (34):
  qemu/base-arch-defs: extract QEMU_ARCH_BIT for QEMU_ARCH_* enums
  qemu: Use SYS_EMU_TARGET__MAX to define QEMU_ARCH_ALL
  qemu: increase width of QEMU_ARCH_* masks enums to be 64 bits
  qapi: rename SysEmuTarget to EmuTarget
  qapi: add missing Linux user-mode targets to EmuTarget
  meson: define TARGET_ARCH_VARIANT to target_name only
  target-info: prepare the QOM target list before
    module_call_init(MODULE_INIT_QOM)
  hw: add MachineClass::targets with a usage and test
  accel: register CPU parent for each target
  meson: collect Rust crates for combined system target
  module: Add module_allow_all_arch for allow all modules be loaded
  target/arm: defer max-v8 initializer selection until CPU creation
  hw/microblaze: defer PetaLogix endianness default until init
  hw/pci: Avoid guard loadparm with target_s390x() for s390x in
    class_init
  hw/scsi: Avoid guard loadparm with target_s390x() for s390x in
    class_init
  hw/virtio/virtio-mem: Avoid call to target_info() in class_init
  target-info: add a combined-binary query stub
  machine: allow -M name to differ from QOM type
  hw/riscv/virt: use unique QOM name
  hw/arm/virt: use unique QOM name
  hw/or1k/virt: use unique QOM name
  hw/hexagon/virt: use unique QOM name
  hw/loongarch/virt: use unique QOM name
  hw/m68k/virt: use unique QOM name
  hw/xtensa/virt: use unique QOM name
  qapi: return MachineInfo typename from query-machines
  machine: match the versioned virt example to arm virt
  hw: Add MachineClass.targets for all "virt" machines for all possible
    targets
  system/arch_init: update qemu_arch_available to handle non-target
    select condition
  meson: build combined qemu-system for multi-target configurations
  qmp: Expose supported targets in query-machines
  system/vl: select target from machine name in combined binaries
  system/vl: handle cpu/device help properly for multi-target qemu
  qdev: Handle device alias ambiguous under multi-target qemu

 MAINTAINERS                              |   2 +
 accel/accel-common.c                     |   6 +-
 accel/accel-internal.h                   |   1 +
 accel/accel-system.c                     |  24 +++
 accel/accel-user.c                       |   7 +
 backends/igvm.c                          |   4 +-
 hw/alpha/dp264.c                         |   2 +
 hw/arm/virt.c                            |  56 +++----
 hw/core/machine-qmp-cmds.c               |  19 ++-
 hw/core/machine.c                        |   9 ++
 hw/hexagon/virt.c                        |  25 +++-
 hw/loongarch/virt.c                      |  47 +++---
 hw/m68k/virt.c                           |  39 +++--
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  11 +-
 hw/misc/vmlaunchupdate.c                 |   6 +-
 hw/or1k/virt.c                           |  22 +--
 hw/pci/pci.c                             |  18 ++-
 hw/riscv/virt.c                          |  28 ++--
 hw/scsi/scsi-disk.c                      |  18 ++-
 hw/uefi/ovmf-log.c                       |   4 +-
 hw/virtio/virtio-mem.c                   |  26 ++--
 hw/xtensa/virt.c                         |  24 ++-
 include/hw/arm/virt.h                    |   5 +-
 include/hw/core/boards.h                 |  45 ++++--
 include/hw/hexagon/virt.h                |   5 +-
 include/hw/loongarch/virt.h              |   5 +-
 include/hw/riscv/virt.h                  |   5 +-
 include/monitor/qdev.h                   |   7 +
 include/qemu/base-arch-defs.h            |  80 ++++++----
 include/qemu/module.h                    |   2 +
 include/qemu/target-info-def.h           |   2 +-
 include/qemu/target-info-qapi.h          |   4 +-
 include/qemu/target-info-qom.h           |   4 +
 include/qemu/target-info.h               |   7 +
 meson.build                              |  82 +++++++++-
 monitor/monitor-hmp-internal.h           |   2 +-
 qapi/machine.json                        |  44 +++---
 qapi/pragma.json                         |   4 +-
 qom/object.c                             |   4 +-
 stubs/meson.build                        |   1 +
 stubs/target-info.c                      |  10 ++
 system/arch_init.c                       |  12 +-
 system/qdev-monitor.c                    |  54 ++++++-
 system/target-info.c                     |  10 ++
 system/vl.c                              | 181 ++++++++++++++++++++---
 target-info-def.c                        |   2 +-
 target-info-qom.c                        |  26 +++-
 target-info.c                            |  38 ++---
 target/arm/tcg/cpu-max-v8.c              |  17 ++-
 tests/qtest/fuzz/fuzz.c                  |   2 +-
 tests/qtest/qom-test.c                   |  65 +++++++-
 tests/unit/meson.build                   |   4 +-
 tests/unit/test-multi-target.c           |  67 ++++++++-
 util/module.c                            |  10 +-
 54 files changed, 915 insertions(+), 289 deletions(-)
 create mode 100644 stubs/target-info.c
 create mode 100644 system/target-info.c

-- 
2.55.0.windows.3


