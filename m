Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1626510lfo;
        Fri, 29 Jan 2021 18:07:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIDqhUaY3TMHqJ6DCPfJj0KuMxid8Eftly2nRfK5omw6ZtFnnGftf/gm4ekEEj2i8RCeIv
X-Received: by 2002:a25:b683:: with SMTP id s3mr9687420ybj.442.1611972471113;
        Fri, 29 Jan 2021 18:07:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611972471; cv=none;
        d=google.com; s=arc-20160816;
        b=MSD4jQ9FNZ13aj7dlBlTUs8T11fpHOD8UwebaF4SJZYMW2GgY7olJPxK9rnMXqef7K
         QIZwJiuwcRhKHASUBDR/4VfaTY0ORnfO3fS2J6bf4bUYEgVgJoRaGxYgPMoGU1TdaIkD
         y0Jp3qZ/mtGuEWm4Clp9QSsS8pbka6JBJ/yHFncC0z7BL0krlvKvyCvQ33gHMX9mag7P
         Ds4CrWnHDmAkvFY5l/a6pd7jgjXEKL5LZIuMtVkPkcDupl3Dk6DE0ZBshiTz8Q3Za3HV
         ZxuGw/8hWyMcH/vvMEnipiMVMkC8sH4KeN0QZzvfzPTwxJi/200DQL+gjCirRloVLE3r
         NC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
        b=XioknbTgI3lXAa1S9kDxW3o6uPUaya9RfRiOn/rMbQHEVKdApCTnXPKK+X78vZ7Xuq
         vb4HNui1VzNUYGDbS5Qfq0DEfqUijOuorq4pc0kzOCzC53BZU2ZPShfxIjDvC7F0sNfx
         66Yl2Z4Uzfr3/JHGrvyBvU+snCSBJvKzZPKipH0JaUahvVM7gZ5Ngxr8H1tK8g+QdkIg
         L30Iq92uy7FdYYmbZGy/hOS6XnfqUunJZvzYU/ZZDxPZNqCJWdy/jmmFGLuX+nBqjtgQ
         gE8g1yM0jvXea9RrR3eetter/x+qFAAotsnnV7s6an2CuwvcTJt3GcisyYcTlBCg1QHe
         e99g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="BZTRcOn/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si4355217ybo.470.2021.01.29.18.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 18:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="BZTRcOn/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5ffy-0006Y4-HW
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 21:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fU2-0002mE-R5; Fri, 29 Jan 2021 20:55:33 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fU1-0000sX-GF; Fri, 29 Jan 2021 20:55:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id j18so8146571wmi.3;
 Fri, 29 Jan 2021 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=BZTRcOn/HJkpWsRhLv0QpZri9dtTj9FhDkxOHuyJAqjGBTJaQzZVNL5WyOC21THEAS
 IzTqxmkDU5ePXyBLSWvji/9MjOkJBxOe8N5616ednCW1h+emp+Xw2NFIogFZS/wiD+Mm
 J8ASjop3aQ3wyVi6hF8VhLhaZG27DBg/t0azC5Dc2HQKG1n2YirYiVVvirb1owUWvJzr
 yscTazLhBVy+1p9ePd+ByVPUJZbAs1J8UTEukJQgoDffUqPvGp0nJF3ZTIE0Ep4E6dXn
 zuJaT3rnVLcWhaTV1kfk/MGweZJlBCPXlnbRZxlf9gq7ZI1sLdAdG4NEDPWLGXcHK797
 1zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=aL+teRMArEQ6fvV7QrvXr65h6FQ8X5ni7yeJrEyvHplm0WMOlEq9imBscwod72bw5c
 RlsprdFHEy5tlQiMiPUND7xeGN4IL/QtV+eEs+cyMGztIY86sk/OrNZ30KxO7XuPGlP9
 qPHEJLOefIABS+Tj1YYDtfc8XBbtJqAanyvQ4FC0qL16jU/seLfN3iqo1g42/gykzT+5
 W4Jkwz2VsZYFomXLugRmzOurtAoYCC+oyWDOgPQbjFhJa+W2pMzmdHCQy/MV01PQUMOf
 qovmPbeeDlX8dsrke7QX4e0JvwuSswxzlXfGoli2MnjupH0TWy0dcPe0/XGMeCQvUFI7
 n16Q==
X-Gm-Message-State: AOAM533cuTXJbedaMWjAzWh+YWzc8+IBrfjmSDlbu6oNy5+BGlnTDUCM
 dl1gOE9F76oGexLgwCL1CbLSttB/53o=
X-Received: by 2002:a7b:c188:: with SMTP id y8mr5772912wmi.173.1611971727158; 
 Fri, 29 Jan 2021 17:55:27 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d2sm16883840wre.39.2021.01.29.17.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:55:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/arm/Kconfig: Add missing dependency STM32F405 -> OR_IRQ
Date: Sat, 30 Jan 2021 02:55:17 +0100
Message-Id: <20210130015519.4072469-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015519.4072469-1-f4bug@amsat.org>
References: <20210130015519.4072469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Joel Stanley <joel@jms.id.au>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ECiolZYxc+0s

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

