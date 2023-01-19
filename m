Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp134167ejc;
        Wed, 18 Jan 2023 23:06:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtl4yUBhyEoQnS90MHgY2+ZPEmborn5W3ObNgAc60m8O1sm97YaviMhNhRi6Ej8yh8RZUW8
X-Received: by 2002:ac8:728c:0:b0:3b6:2f15:660d with SMTP id v12-20020ac8728c000000b003b62f15660dmr11071158qto.55.1674112012540;
        Wed, 18 Jan 2023 23:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674112012; cv=none;
        d=google.com; s=arc-20160816;
        b=0rfc7wvAk/sBbnoKEW/8Mi1mc//erMjUxzHw6xSE1/RWYeYuhY5hlrzZiWv1cR9sb6
         bCTlw2KTnnQHt9eXO2BEwiswUWajIOLBdJcOfBiqFBc2lDWiz3Y1LzeqfafEOyPAn028
         aDPhYzoV4skOk3lJeh+cTbaa5XaaQ4aFz9cbUyNwdPj52Pt/JNhDItlBU2Y32+Tboqie
         XZ6ohteCnlMLgFDqqUmsFOJeTxdcU5YucrNvUISSLag/uVSm8XRhHhdeE0uhxvps4ya5
         oEQnFidBiqquohbB9ympfQ3VMgeM6hKhYRrN6eTftb3UI3Pye6dh4kGiR+Z3deiY+9aT
         WJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QTrWewGIoykx+XnmrhebmHvWrWCti1OGcSiNiQ2VxVs=;
        b=aSlwddvGOtMT86n+kq4CnpxR+opa0OO/Xcm+9+o1RgKJHL7LIfeIcyyqorb5Mo1rQX
         /ECqlYq/zniSxyUH6sO1QRWJ7xnAmv/1bAuejzabhOI4h86mH8ujdWi9BNwbkpDgv/L3
         42kgYdI+Ylw02RqzakGsRPZAgEjBLa68+VyWYfUgIgkdNbhdkTmqcSlJvhHNF1ag/uwl
         KTSJS0a4v8NMuToNYKRiuih8Ka3P8nKn/Czgvz3Wjx0mErM/ZTuBnEkEFjiHBmvPMO1Q
         I2bBw5I5MH40fUaIZdKBHhA17WUOleQhGi277noQT4mX2cQUIFIFNEnYSNawPv02lx1z
         X6+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RVo2sc3b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge20-20020a05622a5c9400b003b634e53639si6328725qtb.288.2023.01.18.23.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RVo2sc3b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOuz-0006pW-99; Thu, 19 Jan 2023 02:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuO-0006RA-Pq
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuK-00087m-4o
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QTrWewGIoykx+XnmrhebmHvWrWCti1OGcSiNiQ2VxVs=;
 b=RVo2sc3b1csZz1niYpy0H06ZUwrRNnV1PWQRBApsKCJgstOK7Uo+TaPjQIcs5YkmEnRbmf
 wRh83pXRxzS+eI3FKgR8dijdyUIOagvfvbWVovZMDLgERpF4E82XcFaWqoYR9BhOGle3Ef
 /F21z9rHqKhO2WIW6AAhSgwXMKJRYM4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-wX_zTMW7Nn-CQSAWYa1Fkg-1; Thu, 19 Jan 2023 02:00:02 -0500
X-MC-Unique: wX_zTMW7Nn-CQSAWYa1Fkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0583D1C05ACA;
 Thu, 19 Jan 2023 07:00:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00F6B2166B29;
 Thu, 19 Jan 2023 07:00:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3E01821E6A28; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 00/19] Clean up includes
Date: Thu, 19 Jan 2023 07:59:40 +0100
Message-Id: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7q1JXS0tBSsA

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

Markus Armbruster (19):
  scripts/clean-includes: Fully skip / ignore files
  scripts/clean-includes: Don't claim duplicate headers found when not
  scripts/clean-includes: Skip symbolic links
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
 scripts/clean-includes            | 15 ++++++++++-----
 89 files changed, 29 insertions(+), 123 deletions(-)

-- 
2.39.0

