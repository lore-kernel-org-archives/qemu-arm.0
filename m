Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp636541ejb;
        Fri, 26 Apr 2024 12:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWu6Ptfv6AmtpvgH+nljvcNjPumb9MHZYXuBKwHGphHcy930NAgd6cDgZv/wSTWEUYua+zzVZW/Hs9lzc5ZlGEtOIfb2s3t
X-Google-Smtp-Source: AGHT+IETDQrI6JYZfcpf3ZgJfuHocy5tPWplzdJkEgbPP+G3bxNZEQaKL71rPZcW1zUnDiF3V3ex
X-Received: by 2002:ae9:e70e:0:b0:790:8803:c73a with SMTP id m14-20020ae9e70e000000b007908803c73amr3554666qka.66.1714160559784;
        Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160559; cv=none;
        d=google.com; s=arc-20160816;
        b=d7AB5b+85Ijh/X4UUr7M0D7BUKkUp73qHbuZLGiuH8tYhtW/GSKjpb5ubdZ2NIa6a5
         ItRELfH7lOrrvxSh3vr5vNqaWhaRJo4od0pHdifreQDLX9wPvueYxegLnZe77xVdc4P4
         hQ+cd9KY7FhblU744EthmewN4FisAeosAkjj2PV5uPt9PI9tQ1ZUymdNXan54jsrA6dn
         KyWDiZF3uPATEhFZs8mfe+T7iajLXMzdtunmdd0LJRM0BzIsP5hLA1d3EPBULcq1CbUY
         uo7JKbfjhTO95Wqz8B/Tzghxv0e7DCnL9J1R8Kx3W6c8zZKE9bkXfub1vXym3jjzgHJG
         ZkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=U3DFgau0bBFHqq3QQqiBFqK7p+j271JWuNvgAdtuSqI=;
        fh=4BTC8NfGPrsPM59AApn+wUkx9ffIWavWlOzYNYuZgJI=;
        b=Rx6GOjhprIDA0EOg08kZr1Sj0+RWTDRUg1RwYTgsciaVwPd7H/2pTSFH2rrGFxgdgR
         5utWz2pZCl5U8rQZbzjtWRv9eFuPiSCVJzRXYb7Sq+ETtGs8DdDMbpAlPOcPi1SZEgZK
         tq8KbfZpDkBqaabtgoEmY7oc1gBsZQsl5n+WIu8Ci2ONM8yxxbEK2sroWyiPnXdoeB+h
         uitq1Qmnsd+UpIDZ8ucBZigT6LqtTgkBYqi64MM5KZ+vMa22syGCrax3xNfDr6hl6ybP
         Hah1Pbz5xxlnub6ATJZV5UCPsIwy8kVLJRdl8eP4LupTBqLCx5xuf3FYvN/Jqb9kN/pF
         PQtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCK7hY1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xz19-20020a05620a5e1300b007907fad9a87si10332949qkn.668.2024.04.26.12.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCK7hY1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RST-0000Bf-0y; Fri, 26 Apr 2024 15:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSS-0000BR-5E
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:08 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSP-0002kg-Rx
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:07 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e37503115so2775897a12.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160523; x=1714765323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U3DFgau0bBFHqq3QQqiBFqK7p+j271JWuNvgAdtuSqI=;
 b=QCK7hY1m199XWVob6dpli3X8cHcgPrq/o5mKjnvJeG056m2T383g6DA2Ie+Salrivm
 HynFuCKRxzyek/6BQCoVapisRpN5rgAjicCCFC5Wyc4fFOs0O8XxFsZiwuIbJ91XaQEK
 vhmVQgB6UazZHOz0xYW2F2uQIsBbFiYreyqH6p2j3O3CtcCnw3Wix1BYOzgMHO6BrjgS
 6TjrSKSOMn3cHfDEE0lnFV2p9I8kuX2S2SgW/zGDraR96eP12Lr+Cc1Ln8uYBT+alpMX
 lwtqS/+XEsJ9Xeqg4vTYBF8XOPMkOpFP38fa5IRSHDKs97Fvhq4/up2aCZWVBP4L0H9o
 IxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160523; x=1714765323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U3DFgau0bBFHqq3QQqiBFqK7p+j271JWuNvgAdtuSqI=;
 b=XDS0aPS7FT8ThrXRXtPYQ/nUFa47/cwt1gClR6Avu4VYc636Q1xUTMdVS3za/zO1iv
 CbO/TW4NBiofBL+0DD/e/yO6BNuOqJI63FwFfWP8buNYfQ2Mva8nRDdMU+nM0ZC07IaS
 MF/cuLrRfMILVnsNeap30yfIfTkxLHt44yJa9jYC2t230YtohWwHarN5GBlVJ4JecKVM
 Bp09EBSR61owNPK8cpmfUkj5KDlbzdRNvDpiFKDclyi5Yp41+WgGPgGd0I0d9Myfc0+A
 up0kJAaugpXS3uPdfQQN/yGEQKZwbL/ZHnizE2EvHypVXk7JDYBL1ayhnMnIkF2RiIOR
 +cuA==
X-Gm-Message-State: AOJu0Yxsm1qYIECV/zWnnJtLI6rVChv9/6U4v79WV+QswHY8rouGrQbh
 EkZW+H64HLruBIpxGQVz2TSvIIoCtaqFTsjGnYCd+HvwM3tJ5kjjh6Zo4u375w4=
X-Received: by 2002:a50:871b:0:b0:571:fe99:df9e with SMTP id
 i27-20020a50871b000000b00571fe99df9emr1923252edb.40.1714160523351; 
 Fri, 26 Apr 2024 12:42:03 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 c8-20020a50d648000000b0057232df2e5dsm3090799edj.32.2024.04.26.12.42.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:42:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/38] Exec / accelerators patches
Date: Fri, 26 Apr 2024 21:41:20 +0200
Message-ID: <20240426194200.43723-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9bJlOrJ8P2We

The following changes since commit a118c4aff4087eafb68f7132b233ad548cf16376:

  Merge tag 'hw-misc-20240425' of https://github.com/philmd/qemu into staging (2024-04-25 09:43:29 -0700)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/accel-20240426

for you to fetch changes up to 671558d290ffb93752d3245e7c5604b04b6dcdf2:

  plugins: Include missing 'qemu/bitmap.h' header (2024-04-26 21:36:19 +0200)

Selfish PR, painfully tested commit by commit.
----------------------------------------------------------------
Accelerators patches

A lot of trivial cleanups and simplifications (moving methods around,
adding/removing #include statements). Most notable changes:

- Rename NEED_CPU_H -> COMPILING_PER_TARGET
- Rename few template headers using the '.h.inc' suffix
- Extract some definitions / declarations into their own header:
  - accel/tcg/user-retaddr.h (helper_retaddr)
  - include/exec/abi_ptr.h (abi_ptr)
  - include/exec/breakpoint.h (CPUBreakpoint, CPUWatchpoint)
  - include/exec/mmu-access-type.h (MMUAccessType)
  - include/user/tswap-target.h (tswapl, bswaptls)

----------------------------------------------------------------

Philippe Mathieu-Daudé (38):
  exec: Rename NEED_CPU_H -> COMPILING_PER_TARGET
  exec: Reduce tlb_set_dirty() declaration scope
  exec: Include 'cpu.h' before validating CPUArchState placement
  exec: Expose 'target_page.h' API to user emulation
  accel: Include missing 'exec/cpu_ldst.h' header
  gdbstub: Include missing 'hw/core/cpu.h' header
  gdbstub: Simplify #ifdef'ry in helpers.h
  gdbstub: Avoid including 'cpu.h' in 'gdbstub/helpers.h'
  semihosting/uaccess: Avoid including 'cpu.h'
  semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
  target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
  target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
  target/sparc: Replace abi_ulong by uint32_t for TARGET_ABI32
  target/i386: Include missing 'exec/exec-all.h' header
  accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
  accel/tcg: Include missing 'hw/core/cpu.h' header
  accel/tcg: Include missing headers in 'tb-jmp-cache.h'
  accel/tcg: Rename load-extract/store-insert headers using .h.inc
    suffix
  accel/tcg: Rename helper-head.h -> helper-head.h.inc
  accel/whpx: Use accel-specific per-vcpu @dirty field
  accel/nvmm: Use accel-specific per-vcpu @dirty field
  accel/hvf: Use accel-specific per-vcpu @dirty field
  exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
  exec/cpu-all: Remove unused 'qemu/thread.h' header
  exec/cpu-all: Remove unused tswapls() definitions
  exec: Declare target_words_bigendian() in 'exec/tswap.h'
  exec: Move [b]tswapl() declarations to 'exec/user/tswap-target.h'
  exec/user: Do not include 'cpu.h' in 'abitypes.h'
  exec: Declare abi_ptr type in its own 'abi_ptr.h' header
  exec: Declare MMUAccessType type in 'mmu-access-type.h' header
  exec: Declare CPUBreakpoint/CPUWatchpoint type in 'breakpoint.h'
    header
  exec: Restrict TCG specific declarations of 'cputlb.h'
  exec: Restrict 'cpu_ldst.h' to TCG accelerator
  exec: Rename 'exec/user/guest-base.h' as 'user/guest-base.h'
  exec: Restrict inclusion of 'user/guest-base.h'
  exec: Move CPUTLBEntry helpers to cputlb.c
  hw/core: Avoid including the full 'hw/core/cpu.h' in 'tcg-cpu-ops.h'
  plugins: Include missing 'qemu/bitmap.h' header

 MAINTAINERS                                   |   1 +
 meson.build                                   |   6 +-
 accel/tcg/tb-jmp-cache.h                      |   3 +
 accel/tcg/user-retaddr.h                      |  28 +++++
 bsd-user/freebsd/target_os_elf.h              |   1 +
 bsd-user/freebsd/target_os_stack.h            |   1 +
 bsd-user/netbsd/target_os_elf.h               |   1 +
 bsd-user/openbsd/target_os_elf.h              |   1 +
 include/exec/abi_ptr.h                        |  33 ++++++
 include/exec/breakpoint.h                     |  30 +++++
 include/exec/cpu-all.h                        |  16 +--
 include/exec/cpu-defs.h                       |   2 +-
 include/exec/cpu_ldst.h                       | 105 ++----------------
 include/exec/cputlb.h                         |   5 +
 include/exec/exec-all.h                       |   3 +-
 include/exec/memop.h                          |   4 +-
 include/exec/memory.h                         |   4 +-
 include/exec/mmu-access-type.h                |  18 +++
 include/exec/ram_addr.h                       |   1 +
 include/exec/translator.h                     |   5 +-
 include/exec/tswap.h                          |  16 ++-
 include/exec/user/abitypes.h                  |   8 +-
 include/exec/user/guest-base.h                |  12 --
 include/gdbstub/helpers.h                     |  12 +-
 include/hw/core/cpu.h                         |  42 +------
 include/hw/core/tcg-cpu-ops.h                 |   6 +-
 include/qemu/osdep.h                          |   2 +-
 include/qemu/plugin.h                         |   1 +
 include/semihosting/uaccess.h                 |   4 +-
 include/sysemu/hvf.h                          |   8 +-
 include/sysemu/hvf_int.h                      |   1 +
 include/sysemu/kvm.h                          |   6 +-
 include/sysemu/nvmm.h                         |   4 +-
 include/sysemu/whpx.h                         |   4 +-
 include/sysemu/xen.h                          |   4 +-
 include/user/guest-base.h                     |  18 +++
 include/user/tswap-target.h                   |  22 ++++
 target/alpha/cpu-param.h                      |   3 +
 target/alpha/cpu.h                            |   3 -
 target/arm/cpu-param.h                        |   8 +-
 target/arm/cpu.h                              |   3 -
 target/arm/internals.h                        |   1 +
 target/arm/kvm-consts.h                       |   4 +-
 target/avr/cpu-param.h                        |   2 +
 target/avr/cpu.h                              |   2 -
 target/hppa/cpu-param.h                       |   8 ++
 target/hppa/cpu.h                             |   6 -
 target/i386/cpu-param.h                       |   3 +
 target/i386/cpu.h                             |   3 -
 target/loongarch/cpu-param.h                  |   2 +
 target/loongarch/cpu.h                        |   2 -
 target/microblaze/cpu-param.h                 |   3 +
 target/microblaze/cpu.h                       |   3 -
 target/mips/cpu-param.h                       |   2 +
 target/mips/cpu.h                             |   2 -
 target/openrisc/cpu-param.h                   |   2 +
 target/openrisc/cpu.h                         |   2 -
 target/ppc/cpu-param.h                        |   2 +
 target/ppc/cpu.h                              |   2 -
 target/ppc/internal.h                         |   1 +
 target/riscv/cpu-param.h                      |   2 +
 target/riscv/cpu.h                            |   2 -
 target/riscv/debug.h                          |   2 +
 target/s390x/cpu-param.h                      |   6 +
 target/s390x/cpu.h                            |   3 -
 target/sparc/cpu-param.h                      |  23 ++++
 target/sparc/cpu.h                            |  23 ----
 target/xtensa/cpu-param.h                     |   3 +
 target/xtensa/cpu.h                           |   3 -
 ...al16-al8.h => load-extract-al16-al8.h.inc} |   0
 ...-insert-al16.h => store-insert-al16.h.inc} |   0
 ...al16-al8.h => load-extract-al16-al8.h.inc} |   0
 ...-insert-al16.h => store-insert-al16.h.inc} |   0
 ...al16-al8.h => load-extract-al16-al8.h.inc} |   0
 ...-insert-al16.h => store-insert-al16.h.inc} |   0
 ...al16-al8.h => load-extract-al16-al8.h.inc} |   0
 include/exec/helper-gen.h.inc                 |   2 +-
 .../exec/{helper-head.h => helper-head.h.inc} |   4 +-
 include/exec/helper-proto.h.inc               |   2 +-
 accel/hvf/hvf-accel-ops.c                     |  10 +-
 accel/stubs/tcg-stub.c                        |   4 -
 accel/tcg/cpu-exec.c                          |   3 +
 accel/tcg/cputlb.c                            |  53 ++++++++-
 accel/tcg/tcg-accel-ops.c                     |   2 +
 accel/tcg/translator.c                        |   1 +
 accel/tcg/user-exec.c                         |   1 +
 bsd-user/main.c                               |   1 +
 bsd-user/signal.c                             |   1 +
 bsd-user/strace.c                             |   1 +
 cpu-target.c                                  |   1 +
 disas/disas.c                                 |   1 +
 gdbstub/gdbstub.c                             |   1 +
 hw/audio/virtio-snd.c                         |   2 +-
 hw/core/cpu-sysemu.c                          |   2 +-
 hw/core/generic-loader.c                      |   2 +-
 hw/display/vga.c                              |   2 +-
 hw/virtio/virtio.c                            |   1 +
 linux-user/elfload.c                          |   2 +
 linux-user/i386/signal.c                      |   1 +
 linux-user/main.c                             |   1 +
 linux-user/ppc/signal.c                       |   1 +
 page-target.c                                 |  44 ++++++++
 semihosting/guestfd.c                         |   5 +-
 system/physmem.c                              |  30 -----
 target/arm/hvf/hvf.c                          |   4 +-
 target/avr/gdbstub.c                          |   1 +
 target/hexagon/translate.c                    |   1 +
 target/i386/hvf/hvf.c                         |   4 +-
 target/i386/hvf/x86hvf.c                      |   2 +-
 target/i386/nvmm/nvmm-all.c                   |  21 ++--
 target/i386/tcg/fpu_helper.c                  |   1 +
 target/i386/whpx/whpx-all.c                   |  23 ++--
 target/microblaze/cpu.c                       |   1 +
 target/microblaze/translate.c                 |   1 +
 target/ppc/excp_helper.c                      |   2 +-
 target/sparc/gdbstub.c                        |   2 +-
 target/target-common.c                        |  10 --
 target/tricore/gdbstub.c                      |   1 +
 tcg/tcg.c                                     |   2 +-
 accel/tcg/ldst_atomicity.c.inc                |   4 +-
 include/exec/helper-info.c.inc                |   2 +-
 scripts/analyze-inclusions                    |   6 +-
 target/meson.build                            |   2 -
 123 files changed, 488 insertions(+), 357 deletions(-)
 create mode 100644 accel/tcg/user-retaddr.h
 create mode 100644 include/exec/abi_ptr.h
 create mode 100644 include/exec/breakpoint.h
 create mode 100644 include/exec/mmu-access-type.h
 delete mode 100644 include/exec/user/guest-base.h
 create mode 100644 include/user/guest-base.h
 create mode 100644 include/user/tswap-target.h
 rename host/include/aarch64/host/{load-extract-al16-al8.h => load-extract-al16-al8.h.inc} (100%)
 rename host/include/aarch64/host/{store-insert-al16.h => store-insert-al16.h.inc} (100%)
 rename host/include/generic/host/{load-extract-al16-al8.h => load-extract-al16-al8.h.inc} (100%)
 rename host/include/generic/host/{store-insert-al16.h => store-insert-al16.h.inc} (100%)
 rename host/include/loongarch64/host/{load-extract-al16-al8.h => load-extract-al16-al8.h.inc} (100%)
 rename host/include/loongarch64/host/{store-insert-al16.h => store-insert-al16.h.inc} (100%)
 rename host/include/x86_64/host/{load-extract-al16-al8.h => load-extract-al16-al8.h.inc} (100%)
 rename include/exec/{helper-head.h => helper-head.h.inc} (98%)
 create mode 100644 page-target.c
 delete mode 100644 target/target-common.c

-- 
2.41.0

