Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1489012lfq;
        Thu, 8 Oct 2020 09:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/oh9Vh59UBPR+LrUE300koEWplV7qWT0XQn9HAg6FDAHf4XNVZnL/WKi+rgasZdfmFHhm
X-Received: by 2002:a25:2109:: with SMTP id h9mr3254516ybh.279.1602174145855;
        Thu, 08 Oct 2020 09:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602174145; cv=none;
        d=google.com; s=arc-20160816;
        b=SQsvFOhbwo9CsmANxep8f3uUAod+RMtLxT7Mz99L3F856XLEXgOZk1Li22BXgNr+Zq
         jhsqWO0BqR5H1+AMbRE20NQB77iW+QHwIpPvopEt1k9OgTTMRfd2EoDADilQB7skns7q
         EdEblkjBgup1OQ2HW8dft5XFj6y6vX7V5hqTvBcZA55GY0hide8r00PvcNirciRZgJdc
         6R5BVBTBYNdSl3cty1bmtDfPqNXZ92XJKuCAIjzruVoSxf1FIAn599aoy7htZ1x54X1a
         Rb2HdHmVZY3zWWeQW6rITZK0UB6g7hYHFSarrl6bVLposUdcF8Lb5t/8Hz/wuoLUDmzS
         7HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=94Z0jUkUzmfUn5U+1GJavLRJ+p/K0pJn87QewJivFBY=;
        b=JKxcZvAnojetB+qIlqusUmedqqrC0nDhpsVJ8uBo1CsJ/kCXr7CTFHZ7eTJUmpw97b
         7c6uSCuEmI/i8BTqGOjjjGPjDt3mpGqQDSyyUfzkrzYs4C1F65diFNxEm748I+5VHMkY
         5KaygRF3p3r5e7r5kr8kIu95++sAca88NNL2BypHtSIMxLLHOaRS+IcPnWrI2cTjTNIh
         YY+T1NiHDr+bdswxHvWpX8qXLo5JD4QZe29786k6DFxMuDNtBq/6sd71mgodT6ZfySVk
         8Lh9lfHviBl5vHwjHA2sEm5L7d8K5BFMMR8hAjeggOgGOLbVxvKXcY0wdyx+ev3ecw/r
         IkVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f9W3ge+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10si4254438ybt.31.2020.10.08.09.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 09:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f9W3ge+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQYgT-0002WI-7z
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 12:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQYgD-0002Rz-9r
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:22:10 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQYg3-0007dr-F9
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:22:05 -0400
Received: by mail-ot1-x32d.google.com with SMTP id i12so6038236ota.5
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94Z0jUkUzmfUn5U+1GJavLRJ+p/K0pJn87QewJivFBY=;
 b=f9W3ge+Movwd8twHI8VvsMejpdOToEATUscBDM1oa4DKnLFT73ge/UoiTX0c/0zhhi
 hOKZRt5LULKbGq7my4nYuBDFrfOlg+iPNwi0myomZlDyyNaq+IOePyywrmOtXMypxQ8T
 D1JQ3LWyh3jE8pHFzxlrFNCt5bL0FHey7OJA+jGb9dbaA2gOqhcAsgmGoAxlpyhZnQ7/
 gG54RYNexgFnqJvK498znxV/GIC3+pnraW3oesIgjchnbrdlIhsDSPvIU/arvwq619MH
 DF5UpJ+PW04fqCKBIfoRtucMGpIudgEWTXa7pA+igwA6V4bZVUbvtg9Q45oXGWsT3hFV
 cgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94Z0jUkUzmfUn5U+1GJavLRJ+p/K0pJn87QewJivFBY=;
 b=KHq/l0HYIA2phANSdRL+7kZjb4XcawfrEn0t6MQRUQmCfwA5jB7gIlsXWTZedj/0eP
 zULPWxsnesLG9JfbW2fn1+Ap80lsPbB9sRQyuwhFga/1FZzor3OzcxYYQzv+/DkqYPnJ
 xWPUy53InG4G8GV6j6w+/ZNh9EPL8g7dvdNpH+QD9tGeWbKTxzquWLl/H8pok0SKNrOw
 YZ6ubTG2E+K6BnnOmg8ljjp07ES+167+XiQNtbSs7ScYGKKzrZtAm6d81FnNyMOC3SYW
 Q5BuJmMx3KosVeTDvl3DUK9uZwdZ7Z/vTTuNb4zc3N2LnpXnmTFldtjAJEwB8LLtTHwB
 82cw==
X-Gm-Message-State: AOAM533opGGX5I+t/nTMOUOKpklnpWZ/fXP9xHIxXjen5573VoDerhlh
 dUZo1YDWGNk3H/LO2w+Hsrnnyg==
X-Received: by 2002:a9d:4e18:: with SMTP id p24mr5918518otf.190.1602174118112; 
 Thu, 08 Oct 2020 09:21:58 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id l138sm5076218oih.32.2020.10.08.09.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:21:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: MTE fixes
Date: Thu,  8 Oct 2020 11:21:52 -0500
Message-Id: <20201008162155.161886-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, vincenzo.frascino@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nAUWe14OCbNx

One code cleanup and two bug fixes for MTE.

Vincenzo, thanks for the clear report.  Can you please run
this through your test case?


r~


Richard Henderson (3):
  target/arm: Remove redundant mmu_idx lookup
  target/arm: Fix reported EL for mte_check_fail
  target/arm: Ignore HCR_EL2.ATA when {E2H,TGE} != 11

 target/arm/internals.h  |  9 +++++----
 target/arm/helper.c     |  9 +++++----
 target/arm/mte_helper.c | 13 ++++---------
 3 files changed, 14 insertions(+), 17 deletions(-)

-- 
2.25.1

