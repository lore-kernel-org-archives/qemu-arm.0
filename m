Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6831722lfc;
        Tue, 16 Feb 2021 14:46:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNGUCewj2krclx9UfqKf0g2a7LJqqOwkM27BBvRvWDrGJGcaNYR7wq2x9CeB0jy4pzM5vJ
X-Received: by 2002:a25:8006:: with SMTP id m6mr32898570ybk.336.1613515586675;
        Tue, 16 Feb 2021 14:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613515586; cv=none;
        d=google.com; s=arc-20160816;
        b=qy4XF10S96jQVZSDoeew22e5p8GMDllq/dbiu2h9Bd2VPf2Lh1Ji1rqtvyex0b0PcX
         4Wkw2cKTmJjbtmRDuqbJ/tFoUcl1IrWs84IyqWfoiGuUQuSDB5aGflpq59hoL816x8/X
         2BZ2RfAQVBKUXxgLDVEsDbxAG+gjVYZyCxvkXks44BC3RqKOgumAXDWzetDxHNBCUX0H
         T0dMN1WbdbyL5l3Fubow0kOP+wckILxZxOfZQGUC0duQxGPeDdTJOm1iXmXCkUAp4koR
         ib5AwH5DQXTgY4ENPJK7z6DJ0E86RWTaljJ7RpqWzVkz5dVyGHvNx7SViHzJBpEqNd3B
         fagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hrJrCx4IupfkxEsF5d43g+ctOQybqXDlHjJYCDnVPX4=;
        b=W1QOHx70nZf1q3HFZHP+7hGNCAHxhE1gRoGBMKXjKILc8llDo/bmHsDjmnwcUcQxdY
         1L16b+ymP9+NS/SxkZ6/F60Z87WONuvdhGJgvvbrMoIrW6f9DBLfbZE6AFcHmcBtUfKr
         PBmaRU5j3NjHZnAQjgGqbY6T+0xcXO0S29bULhIc/uURT+GwwRmw3NmwkxuxHI/VGYsS
         ZGdlHIcFgOmVFbjHqJgJhf+oN/9KMgcAgqfYFF1SeompLx+Chmv0YOQEp8a0h95kZ+t4
         xPIr1uCIAj0taUEFsvKHP4BWqmJdL+7zkVRTGWdpEUG2qUns/1ySzsKx6C4zEqO+4Ese
         wezA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=kuVMuxFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r80si383543ybc.88.2021.02.16.14.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 14:46:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=kuVMuxFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC96v-0000rQ-Vw
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 17:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96P-0000qO-FT
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 17:45:53 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96N-0004sD-Nc
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 17:45:53 -0500
Received: by mail-oi1-x22e.google.com with SMTP id f3so12894752oiw.13
 for <qemu-arm@nongnu.org>; Tue, 16 Feb 2021 14:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hrJrCx4IupfkxEsF5d43g+ctOQybqXDlHjJYCDnVPX4=;
 b=kuVMuxFJKSdcZ8S9+jzEIT/s2KsIGJ+KI2Lf0pxe1osmHZHiWu/pfTjWUp42JVmCU6
 qOZ3IpmL1Qq7B9AN3OaGZHiSS1/F2GVZzcV71sb1qDadMTEdIPkvbvUbM3O0ny28r+QI
 AR1F9zKJxJYXxrpbbRIW33p6rHugjOdgythG9R2SYFZDHLasr6FNQsoxE6Z4tbZ/oW8E
 h3k7rKig+bEGLSp/jmketsHJ2ZYja9c8KelVM7sZ5ulG1TBmVjoL/E+PTefpkGq/QU2E
 veL2EyrL1MIJki6Moe0MApUZcKR40Cekn8ycMsSyJ+TpvKhlzs2afXGY2S9QvdWuhlhb
 jVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hrJrCx4IupfkxEsF5d43g+ctOQybqXDlHjJYCDnVPX4=;
 b=CgbbRTAcCqHa+BqSkdkqUjhpffL+vYoW7ZOIGMJMQxQ/CHceejqlTV/VmuAlBhZbpa
 GOV36EcsVx7NLf5VgG8vR3pjet+eROiQuWnqvqv5NYxC9FWas9PHsddQ40TH0jEw5c5i
 wlxm4r/FFvWg6MR37N5NlCmLNFc7d0H2rIJEkP+ZCQ0811lya0KDJCbmq6iOvyDU0dYy
 SoWoHLJa4NzoMlvWQOBmuGIBLRKknrPEVPrYs74TGIo+QmbVKqGXStLL4I/McjM2vH85
 sMaBxNMkdYJEjb5zgJTrmlvXAMdHZnOf//uclS+47Irm2+LJ1JzoY6UJs9/J1aRZ3obm
 v+Ag==
X-Gm-Message-State: AOAM53271kaiqPo+0/wp/GfEqKl/Smqu1W3X0BkYGGZAlIN8foLdQt2h
 x4UkuvJBfvVCA3GxNiPZ9jHHn906HAfY7ECE6EbD+G3TmEF8FRVS9uBckbGR3Uu3zjVtM2Iprzj
 5h5T4AqrmwO8gSbfnMSfbYdNiQy5F4EqT3LKZuXd/sF2MpdlTiF0kWEn+TzeM/oYstvXR
X-Received: by 2002:aca:eb13:: with SMTP id j19mr4074829oih.10.1613515549906; 
 Tue, 16 Feb 2021 14:45:49 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b12sm32909oti.65.2021.02.16.14.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 14:45:49 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/3] target/arm: Add support for FEAT_SSBS
Date: Tue, 16 Feb 2021 15:45:40 -0700
Message-Id: <20210216224543.16142-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mqOJlCEbhAD4


Add support for FEAT_SSBS, Speculative Store Bypass Safe. SSBS is an
optional feature in ARMv8.0 and is mandatory in ARMv8.5.

Changes from v1 to v2:

o Removed changes to cpsr_write_from_spsr_elx and cpsr_read_for_spsr_elx.
o Moved the SSBS case in translate-a64.c above DIT to keep the numbers in
  order.
o Moved the check for SCTLR_DSSBS_32 in take_aarch32_exception.

Rebecca Cran (3):
  target/arm: Add support for FEAT_SSBS, Speculative Store Bypass Safe
  target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
  target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU

 target/arm/cpu.c           |  4 +++
 target/arm/cpu.h           | 15 +++++++-
 target/arm/cpu64.c         |  5 +++
 target/arm/helper.c        | 37 ++++++++++++++++++++
 target/arm/internals.h     |  6 ++++
 target/arm/translate-a64.c | 12 +++++++
 6 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.26.2

