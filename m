Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1490514njf;
        Sat, 17 Aug 2024 03:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJDxGPsGIevSjI0pGAQy+wsPEBUQLxMz58PDbLB7D7IN1i1GbDbYp6578QjUVe8IWYiHUUw5Z/TrygWq4esYhopz/2BFG3
X-Google-Smtp-Source: AGHT+IGHrBwv+SR3jLqSsVas2h9F/LUeJ4xo3FVO9GEPcx2rluvnTiKHwhbnfteHPcSgi7ZkRNom
X-Received: by 2002:a05:6214:418c:b0:6b5:752e:a33a with SMTP id 6a1803df08f44-6bf7ce9d487mr47478206d6.57.1723890453628;
        Sat, 17 Aug 2024 03:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723890453; cv=none;
        d=google.com; s=arc-20160816;
        b=QivJsToXfje0jLPXmsduJwYcWHNLzxqawLgK6WAKjWWLxUGgUq2bslU5cKrHRhC8A7
         FAc4f38I9vJmcUXMnTnU9LEj4zZ+pU4FU1KoXLs2Y1SJ0WHIr08VvgTFALUeSOAP26pr
         iUh5ljK+2cR3W6HCqPm5dAPSA7Guh008GmX6JL4u/U/PSb808YVSunJpyk/StYOdM36/
         5E3w9M7VxazAXbh3D9hHncSfbg232YB5fLlnd0vhVKwTQVx1ckfu40/kpYTJMz4Yz1sh
         9b/p6fuquRxZTrvrs7KSS34X9U/ln0TtCySk5BwOqABHOeKL7jIUmdRv1sJXngRSrybq
         GLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=EdDFjN4g9840m4ms6BWuG3c9OsfCPZptsfLAgkhTmCM=;
        fh=pITIqJh0Z5XaT4QxI/zJAgHBZTuNeZPw20HbjxZRX7I=;
        b=Ba+k0aKG0Q3PfpRKBAi9GGxuWHmjZ9DJxvsB0r1xjQEd+ct16aJ3QsrD3Yj94x1ZLB
         NfuWN4+yWzZpTd+nfaqxGNxJA3BDiOYOpUY4yyIGdhc2FzxMYqZygr24BzENmdDt1ykA
         hOiPWSj3Q2lbCtyAdbd49FXPM4drDsvh34pT6HVCXBocLfZHIphxMT4n74aL389n9Eqf
         zgd9pN8cQ2d0E4JbRsWGtQjwMwHb1zvdZ7EkUS4JTqfUwbn9/Vj9q21hw/Gp71T+90LY
         0wWJbQJKLuCGDZfRPsANG4vhwtRy3XyLn/B0q9hCOHJSmAASktvIsJwiu9UuePgXLMb2
         kj9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sfl4HVdf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fec1119si59910526d6.212.2024.08.17.03.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2024 03:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sfl4HVdf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sfGdV-000640-EP; Sat, 17 Aug 2024 06:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3w3rAZgUKCPYrYtgnemmejc.amkocks-Ypklmlels.mpe@flex--tavip.bounces.google.com>)
 id 1sfGdU-00060A-HK
 for qemu-arm@nongnu.org; Sat, 17 Aug 2024 06:26:16 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3w3rAZgUKCPYrYtgnemmejc.amkocks-Ypklmlels.mpe@flex--tavip.bounces.google.com>)
 id 1sfGdS-00036u-Op
 for qemu-arm@nongnu.org; Sat, 17 Aug 2024 06:26:16 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e118098bdb0so3057559276.0
 for <qemu-arm@nongnu.org>; Sat, 17 Aug 2024 03:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723890372; x=1724495172; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EdDFjN4g9840m4ms6BWuG3c9OsfCPZptsfLAgkhTmCM=;
 b=sfl4HVdfERObjd8+7SaJGpmlnZvTEhfQzEvcKUsMDbu8skhuRRm9ojlPdRNmWkxg1L
 Bitq2SYyQJEpRvtRjJWZhhGOaSgSSKaaptzAtA2qDhrNpUYrLdB9SVqDCGTDX6SSqIwo
 AcfI8RUIniyBQa64XtLvgZpR8MQVhMQMf6Cu+PM+KCglGGnO1FC/iLi5edhI9uHK9KgH
 G+PPIDm8qUD/TNOH2e695pmVOqSDfktILPnYRVUMtcZ2Z1syOGoyHMqzCH8ldh8R5NP0
 Aq5loEGSuQvHt2XMIa5Zw4ysv0leh6SUyieB/fl7tkrn2LX/J/fOx93f6N/ruImpLj6T
 1mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723890372; x=1724495172;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EdDFjN4g9840m4ms6BWuG3c9OsfCPZptsfLAgkhTmCM=;
 b=qx+iooynBPobgbTJehAB0FMAJ2o5eXVSCCTzU4Yjf/dm65gpwm+bV1mLBo3F2wrss0
 Lt8faZTj4bJ10dcSmfE9J7LQ7XjtRyV+rVifxYQumPs+tCqzx9zkVySMgL+4TplWPWwf
 SUaLvnDbx+7vfT/w+o8qZQVlXkGnC9X9mgxrHlDrgXZqWsnkbQIEdXusAFww7f9Wx/BA
 30Ifmus7vbVw3wDqXXYPQ76lHmG80tBqsr3mFSi4MR89MwYZa2o/MITdKzdXJoP/FLxf
 pAjKmB/2340h+oze4BzCrMXKKRAMMi1MOp9AVKhmTSm0dtK6CsdjjCliTAxrAgYbBUcl
 +/hw==
X-Gm-Message-State: AOJu0YzM0Gqvihv5QpCtsh1R/JSEZpETWbN8uxljfjTXs3OMUofkEt1U
 xFpQuCmTJJZvm4PxVf7Kc7TJDpNlj9/Jx4rIoA7+08JoJ1NU/n2JLjQvPRFr/+TMQAQ2DOxLnQ=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a25:d311:0:b0:e0b:6bb1:fac with
 SMTP id
 3f1490d57ef6-e1180f677afmr53534276.9.1723890371752; Sat, 17 Aug 2024 03:26:11
 -0700 (PDT)
Date: Sat, 17 Aug 2024 03:25:45 -0700
In-Reply-To: <20240817102606.3996242-1-tavip@google.com>
Mime-Version: 1.0
References: <20240817102606.3996242-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240817102606.3996242-3-tavip@google.com>
Subject: [RFC PATCH v2 02/23] tests/unit: add fifo test
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 thuth@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 alistair@alistair23.me, berrange@redhat.com, philmd@linaro.org, 
 jsnow@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3w3rAZgUKCPYrYtgnemmejc.amkocks-Ypklmlels.mpe@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: QD+h/fVAF+8D

Add a simple FIFO unit test that test wrap around and push, pop and
peek for both fifo8 and fifo32.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/test-fifo.c | 97 ++++++++++++++++++++++++++++++++++++++++++
 tests/unit/meson.build |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 tests/unit/test-fifo.c

diff --git a/tests/unit/test-fifo.c b/tests/unit/test-fifo.c
new file mode 100644
index 0000000000..3e6f007229
--- /dev/null
+++ b/tests/unit/test-fifo.c
@@ -0,0 +1,97 @@
+/*
+ * QEMU FIFO testing
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/fifo8.h"
+#include "qemu/fifo32.h"
+
+typedef struct {
+    Fifo8 fifo8;
+    Fifo32 fifo32;
+} TestFixture;
+
+#define FIFO_SIZE 13
+
+/*
+ * Test fixture initialization.
+ */
+static void set_up(TestFixture *f, gconstpointer data)
+{
+    int n = (uintptr_t) data;
+
+    fifo8_create(&f->fifo8, n);
+    fifo32_create(&f->fifo32, n);
+}
+
+static void tear_down(TestFixture *f, gconstpointer user_data)
+{
+    fifo8_destroy(&f->fifo8);
+    fifo32_destroy(&f->fifo32);
+}
+
+static void test_push_pop_batch(TestFixture *f, int n)
+{
+    uint8_t i;
+
+    /* push and check peek */
+    for (i = 0; i < n; i++) {
+        uint8_t val8 = i;
+        uint32_t val32 = i | ((i + 1) << 8) | ((i + 2) << 16) | ((i + 3) << 24);
+
+        fifo8_push(&f->fifo8, val8);
+        if (i == 0) {
+            g_assert(*fifo8_peek_buf(&f->fifo8, 1, NULL) == val8);
+        }
+
+        fifo32_push(&f->fifo32, val32);
+        if (i == 0) {
+            g_assert(fifo32_peek(&f->fifo32) == val32);
+        }
+    }
+
+    /* check peek and pop */
+    for (i = 0; i < n; i++) {
+        uint8_t val8 = i;
+        uint32_t val32 = i | ((i + 1) << 8) | ((i + 2) << 16) | ((i + 3) << 24);
+
+        g_assert(*fifo8_peek_buf(&f->fifo8, 1, NULL) == val8);
+        g_assert(fifo8_pop(&f->fifo8) == val8);
+
+        g_assert(fifo32_peek(&f->fifo32) == val32);
+        g_assert(fifo32_pop(&f->fifo32) == val32);
+    }
+}
+
+/* max n should be less then 256 - 3 */
+static void wrap_around_test(TestFixture *f, gconstpointer user_data)
+{
+    int n = (uintptr_t) user_data;
+    const int cycles = 3;
+
+    for (int i = 0; i < cycles; i++) {
+        test_push_pop_batch(f, n / 2 + 1);
+    }
+}
+
+/* mock-ups */
+void *vmstate_info_buffer;
+uint32_t vmstate_info_uint32;
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    g_test_add("/fifo/wrap-around", TestFixture, (gconstpointer)FIFO_SIZE,
+               set_up, wrap_around_test, tear_down);
+
+    return g_test_run();
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 26c109c968..397f2503f8 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -47,6 +47,7 @@ tests = {
   'test-logging': [],
   'test-qapi-util': [],
   'test-interval-tree': [],
+  'test-fifo': [],
 }
 
 if have_system or have_tools
-- 
2.46.0.184.g6999bdac58-goog

