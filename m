Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1608745lfb;
        Fri, 3 Sep 2021 12:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV+n95DUEABp5ukuSubb1F+y0yGL7qj1151ulMqvnb1g62rgOM426qzd440mabag5xdRqL
X-Received: by 2002:a05:6638:619:: with SMTP id g25mr626230jar.38.1630698557346;
        Fri, 03 Sep 2021 12:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630698557; cv=none;
        d=google.com; s=arc-20160816;
        b=GWcnrqwmMmnUlqRhmecfXKpaH6NkF5VoKY33Q+UN1UKCAkFcHq1Pz4kpcw8d87jlwV
         h6aEc5SFMUZl9Pl4ms9iXearX+ZeIRklXQTTdsylonTirP14wbLqkzXFT7+xTcfui2oU
         Avc1zfspKnbFsnXVCLfdqkKca5Mrsv3NIFk8gi10/ojj6Vun8Y7ehtynLmQVau2OHqaT
         cNq18Lujhvih3PFN/wOeaP5gr9bRL8T7XYYnXoMJv9Y98Fc4aqsSdPUcYMxlIefgr5dL
         XomHejXfALSXAzsctR8SwFPw1ySWhGSpi5IMbTjNgq+GuU7v67nLqRSZbwMcugyRTffY
         s7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=bTzMnQnAzGQwR0xamNaZY19Jsah65lLBnMI+EuV+DgI=;
        b=z1LscQd2S6bnWd8lvvQRNxwCayAKNY1xyPcQFPDdXy8rPgjpzDMUliIlYTjYSDqlh/
         hUqU3W0RZ4B4sk18JiM2OnknSrqlvWIgcohzMFs85KGb0bsgPzv8QlFERr9eMQ94En9F
         i2O8NSOFKfGIHdFqpoJeuWhgNUqpd7OqrGnYuasE4s6lNwBAZVPiQHOZzXerPnPDJ0vh
         Q8QJPt0ynwXsG4vrLJ8BThYzGT2IHLQTB73WnYqfsf9+tiHH2bQKHjGBfYAdaOXqUv05
         PNYelVIbvASi6Mxt1wpdDZ9QX1k6SGe01WbmVVqK9hmPePytf/YgvPMBhLmINy96i4el
         gyxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v66si337918iof.105.2021.09.03.12.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMFBc-0003FZ-Kn
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF45-0004Dq-Me; Fri, 03 Sep 2021 15:41:29 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF3z-0002Hc-HH; Fri, 03 Sep 2021 15:41:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EB1A8BC4DEF1;
 Fri,  3 Sep 2021 21:41:12 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005917bad50-78af-415b-b70b-7c29cfd75f35,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/14] hw: aspeed_gpio: Simplify 1.8V defines
Date: Fri, 3 Sep 2021 21:40:59 +0200
Message-ID: <20210903194108.131403-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cb1f82cc-85b6-44ff-87d5-c4cdefbe6834
X-Ovh-Tracer-Id: 8815796270817643372
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ccP+05vDA3p

From: Joel Stanley <joel@jms.id.au>

There's no need to define the registers relative to the 0x800 offset
where the controller is mapped, as the device is instantiated as it's
own model at the correct memory address.

Simplify the defines and remove the offset to save future confusion.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210713065854.134634-3-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
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
2.31.1

