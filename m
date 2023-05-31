Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2736841ejb;
        Wed, 31 May 2023 03:00:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5tQP5P1c8z897vkzi4VYbTvxotsSbhb7/rYiw4ezhOaTcy8P5jPaEqtbiHlEEGf4tTcbfU
X-Received: by 2002:ac8:5bc2:0:b0:3f5:3641:f3ba with SMTP id b2-20020ac85bc2000000b003f53641f3bamr6041589qtb.3.1685527221190;
        Wed, 31 May 2023 03:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685527221; cv=none;
        d=google.com; s=arc-20160816;
        b=boWekwaQ42Lq5UYndTZPuelkB1sZRsdIsDHJy64PO44HzyHu6PQaPv9dBXpHwcl079
         RMqLVMiW39WsIYKoyHBsMdHUxyR8O17d2jaGcimjoGnzi+R+4RTBFlz5UqiZEz04vFd1
         qQ7XNOGE1UJdGMq2/LnjgNI3oxaBGuRbbmiC8HS7ZdL2rojT9UWh1Ueynjg5rm7v6iss
         0Q4rkU2MMwenrVqMZl5ZcV+OTS3BFyJayhE14ihgfeOPCGKUh7NyzgC/GeoBTjFAkYBB
         KreYauiOrwcxEmnW6k/ZwPkJGmmdNH337yapqsqyFn3d97lvXC/OQzIFl7emAXyksiU4
         pm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=wLT7Cu8PPpskZ6YQhCqTSQxTAxG2G9IIFZTlbuE5xrI=;
        b=BztNVttHc9BYDhPZhUq2VOiRBB1BWhr/ABecmMfvtMgneOPmZvTpxa3tXnwpKUGUN7
         GkA7/uY+JdoxnOFEK8IKPy0jgDYtMQqcAkQ/p9MKYBZ04ur4TOURRdrEO6KRz6wSkcmV
         8qHvEpO+BgkaAjWEa70l4sGkaLcCydRG6cVUHja+r2rCV30pRjYuRtahaNadUUfo/rMU
         8+TAVRuWXT/i87BSp9+njtC22kIW0OD3retJgIa/0OGUdGvhyg9mZ8C0d4DR0k4109Vo
         8eVFOktkEBkUcki/7myeEqbPOGde8CNfDsJPBLgsMDEf1pUtjHd8h94GbzJy4WKFT0rV
         1Oug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17-20020a05622a13d100b003f6ac42f746si8078255qtk.405.2023.05.31.03.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 03:00:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Icj-00027v-DL; Wed, 31 May 2023 06:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4Ich-00027h-UD; Wed, 31 May 2023 06:00:07 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4Icf-0005CF-QW; Wed, 31 May 2023 06:00:07 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwAX+pRAGndkGreaAQ--.30303S2;
 Wed, 31 May 2023 17:58:24 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwB3xi+YGndkrncAAA--.2360S4;
 Wed, 31 May 2023 18:00:01 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v1 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Date: Wed, 31 May 2023 17:58:45 +0800
Message-Id: <20230531095845.365019-2-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531095845.365019-1-wangyuquan1236@phytium.com.cn>
References: <20230531095845.365019-1-wangyuquan1236@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwB3xi+YGndkrncAAA--.2360S4
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAQAWR2SqoDewAAsa
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7uryfArWDAw1kAFyrtFykAFb_yoW8uryUpF
 4UWr4Yka18tF4rJan3uw1UWF45C393Aa17Z3y7KFs7AF1DAF42grWDGa1jk3sxZFW8XrWj
 9Fnxur109w1Iy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Eu7DobKSEA1S

The current sbsa-ref cannot use EHCI controller which is only
able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
Hence, this uses XHCI to provide a usb controller with 64-bit
DMA capablity instead of EHCI.

Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Change-Id: I1376f8bbc0e25dcd9d8a22b6e061cb56b3486394
---
 hw/arm/sbsa-ref.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index de21200ff9..4c9a942a63 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -82,7 +82,7 @@ enum {
     SBSA_SECURE_UART_MM,
     SBSA_SECURE_MEM,
     SBSA_AHCI,
-    SBSA_EHCI,
+    SBSA_XHCI,
 };
 
 struct SBSAMachineState {
@@ -119,7 +119,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
     /* Space here reserved for more SMMUs */
     [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
-    [SBSA_EHCI] =               { 0x60110000, 0x00010000 },
+    [SBSA_XHCI] =               { 0x60110000, 0x00010000 },
     /* Space here reserved for other devices */
     [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
     /* 32-bit address PCIE MMIO space */
@@ -139,7 +139,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART] = 8,
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
-    [SBSA_EHCI] = 11,
+    [SBSA_XHCI] = 11,
     [SBSA_SMMU] = 12, /* ... to 15 */
     [SBSA_GWDT_WS0] = 16,
 };
@@ -575,12 +575,12 @@ static void create_ahci(const SBSAMachineState *sms)
     }
 }
 
-static void create_ehci(const SBSAMachineState *sms)
+static void create_xhci(const SBSAMachineState *sms)
 {
-    hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
-    int irq = sbsa_ref_irqmap[SBSA_EHCI];
+    hwaddr base = sbsa_ref_memmap[SBSA_XHCI].base;
+    int irq = sbsa_ref_irqmap[SBSA_XHCI];
 
-    sysbus_create_simple("platform-ehci-usb", base,
+    sysbus_create_simple("sysbus-xhci", base,
                          qdev_get_gpio_in(sms->gic, irq));
 }
 
@@ -803,7 +803,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_ahci(sms);
 
-    create_ehci(sms);
+    create_xhci(sms);
 
     create_pcie(sms);
 
-- 
2.34.1

