Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2826172lfo;
        Sun, 31 Jan 2021 10:46:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXWXuBh1VeJGHn33xUlcIOxwctrCT3Piq3liHRUC6f3oKFJue2HvFnpu8r+597PzLPdFaL
X-Received: by 2002:a25:40e:: with SMTP id 14mr3587648ybe.66.1612118772000;
        Sun, 31 Jan 2021 10:46:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612118771; cv=none;
        d=google.com; s=arc-20160816;
        b=JsNXwuDFR1OSTdGFTpWtER0T4gk52T1YgJd24P2ncl1Z2j4EOSHhNPbEOqXP4qF9Oa
         X5ONaYH01/Md1hh8y/ZFGrL3/IUHcZVkRWE5cm6X3ILs4MHmLNqpp49QMPb+riqHmjxY
         iqCO/GWF3wXAbDCtdrvqMfHac52IB6CcsH9QhIVXXez1zVcPYrZ6E2eTLLiY+jYzftA8
         Q6rX8n2veo9ebpVsF3iOCAlcU2n48fL8oJjTwP1jCmyT15wk2zmXSfOgQzughTEg2KBb
         iKh1/EehOVMvHZsEC3WHX1vzXWPCYYoms+saoWBYlbJKxnT+POQwRYh8NZ9Zdo2gtqQg
         ZOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
        b=0CJ4pEBe31zexHzH0XFWOYzjri+H/6z2fqcf1BN6GLB7ATSBF9hBR5XXztVdaO7Y7q
         643KCKUd9iLnMnMsFgI2P52/xB9UMBKrzMqJn7qUBTjg/1e1FlplOygXBzgtmsfBHcA4
         5/q0f/Tb2o5ornMu1VffUfuzSOWYRjHR74Dj8aoaJu8JIfZMPAkE7LgcQrvTM4Dn4JxP
         LG+7btkjiWfuhHFVk9zxx2JY7k2b007e39NvqzdOtPm+IzdK6QSGRlkgwa7PO6GTnLcP
         ljaoZdGRHkQMw1PLyLsYU9JGzBUHGiTH3Ccxi1T4DZSZ/MSH/5QfOThzonY0DQ3lECAb
         C/sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ar83hyG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si14162582ybq.133.2021.01.31.10.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 10:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ar83hyG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6Hjf-0002BB-90
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 13:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HiX-0001pv-LE; Sun, 31 Jan 2021 13:45:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HiW-0007W5-7W; Sun, 31 Jan 2021 13:45:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o5so1145135wmq.2;
 Sun, 31 Jan 2021 10:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=Ar83hyG1wfqk990LmyX56lvWVmRRWSUEpVqyMnuuaaHJmSx9fQuhZTQWz5jZAwbPmj
 wp3f+NM1Dlntqul213WvJHoGbrHt/JOBCaIwLwd8mMwZqkk/a1WSyVB5yOyhQFj+ucf/
 VoYH1Lq32TXiBWgiYVXVg4QrCqnGScz9PlJr1izmus4bIu3abO/LdTnzgyReyZVhtGXL
 5XVCirWVxwIE7Vkpc5U+OmR/A4JO68UGLAkC0MCOFdIn9ESnH8jitD0Yz/Wu+eKyGuOm
 n6VosZs4M5Xa8LFs848I0PZUknvG1ILFBOKmmvfdVuhoV1XFpeGvPKKsXdroZHS/feR3
 7wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=k24sDsUaksK01Yo3Mv6hOBuJIGm+m4Af433SRdyOBCVw/6MzR0M99jEv9YQnqK1OZr
 fscWY9TVU1zONlNUqHDLkLGpb7S7X7hZxIU6wxzyB9OP1yk62kiWoRDDmmy2oIFT+YQQ
 7OsDsfLAthn9b7o6peYkxObpyOAs3i2NLsthoA+uXFxj6fROYQYKHtj8iu0ZlX12lFov
 YBOYig3/IiOEyXxybzm/ZSpQfDRVWzKcfSVzf4JYiDxdp72l7Pzqe7dB41hnhzk+YFIb
 32XIpDTOPBAfZigeDrr2UvNtPpPzvLfwBvYBKpLrZlbsNfIP/Zar7oRLYI1m4jQBwdaD
 R/4A==
X-Gm-Message-State: AOAM531P6Qf66iQuUzuL1wznTV2DYlXFXoF2VtregBTBMRKm+a8J6sEv
 7mTuup8yrYwW2rJxn4TxLzxVH1LsJgM=
X-Received: by 2002:a05:600c:268b:: with SMTP id
 11mr12117657wmt.132.1612118697963; 
 Sun, 31 Jan 2021 10:44:57 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id v4sm27450035wrw.42.2021.01.31.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:44:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
Date: Sun, 31 Jan 2021 19:44:44 +0100
Message-Id: <20210131184449.382425-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wP9HqjoSHHoH

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

