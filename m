Received: by 2002:a05:7108:4017:0:0:0:0 with SMTP id a23csp2848198gdh;
        Tue, 23 Aug 2022 09:11:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5hz/wHj0NPvGJdxvzqsX+ZzPxPQ66H5MNY3kCPBdpVFs6FUzFC9t+0M1GJY8G8UW07DX9i
X-Received: by 2002:ad4:576b:0:b0:496:61fb:4cbd with SMTP id r11-20020ad4576b000000b0049661fb4cbdmr20336745qvx.99.1661271075297;
        Tue, 23 Aug 2022 09:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661271075; cv=none;
        d=google.com; s=arc-20160816;
        b=l18GMq9sDaydeNLgOztHOiXRnKG5mCljKpywR5MisM1YbbyjqoJR1+KjDJkfCVvlOx
         0Y8Fm3RV3uuWZsruSYKn15IZLSDIMNayyk+thXlRTTWrfh5sGe0tNU9feN/z6F7yu1ux
         BxC7OE2ZAFTt9r1Bk81GW+SxpQ+LxIoyHqF0bu1LxU96YQwqjlCHy/wPl69N4VHAlLly
         4ybNTjyYup2yAm7pi5iyvzRX8rtsOXf12gIzQJxY205ks16+wn/NVYseRoa4RjwVs3qL
         TvSyIBQAHaZBqpXtCvys9fHJsxKbrMsQZ1qUOpg9mwpzBwJYWnhueiL0Op2te/L576kR
         PpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=odwc231DP86deKRifEIobLYlw1+jkxDrWnt85X5IvVU=;
        b=wehXGJZ1sBmqfZWDwXWKx83He5JUoN04uJxpwZkZkOiAyvEnx3scMuPktZVcO9iVRw
         awCKLAJMqtA+IDgJvcVvUMHDFM1g99NArEVU7xFtqGsXVthvJf9u+s50ElcP3CnEqjzO
         CgDX00pPKn7nw96CIEqGfmNHZyooDMQHEJ4igT8ot22aWijg0RhOtbKNrtgdldhSsff4
         j8xxKl8eZ6GGsGHwQ1oLVF0KdwUB/mJcz570RgikaaldbxUSrxDl0RQmqSO5x9KfPaek
         kvSQdjziNYDM6OQIBkMns0SmZdSQeRqhA2FCEgyXF8ocEKD0gZunTz4aQVWsztErg5gl
         gSQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqYO2UAi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt13-20020a05621427ed00b00496e23138afsi2837102qvb.208.2022.08.23.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 09:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqYO2UAi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQWUk-0000aQ-RX
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 12:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWO8-0003Wz-84
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:04:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWO6-0006NO-4f
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:04:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id u5so9762557wrt.11
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=odwc231DP86deKRifEIobLYlw1+jkxDrWnt85X5IvVU=;
 b=wqYO2UAiYs2QSTbQbn4x4BBF9r/ft03RQVIgypOgI3q4De3bVxE54yIEyYtsS6tE+B
 byHY2ZYP0BH8jJYgiM4e4GlQ17pDjLiIHBxonsPvv4I3hIjxpSwPtId0MjXtrG53bO2t
 mgBgu8u56iiGVKErDMJhkEwuTDNziFHhcT1w25uaaeKE9RN5FOI4lEObdySLLCFsPkW9
 b6GX+jOX1ihvbnVNZQIm+79iFu5NaL2kFVoeS+6ogH6nAsXbQhfTkbVRTkJZwmFiFTXN
 geUKQOmMHRUI4GHVHkI8VpasSFf1W1AG5hWix1whvQJpaPHApuU9G0kQ5BKEbVO0RScR
 eDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=odwc231DP86deKRifEIobLYlw1+jkxDrWnt85X5IvVU=;
 b=t8sTJvHuQgpeXMMR8x3xvMSE8sobZZazzz0tJDBBDqoWSifTnh4/UQ1iKhWYNK7aqU
 SbbAe73UeyEyPV0oAbdgU/mPPMogpKUW+mpGoVL5cLHGSCwmzC6CtHy98srUAt0umSEk
 0+TEfinZMTNW6o34N4agBkvc4+NmPMxM02RwtQt1gPtoMirgMtHMpJtOd6U25bHuKKgS
 EuNBjSuy7F2ZX/KN9m7oD2YXnQqWvms09gN50/IcQXR7KjZWN0GuwL7rXGzDX29HUyYF
 /bR8r0lYagj3f7Ht8M2469sgLo7ymQBKQZp/5HjEDbaXOrNypItjczNFTMaDneS04aMl
 3euQ==
X-Gm-Message-State: ACgBeo2fpgUIH0cDJwzQ8dwdANmTZvkjgKKa2m/oDpeYEXBgqUfmFd9U
 R2bsSZsKFwIrBTchgyl7DalJgA==
X-Received: by 2002:a05:6000:186f:b0:225:5b80:d19a with SMTP id
 d15-20020a056000186f00b002255b80d19amr5119675wri.389.1661270659973; 
 Tue, 23 Aug 2022 09:04:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056000181b00b0022549ac786asm9152241wrh.47.2022.08.23.09.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 09:04:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
Subject: [PATCH 0/2] target/arm: armv7m_load_kernel() improvements
Date: Tue, 23 Aug 2022 17:04:15 +0100
Message-Id: <20220823160417.3858216-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G17b4e2v/Ddz

Two small patches to armv7m_load_kernel().  The first is just getting
rid of some dead code, that I noticed while working on the function. 
The second is to make boards pass armv7m_load_kernel() the base
address for loading guest (non-ELF) binaries.  At the moment we
assume all M-profile boards start at address 0; this happens to be
true for all the ones we implement right now, but it's not true in
general.  In particular the Teeny board has its ROM at 0x0020_0000.

I thought about having armv7m_load_kernel() be "clever" and ask the
CPU what init-svtor/init-nsvtor were set to, but that seems like it
might have unanticipated consequences[*].  "Just pass the base address"
is simpler and is how A-profile does it (though for A-profile it's
the loader_start field in struct arm_boot_info rather than an extra
argument).

[*] eg where the board has the rom/flash aliased at both address
0 and some other address, and init-svtor points at an alias;
also Secure vs NonSecure address spaces and loading...

thanks
-- PMM

Peter Maydell (2):
  target/arm: Remove useless TARGET_BIG_ENDIAN check in
    armv7m_load_kernel()
  target/arm: Make boards pass base address to armv7m_load_kernel()

 include/hw/arm/boot.h     |  5 ++++-
 hw/arm/armv7m.c           | 14 ++++----------
 hw/arm/aspeed.c           |  1 +
 hw/arm/microbit.c         |  2 +-
 hw/arm/mps2-tz.c          |  2 +-
 hw/arm/mps2.c             |  2 +-
 hw/arm/msf2-som.c         |  2 +-
 hw/arm/musca.c            |  3 ++-
 hw/arm/netduino2.c        |  2 +-
 hw/arm/netduinoplus2.c    |  2 +-
 hw/arm/stellaris.c        |  2 +-
 hw/arm/stm32vldiscovery.c |  2 +-
 12 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.25.1

