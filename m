Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp368534lfp;
        Wed, 13 Jul 2022 13:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvHI8bM6jiWDKk9pD6lYOLA/U+soT0IGDrCpZTfIVF4HxzAffjgxRSv+69Uq8mZ/ldAuyx
X-Received: by 2002:a05:6214:27e3:b0:472:ece6:3af5 with SMTP id jt3-20020a05621427e300b00472ece63af5mr4891539qvb.63.1657745185704;
        Wed, 13 Jul 2022 13:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657745185; cv=none;
        d=google.com; s=arc-20160816;
        b=Ys5ZjiuBD8rPvqazRm2yMvhPxwoMWwASTcyxgbsdtEgZh1zmcOoYDkSLv8yIaWc337
         3+HhmvtjxBhqrcEq9B00gn2tklAGVppn+cAGFkMWXx3C5uCykl3PifQANQnNlyZrJHXi
         +26FKF3N1foxQaPO4ZglPRqlxx9Onr9kEOOr6WnTZnQcOyFhqTicVaZlVuIjnLhU0c0J
         +tu2kSU4QILj+Tnh225mtzogJtR36OTeoOGYYpuLaxNqLCmGoIIwkd9rTvUuch9c6uUt
         g1/87wEL9WNirtjRoc7d3wSFRzjh7SltZyCs9gd11bYdVWWinM33hhRwi0VPrXZFhpiV
         1vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=tK06T2W3+JLkkMe2S91NVgB1xmT4qcMzcP0oc2eKE/I=;
        b=ikUnKqJSH9N4ZiuWwKAmWuLfl9RBLBpr4XCxVigPl9KRCZ8AY95iqWYeTwnjS6zxD6
         4GbECwrz/WPDh1jwiDxpx62mlo+8MCHrecaN/mApGBtuc0j3PWuxph/dynnvX/vOzhqN
         uq3ShfNLPEtqevRxFwHDQ0ua2r5B8jquMr5Jg9H/KV1COa/PD6GbAPqld1xGrLME8EkF
         Xw3HCGhVmut4dGGxPnMRQcnXbOBFXiXwGQtqvTt7ZEzUXSJs6y8n4JVdUR9ALsP6wXOk
         F1tS6AhtgAqVHWBBnxuU8zeRN10sGh8wxvez3aiBM09etaUCbotX3W2UgnjP8CbC6h10
         9glg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020ad45dc6000000b004737285613csi5501366qvh.405.2022.07.13.13.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 13:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBjFZ-0004rw-5k
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 16:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBg9w-00044N-8M; Wed, 13 Jul 2022 13:28:24 -0400
Received: from imap5.colo.codethink.co.uk ([78.40.148.171]:53198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBg9u-0006uS-Hi; Wed, 13 Jul 2022 13:28:23 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003eoU-Hg; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009kx-1t;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 5/7] pci: designware: move msi to entry 5
Date: Wed, 13 Jul 2022 17:54:47 +0100
Message-Id: <20220713165449.37433-6-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171; envelope-from=ben@codethink.co.uk;
 helo=imap5.colo.codethink.co.uk
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
X-TUID: bdreP1sfrfD4

The driver should leave irq[0..3] for INT[A..D] but seems to put the
MSI IRQ at entry 3 which should also be INT_D. Extend the irqs[] array
to 5 entires and put the MSI at entry irqs[4].

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c         | 2 +-
 include/hw/pci-host/designware.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 947547d153..b5d5b2b8a5 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -56,7 +56,7 @@
 #define DESIGNWARE_PCIE_ATU_UPPER_TARGET           0x91C
 #define DESIGNWARE_PCIE_ATU_UPPER_LIMIT            0x924
 
-#define DESIGNWARE_PCIE_IRQ_MSI                    3
+#define DESIGNWARE_PCIE_IRQ_MSI                    4
 
 static DesignwarePCIEHost *
 designware_pcie_root_to_host(DesignwarePCIERoot *root)
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index bd4dd49aec..37f90c5000 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -90,7 +90,7 @@ struct DesignwarePCIEHost {
         MemoryRegion memory;
         MemoryRegion io;
 
-        qemu_irq     irqs[4];
+        qemu_irq     irqs[5];
     } pci;
 
     MemoryRegion mmio;
-- 
2.35.1

