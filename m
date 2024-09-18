Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp978433njg;
        Wed, 18 Sep 2024 12:24:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXP94JUAwHgjpCANkv3fnvpXUUP0OcZ15cE8+lAIoATnMBcBKpmc6IjcQRun+NNgRtFdA/v8zlx0G6HGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGxpctclSOwB5OxZOdJRWuW7zXkIa2hrUrgzgkLDYCTRc8AEzlmoF0wS1+x+t5yovh1/smY
X-Received: by 2002:a05:620a:2a13:b0:7a9:c146:a9e9 with SMTP id af79cd13be357-7a9e5f0308fmr3655729585a.15.1726687488381;
        Wed, 18 Sep 2024 12:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687488; cv=none;
        d=google.com; s=arc-20240605;
        b=EhftQh8UIhNdcHlfkjlzEnpSK3FlIn256G8w2XVSq+L5CRMKPu54wOI+E64zvFGQtZ
         TCIXtvdqddO7ov8zC7z8PzmW3yHDt2XCsAqunTM0yqi7ktgEVCq/TCyD5aDgNN5YPjUD
         1F+Cg+1EqKkgQ7Qr+GF+SVG2tGgcWw79Sd2q8uSQPBeZ0xf6GGawe4E11H44H7XyEOub
         mWIHnrX23U81tOTrODjzl7mIgp64ZCAm6YDrjhIbGoYUES1UIOUsjwxTscSqfvoVx1fJ
         HYn6/ezi3G8GrkOnS6JODiR41OF9+NK8pH6yWxI/H8/ljdR0TyGgTuzNT7Y94vDUrMqu
         +CSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=HmWuRxg44yVQ0HmHhf9/Qn51jwseOfLAmYdAlCa+aBg=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=KINC0i6PfDHiBZkGYFzICXTwUfCEK01ispO2SFdOGivGIH+yGunjoKku3GS3POMiyq
         gHitwUtyQt3qp2KlBeLOJ9NUvXuoVGHm8S0en/VRytU6rWZgCaDvobBuRInYHEF7RYem
         u6JeAmIVgunFgQslESZdBeu1LE5zD/zjnnCXJOOwZ+1cPtRhLDQDUcDvnvA8e5WCGX6B
         9MuVi52rOh3kK2ddxqJCz2DvVbkUXnFxlqoRYhuLBqNDMjO9CdlHfQ5LTRyOdJEGAOLj
         VrxO4TLg0U+wbBnfFkmNWwJcWS7qo3SQoz6Hb6ZWqzISG2z6bJnWONtIqwqEIaLP8D25
         yA+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=b04drPva;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b179120e0si957121cf.413.2024.09.18.12.24.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:24:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=b04drPva;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sr0H0-0005ej-FK; Wed, 18 Sep 2024 15:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ryjrZgUKCuofMhUbSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--tavip.bounces.google.com>)
 id 1sr0Gy-0005XD-9P
 for qemu-devel@nongnu.org; Wed, 18 Sep 2024 15:23:32 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ryjrZgUKCuofMhUbSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--tavip.bounces.google.com>)
 id 1sr0Gw-0007OY-KT
 for qemu-devel@nongnu.org; Wed, 18 Sep 2024 15:23:32 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2d8759255d4so200065a91.3
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2024 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687409; x=1727292209; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HmWuRxg44yVQ0HmHhf9/Qn51jwseOfLAmYdAlCa+aBg=;
 b=b04drPva2CUU7OQDCreihGEaMgqW4Jm/PGYoCO25zJLd5K/09sIgo8UpgyDbFja5jr
 seJ0JVwo1FsVCyBpyLFtIziyBo20vF4yEb/bE5HL5Gd7Zae7H6ocRa/19UzBi0/0r2bE
 DoUGcxQNJzOskz7jJsKkchjK3OC7EbNhujU/Wd4KNM7TpU/j7FlZ9ydMlOvhXn5ZwOYg
 P6ie7XxADsXe9joed+HfUlQs+vAC8U2Yb0Wo+O1ntAFCreSIH4Fzi5TlKRxsXdT3HkQ8
 /1J0JkjR4zwHcI0GqHtO2RwRSIstIH2Kp7c+JHp2Oo0UER41l0Hx8igcUvBi5Q83vTPo
 tv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687409; x=1727292209;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HmWuRxg44yVQ0HmHhf9/Qn51jwseOfLAmYdAlCa+aBg=;
 b=runJSs0vFOwWaavRCsk62I7/m1lcBVrT9yuN1eODMRWtAVvjO9fqAWuB2O0fU7dk8n
 Klz0RmjlwyZyAewTqUvNIculktEP5r/PI+Nd3y4YGu0sfwGm9KEJONyq1L4h/rrvO825
 0BlHdvuInp2ZSVyRilGK/H7QIhPqOkPzhuPjaBlH3npwnXAGl/WxEE4XRpLOBkObhDta
 Ga6HRbRvNMeukSekPCd4O4ufZWTcNz7s5dagnwU/oyZ9c4dSH3ODtmg6ypOO/nJqLgz7
 na0wsL6n7OlbBiR+ljpO8abkSTdIz5DXYLpLso2HK1XHxNvaPpelpmqZALMDtXhWkWKE
 RDlg==
X-Gm-Message-State: AOJu0YwuFoJ4JaXMk8LYCDOlx/DZ4+ehFPKJnkZd7I/vUKVCAxSCo2mo
 0LbuNbUOlzHBAFxsqdmxnJJjEpb5fmeXRjtfKE0IMLgxSlTytIepVSRjRf/sSkLA/e1jVfdvyPw
 LQ5upNhCiYKfryEVV7g4iWInjWxQAxZDHqGFlIdO+r2jtxjzSsl0vXCiOjQLL6Wgi/35wsbBByY
 1yO7NT2exS6D8sAbttz2r+bFwSQQ==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90a:ebc9:b0:2d8:8e8a:2b06
 with SMTP id
 98e67ed59e1d1-2dbb9ebabf8mr66302a91.4.1726687407717; Wed, 18 Sep 2024
 12:23:27 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:45 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-18-tavip@google.com>
Subject: [PATCH 17/25] tests/qtest: add flexcomm tests
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3ryjrZgUKCuofMhUbSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--tavip.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: L2tO0Vrw3Tqg

Add flexcomm function selection unit tests.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/flexcomm-test.c | 82 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build     |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 tests/qtest/flexcomm-test.c

diff --git a/tests/qtest/flexcomm-test.c b/tests/qtest/flexcomm-test.c
new file mode 100644
index 0000000000..ffbee8bfb8
--- /dev/null
+++ b/tests/qtest/flexcomm-test.c
@@ -0,0 +1,82 @@
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/misc/flexcomm.h"
+#include "hw/arm/svd/flexcomm.h"
+#include "hw/arm/svd/rt500.h"
+#include "reg-utils.h"
+
+#define FLEXCOMM_BASE RT500_FLEXCOMM0_BASE
+
+static void select_test(gconstpointer data)
+{
+    static const unsigned persel[] = {
+        FLEXCOMM_PERSEL_USART,
+        FLEXCOMM_PERSEL_SPI,
+        FLEXCOMM_PERSEL_I2C,
+    };
+
+    g_assert(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL) == 0);
+
+    /* no register access until a function is selected  */
+    readl_fail(FLEXCOMM_BASE);
+    writel_fail(FLEXCOMM_BASE, 0);
+
+    for (int i = 0; i < ARRAY_SIZE(persel); i++) {
+
+        REG32_WRITE(FLEXCOMM, PSELID, persel[i]);
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                         persel[i]);
+
+        /* test that we can access function registers */
+        writel(FLEXCOMM_BASE, 0xabcd);
+        readl(FLEXCOMM_BASE);
+    }
+
+    /* try to select something invalid */
+    REG32_WRITE(FLEXCOMM, PSELID, 7);
+    /* check for no function selected */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==, 0);
+
+    /* now select and lock USART */
+    REG32_WRITE(FLEXCOMM, PSELID,
+                FIELD_DP32(FLEXCOMM_PERSEL_USART, FLEXCOMM_PSELID, LOCK, 1));
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                     FLEXCOMM_PERSEL_USART);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, LOCK), ==, 1);
+
+    /* try to change the selection to spi */
+    REG32_WRITE(FLEXCOMM, PSELID, FLEXCOMM_PERSEL_SPI);
+    /* it should still be locked USART */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                     FLEXCOMM_PERSEL_USART);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, LOCK), ==, 1);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/flexcomm/select", NULL, select_test);
+    qtest_start("-M rt595-evk");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index fc852f3d8b..cb35778ce6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -231,6 +231,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM')? ['flexcomm-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.46.0.662.g92d0881bb0-goog

