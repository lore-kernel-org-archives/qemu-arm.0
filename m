Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694565njb;
        Mon, 17 Mar 2025 21:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+1SxBqlccZ2SrCOTsJnqZQBotMSW3Ny8sj1Ubo1ZRo9QS4nswlC54OyJHZGikXOWFoZhYixg2vahq2Q==@linaro.org
X-Received: by 2002:a17:903:19ed:b0:223:2aab:4626 with SMTP id d9443c01a7336-225e0a15b42mr211655695ad.11.1742273493649;
        Mon, 17 Mar 2025 21:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273493; cv=none;
        d=google.com; s=arc-20240605;
        b=T9+jqjhbSaVGXoCll9ynHxCd886uRBhbTkFgMDcbc82QLINThTIWJ+Xc8cB+RXh7J4
         xKCj/5ZAGYNyO+hcL9OSPyFq4dpDCOjo6xUfolpwqWsIWiOY9N55o29Yk3uSh5kJ1I/Q
         6WwMPclqWc4LTOWBgqyCTtZH8YF/ArHU4a0V8i/6XTvnifGvo2GzVD91qiDzjg+GmHU2
         ku5h7irLpM5c7o+5dbF0zJMfBJYNZCvoc1NJzcQ57Acar/NyYDZVvfb081b6fW6NaXfN
         TPUuqFQ885RKocjMw6ilZTO/8CIEW3Pb5VlHKeyWCrXk4B6k2W1c/YmqevUDhTTFcnKS
         zihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Zu9103r8oTjAUXk/0jU4XMC8f8kUJ8IRY2kEKbMxwAQ=;
        fh=WqTimibrmYKT+TsJohQhTnjQWbphGdlTAr6Fz5aiBjU=;
        b=Vc5Qm8tkTtd0K7KRYHVoYB4UBvpoAsCvLl902ctLTuiy6n1dchdpRJe71ThUyd9TYX
         rpIx+8rGuX4k8QqY2257I7K7TiNEQbEVPvwl97d7+jTV4vkB4ZRIft0spfTxaMAUlbUK
         Evo2wE930tQ9YRtS8+HZC0n8y+99RA9FzlaoksOmbR3VXICl0Q7bUfr+Oy8JESvQbxJ+
         rRzTO4AAlPd5UneZr38O63PsZaZQhQs3imxoZNGg/Rlhe7qMnRKiBRgcY6ncQ8UhymkX
         bNrLhfHd1fw4pBM/VqG2D5DXCUPpQu5HO6AZ2yMte7eJp/EMz8VQPbg4Q7RuT6orOGBI
         OmnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJHPZzi2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-225c6c13d41sor80971665ad.15.2025.03.17.21.51.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJHPZzi2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273493; x=1742878293; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu9103r8oTjAUXk/0jU4XMC8f8kUJ8IRY2kEKbMxwAQ=;
        b=UJHPZzi25/RNnLIj8dy82wF59FZY/c6n1YEDE4Q4JHJAr6OfHYMfvUJwZ7nUjDWLVM
         2sqmwfUN5I6PrKAYUVCTMJdx1eeuUoJ//zlVCrY/MGl1455SjAgHSuWM7Jt500lIjPjj
         k2HhaQu+b5TfVaU1Ee9jM3lrPz0wvpBkS7tBYvAVYNEtsNv48pcewdEWBhHGl2EME93V
         /lQTMwAbngIKV25vjhHrKOBIQAQw6fmeRh3Dscxq2AoFbItV0hey4XuUyRpMn7a+DvBi
         o7ecBNbNCCKvRM2A+LKg/iuwtJ6YsM5b3gRyjWL+c+7gM3lj/oskjV65yvSEo13zc/Ph
         TAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273493; x=1742878293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zu9103r8oTjAUXk/0jU4XMC8f8kUJ8IRY2kEKbMxwAQ=;
        b=EmeuXDhPLhYIX0OnWVZiBKC8hT9LOis10DyLNJbWDzz7qMlmGvTlE5zOA3HdOaPnNB
         4MqqLBu/fgaVU9JYVZW9Z4dY+Z2yO+A39sd08Q+sADPRTE5QfDEdR7LFIKRFics94OAM
         K8+l3Q5BGYLd8FtmP2chrWA0629rq72Bm9A36QYSBNaNoDSDAiLS1hJyHPDbVYMsbCl2
         BpV3IJEHnYQzfYBHoV+7SltIYSrOjbqFCfLDARNtSsnYDTp6LlJzsSjK3E/zWXH3SVeq
         Unqt+6Y74s+4y20vTcjcTz/MPh4oCgm+GerED1ab/UUJRaRQD6hn/Vu4sl1GWpPWisP3
         LsjA==
X-Forwarded-Encrypted: i=1; AJvYcCUC26CfOnDA3fcg0ayiTywAZK8Mwempmm4ITnUKF38u38T1PqiyrNgowqN+6oyIJrrdcAhuV2uLEtXr4A==@linaro.org
X-Gm-Message-State: AOJu0YweCa9VXJZ8X6lPWsQVHsoyVToCDk3lFL4Ho/yoeYooc0JPPKw1
	xFaabPsoiWQkTG8rmN3TjT30lfT1Bc0Rm/NbeCkZA42eZis0DyDJJwYEKhhGvMhcGw==
X-Gm-Gg: ASbGnctvR8x3dbCUGk5qCMh+TeMUbEYWpdMfvqzoEO6IKTKrrXcauJzMw5IhVV5As4i
	l2PH9DQRyF3KeV9utRglIIol7GS3VXvmUh5bsHxcAWjnji3/aO83phwJOG1d0am64uEE0C3qx4P
	g/hHsnnZ3hRlz5IIqjYe9xVSdJf808O8SrVEqMZptj2Cmuqw5Lb0x/EgZ6P9ArtYYa2Cc/bHn9C
	CN2vo4dJSib4049Mb+YExlOqZSR1eOR+21PFjkdmq6FnIG320TSj7cUgqOCCTS/3KjEv1QSxxy0
	XU9o4ZXDz/eZN4OustP+5iX0FAtdYs9rMFI52yqxh8gZUEsOrUjhdDE=
X-Google-Smtp-Source: AGHT+IGjVevdOxVZtllqsOzTh2kSPli9+2FoEMdQ20zfQwf4sZc4Mag5ZWZo6Cn4913jSf5K9IBO+g==
X-Received: by 2002:a17:903:2b0f:b0:224:194c:6942 with SMTP id d9443c01a7336-225e0aee904mr229423185ad.34.1742273493096;
        Mon, 17 Mar 2025 21:51:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:32 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 00/13] single-binary: start make hw/arm/ common (boot.c)
Date: Mon, 17 Mar 2025 21:51:12 -0700
Message-Id: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UcgsMotwjb+G

This series focuses on removing compilation units duplication in hw/arm. We
start with this architecture because it should not be too hard to transform it,
and should give us some good hints on the difficulties we'll meet later.

We first start by making changes in global headers to be able to not rely on
specific target defines. We then focus on removing those defines from
target/arm/cpu.h.

From there, we modify build system to create a new hw common library (per base
architecture, "arm" in this case), instead of compiling the same files for every
target.

Finally, we can declare hw/arm/boot.c common as a first step for this subsystem.

This series needs to be applied on top of
https://lore.kernel.org/qemu-devel/20250317183417.285700-19-pierrick.bouvier@linaro.org/
to compile.

Pierrick Bouvier (13):
  exec/cpu-all: restrict BSWAP_NEEDED to target specific code
  exec/cpu-all: restrict compile time assert to target specific code
  exec/target_page: runtime defintion for TARGET_PAGE_BITS_MIN
  exec/cpu-all: allow to include specific cpu
  target/arm/cpu: move KVM_HAVE_MCE_INJECTION to kvm-all.c file directly
  exec/poison: KVM_HAVE_MCE_INJECTION can now be poisoned
  target/arm/cpu: always define kvm related registers
  target/arm/cpu: flags2 is always uint64_t
  target/arm/cpu: define ARM_MAX_VQ once for aarch32 and aarch64
  target/arm/cpu: define same set of registers for aarch32 and aarch64
  target/arm/cpu: remove inline stubs for aarch32 emulation
  meson: add common hw files
  hw/arm/boot: make compilation unit hw common

 meson.build                | 36 +++++++++++++++++++++++++++++++++++-
 include/exec/cpu-all.h     | 12 ++++++++++--
 include/exec/poison.h      |  2 ++
 include/exec/target_page.h |  3 +++
 include/system/kvm.h       |  2 --
 target/arm/cpu.h           | 28 +++-------------------------
 accel/kvm/kvm-all.c        |  4 ++++
 hw/arm/boot.c              |  1 +
 target/arm/helper.c        |  6 ++++++
 target/arm/tcg/hflags.c    |  4 ++--
 hw/arm/meson.build         |  5 ++++-
 11 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.39.5
