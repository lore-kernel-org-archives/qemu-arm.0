Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp941495ejb;
        Mon, 30 Jan 2023 05:23:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/bywuwZeVA6+V2i2MjZwqq/FupRgWZaWlyPl9I3N1cbE6TxU1nWgZwlY4FlwmLwudNW06Q
X-Received: by 2002:a05:6214:1801:b0:537:6843:5187 with SMTP id o1-20020a056214180100b0053768435187mr9825238qvw.23.1675084988369;
        Mon, 30 Jan 2023 05:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675084988; cv=none;
        d=google.com; s=arc-20160816;
        b=KTR2/bjDHN+1pIvW+gvc3QjZYbihlbnKGWGqj+nfs7qPKVBisQByzMcQQ2MJywHG2y
         yfhjpFsc439z9hJyVFzXihblHQdtcrE170VFTrsOB7aPGtdWIaVQiBvp0/gQXbxy9Lvu
         d6EAb/gHPVqFJLZpanaZlldq9cdrx6nIqAcTui8dwn/BUAIQ2ikeSHXydS0pjYJZaQ8L
         4l3nEulFADtgjZqcvHiPlZXE2cqi2xJQjnWgzMrW67Yx7AXUpBBTeGsUzEw+nZQwxgXQ
         Ak96EPnkOsOwesRT+Hq5DKsg4zIyHEaq6sEnb0QdYmWsSr5xdWF3OZ8u7UBI1axE4eol
         ZQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DJiHbzsUPbzscCIZ93jw6C9YFJo0iZODwW3q92R4LoU=;
        b=E6HslPIw4otzQb6meBqT37QxiJYIbJCau4l62q4BciCCOpNDeVYHwpRgp4rDwOSNQX
         Gat7Zp5fE9pA4c8adzqorz4t8lFudEoYft3GjjZcV16RUKj4JduAtBufQyPvsRA1xnNw
         F+vdY40DH0u/eWWt7h1UxBnKRR4mz0AxZUHzK8CEnyC4k8FEy5KzZFNPSo0PZt0U0OSS
         yYacW8Fk0Zt22ubTSgmfgDckMI8iEE3DKyhJKzAtG9n4YQBufo+g5kXbsQbFcrM6n2fh
         2hERTSpFHV55P6pjpAIOWn3UCj+sGtbMJi1tj/890T5qqPB5RDgTgG+aKcHu0t9IlS/i
         aq8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bzOjwhu4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc15-20020a056214230f00b0053564fe11e1si7084056qvb.447.2023.01.30.05.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:23:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bzOjwhu4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU75-00052N-Li; Mon, 30 Jan 2023 08:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6p-0004G3-Ru
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6k-0005h6-Ky
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DJiHbzsUPbzscCIZ93jw6C9YFJo0iZODwW3q92R4LoU=;
 b=bzOjwhu4t/qS8ylvIbiCvtrDcAxRWTT2X4dT9S+VYJyu2crUH9DtUrQDojR5PJSc9jfMsR
 xp5Sf+U7FeLTEPp8fFq4EzOcoEjnLlRgUVv0MbtUphAoilWwwsgjdgIUzJ505uXU+5I9Qi
 +8inCoECdEQ/XGAGNfxcNB0TJhYI7zQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-eMNRH04WOKGCe40U5o3sAQ-1; Mon, 30 Jan 2023 08:21:58 -0500
X-MC-Unique: eMNRH04WOKGCe40U5o3sAQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 935308828C2;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B21F492B00;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D24421E6A1F; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 00/20] Clean up includes
Date: Mon, 30 Jan 2023 14:21:36 +0100
Message-Id: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0IUvgX28wMDi

Back in 2016, we discussed[1] rules for headers, and these were
generally liked:

1. Have a carefully curated header that's included everywhere first.  We
   got that already thanks to Peter: osdep.h.

2. Headers should normally include everything they need beyond osdep.h.
   If exceptions are needed for some reason, they must be documented in
   the header.  If all that's needed from a header is typedefs, put
   those into qemu/typedefs.h instead of including the header.

3. Cyclic inclusion is forbidden.

This series fixes violations of rule 2.  I may have split patches too
aggressively.  Let me know if you want some squashed together.

v4:
* PATCH 01+02: Commit message Fixes: format adjusted [Michael]
* PATCH 04: New [David]
* PATCH 05-16: Commit messages updated for PATCH 04

v4:
* PATCH 01-03: New
* PATCH 04-15: Previous version redone with scripts/clean-includes,
  	       result split up for review
* PATCH 16-19: New

v3:
* Rebased, old PATCH 1+2+4 are in master as commit
  881e019770..f07ceffdf5
* PATCH 1: Fix bsd-user

v2:
* Rebased
* PATCH 3: v1 posted separately
* PATCH 4: New

[1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

Markus Armbruster (20):
  scripts/clean-includes: Fully skip / ignore files
  scripts/clean-includes: Don't claim duplicate headers found when not
  scripts/clean-includes: Skip symbolic links
  scripts/clean-includes: Improve --git commit message
  bsd-user: Clean up includes
  crypto: Clean up includes
  hw/cxl: Clean up includes
  hw/input: Clean up includes
  hw/tricore: Clean up includes
  qga: Clean up includes
  migration: Clean up includes
  net: Clean up includes
  target/hexagon: Clean up includes
  riscv: Clean up includes
  block: Clean up includes
  accel: Clean up includes
  Fix non-first inclusions of qemu/osdep.h
  Don't include headers already included by qemu/osdep.h
  9p: Drop superfluous include of linux/limits.h
  Drop duplicate #include

 backends/tpm/tpm_ioctl.h          |  2 --
 bsd-user/bsd-proc.h               |  4 ----
 bsd-user/qemu.h                   |  1 -
 crypto/block-luks-priv.h          |  1 -
 fsdev/p9array.h                   |  2 --
 include/block/graph-lock.h        |  1 -
 include/block/write-threshold.h   |  2 --
 include/hw/arm/fsl-imx6ul.h       |  1 -
 include/hw/arm/fsl-imx7.h         |  1 -
 include/hw/cxl/cxl_component.h    |  2 --
 include/hw/cxl/cxl_host.h         |  1 -
 include/hw/cxl/cxl_pci.h          |  1 -
 include/hw/input/pl050.h          |  1 -
 include/hw/misc/aspeed_lpc.h      |  2 --
 include/hw/pci/pcie_doe.h         |  1 -
 include/hw/tricore/triboard.h     |  1 -
 include/qemu/async-teardown.h     |  2 --
 include/qemu/dbus.h               |  1 -
 include/qemu/host-utils.h         |  1 -
 include/qemu/userfaultfd.h        |  1 -
 include/sysemu/accel-blocker.h    |  1 -
 include/sysemu/event-loop-base.h  |  1 -
 net/vmnet_int.h                   |  1 -
 qga/cutils.h                      |  2 --
 target/hexagon/hex_arch_types.h   |  1 -
 target/hexagon/mmvec/macros.h     |  1 -
 target/riscv/pmu.h                |  1 -
 accel/tcg/cpu-exec.c              |  1 -
 audio/sndioaudio.c                |  2 +-
 backends/hostmem-epc.c            |  2 +-
 backends/tpm/tpm_emulator.c       |  1 -
 block/export/vduse-blk.c          |  2 +-
 block/qapi.c                      |  1 -
 bsd-user/arm/signal.c             |  1 +
 bsd-user/arm/target_arch_cpu.c    |  2 ++
 bsd-user/freebsd/os-sys.c         |  1 +
 bsd-user/i386/signal.c            |  1 +
 bsd-user/i386/target_arch_cpu.c   |  3 +--
 bsd-user/main.c                   |  4 +---
 bsd-user/strace.c                 |  1 -
 bsd-user/x86_64/signal.c          |  1 +
 bsd-user/x86_64/target_arch_cpu.c |  3 +--
 hw/9pfs/9p.c                      |  5 -----
 hw/acpi/piix4.c                   |  1 -
 hw/alpha/dp264.c                  |  1 -
 hw/arm/virt.c                     |  1 -
 hw/arm/xlnx-versal.c              |  1 -
 hw/block/pflash_cfi01.c           |  1 -
 hw/core/machine.c                 |  1 -
 hw/display/virtio-gpu-udmabuf.c   |  1 -
 hw/hppa/machine.c                 |  1 -
 hw/hyperv/syndbg.c                |  2 +-
 hw/i2c/pmbus_device.c             |  1 -
 hw/i386/acpi-build.c              |  1 -
 hw/input/tsc210x.c                |  1 -
 hw/loongarch/acpi-build.c         |  1 -
 hw/misc/macio/cuda.c              |  1 -
 hw/misc/macio/pmu.c               |  1 -
 hw/net/xilinx_axienet.c           |  1 -
 hw/ppc/ppc405_uc.c                |  2 --
 hw/ppc/ppc440_bamboo.c            |  1 -
 hw/ppc/spapr_drc.c                |  1 -
 hw/rdma/vmw/pvrdma_dev_ring.c     |  1 -
 hw/remote/machine.c               |  1 -
 hw/remote/proxy-memory-listener.c |  1 -
 hw/remote/remote-obj.c            |  1 -
 hw/rtc/mc146818rtc.c              |  1 -
 hw/s390x/virtio-ccw-serial.c      |  1 -
 hw/sensor/adm1272.c               |  1 -
 hw/usb/dev-storage-bot.c          |  1 -
 hw/usb/dev-storage-classic.c      |  1 -
 migration/postcopy-ram.c          |  2 --
 qga/commands-posix.c              |  1 -
 qga/cutils.c                      |  3 ++-
 softmmu/dirtylimit.c              |  1 -
 softmmu/runstate.c                |  1 -
 softmmu/vl.c                      |  3 ---
 target/loongarch/translate.c      |  1 -
 target/mips/tcg/translate.c       |  1 -
 target/nios2/translate.c          |  2 --
 tcg/tci.c                         |  1 -
 tests/unit/test-cutils.c          |  1 -
 tests/unit/test-seccomp.c         |  1 -
 ui/gtk.c                          |  1 -
 ui/udmabuf.c                      |  1 -
 util/async-teardown.c             | 12 ++++--------
 util/main-loop.c                  |  1 -
 util/oslib-posix.c                |  6 ------
 scripts/clean-includes            | 19 ++++++++++++-------
 89 files changed, 31 insertions(+), 125 deletions(-)

-- 
2.39.0

