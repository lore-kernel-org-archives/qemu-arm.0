Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp685652qvs;
        Tue, 13 Jul 2021 07:29:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuL9XvEQK3tvTmZrAn3ltlugwsg3wDBN37peJ29f2W9to1RaU+SFykrHYq8Lqs3Q67nsvG
X-Received: by 2002:a1f:97d2:: with SMTP id z201mr5441328vkd.2.1626186578584;
        Tue, 13 Jul 2021 07:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626186578; cv=none;
        d=google.com; s=arc-20160816;
        b=tX1tTp3g6Y55v15u4vR9AZo7PELPDwTZWx6ySl51OUuEf7uPsUjxrL6Ve2AUN8OZL5
         W1kI6rwxzodMU1RO2fQCLxjzg0C9/a27N8qN9mz4Daoc66/EJ6OaQnpV5Vtj+NSeDKHC
         PVOBszWirmlbw9JFiNiru3fQXFIRqpQVJLTJy74X4VxdR6srEG6x/ZmxytmEOfm7L3TL
         kqmxEkcYu8Pu2ZFNI/5YnME2mw12V5pJ/1gnLsAJR/gg+Nc0ICVrV3FAf4w+DOz9G88e
         NL6sSDkDcCJtQoZaui7a1x3z9u5bA2DrTFLhmKeyLS7nSeO++690uNDM4ygHHfkgpJyk
         ddlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WQUH7xKOoPCjm46B5UEAUDBteVD2FMhQP28ZtHWhFHc=;
        b=gyZxeavGxuuY3mOnKFMkPgL0PlfuHkG8r0ugUZw8511yuAaHUnsvOWPrnZ5kGIznkL
         +wEgSad+8TtdD+vAT8IVUZ9fAf38mse7hFFrLjdKbUetsLnpVIYpbkPe7lS4SvN4bdJr
         MMwCeN36OOq7vopyiHZCUXg5ga503EJLH1X5W7xTPfCCg47wImi9H5Vu4D8heh3yU+6F
         5nMJbpJckdrwZGwnWJrHB8lngSNbQHh9QX+x5jVGT1d30IFSWnydvEq9Xm5sbUJ8jNyu
         IQfCgW+PFs1F6KBhGscqcDKDEu3kIGhnXu2QwPIcEV3G4CLm43UNDyi+xXW02BjNxvP6
         2nMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iFl/8G/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r43si14994312uad.133.2021.07.13.07.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 07:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iFl/8G/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3JPl-0006ir-Ux
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 10:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIy-0001hI-Nh
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIu-0001dg-Fi
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so1775834wmi.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQUH7xKOoPCjm46B5UEAUDBteVD2FMhQP28ZtHWhFHc=;
 b=iFl/8G/7U2fq0Ugco323xszrOrqVEJZ3TPrDLZbqVGicJ4oSN0qYURugdoTF/NHfPE
 MSz453WgEGvqLTiMNhRiJis+UtLd9+B+X47fwDYQSadcu4d0f13psEjbamBQDJhDGYhg
 d5GfJZGpgv8cSNJcVZX06TG/+9z16vUNHzmv599m+wmab3JOMJFSBmPbhqpnV3VYtoPu
 N+64urHhg1EgzGNJwOEgbzqo9gTPxin/NrHc86v17pfMzwP/ZMOaHTAWpgHqvW8TW61Z
 XG4FjfoPdrDFu0x6VN+0siAugawrqXqWt9KEMaRaSylwa/HDuxaLTK02PIqOBeDmefXg
 MuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQUH7xKOoPCjm46B5UEAUDBteVD2FMhQP28ZtHWhFHc=;
 b=b23HmizcuYL1qQAAVoC8lH5ldhwA1dWkXClRIohs/l8NxIjJ91xXpO0bk+fFo06fHw
 ARVOdx+wqMoLS3yWzxBgKVlFTutHv5BH9G6nQ2uKGNVjwuKDPOq0TGaOhgWY//KUt/Jj
 /6TrVy6ZV8ppdqiNrvy0mxZBEqORnW2GzEv2rq+1U/IFBTYd8Yaj+sN6k/u0qrAUKcvO
 KXgbd/YcejiUk18rlL4r7zfQ9J3rYuTJhePe8krNnv6HrZbpMtDJ4jL1rQYXYIOE+mRL
 +p5P0uczg2HqhOOar64e2y6KKZG+Nhei1XuAN7T3u/cRJhmgTbhFdgcVosVMbAhldo2m
 yeEA==
X-Gm-Message-State: AOAM532JbioJRBzdkoJeSiGpgUey+JaInWyrum+jsguC6NvDOwFB9yW6
 JdemXpquKQ9aCXcW7EyYlEZj1qW57cD2GxAm
X-Received: by 2002:a05:600c:24d3:: with SMTP id
 19mr5257101wmu.171.1626186149640; 
 Tue, 13 Jul 2021 07:22:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] docs: Add skeletal documentation of cubieboard
Date: Tue, 13 Jul 2021 15:22:24 +0100
Message-Id: <20210713142226.19155-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713142226.19155-1-peter.maydell@linaro.org>
References: <20210713142226.19155-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AA2zp+kyYNBc

Add skeletal documentation of the cubieboard machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cubieboard.rst | 16 ++++++++++++++++
 docs/system/target-arm.rst     |  1 +
 MAINTAINERS                    |  1 +
 3 files changed, 18 insertions(+)
 create mode 100644 docs/system/arm/cubieboard.rst

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
new file mode 100644
index 00000000000..344ff8cef99
--- /dev/null
+++ b/docs/system/arm/cubieboard.rst
@@ -0,0 +1,16 @@
+Cubietech Cubieboard (``cubieboard``)
+=====================================
+
+The ``cubieboard`` model emulates the Cubietech Cubieboard,
+which is a Cortex-A8 based single-board computer using
+the AllWinner A10 SoC.
+
+Emulated devices:
+
+- Timer
+- UART
+- RTC
+- EMAC
+- SDHCI
+- USB controller
+- SATA controller
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 705b8835e48..e2fcb64872d 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -85,6 +85,7 @@ undocumented; you can get a complete list by running
    arm/aspeed
    arm/sabrelite
    arm/digic
+   arm/cubieboard
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index c340bb02b0f..93b9f900034 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,6 +559,7 @@ S: Odd Fixes
 F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
+F: docs/system/arm/cubieboard.rst
 
 Allwinner-h3
 M: Niek Linnenbank <nieklinnenbank@gmail.com>
-- 
2.20.1

