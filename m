Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008849ejf;
        Tue, 16 Aug 2022 13:34:15 -0700 (PDT)
X-Received: by 2002:a05:6830:d07:b0:638:d0b1:c2c1 with SMTP id bu7-20020a0568300d0700b00638d0b1c2c1mr1424561otb.273.1660682055147;
        Tue, 16 Aug 2022 13:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682055; cv=none;
        d=google.com; s=arc-20160816;
        b=f5Eeliy3D/31j8ElAMJxa/FyRIBabGsILpe8rGx3v04R2RELlFq0Zt0A3LNXFvcr3F
         zQNoAKSp6swhx6bCvgaFFP12lZqwSnYCxJ6g7GhgVaf1bUUTNjyImEfcJKBGqecJOX0c
         ABXCchEZVQGn56haqtBrfffdDpr61aq+UYlbvXE45NzecKVuU0xZny64g/wyucTsFzBQ
         AyeC8510N3MFvdtmvHVfSJdcB36jbyC+x4SHDtbQiDFyebkrMHRoo1ZrX97LgTICnKY6
         afblgWLy7xBmG9MntsziwqHXwf9rqG2IJJJjeLXR0ol8mwJqf1FjTtaJI9BpbcEgCemH
         crAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=G8c2iuTDo4UvuF2iefnqT1KVHhsC+sQtSAyF/QMhIQM=;
        b=ngAgQ+LaM+uQ82kFhx0x2nwozZzRI0ZvaKr0jDOrV/Dkqs9pLZibwQa4qdz44MJaUD
         yZRnqAGGhui009B1T85qBW9ZqlMG9C5KtcBHRDWlNMQY/+CHbsoOBZnyAxJHS2PtGOri
         lGnEFhTjJBwezc7n1IaSWFGxct0CrTL0J8UfzyZwzAG6bF5I66QrwXoH+Bun4yevJsgT
         w8YOamELKE3hiPrhQQXeGM41HAFYSHHy3TwV+namqTDVa6zqKztzU0FeIU/F1P6jreFh
         i38vsRE/4cjm7xOAOOA6luJN5gzLvbBHfloRFQsdI9uwd2L9UI1I4QGAM0PFz1pw/lni
         pP2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0zIOOHS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p203-20020acaf1d4000000b00344c78e7eefsor1257563oih.106.2022.08.16.13.34.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0zIOOHS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=G8c2iuTDo4UvuF2iefnqT1KVHhsC+sQtSAyF/QMhIQM=;
        b=w0zIOOHS7ryC5iuQg72ubsMeLLPgjTuOPJ3tFEDfwQ0gavk1eJC5h6KXYzA1Z9RnO4
         tEPS0+udpkEiQL7Nc7k3KbhaPSwAbtFuxu/n8Uieg4uEfru4qO8Ur9/G9iUHvKsniM/C
         P3rLqCU1agm8OMMDBJjcieJj8//JywAe9NbPnZtYA/oPf5VunaMQpAgtxLQUCuZ2pGJ6
         MkWj5lcTgiqi0F9yWU07choNbBVU6dV56MrLbl2kT2HtwQQTDx55wf3SrRHJELLz2WAX
         FART2Hd9BzXN9DJYowsdP6+i5pPMXwqjPbwu9jOQpTEO95tPZ8MgfJ5zjux9/Pv2v/Ov
         TWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=G8c2iuTDo4UvuF2iefnqT1KVHhsC+sQtSAyF/QMhIQM=;
        b=2t1RAVJ4NmV0ujBSuWIu3BYzwCOEaSeTd/bS5GEhvLa/c3+ZW5IZlRx7Vt4NtBMdpE
         mcp7tG/brIuXDvmu/jXgu9S7TVX6fPte1UQZPrmoRfD9Dq4DZcITsrgGaNv5wNe9y8yy
         tvvX2G0vO2QXFgGifrRnwv05kfylCy5We+W/HJ2tfYAn2CQWA/v+TXDaVrGjFQW2OLly
         UPox+wGTwLu5BXUXrpIH/EY1pG2nqbA9EbxlKGSBz3OUUicykOpa/PWVHycZy3Z8LOlh
         H5tezXsTCiC86HGhWuDRkHgVuF6gbpf7T/XAWqU14LBTfstitK1kH/DKAiw5xf4wjAE9
         ZfEA==
X-Gm-Message-State: ACgBeo0P6otAuHbdxEVxNuSmO+d+0ChmvYcIJ+kv49j55YDZhyOYyAMJ
	vO+Ny31ribscn+CwuzAIVsorJ29RgDQEMmuR
X-Google-Smtp-Source: AA6agR57vG6MWxm9HtEq/26etcPAHY6doS70J5mZFCvIR+qFsBYS7CXodpCUKk45F/ZXRssjwiAnTg==
X-Received: by 2002:aca:6088:0:b0:343:75a6:d6a3 with SMTP id u130-20020aca6088000000b0034375a6d6a3mr155569oib.92.1660682045494;
        Tue, 16 Aug 2022 13:34:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 00/33] accel/tcg + target/arm: pc-relative translation
Date: Tue, 16 Aug 2022 15:33:27 -0500
Message-Id: <20220816203400.161187-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DjoLtnyHhmGh

Supercedes: 20220812180806.2128593-1-richard.henderson@linaro.org
("accel/tcg: minimize tlb lookups during translate + user-only PROT_EXEC fixes")

A few changes to the PROT_EXEC work that I posted last week, and
then continuing to the main event.

My initial goal was to reduce the overhead of TB flushing, which
Alex Bennee identified as a significant issue with respect to
booting AArch64 kernels under avocado.  Our initial guess was that
we need a more efficient data structure for walking TBs associated
with a physical page.

While I was looking at some of those numbers, I noted that we were
seeing up to 16000 TBs attached to a single page, which is well more
than I expected to see, and means that a new data structure isn't
going to help as much as simply reducing the number of translations.

It turns out the retranslation is due to the guest kernel's userland
address space randomization.  Each process gets e.g. libc mapped to
a different virtual address, which caused a new translation.

This, then, introduces some infrastructure for writing "pc-relative"
translation blocks, in which the guest pc is treated as a variable
just like any other guest cpu register.  The hashing for these TBs
are adjusted to compare the physical address.  The target/arm backend
is adjusted to use the new feature.

This does result in a significant reduction in translation.  From the
BootLinuxAarch64.test_virt_tcg_gicv2 test, at the login prompt:

    Before:

    gen code size       160684739/1073736704
    TB count            289808
    TB flush count      1
    TB invalidate count 235143

    After:

    gen code size       277992547/1073736704
    TB count            503882
    TB flush count      0
    TB invalidate count 69282

Before TARGET_TB_PCREL, we generate approximately 1.1GB of TBs
(overflow 1GB, flush, and fill 153MB again).  Afterward, we only
generate 265MB of TBs.

Surprisingly, this does not affect wall-clock times nearly as
much as I would have expected:

                                       before   after   change
 BootLinuxAarch64.test_virt_tcg_gicv2:  97.35    85.11   -12%
 BootLinuxAarch64.test_virt_tcg_gicv3: 102.75    96.87    -5%

Change in profile, top 10 entries before, matched up with after:

  before                                                           after
   9.01%  qemu-system-aar  [.] helper_lookup_tb_ptr                10.67%
   4.92%  qemu-system-aar  [.] qht_lookup_custom                    5.06%
   4.79%  qemu-system-aar  [.] get_phys_addr_lpae                   5.24%
   2.57%  qemu-system-aar  [.] address_space_ldq_le                 2.77%
   2.33%  qemu-system-aar  [.] liveness_pass_1                      0.60%
   2.24%  qemu-system-aar  [.] cpu_get_tb_cpu_state                 2.58%
   1.76%  qemu-system-aar  [.] address_space_translate_internal     1.75%
   1.71%  qemu-system-aar  [.] tb_lookup_cmp                        1.92%
   1.65%  qemu-system-aar  [.] tcg_gen_code                         0.44%
   1.64%  qemu-system-aar  [.] do_tb_phys_invalidate                0.09%


r~


Ilya Leoshkevich (1):
  accel/tcg: Introduce is_same_page()

Richard Henderson (32):
  linux-user/arm: Mark the commpage executable
  linux-user/hppa: Allocate page zero as a commpage
  linux-user/x86_64: Allocate vsyscall page as a commpage
  linux-user: Honor PT_GNU_STACK
  tests/tcg/i386: Move smc_code2 to an executable section
  accel/tcg: Remove PageDesc code_bitmap
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Make tb_htable_lookup static
  accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
  accel/tcg: Properly implement get_page_addr_code for user-only
  accel/tcg: Use probe_access_internal for softmmu
    get_page_addr_code_hostp
  accel/tcg: Add nofault parameter to get_page_addr_code_hostp
  accel/tcg: Unlock mmap_lock after longjmp
  accel/tcg: Raise PROT_EXEC exception early
  accel/tcg: Remove translator_ldsw
  accel/tcg: Add pc and host_pc params to gen_intermediate_code
  accel/tcg: Add fast path for translator_ld*
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start
  accel/tcg: Do not align tb->page_addr[0]
  include/hw/core: Create struct CPUJumpCache
  accel/tcg: Introduce tb_pc and tb_pc_log
  accel/tcg: Introduce TARGET_TB_PCREL
  accel/tcg: Split log_cpu_exec into inline and slow path
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Change gen_exception_internal to work on displacements
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 include/elf.h                           |   1 +
 include/exec/cpu-common.h               |   1 +
 include/exec/cpu-defs.h                 |   3 +
 include/exec/exec-all.h                 | 138 +++++++-------
 include/exec/plugin-gen.h               |   7 +-
 include/exec/translator.h               |  85 +++++++--
 include/hw/core/cpu.h                   |   9 +-
 linux-user/arm/target_cpu.h             |   4 +-
 linux-user/qemu.h                       |   1 +
 target/arm/cpu-param.h                  |   2 +
 target/arm/translate-a32.h              |   2 +-
 target/arm/translate.h                  |  21 ++-
 accel/tcg/cpu-exec.c                    | 222 +++++++++++++---------
 accel/tcg/cputlb.c                      |  98 +++-------
 accel/tcg/plugin-gen.c                  |  23 +--
 accel/tcg/translate-all.c               | 197 +++++++-------------
 accel/tcg/translator.c                  | 122 +++++++++---
 accel/tcg/user-exec.c                   |  15 ++
 linux-user/elfload.c                    |  81 +++++++-
 softmmu/physmem.c                       |  12 ++
 target/alpha/translate.c                |   5 +-
 target/arm/cpu.c                        |  23 +--
 target/arm/translate-a64.c              | 174 ++++++++++-------
 target/arm/translate-m-nocp.c           |   6 +-
 target/arm/translate-mve.c              |   2 +-
 target/arm/translate-vfp.c              |  10 +-
 target/arm/translate.c                  | 237 +++++++++++++++---------
 target/avr/cpu.c                        |   2 +-
 target/avr/translate.c                  |   5 +-
 target/cris/translate.c                 |   5 +-
 target/hexagon/cpu.c                    |   2 +-
 target/hexagon/translate.c              |   6 +-
 target/hppa/cpu.c                       |   4 +-
 target/hppa/translate.c                 |   5 +-
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/i386/tcg/translate.c             |   7 +-
 target/loongarch/cpu.c                  |   2 +-
 target/loongarch/translate.c            |   6 +-
 target/m68k/translate.c                 |   5 +-
 target/microblaze/cpu.c                 |   2 +-
 target/microblaze/translate.c           |   5 +-
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/mips/tcg/translate.c             |   5 +-
 target/nios2/translate.c                |   5 +-
 target/openrisc/cpu.c                   |   2 +-
 target/openrisc/translate.c             |   6 +-
 target/ppc/translate.c                  |   5 +-
 target/riscv/cpu.c                      |   4 +-
 target/riscv/translate.c                |   5 +-
 target/rx/cpu.c                         |   2 +-
 target/rx/translate.c                   |   5 +-
 target/s390x/tcg/translate.c            |   5 +-
 target/sh4/cpu.c                        |   4 +-
 target/sh4/translate.c                  |   5 +-
 target/sparc/cpu.c                      |   2 +-
 target/sparc/translate.c                |   5 +-
 target/tricore/cpu.c                    |   2 +-
 target/tricore/translate.c              |   6 +-
 target/xtensa/translate.c               |   6 +-
 tcg/tcg.c                               |   6 +-
 tests/tcg/i386/test-i386.c              |   2 +-
 62 files changed, 979 insertions(+), 666 deletions(-)

-- 
2.34.1
