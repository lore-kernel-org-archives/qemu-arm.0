Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp645021ejb;
        Thu, 15 Feb 2024 07:33:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3AchU4HGLFoaizSI9O43FSRLcz4TssG7FCN5CBr7QqH10mJKpwp0QlkB9R7S+jM/Iqeg8Tp/19+2B1F54b7YGUZ9ZVfhI
X-Google-Smtp-Source: AGHT+IG8ySb4xBKD7mX307TwsEfXaAi9PgQ7CjDifb5MUVca8I9jcxR76N6EQi9PS/lmOAnVWI84
X-Received: by 2002:a0c:db11:0:b0:68e:fcc2:9771 with SMTP id d17-20020a0cdb11000000b0068efcc29771mr1946003qvk.18.1708011228743;
        Thu, 15 Feb 2024 07:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708011228; cv=none;
        d=google.com; s=arc-20160816;
        b=YRSPh3jytv1x+30vbNjvwnSwmUx7A98KmIioa1J35BHWyiXwDEmK0mBfNVJ8PHSEFM
         6SWPb+V/z4JHhbMsMRgcWYN6GnJ30+OgzL4BCe8823g7xFO4tXN2aqKLk9nYRQ5GeqHX
         3v6pDMCBlFvnOMf0egTe8iTqeApv//0bjfqWE4kl0eUHb5umETQSlZGb0Ol98z8sbUQf
         nSRuoYTRhyOqGc1ZG9fPxuQzW4s2oBFDcgXQ7+zfdXk8TPeaXpHwXacgKk1HSHd4cm0K
         bvII6xZYbz3XC6WoBhEy00/vS1H1kDl0+aDLy9CKMEVe7S0acXJHaneDDY6ko49I7FmC
         BIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=rQI3dKoe33nR7IvbUfLxfMHLbcxPgsb2607luIYy514=;
        fh=nKl8/G0rxCW7ugooXfO2GeaKcEIa1k4pK3AumDOEz4g=;
        b=ChDDcv0Ygs9AKZh0Vzq/1VRmxasRX+RMpR4PPmDSQ8UrSxwU6KDETocibrY21noyhc
         KN7mApGj2obemozPM5JzUtxMymgDZxjlkVT9eyPn8nRd1r8GteiMgI+ZyJdZW+dmX28q
         gYAMfMmlvotCbhGdvl782284ie9jYHhtI2zERasBtHzOND4LDZBFlqwFandLdV4ZRrm0
         Q3zb0hi8O7eSXTBg/5PiH5BKNbv9aMI0YQ9L6WGxyZvseOkAGi+PbtOeqQ+EZw2kLCsz
         x61p8YxsXcRAfh8iUW+gi3cur/7588+R2+IL8INZ5vYUe1A/lBsGKkrFegwNWKQJBuyP
         Vbrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq12-20020ad4596c000000b0068d14e840basi1639800qvb.101.2024.02.15.07.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 07:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1radk3-0003ke-Ad; Thu, 15 Feb 2024 10:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1radk2-0003ha-5Y; Thu, 15 Feb 2024 10:33:38 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1radjy-00021D-HL; Thu, 15 Feb 2024 10:33:36 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id C95E5261259;
 Thu, 15 Feb 2024 16:33:29 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id CC1a2OS8hMgO; Thu, 15 Feb 2024 16:33:27 +0100 (CET)
Received: from applejack.lan (83.11.22.32.ipv4.supernova.orange.pl
 [83.11.22.32])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5813826018B;
 Thu, 15 Feb 2024 16:33:27 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] hw/arm/sbsa-ref: Simplify init since PCIe is always
 enabled
Date: Thu, 15 Feb 2024 16:33:01 +0100
Message-ID: <20240215153311.186772-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 20LCyLFXAAlJ

There is no point in checking do we have PCIe if first thing after check
is adding PCIe card without checking.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f2adf30337..b7d6ba2351 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -672,9 +672,8 @@ static void create_pcie(SBSAMachineState *sms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
-    if (pci->bus) {
-        pci_init_nic_devices(pci->bus, mc->default_nic);
-    }
+
+    pci_init_nic_devices(pci->bus, mc->default_nic);
 
     pci_create_simple(pci->bus, -1, "bochs-display");
 
-- 
2.43.0

