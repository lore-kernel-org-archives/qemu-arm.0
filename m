Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4905298lfm;
        Tue, 25 May 2021 15:58:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDT1NTnoZtW0D9pvhKgXUsNCDBy0oeJU1+zUAwVHUpUK7DpcfBGR/AQjGD1RLddNrpmZK6
X-Received: by 2002:a05:6638:270b:: with SMTP id m11mr32917255jav.59.1621983529400;
        Tue, 25 May 2021 15:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983529; cv=none;
        d=google.com; s=arc-20160816;
        b=wTulcmgqpqJqBYc6LSwW8mMzLU/WvaREAxoGnAlELCtcLtJFTH0U249VFd7+Vv7m9C
         KOpYusErdx1MRVZBGwx5s+qCTmeQiXpZQAiNnbcLvP6MsdTcOuu91GtCiyxqa3i2w9vD
         QQpH9qYNf66y1IO7XNDVPxG1upP3jXtQWcrjkUoCtuCTOKjtLtmFfQ1+9nHiUtQDu7eu
         mD3JI2IDi9ao+YZ2xZJuU+52cSaqkyjk5YcawoXoGD/K3mbpN+9vjRT+DiamVWYt9N36
         8EPtn1CkeVCDPHzFiMPzoCMC55X80vp26vWCH+nsANad+1UrzYV8eMFFU/bPiAD5oAh9
         o98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VduqsqOC/yk2t9Dar2PD6vtb7T2o9BkDw/NGRdbLG/c=;
        b=mo3DLC/LrLxDVddPr9ByMiULQ75lvwdnXZul7i1IzHi3qtvIKZPFUyDpvFd2wfSeyd
         olmSypRHyXntVI8GXHQ+vemqgCPytQCYvmRjq6uFMWp0vX47cAuC8IZMlYo3qq5vLlSb
         t0UIeWUJlyx55frxm/OoTpBzqzNJaTHnJEmOVgV6PVsKTWyiyMdezIcIrmjIeu7GNVlA
         AUQSgPPpWJIA/rQ+aLf2v19/u11AyAXJXq4xbgpQ+6K1tdBnKKNxBOt5XB9eyHUIkQaZ
         +uPAfLxEDz0DqLnmgo0m9fGXBOXxOvTKRCO0mst3tBpRd1A5GP52S0EkrKmloTAMmiRL
         c7hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VTUbtYV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1si19747163jat.48.2021.05.25.15.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 15:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VTUbtYV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llg0e-0002ZS-OF
	for alex.bennee@linaro.org; Tue, 25 May 2021 18:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0Q-0002XX-Hu
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:34 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004mZ-9R
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:32 -0400
Received: by mail-pg1-x52b.google.com with SMTP id f22so23011628pgb.9
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 15:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VduqsqOC/yk2t9Dar2PD6vtb7T2o9BkDw/NGRdbLG/c=;
 b=VTUbtYV0iXVS1OG8nL01Kaa4IVJnKkUyXG0vwc9pq66+LmoVvUpprC+gHirmqv5QWp
 jZ9Um6QvqrYYYw4Xev0I3GkgUwqr8ZVr0TLQ0d96M9abXnEvyfLMOrvDPwH/JHn+5J+8
 KnMzs9VQYasjdFZCOp+3JyXjyO8nNwGQtP+PmVpynu6xR07ipzHZXesnoM6m69tB5OG3
 yMmiFSs101djD+zfJKVVFiwZ14ByJgUeC9OFrAOrbyjlauZKOkVptOFeE/RwZ6FiysVY
 I85GPnji4klVM9tBzM/yOp1hA0qKeE9NKc+lxBC0aDIu4dEVmSKsPln2izvE6KAtgjRc
 MtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VduqsqOC/yk2t9Dar2PD6vtb7T2o9BkDw/NGRdbLG/c=;
 b=mzVf1pWTIzU8MWdLiXBtQeS66lRo2nIxaw1nbCKqABWGPeNiUGgjrct4WF4RUUw4FM
 kicAT4Yp78Phdnr3qc0P1XEu16QosTmkW6rI6xPR4t8JibcSsalS4LxwEKUeaxWrSD1B
 LnQ+XVkhD7B3GogYS6469Jg3KZAPTifBio+sVfP1inuPwagBQ8W5e24vVRnp4UqKEed0
 RTLJe3nMES2AIXwFgE/XfLoMsXzNxy52XETvWFPJgAqne1KIAyaxnFCXsxW+6/VeVuy4
 74jzqy1Ra7yjBXuiaZRWXxsRE95wCu+5DxrzAHQUfUZdQSERRTmnaH9itXzUamtXfYui
 xEnA==
X-Gm-Message-State: AOAM5306wrDICw6dnBWJ1m1GLDuGYSrNTW2XUGwZEIHkjTfXgBn+ylWe
 yawFNKvCr9IPdgTWXHeCM1jzs9nYqLTqUQ==
X-Received: by 2002:a63:1d61:: with SMTP id d33mr21366640pgm.331.1621983498522; 
 Tue, 25 May 2021 15:58:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] target/arm: Implement BFloat16
Date: Tue, 25 May 2021 15:58:05 -0700
Message-Id: <20210525225817.400336-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FLbx3Z++vF/k

Whee!  All prerequisites are now merged.

Patches missing r-b:

  05-softfpu-Add-float_round_to_odd_inf.patch
  06-target-arm-Implement-bfloat16-dot-product-vector.patch
  07-target-arm-Implement-bfloat16-dot-product-indexed.patch
  11-linux-user-aarch64-Enable-hwcap-bits-for-bfloat16.patch
  12-target-arm-Enable-BFloat16-extensions.patch

Per the question of whether additional checks vs VFP or NEON
are required, I have disabled BF16 when either VFP or NEON are
also disabled.  Which seems like a similarly reasonable choice.


r~


Richard Henderson (12):
  target/arm: Add isar_feature_{aa32,aa64,aa64_sve}_bf16
  target/arm: Unify unallocated path in disas_fp_1src
  target/arm: Implement scalar float32 to bfloat16 conversion
  target/arm: Implement vector float32 to bfloat16 conversion
  softfpu: Add float_round_to_odd_inf
  target/arm: Implement bfloat16 dot product (vector)
  target/arm: Implement bfloat16 dot product (indexed)
  target/arm: Implement bfloat16 matrix multiply accumulate
  target/arm: Implement bfloat widening fma (vector)
  target/arm: Implement bfloat widening fma (indexed)
  linux-user/aarch64: Enable hwcap bits for bfloat16
  target/arm: Enable BFloat16 extensions

 include/fpu/softfloat-types.h |   4 +-
 target/arm/cpu.h              |  15 ++++
 target/arm/helper-sve.h       |   4 +
 target/arm/helper.h           |  15 ++++
 target/arm/neon-dp.decode     |   1 +
 target/arm/neon-shared.decode |  11 +++
 target/arm/sve.decode         |  19 ++++-
 target/arm/vfp.decode         |   2 +
 linux-user/elfload.c          |   2 +
 target/arm/cpu.c              |   3 +
 target/arm/cpu64.c            |   3 +
 target/arm/cpu_tcg.c          |   1 +
 target/arm/sve_helper.c       |   2 +
 target/arm/translate-a64.c    | 142 +++++++++++++++++++++++++++++-----
 target/arm/translate-neon.c   |  91 ++++++++++++++++++++++
 target/arm/translate-sve.c    | 112 +++++++++++++++++++++++++++
 target/arm/translate-vfp.c    |  24 ++++++
 target/arm/vec_helper.c       | 140 ++++++++++++++++++++++++++++++++-
 target/arm/vfp_helper.c       |  12 +++
 fpu/softfloat-parts.c.inc     |   6 +-
 20 files changed, 584 insertions(+), 25 deletions(-)

-- 
2.25.1

