Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2800707ejx;
        Wed, 13 Sep 2023 07:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFyqkCMQx8R2aGv75wxMONKRDeiukbzuqXduacZAPLltN+E3ABnPQF4Tp+7lk9KRsT4TRK
X-Received: by 2002:a05:622a:15c2:b0:412:17a2:bf76 with SMTP id d2-20020a05622a15c200b0041217a2bf76mr2648021qty.14.1694614005619;
        Wed, 13 Sep 2023 07:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694614005; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdTaRzW0lf+a92fyQn1oUJzfM4xiIUWXAjW4BhT8DNqBiXf+z3Fh6awbvdcVCdajCA
         y7OG70zXkABVQZexB4WQ9uvWyoKuvX0egpuxAy/OdQXpJdItv2haPT1cZ9Hy/GD2pRCI
         8gq1rDPVdVkkyHHwsaPwHN+VhU4iyOEn6VKwuFoQtDICtpLOOVGYH+1WHn074mAyiw8T
         927yrdm9e7dPRNYJVnT2TvXiuFh4fzaqaCxo0HIoR0qnRcEMmplFl0xyY6Pa9KjWjOzo
         5mtkttj02onzEhXjHqVSIfxPxfIg+ifXJ1L27x2IG44TWkVsGsZ7gL+gGdwvuSJBuUIs
         RrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=VM0TqcBnM1/8Y4jxrjyXUMrfsUx4BZkvRKt6XfZelmY=;
        fh=mEZyouRtxfiyfuPooUBunR13dbh3J4hBhCqVSpYjthI=;
        b=r262aPQsj+1T0DytZkjWNQ+ddbiNyhUl8lSb0AIm/67Odu+JVVb2TpTfMZg/bTg/Ry
         G4reh42y2vYBhXyYlo4Kelkt1VBK29zR6qFxced9awzD4R2ALkVRSTIEZYmFa1u3Sw5q
         VTBsaDL4+1gHyJB6WRLM6UriST4UBBbYeSRRAkP5Afxx1GfWO51dLwwhSMlQBUnPAim9
         cYCkWbMYloBm3MUxBm9B2bgxOoB+xAkdK/QyMWb8uQQ+7hY4CdhkupIY135ZKmjnRAid
         32V+Xvo5ZypLsBfzcymmBknZ6TRDXt9q7AdtbIDtgozoObsBZ9J9GlOtwFoiWJpToHfC
         p9fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020ac84e4e000000b0040f1284cc6dsi7704140qtw.398.2023.09.13.07.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Sep 2023 07:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgQVn-0004E7-VI; Wed, 13 Sep 2023 10:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qgQVj-0004D8-Hf; Wed, 13 Sep 2023 10:06:31 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qgQVe-00036i-Gj; Wed, 13 Sep 2023 10:06:31 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 7723A26000D;
 Wed, 13 Sep 2023 16:06:17 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 9eRBhpP2TxH0; Wed, 13 Sep 2023 16:06:15 +0200 (CEST)
Received: from applejack.lan (83.21.94.247.ipv4.supernova.orange.pl
 [83.21.94.247])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 81A20260ABA;
 Wed, 13 Sep 2023 16:06:14 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] sbsa-ref: add non-secure EL2 virtual timer
Date: Wed, 13 Sep 2023 16:06:10 +0200
Message-ID: <20230913140610.214893-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913140610.214893-1-marcin.juszkiewicz@linaro.org>
References: <20230913140610.214893-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: mWGEaOZLtif+

Armv8.1+ cpus have Virtual Host Extension (VHE) which added non-secure
EL2 virtual timer.

This change adds it to fullfil Arm BSA (Base System Architecture)
requirements.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

---
 hw/arm/sbsa-ref.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index bc89eb4806..3c7dfcd6dc 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -61,6 +61,7 @@
 #define ARCH_TIMER_S_EL1_IRQ   13
 #define ARCH_TIMER_NS_EL1_IRQ  14
 #define ARCH_TIMER_NS_EL2_IRQ  10
+#define ARCH_TIMER_NS_EL2_VIRT_IRQ  12
 
 enum {
     SBSA_FLASH,
@@ -489,6 +490,7 @@ static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
             [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
             [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
             [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
+            [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
         };
 
         for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
-- 
2.41.0

