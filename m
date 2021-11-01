Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2675304lfv;
        Mon, 1 Nov 2021 16:24:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVh3BJWC89cnerlOO5pEt2K/kGrmsqYsP4JrW9Xp7NtnihDAwsmaQSIl2QwnXfvKPOcOrD
X-Received: by 2002:aca:3e86:: with SMTP id l128mr1798226oia.111.1635809096977;
        Mon, 01 Nov 2021 16:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635809096; cv=none;
        d=google.com; s=arc-20160816;
        b=K/KTVAcPPhTZdNc1T0C5nc5vNhTeIy+U7JU/kmFCxT3IG4euzJwnCeEIZrKeFh883e
         HZaHQwdJe8zNYKdCK/fSpXTRcdO5smFyZIuX31HLbftF76rpD7UvkXfMAnV/BuWCmI5r
         NAwv6/Xi0O7NvtJikG8C2a6NbnSoMm05CkaZ+CTWD6DGd/7YL583UL4yaTDPFSgtTAOD
         i2OOSOf7Fo1Pr31NqXxOn1rVnT2/gnpYJKdd8iTxXuoD1QCjL1iWQSsP8+HqvDuMQ35M
         6QyTTqYaw5zk/gDZaw7Uqpi05DQmf2w1cGpRmRIsap1eMnhjV7krjmMr6VEuHcNZdWiL
         ijTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=p0U5B0j6kDEpX9NU9AVmzRUURoUpHs1zskZNtqaLUdU=;
        b=jtG8XoO98PAUOfOcjxGib24rSXBJuEXRWaAh3xbOOp4ytI3bJXUSiRBWbfI/kgk8ri
         QkLRtADnrWsY7Qqi1VjmSLf1qnjCwOEmOU+cDWzCRRRJDBqOr/YFPlQ0UrSUEPdQ00uo
         v7VkHcZtTNBNmNREh9v39GR7hB0ghTzLbJxTCzk4+MhiT0in7UPRbIjtrQg0hnBl8hH3
         YpwOmSYl5/q6JUIYen43ZYZDn5zLijvdQDP5AfuFeVWJNpX/k/gs3YOBatEr16KE/I2J
         oYzQFVgl5yRgFaeOYSYZ2iSISKtEwefuut1AOijyl0HjtOsNA6Aq3vTdUBSPSb+pEUg+
         u48A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=h5MUDVFU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bh2si13675417oib.292.2021.11.01.16.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 16:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=h5MUDVFU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhgfg-0001jX-85
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 19:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DHeAYQgKCA8B9wp387wv33v0t.r315t19-p61232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1mhgem-0001im-Jy
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:00 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:50913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DHeAYQgKCA8B9wp387wv33v0t.r315t19-p61232v29.36v@flex--wuhaotsh.bounces.google.com>)
 id 1mhgek-0002uq-NJ
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:00 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 h10-20020a63df4a000000b002a6ba425b58so5882622pgj.17
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=p0U5B0j6kDEpX9NU9AVmzRUURoUpHs1zskZNtqaLUdU=;
 b=h5MUDVFU8YnXF8Id5icCdi9D29HsS1QDxvASWK76hKxQmNIf50XscNr43EoxKvhShY
 nGSQSjPjT1NdnxxcvHcdR7GyXeg66IkGUyDucVTDwmLpodgGe5teDro6i6jCwvYCQeq9
 Ge2WgblBqvoIH6dJaOht+FDy0PR+6vwa5pNETzvOIcMmIznq2t51BBf+JX7Y+ksOga6d
 +RrDZxm3WvhuqIMGUh+FpNuU+r8tWfMjCn9ZoCaa1XQWUphVBGmFUBoYNIZk1WmHFbtA
 r4uzbcIFyuWYMLizHXLqL8bMVKcCwEXNcLU+3eDqeysvcMcM8Bh9wjg1l0PJBC2Y8sov
 McKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=p0U5B0j6kDEpX9NU9AVmzRUURoUpHs1zskZNtqaLUdU=;
 b=aezccTeKU3f8iBTec1kZstCLcJ7x1b/CNTvTvZoStZ7UdBaFwmQk+3cC7Z1sOafBvj
 ElEqWBxrumouZnZi3nIGqBuc96rXRp1PzjOMizLh4cGGbFyzbQUqHTDqcawxAyQI3ekI
 Dm3ckXuPb0B0pInbnDPu2IQKik54RcPz8x66mCUl+/HOW+lIGUo/T88tYJKxiTzLNSQW
 K80b4UbheghZWo1/77+UJm1GfbWv4d+6C18QWRn8WvCjNAx26fAyhephX5oB/QCX+lZc
 EMq06HffbAUeUZEmRRe56Ya5VpqVMN9cDTVB46HIQMoBfEbQP3nAevWP1k/DQEull/hA
 7d9w==
X-Gm-Message-State: AOAM531J9Q+cVi7SE5ZBrfYu7EmdO1XUu93ERicJj/fiLZaLVmiAJANF
 SOMgz4yZ/qWWV8fsBROjelXhVARuxsX8qw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:6411:0:b0:44c:bf9f:f584 with SMTP id
 y17-20020a626411000000b0044cbf9ff584mr31971260pfb.29.1635809036075; Mon, 01
 Nov 2021 16:23:56 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:40 -0700
Message-Id: <20211101232346.1070813-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 0/6] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3DHeAYQgKCA8B9wp387wv33v0t.r315t19-p61232v29.36v@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: JNJFv8+IbaA3

This patch set contains a few bug fixes and I2C devices for some
NPCM7XX boards.

Patch 1~2 fix a problem that causes the SMBus module to behave
incorrectly when it's in FIFO mode and trying to receive more than
16 bytes at a time.

Patch 3 fixes a error in a register for ADC module.

Patch 4 makes the ADC input to be R/W instead of write only. It allows
a test system to read these via QMP and has no negative effect.

Patch 5 modifies at24c_eeprom_init in NPCM7xx boards so that it can fit
more use cases.

Patch 6 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

-- Changes since v2:
1. Dropped patch 7.
2. Drop an extra variable in patch 5.

-- Changes since v1:
1. Rewrote patch 5 to implement the function in NPCM7xx board file instead
   of the EEPROM device file.
2. Slightly modify patch 6 to adapt to the changes and QEMU comment style.
3. Squash patch 7 into patch 5 to make it compile.
4. Add a new patch 7.

Hao Wu (5):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  hw/nvram: Update at24c EEPROM init function in NPCM7xx boards

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 hw/adc/npcm7xx_adc.c           |  4 +-
 hw/arm/npcm7xx_boards.c        | 96 ++++++++++++++++++++--------------
 hw/i2c/npcm7xx_smbus.c         |  8 +--
 tests/qtest/npcm7xx_adc-test.c |  2 +-
 4 files changed, 65 insertions(+), 45 deletions(-)

-- 
2.33.1.1089.g2158813163f-goog

