Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2574271lfo;
        Sun, 31 Jan 2021 03:01:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8vFLfg6h4XP4Y7MZcf5l9tZNvzxTkge5WZ1w8n3nN0ByjlmVGQEMi3PII3hyiJAKuG90S
X-Received: by 2002:a25:6cd6:: with SMTP id h205mr5667580ybc.166.1612090915110;
        Sun, 31 Jan 2021 03:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612090915; cv=none;
        d=google.com; s=arc-20160816;
        b=GUM2C9IFoYRw0u4tlSX9OYxwihHsMyIf52vQYYb06mQmyjNkylmfoXhGyugMwbUfx+
         O10Ly5cWfryfd10xY5r+q2BsoF/aFMY3hoaotSzJwa3hwMLHQeTcQOUPbw+MNtVTGU9Q
         sXQfkUAbuMfb2Lxm3dwxJTnjIJyUNVxFRmli9/frfFegM2oLHblP4KM1PJ0uCZpyANCS
         qCHbBXupQEgbaIggY/maGkxpAOx8/dfgrbVsGPJYThuF2ptaHxHnsDA5TEqIvFlZCBly
         B88gA88dcvzFPtHnJSzU1QFE8d08t5KQglBZQUzC743cvcxmiJxUMRSHxhixTkZqEPl9
         Atrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
        b=wADzsmMskMBuii+4hcPNOBSp8P3ce73wUX0V7v5jxWUDyDW9TH8orzDlub8WqNm38f
         vRSAVRz9VK0Y1owmiumZrKfJzZMgqkC73j5nBpKsHr0NLZ2lLs8uTusF1mhkc+Ga+xYP
         ax2eZKTmXBFLbDFRnX7FVMXaPbt+HlS/iFv1JipuI/FfFXFD1fHk/Lg5p/ejwRCu5gdN
         vZY/VAuuaadQQA5499Ry5rp4vT23jfePKtZBIEoMCc8OcLtNryoNEIhySOEU3ZjNVp5J
         Xz/QwxGuCUAith7mjeoKBOV1lT0CWRWLiUR2Pqew8pGxdMj86Ju43f1RxiOaQFN3dRu7
         9kpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FBl+lcqU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si16017611ybw.176.2021.01.31.03.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 03:01:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FBl+lcqU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6AUM-0007Dm-Eq
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 06:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AS4-0006qY-7a; Sun, 31 Jan 2021 05:59:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AS1-0000GF-Ff; Sun, 31 Jan 2021 05:59:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y187so10699677wmd.3;
 Sun, 31 Jan 2021 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=FBl+lcqUTya8HKBOBUjNAvbvJrnnQb2bBX6sxXCl1at2OWMR//TOqWUCih+ZBTl3Xi
 xTxv4V/T+AiwRAu3GeInds6GetaqebvE1Dd0u5YodgGI48B2/UmPZj2mhIkhOyJH2X8e
 N1DaicF/faZKL84596Vh3b/W1rX9uJn4SnsPssPsl0IkzI3jUqgbzeiD2jl43bhz9Fgk
 A9IXjeD330azawEpzc6mkoUKCn0+6A5KnnZ6zQOzvfxi/Rf5aSskVIbeHcVfajwj7IPq
 yYohMb+h3/M74a3nH5kE2AcoDETax5XPxnkxsYIqvdp9FYWNrsItyXgfApbM2t3WI6jl
 IbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=kq6OjqxdUTaQjyXFKe3crQdQlSqjWRzzkyFlydvnMIlNGF28E4hCDTH6BG9et7rpq/
 77Nqv9AfOyEImjSzC7QUkV3htO3sUbszwZdRfWfIJEfziVOlZNN0w3LLtrx6jBK8wb+U
 TJVmgTzHTog0/1V2P3Cw99Wf1FVZXVGm8eCDYSJ41M/EDdTiI2+CCzNyBB9zcq+Zt+e/
 ZVlRKjQ0iZJGsk0SyUYZRzxxhsGWWjChm9PXWtd9rzNOTGk8zkqPei4gRWemug/4y/Fg
 aA7DnDXpTCYOrM0Ub4wq9I69pPTGHHSivFkAbQEjwEe1T8ZV3kleBBatkdyaWM1HXe5F
 uI+w==
X-Gm-Message-State: AOAM532x6mcEwWgLsxWFjBY1dIGWfRogGHH/v37GER98KyeR32TtFJVW
 kNkvcWsVLCEj3mpCpsQyc01jjZgN8VE=
X-Received: by 2002:a1c:6402:: with SMTP id y2mr10534889wmb.43.1612090767213; 
 Sun, 31 Jan 2021 02:59:27 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h18sm22581661wru.65.2021.01.31.02.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
Date: Sun, 31 Jan 2021 11:59:12 +0100
Message-Id: <20210131105918.228787-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mCTl62oeCADQ

The STM32F405 SoC uses an OR gate on its ADC IRQs.

Fixes: 529fc5fd3e1 ("hw/arm: Add the STM32F4xx SoC")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: alistair@alistair23.me
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 13cc42dcc84..a320a124855 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -336,6 +336,7 @@ config STM32F205_SOC
 config STM32F405_SOC
     bool
     select ARM_V7M
+    select OR_IRQ
     select STM32F4XX_SYSCFG
     select STM32F4XX_EXTI
 
-- 
2.26.2

