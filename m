Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047724njb;
        Sat, 5 Oct 2024 08:25:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUvXgB9pNYk02k2KQjQ3wPadf3PU7LM3iulyXy3dn1gRXKcEN3Zy3WGXS89enh649RoLEbVrt0Z8svXA==@linaro.org
X-Received: by 2002:a17:903:192:b0:20b:a89a:1d60 with SMTP id d9443c01a7336-20bfee31a71mr72527125ad.30.1728141953403;
        Sat, 05 Oct 2024 08:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141953; cv=none;
        d=google.com; s=arc-20240605;
        b=lJX5m9SQrqDfacES2w3RQyF7idJdLJmCdU9JSJde8FAudiBtOY2+nDkMX8aq7EFMwj
         FsC+GMJqO3APx7GCOf3ez+WAUKccNLKoZhqoFqC3Z86jL0Ep236gRbr7CqM0BGRhQXUd
         g5YFOml3cRaoIUyhUCZxu5US6iCpQD7K/iMuVL8faAlYEgAiKLvMCDVeCLSYEvw/jwyd
         B0fTMRBfMTP/fD/6Tzp5T12a4Uk3BtneV7uJ+6oclNO1OptsVtFZ4eyOUkJ6+40x8l2q
         OPQP+XnkeN5K3lY9e+e0MT6wHIVzMNJO8nOZkvfvk4YeeK2T9Y2+Appj5nZGRW5Z3Fn/
         RiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=wpFwx2+B2oxOHc6b6hBqiIP5nn07TpsAOahnQ7H73ek=;
        fh=Ys+BPasg2Q7IieGf8Pqj/P8GyYjrbcOI9VfS73o2qRs=;
        b=DlE39ulnK37DpTGsHeDFS/1FV6yfWt8BaMy2KV/NUoFhS4f2DucDrLcm6dh9mMgyrq
         +q3LGYa5lcJdIX22olnFq8Aqagg3Ib/jF4CtOccLConcd8W3u2zN9R3NNZvPJIOYWij8
         jYLU+NCUDO6kZxjNljTBjuwn8LKf+culph/YY1dGPjIWl2Mk4R6Ot0c4LSfky7n46zXa
         YkQfgebcqlpnrTu6+YNdK1mpzl4/aX1Q5OsEHki9dj4jSxrgvOUAq71ZTDfUgbczoneN
         yAZlZIg7PICyxVGJspgkbkbPmHEaqKiSllBxuKDuojtaHPvwgTF6vkcqpxlMDc7f1fal
         V1Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p8QJDHXG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138e1181sor10070175ad.9.2024.10.05.08.25.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p8QJDHXG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141953; x=1728746753; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpFwx2+B2oxOHc6b6hBqiIP5nn07TpsAOahnQ7H73ek=;
        b=p8QJDHXGXU0aAHiavA3MfnotQzPhOwubrXn/W1GYwQsb2+K+RvwV26Hatd8bu72pO4
         teVNNsR+jpDHyFUr/XJ8gNrv248h5qUqJmRYDdbqNRY7L053jL86wh1u4dgOYVxbSQAE
         AmE8xI9QnVUMaiu519gRJyKTvJADLLQhYjJj/Az+BUCdtVvIWabObTKUtMyiPUG4p/Xs
         nbt3LOkGgTMuAHX8B6jhZwJZDGfiVaLKcHtj979ZA0wapAPZeyCOS1DXBkgrF39+WxBw
         y1a9RiSGFM4ksmIDpwxmpGOdoTZ1m8n2KEvyLmLnnGY5HygxolXOsRfni+5WAp2Op1nd
         10Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141953; x=1728746753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpFwx2+B2oxOHc6b6hBqiIP5nn07TpsAOahnQ7H73ek=;
        b=lIts+AEsC0Dgt+qnhmUZ3xwF5nlpHzhoB+pK4CWqpzxQ2Vo7r9Vj3OaPKyFHVwO4Xt
         9cFI/mLKEn79eJdCKVVjJ1leBxOelWpu/Nx97pbD0DHd1GehR3B2Zvupe6P56QL0Qofz
         7XU2F8TtdPibToIia2RCU51RsyCNPyQ41+jYzCzHj0j5tqQSsCtknXfUDrtXmRM9TMRj
         lNkX8kV/8IKRobCcv9UVyOWldfmSLmUZ5LvYYclMitSRX2TXuq3JOCtfi7cuBIRqMqM9
         SAOyGD+5ExUGwf14ATtSDbBVQEbTJysBizy2rxxfWWQwjI4o5nH1YsjnUZvn8T3a+Afi
         v4cw==
X-Forwarded-Encrypted: i=1; AJvYcCV603fcMg48oahrGnMIiDB3zhVAO88KNsyU1JUHi318BJOQbNfqQWySMwdRCFgZhyDnf8NWJkyE3SGiCw==@linaro.org
X-Gm-Message-State: AOJu0YxLxqo8LKYF+9e7bGw8/GhKKIzfmUqrwZrYHUYdjAmpaZEb8QvX
	oVcnq6RY7h6MJrwpRbdkrOS+4WEp+8NP2p7/cF9DsFwecX9rp0IVIGvc0qRiMeOYbg==
X-Google-Smtp-Source: AGHT+IHPXsFE7R6jjgtrThFRIybCkI51Eu2ER9DX0AbZAMTqrYQ1cs+3WLCHNSwkVb8nGfrYpNWUSg==
X-Received: by 2002:a17:902:f548:b0:20b:96e:8e65 with SMTP id d9443c01a7336-20bff1a8b43mr85517295ad.42.1728141952853;
        Sat, 05 Oct 2024 08:25:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 00/20] accel/tcg: Introduce tlb_fill_align hook
Date: Sat,  5 Oct 2024 08:25:31 -0700
Message-ID: <20241005152551.307923-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z+3+BtBCVnvg

This new hook will allow targets to recognize an alignment
fault with the correct priority with respect to other faults
that can be raised by paging.

This should fix several hppa fault priority issues, most
importantly that access permissions come before alignment.

This should fix the documented error in the Arm alignment
fault due to memory type.


r~


Richard Henderson (20):
  accel/tcg: Assert noreturn from write-only page for atomics
  accel/tcg: Expand tlb_fill for 3 callers
  include/exec/memop: Move get_alignment_bits from tcg.h
  include/exec/memop: Rename get_alignment_bits
  include/exec/memop: Introduce memop_atomicity_bits
  hw/core/tcg-cpu-ops: Introduce tlb_fill_align hook
  accel/tcg: Use the tlb_fill_align hook
  target/hppa: Add MemOp argument to hppa_get_physical_address
  target/hppa: Perform access rights before protection id check
  target/hppa: Fix priority of T, D, and B page faults
  target/hppa: Handle alignment faults in hppa_get_physical_address
  target/hppa: Add hppa_cpu_tlb_fill_align
  target/arm: Pass MemOp to get_phys_addr
  target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
  target/arm: Pass MemOp to get_phys_addr_gpc
  target/arm: Pass MemOp to get_phys_addr_nogpc
  target/arm: Pass MemOp through get_phys_addr_twostage
  target/arm: Pass MemOp to get_phys_addr_lpae
  target/arm: Move device detection earlier in get_phys_addr_lpae
  target/arm: Fix alignment fault priority in get_phys_addr_lpae

 include/exec/memop.h           |  47 +++++++++++
 include/hw/core/tcg-cpu-ops.h  |  25 ++++++
 include/tcg/tcg.h              |  23 ------
 target/arm/internals.h         |   6 +-
 target/hppa/cpu.h              |   5 +-
 accel/tcg/cputlb.c             | 142 +++++++++++++++++----------------
 accel/tcg/user-exec.c          |   4 +-
 target/alpha/cpu.c             |   1 +
 target/arm/cpu.c               |   1 +
 target/arm/helper.c            |   4 +-
 target/arm/ptw.c               | 139 ++++++++++++++++++--------------
 target/arm/tcg/cpu-v7m.c       |   1 +
 target/arm/tcg/m_helper.c      |   8 +-
 target/arm/tcg/tlb_helper.c    |   2 +-
 target/arm/tcg/translate-a64.c |   4 +-
 target/avr/cpu.c               |   1 +
 target/hppa/cpu.c              |   1 +
 target/hppa/int_helper.c       |   2 +-
 target/hppa/mem_helper.c       |  50 ++++++++----
 target/hppa/op_helper.c        |   2 +-
 target/i386/tcg/tcg-cpu.c      |   1 +
 target/loongarch/cpu.c         |   1 +
 target/m68k/cpu.c              |   1 +
 target/microblaze/cpu.c        |   1 +
 target/mips/cpu.c              |   1 +
 target/openrisc/cpu.c          |   1 +
 target/ppc/cpu_init.c          |   1 +
 target/riscv/tcg/tcg-cpu.c     |   1 +
 target/rx/cpu.c                |   1 +
 target/s390x/cpu.c             |   1 +
 target/sh4/cpu.c               |   1 +
 target/sparc/cpu.c             |   1 +
 target/tricore/cpu.c           |   1 +
 target/xtensa/cpu.c            |   1 +
 target/xtensa/translate.c      |   2 +-
 tcg/tcg-op-ldst.c              |   6 +-
 tcg/tcg.c                      |   2 +-
 tcg/arm/tcg-target.c.inc       |   4 +-
 tcg/sparc64/tcg-target.c.inc   |   2 +-
 39 files changed, 302 insertions(+), 196 deletions(-)

-- 
2.43.0
