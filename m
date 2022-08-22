Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp908231ejc;
        Mon, 22 Aug 2022 06:24:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR66GT/lPYm5rcl1PBCVudVvVIV+9CmZjeP9v3IzOclO2Ov0DodC9OJWhQhXhIiDnnXu3chz
X-Received: by 2002:a05:622a:54:b0:343:27f:499f with SMTP id y20-20020a05622a005400b00343027f499fmr14795280qtw.193.1661174663728;
        Mon, 22 Aug 2022 06:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661174663; cv=none;
        d=google.com; s=arc-20160816;
        b=tQVzn+g+nIRbc6AUCvPWedT79qONduiBUEkdGQ1SibsKa49jdHbXgOHO5TCmqb8lCS
         9pKBPq6NkFBQM8FcutmWBAKfvmEAUDdMCmtTwhrkCrjETeCkGKFdnuC7SBxrnlkNkrcA
         fucUh0vN+7kbbL2UstnwxIliAQ/G4TBWbs/R5EnZ0g4b5GmkTXakn5vL0MwjylQ5bC2/
         N0NlzUrHaEVZuGR4Q5p9Itc7zUpkalhEur9CSajAEoUwi71GnL/ln5Y57jEDWf6Sj/8p
         /lHvGIhkcJBnJZtKDnikWbA6SnKA1GerT4OrcyH11H/GoN/gUACFnkGXjR9OBoOS02tL
         QH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pIy10pkV/qSrGBev3njdPMpeM5s94Dv8TShU4GCav8Y=;
        b=qYzfxCM+x4rdXDzSFDbqNDd4vGi1EOIGXRXuGAEQ7IOFBq7/0XxzDrfD8qTU38VDvT
         VPbz08I8qdNaqPjkGn8tU8HVMCxjbZYfK6UvbIPsN9EifAzs8l6sLuRmxtU4/ujKq+EZ
         +gvrQS0hgmSWKBrIrJLGHdfsmRIUs7KnvManqOyraURIILvZW8WncQnTPS9lT1u2ZNob
         z0J3SNQ1KgNf9DqE/1pQgB46cb5hXlNtcgWTVKfMUVgINVyEhh6yAEuWepeQ3Y8TSwhi
         F2F7oTvWnLpRQbl65rZ09SmuWWXz8a+mi+6kHPRBzqrhLr1ceijbA01NU54bW40kBcl3
         JQzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nCVRTB0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bw13-20020a05622a098d00b0034307c15e74si4513674qtb.131.2022.08.22.06.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 06:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nCVRTB0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ7Pi-0005qR-UC
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 09:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PQ-0005pO-R7
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PO-0001dR-8Y
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id h24so13201082wrb.8
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pIy10pkV/qSrGBev3njdPMpeM5s94Dv8TShU4GCav8Y=;
 b=nCVRTB0KBrQXAulwcR9D0rvdulg9LloJEko2Bc066/NMOdthG8CysHuXspLvrcodMX
 Yjc3jL7/7VLyZvM7Kf/ydaqqjBeP6QsIOiOnnfgr08/4ar9w4pmypRt4sQvzQLR0dx26
 9Nx9nRwSS9uduLMLSdscX4PRijFetglc/nz4R2QPmNj4LXNidaaX9zGQETRKY417BOPW
 MfXXCVC0exDpSLULBEU8FQR9qey6hbiOb7ZjUgbC8IHtLhSxZXLVbifK6g/iwzzW8oCV
 5EOrzVTXevfM7W8OMetJ8hOHbHBZTmhtQ17Re66/zC1+ageY5PouuIMfcjqwcn3wsA0t
 PtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pIy10pkV/qSrGBev3njdPMpeM5s94Dv8TShU4GCav8Y=;
 b=6nhMe3py/Cl6BGMYsd2iPjHHNee1EnDQFToBxZ9tGpW3158RUBt2G9ZlLdCYJuKtoF
 NlOsvyHRDcoNj6KRjYENLsY7iDRajtjN8Ry6+/gCzihbwDlhz6aJj5EGNM57Fyo0G2J5
 uj13/8JlLQhCRqHfeqMkQuzLNFKnD8ULS2q4k5rZdsxuZcXLYovCUZS5tU8vTI27MPC6
 q/6AMG8pM5RFtIQQNLQkV/+ndgqCzj27uujdXkub1hzTZiHibZVB+KiP2eQQIHcqd/5y
 /c+6rEN4HaROBqqPD/7RX7+XoRta5g6knsQbavmkyJCxr8vIRCVoT+8uVJyyda7h1DP/
 8f6w==
X-Gm-Message-State: ACgBeo2OeRYpYgCTejTBvQNwXNujYd6CJtQ5ziVesezXVN+7Ztal3M65
 ou0QihP69xk/3Zy5fE5m9NJ2Es7A+Bp3uA==
X-Received: by 2002:a05:6000:1a88:b0:225:5f70:9a1 with SMTP id
 f8-20020a0560001a8800b002255f7009a1mr1441172wry.209.1661174640756; 
 Mon, 22 Aug 2022 06:24:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:23:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 00/10] target/arm: Implement FEAT_PMUv3p5
Date: Mon, 22 Aug 2022 14:23:48 +0100
Message-Id: <20220822132358.3524971-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TpUSnGdXc2O4

This patchset implements the Armv8.5 feature FEAT_PMUv3p5, which is
a set of minor enhancements to the PMU:
 * EL2 and EL3 can now prohibit the cycle counter from counting
   when in EL2 or when Secure, using new MDCR_EL2.HCCD and
   MDCR_EL3.SCCD bits
 * event counters are now 64 bits, with the overflow detection
   configurably at the 32 bit or 64 bit mark

It also fixes a set of bugs in the existing PMU emulation which I
discovered while trying to test my additions.

This is of course all intended for 7.2.

Changes v1->v2:
 * fixed indent error, comment typo
 * a non-change: opted not to use bitwise |= for bool
 * fixed patch 8 to implement MDCR_EL3.SCCD, not some
   weird mix of MCCD and SCCD
 * update emulation.rst to note feature is implemented

Patch 8 is the only one that needs review.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Don't corrupt high half of PMOVSR when cycle counter
    overflows
  target/arm: Correct value returned by pmu_counter_mask()
  target/arm: Don't mishandle count when enabling or disabling PMU
    counters
  target/arm: Ignore PMCR.D when PMCR.LC is set
  target/arm: Honour MDCR_EL2.HPMD in Secure EL2
  target/arm: Detect overflow when calculating next PMU interrupt
  target/arm: Rename pmu_8_n feature test functions
  target/arm: Implement FEAT_PMUv3p5 cycle counter disable bits
  target/arm: Support 64-bit event counters for FEAT_PMUv3p5
  target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  37 +++++--
 target/arm/internals.h        |   5 +-
 target/arm/cpu64.c            |   2 +-
 target/arm/cpu_tcg.c          |   2 +-
 target/arm/helper.c           | 198 +++++++++++++++++++++++++++-------
 6 files changed, 192 insertions(+), 53 deletions(-)

-- 
2.25.1

