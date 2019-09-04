Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1114401wrp;
        Wed, 4 Sep 2019 12:32:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBC4jDPN0VJA2SaJ/rrvHgQaaFikZ+Qq3ZLrxIB48vUCXt+2BpxqoMI9X9ZT2Nidba6TYG
X-Received: by 2002:a0c:e0ca:: with SMTP id x10mr16489612qvk.155.1567625543357;
        Wed, 04 Sep 2019 12:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567625543; cv=none;
        d=google.com; s=arc-20160816;
        b=CGg1rnzFRSuAqDrZaACDKxYq85rP6o82CvHawIWkI1xcaHYE0t7phCU7x+mgTekb03
         7Jt2naCcrNe/X0A9K8Bv2nsImxj8eQHYFF2K2Y8gcX8Pc1eaMXZ0RRzwtu2lzaDyURe4
         uGKfuFPs03AmcE/uotFEEPxwalWi2HZR6BMm0nDEMuD5PIt7BNzLs25P2Us/T3bO4Aaz
         alCrrqr+PUQQMWWk2hd7NjKwCJmBiSivzXZsz/4d+HZRT+muh9noW3U3c70fEfNXopmQ
         2ggQO3E2/Jz4YRmkfexJCXNmAeUeI1cNQabGzgzDcGW5kUH6+iFR5oXmERK8rC+bLXaw
         r7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=6+bARj0jxuSpEQCKbgiTd1HkSisnTmkoCrkjCZxZc64=;
        b=H6TRHsyEHz/WTQrikeRVMqV5r4r0uYLXxUmeMAILM3jZPSRx+kZonIxGDhjhWN7zu5
         d/Uy7DnZiLIQJhe3AkFzUQ0U8vaBuPQeSNUDe04ujw/zLFcatqRnMQ/yqoXqnEQESylK
         wMtaEdw43w3CJ6ZONiT/lZOT/rOaXZpxzN3Xy/00GzaMJ/EItXndsQAqqomrGUC4sk4o
         kop4YfbfihWVl/o85K5n+O76P37ZpI0pHeyLYM81CVFxeiglbtf5+VNsAveDmHl8EYoU
         tELomz5R7ZYgXsD1zZXTJA6/w6nXRmCkx71ZbvTGvVaDobW1E5J8+WxuGzlpdX8hz/vV
         t0Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dYx5AP0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si8056323qvh.101.2019.09.04.12.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dYx5AP0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5b0w-00051l-47
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azg-000429-TL
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azf-00020i-Au
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:04 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azf-0001zq-3G
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:03 -0400
Received: by mail-pl1-x644.google.com with SMTP id gn20so9933plb.2
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6+bARj0jxuSpEQCKbgiTd1HkSisnTmkoCrkjCZxZc64=;
 b=dYx5AP0DBQ98WOSga05aw4Wt8hg0u+kLBwAXV/7C4W3FMsoO8/vbOHVYmjASivruf6
 hZKMBAeYBufKdkScBnM0oqn6hFFKYWB45kxBAX5hdJSPIsoZxIkUAEfnRRqrFlqZtjMQ
 6O8wD51P+TYY0QEkevXNjLWIpU2dx4+1mi+2t224uUDSlaWzHpSSpqECZoD/ZkUKxP2t
 psO3Geyn36A1DQm9r+JYB0ny2BohXgNWx02gEdU/53JpR4uLCLsx1vpMeD4+P/953ncr
 WicGqUg2pzdDbDgb5+fSqJ0TWky6yt82klHDHjt7BAWZazfAx+ghL/T/WkQZD4DvQIDk
 omcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6+bARj0jxuSpEQCKbgiTd1HkSisnTmkoCrkjCZxZc64=;
 b=ri1k1ckx1JVTJNuobxTWaNdl60pqpWMX9ZjUK4uDNT8Yxxyuo6VNKeuhLWfudepuGd
 b90tw7+1QaVvMZ5Gtt3mRCU57AidYMjfX1IKL6Fd28iKQJECxeEN57emujkD9yR2EgO1
 /wbWZYKNgwVhMROUbCZ2cqQo8orZAdng2p0xtnQJJbT0Y+7jUe0GqKwmy3xi8AEl7GsB
 WS3FCXx9Tms1OxDddSf6G1UgkokcXbhfx9chuLGjELMMnUed6FvMPreVXwABFM8FejHR
 hD2nZ39MklVT/avSIsTiN4G7dpL/Mx3BfRjms56+A6QhDb9vvC/eij158WyaGoIwhJvW
 imUA==
X-Gm-Message-State: APjAAAUw1sk/0ctgmJjt0T66JCkMYJgCnsdP2kSXU9M8ePXNx1Uxh3WY
 BSAm9RuUanQR8vRHlM9rHm1m8w==
X-Received: by 2002:a17:902:8492:: with SMTP id
 c18mr43208305plo.279.1567625461658; 
 Wed, 04 Sep 2019 12:31:01 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:29:50 -0700
Message-Id: <20190904193059.26202-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v4 00/69] target/arm: Convert aa32 base isa to
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
X-TUID: 0l5iDCUXqYwt

This unifies the implementation of the actual instructions for
a32, t32, and t16.

The changes from v3 are minimal, mostly rebase conflicts.  There
is one change for checkpatch warnings, in patch 34 in trans_RFE.

There is one outstanding checkpatch warning, but it's in a minimal
change to some existing code that is removed before the end of the
patch set.

All patches have reviews now.


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

 target/arm/translate.c       | 7179 +++++++++++++++-------------------
 target/arm/Makefile.objs     |   24 +
 target/arm/a32-uncond.decode |   74 +
 target/arm/a32.decode        |  534 +++
 target/arm/t16.decode        |  281 ++
 target/arm/t32.decode        |  631 +++
 6 files changed, 4638 insertions(+), 4085 deletions(-)
 create mode 100644 target/arm/a32-uncond.decode
 create mode 100644 target/arm/a32.decode
 create mode 100644 target/arm/t16.decode
 create mode 100644 target/arm/t32.decode

-- 
2.17.1

