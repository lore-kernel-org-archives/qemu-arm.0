Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp167581njc;
        Fri, 27 Sep 2024 00:33:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtaJq8WqK/mOsQ0qdjfFXPz9JYgj+UdsdwfOwffptzj/oS7uie/Tm8UCivTGJ+HNZmgWJYCreDgHBnMg==@linaro.org
X-Google-Smtp-Source: AGHT+IF6Br+J7XSbC7clSLfwoCvh42K35gz2i+rOY9127H/HLQ5s8AhioyzV/497Vopr4iSzjW/Z
X-Received: by 2002:a0c:f408:0:b0:6b5:e2d9:cfb9 with SMTP id 6a1803df08f44-6cb3b63f633mr32595636d6.39.1727422397943;
        Fri, 27 Sep 2024 00:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727422397; cv=none;
        d=google.com; s=arc-20240605;
        b=E9Y8PhrB/yjxUTAg7lHfVXv8tZfo+ryGzddXUO8Y0d4ns86crTIzD2uJSIyXAVoiry
         cMCpA6lPzOe6HUCVxawDSYt0UlM35LCxKrCBlkSEm9Be6wgMXV7aeKz5KznLHOT8ejik
         U+9StSmQHN3tM9opKOAMe9mzt5AMCyqN/QhKFnvEZs7tRhnPwB5t4s3DpX9XbRUYkrPc
         gDbIY4l+be9+Q5bIBKiArpVjerINMpIQuoz3vWTfexzIJ8CM+7Wtpoil2oGbEjoVrfls
         x7GsQIoQRBeFSySB85Y138ERjsfeJjYSd+RMfvvhOHempXYHsU1ACYcEFI6eFBh3LxsT
         bqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=e0SkGRcHUkDwsDyAeqiATDM2Gx/v8I3Leb4RANoPC1U=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=h2zyhzwFYRNU/B1hTFSFKxT3cjQjt/AYiyHdYXB9iTTAfheJkA6DZk8f9woTbYeEtm
         4Nv2WxOmmeju+9dGICAvA+x+CC0zBqKqa7DoDkmP6qd0yAk6CyQv4rIVN6YwrDTZXURQ
         6B3n7Az8P+RfAatWnx6YZH+QVGvsuXAEoYVr62fLGB4njx8a7AtvIEjjBR2n8fwbLi34
         WTa2r+cvWzVJxV+ILqWWrDnm83OmU0EkooZXhM6xcmeAujyv1TTHb0sZDzhXqxG0+rCy
         go7LdJ2kxYBD6LpY7yQFyTetteFHlhZbtMqGwIlmqNS7bZPz4tad41lz/44whXdbElec
         cq/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b605205si16630126d6.72.2024.09.27.00.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 00:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su5Sq-0003FQ-E8; Fri, 27 Sep 2024 03:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su5Se-0002Ij-SU; Fri, 27 Sep 2024 03:32:21 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su5Sd-0004DY-BT; Fri, 27 Sep 2024 03:32:20 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 15:31:46 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 15:31:46 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v4 7/7] hw/gpio/aspeed: Add test case for AST2700
Date: Fri, 27 Sep 2024 15:31:44 +0800
Message-ID: <20240927073144.2303522-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927073144.2303522-1-jamin_lin@aspeedtech.com>
References: <20240927073144.2303522-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HQf01eKZhLgD

Add test case to test GPIO output and input pins from A0 to D7 for AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed_gpio-test.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index d38f51d719..8ae42a8da5 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -33,6 +33,10 @@
 #define GPIO_ABCD_DATA_VALUE 0x000
 #define GPIO_ABCD_DIRECTION  0x004
 
+/* AST2700 */
+#define AST2700_GPIO_BASE 0x14C0B000
+#define GPIOA0_CONTROL 0x180
+
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
@@ -72,6 +76,61 @@ static void test_set_input_pins(const void *data)
     g_assert_cmphex(value, ==, 0xffffffff);
 }
 
+static void test_2700_output_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    uint32_t offset = 0;
+    uint32_t value = 0;
+    uint32_t pin = 0;
+
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            offset = AST2700_GPIO_BASE + GPIOA0_CONTROL + (pin * 4);
+
+            /* output direction and output hi */
+            qtest_writel(s, offset, 0x00000003);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0x00000003);
+
+            /* output direction and output low */
+            qtest_writel(s, offset, 0x00000002);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0x00000002);
+            pin++;
+        }
+    }
+}
+
+static void test_2700_input_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    char name[16];
+    uint32_t offset = 0;
+    uint32_t value = 0;
+    uint32_t pin = 0;
+
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            sprintf(name, "gpio%c%d", c, i);
+            offset = AST2700_GPIO_BASE + GPIOA0_CONTROL + (pin * 4);
+            /* input direction */
+            qtest_writel(s, offset, 0);
+
+            /* set input */
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0x00002000);
+
+            /* clear input */
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, false);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0);
+            pin++;
+        }
+    }
+}
+
+
 int main(int argc, char **argv)
 {
     QTestState *s;
@@ -83,6 +142,11 @@ int main(int argc, char **argv)
     qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
                         test_set_colocated_pins);
     qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
+
+    s = qtest_init("-machine ast2700-evb");
+    qtest_add_data_func("/ast2700/gpio/input_pins", s, test_2700_input_pins);
+    qtest_add_data_func("/ast2700/gpio/out_pins", s, test_2700_output_pins);
+
     r = g_test_run();
     qtest_quit(s);
 
-- 
2.34.1

