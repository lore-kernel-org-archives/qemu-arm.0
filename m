Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071115wrv;
        Wed, 31 Jul 2019 13:38:16 -0700 (PDT)
X-Received: by 2002:a63:4c12:: with SMTP id z18mr13007530pga.229.1564605496127;
        Wed, 31 Jul 2019 13:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605496; cv=none;
        d=google.com; s=arc-20160816;
        b=rm9OEaksuBROl90rZwWAZtZbZeAdjIo2ByV9P9QDJtWKj92WvSK5lJGDKbfAZRyFPF
         8VyKXU+tZtRm4DxEBSiLUq4MTCE7rhxet9Zyvo5n8DvlNkqVSpFLKavOZNHHkr1/mGao
         j/xCNKxHpp+eKx69H6iIlAvMXFx4NHIbLCqXImhjuPxfkRBXunO24WWseW3SPxEQS+RU
         EZiRxwd66b8+5g9/JWFzff+wv5rRGSJP+NlAzRNQLNxk8ErIsBDMGue9Iy24oH2U56pE
         UoQbF3tbfzn58DWJXy72qaJtNjXytsXA4dnCRyzY1ScKoypDkXPgHNoizoFlxqy9UkI4
         powg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=uzXV5HLfF+FU/RryNG65fjgIjJymPTRX0BzRxR8xdnQ=;
        b=jIvGr+reW3fjLAKzpWCZxtUIRYaCFIknL1A6HJnq1oFYHDOU6noFtTBJdPEcbVN0V9
         HjeLH9tsMYQAZl0s9QXwWMZV/pxfsaD5Qrzw9KGItm33SkUrvxZRlLGEPRINj6DOjaq/
         0kcV/IKhInwt28Fw6ZCdRq0Y+WG7Osq/JjojTuuS72FTiI1evnAzlUJNZdcdGEsbz0LU
         qtgwmO36N57aC29l04EG8poTgc588nWlwrw61bO5njV6rqFIPdKzNw6pn7qQrw5PQ+RI
         rop1+hZaVBnT8SaxQCj5eQSUcdSwb3Y+0Dg6iww2zFuYRZOaJLIejOJ6Lx+mnd+fGuSA
         REoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGsSntKI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f9sor83112441plr.31.2019.07.31.13.38.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGsSntKI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uzXV5HLfF+FU/RryNG65fjgIjJymPTRX0BzRxR8xdnQ=;
        b=UGsSntKITTmN6I+19W1OAe02o6viPBqZK+IkOyTqZkcpwfnRlG3dgZ26uh+T5mjdhJ
         04q/Q8BeHh4ITZbHy/WHKBiZ6SN/TkXGCingEb3wr9m7VgZL/fCV4Y5KvkUKKaOq+6kr
         Vr3BUx/ZATslD3FOa7DnYYJeOQ/ln3XZ4Ag7tqRa/t+kOdkGjzejBzHksWMuhggaL5cX
         W3uG1hwV+g/0FNMwImFwU4d8OGF4EhkbZN3Z3vE3O4glxABe+mmyoc0UYwknpNBK13ms
         WALDz5BtHBFxNM+M9dTmq4pvD9VpmDPzSdssBjYvjfQ1CaI8E9c0erZCdpkK3WwDPUxM
         UZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uzXV5HLfF+FU/RryNG65fjgIjJymPTRX0BzRxR8xdnQ=;
        b=tr74cWrsaVidLoVOLltJ2u0madOazlb5pxGUeOBz1h+AZIRWKCU/TvXnNNBBnYx7Xd
         JxA1tVAJ2/vbNcLl3r+gxcWMfjS/wMXdfCdkos9FJYXwZarti94Hw+Nl221h696cwHku
         IJRGiBrmcGmqoa///bG0Km85JtO6u8IguBEP+dWY+YcigRI/Kb12oYECethbZcG8G6gM
         iBvTKhf4/cWvVo9alnRFJDKFTF14y62eMOK7mZMlyEYY04y8k9BRZXTQKmBI+x9QO33M
         aTUwebbBB90MrQQ4IIbQsDsnWp4SQ/kNx8H1wrIUaQvpf4F3wygu6watTxtAIOkdCuJv
         XQZw==
X-Gm-Message-State: APjAAAXAgSzGK3UFjjA0QwE2tUyx47d5nZEBH83Q25POKAZrt09HNbIU
	0taj8W10Mz1Ub4R8/nP5LZHQbNqc
X-Google-Smtp-Source: APXvYqyifwAob4uYGIzCTmix12IafdixE6Uo4eepaTB4923sVmp1ZsnXYkGQj9KI/XPe2kvd02ZJXw==
X-Received: by 2002:a17:902:2929:: with SMTP id g38mr101488206plb.163.1564605495556;
        Wed, 31 Jul 2019 13:38:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 00/32] target/arm: Implement ARMv8.1-VHE
Date: Wed, 31 Jul 2019 13:37:41 -0700
Message-Id: <20190731203813.30765-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DB337k+kO3p6

About half of this patch set is cleanup of the qemu tlb handling
leading up to the actual implementation of VHE, and the biggest
piece of that: The EL2&0 translation regime.

Changes since v1:
  * Merge feedback from AJB.
  * Split out 7 renaming patches from "Reorganize ARMMMUIdx".
  * Alex's MIDR patch keeps the nested KVM from spitting warnings.

I have tested 

  qemu-system-aarch64 -accel kvm -cpu host -M virt,gic-version-host \
    -m 512 -bios /usr/share/edk2/aarch64/QEMU_EFI.fd -nographic

with fedora 30 system qemu, itself booted with

  ../bld/aarch64-softmmu/qemu-system-aarch64 \
    -cpu max -M virt,gic-version=3,virtualization=on \
    -drive if=virtio,file=./f30.q,format=qcow2 \
    -m 4G -nographic

It took a while, but eventually the nested bios arrived at the
pxe boot sequence.  Thankfully (?), the f30 shipped bios has
debug enabled, so there's some sense of progress in the meantime.


r~


Alex Bennée (2):
  target/arm: check TGE and E2H flags for EL0 pauth traps
  target/arm: generate a custom MIDR for -cpu max

Richard Henderson (30):
  cputlb: Add tlb_set_asid_for_mmuidx
  cputlb: Add tlb_flush_asid_by_mmuidx and friends
  target/arm: Install ASIDs for long-form from EL1
  target/arm: Install ASIDs for short-form from EL1
  target/arm: Install ASIDs for EL2
  target/arm: Define isar_feature_aa64_vh
  target/arm: Enable HCR_E2H for VHE
  target/arm: Add CONTEXTIDR_EL2
  target/arm: Add TTBR1_EL2
  target/arm: Update CNTVCT_EL0 for VHE
  target/arm: Add the hypervisor virtual counter
  target/arm: Add VHE system register redirection and aliasing
  target/arm: Split out vae1_tlbmask, vmalle1_tlbmask
  target/arm: Simplify tlb_force_broadcast alternatives
  target/arm: Rename ARMMMUIdx*_S12NSE* to ARMMMUIdx*_E10_*
  target/arm: Rename ARMMMUIdx_S2NS to ARMMMUIdx_Stage2
  target/arm: Rename ARMMMUIdx_S1NSE* to ARMMMUIdx_Stage1_E*
  target/arm: Rename ARMMMUIdx_S1SE* to ARMMMUIdx_SE*
  target/arm: Rename ARMMMUIdx*_S1E3 to ARMMMUIdx*_SE3
  target/arm: Rename ARMMMUIdx_S1E2 to ARMMMUIdx_E2
  target/arm: Reorganize ARMMMUIdx
  target/arm: Add regime_has_2_ranges
  target/arm: Update arm_mmu_idx for VHE
  target/arm: Update arm_sctlr for VHE
  target/arm: Install asids for E2&0 translation regime
  target/arm: Flush tlbs for E2&0 translation regime
  target/arm: Update arm_phys_excp_target_el for TGE
  target/arm: Update regime_is_user for EL2&0
  target/arm: Update {fp,sve}_exception_el for VHE
  target/arm: Enable ARMv8.1-VHE in -cpu max

 include/exec/cpu-all.h     |  11 +
 include/exec/cpu-defs.h    |   2 +
 include/exec/exec-all.h    |  35 ++
 include/qom/cpu.h          |   2 +
 target/arm/cpu-qom.h       |   1 +
 target/arm/cpu.h           | 260 +++++-----
 target/arm/internals.h     |  62 ++-
 target/arm/translate.h     |   2 +-
 accel/tcg/cputlb.c         |  81 +++
 target/arm/arch_dump.c     |   2 +-
 target/arm/cpu.c           |   2 +
 target/arm/cpu64.c         |  20 +
 target/arm/debug_helper.c  |  50 +-
 target/arm/helper-a64.c    |   2 +-
 target/arm/helper.c        | 983 ++++++++++++++++++++++++++-----------
 target/arm/m_helper.c      |   6 +-
 target/arm/pauth_helper.c  |  13 +-
 target/arm/translate-a64.c |  13 +-
 target/arm/translate.c     |  17 +-
 19 files changed, 1088 insertions(+), 476 deletions(-)

-- 
2.17.1
