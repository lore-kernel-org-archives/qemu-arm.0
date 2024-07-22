Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2050109njc;
        Mon, 22 Jul 2024 10:30:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwAAmwNOCsWku2G0YMPClC/Uia5on3CcQuFUzPATC8p2hVo0KVZlhQzN4bZl6C8fVuN0D3MHuKxoZcQ96fBug+Edin6GeV
X-Google-Smtp-Source: AGHT+IHKB9nwRWscyTiSQK4Vwi+E4y8VZFHh/6XM0fESueCmMJriUM5whVFIxLNRj6k+jhel4RNk
X-Received: by 2002:a05:6808:1309:b0:3d9:2e2e:1ace with SMTP id 5614622812f47-3dae5ffab85mr12319968b6e.42.1721669448439;
        Mon, 22 Jul 2024 10:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721669448; cv=none;
        d=google.com; s=arc-20160816;
        b=Xc+nN/SsSnPfpR0lqbpIwN1SMSq/uxwRqAIiUXmjIyZWIHwxcOYHzprZnu84F7SB09
         AKhk3Xzfch+kbA61ivBpbauJ8aKk9ccDLdCGtAqhiWLpo/t4Q3N8hjhhvdXy9ddeGnQf
         f5zgo6+288c9t+MLTOa5xgvWBrwlORqRE/fSiBpZWUP1M5rwMzjXtdJsy5nUD/yl8PyL
         pODyDqPVPWccxmWsoA+RfUTCRWX9ZrZfdqFc5smnP1IhCOfQZ6S4wk357eytycGo5urB
         8PMQqX/iQvdW+bJZiWO63hjcqM2p11UUuqPq9xH61LQT8uMOMM7oGyesSbiUWmvYIxgV
         m9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z0IYVJwzndaDSJ9XKQ8Yqnodig6ux9hujWPo87DcTHs=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=GPbe3Bnszc3RkmUcyFxE7ZoAVYDqBRtsyOM47xY1ikkzYJqdrNteVD4T29SZ56C1zA
         /NmLyymdbc2LSO/JmUBBgFtwr7HkFohJG1VtmFqYlpef6UTaOzzV6pokG0RjMmhbrk5p
         927cxl6rJD1/MtZwqsUS7F7vbYK8sJoHFOGJpVseRBgxMdc6hIewEGuWERDSJsBZn9G9
         LGfmhEOsY8R3VQXvtUd+EJ1I6BZX+XgHfLTcBzcWBLUjpM6NDZHiykPiqZRoMakKtDJx
         qMB98uugVCCmg7YJKUEJs7LEIa8QyrthErwvhLH4zUq+eQ6FC4eRDavExEIu86FrQLri
         PA1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uM/4phOg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cf14b44si82990041cf.737.2024.07.22.10.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 10:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uM/4phOg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVwrd-0000ZA-Fd; Mon, 22 Jul 2024 13:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrZ-0000J1-PL
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrR-0006Nc-D7
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso32922105e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721669399; x=1722274199; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z0IYVJwzndaDSJ9XKQ8Yqnodig6ux9hujWPo87DcTHs=;
 b=uM/4phOgdWoLiHV2KvSojmayb7tYpzOvCsVUC46MZm8AeOugvwQuqoUp9O69iPMekZ
 PhBvkevDgKt9th/9OBqgL0e+HFG0KEgb3LdCUgMmo6Mtq+CpUVJn1Qhfl/HV9aWroSZe
 0gI1MOlNGwcRIhbWjNXUt7uzng9i7ScAqzovGE+Mqk4rwdUn/pGmWsyTCOsW6DPK5F1J
 ZAF5WXpeHPUjuLIVCWsvRwqn2bXCrHwz9kN59BrH1CBWm/KPjZDY1DL5W6Dut87wOTB3
 9BUE1WC9wgRFXDe9hoBt+JfleCmVqE6wrENVshZe3+P3oBrlz8Ne1ohjmhPEu5yb6b0G
 chJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669399; x=1722274199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z0IYVJwzndaDSJ9XKQ8Yqnodig6ux9hujWPo87DcTHs=;
 b=RE2SFrUJoiGjrVilyl9jQ/Tq/v+bpo7/ukF7siH2YO8TZWZQw3S53cWhAUeI91dpel
 QE5ligyHDLN7Yl9Q9h4SC2jW4Vm+ZXLO5LF4EepeIvcJt3FSZepyN9gim0VfgHXr4XmN
 is8tw9iI/R11rJrwKlSA7gqrg/6gIqcFnzwNWBHQiI7dbeZ7jdGF5CY2hqckKfLyYPCa
 JV/pXGs+iljcRhOSFxANfyEvOqK2qLk1XcPHNxAzM2VyTxfe5Wn/gZSXctLEe1d6UtVa
 r7uHrsBs2++cCQ8Xqcgkt8h2JN2MM4opSJzMv+9GXn4/fy3YT5StUeTydXjNH75KWM3J
 fVZA==
X-Gm-Message-State: AOJu0YyWxJighCNJfS6u9+Xdwd0JvXWLuCQ/+Oj2DqlR6JjTMk7N/BBC
 tsqlIEwey9QWc6V/yMDIdJCXebr80oil9Ci5DY8L4vwQdw49mM9mYiwdPblYX27JjSxCUgALhJl
 +
X-Received: by 2002:a5d:6dcd:0:b0:367:98e6:362b with SMTP id
 ffacd0b85a97d-369dee57a0fmr369138f8f.42.1721669399308; 
 Mon, 22 Jul 2024 10:29:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa493sm138035665e9.10.2024.07.22.10.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:29:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 0/4] target/arm: Various minor SME bugfixes
Date: Mon, 22 Jul 2024 18:29:53 +0100
Message-Id: <20240722172957.1041231-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 53eI3iGikP/j

This patchset fixes a handful of minor bugs in our SME implementation:
one spotted by Coverity, one raised as a Gitlab issue, and a couple
that I just noticed in passing while I was working with the code.

thanks
-- PMM

Peter Maydell (4):
  target/arm: Don't assert for 128-bit tile accesses when SVL is 128
  target/arm: Fix UMOPA/UMOPS of 16-bit values
  target/arm: Avoid shifts by -1 in tszimm_shr() and tszimm_shl()
  target/arm: Ignore SMCR_EL2.LEN and SVCR_EL2.LEN if EL2 is not enabled

 target/arm/helper.c            |  2 +-
 target/arm/tcg/sme_helper.c    |  8 ++++----
 target/arm/tcg/translate-sme.c | 10 +++++++++-
 target/arm/tcg/translate-sve.c | 18 ++++++++++++++++--
 4 files changed, 30 insertions(+), 8 deletions(-)

-- 
2.34.1

