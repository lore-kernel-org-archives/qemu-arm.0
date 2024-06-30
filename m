Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004253njm;
        Sun, 30 Jun 2024 12:00:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVO8myOhxumBeHkiPJtt23Pph2eyfy/hRy2fMqPagQnzv6tMO33XPBneH5mxQAO0riFpJdOP6XsJ5cvcgnFyKBvfkxpMeCk
X-Received: by 2002:a05:6a00:4b13:b0:705:cc7d:ab7d with SMTP id d2e1a72fcca58-70851875908mr13598407b3a.5.1719774053673;
        Sun, 30 Jun 2024 12:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774053; cv=none;
        d=google.com; s=arc-20160816;
        b=V0e+PBQPtu+hsQwchITJzmO3OV0NdryMXQUEhZtmCs9ZL9ONdFAcDD1DnYRz0a2R/C
         U9PHF1uqcdegYrVOn/A951D/6XuxSSzZewdNPUPo13xWalA7zLbU4p+VrTWWTBZ41w1h
         eaHzri6161ebN2hxnmzh0Sd9unNlHo06Nn05bGFw007E3NH4bH/AfnvmMN27r61rF5jG
         uHEgx5W7vK51SbTM+MWd8e/CNC6kqvwL5fIVSTcBhaQur7K28VmO3dYcuFwOdOhXOc4A
         haj/uMfGDfXX/KrnAI/KALNnp9gkDx8l+cjgqj76UySUi4O5N3W/uEi5QRO8sRZB0rBI
         so/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=gXcD6RKAlC5/aI6jjanCPGZJp69fMWK17rMgS0+fr4A=;
        fh=CIV6f2xprY20TA1jn2heI3TtAR/fhfVRdsvQbQV45NA=;
        b=NZwBT0i9mmtLgPh5thUY52rB+DN96kj9JDQk+yyTDsa2jjOwgDtDkrKEs1J79FtP1G
         SK8w0y9d6pVlkrbw+/QbxSnVwakQl2bHLlII6Fh/xbBVmOxdEGhCI/MWB7qQccD15vI0
         oLt1KRjLV0dGrZByVf06zkeGTMyf6BIpLBjHKXbAjbGjE9kgQLIhQymiDofIo2lqZ00w
         9mwI5/d2mWgSYnCN7bzfzDTcerd+5phmXkR9gg89JnoyVr6TTqukNK/Whrh7GxZz1ist
         lARULnxvqvobj5gCgG5CdeXjv318B2JCSyGiH/6y9eOCbCmqXV9GK1wQf8jGxZRmClbn
         FTrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFuL6iV3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7401e751e0dsor714788a12.2.2024.06.30.12.00.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFuL6iV3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774052; x=1720378852; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXcD6RKAlC5/aI6jjanCPGZJp69fMWK17rMgS0+fr4A=;
        b=XFuL6iV3rbWEe31w9DlU0Xx+v5Tf1t+5UujXxkrUBLYztEWXSDUQ7ENkv6Ieuj8s1S
         PDCny+nJ5291lQTnnKhmLmwjzdLWW9TG10FJyd3dGE23EzS5KmemJujjdaqZ76g+8Quv
         JQ1VuDwntshnME+SEsG/974SMINt53jo3AjYPdkiOyhDhntyBGG7MeWPaRvZpmcul8IO
         CTWDCL7R6wOFW1AFOUmeyU5iuAPSdU0u1S1uj5OZUu8Xgi6OcLwuMluveFj6xUcMdcMx
         VAQS5sDGjSB+dgV1tF8I3dhvydf7UbZ2xdvcFXGQwiMPTIDcJd8t+0R/pJ0fhCaDIB/x
         WDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774052; x=1720378852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXcD6RKAlC5/aI6jjanCPGZJp69fMWK17rMgS0+fr4A=;
        b=KwHwZxS+vYYpO5q+bFQthhDibL6qBM+Ind365SrpYsALYYLBNDLyxhl1pMjUsvznjQ
         q7rvxEd/MCFksXbKLAa0W2GnQs7zf3SAKUqHBe7tvWbxUyd1zEeGvSTQOI383mAibo2v
         LIET/y4auVOlYKJKPmTu6/+TQUEhQlpQnLOb8zDepUkymyT0yiPAnic5xInuufKwfEA3
         dutvamNdKH/FZ/kcWiQ0hf+iZ68IJQN39ap//3YwBczd6QdEbu3aSXHhdejKMkwlf+HI
         gYQMmCio6v+w8/gto4Bq2yZAhOHNv2zZH06xhVk6tqGKEQqVtH4geVkEaOJWrJBF2Ztb
         rykw==
X-Forwarded-Encrypted: i=1; AJvYcCWx7IMpb/4FHKlY7ylnZJ+ug4NQ68AVHPuvCywseZVEay8veYyLkHVU4xBrU13rcUckV3zMLRNT6pMVxODfYZL6D+ZHEJP0
X-Gm-Message-State: AOJu0YwmdbnbxD/6b/FJ3QcDX2uBWHRESpz98M9muw6mu/HMwJ54aasq
	3Zh6g6p/cebRTakgNWh56TZM3LPDDlgQldozXJpvq2+0yQ8SOoRjYW8sQSjV2pVO9NwutxTWJzh
	WuTI=
X-Google-Smtp-Source: AGHT+IEthC5QVyTQ/7eOjF+4TvYgEyOu4GkrGIj5ryErsBROvoy85muTbR5y4LjwT8Kvyg42VNtEIQ==
X-Received: by 2002:a17:90a:da01:b0:2c8:2236:e2c3 with SMTP id 98e67ed59e1d1-2c92804d09dmr10735280a91.17.1719774051859;
        Sun, 30 Jun 2024 12:00:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 00/14] test/tcg: Clang build fixes for arm/aarch64
Date: Sun, 30 Jun 2024 12:00:36 -0700
Message-Id: <20240630190050.160642-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pQBgOkOHxT5c

Supercedes: 20240629-tcg-v3-0-fa57918bdf09@daynix.com
("[PATCH v3 0/7] tests/tcg/aarch64: Fix inline assemblies for clang")

On top of Akihiko's patches for aarch64, additional changes are
required for arm, both as a host and as a guest.


r~


Akihiko Odaki (5):
  tests/tcg/aarch64: Explicitly specify register width
  tests/tcg/aarch64: Fix irg operand type
  tests/tcg/aarch64: Do not use x constraint
  tests/tcg/arm: Fix fcvt result messages
  tests/tcg/arm: Manually register allocate half-precision numbers

Richard Henderson (9):
  tests/tcg/minilib: Constify digits in print_num
  tests/tcg: Adjust variable defintion from cc-option
  tests/tcg/aarch64: Drop -fno-tree-loop-distribute-patterns
  tests/tcg/aarch64: Add -fno-integrated-as for sme
  tests/tcg/arm: Drop -N from LDFLAGS
  tests/tcg/arm: Use -fno-integrated-as for test-arm-iwmmxt
  tests/tcg/arm: Use -march and -mfpu for fcvt
  tests/tcg/arm: Use vmrs/vmsr instead of mcr/mrc
  linux-user/main: Suppress out-of-range comparison warning for clang

 linux-user/main.c                         |   1 +
 tests/tcg/aarch64/bti-1.c                 |   6 +-
 tests/tcg/aarch64/bti-3.c                 |   6 +-
 tests/tcg/aarch64/mte-1.c                 |   2 +-
 tests/tcg/arm/fcvt.c                      |  28 +-
 tests/tcg/minilib/printf.c                |   2 +-
 tests/tcg/Makefile.target                 |   2 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   4 +-
 tests/tcg/aarch64/Makefile.target         |  18 +-
 tests/tcg/aarch64/fcvt.ref                | 604 +++++++++++-----------
 tests/tcg/arm/Makefile.softmmu-target     |   4 +-
 tests/tcg/arm/Makefile.target             |  12 +-
 tests/tcg/arm/fcvt.ref                    | 604 +++++++++++-----------
 13 files changed, 653 insertions(+), 640 deletions(-)

-- 
2.34.1
