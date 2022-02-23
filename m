X-Received: by 2002:a63:e543:0:b0:373:efe3:6f46 with SMTP id z3-20020a63e543000000b00373efe36f46mr1395706pgj.183.1645655500896;
        Wed, 23 Feb 2022 14:31:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655500; cv=none;
        d=google.com; s=arc-20160816;
        b=SwEjVs148BBGx0bbDFosC28WUJ3/AlXvx96O81PvotBfdzJL9Azz4elC4UZwVrgsnx
         uSGsmgXy26fqKgIHI5K9csHtNW1mJVkFzhKvyvmvFhMbWL8Thqr2geQtuhCIGsk9ZIas
         Smf83A27yjW+Bc9HzJU75lCRYeHCKpZ5YBVGXelPdid7mZMNVmHFsPJcHgHMLbJfqYBQ
         D0SCVSMHPA8uBst4GhGuMDoQgDgncsfYt5Hki75MUosZ99cb0+mzote+lSZ5gX2RUVFS
         xxfCQu3MfGJ5OShWLr5MC+Zx02GJNpDTqrR01xjIGxSrzBMetM2dTj/4mWRis6dv1LW4
         TwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=rchUU4zOX0BPe/9YEpHNPbaJ9WTLO7q01iqF+jngknc=;
        b=gUQwxEeWNZzFxETf+e4D6r8rYRMOBZCNAFcih/Po8mSjckKS+TUG2mGQKr9pxhFlb6
         KZgSNu36dJEiMPJ3+RHiDZoEvH9sKLD6RQl3EZQzXB7IevfDT/tXABRGKiLF5YaIe22W
         IAj8tQ86GBDhPz9qZabrNODLHV3zFRiYaWrpLjTfMcuhkvWylrzWPFPiPnc021OJxHUq
         q8ODV5VDqdAZ4wNxLb+a76XhD033a+LuFv1HmpABsft3RYQ4dy56Ge3XqYS+qjBszH7w
         z/hqohvoiwgTmAzVqw81cv5CAQzsylgpHwMZ+J3k5MS3TrmVhxuAcHjE9FbO5s0x9wlU
         Ce/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sr84YBsS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 133sor586333pfw.72.2022.02.23.14.31.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:40 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sr84YBsS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rchUU4zOX0BPe/9YEpHNPbaJ9WTLO7q01iqF+jngknc=;
        b=sr84YBsS3UhI193reYUNlrpbz1BB3SE0Uio3w14BppvEDCj5d1bPawlf/wh2wKQfFl
         9h2BrihJAxylrkfOCbLOibgU0zJoTQToZ66fkISS9misUsnxc/RrxCtXw7e08spg17GJ
         Q95q5/eHVCi0iOnw9iDRNpQ+boVRxLRKU587gzyDO2NWZqR1K2KIAJdkQ1jrj8BkXqtL
         stk+rm/3JMQSQjWo04tSPgEcJsizc2aV1mQnlmnlOVnWozzNuMpmEtsmnmPCjIhU3k49
         AmdfSixKPZg/AMiFHnfUsj1rAr+UZmkZ3O70L/VSFkJvsD/TBDw9NwrsOUJ3liFuZ2mV
         Z3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rchUU4zOX0BPe/9YEpHNPbaJ9WTLO7q01iqF+jngknc=;
        b=JTHakk6WkUepcrw71VrcJqCQbu7CyZNO0n5kSku01/6VdOXbsbnfQpfgHTNIyN6l3A
         kXFfBegL878VHsp0YptsZL9VdiYIgMGrz2pmmIJVX6j76wA8a/UCA3SGDhG4/G3DCxUS
         qX1j0Jyis1FqF8JRs3VULL7Ywt8x93llhhtT+MAehz9ujbwHsC5Xpc5PdtykHN68uV5x
         ZPKR7EUM1ZRVYYWcmafwVarRPWDFfb4r1xi/6Expf63uVz1vsWQmf7QJtanw53FV2PF4
         F5rfXUCnyaiqJpkMlTr1kJ+JyDSoL3RX6XluLZ7vtSEbcgXzBJeX2jX4wtjMFINaTCEQ
         RxcA==
X-Gm-Message-State: AOAM530pUMikPFSFaZobnu/hV4s3Ws3fwEmOjBgMVZcHKwpTsEQQoJvr
	MEryALhTfaR2vBwvI0u+SqpnLxfl
X-Google-Smtp-Source: ABdhPJxJ7JSuqO8yDmIZuHMWOwO70U0ClbEVxPLemGmKSnV6c9daLtqo+FI/zOdsr3Mj1u+0yMFSvA==
X-Received: by 2002:a62:7ad5:0:b0:4e1:5bda:823b with SMTP id v204-20020a627ad5000000b004e15bda823bmr1786609pfc.75.1645655500355;
        Wed, 23 Feb 2022 14:31:40 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
Date: Wed, 23 Feb 2022 12:31:20 -1000
Message-Id: <20220223223137.114264-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FySA+GeECWpI

Changes for v3:
  * Update emulation.rst.
  * Split out separate update to ID_AA64MMFR0.
  * Hack for avocado.

If the avocado hack isn't acceptable, perhaps just drop the
last two patches for now?


r~


Richard Henderson (17):
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
  target/arm: Advertise all page sizes for -cpu max
  tests/avocado: Limit test_virt_tcg_gicv[23] to cortex-a72
  target/arm: Implement FEAT_LPA2

 docs/system/arm/emulation.rst |   3 +
 include/hw/registerfields.h   |  48 ++++-
 target/arm/cpu-param.h        |   4 +-
 target/arm/cpu.h              |  27 +++
 target/arm/internals.h        |  58 +++---
 target/arm/cpu.c              |   3 +-
 target/arm/cpu64.c            |   8 +-
 target/arm/helper.c           | 332 ++++++++++++++++++++++++++--------
 tests/avocado/boot_linux.py   |   4 +-
 9 files changed, 384 insertions(+), 103 deletions(-)

-- 
2.25.1
