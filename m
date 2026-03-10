Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D1FEB1072
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 15:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzz5z-0002wU-5I; Tue, 10 Mar 2026 11:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzz5k-0002rd-KZ
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:33:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzz5f-0007rs-Ub
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:33:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso6822109f8f.1
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773156823; x=1773761623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgItLWleYDMgqjfqaZWlaJdobsVkFs5LpuLzkjcWcM8=;
 b=eTRSOYVS2fJnyXW0xksorvmbOlrooahpJj34AQpXvHnykDJ5EXBF6GlJUMHdzO7xbx
 okOhq618LNUNlBRrtUiforjbKL9PZ3slLVZCMEx+FmZxo27CBMI5Cuqw7UxqTdAB+hmP
 eVkm6Vt5cM+ZG1pFf753D5FvLjptmED/e791QPvOtDHYBreimBB42Mp2wgfVF6OfX2WG
 86eREbKcrPL88LiesO8/QBVsVZgh0F9OadqEwmOWdqCyHtCK+VPuaPLWe2xKMToHDuZn
 gHJninR8Bwa7dIrPbP0fpvQYp/gIWajxDPfisaCFmAxG61DRj6OBxM5Ejc5daIO5IXSf
 bk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773156823; x=1773761623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DgItLWleYDMgqjfqaZWlaJdobsVkFs5LpuLzkjcWcM8=;
 b=jRp4niWlyrFHmAOcQqMg4yzMoCo9tzU12xlJBuBadmCS/LqwxtIzKtB8PlFje9nKuK
 QKVwkuEMcWQkEaliPIn6W2NBIeWabWUoGquAAo++FiKwOiKgtyaWKegcsZ6sXyvTP0S6
 MiBsrn+Vwu9nfGBwBhP119uh+sJr2506UFLBqPHyAQ/ecpwB+VNDC+iBM07kCJNrBGIS
 sp36JGLOKTEBq5tTaBOJ93toHpeFd5DBkUFh+Er0Ge7z+g0D6MD6sdKReZPVRohjLKG9
 3qMsWs5vQBXgnJJIFcJ+VQNm1TacmoJgtQ4PNeVHKUy2GubTk+wEz8TGo4MMtGGkyOsb
 Ciew==
X-Gm-Message-State: AOJu0YyWGY/DQCeGDQHu+7W+djoPC7vX/Hxueg3bnJo5W5L53XFTYFbI
 SM8qf3UdzcqUg82/LvyPrh7YL0A7CfBgoS7LsERHsHFVLvzUc4/LWy+FFROltRVwx+YlR0Bp5LI
 9B80W
X-Gm-Gg: ATEYQzzyIDq2qwRF5rX17u5mSqdfqunPEKZSKOglv8tIVLX2wTtDHEOxX+EeyjvlDk4
 kPWiNS3dmYtH/G6RJ2aOitfsqrK6NWp2sPj9Lct5dAQ3UQIO8sOSPksLNp9BZTum9dVZ5GwyE4G
 7tej3Lh/nVtpfFfQSgZbenTEC7VFlHRJBLWPt+D86v+JC4j8+kyyTmjWRnniOENq0NvXKbm2t5L
 OAZ5R5estujtcQw7XX7ubw//b822CUZx7H1vjzTqVqgxwK//n2YkaXQD+ZgteVlpcaSIxVDnlHA
 g7gca8TLCPZJi1q0wEibyAc9kZ/HTk7h6RBjrEg0zpVw/7tgdegZz+qQTcKKWHAkLdI1JxGG+ub
 sAlhhAiaG/i60WGMVKHXimLTXwlQwT6en6q+RIsenTMo1M4urnBwvIfrj6iu8Wk9RqxwF1j8+OP
 Xfn/CG807zeCj5VyrwNuVXmHhyeloV6klCwOvDQaIIK2K5tvaUmTibgxYi1JzYfO/4N2JA7wTia
 p3q44R4Stkf4JVlf2J4TDBtY+1VSDI=
X-Received: by 2002:a05:6000:26c7:b0:439:b79d:b9ac with SMTP id
 ffacd0b85a97d-439da67c237mr25995069f8f.45.1773156822857; 
 Tue, 10 Mar 2026 08:33:42 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm41709388f8f.32.2026.03.10.08.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 08:33:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/2] tests/qtest/aspeed_gpio-test: Use g_strdup_printf()
 instead of char arrays
Date: Tue, 10 Mar 2026 15:33:34 +0000
Message-ID: <20260310153334.3063224-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310153334.3063224-1-peter.maydell@linaro.org>
References: <20260310153334.3063224-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Older versions of gcc with -Wformat-overflow=2 don't like the usage of
fixed size char arrays in this test; gcc 7.5.0 (SUSE Linux) says:

../tests/qtest/aspeed_gpio-test.c: In function ‘test_set_input_pins’:
../tests/qtest/aspeed_gpio-test.c:149:36: error: ‘sprintf’ may write a terminating nul past the end of the destination [-Werror=format-overflow=]
             sprintf(name, "gpio%c%d", c, i);
                                    ^
../tests/qtest/aspeed_gpio-test.c:149:13: note: ‘sprintf’ output between 7 and 17 bytes into a destination of size 16
             sprintf(name, "gpio%c%d", c, i);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This can't actually happen because of the limited size of the values
being substituted in.  However rather than require readers to check
whether the arrays really have been declared large enough, we prefer
to use g_strdup_printf() for this kind of string work.

Reported-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/aspeed_gpio-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index decbba23c8..029b3731d1 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -140,13 +140,13 @@ static void test_set_colocated_pins(const void *data)
 static void test_set_input_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
-    char name[16];
     uint32_t value;
 
     qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DIRECTION, 0x00000000);
     for (char c = 'A'; c <= 'D'; c++) {
         for (int i = 0; i < 8; i++) {
-            sprintf(name, "gpio%c%d", c, i);
+            g_autofree const char *name = g_strdup_printf("gpio%c%d", c, i);
+
             qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
         }
     }
-- 
2.43.0


