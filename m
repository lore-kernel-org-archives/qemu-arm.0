Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp585069lfk;
        Fri, 13 Aug 2021 16:34:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsQbpl1LiobB7Uk1SOEVYuFfrIRnhsUcXfkR7gMlDjWUzulRTK39SFOudYVPf7VczmkARw
X-Received: by 2002:a6b:e713:: with SMTP id b19mr3870798ioh.19.1628897685368;
        Fri, 13 Aug 2021 16:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628897685; cv=none;
        d=google.com; s=arc-20160816;
        b=viRoV07haD9NE1orNQhWDuiOGm4Uk8ZYZ1tSg4kkDQ5OP9DNo9f+7FDLI73hH0Fndy
         cfZd4qEy1ykL9YUkgxWck5kw0u40TM3gG7bjYWB1y2J+nRDGaXJHv2El7iwysQ5J74Pf
         p4Aw3VOrpv5ce+NI5q0FPsBnFF/OO93NM35zr3o2s0v6Z4qWZzPZi8abj8tu2e2GLu9F
         3mg5okYtk92e3wIou5Zz9GG1Uxfb4+iv4dC8KPdK8Oh6f3D8sKkjQaQsRlhcLX8r5LLt
         svZEW75KvnN4sZjcoCFv0oMTZQrUyH8CcXgNMoTwHxb+++UzQzKCLGTlMuCikOnssmEI
         6pXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=5s+o1TXqGwSl9K0mTlvFrCxk1BgY+M7oLFuEuHiZMIE=;
        b=FiXefObe7Pw6N4D1UsI+GTOu8STDriEgxavkm8QCpOMEkTexCN1OTPt5W3qoPV7jfk
         DNjM/7byXMKNmUC8u+7w8e8koLlW0bGepKW6knM00bNtWCPi43/OB8z8KbFQQySrV39t
         OEz8mQYrZ0rKUcyL93lDhgTMA8dQqTpeCBCav72jMe7eJdfGMf/Gc6TNIdJ2emHJvVZO
         p34OIr/QjwE6Nol2cowZTFQDub+ugXWRQGvHRoV9F73dKo4S0LLlKy0cklufIzjA4qaN
         ph4eIuu6ZV8rcn6J/0f4wBtSwQ0PKLPwaeqja9PSAUluLRh6ExVz4w2faU2kIfJlvUE2
         Z7zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Hyf0epYa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si3342373iow.30.2021.08.13.16.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 16:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Hyf0epYa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEghI-0003ZR-KY
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 19:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gwEXYQgKCPAomZSglkZYggYdW.UgeiWem-SjefgfYfm.gjY@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh5-0003ZE-9j
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:31 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:41579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gwEXYQgKCPAomZSglkZYggYdW.UgeiWem-SjefgfYfm.gjY@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh3-0005s6-Qw
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:31 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 j9-20020a2581490000b02905897d81c63fso10646584ybm.8
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 16:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=5s+o1TXqGwSl9K0mTlvFrCxk1BgY+M7oLFuEuHiZMIE=;
 b=Hyf0epYat0y9ikTQhtwD9FCcq/vA2IjERay+gGsMWCQ7QrY9noh3xfRNYyglP2aIYH
 30o6M4n09aEgfegiLjvnfF6rOFBNhX16wzSbZVaRVkMZjRLJXFhNE7W7VR94JUnsPkjB
 4t2uFhh+WQ7WBdhoEDWuDaX2dHDaqwB7GN8OtwG1DiSDytJ048MDNlAl5RC17vHtqDov
 eIb6Sh6fN3hcD4HdSTNxs+vS597vmrugfAHIzi26u/ztzc6eh/YnrEcY70Tv8YiP6aNZ
 0V5yqcdHITTi/d5WJmXBoIkLZMseDOw17BK19FrpmWCXgXEjmuFfznRhOecA0OzE6k/j
 6z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=5s+o1TXqGwSl9K0mTlvFrCxk1BgY+M7oLFuEuHiZMIE=;
 b=pwWzRJNMhsQrheu475IFZ2p6TCbXgtpxeBfD1OvSiMvL8U2jl9NMW8D3oxneGAkT/M
 Rh0d2DjiJT4w17OCz6B9kenZpTOSFeHCc3H75rkvpt2LuuYakSJE4bu+Rhe8LTr4OCml
 k0xufSGZVNZiyB+Z57Imy69S9cLRybd+HZ6O63spM5jNBFD8cihUFFt6dgy78nrQCQTU
 dBBrT9wzpviyVH9qrkN4yADPo8AGfk9xzONMGnL5rWwGXnC6GgwdpvcSYb//qFE+cI4h
 JqXz27HPfvGdsRwEOQTkuQqye44G+eZf1ApqLo1zIrx5P+wpRh+eMrJYZae0YTe0Q2y5
 mVcw==
X-Gm-Message-State: AOAM530kqLG3y5F5wVzOx1U117d/+X2WPEQArqOsxdg+5VQvNtRo0kjf
 mhC6jLjOaTjHngVcGMaoWd27XLYay+dOiA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:2783:: with SMTP id
 n125mr5820983ybn.99.1628897667371; Fri, 13 Aug 2021 16:34:27 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:46 -0700
Message-Id: <20210813233353.2099459-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 0/7] Misc NPCM7XX patches
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3gwEXYQgKCPAomZSglkZYggYdW.UgeiWem-SjefgfYfm.gjY@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7yY/VNce3CWI

This patch set contains a few bug fixes and I2C devices for some
NPCM7XX boards.

Patch 1~2 fix a problem that causes the SMBus module to behave
incorrectly when it's in FIFO mode and trying to receive more than
16 bytes at a time.

Patch 3 fixes a error in a register for ADC module.

Patch 4 makes the ADC input to be R/W instead of write only. It allows
a test system to read these via QMP and has no negative effect.

Patch 5 adds a new aux function for at24c EEPROM. It allows us to attach
a drive to an at24c EEPROM device that is used as the initialized content
of that device.

Patch 6 uses the function defined in patch 5 to add the EEPROM and other
I2C devices for Quanta GBS board.

Patch 7 modifies the Quanta GSJ board to use the new function defined in
patch 5.

Hao Wu (6):
  hw/i2c: Clear ACK bit in NPCM7xx SMBus module
  hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
  hw/adc: Fix CONV bit in NPCM7XX ADC CON register
  hw/adc: Make adci[*] R/W in NPCM7XX ADC
  hw/nvram: Add a new auxiliary function to init at24c eeprom
  hw/arm: Use unit number in quanta-gsj eeprom files

Patrick Venture (1):
  hw/arm: quanta-gbs-bmc add i2c devices

 hw/adc/npcm7xx_adc.c            |  4 +-
 hw/arm/npcm7xx_boards.c         | 94 ++++++++++++++++-----------------
 hw/i2c/npcm7xx_smbus.c          |  8 +--
 hw/nvram/eeprom_at24c.c         | 18 +++++++
 include/hw/nvram/eeprom_at24c.h | 13 +++++
 tests/qtest/npcm7xx_adc-test.c  |  2 +-
 6 files changed, 85 insertions(+), 54 deletions(-)
 create mode 100644 include/hw/nvram/eeprom_at24c.h

-- 
2.33.0.rc1.237.g0d66db33f3-goog

