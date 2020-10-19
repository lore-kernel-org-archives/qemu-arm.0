Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3957284lfa;
        Mon, 19 Oct 2020 08:13:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw912DxM7OUDd6qPtxtsuliZ2KZBtOddtacwg4zDsP8fWibFtBvOsAKVvLoi/O01WzQjwYm
X-Received: by 2002:a25:b8a:: with SMTP id 132mr249287ybl.88.1603120427722;
        Mon, 19 Oct 2020 08:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603120427; cv=none;
        d=google.com; s=arc-20160816;
        b=VdtZIJvPPmxJjCkamHqkvIClqhVt15zN1Dqfd01vhb4HaWckkCSTmG8QXAilQveD8a
         BUbirbXWAn5wqOBl5G6UN080hRW8eA5Nl3INkMCVIZK86i8eZaFjuMfIMOnYi0n6J0It
         MBMwLhfFNwpaAwPDdQaceBy1CfgM0PSgPvbzu4n5B9qmZKhu4+ERlGVxcN4GW7B37ql6
         C4gGfJ6GRiaL2i8kqCszu8p0J0y5eqeqUxpGc/QObaLfHJfXmWf8CB1bEpOHlts+z3wL
         ji41EeWcHnZ9qbqRtRt//SxJhWdn2Us4PmgAYh5r0pX1H912rF0hXHjXtakK3DffrCKY
         jL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nfoR8sqiK+gHy7yD6/tEtbPtJxBhQTr1YZYkY4YxcN8=;
        b=uc+TnRCCiwLlx72BMAzZbMrly1/kYUZmQvlQ5bzXkVQ5xrBDFHvZ0PxON7SvypTp/D
         tF9ho8gn4QPhzrQI624aXPLsYu28EOPFh70Ntab0PhXQVj/JJggFk3M4vNRSuqWr/viN
         SMWib7xgQ/X2XknKtXjDO9xv8sD7rko32oYMa34UsNRlgLLtWXbdGRc9zyRC0LHyHCdF
         Efm5Z06EIfNemKZs3S/WwpqZ8PqWzhhdxa45UrnLsZEvtx/0WEL0txQfC/ho8FBC88p1
         qILRg7FjJxkNKNyrjIzTfoqjDCkjcopOVmk3niCidN9eywBQW3Fl7OFHZPqNR1hrWd8G
         2yeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y11auK2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v67si201737ybc.473.2020.10.19.08.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y11auK2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUWr5-0007iq-1K
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqU-0006oO-L2
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqQ-0002jV-QG
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id p15so173098wmi.4
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfoR8sqiK+gHy7yD6/tEtbPtJxBhQTr1YZYkY4YxcN8=;
 b=Y11auK2Btu6HGbq/JcbQj2ZuW7uiSIFu5K4NND6lx00izU3s5sI3+JdZ5xbeRZHmDi
 QSoNXQY0zA6nQuYhrCj/vUCfte5jT/soKONi48uuUd7M0ePOdsU07NPtnN3MTAN69JRq
 fkMgZDGWRupGpNTcx9+Y/JolXcL+wdTWWY4UvysPUugm6Eg7NCsUQhAn3E8Q7u/yxWNY
 l9VdUjnWE2Y/ByQDSQ/PguMpODoKzwupH6Zr7y1kY4fVj9NlxgDdxxkX0rdqCv+6E9hX
 DHWXSaayIC0Ixy7A5xVAxIi6WQfXYnDmxOpi3We/0Qh5h38gcH4CwUcUG+n4YpPbK1cn
 yVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfoR8sqiK+gHy7yD6/tEtbPtJxBhQTr1YZYkY4YxcN8=;
 b=FoZZidEvr0EMj4J0m/+XajsJoeTahPChKmgSxA5VTwjM+b7jWdn+MgjMIf5zhbDBYF
 n/syPSplUboHZM/+hkxCd7ZnCGUVjmTRl06e6iBEhL77ailfr27pU/vfwFpXxfT4uHss
 hdGEZBH66Ys0KPYJd7aaFMxYeP1cFYTIJhOwPfCVP6PLxBQ/Y7xxyVIi30K14JaOmXjh
 pxW3ryUsOQWZpwK4OMAFQdtcNuCvXXB1sKH9kWErZm+R5bAMvhm06OMgZHzG6l4HbmX6
 T8HL1EBP5TFIQ2/6ktWVezndzGIwVTpZhPHRsQNY47zSX3X/WpoJn1OJKBRTLg7v1BtX
 vRXQ==
X-Gm-Message-State: AOAM531HfTddxWvCxBzPtL/JDIV0pPJu0shASGpbpIbEB5gSAm95zmRH
 2AkjEFu+mXVQilbmZaaobpP1tZsO0Y3TiA==
X-Received: by 2002:a1c:e287:: with SMTP id
 z129mr17497050wmg.109.1603120383889; 
 Mon, 19 Oct 2020 08:13:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm309918wma.48.2020.10.19.08.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:13:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/10] target/arm: Various v8.1M minor features
Date: Mon, 19 Oct 2020 16:12:51 +0100
Message-Id: <20201019151301.2046-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWOMCOXiy20M

This patchseries implements various minor v8.1M new features,
notably the branch-future and low-overhead-loop extensions.

(None of this will get enabled until we have enough to implement
a CPU model which has v8.1M, which will be the Cortex-M55, but
as usual we can get stuff into the tree gradually.)

Changes v1->v2:
 * added missing check that rm!=13 for CSEL decode
 * folded in gen_jmp_tb() fixup for DLS/WLS/LE patch
 * reversed sense of branch in trans_WLS
 * reworked set_fpscr changes as suggested by RTH
 * provide an env->v7m.ltpsize now (always 4 until
   MVE implemented, but it avoids code changes later)

Unreviewed patches: 2, 7, 9, 10

thanks
-- PMM

Peter Maydell (10):
  decodetree: Fix codegen for non-overlapping group inside overlapping
    group
  target/arm: Implement v8.1M NOCP handling
  target/arm: Implement v8.1M conditional-select insns
  target/arm: Make the t32 insn[25:23]=111 group non-overlapping
  target/arm: Don't allow BLX imm for M-profile
  target/arm: Implement v8.1M branch-future insns (as NOPs)
  target/arm: Implement v8.1M low-overhead-loop instructions
  target/arm: Fix has_vfp/has_neon ID reg squashing for M-profile
  target/arm: Allow M-profile CPUs with FP16 to set FPSCR.FP16
  target/arm: Implement FPSCR.LTPSIZE for M-profile LOB extension

 target/arm/cpu.h               |   8 ++
 target/arm/m-nocp.decode       |  10 +-
 target/arm/t32.decode          |  50 ++++++---
 target/arm/cpu.c               |  38 +++++--
 target/arm/translate.c         | 181 ++++++++++++++++++++++++++++++++-
 target/arm/vfp_helper.c        |  53 ++++++----
 scripts/decodetree.py          |   2 +-
 target/arm/translate-vfp.c.inc |  17 +++-
 8 files changed, 305 insertions(+), 54 deletions(-)

-- 
2.20.1

