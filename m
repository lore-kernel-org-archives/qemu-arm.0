Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2891580ejm;
        Mon, 24 Apr 2023 08:27:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ak/XqW09rVYWctig/8t6yscgdsfvoIgoJm8Q5YnLAMcAcuZVUASO4AdMeWsbbT/q9VSgdy
X-Received: by 2002:ac8:5dd2:0:b0:3ef:3ff5:ce28 with SMTP id e18-20020ac85dd2000000b003ef3ff5ce28mr25274883qtx.39.1682350058300;
        Mon, 24 Apr 2023 08:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682350058; cv=none;
        d=google.com; s=arc-20160816;
        b=mufhunSxR9QGDeedKfZvZcKBGTd8K/oxJaq7CGp9uz++a4W59T7gA9vssNWSgpZoeN
         XM2T9Qry9aucVk3jA2pi/JuPAbWvbl1EHsmPCT9nUy/WRoWA/4EMmgxwZkJyggZ9wCsJ
         NJmwVufZxVTHMXYVUbHl+IQN/ECZS8srJwmEcme4LjndyOxKRYDgyvuoiOuwot8vDi+6
         5sE/sYkgCJM1jD8uZOKUYcY/ZUNT+jeMcLfVRPAqNTqLsMdwKNT0/Rolt4nRQcQ4JB0+
         fzB6LxDAX2RfoJcZZV1IXidrDvPDZwkZHLUqLXmDFVeNUL4TCyMu/A8cZbA0wT/gr+Qu
         ouqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xSalvfnQsVLK8I+FBXVViucc3wM/l9KF4EOKeg2PWAM=;
        b=UqhJL+zOwIFO3EOoiT6z7jcGaEkPi/VCwgmKdLHSSYDqCnr88fENnpt9bnNsRu2YeZ
         O2qFrQ72nnp5S9XgpjSyU1lbOCr2RCTdfcaQNJwXHHVMneTWkHoA40J74zCFnnHsAmKN
         vUBzq5reAX+TcKJ0EpzK4oAIf/oNgvIWKxDWJQf7fOyBoGB8oFlECqaB/H2pVEeV6R1/
         tjU3t0iUgzWP1fOcq90m2Bsz8rePFDVaEJ9tnW13+gZlzUGbmgl7YcVzpCF8BMKe+GhF
         YEqGdCLT1JC8HfzUbifcbbptqTDGO5bnXsBQiV5v7TgMROLRl8E9yXkQurPrU7LhaC56
         smMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLhL1UN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a05622a118d00b003ef3af71c41si7355129qtk.681.2023.04.24.08.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 08:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLhL1UN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqy68-0006jI-Ht; Mon, 24 Apr 2023 11:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy66-0006ik-CO
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:27:22 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy64-0006sG-LD
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:27:22 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so2760390f8f.1
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350039; x=1684942039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xSalvfnQsVLK8I+FBXVViucc3wM/l9KF4EOKeg2PWAM=;
 b=aLhL1UN59zoeWERsyjR2sb2Uiw8sG9JvFRm4FNGE+Koyx6G+UdkE2lvKoDBsSrAXV0
 R+PbpY4ZeSZB1vYQdZUm3G0VFfdwSfD8R1hfZtooqkRPIteS75o+XEomYtV7CDdolqd0
 3DNmDRWXqn8pE62ku1KXW7GlXOgkROCkbVklVvLzWr3UF96A3Xi62eYxf9eRQb8s6GJB
 2mEbzTPXE9ec7sMfV/XZnNEG114q9+BSfWKOvBSPgpzMAtWUeQxT/EBeVaugWpwrE82Z
 lXI0R9IgaA4dBWLlCTtZMtdAedSEtIihP9K/b4UJfixGUh92ljdegK965FuNuuDkGmE2
 hRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350039; x=1684942039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSalvfnQsVLK8I+FBXVViucc3wM/l9KF4EOKeg2PWAM=;
 b=Cjvd3KH0q0mS6/p598iqqLIs/azUfbYADg0JFJFge1YaZdPflOGOyCqLNFdDZgZTu3
 NGm+Bk0lwYqud5I26jeFBcTp5twnEEYVt3NscF0ewtm5dLtK9HNYv+4JoS051lqkwN09
 8BW296rSwsThGJhliGqRI4EuGaLpR5DhUhhQj1kLrfWyVFMhW26jPTw+OHbwQ5w9aPDP
 ztHK1iBrVsr+BQ4yG3YvQblgIcR0GS9+e2vkKVTGfUI1Pm1rUHkD1jwwC0xLsmrczJXh
 FfVQZPDMK0yJW00EbwCQT1udUWoyqk7eqx7ItG1quSR5AodWyUBhPazUtIXqKSpBEnAx
 YHjQ==
X-Gm-Message-State: AAQBX9fVpREBnNuWfu5105F+0kMKTiSOaLWNM0MexP2kcNawnNIzhGXs
 oKa+D6R70LIfJULiuNy6MgDxHAPvE2fSqwNlJlI=
X-Received: by 2002:adf:fdd1:0:b0:2fb:ca40:e433 with SMTP id
 i17-20020adffdd1000000b002fbca40e433mr9340408wrs.35.1682350039207; 
 Mon, 24 Apr 2023 08:27:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b002fdeafcb132sm10971517wrs.107.2023.04.24.08.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:27:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/3] hw/arm: Fix raspi, aspeed bootloaders on big-endian hosts
Date: Mon, 24 Apr 2023 16:27:14 +0100
Message-Id: <20230424152717.1333930-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6TcKvHyaIjjU

Both the raspi and aspeed boards load their secondary CPU bootloader
code in a way that only works on little-endian hosts. This patchset
fixes that by making them both use the write_bootloader() function
in boot.c, which gets endianness-handling right.

Patches 1 and 2 are essentially a patch from Cédric from a few
months ago:
https://patchew.org/QEMU/20230119123449.531826-1-clg@kaod.org/20230119123449.531826-9-clg@kaod.org/
I've split it into two patches and tweaked it a bit.

These fixes let us run the avocado tests for these boards on
big-endian hosts.

thanks
-- PMM

Cédric Le Goater (2):
  hw/arm/boot: Make write_bootloader() public as arm_write_bootloader()
  hw/arm/aspeed: Use arm_write_bootloader() to write the bootloader

Peter Maydell (1):
  hw/arm/raspi: Use arm_write_bootloader() to write boot code

 include/hw/arm/boot.h | 49 +++++++++++++++++++++++++++++++++
 hw/arm/aspeed.c       | 38 +++++++++++++------------
 hw/arm/boot.c         | 35 ++++++-----------------
 hw/arm/raspi.c        | 64 +++++++++++++++++++++++--------------------
 4 files changed, 111 insertions(+), 75 deletions(-)

-- 
2.34.1

