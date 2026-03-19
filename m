Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0D51091912
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 19:54:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3JRM-0008UT-OL; Thu, 19 Mar 2026 15:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3Ios-0004aN-Ts
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:14:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3Ion-0000mS-1v
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:14:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43b44c0bcdbso945350f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773947640; x=1774552440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mldJajiHYuFJQj6uqTHtlpZPcG8jxdcuUOJ9G9GhNQ=;
 b=VLbAALP4D5eZnLFtCjWWACGu+hzC4MeiHP8rAu2zZrAmzRXCKFzYH7QXAxcXINJpFq
 LOJrs4SW9nDjC7nqMiHmGyF2+Ez3wT2JGQenTNW3EVJGp6MtV07EAPY5GWSUbd+/xTbo
 qdIcUL7dcFUNAykNaE0cT0AKqp843Yhj8wpcpowZ5tMr+8w1P56ETH3Kc/WHNE5wbGya
 DOeSun/eIWPoavcYd7Cj2bF+DDggxb65XGa1thNJI9d7uDKiu9XfsGsTkIO+G3l6FfKr
 9mgLoFqJdpDmNTVewEzk9i/decMrBvP+EtslmdlB2rNJfuZQo+jiZgZ0RagwHhjM/SuX
 bGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773947640; x=1774552440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2mldJajiHYuFJQj6uqTHtlpZPcG8jxdcuUOJ9G9GhNQ=;
 b=IwAb7sabRC48z9ihY6Vi0hHqphZHlZpT4bYSkLKsSFD6f9NpBkFhwFTppWEHLQ+9si
 s9GX9P7NQQnPfYrEC6ZaLXiCNNv6yInWKrbJU22XYT+OEBeyYwWhtvejFGYqu/UMMLts
 qtV3hWG1Fxls7j7iBsx4hi9sraMNXQ3K7YcfdYqhf29AUgqloHdAyJUr8MM4Xp6erhiZ
 fz/n34dkMhIZWIoQbTYRT3TgYYi+j14exBt9dlMcmMvsylUbiU5waG5jkHJtV0nV1OEH
 JkBRY/jVfMmBsnaHbkwtS6yp1il8/ATfV6pXSCne2P1Al7VCPxIAbmUyH0ZOS3G3698c
 Iitg==
X-Gm-Message-State: AOJu0YzOIGMN2gUJgcZEueOSEbC+6IMg2OhYv3OfHVifT9TlzaHIn9n4
 jvHmI6r7BCuhwexk7rvtqFHMWw2IfgS5dW7IEFvTlKtIdUvtDTs96pjd
X-Gm-Gg: ATEYQzxMqjAknYhFD8LM49cdfh+VeXrzjAOIu1f43Vavw9ul90OzROftn5T05ExAd33
 Q7CU0bBLeU+6yaooycp4tqNIMd5huViMj03wtaEFpOb2cCNbxGLB692cHRoSifUCPGwcduahTnu
 Sjl2gShz2P3R1LQLh5idwN+ju5IWL0Bnb2nurzI9uo8l6hwo3Y1R8qJBxVnIx4ITkD6dVJ8g/hN
 3Y74hzLeMWcmIL0x5QqpkK+izVxtRnkAn/M+3HpxgZRP91Ym4qIX0GJSWogVFZSEVl+focxYbEY
 /vEbvlBI//ata+WpNUQ6P+htwWA71FnP5NRucbzZWMN+J04zK9pRt2B98MjWIfh5ybXDFpKzIJK
 z3yWbWES9NTVy9u8Hm2ZSCLxWjYGg/Qvz+/HLZJOsunNJI9Y/3mjr+VaeyYFG+2tvoMj42wBr1t
 0De3jcWkz5bcbNWIGo7HRldhkKdhCa6Hn9MxSfp4YV9oCwJHZS/XoaKg==
X-Received: by 2002:a5d:5f54:0:b0:439:b440:b8b0 with SMTP id
 ffacd0b85a97d-43b6426dffdmr826954f8f.45.1773947640005; 
 Thu, 19 Mar 2026 12:14:00 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm635921f8f.32.2026.03.19.12.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 12:13:59 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v2 3/7] hw/misc/imx6_ccm: Add PLL3 and CAN clock
Date: Thu, 19 Mar 2026 20:13:10 +0100
Message-ID: <7c3fe6d7b2a6e9a1f6e00b4260fc0bb1077f0bd6.1773866323.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773866323.git.matyas.bobek@gmail.com>
References: <cover.1773866323.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 Mar 2026 15:53:55 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add fixed frequency (480 MHz) PLL3, of which the FlexCAN
clock is derived, and compute FlexCAN frequency based on
the divider configuration (CCM_CSCMR2).

The clock frequency will be used for computing timestamps
in FlexCAN emulator.

Signed-off-by: Matyáš Bobek <matyas.bobek@gmail.com>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/misc/imx6_ccm.c         | 24 ++++++++++++++++++++++++
 hw/misc/trace-events       |  2 ++
 include/hw/misc/imx6_ccm.h |  4 ++++
 include/hw/misc/imx_ccm.h  |  1 +
 4 files changed, 31 insertions(+)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index a10b67d396..45fdd0d5a8 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -257,6 +257,15 @@ static uint64_t imx6_analog_get_pll2_clk(IMX6CCMState *dev)
     return freq;
 }
 
+static uint64_t imx6_analog_get_pll3_clk(IMX6CCMState *dev)
+{
+    uint64_t freq = 480000000;
+
+    trace_imx6_analog_get_pll3_clk(freq);
+
+    return freq;
+}
+
 static uint64_t imx6_analog_get_pll2_pfd0_clk(IMX6CCMState *dev)
 {
     uint64_t freq = 0;
@@ -344,6 +353,18 @@ static uint64_t imx6_ccm_get_per_clk(IMX6CCMState *dev)
     return freq;
 }
 
+static uint64_t imx6_ccm_get_can_clk(IMX6CCMState *dev)
+{
+    uint64_t freq = 0;
+
+    freq = imx6_analog_get_pll3_clk(dev) / 8;
+    freq /= (1 + EXTRACT(dev->ccm[CCM_CSCMR2], CAN_CLK_PODF));
+
+    trace_imx6_ccm_get_can_clk(freq);
+
+    return freq;
+}
+
 static uint32_t imx6_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
 {
     uint32_t freq = 0;
@@ -358,6 +379,9 @@ static uint32_t imx6_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
     case CLK_IPG_HIGH:
         freq = imx6_ccm_get_per_clk(s);
         break;
+    case CLK_CAN:
+        freq = imx6_ccm_get_can_clk(s);
+        break;
     case CLK_32k:
         freq = CKIL_FREQ;
         break;
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b88accc437..99910fc068 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -242,11 +242,13 @@ imx6_analog_get_periph_clk(uint32_t freq) "freq = %u Hz"
 imx6_analog_get_pll2_clk(uint32_t freq) "freq = %u Hz"
 imx6_analog_get_pll2_pfd0_clk(uint32_t freq) "freq = %u Hz"
 imx6_analog_get_pll2_pfd2_clk(uint32_t freq) "freq = %u Hz"
+imx6_analog_get_pll3_clk(uint32_t freq) "freq = %u Hz"
 imx6_analog_read(const char *reg, uint32_t value) "reg[%s] => 0x%" PRIx32
 imx6_analog_write(const char *reg, uint32_t value) "reg[%s] <= 0x%" PRIx32
 imx6_ccm_get_ahb_clk(uint32_t freq) "freq = %u Hz"
 imx6_ccm_get_ipg_clk(uint32_t freq) "freq = %u Hz"
 imx6_ccm_get_per_clk(uint32_t freq) "freq = %u Hz"
+imx6_ccm_get_can_clk(uint32_t freq) "freq = %u Hz"
 imx6_ccm_get_clock_frequency(unsigned clock, uint32_t freq) "(Clock = %d) = %u"
 imx6_ccm_read(const char *reg, uint32_t value) "reg[%s] => 0x%" PRIx32
 imx6_ccm_reset(void) ""
diff --git a/include/hw/misc/imx6_ccm.h b/include/hw/misc/imx6_ccm.h
index ccf46d7353..a54b940686 100644
--- a/include/hw/misc/imx6_ccm.h
+++ b/include/hw/misc/imx6_ccm.h
@@ -164,6 +164,10 @@
 #define PERCLK_PODF_SHIFT        (0)
 #define PERCLK_PODF_LENGTH       (6)
 
+/* CCM_CSCMR2 */
+#define CAN_CLK_PODF_SHIFT       (2)
+#define CAN_CLK_PODF_LENGTH      (6)
+
 /* CCM_ANALOG_PFD_528 */
 #define PFD0_FRAC_SHIFT          (0)
 #define PFD0_FRAC_LENGTH         (6)
diff --git a/include/hw/misc/imx_ccm.h b/include/hw/misc/imx_ccm.h
index c4212d04ea..6839716ea3 100644
--- a/include/hw/misc/imx_ccm.h
+++ b/include/hw/misc/imx_ccm.h
@@ -46,6 +46,7 @@ typedef enum  {
     CLK_EXT,
     CLK_HIGH_DIV,
     CLK_HIGH,
+    CLK_CAN,
 } IMXClk;
 
 struct IMXCCMClass {
-- 
2.53.0


