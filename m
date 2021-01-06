Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp580441lfq;
        Tue, 5 Jan 2021 21:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr0L1HHk/1kMsHA+CcfDHz8G2PJWJAdEih7YW5zsShpBjNm/KHeeWySkZxuoXjuj3DsUac
X-Received: by 2002:a25:c786:: with SMTP id w128mr4156332ybe.322.1609912546051;
        Tue, 05 Jan 2021 21:55:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609912546; cv=none;
        d=google.com; s=arc-20160816;
        b=q5SNpgRLnNTwD2L0jGx1X4+cg7bYDhNuoGo3xQ01t4rVSIpKhZ4TnIX9G1hOuvcQcP
         q6iPtvxcfrmYBTP8vEfooadfVx9ixeFNVNL2tsiCrd5/YytX5E58s1FW42+sux1XRsNZ
         qt84Xl8q/vDHP5G4Wdc1eSBD2dzXVxucxK9C8nUYD6YSnxWTSXfmwsJ2qS+zPsAWZ33r
         D1EP9Rsoi4mlJRXk2aucXSz5ix7HZPByW+Bp0ApsToh4tIgdDwg3CDyDsRIRSZVyT5io
         GzAUkUuwo1afcrrF19pc3Sdmr1aYxhDZ8l/6zjY5NH8vNkojizIRuhW7BO1AQus8h0V5
         AVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=GoRyg9SHz3SU7GVb6+KfUus8j+YhS4cNFNlNjHUUGco=;
        b=pcKOxoR9f4YgadUmgj+kzofCzoa50pnakNOGcMxZcPy/LH640093WrOVJHu7oZilgB
         CR6qW3t71IFdAQEuQBALgZALp06f0FAlLK7OS01yUZS8BjbXlHSQ3iyau8CvhLvR6A36
         cVfZfYPSqZSD5g0d8fLhmkeijBJdg2l+PefyvQZ5k9AbI2YfHtML1VOkHAM9kCPlC0Qt
         XAGRt0cbyaaHUJ2AOz0zeDzEew4J8XyKoVeldUWB6Nlzw5y9ub8jch8NDvtN7JqTjTz5
         ddPJXWzUtR0j/JbxPjQ+cIc+6x206HTJxy91uBGy3L2cl36n/s+IUxlgnUjy86INwojx
         3/Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="B/jW2r+p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i136si1654275yba.368.2021.01.05.21.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 21:55:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="B/jW2r+p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kx1nN-0004og-Fq
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 00:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nF-0004oV-GQ; Wed, 06 Jan 2021 00:55:37 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nD-0004ux-Ta; Wed, 06 Jan 2021 00:55:37 -0500
Received: by mail-pf1-x429.google.com with SMTP id t8so1093201pfg.8;
 Tue, 05 Jan 2021 21:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GoRyg9SHz3SU7GVb6+KfUus8j+YhS4cNFNlNjHUUGco=;
 b=B/jW2r+pLXwu8clwVwOHii8sZ2Qg/M2UMn+Dssj+MxQJOJpKfJ3AsQr1An5TwG+Ddf
 ip5Xidu9OX/9pTRlmLBkKaNkRnb2/cLMQZiVZ6/M19toahn81p9rLxhZ7DTzwua6otSm
 6TsB2xL5DhUNMV9A69cLlbtYIMRTKwMOz9fXTlH+Z1JbHyY461XqutuM+oxf8b48NxDM
 UbI54xXMX/gwqPSvHtMhUWdB/E/+1QYi+Nz54YkQGAM80V6sIWHP/Kb3NJsSVpFZB01o
 R5S1yuiYFL07xKMZ/aoQnnbOszyDHJHBJP+/rrCPe0pEu01CDOU4tM3yL8DTH4rpsuPQ
 59Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GoRyg9SHz3SU7GVb6+KfUus8j+YhS4cNFNlNjHUUGco=;
 b=bSOhuMfhMjfB/boylPSgmpO46Zn5nP7CyV9nNYmE98e3K9lQaObMpUGr7wQvNSUbYD
 Oy7MvuTqgEdzomSaFWc5H1ZFYPB3NGtUDRpGg9zEvw/o/swy9prGky5aClMhYVJSPKU8
 AlSUMFJXuuc0ebv3Skyn/OBqs5wLpvskoq7t/TObhFIxqCdL+I+Wt2u4RHkA2rNBCG31
 plfgYO5kfaU2AUc8y22nEicYNN1YwkhkRvXKrXEIFpDLFDO0HJMBbBqRut7alaubTWbo
 Zd/VRAdYFPsYLKw8T4jHvz1eOL3UbE5FAVGIG6qXxR6sYrDiUpiO26SkIoIJEcP6fSWC
 Pt3w==
X-Gm-Message-State: AOAM530zhUZc7/mEzzDbEyB6JXQUxuVXkh6zEyKs1ESosCEMc5AJJq9W
 gGqkU9fAhfBvi6BrfzreKeo=
X-Received: by 2002:a65:6382:: with SMTP id h2mr2793618pgv.365.1609912533635; 
 Tue, 05 Jan 2021 21:55:33 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c62sm1070503pfa.116.2021.01.05.21.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:55:33 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/ssi: imx_spi: Fix various bugs in the imx_spi model
Date: Wed,  6 Jan 2021 13:55:18 +0800
Message-Id: <20210106055522.2031-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PxyYEXIvECog

From: Bin Meng <bin.meng@windriver.com>

This series fixes a bunch of bugs in current implementation of the imx
spi controller, including the following issues:

- chip select signal was not lower down when spi controller is reset
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

Changes in v2:
- Fix the "Fixes" tag in the commit message
- Use ternary operator as Philippe suggested

Bin Meng (3):
  hw/ssi: imx_spi: Use a macro for number of chip selects supported
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
  hw/ssi: imx_spi: Correct tx and rx fifo endianness

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects in imx_spi_reset()

 include/hw/ssi/imx_spi.h |  5 ++++-
 hw/ssi/imx_spi.c         | 27 ++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.25.1

