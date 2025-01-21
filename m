Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24178njc;
        Tue, 21 Jan 2025 03:40:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjsLn6bdmUw/OlPoRefCSQj0bGQ/hS6bvhYqSv4YgzjGPKAHYzjv39VXoPjHZsMBlZGxc5IqccowWHng==@linaro.org
X-Received: by 2002:a05:600c:1c93:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-43891426ebcmr132828485e9.21.1737459658741;
        Tue, 21 Jan 2025 03:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459658; cv=none;
        d=google.com; s=arc-20240605;
        b=iCYV+cUeTvje4W7hkl1Dz1QNN/8wiEbAP18cYQMWkTklvDhstlkMfCZkf7dxH7NRaI
         agqyhLj3CWAbpGXkZzfd3h9aHOWUojpbCsv7XhcKZuGYa1isii+k84j0H+1kGro69VQc
         VhZ5qt/RqeG2TqcFevRa45yrWbiaxwuASg1qmto9xAhDd+hyIO2JPfP/om1kyGgENgpD
         sY2nXVy9WUC6kqLWXkwTAZOSDyptB4LCueCiS6mWFxBQY5kN9wq++gQttQXAGNC942fn
         oxkw1n/tkkojgl+rYvYZOa+urZuP0b7Kl1fPnvEyr3yx8JDokHDhhVr7C+SgD2L783Kd
         bXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Wb6pqRiqYW/ELGfXwHxoafyELsOoRfg106goBLltgwQ=;
        fh=06IUdO4VpA7H2oIN6T6r5VLfEYsnSv/R5SpwSjflN0I=;
        b=igMOecPO5cNlvvXOlqyDnbJGQBJUliIhqJQDhj1Ifvd4MSaAEmvjlnuKtOdKjt8lIl
         uGOGo8Tyilh7P+pODkuvuDRwoznqNXkDp1Ym0O8wNoLEFWbniEwd3C8VLupWOFFHMW98
         thNVtN/+CLaUl7DfmBOV/VXsFSgPVk0fxzefF5FO5siimKZ96ipheUPvkGm1cI8ua0zI
         PxgkU1K/68WIFdkmrQ6IObp7fE0+Rtd6HyVuQhWs6Q6oq+PdD75oUF9Au12ersDywqaF
         d2rnqbbn3pyGft+RU2GhJ13AcRWyZaWFxT9lG5+hgmaZsUpP1ckBOa8hy94eluUkfhyr
         4beA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poYrxh+Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389042ff5dsor35000235e9.1.2025.01.21.03.40.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=poYrxh+Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459658; x=1738064458; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wb6pqRiqYW/ELGfXwHxoafyELsOoRfg106goBLltgwQ=;
        b=poYrxh+ZPgf8Jm0vTgtdiixKn0YiwLX6Aq4/f91M8S0vbqzk4cFdqyjDy9+KP4tm0F
         om9vx0CyzaZxuRnr6/UWfC2k4vqTSiMukRRWdX748jTH+1e4e4SVQ9Kex1xnl2+4zwH1
         h6U3xor4UIAr27uJxopenq0K7Rv8PAElqObsW1rIfICRZ9DHgY9q8oL3JYKelOwBNkMO
         scOZ+j2iYyHhhCe55jc8fvgN55VrRnmkKfbe8w9b9KaDH/rXVwcH8qbetdcmhxmhbx3x
         wiL4W90De00/ilXCTSnbALMVhGbMQ8wA8nNNUcc+cfZerTBvsjYHGbsq/Nys1VlgswSz
         cMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459658; x=1738064458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wb6pqRiqYW/ELGfXwHxoafyELsOoRfg106goBLltgwQ=;
        b=RXTqfIX2Ni2//p4ZzOW895dA2tJZOyQYNfeWzdDyb0Kk9Vi+2OBhw0e6mnFECmhae9
         K73En+7Dw55jt3NaW8k+ZJ5c/QLaou81NktGmXBodguTT2WjhdJWLjc05GL8o6PgHvLW
         utNjUIcVBO5TmBMBu2eC0/OAzsft5ASZm4m/GTeODGE4nYzkKxKoi6kpAnUPsQJYHtTA
         JHlZOPGI1LabRd/ukSBnuP2hIt8zoeMQi53+TU/43K8hKM3BdtBgFf81aKimmfDxvlby
         xnSm6e5/eccXRnN0SnDBJzUoG2qAEzJ4vDKUM+Z48RaZEFu2tqQfqr5Q1/keC1/YyNF5
         u9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWzccR2DJSbpKAO0CzyjGqEYmzk/ZLyJqcmr1uyOB7+Ps+CXA+P4jEwTfuQBt09nv3qaCBQgIGMhXpd8w==@linaro.org
X-Gm-Message-State: AOJu0YzRoCzXJOTxTDXqLavAF2MXMoDKRyPlKi+gnFp11a0NntOf6tcU
	n8tmwZv7iznyACYl+1IY+tF9KWWM0eEle8NHa97pard5iOeGPqUkMig9JhnfaIVk9Q==
X-Gm-Gg: ASbGncuDguvsJTbAhyDoVf3EV8nMOZYeKdgik24MGPHsbD4/p05MNP5eJ69wyxqy25C
	7/s+pIC47UsYc5t8JPEHM0dFyFX7PFpxlmsQzI8k3KAuJuzTGgrIe2QwjZT54yX7nFLQ874jJ0s
	2Qhc8/zEtPZhaiYuFRtpncP9afF9Og7XZKXHpJ6GQDPaSm6vN1a0s5YzEO0/KJSzrb3ed6HVMyN
	khWLqWTu0rI436Rbmg1V8EvaTlBpMm+b9xZ6DAgMArTQEOdX7QQN/Xe+ORHIDnBjEa/26ELEZ/e
	p/appVNcag5W+Xj8GHOlFSq1dIQatzPcSqgywNhi1Ilu
X-Google-Smtp-Source: AGHT+IHvCwHTxvrZLJtGZxKuMxkpCKgyNfvOwzXnYWAoIfvtGRSVA33e7SjQFpKw+svx2RNDvz/BhQ==
X-Received: by 2002:a05:600c:3593:b0:434:a239:d2fe with SMTP id 5b1f17b1804b1-4389144d62cmr139826785e9.28.1737459658183;
        Tue, 21 Jan 2025 03:40:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c752935csm232604555e9.26.2025.01.21.03.40.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:40:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/11] cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:45 +0100
Message-ID: <20250121114056.53949-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: NWYbqaAptWAp

Use cached CPUState::cc to get CPUClass.
Main rationale is overall code style.

Philippe Mathieu-Daudé (11):
  cpus: Cache CPUClass early in instance_init() handler
  cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro
  accel: Prefer cached CpuClass over CPU_GET_CLASS() macro
  user: Prefer cached CpuClass over CPU_GET_CLASS() macro
  disas: Prefer cached CpuClass over CPU_GET_CLASS() macro
  gdbstub: Prefer cached CpuClass over CPU_GET_CLASS() macro
  hw/acpi: Prefer cached CpuClass over CPU_GET_CLASS() macro
  hw/core/generic-loader: Prefer cached CpuClass over CPU_GET_CLASS
    macro
  target/arm: Prefer cached CpuClass over CPU_GET_CLASS() macro
  target/microblaze: Prefer cached CpuClass over CPU_GET_CLASS() macro
  target/openrisc: Prefer cached CpuClass over CPU_GET_CLASS() macro

 include/hw/core/cpu.h          | 10 ++-----
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
 target/microblaze/gdbstub.c    |  3 +-
 target/openrisc/gdbstub.c      |  3 +-
 24 files changed, 76 insertions(+), 135 deletions(-)

-- 
2.47.1
