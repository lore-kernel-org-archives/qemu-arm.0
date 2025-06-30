Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2458332dye;
        Mon, 30 Jun 2025 06:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUf4GKoiSV9RoViPPaMA/mQOQpCVSJw+y4gedZQHBTynQtoEAxcchevMfl30kwDO1ccfHa7Ql4/eGaSFA==@linaro.org
X-Received: by 2002:adf:e18c:0:b0:3a5:5fa4:a3f7 with SMTP id ffacd0b85a97d-3a8fed6f21bmr10586701f8f.58.1751288980462;
        Mon, 30 Jun 2025 06:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751288980; cv=none;
        d=google.com; s=arc-20240605;
        b=Dk5cCcuSyLAWZZXAT3umjPtS/zCmYW3I3YawBfZzs9OubnaAVdLPUMVRbNo7S9e0tH
         pfZ8boQp0oXnq40p4QHfSpM4MEHNM9n+w/duz4rGTQnt/THoVSjy0pJQ3jD/kD1UTDZQ
         w6RFotxQpaAS+x4gEcEWk0bF9GOQt97LEBYyR3/kIW2eUYdcZgSKTAZ7L292pKVl05uo
         HRnLTDashbc2Uhsgd1UEWuT+Wt+wMhCDiw/98lWG0a/nqLbfjRqtl3ympEFQh1quj9Iz
         qKfc7/IQvYTQv+a+7cJuGAVtG4YOGglRxPWLpwSeComQpzv2F28nJgmXvnmc0HNgule8
         hS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=J4xYxzQNhLcyF00H/g7Tqzz7gyhKM10HOzZKk6JKWJM=;
        fh=BuuCvfWDoo+VdZlTwaBCyUFTF40CDXaVhqT8aW7Mlkc=;
        b=fXJh9xucgtL3JEdYE5gpcX4+HrpQxKRuV0uzB4+jzUuJ8OvmWMf7TsG7yhWv5eZQ2s
         hA7YyyJvfwKEU+6V7tS07XoqT3fXnOTvDTz/Law1ri4+tOiOF/czX8fWuPGcI5Rfg6NS
         5+vgmI6gcbr0quLHrlJXaA+JOoLB4sFuXFQDpDBXVPQGqtsrR+3od/Shih33C3aPcm2W
         BQug8JZvW8xHk0aZVEkloEo8+g9PHbZF4UhJ2dO6QeGh7qraqnWBEHyaKW3M7+h2cvlw
         jUDwufErN5EAfDSWfiYtf2DGxBfv36Q+uVFMxwQPKE+eZv/Vor5GrkebVEZIll1mjylX
         f0zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B52ySAX1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a892e5d78dsor1930033f8f.6.2025.06.30.06.09.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:09:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B52ySAX1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751288980; x=1751893780; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4xYxzQNhLcyF00H/g7Tqzz7gyhKM10HOzZKk6JKWJM=;
        b=B52ySAX1IuUUGi8waMAg6o3oOeUkYew6F4Glkr3kK5qfCcXeeJpD1m2isqQbZJTkyc
         34lC9fEuMDfzTo/Uwj7PRUC1IrMnVJnq37iqIvJDHCgDiCDNxCQY1cbbZrGJGasBaGYJ
         l1FGfUBxNQ8h7aoQBFBKTVRjiIsFBf0uf22U8vgJnNimbDAtB8VQHr8BcQ9wBFAoBO3B
         b8Ci2rbs+NZOqx0OEzKmCx1+733D85u1PE95Mw2aFdP6DdJBADxT5jFSlQ2YLjP8wtVt
         SiOmkzSLkkXx1Ll6YoHvA4r+fO6Qob1wqNl7N/AO5q30mzClwDwfbkZnpVx3Upt54fPy
         MhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288980; x=1751893780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4xYxzQNhLcyF00H/g7Tqzz7gyhKM10HOzZKk6JKWJM=;
        b=pMmypBIKeauHwG5Gu0zQpsquDK1zc8gPgzHSCmUl0QzTxrjgAqaV8iENbJOmRTkTo+
         43DF3Slary11Y0lgQ92qAWu6rmhk8DYM5TBg/nuBFIcrGYzd/D/hlCwHnjkUJ5Li83bl
         a67CrKEPvxuWUM3JOJ3WCxhS1MiMG/fCR35CUVX3W5nucoJ6QNO/VjjwbXUgJywQ5g9K
         4wW4HIBSWh4vrYbgWld4J2Sj7MTrp2LJ1TmJCdrmxq33VIe+6BQATe5KBDa+HReOzR19
         AbUov+rarOgwZBI6umxzh1PZuZYzBRLLR7hBIfOBCuceOrg/+61/3I5vMHj3xqhmtV2i
         o0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp/KFiL+ZbqjdNf3UYFIkCym4ibChoadRcdJ2IWMyzKIltBRuZqwY3cwCHR9T66N5sACy8N8MOGobseQ==@linaro.org
X-Gm-Message-State: AOJu0YwAulV8FTUboAxGw/ChHkZ79fH3MHixx8EkPavuNDqQRuwgSlRl
	4mLY7ObrYhrjQwGGLMfGhgVkRu28izaDSVhQN59AmDU4XegQ4YFEe4FtkAs2MjWBt2xNWQ==
X-Gm-Gg: ASbGncsIG2kgifwi/IRIC1K6le0p4xZYKKWsEklMRFvMpLcLm/wheBrITtLz9aZzjBV
	3bJ5NM/r5qNMTZ74A3EQevBR1ncxnftow/4JG5HWisJtsv6+U/BJSRG4XynVU3ahGs4patSp5nh
	IzJwuTa74MgpQvZdFDmxQLEKmcGKu63Kyu74r0HTz6lKL9FDkuR1CeYiyzQe3JGPy9dhFNxq82Q
	waNoJOzVxtUXPW9b2SsSdKybr76s/0wvKNVDJuh60CiLQRdo9ISvIPRBBwroUOd7K+s2hZGWly3
	9VrRWJEol60nuqL23z3rnlSja/ETj3UJ50HShLqFIdxupvFe61gPTgCMcKbreAkAMM0ze2SS1kU
	c6NxmzxpfTsArKpiytlGO4muRWi7uw1Fzdqcl
X-Google-Smtp-Source: AGHT+IHkxJ5nWCkCC4GVurCf6yTBAYDFE52nieG9J36qbUMb2ltXs1GQGS4fPZ0NknjV775ZoPvkxg==
X-Received: by 2002:adf:a21a:0:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3a8fe79c8e3mr7865075f8f.48.1751288979763;
        Mon, 30 Jun 2025 06:09:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52be0sm10606213f8f.64.2025.06.30.06.09.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 06:09:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/6] target/arm: Few accel cleanups
Date: Mon, 30 Jun 2025 15:09:31 +0200
Message-ID: <20250630130937.3487-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: oklFYQ+8ERzQ

Based-on: <20250623121845.7214-1-philmd@linaro.org>
     "arm: Fixes and preparatory cleanups for split-accel"

Philippe Mathieu-Daudé (6):
  target/arm: Only set CPU_INTERRUPT_EXITTB for TCG
  target/arm: Only allow disabling NEON when using TCG
  target/arm: Better describe PMU depends on TCG or HVF
  target/arm: Re-use arm_is_psci_call() in HVF
  target/arm: Share ARM_PSCI_CALL trace event between TCG and HVF
  target/arm: Allow arm_cpu_tlb_fill_align optionally set
    CPUTLBEntryFull

 target/arm/cpu.c            |  4 ++--
 target/arm/helper.c         |  2 +-
 target/arm/hvf/hvf.c        |  7 ++++---
 target/arm/machine.c        | 10 +++++-----
 target/arm/tcg/psci.c       |  3 +++
 target/arm/tcg/tlb_helper.c |  4 +++-
 target/arm/trace-events     |  3 +++
 7 files changed, 21 insertions(+), 12 deletions(-)

-- 
2.49.0
