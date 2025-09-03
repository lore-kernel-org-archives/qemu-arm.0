Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9507CA1010
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 22:22:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utvqu-00055e-ES; Wed, 03 Sep 2025 18:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3S7W4aAkKCOQROdOGUeGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--lixiaoyan.bounces.google.com>)
 id 1utvBO-0005jt-Sp
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 17:38:24 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3S7W4aAkKCOQROdOGUeGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--lixiaoyan.bounces.google.com>)
 id 1utvBN-0003Sk-2N
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 17:38:22 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-3278bb34a68so235564a91.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 14:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756935499; x=1757540299; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+zcM05GvvS4GHeBuorcNVf0xKSlX7M5kidK6nG2nUik=;
 b=N1mcdyl+PpiO6vqJ9ku8No1mCwHCfgdwSG4eV5i1Gm7W1rgHA8nwmPcx7s6FcmSDmU
 Lk5yr6VyoESLnFPuNJ33mki3gJq5o7pbV7EtoDKktWExEXV5eyHWFXF2DbJVulAu0b8E
 CZKgIGinJ4iEdkllWElmgDYranC7XzMWwWsCvLhbYzNwrMBgZvz1glOWaF/sps7h8XuV
 YJeRQt0zrfWJ6oI0VvJqyuXy7mcstSBSFCwg3idsC6wkxUWsXxHK8jPcVMx/aGT0dZ16
 rtWOOCqgSQ9cYmjOmahM2SFtrZ7AGHlUF4K85x3zawlZuDftTGTNHx57Ioq90oVrYicD
 Yeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756935499; x=1757540299;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zcM05GvvS4GHeBuorcNVf0xKSlX7M5kidK6nG2nUik=;
 b=ltMdZJXiFK8z0MlqPa6TX36dq4C2j97ASuVY+rNcapbiCDUu0xLBe/PGqBoqpwOf4l
 FOyppY2FI9eTIl+J4KGmZx+jhbpsWhnbzyAy2vQpQYUAGFuLN64GZH34n/IlgRD228zV
 GS0td4G53JnJ+F3CeeXw14B/KbzR3+vx1J6HF5GgIHBwyHIC0Zxn2i5aYwbPSWb1yAlx
 P+49jPdkAcLbJrN4Tc0vJF/S2gNOEUns1L1yN9QDYaX2MZADkZ+vpzeEiZBjvknRYApc
 0J+NpischNYXrwR2vwvEY3htrKreqdXWO9SHCarVc4Iw5/YsmeIPNtOpFweTBN2pjd4I
 jsDA==
X-Gm-Message-State: AOJu0Yx0UozSnG14+Bm4yS8kEypmVfjPVO+ftPugPvlF74fB+288MwJa
 kWViYONUql5hLF/gKgBw8Xcyq1knJQUrBNe/GfgZ4w7SFUkOd3+LGu50UraQJ+OVpEu/eiCZV7N
 h6ifEY1hA6EZk50UO7A==
X-Google-Smtp-Source: AGHT+IFcjX51J6O7Fyq91Ztstg7JQkQF43UdkglqQqw5eUmnPiM1PoCkackREdp2JddDcdT2E7C6UwTxO0nv0fY=
X-Received: from pjbcz3.prod.google.com ([2002:a17:90a:d443:b0:329:b272:45a7])
 (user=lixiaoyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28cb:b0:327:b33e:39d5 with SMTP id
 98e67ed59e1d1-328156e5d7emr23401472a91.37.1756935499113; 
 Wed, 03 Sep 2025 14:38:19 -0700 (PDT)
Date: Wed,  3 Sep 2025 21:38:06 +0000
In-Reply-To: <20250903213809.3779860-1-lixiaoyan@google.com>
Mime-Version: 1.0
References: <20250903213809.3779860-1-lixiaoyan@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250903213809.3779860-3-lixiaoyan@google.com>
Subject: [PATCH 2/5] tests/qtest: Add qtest for for ASPEED GPIO gpio-set
 property
From: Coco Li <lixiaoyan@google.com>
To: peter.maydell@linaro.org, clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Felix Wu <flwu@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3S7W4aAkKCOQROdOGUeGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--lixiaoyan.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -86
X-Spam_score: -8.7
X-Spam_bar: --------
X-Spam_report: (-8.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_FROM=0.938, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Sep 2025 18:21:02 -0400
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

From: Felix Wu <flwu@google.com>

 - Added qtests to test gpio-set property for ASPEED.
 - Added function to get uint in qdict.

Signed-off-by: Felix Wu <flwu@google.com>
---
 include/qobject/qdict.h        |   1 +
 qobject/qdict.c                |  13 ++++
 tests/qtest/aspeed_gpio-test.c | 105 ++++++++++++++++++++++++++++++---
 3 files changed, 110 insertions(+), 9 deletions(-)

diff --git a/include/qobject/qdict.h b/include/qobject/qdict.h
index 903e6e5462..861996f08d 100644
--- a/include/qobject/qdict.h
+++ b/include/qobject/qdict.h
@@ -57,6 +57,7 @@ void qdict_put_str(QDict *qdict, const char *key, const char *value);
 
 double qdict_get_double(const QDict *qdict, const char *key);
 int64_t qdict_get_int(const QDict *qdict, const char *key);
+uint64_t qdict_get_uint(const QDict *qdict, const char *key);
 bool qdict_get_bool(const QDict *qdict, const char *key);
 QList *qdict_get_qlist(const QDict *qdict, const char *key);
 QDict *qdict_get_qdict(const QDict *qdict, const char *key);
diff --git a/qobject/qdict.c b/qobject/qdict.c
index a90ac9ae2f..0dafe6d421 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -209,6 +209,19 @@ int64_t qdict_get_int(const QDict *qdict, const char *key)
     return qnum_get_int(qobject_to(QNum, qdict_get(qdict, key)));
 }
 
+/**
+ * qdict_get_uint(): Get an unsigned integer mapped by 'key'
+ *
+ * This function assumes that 'key' exists and it stores a
+ * QNum representable as uint.
+ *
+ * Return unsigned integer mapped by 'key'.
+ */
+uint64_t qdict_get_uint(const QDict *qdict, const char *key)
+{
+    return qnum_get_uint(qobject_to(QNum, qdict_get(qdict, key)));
+}
+
 /**
  * qdict_get_bool(): Get a bool mapped by 'key'
  *
diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index 12675d4cbb..c2f9ca2298 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -27,28 +27,115 @@
 #include "qemu/timer.h"
 #include "qobject/qdict.h"
 #include "libqtest-single.h"
+#include "qemu/typedefs.h"
 
 #define AST2600_GPIO_BASE 0x1E780000
 
 #define GPIO_ABCD_DATA_VALUE 0x000
 #define GPIO_ABCD_DIRECTION  0x004
 
+static uint32_t qtest_qom_get_uint32(QTestState *s, const char *path,
+                                     const char *property)
+{
+    QDict *r;
+
+    uint32_t res;
+    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
+                     "{ 'path': %s, 'property': %s } }", path, property);
+    res = qdict_get_uint(r, "return");
+    qobject_unref(r);
+
+    return res;
+}
+
+static void qtest_qom_set_uint32(QTestState *s, const char *path,
+                                 const char *property, uint32_t value)
+{
+    QDict *r;
+
+    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
+                     "{ 'path': %s, 'property': %s, 'value': %" PRIu32 " } }",
+                     path, property, value);
+    qobject_unref(r);
+}
+
+static const char *resp_get_error(QDict *r, const char* error_key)
+{
+    QDict *qdict;
+
+    g_assert(r);
+
+    qdict = qdict_get_qdict(r, "error");
+    if (qdict) {
+        return qdict_get_str(qdict, error_key);
+    }
+
+    return NULL;
+}
+
+static bool qtest_qom_check_error(QTestState *s, const char *path,
+                                  const char *property, const char *error_msg,
+                                  const char *error_msg_key)
+{
+    QDict *r;
+    bool b;
+
+    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
+                     "{ 'path': %s, 'property': %s } }", path, property);
+    b = g_str_equal(resp_get_error(r, error_msg_key), error_msg);
+    qobject_unref(r);
+
+    return b;
+}
+
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
-
+    const char path[] = "/machine/soc/gpio";
     /*
      * gpioV4-7 occupy bits within a single 32-bit value, so we want to make
      * sure that modifying one doesn't affect the other.
      */
-    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
-    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
-    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
-    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
-    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
-    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
-    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
-    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
+    qtest_qom_set_bool(s, path, "gpioV4", true);
+    qtest_qom_set_bool(s, path, "gpioV5", false);
+    qtest_qom_set_bool(s, path, "gpioV6", true);
+    qtest_qom_set_bool(s, path, "gpioV7", false);
+    g_assert(qtest_qom_get_bool(s, path, "gpioV4"));
+    g_assert(!qtest_qom_get_bool(s, path, "gpioV5"));
+    g_assert(qtest_qom_get_bool(s, path, "gpioV6"));
+    g_assert(!qtest_qom_get_bool(s, path, "gpioV7"));
+
+    /*
+     * Testing the gpio-set[%d] properties, using individual gpio boolean
+     * properties to do cross check.
+     * We use gpioR4-7 for test, Setting them to be 0b1010.
+     */
+    qtest_qom_set_uint32(s, path, "gpio-set[4]", 0x0);
+    g_assert(qtest_qom_get_uint32(s, path, "gpio-set[4]") == 0x0);
+    qtest_qom_set_uint32(s, path, "gpio-set[4]", 0xa000);
+    g_assert(qtest_qom_get_uint32(s, path, "gpio-set[4]") == 0xa000);
+
+    g_assert(!qtest_qom_get_bool(s, path, "gpioR4"));
+    g_assert(qtest_qom_get_bool(s, path, "gpioR5"));
+    g_assert(!qtest_qom_get_bool(s, path, "gpioR6"));
+    g_assert(qtest_qom_get_bool(s, path, "gpioR7"));
+
+    /*
+     * Testing the invalid indexing, the response info should contain following
+     * info:
+     * {key: "class", value: "GenericError"}
+     *
+     * For pins, it should follow "gpio%2[A-Z]%1d" or "gpio%3[18A-E]%1d" format.
+     */
+    const char error_msg[] = "GenericError";
+    const char error_msg_key[] = "class";
+
+    g_assert(qtest_qom_check_error(s, path, "gpioR+1", error_msg,
+                                   error_msg_key));
+    g_assert(qtest_qom_check_error(s, path, "gpio-set[99]", error_msg,
+                                   error_msg_key));
+    g_assert(qtest_qom_check_error(s, path, "gpio-set[-3]", error_msg,
+                                   error_msg_key));
 }
 
 static void test_set_input_pins(const void *data)
-- 
2.51.0.338.gd7d06c2dae-goog


