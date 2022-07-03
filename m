Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2433557lft;
        Sun, 3 Jul 2022 01:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usz+9aAVG7J7puvDdLPw/rbeXDs52foT/og6F33qNe6dU+aaYgRmMzMg1mYCIMnOVNfzb8
X-Received: by 2002:a05:6902:842:b0:66e:3c2a:c2b5 with SMTP id d2-20020a056902084200b0066e3c2ac2b5mr805202ybu.406.1656836702550;
        Sun, 03 Jul 2022 01:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656836702; cv=none;
        d=google.com; s=arc-20160816;
        b=hLZnv1LdiCukq6Wm5nLKWsn98BEaisFgNLMoyl1GIR+DFPA8XUqidViCeNgobwcUoG
         ZMf2I4JRzo0hLU+De4R+0pR1Z/ADB5g93pT++6ZyDnvPl91NG68XKzsGF/pYQ4EMeewQ
         rneVIweZnKg0xGJghMeoD0rdJVHEw6sKQqCdcJvdrPzKXg50X1Dzf0S25OxqdYFCkcMf
         iDzlexSqnKP8rL/CYEpdKNnnmV/3A5HkL3G9hynTn/nYUUFmB9mslQnJG2Mk3S3a7qqh
         KUCmcL90VwZT5NRaOyuLmGNzoyqndDRexH6fwOtyaddIbInm6WlEpYqd5b9GTbVpR7vw
         sA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RjKjq3F4AOeDk7FY3S4YBNakYy54J62E3I4hYu5He1Y=;
        b=kmO8XSV4OjpjOsmT+RZxRUrFexGKb+JgGihl/5aD/ynjrRTNs9aep6jx1x2WO/XepD
         clnqSt0fYJEO1Hwef/+TigySsPapEcK5NuLN9tZ78t9O3Th9LzNF+eoLhw5JcPRvD/ww
         FzNI6tYn/LfMLmYb0JhCokRhB71eMDjdCN1IxQl6Ma0/w0HaZvOlaCc6xu+u2G3ANlMt
         xpppBEoJjnIvWATaRE/7+t/cfg5hRY7bZ/thypyeq80ZxqH8/JknAxcl8dyFrSe9LBBB
         gevrSsdmaaj8V/piBw4SXLc/FmLXbE8JpuSZazwHkZZNBSbotnEVkuwD+tZWvuXx4mTo
         x+Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNYx1FmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15-20020a5b020f000000b006607393d67csi32576731ybl.463.2022.07.03.01.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:25:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNYx1FmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7uub-0006EW-QY
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uu7-0006Ds-Fs
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:31 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uu5-0005nQ-Ky
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:31 -0400
Received: by mail-pf1-x42d.google.com with SMTP id k9so6348733pfg.5
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjKjq3F4AOeDk7FY3S4YBNakYy54J62E3I4hYu5He1Y=;
 b=gNYx1FmCloBYt2SHHlWs2gwCjQZBpRwy6WxRQfxyUM4k/SLsnIhZj6QPYHdxDrAU4m
 YxG0jhZeDZUp6gd5Zi1vWACOSt2p7qlY4233J6ytc5SkLKXFLc+82BnFSvZuji+/Bqyi
 Kkv/+bng0ZkaGt1g0+UDQqplhMVn0Mqu1ZRkQkEKOnidvRrv6/R+A9x3Cqi469iopLvY
 AVhkif9zUGhgTrpfCbih6mv/6GXvFKJpOHlTMB1TUD8ELiFMJK0lznpCHxPot0g9O/QM
 dOdvU3E8f2+ZcdjIXGWPVlVeHyQpHs558rbbrI3yNaee6ARFrlkZ38f6oTLSjvEJ6jfF
 NfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjKjq3F4AOeDk7FY3S4YBNakYy54J62E3I4hYu5He1Y=;
 b=bRmlJLvSz2G2weDqvJImSpXBNMOmKRSHyWczrJyEdR/FVAkyl6VaTxx+pB8em8HW+f
 KHbcYJkdcjkk4Mt4z3ltpN72xSu8jiD2xq8VNhWZ7a7bIP+C2IS2EOF4IjNvb8Xd4dng
 Wk3EtsGyVaSc9KA/MObqPgfugPmFpxbxajDMbQYBS6KuhhHx9peHjpGtAZkLAbTaQHmF
 3NSw+xlVT9cgKvdkyuwrQdwM5idLTE5DtA06TRVCmgpBfW4p5b4+2A/xJJetCuPoNW1K
 51kD2yf4D19XJbV8dTpTT+kj9SRCpi0Mwsm6JdFdgSqDmPyRhuXyP/Opu26uhA2lSAAJ
 xhCQ==
X-Gm-Message-State: AJIora/8IVH8+R8NuDytIHM24zpchBfVp8YXrHMiN+ZO5P7PEzfOwXNz
 lOU9VeuNJMqZCbW9035X8Rdb0w==
X-Received: by 2002:a63:ed48:0:b0:40d:9866:6834 with SMTP id
 m8-20020a63ed48000000b0040d98666834mr19768678pgk.324.1656836666303; 
 Sun, 03 Jul 2022 01:24:26 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
Date: Sun,  3 Jul 2022 13:53:17 +0530
Message-Id: <20220703082419.770989-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: K35RuMZQojck

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


r~


Richard Henderson (62):
  accel/tcg: Introduce PageEntryExtra
  target/arm: Enable PageEntryExtra
  target/arm: Fix MTE check in sve_ldnfff1_r
  target/arm: Record tagged bit for user-only in sve_probe_page
  target/arm: Use PageEntryExtra for MTE
  target/arm: Use PageEntryExtra for BTI
  include/exec: Remove target_tlb_bitN from MemTxAttrs
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
  target/arm: Add is_secure parameter to pmsav8_mpu_lookup
  target/arm: Add is_secure parameter to get_phys_addr_v5
  target/arm: Add is_secure parameter to get_phys_addr_v6
  target/arm: Add secure parameter to get_phys_addr_pmsav8
  target/arm: Add is_secure parameter to pmsav7_use_background_region
  target/arm: Add is_secure parameter to get_phys_addr_lpae
  target/arm: Add is_secure parameter to get_phys_addr_pmsav7
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
 include/exec/cpu-defs.h        |    5 +
 include/exec/exec-all.h        |   26 +-
 include/exec/memattrs.h        |   10 -
 include/qemu/typedefs.h        |    1 +
 target/arm/cpu-param.h         |   10 +-
 target/arm/cpu.h               |  138 ++--
 target/arm/internals.h         |  118 +--
 target/arm/sve_ldst_internal.h |    1 +
 accel/tcg/cputlb.c             |   73 +-
 target/arm/cpu64.c             |    1 +
 target/arm/helper.c            |  213 +++--
 target/arm/m_helper.c          |   83 +-
 target/arm/mte_helper.c        |   52 +-
 target/arm/ptw.c               | 1346 +++++++++++++++++++-------------
 target/arm/sve_helper.c        |   50 +-
 target/arm/tlb_helper.c        |   51 +-
 target/arm/translate-a64.c     |   30 +-
 target/arm/translate.c         |    9 +-
 19 files changed, 1194 insertions(+), 1024 deletions(-)

-- 
2.34.1

