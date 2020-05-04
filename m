Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp149970lfb;
        Mon, 4 May 2020 00:28:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKxUK9dMhnRmbGN5YeyhB8fCBXxc39eUKA0Rc4cirs/sQS/CXutIflFdBH+b1X3y07w8L8t
X-Received: by 2002:ac8:34b3:: with SMTP id w48mr16109192qtb.148.1588577324395;
        Mon, 04 May 2020 00:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588577324; cv=none;
        d=google.com; s=arc-20160816;
        b=qn/94nN0GHHjaH1slrRC99DdSLoRM74ThxyIEjesNpVffz0cvk/23Ujrn4bjUb+Wqp
         aX6uJNMYAqUPAo3MpSa7kcWPqKI3ZjbxT/jpJljxOmTs1zS2XtaR99tZG/DESNQC9MfU
         Kpzpi5AfS+Nmtiyz/GODVcF4DXRrJLyqZ/JbaWi/7GyN4270SQkAVBLAi+nk2OGqfWSP
         K1SEK1R3ZGXhuG107L+uhDGD9+0YIDn43hHJMKEa7jF2XJMZgaifE0L1J56G+CN5QVB6
         A8PlElgkC1Ow1ow9fCKK39kd31OIS59J/FUJNRw8gHGO9CVYJy2+hcm1p0pPV3RxDBYJ
         rr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T3XR2g8kj7VSDhrVTdQeVBycX1aQdfydS7sgJhSrjvA=;
        b=UIZIETNQHJ+fvpTjaeSz3HIH8mLqclEcU1Hq5QIzjfPdwXdT1vacEm51opLBLn2e/a
         Tunkr66Gove2ocId3ueFzuO7n1ddUstXmeYSzILsaozi8Mu9Cuyv1S6vHGgIKlvuKgds
         onvpwhSH2X3FEM0W3TG1hF7J3p9QQLYftyeeAZ+gineVl9y30Q9jSg6L0u9wVe+c2RV1
         CbJ0BY3L+c0d94rEUh0yuseT3OdaroHzazNigTTGoXFkyvNu2F74ITYNsrzAR7SnRRlL
         EL6BgNQqySEMbTa5eQCvxD63kUK6vzwBDs6NFW7Q7FmPGDT6KTonL9FTjtKS8I6EZBuY
         pWRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ku9XwNvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 3si5968934qkc.88.2020.05.04.00.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 00:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ku9XwNvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVVWr-0006BX-Hw
	for alex.bennee@linaro.org; Mon, 04 May 2020 03:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVVWg-00060Q-Eu; Mon, 04 May 2020 03:28:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVVWf-00063m-ND; Mon, 04 May 2020 03:28:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id x4so7250813wmj.1;
 Mon, 04 May 2020 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3XR2g8kj7VSDhrVTdQeVBycX1aQdfydS7sgJhSrjvA=;
 b=ku9XwNvP29vPvuuAGB9FzL/m4KyHcgoTpSkoqMKmWhiBQrZ7X6kqqOKZO2kuajrKXB
 hAEY2/ZCDfZwQMLfr1VilUhXZg31PZaRflptct3ffFyvNuAVwWPMA7RIdVZCpy24Eel6
 lLyTBxjY45BUhzmcjg+SWVPti3Rh4MMi37KiI2CNwbpoAtbGtoeXq6wzbLWvXWxbFxO4
 Q3d1imwxlawJOVD/eRV3vY4mFUBj7/ujSeif/6DhzpCmINHHViBq9HeZXTMHLb7BzIwr
 7x0p+F91MYWnnKNf+4E9hoUxPYfuuBjlHUtOhBmzLzas/0DruByrDwc34VUrA806tm7H
 HGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T3XR2g8kj7VSDhrVTdQeVBycX1aQdfydS7sgJhSrjvA=;
 b=OQA2XdhRJxfcfSi91qMG87KD3qgXl0mowzgc0gM4PipDD/yNO3FfFvQQh9vLYFNSFb
 PteVkyAMKk/M+MN3uvE+oIAkvfyUKQhUYp4ZMm+cdU0Un91KgwhljI85//oxWQJ/MrRl
 mXEV2dfZCgBVjXMJhPqflttAMT6GeG6TSP0hAcmeqIhb46cXqPNXMtex/urAGpKi6ALv
 oImzSEbuMiIeEmkiYSHouNffQyckd8XJTN5dRWLv9KP69wbYBtdyt/svMB7n1cVNuw0V
 IhuhwovHLHtPyVOp3fimS1bD/Jh8K7TNo7z2lkw1jOgY+395m55tP6WsHDCfjgFXfy7X
 1H3A==
X-Gm-Message-State: AGi0PuZ8m56o4PLbMDkhwqIcWpZNuJW9jwpgk3hUXa/JjhxbSjEuUWZ8
 HmhfBQeuZ8GoFvbkklqwxXHmNYaf
X-Received: by 2002:a1c:384:: with SMTP id 126mr13274392wmd.58.1588577307844; 
 Mon, 04 May 2020 00:28:27 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id w83sm12590159wmb.37.2020.05.04.00.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 00:28:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/arm/nrf51_soc: Mark some peripherals as unimplemented
Date: Mon,  4 May 2020 09:28:20 +0200
Message-Id: <20200504072822.18799-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504072822.18799-1-f4bug@amsat.org>
References: <20200504072822.18799-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BnScZbFYMi9u

Map some peripherals used by Zephyr Project:

https://github.com/zephyrproject-rtos/zephyr/blob/zephyr-v2.2.0/dts/arm/nordic/nrf51822.dtsi

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/nrf51.h |  4 ++++
 hw/arm/nrf51_soc.c     | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/arm/nrf51.h b/include/hw/arm/nrf51.h
index de836beaa4..46d0cfc7a1 100644
--- a/include/hw/arm/nrf51.h
+++ b/include/hw/arm/nrf51.h
@@ -25,11 +25,15 @@
 #define NRF51_IOMEM_SIZE      0x20000000
 
 #define NRF51_PERIPHERAL_SIZE 0x00001000
+#define NRF51_RADIO_BASE      0x40001000
 #define NRF51_UART_BASE       0x40002000
 #define NRF51_TWI_BASE        0x40003000
+#define NRF51_GPIOTE_BASE     0x40006000
 #define NRF51_TIMER_BASE      0x40008000
+#define NRF51_TEMP_BASE       0x4000c000
 #define NRF51_RNG_BASE        0x4000D000
 #define NRF51_NVMC_BASE       0x4001E000
+#define NRF51_PPI_BASE        0x4001f000
 #define NRF51_GPIO_BASE       0x50000000
 
 #define NRF51_PRIVATE_BASE    0xF0000000
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index e50473fd19..6212c5cb53 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -170,6 +170,17 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
     memory_region_add_subregion_overlap(&s->container,
                                         NRF51_IOMEM_BASE, &s->clock, -1);
 
+    create_unimplemented_device("nrf51_soc.radio", NRF51_RADIO_BASE,
+                                NRF51_PERIPHERAL_SIZE);
+    create_unimplemented_device("nrf51_soc.uarte", NRF51_UART_BASE,
+                                NRF51_PERIPHERAL_SIZE);
+    create_unimplemented_device("nrf51_soc.gpiote", NRF51_GPIOTE_BASE,
+                                NRF51_PERIPHERAL_SIZE);
+    create_unimplemented_device("nrf51_soc.temp", NRF51_TEMP_BASE,
+                                NRF51_PERIPHERAL_SIZE);
+    create_unimplemented_device("nrf51_soc.ppi", NRF51_PPI_BASE,
+                                NRF51_PERIPHERAL_SIZE);
+
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
     create_unimplemented_device("nrf51_soc.private",
-- 
2.21.3

