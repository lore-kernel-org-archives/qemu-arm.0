Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086783njd;
        Fri, 4 Apr 2025 15:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkL8KTpg2XvM9kNZIPnMIlmHPXbVstS51hw7BLRZ8kd8KDcexc8mPgynmMYEN2IjQJVCXthixYGHshuw==@linaro.org
X-Received: by 2002:a05:600c:1f17:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43eced66978mr47421765e9.1.1743806126225;
        Fri, 04 Apr 2025 15:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806126; cv=none;
        d=google.com; s=arc-20240605;
        b=Hb51YIXBHu+p24ikth9kvF63+pRYuG6XgkNGlKznYlvACek0ZqDhFqJwxhlCE+zAh4
         TnZ3lAfEs5JvH4c1/aahd4C4hFqYw88wwBz6CCL+OW5r4RSqsqo7QrQ/amxyIVWnsaSE
         wmovQffWf8Dqqe3GbhhGwhkwylwRJUI6TDGN8VZbHj12rb1w/8fEAPcgq/05mFSWKCz4
         pB2+fZVRdMm/tQ79u0bY2kC18fO4bEnqNklG9p6cxLp17n8iaAovtJYXdxyVlZOQBbxU
         66jeWYPa64s1v9bLozKBz2JU1bxbRrtybCkEfyghlg9Ij98wyR5j3llDSyAbjYlXq5z5
         Kz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=9ViK4onZQCmZHc18fMKix+clvnP/93dzPnAUQK4f1Vg=;
        fh=5zbMYCPddPsI0BL8ZtKnmkyOdETaC2pf79QmgT8abdw=;
        b=eAhZexs/oDjf8857AkdIewacnaI/lgM0OJB8I2yXHnSzFxl7+HiUG6uUAwwOy8boQo
         jnZ+E/eA1h6cOTjXGksxzWPDFXnDSBxGb2sj3Gffg9Dj67nU+3l1+5pwOwhVdy5GuDIz
         RVo8O6B4CfVcrYiBYJPKqRsNI9VFkEXj8Q0JNVFQNY4wxEHkm5n+GbvIDNzirSSv8K4L
         WiglXLgT5oppmiX5u/N93uoCG4h3cYRzT0+1wqAPbQ1OmQcwRorg44RNzs8kjAKfS9BP
         TrUEF6jVanV25hadM9OoQlJUU7j14Kb4h7s6fhd74yp/NeffeP8pqMAQqgegtpCgd+HF
         O+tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJNLI+Lg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec1fd3a93sor14090655e9.0.2025.04.04.15.35.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJNLI+Lg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806126; x=1744410926; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ViK4onZQCmZHc18fMKix+clvnP/93dzPnAUQK4f1Vg=;
        b=oJNLI+Lg3U02V97BAbf0YF6foDIifhue5kyPahiqRL+Bvfq3r8d2iLCI9+AjDYgt0j
         F0xdqvtQgLhzDvzVMhzXbldFUMr5LAxQTncJ/j1iWF0t87i6yQXiDVdhVGwxm/SQjvb2
         QYQYD90fRgx9C3f0diX505xPsNldu/hWMJCGgVo8Wp9J49EAmSd/s53z8sLP8Vz5qgzY
         EwwJDX5VrDWR377qJBaVPnbWQ+GNOd/HqX9eknzQugBhQMqLWnh9s58AiRL11/lARkMw
         clxQ7/BFklN9hzN/kO8GqOAgkXWnrz8X2GRBxCeLcxeebzJxqBW4oKZVdzxJM3yuNA5L
         +usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806126; x=1744410926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ViK4onZQCmZHc18fMKix+clvnP/93dzPnAUQK4f1Vg=;
        b=Ty6GxEchIudC5PVeCHgxBuqV1RIa4Xf3IQxqbbqnxl9I3c72APFlYFBT/s+ztMjF3j
         t8N9Hx9J4gHbHvyUiyp1btlCBJ0fzuSBIsXIDRe5A+dQpRf3lmEjS/ZoD0YvEOmCbjyz
         1v1BTq2rF7x+OyAZrsYnqrYtBVje0ZwwEpylJ4kJbhlivnpbJVnCPFEPAXHSXfKTF6yG
         LsPMt7Vp3jcz3IDKt44ev1g5IhflIjmlhVot8kqbkwEM+XYX2fNiUulv2CTBD9aShk3h
         JaD6tokiejMOtChxw69Gmn/+zTOaSVfiqW4NnqcUV700vFeDOxeOlgveBT/kOC3KLPIJ
         2rrg==
X-Forwarded-Encrypted: i=1; AJvYcCUWS/v3vs0Ry3F1bEMBEEkSsVI3oBhiAg1bGIpze9zdiSRNy6eQjkwKCzZh9/JhKMd/zu81sXRt9qarHg==@linaro.org
X-Gm-Message-State: AOJu0Ywq3u0mm5xwpv9bZfSUVCLo3wA8Ng5yXS4ltKUJquqDJSliN4Ig
	yRVysPSR4MUhrYiEucoqmYDfXaoRItLtAIf/iPOu3tY0NOXpSMEVBo8yO2YKlVidAQ==
X-Gm-Gg: ASbGnctELlJJURVUwVjzZ49vPBK6U8mnngd/vgaK9ydDYrCHOA0BvDWlXdXml+e1Jc1
	gco757vAjzpS1tB7IWLyAIBXsj8rwwxdhIijhqbW8qSTPRWz/292GWrpR9QG9vuCpDsL2fGPB4A
	FyzBrRWt8PlMCIJj18OtzY3bRT4ZLy9aM+SZpyJNdeuYMzUKn6eVVP3c/69meChss6FVPRlcmcF
	7/O+27ORpng6eg6jTXLDJ+buF/0FlNbGeRWRaPOHL4yueQ0yHR0wT7k6Ubv1J429tCv/V0NGkku
	Ihmej8tld9Eoso6WZrBhKZOlMGjKDp3A6RAUs8wlqopJMy1IMA1mjSlJS2gtm1xAUmi1+/QcuoM
	sU+sD0O/z7fQl/GTcS0Xjc2Yg
X-Google-Smtp-Source: AGHT+IHbAFWFP8e5EsIoqgZmrTyEv0bn34fIjqh+KBs+DikDmpn17MjqKM6As6B0Dj6J3tRoubln9Q==
X-Received: by 2002:a7b:c398:0:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-43ebef8f615mr76695675e9.11.1743806124624;
        Fri, 04 Apr 2025 15:35:24 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm59985425e9.9.2025.04.04.15.35.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 0/9] target/arm: Remove some TARGET_AARCH64 uses (MTE & gdbstub)
Date: Sat,  5 Apr 2025 00:35:12 +0200
Message-ID: <20250404223521.38781-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: jJH9xMkEpTYO

We'd like to reduce the use on TARGET_$arch definitions.
This series convert few to runtime checks, mostly in
MTE and gdbstub.

Philippe Mathieu-Daudé (9):
  target/arm: Remove uses of TARGET_AARCH64 in arch_dump.c
  target/arm: Remove use of TARGET_AARCH64 in dump.c
  target/arm: Remove use of TARGET_AARCH64 in arm_cpu_initfn()
  target/arm/mte: Include missing headers for GETPC()
  target/arm/mte: Reduce address_with_allocation_tag() scope
  target/arm/mte: Rename 'mte_helper.h' as generic 'mte.h'
  target/arm/mte: Restrict MTE declarations
  linux-user/arm: Implement MTE stubs for 32-bit user emulation
  target/arm: Build Aarch64 gdbstub helpers indistinctly

 linux-user/aarch64/mte_user_helper.h |  27 +---
 linux-user/arm/mte_user_helper.h     |  34 +++++
 target/arm/internals.h               | 128 +-----------------
 target/arm/tcg/mte.h                 | 190 +++++++++++++++++++++++++++
 target/arm/tcg/mte_helper.h          |  66 ----------
 target/arm/tcg/sve_ldst_internal.h   |   1 +
 linux-user/arm/mte_user_helper.c     |  13 ++
 target/arm/arch_dump.c               |   6 -
 target/arm/cpu.c                     |  38 +++---
 target/arm/gdbstub.c                 |   4 -
 target/arm/gdbstub64.c               |   2 +-
 target/arm/tcg/helper-a64.c          |   1 +
 target/arm/tcg/mte.c                 | 175 ++++++++++++++++++++++++
 target/arm/tcg/mte_helper.c          | 170 ++----------------------
 target/arm/tcg/sve_helper.c          |   1 +
 target/arm/tcg/translate-a64.c       |   1 +
 target/arm/tcg/translate-sve.c       |   1 +
 linux-user/arm/meson.build           |   2 +
 target/arm/meson.build               |   2 +-
 target/arm/tcg/meson.build           |   1 +
 20 files changed, 450 insertions(+), 413 deletions(-)
 create mode 100644 linux-user/arm/mte_user_helper.h
 create mode 100644 target/arm/tcg/mte.h
 delete mode 100644 target/arm/tcg/mte_helper.h
 create mode 100644 linux-user/arm/mte_user_helper.c
 create mode 100644 target/arm/tcg/mte.c

-- 
2.47.1
