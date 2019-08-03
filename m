Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200818wrv;
        Sat, 3 Aug 2019 11:48:03 -0700 (PDT)
X-Received: by 2002:a63:553:: with SMTP id 80mr133213555pgf.280.1564858083649;
        Sat, 03 Aug 2019 11:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858083; cv=none;
        d=google.com; s=arc-20160816;
        b=BOlEeAeMMmEy6l2DnjgDwJeBQBIt+FyfUZyU/ylW2Y5TtG7R0LRxuRE6zOGD3oKYXe
         mhMNL9phblJz+7LmPeFS1Ag+CDu5YQNAdnaznKMSgn9OVU+IFMdGUL9hk9FQ0nQfW14u
         gMEqkgKygEI65EUmykrij+VehnoV0qsciryQOow4J5swH7SvSgxAjRyZh5Kk8nq89mmA
         J+n5LBVij/N57K2fUYLC84kmoK8devWNOEvP+kFxldEACpqw49OTieZZh8O1BByefEe6
         y7tlaRcKDpua6u4LMRH8VcDMEKlYkUP8UnlwDARuErECd1oQQghJd6UxJvddtt7YKBZ9
         rEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Mdp2g3jSgzrGtd9KtHgOE+2yumLnmy9dW9qf3A8Vh/A=;
        b=wAD6+Y6KIbonZ6YLBiXZ7KsPekNmLEZWotg/KYDM+BMdGDBjbnjz4UNlnQ3UyQb480
         /jYU4VYmRajO7vT1OssfVP8oaYyvxG15tjijlbswzIMCajdGX86JC492hbNULPEFCcVl
         nnXHcvRmlc2Xy9aAgHaNu9tcsSB3JYjAK0UVPq4OKMBuYpy186RIRY+RkmrGTr2e0x/w
         v5U8IYrcqlZ5ohEjdMh3mDEs0Clf2izYVtvhIzH6TiFXcGFCqTCknndWEYrd6zoAacvT
         rsAY8vdaeJtH7mPjwcnX0l0Fo1Ri13AbR8VAshMxEM+8926GTTTOGrxk3WYZjFox6Vwi
         vuNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/WffFcz";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x27sor60226910pfo.43.2019.08.03.11.48.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/WffFcz";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mdp2g3jSgzrGtd9KtHgOE+2yumLnmy9dW9qf3A8Vh/A=;
        b=M/WffFczN/fF0BKujryYFO7wtRBF0xlsTxmkm/n2qqwNGBn6fj5IZIGUl+y0zN4O+J
         MqJ2/KI0Opah1zmQsgGJOj7gNoXROcEpWp+jO+W+LeZr6nobami600pIy/qAOL+RxVfL
         FWXxV8hJmxoqxVK7ebqkI1wdU056Y4fwXjaEU/0AP7Zbm+mZ7jDiFzlQmfDsMysXQOv1
         FnK2GHwLpHzSr4TF5pYvHEnlkwnQh2bIHyVQcUgd2vpu2Nv0XPLfkKiUgfPE8UVYtC/w
         N4HUJHTF35aN3vSEQpudO3w8Dk2ZW/ZsdjJ6h8ouC9GbcTcDXj23fuVr8pwtkdAtuyCO
         CsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mdp2g3jSgzrGtd9KtHgOE+2yumLnmy9dW9qf3A8Vh/A=;
        b=BKNEJnNR7MB+UB7IN+OMp38EFk5NVjGfudFVXFIWPC+21lkWGcJ+IRnos3xA9jXytP
         ehQJiQIljdHW3oGeO1ZPNDQYoeWJXMYzI8Hn9izF3dTPuEIqdI7YwFPdrJsmbGmRj9jC
         nhZRKPNSy7osN6t1tlD4Tl/PddcI5jY1LmJup8OP9qHigtPEsvJxTiNcgS4DfPMijfbv
         hjMRnTafWknD815sjkt6q2SnvQMVEJL8U6lesqTB4O0+7mgvFNfnHz+2WaPlwh/B52ix
         lJyAZZu2Io7naLVLrfvadzk/IEKmHP0lkwykYT52HYKLXWnk+kqq/xCL43xLvXkDpqPp
         1jlw==
X-Gm-Message-State: APjAAAVFmipRD0qOgmBq9JjzJn6TwjRyZ2fLc/RcTSW10KU6gQGUAZmV
	D2MNAEPzWvDuwi/GKBz/nmP9XgFQNxahIQ==
X-Google-Smtp-Source: APXvYqym32Jjcqm6Y5uD9VOGwQumhKcN0/1ZruKLacdjKeyh1L+2lBKh7SShcpX6bfXFE13wffbkKw==
X-Received: by 2002:aa7:8705:: with SMTP id b5mr13375773pfo.27.1564858083031;
        Sat, 03 Aug 2019 11:48:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 00/34] target/arm: Implement ARMv8.1-VHE
Date: Sat,  3 Aug 2019 11:47:26 -0700
Message-Id: <20190803184800.8221-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iXR2aJK0TtbR

About half of this patch set is cleanup of the qemu tlb handling
leading up to the actual implementation of VHE, and the biggest
piece of that: The EL2&0 translation regime.

Changes since v2:
  * arm_mmu_idx was incomplete; test TGE+E2H not just E2H.
  * arm_sctlr was incomplete; now uses arm_mmu_idx to avoid
    duplication of tests.
  * Update aa64_zva_access and ctr_el0_access for EL2.

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

Richard Henderson (32):
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
  target/arm: Update aa64_zva_access for EL2
  target/arm: Update ctr_el0_access for EL2
  target/arm: Install asids for E2&0 translation regime
  target/arm: Flush tlbs for E2&0 translation regime
  target/arm: Update arm_phys_excp_target_el for TGE
  target/arm: Update regime_is_user for EL2&0
  target/arm: Update {fp,sve}_exception_el for VHE
  target/arm: Enable ARMv8.1-VHE in -cpu max

 include/exec/cpu-all.h     |   11 +
 include/exec/cpu-defs.h    |    2 +
 include/exec/exec-all.h    |   35 ++
 include/qom/cpu.h          |    2 +
 target/arm/cpu-qom.h       |    1 +
 target/arm/cpu.h           |  261 ++++-----
 target/arm/internals.h     |   62 ++-
 target/arm/translate.h     |    2 +-
 accel/tcg/cputlb.c         |   81 +++
 target/arm/cpu.c           |    2 +
 target/arm/cpu64.c         |   20 +
 target/arm/debug_helper.c  |   50 +-
 target/arm/helper-a64.c    |    2 +-
 target/arm/helper.c        | 1042 +++++++++++++++++++++++++-----------
 target/arm/m_helper.c      |    6 +-
 target/arm/pauth_helper.c  |   13 +-
 target/arm/translate-a64.c |   13 +-
 target/arm/translate.c     |   17 +-
 18 files changed, 1134 insertions(+), 488 deletions(-)

-- 
2.17.1
