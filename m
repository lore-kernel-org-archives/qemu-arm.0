Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp305565lfc;
        Mon, 12 Jul 2021 23:59:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4Pc8NUVL5UBKVi/LQ5lQ0u9SyKvobm+wmpLmJsOwC66EZ8y2llGZQ9udq1Weo17LOIv8S
X-Received: by 2002:a1f:960a:: with SMTP id y10mr3436914vkd.8.1626159593448;
        Mon, 12 Jul 2021 23:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626159593; cv=none;
        d=google.com; s=arc-20160816;
        b=qZNnHX/kFS4VMHr1/IwZZX8n4jt8/CHVOf77h0kX4R/G7WrMGbAIJxSutLSESw9PEO
         KKdP/YLM5lE2pj0NTEJIgkUSPs0roCTU+i0IABIzKH1irsR6M9d9iuG5iHLzgiZDfjfQ
         w01HyrqVuxVAX6nT+QPsoETqThXpXKWwDRacIHc6PzgnG5CJAF2PxEMiMLgez4aTNOr2
         McpTvMXJs4edm9psIRLi8iPReNeddt5c1dOeloBkNj0L76dOc59Hh5PCRi3uc57qn4g5
         7pKf1tSR9MEOc0g0gY96Hxe8ObXVYVWnHDVic830tPDzJ6gvLs4RiMXyhpl4qBW0943F
         dFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DH5GouSa0wDf1nMy2lbp70CqrASM0E4BZI5IceUTT9M=;
        b=TKUztAute5PoMR8IyF92OZwWnsLs+l5K5pueLSxIVUE+tBAUiXBniVJWrFQwqkDofb
         9KrZAGQaGNhaPBUbHZBGc0i/a96SzUZ1HMaUHN7M80wuRrM3ihqIyG5JgkTLnDoarVZE
         6MEaKhkNDe5KCb6COvYyUCMU6M1rajOk80Zu+oIQ1P/Un1vV2SrdaJEfryQW4FnV1dHR
         B1/jfCsw7ggpEWE6PADsChBARXfmoIBMtovprch40egFfziUXDc+g5+LPRVth+i9lBfL
         N1ZQe4edaYDZqXXUu22xpkt4ou+dcTK1c9GyGac2cL5dqqCY0haIIBJkr7VGE66jamhb
         7wEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5JyR7dB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si4877570uaq.193.2021.07.12.23.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jul 2021 23:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5JyR7dB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3COW-0006zZ-KJ
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 02:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNu-0006w0-Sa; Tue, 13 Jul 2021 02:59:14 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNt-0001zu-0A; Tue, 13 Jul 2021 02:59:14 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 17so18708347pfz.4;
 Mon, 12 Jul 2021 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DH5GouSa0wDf1nMy2lbp70CqrASM0E4BZI5IceUTT9M=;
 b=t5JyR7dBBz/+4qeOunLPyRFUhW3ASEHBwC6uYfYbUO/3Q6/N1KlzKWBQbPoEYXhGVL
 0vQ+CN4V23USLEgAL9nukBLw1/wKJad+W0gbSKTHB8MggaI6CiySWz23OTsdW9medG1T
 n9I3QVSy03guUr7twp7ITDBXl6YOX2/KpWIJdut0or2/NrNZQHir5qsHtlVGE5uFo64i
 DZ7yXMdUtDdu8ApA15s87a/uVrZbshoXtPDuYVO9LrhEFTp4IOeKbMYV2fq86EF26bts
 FyOMac7w9rZwERR3OM3b5xmjuqiR9wpBSBIDOSIirbdg5DS6ZVhNv80iTQWnyPW6EHLF
 77UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DH5GouSa0wDf1nMy2lbp70CqrASM0E4BZI5IceUTT9M=;
 b=NlDQUlxiIlHhIjcK+Gmvxpr0PjeV5oMXfiycDk5QqZHHBEvdIVTTnyBlFxKe4bKQqU
 Fx2YupThRSVD9n8UDLMA1bylbls6HtlncmP8MKc9rekiAHTLbxWU0nojfvuJD7H4Ph6l
 z+MNC/rUoQumm6/s8V7x9Tb/fKDHA5+HjXtgal6ayIfA/X5cXEg+idWVElZLzBq1V2OC
 H9XiL0KhxzQbyyBQt2QFqSIpCyQFXWmCskHL0O7TB3EzyARjP43sjWAjiDvaICpgqorT
 S4XfWLMVfhPp8QNLnFiEvuXq8xpILhKce/WB1zDLr4Dxk9gN9w8Fw8b8HoVxxtda4yPg
 23pw==
X-Gm-Message-State: AOAM532xkLvswuZakri60oAtE+VFWlKFfBFmcC5unbsILtTMDza+O49S
 0Ai7uG5bBxMPSK9t2QD2UBk=
X-Received: by 2002:a63:5cb:: with SMTP id 194mr2942908pgf.146.1626159551232; 
 Mon, 12 Jul 2021 23:59:11 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id o184sm20334846pga.18.2021.07.12.23.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 23:59:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/3] hw: aspeed_gpio: Simplify 1.8V defines
Date: Tue, 13 Jul 2021 16:28:53 +0930
Message-Id: <20210713065854.134634-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713065854.134634-1-joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oOuk2SA1QyU7

There's no need to define the registers relative to the 0x800 offset
where the controller is mapped, as the device is instantiated as it's
own model at the correct memory address.

Simplify the defines and remove the offset to save future confusion.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/gpio/aspeed_gpio.c | 73 +++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index b3dec4448009..dc721aec5da7 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -169,44 +169,43 @@
 
 /* AST2600 only - 1.8V gpios */
 /*
- * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets 0x0-0x198)
- * and additional 1.8V gpios (memory offsets 0x800-0x9D4).
+ * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as the
+ * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V gpios
+ * (memory offsets 0x800-0x9D4).
  */
-#define GPIO_1_8V_REG_OFFSET          0x800
-#define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DIRECTION      ((0x804 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_ENABLE     ((0x808 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_SENS_0     ((0x80C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_SENS_1     ((0x810 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_SENS_2     ((0x814 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_STATUS     ((0x818 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_RESET_TOLERANT ((0x81C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DATA_VALUE        ((0x820 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DIRECTION         ((0x824 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_ENABLE        ((0x828 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_SENS_0        ((0x82C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_SENS_1        ((0x830 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_SENS_2        ((0x834 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_STATUS        ((0x838 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_RESET_TOLERANT    ((0x83C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DEBOUNCE_1     ((0x840 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DEBOUNCE_2     ((0x844 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DEBOUNCE_1        ((0x848 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DEBOUNCE_2        ((0x84C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_1     ((0x850 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_2     ((0x854 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_3     ((0x858 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_COMMAND_SRC_0  ((0x860 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_COMMAND_SRC_1  ((0x864 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_COMMAND_SRC_0     ((0x868 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_COMMAND_SRC_1     ((0x86C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DATA_READ      ((0x8C0 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DATA_READ         ((0x8C4 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INPUT_MASK     ((0x9D0 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INPUT_MASK        ((0x9D4 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_MEM_SIZE            0x9D8
-#define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
-                                      GPIO_1_8V_REG_OFFSET) >> 2)
+#define GPIO_1_8V_ABCD_DATA_VALUE     (0x000 >> 2)
+#define GPIO_1_8V_ABCD_DIRECTION      (0x004 >> 2)
+#define GPIO_1_8V_ABCD_INT_ENABLE     (0x008 >> 2)
+#define GPIO_1_8V_ABCD_INT_SENS_0     (0x00C >> 2)
+#define GPIO_1_8V_ABCD_INT_SENS_1     (0x010 >> 2)
+#define GPIO_1_8V_ABCD_INT_SENS_2     (0x014 >> 2)
+#define GPIO_1_8V_ABCD_INT_STATUS     (0x018 >> 2)
+#define GPIO_1_8V_ABCD_RESET_TOLERANT (0x01C >> 2)
+#define GPIO_1_8V_E_DATA_VALUE        (0x020 >> 2)
+#define GPIO_1_8V_E_DIRECTION         (0x024 >> 2)
+#define GPIO_1_8V_E_INT_ENABLE        (0x028 >> 2)
+#define GPIO_1_8V_E_INT_SENS_0        (0x02C >> 2)
+#define GPIO_1_8V_E_INT_SENS_1        (0x030 >> 2)
+#define GPIO_1_8V_E_INT_SENS_2        (0x034 >> 2)
+#define GPIO_1_8V_E_INT_STATUS        (0x038 >> 2)
+#define GPIO_1_8V_E_RESET_TOLERANT    (0x03C >> 2)
+#define GPIO_1_8V_ABCD_DEBOUNCE_1     (0x040 >> 2)
+#define GPIO_1_8V_ABCD_DEBOUNCE_2     (0x044 >> 2)
+#define GPIO_1_8V_E_DEBOUNCE_1        (0x048 >> 2)
+#define GPIO_1_8V_E_DEBOUNCE_2        (0x04C >> 2)
+#define GPIO_1_8V_DEBOUNCE_TIME_1     (0x050 >> 2)
+#define GPIO_1_8V_DEBOUNCE_TIME_2     (0x054 >> 2)
+#define GPIO_1_8V_DEBOUNCE_TIME_3     (0x058 >> 2)
+#define GPIO_1_8V_ABCD_COMMAND_SRC_0  (0x060 >> 2)
+#define GPIO_1_8V_ABCD_COMMAND_SRC_1  (0x064 >> 2)
+#define GPIO_1_8V_E_COMMAND_SRC_0     (0x068 >> 2)
+#define GPIO_1_8V_E_COMMAND_SRC_1     (0x06C >> 2)
+#define GPIO_1_8V_ABCD_DATA_READ      (0x0C0 >> 2)
+#define GPIO_1_8V_E_DATA_READ         (0x0C4 >> 2)
+#define GPIO_1_8V_ABCD_INPUT_MASK     (0x1D0 >> 2)
+#define GPIO_1_8V_E_INPUT_MASK        (0x1D4 >> 2)
+#define GPIO_1_8V_MEM_SIZE            0x1D8
+#define GPIO_1_8V_REG_ARRAY_SIZE      (GPIO_1_8V_MEM_SIZE >> 2)
 
 static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
 {
-- 
2.32.0

