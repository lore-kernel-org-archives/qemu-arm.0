Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp467238ejx;
        Mon, 21 Aug 2023 21:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNd6b3oYu5DcKla+CtEbrogg9n3iTHwR9tyE3XG8bKC3upa5/LWncAlglPMqi1zx+lvv2R
X-Received: by 2002:ac8:5782:0:b0:40f:caca:8c33 with SMTP id v2-20020ac85782000000b0040fcaca8c33mr8557318qta.63.1692678354843;
        Mon, 21 Aug 2023 21:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692678354; cv=none;
        d=google.com; s=arc-20160816;
        b=BiZcgRjsG+mRMcRZK2Un4zxSkPsKJPw1ZKyoCXZXoKr87IEjc3KhXppw8/N8Ygt3Gb
         FGEumOLMSrFVPlNq8dy9gIEGv7mBYJfLID/hXHki9q3Z7naj5AKFOIQBV6DC31MyjODB
         1LeBe9lXSdU/1A20/jJjCX/9Nio60Ci56bXjZ6+k7/TJCFllZNAHL6b/yHUJYl9img/c
         xUt9+CVAruHsQVx4OW8tW1jNP4WEoyNx17h/D9QbXLSQSVZoxhhNVbmQojV2Rs3fZLF4
         8/m++0EH8eIurAvjdKnYuIp6OYpdZzBZKqiqXabK45DJWxeRvnxbSOxl9HZSn74aNw+b
         +ADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=D/7Y2YmeMVgHIyf5S/5OxQ4B8Ovk33UJWuMGrWw9fNQ=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=qOA8igBvRcPoPfNjzFIS+UgbVna73octNQe3I8w4gNAb8z/AO5pm23Hi91iFzAd85q
         kU2FTVdqshVcUTWT+78oIMYNv0oFBUHTLayZaDqTynUHTHUew9sVagjvQtP6zykGTOmu
         4R2oFXfgV5yTVZxtWplcWwSsIL/9QvIOiS0Az+M24ce/2Hpnc8HGvrjHMfcA4kqYJh54
         pPIsfZl5L4KO9lRIu31l+9UU5ZYWFi0uGAimX/BFEK4I6ybWvaeAlMNj5TBJKwq44++L
         uf2b6eIiauSlw2SVchczIIlPW5Rel1wwq1BiK5iwQzzh0rjMcw449BB2d2qjCWsPfVsW
         Nuig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qzwt6Ue5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20-20020a05622a02d400b0040357770aa8si754029qtx.657.2023.08.21.21.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 21:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qzwt6Ue5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYIxW-0006Ex-WD; Tue, 22 Aug 2023 00:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxV-0006EA-1Y
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:37 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxS-0007Vk-7z
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:36 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68a440a8a20so1599752b3a.3
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 21:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692678332; x=1693283132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D/7Y2YmeMVgHIyf5S/5OxQ4B8Ovk33UJWuMGrWw9fNQ=;
 b=qzwt6Ue5K2z3ql52paJ2S5mqPGSV7ofPrKoarQ2Dfi0jZZBgecAM1Ixty6+fQfn89Y
 UwsfRFHcloRi0xOpRHMclJD/Km78LQJFxtD5jYcIWbySXIcF3Z5f63rE2BosLQMNFASa
 084Ksx+Onfa1U++wdVt46QuyeR5dcFWZnjCc1R1rqVhVvgAwTPWqzXEtt1lyjau3vX5G
 7jKp/ijH8Wzjv91eKIBbREP/1An8jNlPiWZ9QZMkQoKMghorJh108cT1olpBqDNkaKez
 lX7AgS1wJU3sP0A0leeSFfQ+VVkkRp1DQN8zE9Zt1hUZGiRjAoAQi1kppNnWeWuIyo4H
 dW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692678332; x=1693283132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D/7Y2YmeMVgHIyf5S/5OxQ4B8Ovk33UJWuMGrWw9fNQ=;
 b=GopyfxYXlf/XMKv/B4z5UY+EEQvyCbFzBN2phZtWCgegSJOhaFrTxV2imlcwvqFwZ9
 +MYFTI90yjCm2z9D/seQdwmYD3X0o03dzBMyRhd5CQn266FQrdFBw+qV060dfXXAuBJX
 PfLwkyKoCXPMwZyXYJDwt8NX5n0qvX01fKUuphJtm0WBXUDAEMqg3kfXCdeLsU9fmerX
 pXuAHfkRvd1WFFheOEudwXrb0/nPW+jkh8Fgzzq68dsGBNS01VzVx+kn+C/gj438hycQ
 SPWmCN71L37wTREuQDE9x/2fgNUQqdYjty1R1lNK2ZV3Nxmcw5JeZ3AXlxzPsGLBqyXp
 k3ug==
X-Gm-Message-State: AOJu0YxNpAe1XaPIkuqDaFIDpag89iA8i5NNXPZ4kjqshNPEoMXjc7Xc
 qOQaJ0sEO5ZWTAb8cPqynGk6vG/fLBdFnyzjtZI=
X-Received: by 2002:a05:6a00:14d0:b0:68a:45a1:c0ee with SMTP id
 w16-20020a056a0014d000b0068a45a1c0eemr6290266pfu.15.1692678332076; 
 Mon, 21 Aug 2023 21:25:32 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:2c08:e710:4459:46f1])
 by smtp.gmail.com with ESMTPSA id
 m14-20020aa7900e000000b0068a3f861b24sm3364908pfo.195.2023.08.21.21.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 21:25:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 0/9] Implement Most ARMv8.3 Pointer Authentication Features
Date: Mon, 21 Aug 2023 21:25:21 -0700
Message-Id: <20230822042530.1026751-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FUduKTrfHJ6p

This is an update of Aaron's v3 [1].
There are a fair number of changes beyond a mere rebase:

  * Updates to the test cases which fail with the new features.
  * Updates to the documentation.
  * Preserve pauth feature set when changing pauth algorithm.
  * Rearrange feature detection:
     - Add ARMPauthFeature
     - Use it with isar_feature_pauth_feature
     - Remove many of the isar predicates
    The pauth_auth and pauth_addpac routines wind up making lots
    of tests against the pauth feature set.  Rather than recompute
    the feature set many times for each predicate, compute it once
    and compare against the enumerators.
  * Algorithmic simplification of Pauth2 and FPAC using cmp_mask.

r~

[1] https://patchew.org/QEMU/20230322202541.1404058-1-aaron@os.amperecomputing.com/

Aaron Lindsay (6):
  target/arm: Add ID_AA64ISAR2_EL1
  target/arm: Add feature detection for FEAT_Pauth2 and extensions
  target/arm: Implement FEAT_EPAC
  target/arm: Implement FEAT_Pauth2
  targer/arm: Inform helpers whether a PAC instruction is 'combined'
  target/arm: Implement FEAT_FPAC and FEAT_FPACCOMBINE

Richard Henderson (3):
  tests/tcg/aarch64: Adjust pauth tests for FEAT_FPAC
  target/arm: Don't change pauth features when changing algorithm
  target/arm: Implement FEAT_PACQARMA3

 docs/system/arm/cpu-features.rst  |  21 ++--
 docs/system/arm/emulation.rst     |   7 ++
 target/arm/cpu.h                  |  51 +++++++--
 target/arm/syndrome.h             |   7 ++
 target/arm/tcg/helper-a64.h       |   4 +
 target/arm/arm-qmp-cmds.c         |   2 +-
 target/arm/cpu64.c                |  86 ++++++++++----
 target/arm/helper.c               |   4 +-
 target/arm/hvf/hvf.c              |   1 +
 target/arm/kvm64.c                |   2 +
 target/arm/tcg/cpu64.c            |   2 +
 target/arm/tcg/pauth_helper.c     | 180 ++++++++++++++++++++++++------
 target/arm/tcg/translate-a64.c    |  12 +-
 tests/qtest/arm-cpu-features.c    |  12 +-
 tests/tcg/aarch64/pauth-2.c       |  61 ++++++++--
 tests/tcg/aarch64/pauth-4.c       |  28 ++++-
 tests/tcg/aarch64/pauth-5.c       |  20 ++++
 tests/tcg/aarch64/Makefile.target |   5 +-
 18 files changed, 409 insertions(+), 96 deletions(-)

-- 
2.34.1

