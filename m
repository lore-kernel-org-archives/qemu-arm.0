Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147587njb;
        Sat, 5 Oct 2024 13:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt6N9vugkeQmLEbq8V765+P5EABJLtIWYR9kGCnN8iz0/y56a48H+KKndEBGvArs9lHSuHS2eIWBDhzg==@linaro.org
X-Received: by 2002:a17:902:f611:b0:206:8f25:a4f with SMTP id d9443c01a7336-20be18f047cmr159370845ad.16.1728158762332;
        Sat, 05 Oct 2024 13:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158762; cv=none;
        d=google.com; s=arc-20240605;
        b=GHsuUGksU4+/gHRejnc7ga7dM3hmnfkSK4IdSwgHveOo8pki39/TDaoaRDNm8hAK4n
         GQlqSWwbUfEidI4IsH5Nd39clVNwXQElQelbIQcd+S/ghvDELhvEJCmsqsHC4VKj2H32
         dV9wn0aQIX+30vFJo7hYZonurBjj6zih15+IE2UiJGGUm0pn7vHYXy8U7+J7PWq2NSv6
         TfMpXBLKtWOxM6bs2Npb2OmFxJWviOX1eoNltg+p/jimg+xI6PZnyPOFm13VCXdpOv11
         QByy7fS7ZwCMBV2gjrmcBwwpxR4NP6O/ZxVPbEFFMo/hZfkPv87ZNjYqQzHyg8F3vRLr
         GOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=irfgPGGIAUHZVTJOmBvNpfB+bdbCcTVofkC/LEnkZY0=;
        fh=rNoRNZwqOiZ3bRZGFBe/Dflr6UwsZT4Rpuc/LQYF45A=;
        b=aGAHNY7umOdcl93MMkQbXhgGZEK8GrPKM4pxHdCcivkesqkbCKi6j3Zk7PBKj7IdqD
         LH/KJFi/9cfJ6f6/8X6cutziapW3TE/uP/XVh+WPNWFQmEv3X6HjFW5RxW96+w8B1ZMN
         aOYdomqnWVSpWj1w/DN7ITTYSKgFP2CCVHgMQ0Yzsu4nRW1fuk6WqIACkN0E3ClIV7Sq
         PlVyLvxv0atbn0l20CsAPxlOOAyipI0M1q+H8zfpZIKLDDlRV6mHmURZn/pTXHqN4IfH
         cnRuj1qMmdT0EZMP5LjgWY8OBozxza2vsWFvHEowvJexxiTDMSXcgQyYsK1Gji0FlDor
         J4Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5PD7Cfr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1364fc83sor9520595ad.1.2024.10.05.13.06.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5PD7Cfr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158762; x=1728763562; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irfgPGGIAUHZVTJOmBvNpfB+bdbCcTVofkC/LEnkZY0=;
        b=q5PD7Cfr6O26kfY9BWmS8kUeMoxX1+8mL9S3ZwxeGteec7xBIBgAU3cL8+f3fTyuoP
         SeufQ4sOwZyWfugQXT6DzKxh9qpClD9M3Qbl1wR6AjgbyqQzYe12wvy1jUiDJ8HygY2A
         KNhrqXD2E7Rpzp8Cfjla9NbQIp6sPPPlBYPcs2SIzfrMCYOZiIKGEwMdTRRgBxxT2++7
         qNCf9407j6pCus342DmEZeRMaOejpISm34lsHVDvWKjmLbzZ7pdpZI/nvZXwsSNjmvWd
         LWOHGI30rUPUVmRTRgTwceQXAwiWOGP2Fh0WIlocfpmMhDwIjjKZmg15hmxzLELtWZ5g
         FEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158762; x=1728763562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irfgPGGIAUHZVTJOmBvNpfB+bdbCcTVofkC/LEnkZY0=;
        b=WOW02gjMHTlwagNw2xR8MM7AUXVHmTeXel2f1uRmRQSrv/y9oFMPCoXy8TE/f2r1pC
         U0cl+bkp/rOJLg9cgCiqtoOsu9ZSfYEmSD9LtDEU/5hRY6/IN5RJtFx+tU4cWKK+Qm02
         FjwhHWWRtZPb099L8Jxmx9LJqHvKPQwZ8Vol78N9GY3vs8Vys3Uzjhh34PPXpfJQdYF0
         ExC22dTr3v7RCkfvFAN8XylTzysrBf0IWbauOgx+AfzYD5WjB+4uxsLvESH5lQcCBuGm
         36SgJOp5RFTqoKcAQa0IYSsXwnlfS9oc5n8I8KmuGDW85tOB8WYGZIxMTats+ORcHCiS
         r0Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVfWCXfHIpkblbHuUcafnCWs8DjdTnm2QE1eMlr+sufmLBAGZPLXfvRSgRQWaBQFZQXhPqPridAntg0mA==@linaro.org
X-Gm-Message-State: AOJu0Yx/agw2Tj8amnR5Pvd5jpTXx9coweUNRXuzc9D4VHdWP1DJJ3JK
	FZ/AJqCexnzt+yDnjGAJKn8uffbq1hOXwtVBmfKgs+0TV9r65F4GNN7RVP7BCvePp55ZXTNx0n9
	SKJ0=
X-Google-Smtp-Source: AGHT+IGlIkcvQfqVVvHm809F9YqIElrzZKmax9yY2qA+GJ4yr0P9fW+0xTJH3k0gj6+vRVcrDX719A==
X-Received: by 2002:a17:903:2349:b0:20b:a9b2:b558 with SMTP id d9443c01a7336-20be199e341mr163370935ad.28.1728158761815;
        Sat, 05 Oct 2024 13:06:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 00/21] accel/tcg: Introduce tlb_fill_align hook
Date: Sat,  5 Oct 2024 13:05:39 -0700
Message-ID: <20241005200600.493604-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NRWeB1FMqk6C

This new hook will allow targets to recognize an alignment
fault with the correct priority with respect to other faults
that can be raised by paging.

This should fix several hppa fault priority issues, most
importantly that access permissions come before alignment.

[ Helge, I find that my old hppa system images would not boot,
  and a scratch re-install of debian 12 failed (networking error?).
  Would you please test?  It would be nice to have a self-contained
  regression test for this, using a port of the multiarch/system
  minilib, but that's a larger job.]

This should fix the documented error in the Arm alignment
fault due to memory type.

[ Also untested.  I should be possible to leverate aarch64/system/boot.S
  to manage this, but it's still tricky. ]

Changes for v2:
  - Include the arm_cpu_tlb_fill_align patch.  Oops!
  - Improve some commentary in target/arm/ptw.c.


r~


Richard Henderson (21):
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
  target/arm: Add arm_cpu_tlb_fill_align
  target/arm: Fix alignment fault priority in get_phys_addr_lpae

 include/exec/memop.h           |  47 +++++++++++
 include/hw/core/tcg-cpu-ops.h  |  25 ++++++
 include/tcg/tcg.h              |  23 ------
 target/arm/internals.h         |   9 ++-
 target/hppa/cpu.h              |   5 +-
 accel/tcg/cputlb.c             | 142 +++++++++++++++++----------------
 accel/tcg/user-exec.c          |   4 +-
 target/alpha/cpu.c             |   1 +
 target/arm/cpu.c               |   1 +
 target/arm/helper.c            |   4 +-
 target/arm/ptw.c               | 141 ++++++++++++++++++--------------
 target/arm/tcg/cpu-v7m.c       |   1 +
 target/arm/tcg/m_helper.c      |   8 +-
 target/arm/tcg/tlb_helper.c    |  27 ++++++-
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
 39 files changed, 329 insertions(+), 199 deletions(-)

-- 
2.43.0
