Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3170399wrs;
        Mon, 19 Aug 2019 14:38:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHcegxB3ZP5LsgtvrTWwhlEzrmgJ0yA4ZipbWpBEzLfLf0HgnQiLHU4isG4DwY9f9kdeEI
X-Received: by 2002:a05:620a:16c8:: with SMTP id a8mr19419881qkn.234.1566250699092;
        Mon, 19 Aug 2019 14:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566250699; cv=none;
        d=google.com; s=arc-20160816;
        b=Ok0OLNJhWamIvyCU8+iIhdNQdgcFXj/MdA8s9Esf9WwVT+ECwDhXDs55+IS9rv0aOy
         aijpyerJfJI1CoD1od7tKqjrb3R2CIKOdVAeLnMc8nuVhIh759/eH9jejdYwFnLra6F/
         rEcCsKdEnZFXgqJBVgFP5r5WyyrDyxgFmUrCHX3WdVmef8NYEG1YPMgOlfxQE2ijYWmC
         aFE4vFt88xNZZPQmORU9tlShHl44Er2nI+v2Lxovg02nWS3kXR9DtXNuYmiZhaqgyOm+
         0M71k/+VAZI6ChT21ovDyH6k18GzO7zPGNjkPyawMmx9YQaOka+ywcaec3NbIH2YD3y0
         NufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=UAuI24ypugSOADw/ZQRUxs1qwCQQ7Fi3EwXHwPu9388=;
        b=s8CWDy4ERs8W3XfPkxVmKo2VWLCqk5QCijzDPzC150sE3UZNZLazLRyFyzU6/p+zDR
         ZKcR3AJgl0k7zdMARJ8RICzAnY+w93AaVd7sdTUh/U80zd4ZhEZ3GN0MSqvCT6sDAARY
         U8PayFeTqafwF1JoXHihHu/UbCouH3xaRkdOSgE7ZmlAfKpeY3LvPWhH+7AS/XeR7cKt
         GCeyKT+/slaJ7K5ds9AL6mU/lHga5TUzxmlGl+eTljatyd6AuQPlM2LVWFFGlDAMzjIh
         bZL4Dp4x4aocZdchN70fnxelECE/u1B1VhZBqEuIMqLBD54e5d1jFMbOWsqHw6luYf0J
         x3vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T+fYGM2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si9249640qtc.16.2019.08.19.14.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:38:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T+fYGM2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpM2-0001Ax-1W
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLk-00019o-FT
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLi-0005vp-Ur
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:00 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLi-0005vE-M5
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:37:58 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so1919940pgp.12
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=UAuI24ypugSOADw/ZQRUxs1qwCQQ7Fi3EwXHwPu9388=;
 b=T+fYGM2c7huxQqMYjJE4FCDtBu1AjZR8/FPJa3mwgqc2uxzV6kOtA6SqJzFt0zij9W
 XKOPKbIgZMoV69o155ysDGSrU2XjesEz0IyUeuz1LGp2Y+2s+g0sHuWtQMM0CjJjbFMy
 mRCC37toz03sOpxGrq7qqsuL1+aDjEp6/iMTIc37Sr2FPwh/gnJoSLxDt7X9b1GfchuU
 uqeYTg469JA1vkgDZII5JbUKm+5j3cvEuAA8ihoSRuniD8gz5tWn5a+HU7otemnhkQEd
 gpgfnpyRd9Z9yv9lKumrUMbLfsICZiKW0dFWtJ2EGr/RwKvMmjHZ0/vs0IsATuyxVGN1
 EGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UAuI24ypugSOADw/ZQRUxs1qwCQQ7Fi3EwXHwPu9388=;
 b=DZTLSIQ3AqwK5ZXIfaUVsSFZDD8OEDz6cAWwu20gifqO2U5bWY7K+psdN3cigTKEHx
 DPMo/PgSIOV49LyXREZHrhYn5hDbpBGiKaTB8Vv69ktPUQN486oHQ4KZyytM6d9xkl28
 2V+hqFEL8ETGjIn2Tp/qadunyG63uu3wqAUxCmpWysYMaQBaznN60ffbp2/HKZW2rGhd
 CO8QPxNVsMnubLS9V6KOjCbX7MT+5R2VIRC1goSW0RWIZe2Ut3DJGPLTIenD94wRoWHr
 qPdVBRJd9Mz082YnQdZEM2wC0tWfhlw8QNqpK8J8BE/vRV9WPc8SsBC9h7odRf5DzUsk
 f+SQ==
X-Gm-Message-State: APjAAAUOpYBVWZCh5TYEgvfQNQZ3yrKj8CjkkxGzTkd220pIUl9Srp2U
 SxWG0qA2PTBPCAWxg7hzrDhL4g==
X-Received: by 2002:a63:9e43:: with SMTP id r3mr22269709pgo.148.1566250677506; 
 Mon, 19 Aug 2019 14:37:57 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:37:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:47 -0700
Message-Id: <20190819213755.26175-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v2 00/68] target/arm: Convert aa32 base isa to
 decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ORGWGjml546

This unifies the implementation of the actual instructions for
a32, t32, and t16.

This has been tested by running the debian 9 armhf installer,
which does a far amount of switching between arm and thumb modes.
I've also run Peter's ARM TFM image, and all of the existing
RISU tests that we have.  (Our RISU test cases are nowhere near
complete for 32-bit mode, but it did find 3 bugs, so not useless.)

Based-on: 20190819151743.17267-1-richard.henderson@linaro.org
"[PULL 0/3] decodetree improvements"

Changes from v1:
  * Lots of prep patches merged.
  * Lots of patches split into smaller bits.
    Which is why this patch set is larger than v1 despite the merge.
  * Do not use STREG_EXC_RET in Hyp mode (patch 3).
  * Map more UNPREDICTABLE to UNDEF in LDM/STM (patches 28-30).
  * Split gen_nop_hint (patch 59).
  * Do not move single-step check to gen_goto_tb, but do simplify
    gen_jmp by inlining gen_bx_im (patch 68).


r~


Richard Henderson (68):
  target/arm: Use store_reg_from_load in thumb2 code
  target/arm: Add stubs for aa32 decodetree
  target/arm: Convert Data Processing (register)
  target/arm: Convert Data Processing (reg-shifted-reg)
  target/arm: Convert Data Processing (immediate)
  target/arm: Convert multiply and multiply accumulate
  target/arm: Simplify UMAAL
  target/arm: Convert Saturating addition and subtraction
  target/arm: Convert Halfword multiply and multiply accumulate
  target/arm: Simplify op_smlaxxx for SMLAL*
  target/arm: Simplify op_smlawx for SMLAW*
  target/arm: Convert MSR (immediate) and hints
  target/arm: Convert MRS/MSR (banked, register)
  target/arm: Convert Cyclic Redundancy Check
  target/arm: Convert BX, BXJ, BLX (register)
  target/arm: Convert CLZ
  target/arm: Convert ERET
  target/arm: Convert the rest of A32 Miscelaneous instructions
  target/arm: Convert T32 ADDW/SUBW
  target/arm: Convert load/store (register, immediate, literal)
  target/arm: Convert Synchronization primitives
  target/arm: Convert USAD8, USADA8, SBFX, UBFX, BFC, BFI, UDF
  target/arm: Convert Parallel addition and subtraction
  target/arm: Convert Packing, unpacking, saturation, and reversal
  target/arm: Convert Signed multiply, signed and unsigned divide
  target/arm: Convert MOVW, MOVT
  target/arm: Convert LDM, STM
  target/arm: Diagnose writeback register in list for LDM for v7
  target/arm: Diagnose too few registers in list for LDM/STM
  target/arm: Diagnose base == pc for LDM/STM
  target/arm: Convert B, BL, BLX (immediate)
  target/arm: Convert SVC
  target/arm: Convert RFE and SRS
  target/arm: Convert Clear-Exclusive, Barriers
  target/arm: Convert CPS (privileged)
  target/arm: Convert SETEND
  target/arm: Convert PLI, PLD, PLDW
  target/arm: Convert Unallocated memory hint
  target/arm: Convert Table Branch
  target/arm: Convert SG
  target/arm: Convert TT
  target/arm: Simplify disas_thumb2_insn
  target/arm: Simplify disas_arm_insn
  target/arm: Add skeleton for T16 decodetree
  target/arm: Convert T16 data-processing (two low regs)
  target/arm: Convert T16 load/store (register offset)
  target/arm: Convert T16 load/store (immediate offset)
  target/arm: Convert T16 add pc/sp (immediate)
  target/arm: Convert T16 load/store multiple
  target/arm: Convert T16 add/sub (3 low, 2 low and imm)
  target/arm: Convert T16 one low register and immediate
  target/arm: Convert T16 branch and exchange
  target/arm: Convert T16 add, compare, move (two high registers)
  target/arm: Convert T16 adjust sp (immediate)
  target/arm: Convert T16, extract
  target/arm: Convert T16, Change processor state
  target/arm: Convert T16, Reverse bytes
  target/arm: Convert T16, nop hints
  target/arm: Split gen_nop_hint
  target/arm: Convert T16, push and pop
  target/arm: Convert T16, Conditional branches, Supervisor call
  target/arm: Convert T16, Miscellaneous 16-bit instructions
  target/arm: Convert T16, shift immediate
  target/arm: Convert T16, load (literal)
  target/arm: Convert T16, Unconditional branch
  target/arm: Convert T16, long branches
  target/arm: Clean up disas_thumb_insn
  target/arm: Inline gen_bx_im into callers

 target/arm/translate.c       | 7068 ++++++++++++++--------------------
 target/arm/Makefile.objs     |   24 +
 target/arm/a32-uncond.decode |   74 +
 target/arm/a32.decode        |  534 +++
 target/arm/t16.decode        |  279 ++
 target/arm/t32.decode        |  629 +++
 6 files changed, 4536 insertions(+), 4072 deletions(-)
 create mode 100644 target/arm/a32-uncond.decode
 create mode 100644 target/arm/a32.decode
 create mode 100644 target/arm/t16.decode
 create mode 100644 target/arm/t32.decode

-- 
2.17.1

