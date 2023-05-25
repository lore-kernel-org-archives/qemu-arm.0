Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788181ejb;
        Thu, 25 May 2023 16:27:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5llwhpuFK2IhD9/j8BrRxMXohIMQIzneln0MMW8LbRAeBTypwFr9Wed1vYsaduiaCm8lFF
X-Received: by 2002:a05:622a:130a:b0:3f5:434c:3506 with SMTP id v10-20020a05622a130a00b003f5434c3506mr142777qtk.11.1685057250441;
        Thu, 25 May 2023 16:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057250; cv=none;
        d=google.com; s=arc-20160816;
        b=qTc/zVbTSzZlSZwNTNcICnpyK+mngZsvX0xaNt23i31k9rCPkS5PP0rT3RKeWy5229
         vWyhRK1y8/tnNHIuusXmxPlYdEY+UXYyyEao6WuKG9fckHVa7NywgsTzHLsn6D359nZj
         ocBWNriQ3ek/AdsTlg0H0rV+MuUEGEOhkH6RahWPXzL8HJT857X39+dPCB44IsJHVnLG
         oQPKvPXNpBeSgsoC0qnqCRavkYqp0saEUqqlHmDCqmn6K8SI0HlmWkS8nEoOVCavcLl3
         ITAARRHba3ej2+2awss1jpDen5aoi/kNZFstZl3aU09Uw3l6xeI9eVDEz2owr9mLQbg6
         NVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ahaAtzWW51KvgGV6JaCQ4D8Qa6DKgj6D9JTYPTGz5GE=;
        b=DUVocqClhHnU+f2jhEiBgeb4Kz3Wt1AFcoYvVqntD0/QqshrraOOkyuMqHKfl+GiWG
         9n3p7dMRKv3nCct5w9eE5fwMW0qspPUTizFGs2bNvarZ58YjtW5tygW+wjgeUvE4ajOp
         2ED7VGcThdsGjENyEZbDmAu0rZHeOIUTiIm12GXtqvMfudpLe0fosMalC4SI5a+QwCcu
         mwyTtWzZVERarysc6fiaQTvRYaWEK3W0rugkvd/OBjDBEzcmmP9IP1md4Vig4uwtdlE8
         BIFCZNqrNR/iMqs5u1YG3lMmzKOaO2lCZbMEHcNI/VR9IFZ8ukK2Sm2jYCiaOfTEAW71
         zLwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqK6g7s7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020a05622a149400b003ec48dc4622si903665qtx.673.2023.05.25.16.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqK6g7s7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q2KLV-0005ms-OF; Thu, 25 May 2023 19:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLO-0005m9-Sn
 for qemu-devel@nongnu.org; Thu, 25 May 2023 19:26:06 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLJ-0005kd-Q0
 for qemu-devel@nongnu.org; Thu, 25 May 2023 19:26:06 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ae875bf125so924535ad.1
 for <qemu-devel@nongnu.org>; Thu, 25 May 2023 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057160; x=1687649160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ahaAtzWW51KvgGV6JaCQ4D8Qa6DKgj6D9JTYPTGz5GE=;
 b=pqK6g7s7kqQ7PHwwEn4L7Zx4PvK/XwpN1uQxybLSFmZSlN+0H3hhTGuYSBdmoMUscc
 RWoFqlfOxzZIaIi91cMvWapvHFvngGreI/e889mT/nzI2mliD9QyEWfibsnGI71s1k9O
 yYsqQGKWYbS+3Fp2ENg0o7CUi0q6KA5aTBnEm4mgz9GijCc4iuANAOGRLYjkN+YCey69
 voKHj2qS1bOUJRyjkN1+i79g8IPND+ViSNOk+zU5Djl/eywXYXdaZqVixAW4ADwD+ghO
 ExOHr6LRmSyzJuxc8CGgouSJ0Ok/aeIMdLWtrfDT+E8kraY5nwCPM+hjk2ArcgkmWeYy
 AgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057160; x=1687649160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ahaAtzWW51KvgGV6JaCQ4D8Qa6DKgj6D9JTYPTGz5GE=;
 b=EamNdgkcc3S9i2lDao9r8wpdlQXxxA+ckrHZr8jZ+obROFTfLrpKYJbDso7h0oKFyh
 qhRZf1OmK7FJsQP02ekU4HBNnkHLHCk97ouABcGwW9qROh4CYGeqQnIp+ILczvaP67/e
 GiUM0Hwk6KiSq9hVtW3cInBary2CMRpMSCTKNdW8o2r2OLKV6mIms9bDTzZJ+cH54/+g
 5Gqv//YxIoKwQoF9+LvUgY4VbnXsL51wUWDMwZUM/JEB0MTDL6LhGC3Iyc0+aDnvaXMK
 WZVF3/Mdp1XVjJoumczBcO3C91kSimQo6zYVihDPSHk7HF6quv33+iNNFI5Er9xjLDS6
 OROA==
X-Gm-Message-State: AC+VfDx99zCYBJTVp/lFb2myswLCVh6By5S19VrPronBmn88ITX+VWSe
 mHCsT9q3neeauhYpnYFEuq4kC/jiU4mwry1/0EI=
X-Received: by 2002:a17:902:be14:b0:1a6:ff51:270 with SMTP id
 r20-20020a170902be1400b001a6ff510270mr374940pls.29.1685057159622; 
 Thu, 25 May 2023 16:25:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:25:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/20] target/arm: Implement FEAT_LSE2
Date: Thu, 25 May 2023 16:25:38 -0700
Message-Id: <20230525232558.1758967-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qQ/8jBknwquk

v1: https://patchew.org/QEMU/20230216030854.1212208-1-richard.henderson@linaro.org/

All prerequisites are upstream.  There are still outstanding patches
to improve the atomic16 support, but those are all optimizations.

Patches needing r-b:
  01-target-arm-Add-commentary-for-CPUARMState.exclusi.patch
  03-target-arm-Introduce-finalize_memop_-atom-pair.patch
  04-target-arm-Use-tcg_gen_qemu_ld_i128-for-LDXP.patch
  05-target-arm-Use-tcg_gen_qemu_-st-ld-_i128-for-do_f.patch
  16-target-arm-Relax-ordered-atomic-alignment-checks-.patch
  18-tests-tcg-aarch64-Use-stz2g-in-mte-7.c.patch


r~


Richard Henderson (20):
  target/arm: Add commentary for CPUARMState.exclusive_high
  target/arm: Add feature test for FEAT_LSE2
  target/arm: Introduce finalize_memop_{atom,pair}
  target/arm: Use tcg_gen_qemu_ld_i128 for LDXP
  target/arm: Use tcg_gen_qemu_{st,ld}_i128 for do_fp_{st,ld}
  target/arm: Use tcg_gen_qemu_st_i128 for STZG, STZ2G
  target/arm: Use tcg_gen_qemu_{ld,st}_i128 in gen_sve_{ld,st}r
  target/arm: Sink gen_mte_check1 into load/store_exclusive
  target/arm: Load/store integer pair with one tcg operation
  target/arm: Hoist finalize_memop out of do_gpr_{ld,st}
  target/arm: Hoist finalize_memop out of do_fp_{ld,st}
  target/arm: Pass memop to gen_mte_check1*
  target/arm: Pass single_memop to gen_mte_checkN
  target/arm: Check alignment in helper_mte_check
  target/arm: Add SCTLR.nAA to TBFLAG_A64
  target/arm: Relax ordered/atomic alignment checks for LSE2
  target/arm: Move mte check for store-exclusive
  tests/tcg/aarch64: Use stz2g in mte-7.c
  tests/tcg/multiarch: Adjust sigbus.c
  target/arm: Enable FEAT_LSE2 for -cpu max

 docs/system/arm/emulation.rst  |   1 +
 target/arm/cpu.h               |  15 +-
 target/arm/internals.h         |   3 +-
 target/arm/tcg/helper-a64.h    |   3 +
 target/arm/tcg/translate-a64.h |   4 +-
 target/arm/tcg/translate.h     |  65 ++++-
 target/arm/tcg/cpu64.c         |   1 +
 target/arm/tcg/helper-a64.c    |   7 +
 target/arm/tcg/hflags.c        |   6 +
 target/arm/tcg/mte_helper.c    |  18 ++
 target/arm/tcg/translate-a64.c | 477 ++++++++++++++++++++++-----------
 target/arm/tcg/translate-sve.c | 106 +++++---
 target/arm/tcg/translate.c     |   1 +
 tests/tcg/aarch64/mte-7.c      |   3 +-
 tests/tcg/multiarch/sigbus.c   |  13 +-
 15 files changed, 522 insertions(+), 201 deletions(-)

-- 
2.34.1

