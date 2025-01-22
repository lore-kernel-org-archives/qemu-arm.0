Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654640njc;
        Wed, 22 Jan 2025 01:30:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtc50ZSs4T+PHNesDeDY5VxpP6PrjMa7fhUe6YtfIogNKcPG8NmmVu6Hs2GFaTi+nQ592oHqmtLjBygw==@linaro.org
X-Received: by 2002:a05:600c:1c21:b0:434:fd01:2e5f with SMTP id 5b1f17b1804b1-438914391bbmr202307165e9.29.1737538231230;
        Wed, 22 Jan 2025 01:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538231; cv=none;
        d=google.com; s=arc-20240605;
        b=IKFk+DeN/HcCr+0CbQpVaNZklFWk032mZah7EpVJ0T3WlhxyjaNyNogjUiHNYzz/wF
         WkrymRvNZ7J94C3k2FxUCyanKLPUbDeiqSR4oXJu9I1LNVWDNk2OXTh6d9kacDFP9gSP
         of+dqfJlKopigNipvsr94PGQKV7wcC/npTlIT8b8Es1XTx6SjOpGRRJkIngJSo3/JEA5
         U03F06TrJ4Ag6MXyYXeKAfAacTmcSta7yXwzUibCh+pIrhg30eIwAR5QiXRdHVHUe42i
         OTYwQAOOgdiBM589VDMv/IBEQBLUsRM2hu4fEK3KQEnodwrpaJR0joA6h5HHXXPF2mhG
         8hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=6JCKxl/E/lMfjQGnH4P9B5vjq2aSMsz2teDy8pH82EM=;
        fh=kWXvienCRTWSjTkdRv1qE1g69VboTuJzbdtB6jL1TLI=;
        b=P15OnNaiQEqDiadgqgvyLyAVGSpmnYyaySDL9EhIpz78WzFesGYGeolPrpwhlA8bnC
         11bT+8fmLrLShHDAkIgt/MedMaS79NpY73vslkj8t9wNLWbKj7RouAnlnUUQI42N5V93
         aCxKZHP+ddNwVM5z+bSp6XtiZOty7pVgY09bz24Nf9ZJpkvzvZNbNybrUVuP58x1WGaH
         heNsxhvc7OTQpzMqqj12mFvai7hVNzx/GEl/6HrjiJ2Z3IKBsU8DViSyHOfZlbM80LuQ
         dofd/4a4qy+ThLQ2sI1PF9xX03HpDAZtNlDM0RgIS0XegRKvE8HM3mCTIDFzUX9HHrkM
         OgdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxiZyGV3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389040adbfsor42749325e9.1.2025.01.22.01.30.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:30:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxiZyGV3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538231; x=1738143031; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JCKxl/E/lMfjQGnH4P9B5vjq2aSMsz2teDy8pH82EM=;
        b=hxiZyGV3g+Q6vp3Pp2/PjGatgt5E7TSiXdA3KoaIpi8VTFlNGvmOn8h3xWK9icGywF
         T+BivVWPDf9mVXh8DG8NMnROUcGEvj0F/Z1iNQZvo9smuFbG7F4nuZDb5+p9QlATLIPD
         WIVE2p6UbFkU/5igJQmBmcscGmeq/e+DMr9/7/YVubt6t+TQ7EbMLgNA6d7zHRE2N1wA
         +wMd4Lfu5sE3jCGKcqeHTucSRffiA63H5ne9rabeI9ckvr7/sT8HiI06E0gBZ+v6JXSk
         VAQvwO13k1VRyezdoF5D8M9fEQ8Zv5QIFIRS94xrgoGeUDb7OROjfAzCsfq4NRlGPHiD
         ddZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538231; x=1738143031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JCKxl/E/lMfjQGnH4P9B5vjq2aSMsz2teDy8pH82EM=;
        b=f+V2Ug3Aw9aIAKnHoCe/3+lGpUCL4B0tpOZxuTuiIQNl2FPGiT/Jv427FCpXwETlLp
         o0UH363wCyluk/UpuxjoEvw1tZa8LMODfU4DQnquqs7kf9NQ3q9tk8ncXAoU+qV9Emdv
         glZqjSUEOP3ok3+8mWRC0jUVAaxRrdL2vdENmf2w3feS9Sx20IdRt/TuE3XO65gRbG8V
         8dt2LI2pIPTUq3CdezL/kBlfrQem7M+TFFV9MA6MBTkVzHT/ErIoboEQL/lBU2Hclg+a
         rFzZ7WOjTDl1ScRrUGtQ2LssSU81E0LLzs2bIOg1BSEFkrW2erS9uolbqD1X3rMaOJj2
         tzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9xvuWkPvqDa+fE15kZEr5mxEO8v3qXRcJraMh8iG3GrDC1sQy5+ZhPsMiQNoIHn9LLJWqLrPyieCg+A==@linaro.org
X-Gm-Message-State: AOJu0YxJLpBoIPsDp+cxX5dcJR8SKb7q+cyw7SU89Bgjilv7ouwyHE3p
	APPzcLnpsYtLOZ6k6YOGEUoyajajFF1Op0KuCNTpPvLzLDn2uQwrrF2pyPcAm/e0UQ==
X-Gm-Gg: ASbGnct2lb+1eMo7yu3btiPVlsSmczCB/qF/ydN0yC1FDVdronqXPa0R2Ipeb77MOQY
	zLj+OWLiUgD7JNfmYKKWYi6B8KGEqED5JGTpzybdkIBUqTb8iavqrSsT8pFGDMbfp330iWb9KZL
	la1dHOh//2ajJj8oqawlwr/X1oLG24d7gEUw4Crhw+kjoUUn/xoD4ySS+BR1zZQGWxUcPb2za+h
	ZuIbfcLXjABQ7VVSsWjdMoIGPbKbvQdAgicrQ0Evx1hj9VR/pHp81edPW6QfATjSqPctvI860U7
	AAqH+C6znhy7By7IwCg2/INiJFWlGXmfZkQcahFiHjdo
X-Google-Smtp-Source: AGHT+IHEJolaNlR785vud4ZQQFbDX1NKMiQ949Usvi04hkcDEpvfNpYc5F2gnYirYUfibGJ87n1ATQ==
X-Received: by 2002:a05:600c:5486:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-438913cae48mr176319165e9.9.1737538230734;
        Wed, 22 Jan 2025 01:30:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321503fsm16019060f8f.12.2025.01.22.01.30.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:30:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/10] cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:18 +0100
Message-ID: <20250122093028.52416-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: o1r864n4MVhZ

Missing review: 1 & 2

v1 cover:
Use cached CPUState::cc to get CPUClass.
Main rationale is overall code style.

Philippe Mathieu-Daudé (10):
  hw/core/generic-loader: Do not open-code cpu_set_pc()
  gdbstub: Clarify no more than @gdb_num_core_regs can be accessed
  cpus: Cache CPUClass early in instance_init() handler
  cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro
  accel: Prefer cached CpuClass over CPU_GET_CLASS() macro
  user: Prefer cached CpuClass over CPU_GET_CLASS() macro
  disas: Prefer cached CpuClass over CPU_GET_CLASS() macro
  gdbstub: Prefer cached CpuClass over CPU_GET_CLASS() macro
  hw/acpi: Prefer cached CpuClass over CPU_GET_CLASS() macro
  target/arm: Prefer cached CpuClass over CPU_GET_CLASS() macro

 include/hw/core/cpu.h          | 12 ++++----
 linux-user/alpha/target_proc.h |  2 +-
 accel/accel-target.c           | 12 ++++----
 accel/tcg/tcg-accel-ops.c      |  3 +-
 accel/tcg/translate-all.c      |  2 +-
 accel/tcg/watchpoint.c         |  9 +++---
 bsd-user/signal.c              |  4 +--
 cpu-common.c                   | 10 +++----
 cpu-target.c                   |  9 ++----
 disas/disas-common.c           |  5 ++--
 gdbstub/gdbstub.c              | 26 ++++++----------
 gdbstub/system.c               |  7 ++---
 gdbstub/user-target.c          |  6 ++--
 gdbstub/user.c                 |  7 ++---
 hw/acpi/cpu.c                  |  4 +--
 hw/acpi/cpu_hotplug.c          |  3 +-
 hw/core/cpu-common.c           | 16 +++++-----
 hw/core/cpu-system.c           | 55 ++++++++++++----------------------
 hw/core/generic-loader.c       |  5 +---
 linux-user/signal.c            |  4 +--
 target/arm/cpu.c               |  3 +-
 target/arm/tcg/cpu-v7m.c       |  3 +-
 target/microblaze/gdbstub.c    |  5 ----
 target/openrisc/gdbstub.c      |  5 ----
 24 files changed, 76 insertions(+), 141 deletions(-)

-- 
2.47.1
