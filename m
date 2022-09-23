Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp305883ejy;
        Fri, 23 Sep 2022 05:43:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ivlRZvUOwj202+GJd8umj+doSFH9HsrxscXv2JtfKK4RJHUfnta+hyL+M7JZ2fN88CQZ0
X-Received: by 2002:ad4:5c65:0:b0:4ac:a8d3:8b13 with SMTP id i5-20020ad45c65000000b004aca8d38b13mr6368055qvh.109.1663937025643;
        Fri, 23 Sep 2022 05:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663937025; cv=none;
        d=google.com; s=arc-20160816;
        b=EKrlvpQ6bwf5Rd0iyY3MoJe2/e9JFAnweUgAOQxOxtqtS/6yzF4LJMXoUEKnBL8q/D
         qVnByTh9ra+S8JQAHP4dhdDVNYtYpcFIYUAk4LeskYvikLkyc/gpjBuEkO7dYfqIGf4A
         UaktNRGAd1oLYF++2CUGdFPZ2MoxQNNz1MwZpPdJs/9u3500toFmx+FvaPaLeKhzddCN
         Fyy8RIwvk2VScsGsa427VZoOKx3HLZs4bY2ENo+oUnM6ApxLM/Vg19noVHNFDLDsMSuS
         +kfprcvStYqzixaCRySJ2pPn+VViPbPsVheAtDuXiBC1VUx9ITsLMidCHenPK70JYVWN
         BQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=upwhR+H0cqGHMXItgFLczOGILoh98UbA8+O2Ym4ZDr0=;
        b=juamSslfVIOookFrGp628AujSsLjHggIz3EG+afPqaYAojPxypZpT+gFyVBDoSXy8u
         KDyovyjNXXytqZCvkMFFFlw6Bkx5K/3CHodkAwgge7oGH5FN5T1gkb/2E78DrDIZFypO
         LCf4a2ugVV/OsLrxP72Gc3n7h5hW7myMv2WqOkY3iOxu5c884DuI+5mVWFfYBNWewmcO
         AiCZN7idb7n6S/QcNda/b4PRwH/+ZqkHeKUhOIKXPA8XQ+YgqXY3Xkg69vdWTgKqefon
         rankMVO2+OCl5tlW1Suj9Il4LplxMcHBcYHlr8qEi6kaCxDE9c8UpcvurVG1e9zW0BKU
         saMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htRyQynV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1-20020a05620a25c100b006cded2e4eb3si4961643qko.498.2022.09.23.05.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Sep 2022 05:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htRyQynV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obi1x-0004m5-1c
	for alex.bennee@linaro.org; Fri, 23 Sep 2022 08:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhso-0006PB-Kd
 for qemu-arm@nongnu.org; Fri, 23 Sep 2022 08:34:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsn-0007VL-2c
 for qemu-arm@nongnu.org; Fri, 23 Sep 2022 08:34:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id x18so14224603wrm.7
 for <qemu-arm@nongnu.org>; Fri, 23 Sep 2022 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=upwhR+H0cqGHMXItgFLczOGILoh98UbA8+O2Ym4ZDr0=;
 b=htRyQynVFtqiGymzb4mkKfkdBGA7wRIQd3DdKLL5rEba61OptGOqEJMW3Uq/cS8THC
 ad7r/yzvrwnsKtzVBs0xMexSUPk6YLmCF7CpILuq/qbyZuhX8zy5m38k1N9xV+voqFZQ
 otm7zTnjvsYfTHsVi+hdaglRqKpTMuT6tmyNLUs9zQSB/eA/dNzYT5cpfDYtY1MK+Shn
 khJpeca1+GpNU5H4B+t6cwf+TvW0QWpo+qDkGDgrEcTHeNDHS6NIxYHFMsLYtXwBpPSW
 gOx53KqjtSHnnR1m0u71U2eXIMd8IGiqkPkZzhFgCHPK4glttfU68aXcpT7+IO1qJV81
 nEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=upwhR+H0cqGHMXItgFLczOGILoh98UbA8+O2Ym4ZDr0=;
 b=lWNoCGiZwKTmrqhAeaJ52BXHX3haqlbklAZF6SjG4WFyytah7PpbaqoF1gyUUqhqPi
 pt3aCd4/tiJXGVNWBkQ/lz0KRLDj/CQoLUP1VDu35u0r+5NXvQHHe/g/S7hgE6i4QM9T
 93EQE1EqvNcvA6fjmBmU2UYsuL2qwX3et23mYLuZaiVYP+rKdDNKmFx9y9yxKiLZg7lm
 vyD+ycll8nN6viS4vFneUJIt+z1v6VbZvYP59BUKmgx61IC3nT4/l7rXlgXZx7ySnhKK
 hQXxi5IABkba3OF8qIaB34Oj2AimQ+D89NJvnBPtLLsdeuIPc9KGl9pitw0zV0z/64tn
 vqjw==
X-Gm-Message-State: ACrzQf0pU34UqrVJz2SXtrOz5dVEXgBXkxlPHFeEqm8JCubsavW9lKg0
 jocah2Oo1n0OnAkZK1C/f2cXwm8IKaETDw==
X-Received: by 2002:a5d:59a5:0:b0:22b:52:1c9f with SMTP id
 p5-20020a5d59a5000000b0022b00521c9fmr5209684wrr.576.1663936455108; 
 Fri, 23 Sep 2022 05:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003b486027c8asm2504555wmr.20.2022.09.23.05.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 05:34:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/3] target/arm: Fix bugs in recent PMU changes
Date: Fri, 23 Sep 2022 13:34:09 +0100
Message-Id: <20220923123412.1214041-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: exz0KL9Njmna

This patchset fixes some bugs in the recent changes I made
to the Arm PMU emualtion as part of implementing FEAT_PMUv3p5.

The important patch here is the first one, which fixes a crash
when in icount mode if the guest touched MDCR_EL3, MDCR_EL2,
PMCNTENSET_EL0 or PMCNTENCLR_EL0. The other two are more minor,
things which I noticed while I was looking at the code.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Mark registers which call pmu_op_start() as ARM_CP_IO
  target/arm: Make writes to MDCR_EL3 use PMU start/finish calls
  target/arm: Update SDCR_VALID_MASK to include SCCD

 target/arm/cpu.h    |  8 +++++++-
 target/arm/helper.c | 30 ++++++++++++++++++++----------
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.25.1

