Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004510njm;
        Wed, 30 Apr 2025 07:58:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3jKxx9kUsOhRLHq0ddkc7+R5+azEL8Fq8D13ffDLms8aCwZY5/vzVqE82PG66TzHbGs4wpigMf6yh9w==@linaro.org
X-Received: by 2002:a17:902:ccca:b0:21f:7078:4074 with SMTP id d9443c01a7336-22df47654f4mr49346385ad.7.1746025131223;
        Wed, 30 Apr 2025 07:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025131; cv=none;
        d=google.com; s=arc-20240605;
        b=eWX8hh78N8FgxOob7l7Esm8BFYlm5iRNjoJnCO0C1E3YIBsKSe2XyInx3E6wpUvDm7
         aXFgkF4qhtKRJ/OFxlgCWNJqReEc7gnPClg4YoDPIkeKoU3CfxTkQDbwao5wu0UEmkWF
         wmtddn/X6yVEOuJn6dYCFg/LppF8kM5uLywls+hx1/4ZjF3geLswwLb5YsSfbXNsmTiK
         rPSI0Ss/PABUZBKvXKqXIUNRSW6ffbAOCRdHewfGFLRJ9cjn+fMw3tsNT2e6vRl/SDn1
         X81qa6r+fY3pgcefJHXmqIDiz5OMzddZJ+30KWc6gic86YAZrr0JEtpU6CrS65wYJFKW
         vqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=B2+JbLMiiUYaemZWDCUtTt3O9Oj1MSI0kp/U5wwWhSE=;
        fh=aaMPQ49TObSJDbko/maYe9csv4W0oYs5+9wubIbrXEE=;
        b=cHFzCiAmAYzfupbk4BicVoVJ+F2EEVhBqjZ9lHlszfI/jBnwxMr6tUrsLZdf6DELFZ
         2xIa4Tl1F27RlLsHAxld6gSPUupVdz+VmuGxPtFu1G9zDInoSdHcudwU23uuFgdiiDZs
         MoQ0U9balY7bQjJgMrVw5j2XnqnIkDwKyNwWzp6MnAllK7iXtkF3/MbGk4IDNKlsKuaF
         oo3YllyX2SQLnRgtonfYqQekxmYUpQGqrdP1jQvWDv45W+FspG6Ubn6a8H+G8D+gagZP
         gJLCbeYiiN5d4hArkHC6PLXR9Y9geMudzL1PzeyfqyusQiyLQFQkocsXxYc1c3CKL6wv
         rj8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tKnTle5P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22df5619f8csor10032725ad.1.2025.04.30.07.58.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tKnTle5P;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025131; x=1746629931; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2+JbLMiiUYaemZWDCUtTt3O9Oj1MSI0kp/U5wwWhSE=;
        b=tKnTle5PSL8XrSCyGAthJkQ9/kJqLB1AwFe/T50+yReGHJIYXD/gkhgn61ZiCgyT66
         jJG1TM6pfyca310YQBhj7XfVsV4zP0LKpRB7ZASUeSASM9yfgxy/FVTIm87uPGV6YqWu
         8YIjfhnm+ZJb/TcyIqWfUtL4b46o7XsE+MxBXyGPyvsSDoa91uu/ErAsA1A600AfoNIA
         BI9kp13ewvY8ZWmjKzraW4h5RangWY0fC/yDjum3f1LD/XRqJsCZ2tAhi/vsUNGbdUZx
         nfXOi5CXSeUjgfaQIcZ/rVHcocYFJwJl+y29Fz3c570r2/SU6bohDtcJk88Cmmr8toGo
         Wfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025131; x=1746629931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2+JbLMiiUYaemZWDCUtTt3O9Oj1MSI0kp/U5wwWhSE=;
        b=SvFRPMhfLBQycFqOR5kKz4PVnt0nXpEqpQdJxzj+6cT4Ky4yOjTY11fqC5GK0fmvVk
         X7IbkxS1nt0fkKlVrc8lCuPiRIhJlNZtAIeaeHYwETO+JrgDBpnTHVU76TlJe4e7Ggre
         JkLq2rBXYpe+bNcyCueR/+n1PpRLQTmu9GfcE+1opBiRXMHhzGDSbp2kVX96qKDyBnJM
         Ru0FSkMupnnJIDjkAnvVrayVXDfm5dt54+wCsJN1IzVtSAfEhye3H3M3Yi+JdifaFTCn
         x6FG57rkdz+iNz2/FDho70/IKyrcHD469DSm9pJdLQ7H0ZFCque/gbFlA9qMD9fQRggs
         z87A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1xbKcGBazWdO87qfisUpcB+T5WyESbOUdWrIak91JHcnuW7Kim0bHOWA6pGQ7P0LZHiYUfhd9NIqMg==@linaro.org
X-Gm-Message-State: AOJu0Ywf89RIzQS5kEHIVkv6EyL5MWgvx26XFRKYW+3/KoqoMPrZDo4W
	uCk+LKUQYkExl1D75ZtM21rz23i86ZHbbK0bSWaXoZ4SMaJsI5lWsKToJpsntogUTQ==
X-Gm-Gg: ASbGnctX9inG5i0fcg7X001/IhBIHD60Se3f6TS6fO1yt3pmkf0sVmSSLYPeAKjuL/z
	C3609VRS6sYbYE5KqMr5VxF4P58qb3w99dmQhalHmP7gAH8Dscm9ttkor7mLWFycj6nfQAUfapK
	AJByAwWCho66rteTOXEqFn4Fr5av8QJ/CDG0EZWCmLUxCz/rY4MRoZzcSjqICIXauIADYca8fcR
	FTghXVvqod6FPOdUCaJPkIchugsD0OUmZnWWUTpwAlGtHmi8Yw/dEGiMYmTV9iU9x+taDAN8KIi
	1ReWEkr8KGm8XJLZAHrpHW2tiPvJHeLZBNqaNkJf
X-Google-Smtp-Source: AGHT+IGVJzpOY1sOKyELald78Uh/X55cVaOwtQ3xJcxUF7oIJGgGU4BQTL1AHVt8pNiGxX22IiuDXQ==
X-Received: by 2002:a17:903:2ecb:b0:215:9eac:1857 with SMTP id d9443c01a7336-22df4747f3emr44018045ad.5.1746025130724;
        Wed, 30 Apr 2025 07:58:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:50 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 00/12] single-binary: compile target/arm twice
Date: Wed, 30 Apr 2025 07:58:25 -0700
Message-ID: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 2uLMfkVN84IJ

More work toward single-binary.
This series convert target/arm/cpu.c.

Built on {linux, windows, macos} x {x86_64, aarch64}
Fully tested on linux-x86_64

v2
--

- Remove duplication of kvm struct and constant (Alex)
- Use target_big_endian() (Anton)

Philippe Mathieu-Daudé (1):
  target/arm: Replace target_ulong -> uint64_t for HWBreakpoint

Pierrick Bouvier (11):
  include/system/hvf: missing vaddr include
  meson: add common libs for target and target_system
  target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
  target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
  target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
  accel/hvf: add hvf_enabled() for common code
  target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
  target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state
    common
  target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
  target/arm/cpu: compile file twice (user, system) only
  target/arm/cpu32-stubs.c: compile file twice (user, system)

 meson.build              | 78 +++++++++++++++++++++++++++--------
 include/system/hvf.h     | 15 ++++---
 target/arm/internals.h   |  6 +--
 target/arm/kvm_arm.h     | 83 +-------------------------------------
 accel/hvf/hvf-stub.c     |  3 ++
 target/arm/cpu.c         | 47 +---------------------
 target/arm/cpu32-stubs.c | 24 +++++++++++
 target/arm/hyp_gdbstub.c |  6 +--
 target/arm/kvm-stub.c    | 87 ++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c         | 29 ++++++++++++++
 accel/hvf/meson.build    |  1 +
 target/arm/meson.build   | 15 +++++--
 12 files changed, 237 insertions(+), 157 deletions(-)
 create mode 100644 accel/hvf/hvf-stub.c
 create mode 100644 target/arm/cpu32-stubs.c

-- 
2.47.2
