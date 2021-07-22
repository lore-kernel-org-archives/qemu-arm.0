Received: by 2002:a05:6214:acc:0:0:0:0 with SMTP id g12csp1603984qvi;
        Thu, 22 Jul 2021 10:53:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlk968Uz/1C84F3aSbdd3tul4ZckEVmOs3La19JAgMNPCr0WSDnGx1dijlIpk4m0+9NnF8
X-Received: by 2002:a25:ab8b:: with SMTP id v11mr961137ybi.375.1626976433198;
        Thu, 22 Jul 2021 10:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626976433; cv=none;
        d=google.com; s=arc-20160816;
        b=kNMYfSK13/n0c5xZ9yvW9LP7yfL3NAR0FofF3QdUHmAmhw5mFZsNPOOq6VoY4UA0SG
         dJ5LNCe6RDEd3AfafNrBQaEXpXDPr4SjEgf+EZ/qC41sveZ/hkcBC0PtYDd2AeJQf5mn
         fNeFA2d+PtLXz0ZNA1Oavwd/CaXryU+6tlZ4pX8+kiwOwqlUJ2GSUF1U4I8W/7iweCW2
         c72RH0qf8jVRIrOfCbn6n0Gi41t9nfIAH6eUye+sl+yH7LaL2XlWNoCdsOC8/wOiPjbp
         W3XbjNTia+1Jf0drqNllBrKcjGHphkg/EgSL1Rk0doDosbQWFrCqBxxPV4ySevjv6QwH
         /CQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=74AMX+VajwPc+ookRW0s5hdtSo5qMBlwijgEZGDrXLg=;
        b=GwgsY2KxVZRCLXNjemkxBhch1Y2lzSR+Cz+9/mQZgRGqAy6xbP+IOgwmi9Am7QtTVG
         ao8v9eB5Y1D6SoWI1YxBW1b7UjO4kOJWln1fVYm5ff8TKHubqEDOhUPjP9JztplOjBCB
         lHluaxb9l8rH/IG1VIW75S5PrS1o1Mx9B39v00bs3ETGhV4m7LcwVTzejtSNZwRVHExV
         Pr5aUOrh+FoDJU+zngSCgDvYbkIhVDdwWIFpBOovUgCntaJ0prZe3eZF0PinZkpwVh2M
         80+bEge5SB06gtC2BMWGSdqf6c0xkCxSJ3aduXI+EY2+0PhW4skNR1UxgytN4cZOFkAO
         O8pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXNUT8Jm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si31389613ybp.356.2021.07.22.10.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 10:53:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXNUT8Jm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6ctM-00076V-LZ
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 13:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs9-0004MW-E9
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:37 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs7-00021C-5e
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:37 -0400
Received: by mail-wm1-x335.google.com with SMTP id l6so3849362wmq.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74AMX+VajwPc+ookRW0s5hdtSo5qMBlwijgEZGDrXLg=;
 b=ZXNUT8Jm8w2XlQ7sMGfmybUMLbYwAjAduQMr0QJFcbgjEQV52LuCALEQUrEhKmZDIr
 ZU9Gb16TSKsN9sP5uwl01oCUu7VJeFeWZ9lehTdwQDX8DklAeCD9ucDwV57jxT91LY4F
 BTvG5wH25pe1nxgW3/NWArR5EWZ/e3aN2hqey0luZxvQaS0kTx6aKLqWg6G/3Mm1f44J
 4vuQsP2i3JnVvRLIwMQLABqx6sz3S7KUGUekFTHYBVozqWvZEPchMNonZr1L3z9TLMgt
 BUpPRvZOQIwPnduUDgvX6h9FjL5EyQiHW6WhpbH9Eqr//xpijqwszAI/vGnvOWSyna4M
 Cp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74AMX+VajwPc+ookRW0s5hdtSo5qMBlwijgEZGDrXLg=;
 b=VNcRAeUcCjjLhc4p9WdU1+PZN8mWEFNqUY1G/f85FBkfZdJWdD+kTUTxKSBFeqHVnV
 Ox/J4RZfsB4jGkIvLSD7dkeLt5witJPd01JDbcOukXzroJ7U+JDh4lVeE3k4vmSeQWoD
 0l+G5y8cQ3uyy/53u7E5Lhsobmp9ENkmp2rfaQrtpLNKCPTFERq2XXjpM4tNXtTPvhc+
 U4kWdVHn6mXxBV5bkU4kbu0wJFAk1yNNWiHm5XEPJ8GipJ9PamTRKsCLPJfV2BwLNXCT
 ABGhxiqq5YV2H84MzC2Z/+KNKULAa9+VJeLI7qJR3KUT1KqpVOxp4W89aSojEmwzRII6
 j0oQ==
X-Gm-Message-State: AOAM533EODGJnOkMPVbKE+7YTAQ5ESwZHF3ajbw5dUcm2NpWbJ8X0I5/
 z1gIY7ELfNZjE08BAA6L/YDBo/tfmWe0VQ==
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr732538wmj.176.1626976353748; 
 Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s13sm30278651wrm.13.2021.07.22.10.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 3/3] docs: Add documentation of Arm 'imx25-pdk' board
Date: Thu, 22 Jul 2021 18:52:29 +0100
Message-Id: <20210722175229.29065-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722175229.29065-1-peter.maydell@linaro.org>
References: <20210722175229.29065-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CvrePrkBu5qp

Add brief documentation of the Arm 'imx25-pdk' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/imx25-pdk.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst    |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/imx25-pdk.rst

diff --git a/docs/system/arm/imx25-pdk.rst b/docs/system/arm/imx25-pdk.rst
new file mode 100644
index 00000000000..2a9711e8a79
--- /dev/null
+++ b/docs/system/arm/imx25-pdk.rst
@@ -0,0 +1,19 @@
+NXP i.MX25 PDK board (``imx25-pdk``)
+====================================
+
+The ``imx25-pdk`` board emulates the NXP i.MX25 Product Development Kit
+board, which is based on an i.MX25 SoC which uses an ARM926 CPU.
+
+Emulated devices:
+
+- SD controller
+- AVIC
+- CCM
+- GPT
+- EPIT timers
+- FEC
+- RNGC
+- I2C
+- GPIO controllers
+- Watchdog timer
+- USB controllers
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index d423782d661..91ebc26c6db 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -95,6 +95,7 @@ undocumented; you can get a complete list by running
    arm/nrf
    arm/nseries
    arm/nuvoton
+   arm/imx25-pdk
    arm/orangepi
    arm/palm
    arm/raspi
diff --git a/MAINTAINERS b/MAINTAINERS
index 063d8e07b75..2ea17d68f6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -684,6 +684,7 @@ F: hw/watchdog/wdt_imx2.c
 F: include/hw/arm/fsl-imx25.h
 F: include/hw/misc/imx25_ccm.h
 F: include/hw/watchdog/wdt_imx2.h
+F: docs/system/arm/imx25-pdk.rst
 
 i.MX31 (kzm)
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1

