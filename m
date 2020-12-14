Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2385137lfq;
        Mon, 14 Dec 2020 01:19:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeVjusMDLTEGh2kvX/ExgeUS7WK/DWZw4Fax/NwdjM8NRrA8BaX4Jj2i/i71PaY58FqG86
X-Received: by 2002:a25:7909:: with SMTP id u9mr32261249ybc.333.1607937579216;
        Mon, 14 Dec 2020 01:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607937579; cv=none;
        d=google.com; s=arc-20160816;
        b=PhUVn0V2vvPWh2Dl7Y8s5wrGhg6rZ8B8D+g8gqnIaGGZ+Nx8imJHvlWKzv6ufoJVVr
         BdBEh0WyBrcmxS11PwP+OrzKranMf57CNalhpX6JV7TZQhfeNMMWZ34FsF352cqr32J4
         6qqrW1kVCl4JCkmM5d0laKPHeVqBjNzJuOFzwvvTb1Y25jR604Alk9c/EOCzS/Ekr+S0
         hbOkjgASGx/GW249ktdlebVvjpSUfsh8nKHY7VUVG7+Vb54kJJ9B3up9P3Bb4XdxZ5s3
         MqnusWSCbqPuWHJqEuIpybWgrLWzKGBqo66LZSSOq5cpr+rObZ4+EJ91N7aZfTb1mcLr
         gBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=LXmmfyNeF5iOU8Zl50wZ4tkbBmEmDUouL0wX2ax/b58=;
        b=bqATxiDMFEAZyMB+o33drqx3pqISfC6+tTgyme8ZPFSTcSl+8/dKkoKaX4RoXl93+D
         dWpDmV8ttFTSeUqIAQcVHf7hIz5Bw9XjxYOf+cwZ4UrUQ2uRQrd+cjQ38Y77KV3BBO4I
         64t3HQWKEoZgSt9kn0gv97ZR9vUncK0ejTa57RE1dNX/8XsuvkhozvcSZosIvWen33Cf
         ERs6f4cnbSnSan+V5Ns0yMhSao3USCjbmuZ4iewt36uqgRoFiiIDMpdm/f1+OI+dIyaT
         s4fPLmkhd0bWuHreXID6bZOZriIOCTIdw+bQ0gfRO1tWcLwiiwBvbKCS+iv03jYAf6A1
         EG+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YKxl8lUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si14956881ybl.131.2020.12.14.01.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 01:19:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YKxl8lUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kok14-00040M-KI
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 04:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0c-0003zm-I7; Mon, 14 Dec 2020 04:19:10 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:42180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0b-0000gl-3n; Mon, 14 Dec 2020 04:19:10 -0500
Received: by mail-il1-x141.google.com with SMTP id 2so15173699ilg.9;
 Mon, 14 Dec 2020 01:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LXmmfyNeF5iOU8Zl50wZ4tkbBmEmDUouL0wX2ax/b58=;
 b=YKxl8lUFrrCnYlX/avZaCXgDR5v/2OI1A4UvEoon3uJ18akTOhtpDFlwgkYw39V8fN
 op69ykk+A1dBegg6tPaKNTw4ShtQXi7y2GiPYC3P6h+QaZfj98Ib7gE6kc9u8UeZM/Gr
 bBHF5tsuhwURzHr3wVCHLmkazObFe4zIzPXystCUEKSXxzmzmFFblr2u7LJiVyPdLF1a
 bcxf9KcL9sEqXAa8YywQRmk3Q+eKEGNf8Z7OJ6YI4hbOT0rL1gT4aEYvm7v7fPrunxxf
 ZUdNb3zCNgRQ+FhFkzoYfuaKe4ldosnxguLdUZ+624RWfaTfUTs1ncUMzZwmQEvAk3gi
 TyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LXmmfyNeF5iOU8Zl50wZ4tkbBmEmDUouL0wX2ax/b58=;
 b=tIsULTMSPacMaeV4YdDpGW6eAPf5I8jzFr8zpeKfQWI1vxR4hTb2oexm24BPkvqsC5
 /uCbzpGi0P/dFtt2R4b7mti1rPh5RisUSMGuOr/zFcB6U0MKuLSKqeAEjnuBrdB/0CmL
 aCEbadzrDhjp+XKDivOGl3uih2rRBolMrWDzqVOPFvcKnTCdV/FPOw1z3Ho/4LTFtXQ8
 Ahb9bwOHUtxRpIsaNeFns0ocgePlBsUgWq46Dy26or9aQT2ROAtp1LMw0K9dt3aj19W9
 xZWYWPZzbHcA6zKfexoVzHtjXAaToT42uBtUopXLl99Qmx9fZ2yrLQOHJg5KAzxqUtMt
 SIAA==
X-Gm-Message-State: AOAM532WP4/HtPiVbY/b241kqRgyFgpGcCAjwprU/1f97rM5ztUZoL8N
 +iqbdab0E41SyerdUbYiGYM=
X-Received: by 2002:a92:d151:: with SMTP id t17mr34828287ilg.108.1607937547111; 
 Mon, 14 Dec 2020 01:19:07 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id o10sm11618094ili.82.2020.12.14.01.19.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Dec 2020 01:19:06 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/arm: sabrelite: Improve emulation fidelity to allow
 booting upstream U-Boot
Date: Mon, 14 Dec 2020 17:18:55 +0800
Message-Id: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x141.google.com
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
X-TUID: zLZk7pSCMErh

From: Bin Meng <bin.meng@windriver.com>

At present the upstream U-Boot (as of today, v2021.01-rc3) does not
boot on QEMU sabrelite machine.

This fixes several issues to improve emulation fidelity of the i.MX6
sabrelite board. With this series, upstream U-Boot can boot to U-Boot
command shell.


Bin Meng (3):
  hw/misc: imx6_ccm: Update PMU_MISC0 reset value
  hw/msic: imx6_ccm: Correct register value for silicon type
  hw/arm: sabrelite: Connect the Ethernet PHY at address 6

 hw/arm/sabrelite.c | 4 ++++
 hw/misc/imx6_ccm.c | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4

