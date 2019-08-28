Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1147230wrs;
        Wed, 28 Aug 2019 12:05:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykmn11IMYunPlJQr35zgG0SCUr7CNaoI8Snwexwbsm/phoyDOrG+Yl1lfuNg63rXYeKKmk
X-Received: by 2002:a37:660d:: with SMTP id a13mr5748646qkc.36.1567019143396;
        Wed, 28 Aug 2019 12:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019143; cv=none;
        d=google.com; s=arc-20160816;
        b=E2RUlzCkiiSnQTKQyAWHp703j+Mj6/4b9oubDNkX8qrI1/pzmwYmdIDobzN4/UN04j
         yLcj7uaH/ssgyz9mVcmiD7IT1rszvDTlxGvjDWyucKRkUvFp5HQC/KKMZQ0J+uJMYQVf
         5xbHRKn/RHE32bzvsDbVQRpQV2Tx6jlioWhpBTA5Faw2TjT6Qto4gEv9Egn7ycB22eYX
         ClvEsL6R7WDX5M9h6bzwyGO2OiNhf3UULapojgls0flZKq5Obius5maLS02DBQEbmDqo
         JdTOBqCJ68LmDOPSgELCFl3Y5aMoaKcqC/FLpp/RqfZIiuaJArPw0IKvlS/EFf6rj8hV
         7uMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=s9P79p8xzPBZXs21e7DuKNHBq2BT565iMYq602qI4uw=;
        b=UE8XIk+ITVHKHP89wVEBllOHSKU4aH5vAiY9wJqNKhlAhRn2RqqsdAD1+EQdI4kGXn
         5U42/ChCWdvJlvWjL2n6ok9Lzior5fPzMXRdTgRbeGF0HOxWnES5ASlq0lNa+YBDHiVv
         ZIm0X5vgoP6frXiwlEfDA6ExF0CdXZXtLgHtK8aGcVwyEdoDmjLcct149H8UDb6LcnQa
         T7MBlIa/Vkrg1H3T19UnlKMozsrclk13LJKCKlvkd4v1fxzF5uP+D0iWGI3OST6ILNYW
         o79YU0nJfg3vEmULJFApuHiX1b+IiVgWvUZ8K3Va3aO06dwIuLGVPa4OOlrfQJM+rDEl
         lCOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rSZxPhVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si116177qvy.181.2019.08.28.12.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rSZxPhVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33GI-00038k-Iv
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fd-0002ve-LN
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fc-00083O-3i
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:32896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fb-00082m-Sy
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:00 -0400
Received: by mail-pf1-x433.google.com with SMTP id g2so409794pfq.0
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s9P79p8xzPBZXs21e7DuKNHBq2BT565iMYq602qI4uw=;
 b=rSZxPhVIhE5L+RcsaqHafjyR15yPAtyZleMvpvOBsJeZ+JXGlTjpWSdHG5ZLrSSTEo
 PGvsQnqVFXC8wj7aOP/3S1EiUO3Ysn2yJn+KNscLfexOFRP7r8UNrZtKaqLYNvJK7tWG
 FKhTEUnTPFB6wYNPXKBKc42AGOb60ZKGnENr5lpiBveAaDPJlRIz92DXRdTa7UpD/A2i
 y7N4fAZFXYRs9kCv69P7WVPcxwENz7wPALG7lL50c1YT4fm+HypsSM1zhjCrUIz/TsTg
 mcpvSbRlV5izbAVCcKMK+quM/V6jC0jffyvV18Um9hRSVj719jW++KQm947OwnPM4GV6
 hv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s9P79p8xzPBZXs21e7DuKNHBq2BT565iMYq602qI4uw=;
 b=G24HdhcNg/tLULmQJYfkEe5J5s2JodRt1qMtZWmmB2K20snAwCwlIMYkgd2eiOsZZJ
 gtrqIHyqj49oDhul+MXf3KjF+uE2szXcHDBRW46UagY6cnZE8/ir877vNS3NB7XOv37J
 ustH8jjCcjynpEr2L+q/twu8EJQ2oATrH8xA5isxSpgdSjBitY27xHnnGH+uyqlejG0N
 6xgAG9TCDz4++vpldydMHja3jakk2NmaRFJFMkJd84dBLCQwUCI6Gp3QXlVhZLp4eovA
 2iZu7xrvf/Cdntyu3hg5nnS4xsE0Xk21ncj4VOU3wq/wZvgtdbZg60I4gz7lerE/9b5v
 TPvQ==
X-Gm-Message-State: APjAAAXhqBCldvDS9VKaNoeublIp2+RMVqzvbw8zKoKvADW582C4Bgzz
 N44OGseDnOlklg47ONGiq7XRVQ==
X-Received: by 2002:a62:1858:: with SMTP id 85mr6647818pfy.120.1567019098356; 
 Wed, 28 Aug 2019 12:04:58 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:04:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:03:47 -0700
Message-Id: <20190828190456.30315-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::433
Subject: [Qemu-arm] [PATCH v3 00/69] target/arm: Convert aa32 base isa to
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
X-TUID: NdzRwsudsSLG

This unifies the implementation of the actual instructions for
a32, t32, and t16.

There are a number of changes from v2, mostly from review feedback.
I think that I've annotated them all via "v3:" tags after the commit,
but I may have missed some.

The patches without Reviewed-by are:

0019-target-arm-Convert-T32-ADDW-SUBW.patch
0022-target-arm-Diagnose-UNPREDICTABLE-ldrex-strex-cas.patch
0035-target-arm-Convert-Clear-Exclusive-Barriers.patch
0057-target-arm-Convert-T16-Change-processor-state.patch


r~


Richard Henderson (69):
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
  target/arm: Diagnose UNPREDICTABLE ldrex/strex cases
  target/arm: Convert USAD8, USADA8, SBFX, UBFX, BFC, BFI, UDF
  target/arm: Convert Parallel addition and subtraction
  target/arm: Convert packing, unpacking, saturation, and reversal
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

 target/arm/translate.c       | 7166 +++++++++++++++-------------------
 target/arm/Makefile.objs     |   24 +
 target/arm/a32-uncond.decode |   74 +
 target/arm/a32.decode        |  534 +++
 target/arm/t16.decode        |  281 ++
 target/arm/t32.decode        |  631 +++
 6 files changed, 4641 insertions(+), 4069 deletions(-)
 create mode 100644 target/arm/a32-uncond.decode
 create mode 100644 target/arm/a32.decode
 create mode 100644 target/arm/t16.decode
 create mode 100644 target/arm/t32.decode

-- 
2.17.1

