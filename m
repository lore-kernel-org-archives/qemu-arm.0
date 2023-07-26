Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp266254ejb;
        Tue, 25 Jul 2023 20:33:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEighwLLKv63bMqt0jhHB9tHVd7W2akoGqju1xizBLbo7CK/kO7sgCjlxXcpgmvYNCGrtkf
X-Received: by 2002:ac8:5b09:0:b0:404:e76:a1c1 with SMTP id m9-20020ac85b09000000b004040e76a1c1mr1023153qtw.47.1690342430524;
        Tue, 25 Jul 2023 20:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690342430; cv=none;
        d=google.com; s=arc-20160816;
        b=cw9f21CqVgP9hn5GZcCakKyV6APtJagBMkMRnvt8Ld+ZLYqygRbTM+K6+dQsOb9B2Q
         Qbzfssv5QTYkrUxRz9qaW1Qv1jIFbYYJkni3Pfai4oMTzHrAUj6uH2BABEwELTJ4ZOxV
         D+091kPV71eYVUlrUuLp0S0bI24td6CM1gH8FjIqaAAUHowWra2BgVdfTJ2v3B+u6J5I
         nLn9A7Y95I7fRQUAMUkhSZdXIPweKa9TJAK3LnGBhyvmf3UlZAQUApBwqywT8/EEEaDV
         LzFMUEoG3Touipmp2VsCyDjds5P2zLQfD55fc7Lkje08bBKWckKsvUGr8v7RYGnrothH
         wn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=o7zIkzaI1a62QrEcz/FY3julaQj7d2aOqS7MyikdcUw=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=dDMgiINqmAabW48M9mRSmkZxxfGr6E8zR1rFH2cD2Tupgt7oNLn4ZXFFTbCpmRh9fz
         A1jCbOMSXFXfVQRFXxdhQc7odw5RUv0MAzGxtC3Zy/CC7/WVog7EQeafi/gdOajannD3
         0QvIValooah+cyrpSnqqU1aaUoge1heUSu+FzCZEWWgteyZ6hJ8u4hZ/yIf/nKd38nCS
         CdGjrBIbmsIxTh3xgXxJAxjSjplLC+pwVU9YKPHiJvsfVIsMB/rgi72L7LgovY9eaHJj
         sKW1rNYmh1vum4I8WrrFR7s0oA6+7lE0rcrZNe5EseSspNON3cXm3fDWhkhYqWS2JbqS
         /G3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=GVfn75Kw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05622a005500b004039b1cb698si7438917qtw.554.2023.07.25.20.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 20:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=GVfn75Kw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOVGa-0005We-5y; Tue, 25 Jul 2023 23:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOVGX-0005Vj-CZ; Tue, 25 Jul 2023 23:32:45 -0400
Received: from mail-4317.proton.ch ([185.70.43.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOVGV-0007fZ-Rl; Tue, 25 Jul 2023 23:32:45 -0400
Date: Wed, 26 Jul 2023 03:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690342361; x=1690601561;
 bh=o7zIkzaI1a62QrEcz/FY3julaQj7d2aOqS7MyikdcUw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=GVfn75KwrfZJsb3XFefGW4/6uIkDXdNAefokYpn+uX1Ws0SlleU56hcC22cL/b06q
 JNIn/aMSWGRan2nV1M4AXe/YGGgLrKvkWtjn41/VTQzT7llgW7NXSdgLUrRTb0NTSE
 x+ksqXNcRniO8A5UqvDlpa1Aq8iCid+sRToO2fkG4gXydeHJ2pPBBq9+VSgpywAZ3n
 LXCubIaJXe18R0B4qCgZr512voanFUu4Fh7hr65P2eTxSfjAP6+qFHbnyw/wqpgw2Z
 10y31yP78Oqw+dqjx/EqzfxFF5efppNNYu9Dj4QxXqDcTiL4LppL/ctvquG393MqaI
 HWedNZMc+RUNw==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v2 6/6] qtest: microbit-test: add tests for nRF51 DETECT
Message-ID: <20230726030450.757462-7-chris@laplante.io>
In-Reply-To: <20230726030450.757462-1-chris@laplante.io>
References: <20230726030450.757462-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.17; envelope-from=chris@laplante.io;
 helo=mail-4317.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JQq1iX3nYuk8

Exercise the DETECT mechanism of the GPIO peripheral.

Signed-off-by: Chris Laplante <chris@laplante.io>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/microbit-test.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
index 6022a92b6a..8f87810cd5 100644
--- a/tests/qtest/microbit-test.c
+++ b/tests/qtest/microbit-test.c
@@ -393,6 +393,47 @@ static void test_nrf51_gpio(void)
     qtest_quit(qts);
 }
=20
+static void test_nrf51_gpio_detect(void) {
+    QTestState *qts =3D qtest_init("-M microbit");
+    int i;
+
+    // Connect input buffer on pins 1-7, configure SENSE for high level
+    for (i =3D 1; i <=3D 7; i++) {
+        qtest_writel(qts, NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START + i *=
 4, deposit32(0, 16, 2, 2));
+    }
+
+    qtest_irq_intercept_out_named(qts, "/machine/nrf51/gpio", "detect");
+
+    for (i =3D 1; i <=3D 7; i++) {
+        // Set pin high
+        qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", i, 1);
+        uint32_t actual =3D qtest_readl(qts, NRF51_GPIO_BASE + NRF51_GPIO_=
REG_IN);
+        g_assert_cmpuint(actual, =3D=3D, 1 << i);
+
+        // Check that DETECT is high
+        g_assert_true(qtest_get_irq(qts, 0));
+
+        // Set pin low, check that DETECT goes low.
+        qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", i, 0);
+        actual =3D qtest_readl(qts, NRF51_GPIO_BASE + NRF51_GPIO_REG_IN);
+        g_assert_cmpuint(actual, =3D=3D, 0x0);
+        g_assert_false(qtest_get_irq(qts, 0));
+    }
+
+    // Set pin 0 high, check that DETECT doesn't fire
+    qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", 0, 1);
+    g_assert_false(qtest_get_irq(qts, 0));
+    qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", 0, 0);
+
+    // Set pins 1, 2, and 3 high, then set 3 low. Check that DETECT is sti=
ll high.
+    for (i =3D 1; i <=3D 3; i++) {
+        qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", i, 1);
+    }
+    g_assert_true(qtest_get_irq(qts, 0));
+    qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", 3, 0);
+    g_assert_true(qtest_get_irq(qts, 0));
+}
+
 static void timer_task(QTestState *qts, hwaddr task)
 {
     qtest_writel(qts, NRF51_TIMER_BASE + task, NRF51_TRIGGER_TASK);
@@ -499,6 +540,7 @@ int main(int argc, char **argv)
=20
     qtest_add_func("/microbit/nrf51/uart", test_nrf51_uart);
     qtest_add_func("/microbit/nrf51/gpio", test_nrf51_gpio);
+    qtest_add_func("/microbit/nrf51/gpio_detect", test_nrf51_gpio_detect);
     qtest_add_func("/microbit/nrf51/nvmc", test_nrf51_nvmc);
     qtest_add_func("/microbit/nrf51/timer", test_nrf51_timer);
     qtest_add_func("/microbit/microbit/i2c", test_microbit_i2c);
--=20
2.41.0


