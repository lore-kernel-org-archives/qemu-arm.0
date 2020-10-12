Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1147847lfa;
        Mon, 12 Oct 2020 08:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwolmo8s2L38ByspeYqhV3VP3nuaOWm1UJ54+MopHrZzymh3bVRBzNE7us4ajH217y3+OH
X-Received: by 2002:a25:b792:: with SMTP id n18mr2762769ybh.93.1602516870057;
        Mon, 12 Oct 2020 08:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602516870; cv=none;
        d=google.com; s=arc-20160816;
        b=rHG7wMhKgsVe6HlqDyoGzQCI02v6NMWJbw3M5nkYD+6iEuFK5FCH+axnuNz5dfRpjY
         P3h+wBqsm6TY80dU2HZ3oONZKOcWkkFd70RBTQgFpMOll/4/x1mCzRC3iKPNYQum4qsY
         Q2zwA2Xpqcoy+FvgDlIzLC0JPsDa0OqQsbn5Npoxo15gCKshbdYL4yWLia2ULUkjB/bY
         vwP+iiDcHZKT59Hz3RRlvRiAnglMti5XaSwR3iTK71goItn7Rk9AKTrLsOp5JYlfktbw
         /5gGDIXc5xkS5XcNNyBYxnn4gP5Wx9Jjbl3pRI3hZIG184XOXzJd/KioZH5SmnT9behf
         iPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=uOFoZu1In90IQ/7mmNLwUBRcHp1HA2VeP+OkYjMIn7M=;
        b=apSnmE/1BLm6JGu8JYkE8TUA29eEPqVsJWP340H/+3fBxsU14mL+5sT7B5J3pQw+wE
         4MPW2K8hJSEWSWHk3UOGVxQzfFfykJ19lYIEPv66AGdKFLI/saN9BUYy3u69PonrXikB
         qGNTfK4hkbU48gD0sRyhdGlwOSOl37QERYMe4/Z+MlRD5/tZ/f4aAqu+doufgz7GUTX+
         qpTIuyEqqtQUfouzk/x6RI6WC6f2IeDO/I5UImbiIGpcmU1DK9R2tGncRKe/eTyzPTrR
         7kPbk/e7IPYes0SdMIv2fx2hKCk0IGGfQx0tfai6shNguuQL4ovAomkhxQbZ42xENQH2
         3tdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqJ2FBs3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si15673986ybk.356.2020.10.12.08.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqJ2FBs3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzqH-0006Pt-D1
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq4-0006Lq-HF
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq1-0007DA-1z
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:16 -0400
Received: by mail-wm1-x32d.google.com with SMTP id z22so14005807wmi.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uOFoZu1In90IQ/7mmNLwUBRcHp1HA2VeP+OkYjMIn7M=;
 b=IqJ2FBs3WvZD6BvFPJhn6j2YefDALfKZWtre398LuM4e7oFJdK673oLz/HXZvdbDvD
 HUJ3peg1NjFH7uqda1iZjxAs4Q4FbVN7hkeTVQ+Sj/QDHJ/rNfolxzYiUCgUmb9rv1xn
 MQnUdEbQOOhEfHPA9h5LQ058POxKwVXaqtqa6BFstdNYsWXlWSHFwU077KW6hnPmk9fu
 DpZh8iAUxyT8OJ0jKzjMhFo5uaiayUEP12OAzDGnKR0IaZpIymJG9v8vyJQHdbIK7tlT
 FWj/0RnbUxVbkwIU4tbgL5CUmHgbqp1R4exgkpw5711s2iZ+48DrgkUYoY6PaKz+9KRD
 J3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uOFoZu1In90IQ/7mmNLwUBRcHp1HA2VeP+OkYjMIn7M=;
 b=B6htdjiEsUU0ozV210in2xueRsUZfV80TVDm1OV6aYOYqG3Ouv5mB9mR3Add03ZIby
 2u2oRxy8Ex4bXWRuwLHqc6NrcfX2OUT8XI1HKM3+wKuTDmHuczygXg17XmJyLg9Yjnr2
 WKcFaFhl4uYttrg7MFFjVc/3SaKKfPQ0bcHKaEZWSryaCsvLmc50q9KHjC09rWhhN8FE
 gkpp1pGYTyj6473BdMGxsXegofaum6fbCdUW8CazeOKwWWMJVfMITy2hpVVclM8DNHfp
 MGy8KQ9X5Hzz7tu3zAJvC4vLcWUdNX9uGmGA766nFUvfDMN0XNDI3TrezXUr2CggfEUD
 A/0A==
X-Gm-Message-State: AOAM532CUGbksthwaPE5r6gHpdOTN7ca/IXUwx+J4MUdPp4o+6jnPIa2
 oh9KFJCezmRx+Xhemj5aFAB7abWf+P4VCXGx
X-Received: by 2002:a7b:cc89:: with SMTP id p9mr11798293wma.4.1602516850497;
 Mon, 12 Oct 2020 08:34:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/10] target/arm: Various v8.1M minor features
Date: Mon, 12 Oct 2020 16:33:23 +0100
Message-Id: <20201012153408.9747-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVL8LyLsSeMr

This patchseries implements various minor v8.1M new features,
notably the branch-future and low-overhead-loop extensions.

(None of this will get enabled until we have enough to implement
a CPU model which has v8.1M, which will be the Cortex-M55, but
as usual we can get stuff into the tree gradually.)

Patch 1 is a decodetree fix suggested by Richard that is
necessary to avoid wrong-decode of the changes to t32.decode
by later patches.

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
  target/arm: Implement FPSCR.LTPSIZE for M-profile LOB extension
  target/arm: Fix writing to FPSCR.FZ16 on M-profile

 target/arm/cpu.h               |   7 ++
 target/arm/m-nocp.decode       |  10 ++-
 target/arm/t32.decode          |  50 +++++++----
 target/arm/cpu.c               |  34 ++++---
 target/arm/translate.c         | 157 +++++++++++++++++++++++++++++++++
 target/arm/vfp_helper.c        |  30 +++++--
 scripts/decodetree.py          |   2 +-
 target/arm/translate-vfp.c.inc |  17 +++-
 8 files changed, 268 insertions(+), 39 deletions(-)

-- 
2.20.1

