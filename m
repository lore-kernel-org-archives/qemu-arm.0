Received: by 2002:a05:6214:acc:0:0:0:0 with SMTP id g12csp1604533qvi;
        Thu, 22 Jul 2021 10:54:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz20UeifSESo9iswLMD1SDxSNL8toB6DsSSHx/RC3qzsMh4O8F3Sk2V4hhJfeaoyCrWtLXQ
X-Received: by 2002:a25:fc0d:: with SMTP id v13mr1041269ybd.184.1626976479129;
        Thu, 22 Jul 2021 10:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626976479; cv=none;
        d=google.com; s=arc-20160816;
        b=p/TFHfSOcyMHmRjq+05MY5NVFxTIDUPH0Hi+sgTpuRc8WJa/Hmvox/CSceIeiR19qn
         g5+B0vBpLPHCSSesY1wZGtFKn6+JokPNgNaH6iFYUsffD7Pfno8bWZ87FKcdPHFmDxzD
         pCfLzAOR3Jz4OyLgXDCLee99h98BAU1CsLofbW22WQwIcWmnKSZHNddJ5liGmmuZu+Hb
         4SjKS7m+wxoxsv0lR+V3eaYPduSr8P5BlrpRj8jZz3HmKZM9LW9sF1K0gq0MpRT4RJ2J
         OAS2vaZodgc6FqXOhRQrnAXkCdeWS5Zpb2aheR3sDNfBT+QQFnUsebrCrhc1D0OEa5rb
         i2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8+GjQHA/86gBeSic8mJVE0mbJv/WFN9BdhNr+zuh/Q4=;
        b=rBYq91KwK5JvfA6SnQXmkekFABjK9Q0XraVxcxcO6uL3kaemElhe9KsfDInT/9eRii
         9/Dc+91G5fDNwLVq2bW/gH9iR94eVk+xYAZkTQcpkAdMMKFhj4ZLjCouuRlJHWc9q2st
         5pNhfjL95Z6Cp7a09ZDJy8jZBFAjfICKW8BduKgFB2tizJeV5uMVu11GkU9K7MrzdMiu
         vmlk7QE6f7R1kiWWDTk4Akvg5ltBHe+RZJ/9pXFmR1h2wzdaNc5wInoqWUc4HBHgemW4
         fLbrIhdQdtogwSjW6zWf2x6247FFYJz0zNN5y9Vi/kUQiSCcajkovESIy9PNah0KEGSK
         be6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLEy3TZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si34932606ybp.333.2021.07.22.10.54.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 10:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLEy3TZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6cu6-0001Xv-LZ
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 13:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs8-0004M6-G1
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 13:52:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs6-00020T-Az
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 13:52:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u1so6850221wrs.1
 for <qemu-arm@nongnu.org>; Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+GjQHA/86gBeSic8mJVE0mbJv/WFN9BdhNr+zuh/Q4=;
 b=gLEy3TZh8jWPkcj6IlbdYyL1XSiY4rPI9fvEmitTJBjdEI+p59wHagVforq4WBwBdB
 y/TOI1HCvfCNYyL/mirOhy6BIALcoOfV4p5TEYirecQlEzASN6T0Frs7WfVLx3huPQnw
 mF4oS374kBJ49CzCBbJqsZcGWL3gKLkephanVMGdt7nLxfG2u+H1hmOEVm5YI6i4zymQ
 xxzCyimf6r1wFZ8stMaXFrSGPhM5WbV7CApB8rUSADBeTzLy8bmQ8pi1D/rZz5+/MgmN
 uMb7SK/FUHhCW08hQYYu+yYwHBIpx0LIPHOTthvAKpdQQAMgAZNf5zvJ3F7KJwMPrTnT
 IPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+GjQHA/86gBeSic8mJVE0mbJv/WFN9BdhNr+zuh/Q4=;
 b=FTWN6OrzBEESlp1/tcfHsGNqiL4H9t6GmB9uUKfsqKYiJv47ktR8lODDcxTC54zYrb
 az3d3dzEMM9TiNztg12rOhkjxcSgBriDvVyE3wdJcl52OeHyGrHjrnQ1bDpthRyJHrJ1
 lfZklT62qHQVLp8xq97Sr5BUa4uEUulOL6ebL2/YfEEihnOQmd6OB4mNcPL0Zjb43X9H
 pvnNpQii1wTEp0E1HXqXe8uNYKtbMIjH+Rw3/UJwzVxsm+Sjy8BPS265ZUO0tzIe4lSW
 7jw2ywZw6M3Wueg7K57yzrn+K7u/inHzIHe2fwiGKuPiTVYZ/MhuF2N2ZbzBW3qZ6Ze4
 0SlA==
X-Gm-Message-State: AOAM530Vl8pAXYjdWPkcxHiQxi1ktrtz9KzBXdWgWJMrW2FR9UfgVQq5
 0gpucQPWql0aK5Q0gUU8nenvQDOI06Ek9Q==
X-Received: by 2002:adf:e7c6:: with SMTP id e6mr1125245wrn.221.1626976353110; 
 Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s13sm30278651wrm.13.2021.07.22.10.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 2/3] docs: Add documentation of Arm 'kzm' board
Date: Thu, 22 Jul 2021 18:52:28 +0100
Message-Id: <20210722175229.29065-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722175229.29065-1-peter.maydell@linaro.org>
References: <20210722175229.29065-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TR5APPtVuIDH

Add brief documentation of the Arm 'kzm' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/kzm.rst    | 18 ++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 docs/system/arm/kzm.rst

diff --git a/docs/system/arm/kzm.rst b/docs/system/arm/kzm.rst
new file mode 100644
index 00000000000..bb018fbdf7c
--- /dev/null
+++ b/docs/system/arm/kzm.rst
@@ -0,0 +1,18 @@
+Kyoto Microcomputer KZM-ARM11-01 (``kzm``)
+==========================================
+
+The ``kzm`` board emulates the Kyoto Microcomputer KZM-ARM11-01
+evaluation board, which is based on an NXP i.MX32 SoC
+which uses an ARM1136 CPU.
+
+Emulated devices:
+
+- UARTs
+- LAN9118 ethernet
+- AVIC
+- CCM
+- GPT
+- EPIT timers
+- I2C
+- GPIO controllers
+- Watchdog timer
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index ad3f5f435d6..d423782d661 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -91,6 +91,7 @@ undocumented; you can get a complete list by running
    arm/musicpal
    arm/gumstix
    arm/mainstone
+   arm/kzm
    arm/nrf
    arm/nseries
    arm/nuvoton
diff --git a/MAINTAINERS b/MAINTAINERS
index 47ddcbb7f7a..063d8e07b75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -694,6 +694,7 @@ F: hw/*/imx_*
 F: hw/*/*imx31*
 F: include/hw/*/imx_*
 F: include/hw/*/*imx31*
+F: docs/system/arm/kzm.rst
 
 Integrator CP
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1

