Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp531927njl;
        Tue, 8 Oct 2024 17:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhMBQ+9fjh5xkumPRv3x1IsveOB0rdfnK1Q6oxTrB0e4RNYjNU+4QMjLWWBsWXNQ350eiLjq3KEbbsMw==@linaro.org
X-Received: by 2002:a17:903:2b05:b0:20c:5c59:ae82 with SMTP id d9443c01a7336-20c637486d4mr11518385ad.31.1728432295988;
        Tue, 08 Oct 2024 17:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432295; cv=none;
        d=google.com; s=arc-20240605;
        b=YEU3KzlkCcAUW2wTX/gvX+ovEgHqhfm3r8Q6FXL8bCSzs+SoFQI06D+ooImUFd/6Gl
         TLiHyFA40Q04b4IyzgTXyIaD6bgxj9eYGMyWz5FZXKk+fTBonk1ZJmkE1lm6WgMk6/do
         BfCxnrM1CtE7cyN+eKNaB9Bp+YDGlNRedm9ycz++Ari2uXwdBg+sCHaTezEE1DKopdMZ
         ZVhr8J0pHNt0aS5WQDVjC+ser55DXFD5UGYZp5wv/TOfXOqaIoeTH0eaIela9cpDHWnR
         LCbLKMuwFgjyRb3xc8V3Kiv2QvdnNOacz9V9Bg31Rfr1WC71gI8LsmmV0kwOQxc6bSJA
         ZPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=47Pe1MH9gsNOxZkdWXv/PZJTALTB63WGwPGX9cZVdVo=;
        fh=OlRjcFOXGqFzzE1HmXkLMjiu9vHnNR5DZnPZiAFRDzo=;
        b=bLqJ5FPdm5JhLwOFQOOIX7KTN5mp/8gtfu7T/5u5Fy1/9kFUdLzcjFBk1/4ds5Iond
         CfOc1swhg6MG9SYkrIXB5xR0CwckovgO0Bj7U/9/6HQYbHtX/9boLcN0mh2aEpEKaBi/
         ZuJb+VDg3W4+3ojNh6bMGrYl9y8q8td0p0hOiWegsgChB0R3KXXJ+bgXapooCdGXCuqR
         JrHKrZp6ircYZyHYsJlda9ZOYCbaE7qoS9gYnQ6NG4L6mgmX1LnFt5uigh/2YRTmQvc/
         WfBFdfg4DEvVE+FzEgrqB+jZIjCP/+QUIAfOt87/vEdxCSDoNQDjYAE1PkmaA4iIm0fd
         IMSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWC5NPiv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138f5c8esor2931745ad.12.2024.10.08.17.04.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWC5NPiv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432295; x=1729037095; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=47Pe1MH9gsNOxZkdWXv/PZJTALTB63WGwPGX9cZVdVo=;
        b=oWC5NPivQ0QpOwNTDZqSjk2GPg1L6CSKopxrcVaMtPbdyC5EGI8Brjcz9V2hCnRcQ3
         xZecJ5snqXyo3VIWBiuA2z1mltIFzxCCkZXl/aIBWho0AzMXia2KBUJTBkJ0tDO1CD7Z
         HcRX4J8MDgAOWdRHfgfVaJ36LCalNRm2l37gm9qmOPZWzFmIaBCaoVIPSUHqVFqMpdeG
         OeHuH7/gUo6s5w1npIB+QpQogSUPSZOH/NQgmf+FNzll4yzrZzi0ZhS8NjEpfExJGM2Y
         1Ey9QX+mdgdJh6lGWdv5y/3kxeYZ6spQ63BVlUEEPQ8nbxsqW9HbKpM0HRhIXkrSqYVW
         kc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432295; x=1729037095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47Pe1MH9gsNOxZkdWXv/PZJTALTB63WGwPGX9cZVdVo=;
        b=KGQNr8UOHy6sVa3NzeUuIb9yjwoDgVZ2acMsz13bz3W3qvxDCvs2ZY0jQvOQsTRv6M
         MifL3+ARJwW4uD1vb/YHQPrf+aBrYCeXrkj82p4/n4agVLmw/osZlGIAAgTqYDT42PDs
         5VxDv9rsVulKTcPLci67LVVfgrCMHJgKEpDVegftzTmLnMa0qABYzfDAaXTDjptF8PKZ
         jvE3V96npwMjQoUVMvmCWaHNsc1i+C7RYfW2zJyC0guKw1BU6znPXvsJvKwLCcssowb2
         W3aD6RHZTuc19/8onabY0enm1AaQ2BusMaenxeidAmhW32/KsvmHXC9sOhmS7rnxoLIA
         FxVg==
X-Forwarded-Encrypted: i=1; AJvYcCWceRC+oJceg/WSxnS5Ui2xE8h1e4MieyYxPtLiLUiWCJewFCOXZivybVL39y+2RUDgQUzGjaR6MGKNZA==@linaro.org
X-Gm-Message-State: AOJu0YwK+V1CKFjmmJJ1xHb246DPCmMQ1ceF5Q1IR1bG7sKS9AakcYLN
	+S2yPXYaIa+Rm3BC66oriLc8S3dX66qMYDTu7nYZ+t5QMUjSgTgD2eurG24/dkatgQ==
X-Google-Smtp-Source: AGHT+IF7W3tFDq7NjDPWGL7RHkyhiahUq6Tk0gHdPQurTadTzr8V3g0hgvREtTGmqziBBmE6YVcFgg==
X-Received: by 2002:a17:902:d2cf:b0:202:4b65:65af with SMTP id d9443c01a7336-20c6378ea43mr10853195ad.52.1728432295419;
        Tue, 08 Oct 2024 17:04:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 00/20] accel/tcg: Introduce tlb_fill_align hook
Date: Tue,  8 Oct 2024 17:04:33 -0700
Message-ID: <20241009000453.315652-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Nbi0W7Xb0Wqy

This new hook will allow targets to recognize an alignment
fault with the correct priority with respect to other faults
that can be raised by paging.

This should fix several hppa fault priority issues, most
importantly that access permissions come before alignment.

This should fix the documented error in the Arm alignment
fault due to memory type.

Changes for v3:
  - Change the tlb_fill_hook to return data into provided
    CPUTLBEntryFull, instead of calling tlb_set_page*.
  - I have dropped some r-b, correspondingly.

Patches needing review:
  05-accel-tcg-Add-TCGCPUOps.tlb_fill_align.patch
  06-accel-tcg-Use-the-alignment-test-in-tlb_fill_alig.patch
  11-target-hppa-Implement-TCGCPUOps.tlb_fill_align.patch
  19-target-arm-Implement-TCGCPUOps.tlb_fill_align.patch


r~


Richard Henderson (20):
  accel/tcg: Assert noreturn from write-only page for atomics
  include/exec/memop: Move get_alignment_bits from tcg.h
  include/exec/memop: Rename get_alignment_bits
  include/exec/memop: Introduce memop_atomicity_bits
  accel/tcg: Add TCGCPUOps.tlb_fill_align
  accel/tcg: Use the alignment test in tlb_fill_align
  target/hppa: Add MemOp argument to hppa_get_physical_address
  target/hppa: Perform access rights before protection id check
  target/hppa: Fix priority of T, D, and B page faults
  target/hppa: Handle alignment faults in hppa_get_physical_address
  target/hppa: Implement TCGCPUOps.tlb_fill_align
  target/arm: Pass MemOp to get_phys_addr
  target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
  target/arm: Pass MemOp to get_phys_addr_gpc
  target/arm: Pass MemOp to get_phys_addr_nogpc
  target/arm: Pass MemOp through get_phys_addr_twostage
  target/arm: Pass MemOp to get_phys_addr_lpae
  target/arm: Move device detection earlier in get_phys_addr_lpae
  target/arm: Implement TCGCPUOps.tlb_fill_align
  target/arm: Fix alignment fault priority in get_phys_addr_lpae

 include/exec/memop.h           |  47 ++++++++++
 include/hw/core/cpu.h          |   4 +-
 include/hw/core/tcg-cpu-ops.h  |  26 ++++++
 include/qemu/typedefs.h        |   1 +
 include/tcg/tcg.h              |  23 -----
 target/arm/internals.h         |  12 +--
 target/hppa/cpu.h              |   8 +-
 accel/tcg/cputlb.c             | 160 +++++++++++++++++----------------
 accel/tcg/user-exec.c          |   4 +-
 target/arm/cpu.c               |   2 +-
 target/arm/helper.c            |   9 +-
 target/arm/ptw.c               | 141 ++++++++++++++++-------------
 target/arm/tcg/cpu-v7m.c       |   2 +-
 target/arm/tcg/m_helper.c      |   8 +-
 target/arm/tcg/tlb_helper.c    |  49 ++++------
 target/arm/tcg/translate-a64.c |   4 +-
 target/hppa/cpu.c              |   2 +-
 target/hppa/int_helper.c       |   2 +-
 target/hppa/mem_helper.c       |  55 +++++++-----
 target/hppa/op_helper.c        |   2 +-
 target/xtensa/translate.c      |   2 +-
 tcg/tcg-op-ldst.c              |   6 +-
 tcg/tcg.c                      |   2 +-
 tcg/arm/tcg-target.c.inc       |   4 +-
 tcg/sparc64/tcg-target.c.inc   |   2 +-
 25 files changed, 326 insertions(+), 251 deletions(-)

-- 
2.43.0
