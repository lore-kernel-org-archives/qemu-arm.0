Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp821878lfr;
        Fri, 16 Apr 2021 16:59:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1EC/P3uQ8o0zw5B4/ZkoxL5uNO/ffjhu3FVrtxz42a8uc5goJba8MqgLR7cAadclgrbXe
X-Received: by 2002:a05:6602:1594:: with SMTP id e20mr5391089iow.95.1618617587324;
        Fri, 16 Apr 2021 16:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618617587; cv=none;
        d=google.com; s=arc-20160816;
        b=o6bmsdoj/pmeS9If1IIU0cg7IJovvjkOkWNObArS05cVLynE+ClyNIAiJB10Gdwfb7
         CdcLzOIPEKRtAnxW5o5cd9OpfZ2iH0NxcILkYoKga9oVaoYRTZMJDVpPM6G2MxQCNMsC
         +C2iBNG2mm4oYBb2SEK2MOOk4MIWHM0qc0gXBdR9XGZEL4dfqKuZN8Ncn0p+HcvDd0jX
         X69+yPMkI8QoA3YQkuBZYYZR+8Aqt30wyNJp0N9f4MeOx/aiY1iGgyRFDnbIZJPjccXc
         EvYP/WZ7xzG9GfW3qwYg7nRdFWhLigHiRC31/6ZY9za1rmTFcnw1+/clcHVLOWfeyOba
         RPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sQu0+IbkMasD3OrPquNWb27tHEFNhu3L5F1sQpfSRH4=;
        b=F/MEWMRAlzgZ6tDTc3pBeBOp+sgB8CmWi6jZeUstAXVl0CF73wJ3MOUhsPSjLr5DMo
         NphMBGywbT1te5d5zV4SU1Ma4+MKyntyy698h0buRF/uzCQ2J6lD8PUoG/ohgG+ezLXB
         vI+yj4xWvfG7mGpvRm5Qt3jp8/jJLWXWObOq3g5Cfc0RUKrdJuRZkZaCpVb6LXbfwhB/
         qclGU/szGXkDPtOi9bC4Ngc5I38lZUXbnVxuf2TTBSOqI6ilgc+zOLnIO1hd+wRhz+kp
         /9FuYr6ku9gMAekMBftQ5eZSqfUxeXLxg2jDLTrE5qxG9bIDO9jSdlZvUexRfyMUgsI5
         6gdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hQYqp5mX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si8184979ilo.113.2021.04.16.16.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 16:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hQYqp5mX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXYNG-00059c-J3
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 19:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN4-00059J-9T
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:34 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN2-0005Zr-Ek
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:33 -0400
Received: by mail-pf1-x434.google.com with SMTP id m11so19361902pfc.11
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 16:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQu0+IbkMasD3OrPquNWb27tHEFNhu3L5F1sQpfSRH4=;
 b=hQYqp5mXbjfXCYEJURpqp/lqvqchvdsKW3ZntO1tt7Nege8VmLDpZ7jB5+Vw9GPuzF
 bWaay7JEYN7Ok7WV7q4U39BK0hMq3Ba2P0IjHwx3sVH5xjuEeDe7SWVR4sykzPofKd1L
 CTYj42FoLkDAh/oie36gxdHVbgb+i381F/jrq3yD4bgPINQOZDt+RghUw9cFOsujfEaJ
 4EulhyEOsk3pLcVmXtIVE3+pDVRxQpsC5YBUDnackigB7mlS68uT8DiEGre8hrRya+pv
 N12RlC7Jj1k9ntvENpbqVVwDKdAkyj2q8eFt4PjspEnKGu5n7SQdsPGP8DrIVGwlc485
 o0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQu0+IbkMasD3OrPquNWb27tHEFNhu3L5F1sQpfSRH4=;
 b=E2NqOsubUgFHXiejN7pk09BLyzs/41quFQms+P/LtIluEX+WVrwnUU2ZbRUTkZf+zz
 E4aKyEvruBoe2WcPrpNgl2Wd5iLFDmR5htcdfOOWi5z6vhzs0ZZqYW0CpcN7iC0BAlB7
 Cxml2ugl3gm4ClAUDqHPcF9NxVdsCjeVKyKTHvVfQH/aMViyV4mXe5r0wbe7aTT5Ev9v
 V77S0OUVdCEpFX/RKHuArdz7oTY1Bn05FjviTHcLdzjAAtUhu3t6QgT7Fo5dpCN1qZg3
 4Lu3a+JZxEQZZH9FxfUs8QUOnmWgMbAAr+GojtEurv0DDk4CUP6kD3fsWB3PUHeqE53b
 hsbQ==
X-Gm-Message-State: AOAM530P2OoYLnTs/rHpyDSrRellk6QEF0zq8XMptfjSSOSBIdhm106z
 MDggo/c7+w5DyEDfudNZYJZwtzeaAabEHQ==
X-Received: by 2002:a63:1b5e:: with SMTP id b30mr1296397pgm.254.1618617570583; 
 Fri, 16 Apr 2021 16:59:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 for-6.1 00/11] target/arm: Implement BFloat16
Date: Fri, 16 Apr 2021 16:59:17 -0700
Message-Id: <20210416235928.1631788-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JhzFqtb/6rtX

Based-on: 20210416210240.1591291-1-richard.henderson@linaro.org
("[PATCH v5 for-6.1 00/81] target/arm: Implement SVE2")

https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-bf16
https://gitlab.com/rth7680/qemu/-/commit/2ecc372b672d11fdc4e2573d789bfb3f5e6cba48

Bfloat16 is a set of 2 tightly-coupled features adding to AArch32 NEON,
AArch64 AdvSIMD, and AArch64 SVE1.  That said, there are helper functions
and decode patterns in the SVE2 patch set that help here, so I've based
this patchset on that.

Tested against FVP 11.13.36 via RISU.


r~


Richard Henderson (11):
  target/arm: Add isar_feature_{aa32,aa64,aa64_sve}_bf16
  target/arm: Unify unallocated path in disas_fp_1src
  target/arm: Implement scalar float32 to bfloat16 conversion
  target/arm: Implement vector float32 to bfloat16 conversion
  fpu: Add float_round_to_odd_inf
  target/arm: Implement bfloat16 dot product (vector)
  target/arm: Implement bfloat16 dot product (indexed)
  target/arm: Implement bfloat16 matrix multiply accumulate
  target/arm: Implement bfloat widening fma (vector)
  target/arm: Implement bfloat widening fma (indexed)
  target/arm: Enable BFloat16 extensions

 include/fpu/softfloat-types.h   |   4 +-
 target/arm/cpu.h                |  15 ++++
 target/arm/helper-sve.h         |   4 +
 target/arm/helper.h             |  15 ++++
 target/arm/neon-dp.decode       |   1 +
 target/arm/neon-shared.decode   |  11 +++
 target/arm/sve.decode           |  19 ++++-
 target/arm/vfp.decode           |   2 +
 fpu/softfloat.c                 |   8 +-
 target/arm/cpu64.c              |   3 +
 target/arm/cpu_tcg.c            |   1 +
 target/arm/sve_helper.c         |   2 +
 target/arm/translate-a64.c      | 142 +++++++++++++++++++++++++++-----
 target/arm/translate-sve.c      | 112 +++++++++++++++++++++++++
 target/arm/vec_helper.c         | 138 +++++++++++++++++++++++++++++++
 target/arm/vfp_helper.c         |  12 +++
 target/arm/translate-neon.c.inc |  91 ++++++++++++++++++++
 target/arm/translate-vfp.c.inc  |  24 ++++++
 18 files changed, 580 insertions(+), 24 deletions(-)

-- 
2.25.1

