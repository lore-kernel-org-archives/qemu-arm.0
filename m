Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979657ejc;
        Mon, 22 Aug 2022 08:28:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4krpub9iwmkK4rENKVtkSTrVr8MrYYxrU0bH6BnQJtGKxOFnu8MJZydhwNt+riTZKh608l
X-Received: by 2002:a05:620a:468e:b0:6bb:1974:ef78 with SMTP id bq14-20020a05620a468e00b006bb1974ef78mr12734676qkb.87.1661182096564;
        Mon, 22 Aug 2022 08:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182096; cv=none;
        d=google.com; s=arc-20160816;
        b=HRRcn6LZMAn2wXBvgbp2EmRha0KWkp21bqmm3ijdgbwVnqzGNE+gmSVxjL/Hv2byD7
         1fLKbMGX7h8Lf0o0TW/psEQYnMLNSlB3TLd/FyT8+CStxl3E4X3hrigM0GIJdgY7LfC6
         FEMpSBOy8rBsCItFwy6zOR1Q0l1uuBauy2RxUUN4TDO0TVdv8rWqJ+vLPQ6J+L51+wgg
         6VEtT+C/RQ+R8eOvMqu+vcTDxRPnpV/eWudopaW4l5bULwC2XqY5DdUH0JCe5svaCMst
         zwrtnol84ne78V/h6ORcVidVMPreEgV6a9qJ+5Wj7FH7fivn1mMVcg8R904BHR1ukbub
         cKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vL62SPLHXf4JeQ7NMLR/S0ogrmKS1uKF6rjwPnQFrmE=;
        b=Gqwvj01UT+swyJqxP2MaRkBaA6NL7eco8uU6OyYDKcFFUChjIoL2XERFnDKm+Fzh0K
         epQ45mO1VhwTXiciORhyV3IhwYYzwURt1UEONSv+HgpTm2lLR8JJqIwzQNMnfMps8nqg
         VyIwJGR/VWHsHa3SDXwUZ0hTqh+0JKVrsY+RQGkWULWBfaF/0N0Q9dN1GhCiQOOnQU9K
         JJetR/ctuKx/N2/4zp2yOaXbhUPIzRW53BGLjN7bpIfZSjbKxAkXho7gDOHINZlge9Lf
         DN74qqSmDGNWNT34/q1eI5tbewEUvbaDxmYkZewYFUeKoS/4rixSYiI2sRcte/uJm4IJ
         MydA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8L0vWje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ad45aa5000000b0046e741042b3si4936877qvg.196.2022.08.22.08.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 08:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8L0vWje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ9Lb-00072I-Ut
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L9-0006y1-Du
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:27:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L6-0000dd-9L
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:27:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id e19so10136847pju.1
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=vL62SPLHXf4JeQ7NMLR/S0ogrmKS1uKF6rjwPnQFrmE=;
 b=Z8L0vWje0pvw2QVYdeqCO5TodlW5F5gnUtKHiHXYV3zGO4q1onAngx3cZAnRGqhEit
 R80lApKWu7p1LSgyfFEr5e1CZgsfKZIDSTL/4cIqOCwYaLjW/pEWpXPygirwYYfpeweS
 u+JzIuWVrDR885j1s0HjCV9HAULLdJDfBz+Kpze1w6Nh5ZNXp4ph4qbKXUqYQY3MkrpD
 uOCDPDCEPZ4hysF5YlyiGT1qekK0CPQcEifgv5S2UR4XVtG4FFff3QAv+vtVkv5xQ1JW
 D2WEGiggsqYIhBUmvVJ8BKJdCHGNve0oRyJp4QcBfbO1h0d9VMLo/Y8kGwMzVU1lrR7d
 sFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=vL62SPLHXf4JeQ7NMLR/S0ogrmKS1uKF6rjwPnQFrmE=;
 b=bm0LD02px8WN+BrqNUz9fK6il8E/JFmDq2lFy9eVQ56tUvmv4fTZ6COUi7B32ZYeFr
 qEwyjjsnUij1sG66nNiCjbmUMmVCDgtrJ1l+KaQXhCzC9FT/HxxJP66Lbh/TP+JNv9CF
 CZDk0Cb1+adczHoaG/7G9vx7mbR5JGmEvTDpXgphW/n4lJVAAqQmY3gNw61wh/hE6wdN
 iT6PKng072FscFGqwr49BClopXfZ/G5CENhiM7HWIy50VUoQ+lbBz16JG52QzNf+DDgc
 L3yF+A7fKvy1sOE2b7OYSHi/NvDwAcwTgS9NebT+sMpjH7GjuIWHbwfuQHr9AxAOo62A
 USew==
X-Gm-Message-State: ACgBeo0Ff2tfQrHR1fTBMJTHberR0nV30nDScJf2bdw9cn2qHF1+OQpf
 i4OuEKUxtKoXYpHAsTFZWgXsMw==
X-Received: by 2002:a17:902:e5c6:b0:16e:f3b6:ddb5 with SMTP id
 u6-20020a170902e5c600b0016ef3b6ddb5mr20646139plf.122.1661182062420; 
 Mon, 22 Aug 2022 08:27:42 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/66] target/arm: Implement FEAT_HAFDBS
Date: Mon, 22 Aug 2022 08:26:35 -0700
Message-Id: <20220822152741.1617527-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ef2NLCJT00TS

This is a major reorg to arm page table walking.  While the result
here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
(HAFDBS), the ultimate goal is the Realm Management Extension (RME).
RME "recommends" that HAFDBS be implemented (I_CSLWZ).

For HAFDBS, being able to find a host pointer for the ram that
backs a given page table entry is required in order to perform the
atomic update to that PTE.  The easiest way to find a host pointer
is to use the existing softtlb mechanism.  Thus all of the page
table walkers have been adjusted to take an mmu_idx that corresponds
to the regime in which the page table is stored.  In some cases,
this is a new "physical" mmu_idx that has a permanent 1-1 mapping.

For RME, "physical" addresses also have page permissions, coming
from the Root realm Granule Protection Table, which can be thought
of as a third stage page table lookup.  So eventually the new
Secure and Nonsecure physical mmu indexes will joined by
Realm and Root physical mmu indexes, and all of them will take
the new Granule Page Table into account.

Previously, we had A-profile allocate separate mmu_idx for secure
vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
when SCR_EL3.NS is changed.  I did not see how we could reasonably
add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
Trusted Firmware, at the code paths used to change between Secure
and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
to keep them live at the same time within qemu.

Major changes for v2:
  * Sort as much pure arm cleanup to the front.  Most, but
    not all, of the first 20 have been reviewed.

  * The accel/tcg changes are completely different.  I have renamed the
    IOTLB, because it's no longer IO specific.  I've dropped the
    PageEntryExtra struct, and standardized on the renamed CPUTLBEntryFull
    struct, which now includes the phys_addr, page protection, and log2
    page size; the target-specific fields are included via macro.
    The whole CPUTLBEntryFull struct is passed to the new tlb_set_page_full,
    simplifying usage; the struct is returned by the new probe_access_full.

    I've been working on an x86_64 conversion to CPUTLBEntryFull as well,
    both to figure out what another target needs, and to fix
    https://gitlab.com/qemu-project/qemu/-/issues/279


r~


Richard Henderson (66):
  target/arm: Create GetPhysAddrResult
  target/arm: Fix ipa_secure in get_phys_addr
  target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
  target/arm: Use GetPhysAddrResult in get_phys_addr_v6
  target/arm: Use GetPhysAddrResult in get_phys_addr_v5
  target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
  target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
  target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
  target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
  target/arm: Remove is_subpage argument to pmsav8_mpu_lookup
  target/arm: Add is_secure parameter to v8m_security_lookup
  target/arm: Add secure parameter to pmsav8_mpu_lookup
  target/arm: Add is_secure parameter to get_phys_addr_v5
  target/arm: Add is_secure parameter to get_phys_addr_v6
  target/arm: Add secure parameter to get_phys_addr_pmsav8
  target/arm: Add is_secure parameter to pmsav7_use_background_region
  target/arm: Add is_secure parameter to get_phys_addr_lpae
  target/arm: Add secure parameter to get_phys_addr_pmsav7
  target/arm: Add is_secure parameter to regime_translation_disabled
  target/arm: Add is_secure parameter to get_phys_addr_pmsav5
  target/arm: Split out get_phys_addr_with_secure
  target/arm: Add is_secure parameter to v7m_read_half_insn
  target/arm: Add TBFLAG_M32.SECURE
  target/arm: Merge regime_is_secure into get_phys_addr
  target/arm: Add is_secure parameter to do_ats_write
  target/arm: Fold secure and non-secure a-profile mmu indexes
  target/arm: Reorg regime_translation_disabled
  target/arm: Drop secure check for HCR.TGE vs SCTLR_EL1.M
  target/arm: Introduce arm_hcr_el2_eff_secstate
  target/arm: Hoist read of *is_secure in S1_ptw_translate
  target/arm: Fix S2 disabled check in S1_ptw_translate
  target/arm: Remove env argument from combined_attrs_fwb
  target/arm: Pass HCR to attribute subroutines.
  target/arm: Fix ATS12NSO* from S PL1
  target/arm: Split out get_phys_addr_disabled
  target/arm: Reorg get_phys_addr_disabled
  accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
  accel/tcg: Drop addr member from SavedIOTLB
  accel/tcg: Suppress auto-invalidate in probe_access_internal
  accel/tcg: Introduce probe_access_full
  accel/tcg: Introduce tlb_set_page_full
  target/arm: Use tlb_set_page_full
  include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
  target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
  target/arm: Use probe_access_full for MTE
  target/arm: Use probe_access_full for BTI
  include/exec: Remove target_tlb_bitN from MemTxAttrs
  target/arm: Add ARMMMUIdx_Phys_{S,NS}
  target/arm: Move ARMMMUIdx_Stage2 to a real tlb mmu_idx
  target/arm: Use softmmu tlbs for page table walking
  target/arm: Hoist check for disabled stage2 translation.
  target/arm: Split out get_phys_addr_twostage
  target/arm: Use bool consistently for get_phys_addr subroutines
  target/arm: Only use ARMMMUIdx_Stage1* for two-stage translation
  target/arm: Add ptw_idx argument to S1_ptw_translate
  target/arm: Add isar predicates for FEAT_HAFDBS
  target/arm: Extract HA and HD in aa64_va_parameters
  target/arm: Split out S1TranslateResult type
  target/arm: Move be test for regime into S1TranslateResult
  target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
  target/arm: Add ARMFault_UnsuppAtomicUpdate
  target/arm: Remove loop from get_phys_addr_lpae
  target/arm: Fix fault reporting in get_phys_addr_lpae
  target/arm: Don't shift attrs in get_phys_addr_lpae
  target/arm: Consider GP an attribute in get_phys_addr_lpae
  target/arm: Implement FEAT_HAFDBS

 docs/system/arm/emulation.rst  |    1 +
 include/exec/cpu-defs.h        |   45 +-
 include/exec/exec-all.h        |   33 +
 include/exec/memattrs.h        |   10 -
 include/hw/core/cpu.h          |    1 -
 target/arm/cpu-param.h         |   10 +-
 target/arm/cpu.h               |  138 ++--
 target/arm/internals.h         |  109 +--
 target/arm/sve_ldst_internal.h |    1 +
 accel/tcg/cputlb.c             |  214 ++---
 target/arm/cpu64.c             |    1 +
 target/arm/helper.c            |  213 +++--
 target/arm/m_helper.c          |   83 +-
 target/arm/mte_helper.c        |   63 +-
 target/arm/ptw.c               | 1343 +++++++++++++++++++-------------
 target/arm/sve_helper.c        |   54 +-
 target/arm/tlb_helper.c        |   39 +-
 target/arm/translate-a64.c     |   30 +-
 target/arm/translate.c         |    9 +-
 target/s390x/tcg/mem_helper.c  |    4 -
 20 files changed, 1287 insertions(+), 1114 deletions(-)

-- 
2.34.1

