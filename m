Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp368538lfp;
        Wed, 13 Jul 2022 13:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smEGQ/vzHH8HQSzTNhrdDYYZhA9taj7hs31Ny+dhHoiWK7IVrYjOIY8jLOjXGWG/MF9z8e
X-Received: by 2002:ad4:5bcf:0:b0:473:75b0:e8fa with SMTP id t15-20020ad45bcf000000b0047375b0e8famr4925419qvt.53.1657745186176;
        Wed, 13 Jul 2022 13:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657745186; cv=none;
        d=google.com; s=arc-20160816;
        b=zoJOaTgYQN0nyxVFumhNH9I/iQnTmV8dA19vhx1YH7/Uis54y/OuSIet3YoLR1Xvwo
         T4Bg3hf9l5ybnd+Hn0ThgdYWQPtdj5kSB1g6Zp03iWfQ51JCyWxncEzzNwewIYEL8BH8
         QxwwbOjs+PxIY2Qvc89gl7YtxB3ybGvs8ueYiCqUEvuOHtSxUK74ebK8iNHlOu/iW4Ui
         hok2z2U4vpkCeuAE8b0/jztn3LzzJ9mqn/p1VzD53U5ti+4N/9ffEwJz8a2L8PvsNKTX
         szDShtJupC1hvJVxoehHETbjWceV663FfEbi0VDyKvNjlV/HFellDM24mLXHz878MkZ0
         plhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=CR4E5X+vDJOT74Bz3AI3F+4skqbv2D/QtU9jph6gSwo=;
        b=OkmVQdyX12lwEM5IDHvMvSfBMAJl5absKzPiiIjdj67tVkw6cW/XZqWiBA0T8Gt2yh
         TY/OFCSYxm3TX0FS3VqxzdNrbhstH/XP6yhvK9r1hBdTX3F1qZ98BA+m43+Gktv+s1Ji
         vuB2uU/EIfiCiVEk4ECpBbQJW5BIayQNjZy9aF1YBhaLrVdP3XDUCbQKHoAoJdBd1Bm7
         QMseNLpf0VuGiF34gyLcZUO7MgWFbQfazEIlpGw1muZMfkEM6S+PqaMiiJRb9ok3pPzI
         0prC/S3JKlKEvlcyEJid93JU3fhxH5zbCXNS7D6cBjgO6FrE30HebM9DjCKQAh2ZgOBu
         fGSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127-20020a378685000000b006b28c9d8056si7157416qkd.192.2022.07.13.13.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 13:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBjFZ-0004sZ-Em
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 16:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwP-0006c7-SW; Wed, 13 Jul 2022 13:14:25 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwO-0003Bp-FU; Wed, 13 Jul 2022 13:14:25 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8m-0n; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009kk-1f;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 2/7] pci: designware: fix DESIGNWARE_PCIE_ATU_UPPER_TARGET
Date: Wed, 13 Jul 2022 17:54:44 +0100
Message-Id: <20220713165449.37433-3-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:07 -0400
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
X-TUID: 0LrYSkvABMsu

By inspection DESIGNWARE_PCIE_ATU_UPPER_TARGET should be writing to
the upper 32-bits of viewport->target, so fix this by shifting the
32-bit value before the or.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 296f1b9760..d213d7324c 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -365,7 +365,7 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
 
     case DESIGNWARE_PCIE_ATU_UPPER_TARGET:
         viewport->target &= 0x00000000FFFFFFFFULL;
-        viewport->target |= val;
+        viewport->target |= (uint64_t)val << 32;
         break;
 
     case DESIGNWARE_PCIE_ATU_UPPER_LIMIT:
-- 
2.35.1

