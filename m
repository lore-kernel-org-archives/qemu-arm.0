Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp257297njn;
        Fri, 10 Jan 2025 08:04:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9JcGT4H97X/t9YMpQgFNeFV1CBRS8tOAz4qRt5HctSB45iszK7GKdfRvzFEEuHcKaiC1RMhNJFRqn4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHxsR1K4zrKTD3j+rs3m6gtM2F9Pdi/lDwk2evtOnw5lDSP3zEEb56Gu7CKA0t3rHZib3Td
X-Received: by 2002:a05:620a:4155:b0:7b6:f0e0:3f79 with SMTP id af79cd13be357-7bcd97d7a5fmr1756074485a.57.1736525089812;
        Fri, 10 Jan 2025 08:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736525089; cv=none;
        d=google.com; s=arc-20240605;
        b=SmtKGhzSFWrFc9VTjG4x1kZ6eSQJf9uBacwJxjmXZmYqjTPVxaCW2dneC2NSefYfPV
         Cc7/V62Wf33INjZVvqjf13Z4zulJ742iEUERQA0ryw4yAyfgDQjZS2dw8vLht5uNFQ6s
         hUZWLGxQiXN87sBMZjr1wyxcDArPofSscneq9reGwgyJduZ9+YNqSqp8hRTdYjpLDj/p
         LoSnXwLY4HG9oAEHkXoFRQHpJa8CIJ+LRslEtS+jQ0Gmvo8SS/6Zfzoz6fHZgiAPAJZN
         6jVeibwbxSUAV9inJCe8Sj4GWyNWW/MfJLKQ0+5wH99CgHVsBPUPols8xrBkLu0XytrV
         YXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jNnZwPGg9I7cmBuNCb0r/kiY7/oGOFV7SpkVL4fmHdY=;
        fh=rMMzi+laR7OGi8dG1neJP3Axkjsg5G74gae5hdxYoYg=;
        b=ZbD+OsMy4ftaxRBSiYxODP41kOVjyIU44A4xxsKanSM+bg3MVg8FqLr4aeBbv0FUtr
         X/8sZPsO5clWLrQqoYmKdm5XWsa/nHgA2xUvISxyKU9vyfzfHxh/v4zaihKaAga0XgUy
         SPhrdTyOFRp4JfHSKUjcMGbwdvZUTC+m5vXdQU8uNDjY3iwefbLIYlNzsCI9BaadiNYr
         A+ksclnwNYqtZuPNgB790ETebefedQhqhOSFjXazZ5abr4kC+vP5TTU4ZLLRUe+1lE4L
         kp6ge5fGZPGPdLHUDbpsVcybK1pDXjd1RVcRm8y4MLnG2qFy2AEB62APyKWBfo7sBC7x
         h+eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVGt4BFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3509746si429327185a.575.2025.01.10.08.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:04:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVGt4BFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHTl-0007cU-3y; Fri, 10 Jan 2025 11:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSw-0007HK-Cr
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSt-0004F8-EM
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:29 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso25820335e9.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524945; x=1737129745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNnZwPGg9I7cmBuNCb0r/kiY7/oGOFV7SpkVL4fmHdY=;
 b=YVGt4BFVhvuYPrg9itQb0GUOvcULsk9PmsRaoo0JpjhYCmFyqFTRKKJSadbof25nHI
 ecxHx5RiQHY3Imu7hBXDRi2Lbr9TUY7NKgX9+ZHf2Y3M682STr9g6KBSwhEMUXeI6qUW
 vJ8/KNtXsDSxkcp/WBT7ZpD6iJh1Pt5r6fqnHNeUP9D8yBwbLgm3OmAbJq2F1rqT+iYr
 ywLNfbqz6K1tD4ry6zGTdnIJ+AgDK+eJoDNYXaXzlDdGRxAPrPuRhxXLhXEYpOrgxlHL
 kT3z37Tsqdx1r/RYH2jDn5xJrIb/f6d//r8++ebFUrJGWWECoQeUunZo58hqCDJ9KuRW
 buRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524945; x=1737129745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jNnZwPGg9I7cmBuNCb0r/kiY7/oGOFV7SpkVL4fmHdY=;
 b=iEhs2x3+UKE4nFAKVgRflIJXeH9t9k+HWKaJreebEX3EQ1s9qhp+bDTP1euhE+eC1S
 2SMfzhAGP3ZdDUfZ76397NN5Yz40DNNzX752SfzOhpPn+u7HT3abv9cqVsBWmEYAWALt
 bqOJ9QzfsooGPh38YDa05y6Y5ZdF9tRKsMA1Xj56B9IGgOik9C2cdxFE5r+4ex5b6NMk
 wKbtY1vkujELGVEklOI6H+ZZ2vGXim+rJOdB5gHr0W5oHYd7hbPiXK0d2a5XYJGQK06c
 BFGghYu8CUd+ZnnGt957Az1o+Z+6AJp4P0yFCCCE6fm9ga2swRdoQmQ4qAtiIfjUw3E+
 Catg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR5z/bcxapR/6i+X0UEvuYifFMLZodhICCyYTxmUTyCRaEmgMytpKoJ9pw8qbqjeU+Hr/Ds2Cz4g==@nongnu.org
X-Gm-Message-State: AOJu0Yz8euZEywt92/mTQTTyjx/J4NcCNUb680SMT3/F9cOruL6zYMbR
 pzfKitgEexwryZ8FxaJt8mLxoczDc40O6ybArm8XDGBFgEoeTU34N2e2Xi9OKgA=
X-Gm-Gg: ASbGncuIvpH8+FluEFdM+E0ufsrW3U4UYI0XaQtGxspP9scNmXIkkh6/jdu3QlPq5DM
 JtuQdd97JAELIIqZdRWqSH2PhW1vFwwhNkOzFpTf+EtGVS7dV9EJHIP1171J0xQALgtibQi0n9+
 MMg1WJytrgo2GnPSWdW8W7GsnpFaEPCESGI/uIFzeyh0UjiFEDVlH4V3NYBj44EKCqt65AwaEE+
 cujfmrP4CUzDoUjBthDMkUTuJ3W/jIttiNYdobK+VPAS73/Y67Tl+F1mYzuxvUkpag37DAlVpBq
 DE4qhT2beZ/SQ6Lft+PncwIPgXV/1HM=
X-Received: by 2002:a05:600c:1d0c:b0:434:ff25:19a0 with SMTP id
 5b1f17b1804b1-436e2706f7emr92076505e9.21.1736524944309; 
 Fri, 10 Jan 2025 08:02:24 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03f62sm55756165e9.22.2025.01.10.08.02.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/9] hw/arm/stellaris: Replace magic numbers by definitions
Date: Fri, 10 Jan 2025 17:01:59 +0100
Message-ID: <20250110160204.74997-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /0JjomLExbfX

Add definitions for the number of controllers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 254f7a234bf..b4c3412c490 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -49,6 +49,11 @@
 #define NUM_IRQ_LINES 64
 #define NUM_PRIO_BITS 3
 
+#define NUM_GPIO    7
+#define NUM_UART    4
+#define NUM_GPTM    4
+#define NUM_I2C     2
+
 typedef const struct {
     const char *name;
     uint32_t did0;
@@ -989,12 +994,12 @@ static const stellaris_board_info stellaris_boards[] = {
 
 static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 {
-    static const int uart_irq[] = {5, 6, 33, 34};
-    static const int timer_irq[] = {19, 21, 23, 35};
-    static const uint32_t gpio_addr[7] =
+    static const int uart_irq[NUM_UART] = {5, 6, 33, 34};
+    static const int timer_irq[NUM_GPTM] = {19, 21, 23, 35};
+    static const uint32_t gpio_addr[NUM_GPIO] =
       { 0x40004000, 0x40005000, 0x40006000, 0x40007000,
         0x40024000, 0x40025000, 0x40026000};
-    static const int gpio_irq[7] = {0, 1, 2, 3, 4, 30, 31};
+    static const int gpio_irq[NUM_GPIO] = {0, 1, 2, 3, 4, 30, 31};
 
     /* Memory map of SoC devices, from
      * Stellaris LM3S6965 Microcontroller Data Sheet (rev I)
@@ -1030,9 +1035,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
      */
 
     Object *soc_container;
-    DeviceState *gpio_dev[7], *nvic;
-    qemu_irq gpio_in[7][8];
-    qemu_irq gpio_out[7][8];
+    DeviceState *gpio_dev[NUM_GPIO], *nvic;
+    qemu_irq gpio_in[NUM_GPIO][8];
+    qemu_irq gpio_out[NUM_GPIO][8];
     qemu_irq adc;
     int sram_size;
     int flash_size;
@@ -1123,7 +1128,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     } else {
         adc = NULL;
     }
-    for (i = 0; i < 4; i++) {
+    for (i = 0; i < NUM_GPTM; i++) {
         if (board->dc2 & (0x10000 << i)) {
             SysBusDevice *sbd;
 
@@ -1157,7 +1162,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     }
 
 
-    for (i = 0; i < 7; i++) {
+    for (i = 0; i < NUM_GPIO; i++) {
         if (board->dc4 & (1 << i)) {
             gpio_dev[i] = sysbus_create_simple("pl061_luminary", gpio_addr[i],
                                                qdev_get_gpio_in(nvic,
@@ -1178,7 +1183,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         }
     }
 
-    for (i = 0; i < 4; i++) {
+    for (i = 0; i < NUM_UART; i++) {
         if (board->dc2 & (1 << i)) {
             SysBusDevice *sbd;
 
-- 
2.47.1

