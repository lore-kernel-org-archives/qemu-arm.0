Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287640lfk;
        Wed, 9 Feb 2022 20:04:33 -0800 (PST)
X-Received: by 2002:a17:903:300d:: with SMTP id o13mr5486932pla.27.1644465873465;
        Wed, 09 Feb 2022 20:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465873; cv=none;
        d=google.com; s=arc-20160816;
        b=iKOdB6F+coWA1mwHovwTTGi83YOtTDlCteV0EpmObk7A1kOqoGVfMuAYowjtGzYJFQ
         IJRe1WoG4L4oHtCdGEzD3MSQ5CDoSQqwfHuI87tKzm/JpdZNt8DCFKW8RvVhFKE1TDq0
         qhib0hA92pO16W+jBnRBV8sKWtgj1xSYOVE7Nn+7F+LOI2P6fAyMOlQAGwOPSCquoxI/
         +O/vGw4g1lW/72EQ1ogcG/CjqPm3OPvQIpU9LgiXzoRafR0jqDSQTKVyBkQA4kKQNGBe
         PfkmytoQ2gVbYtubmYRlHyb9MvRLeCj5xKb+Etxxj+KF3k8B42J6dSVVz2U+p8/xajt2
         eQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=JBv8QVPyT6gYycDLYC5k+pqAGDzqvUkpcUy2Ood6pn8=;
        b=0qrTQXB8PMBYNEqvBQrRqdfRufYY6Q7unuffkC0QAB0uMYaPjPHjzf/7KtefReXTQ4
         KwbqG8zOHQuL2t/qYyGd91RpEsyGHXhINo99Hmn7KZogmdyF+XKQsO3Ww56PwVynH+ze
         lc3UvT9WST2DncBVtzWAAZtx8bgliQESg2OBRXIzS8WzFYqALlOLzuN1BgoUTQ4xtgrw
         QpKuyJMAfylVLiczzPZbqyD06Xrbks4NKGxalgLJUUt6VHnThMQ8P5A41OD+NGL4tAf9
         +622C8OfAmYMZ7vt+4XYwPWI0oNnSCQ2NTwHe+GDepKWBk/2PHc+UymwbkW06j0DR1hz
         IRwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pzwKf2zc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 140sor233938pga.60.2022.02.09.20.04.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pzwKf2zc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JBv8QVPyT6gYycDLYC5k+pqAGDzqvUkpcUy2Ood6pn8=;
        b=pzwKf2zck0ziE0CNJKVWDiLQRCdqeDoJRIA+mEhoOq7We2iirlHJABaRtxBkXIYP5Q
         dr7XBMlx6MBgHxqLzN8XXX6vcS6yGOPDcEyx1e+gFaYD4/3o5DsusM3wEb0RiDmoFw5x
         nkeUgoo/nvCD/hUKLEsASPdahqOsVGGW5rNtDs5/35fX04Ya3QQOuW7LALbaE9n4A6FP
         ajLCrug4BS2M0a5+RZZZnBZ06GjhgA5CHSCDFyapWkkAFZTsfiikAkXv207dGPKGBxO/
         ykz8iMzQvHhOjwP/kzCvwWva6Tv6bjsNKBg0+Vh5/kQErOjPgOgHPzM4EApE7V63CFKf
         j1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JBv8QVPyT6gYycDLYC5k+pqAGDzqvUkpcUy2Ood6pn8=;
        b=sUYcjmuKEuscsvcuc+zi2SHnVV5eky/lfupHG/jDhjzrwpOwpJ/A/bMXf2W9zpCVlw
         dd7OAmhSwZQHhQ0ZXLHuysncp2tHBn2WrK51WcoiD17i9V9esob82tRFQjP4swjSom2g
         xUVjZNIOh92yznvHBP0AI/plQHji8rhRi0uqP4FQBAlyymC0ObLPaTUk4ZPBj8CmbRKj
         UCg0b2XoWBbeF2pR6P5BWxh0dMHQU5givSxAV6UdtIOYmPPfdDOZkLDLfkAIRCjHAm1T
         PHUzmcy8vFS7Doz9kpfaUZXqTUALqfVlJYNr0s2cbJ04yapdeC0+29X0M8RBKYqIhjm8
         RJhQ==
X-Gm-Message-State: AOAM533bVpTEbyR9S7a/dCNPKPsI++YCPNbqupta/btxhKH0Lv/ngiFh
	Z59Gxdm7WUv1pQETU9tLQmeycZaI
X-Google-Smtp-Source: ABdhPJy3IK6l5Ey5uGUCNTyNXqXYOSq3is/yqxM6s/cKqHXsu0WGei8AWanRjyL8Ofiwg5MJrbGdZw==
X-Received: by 2002:a63:8942:: with SMTP id v63mr4631816pgd.222.1644465872899;
        Wed, 09 Feb 2022 20:04:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Date: Thu, 10 Feb 2022 15:04:08 +1100
Message-Id: <20220210040423.95120-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3JTbcllkEJpY

Changes for v2:
  * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
  * Set TCR_EL1 more completely for user-only.
  * Continue to bound tsz within aa64_va_parameters;
    provide an out-of-bound indicator for raising AddressSize fault.
  * Split IPS patch.
  * Fix debug registers for LVA.
  * Fix long-format fsc for LPA2.
  * Fix TLBI page shift.
  * Validate TLBI granule vs TCR granule.

Not done:
  * Validate translation levels which accept blocks.

There is still no upstream kernel support for FEAT_LPA2,
so that is essentially untested.


r~


Richard Henderson (15):
  hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
  target/arm: Set TCR_EL1.TSZ for user-only
  target/arm: Fault on invalid TCR_ELx.TxSZ
  target/arm: Move arm_pamax out of line
  target/arm: Pass outputsize down to check_s2_mmu_setup
  target/arm: Use MAKE_64BIT_MASK to compute indexmask
  target/arm: Honor TCR_ELx.{I}PS
  target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
  target/arm: Implement FEAT_LVA
  target/arm: Implement FEAT_LPA
  target/arm: Extend arm_fi_to_lfsc to level -1
  target/arm: Introduce tlbi_aa64_get_range
  target/arm: Fix TLBIRange.base for 16k and 64k pages
  target/arm: Validate tlbi TG matches translation granule in use
  target/arm: Implement FEAT_LPA2

 include/hw/registerfields.h |  48 +++++-
 target/arm/cpu-param.h      |   4 +-
 target/arm/cpu.h            |  27 +++
 target/arm/internals.h      |  58 ++++---
 target/arm/cpu.c            |   3 +-
 target/arm/cpu64.c          |   7 +-
 target/arm/helper.c         | 332 ++++++++++++++++++++++++++++--------
 7 files changed, 378 insertions(+), 101 deletions(-)

-- 
2.25.1
