Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp19574nji;
        Mon, 26 Aug 2024 23:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQSP9iuea2idZGWqx1cQGSBdYccZNNLnrUzx9SYxOOCO7QDVa0WYv1Nkz6K487Evq2BWa7scS3mPJfPg==@linaro.org
X-Google-Smtp-Source: AGHT+IFyOp3RBPnV6rtxs8wakCsGNN/sYkx/XMBIYIFJPNRXahvWjSXnNRPlFbJ9bjryoD49AI3u
X-Received: by 2002:a05:622a:4a86:b0:447:eb43:5d0c with SMTP id d75a77b69052e-45660b7e025mr20719701cf.59.1724741267890;
        Mon, 26 Aug 2024 23:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741267; cv=none;
        d=google.com; s=arc-20160816;
        b=Vi/1cLEZidz8irUiDK6QEMQB2qbG3FACiEpE1FGgj+dywglWrigOwGc8B+d6riW9Zr
         34MVf5ifJQLFyoY74WPMjr7JjKiTcp3yN053/MrHxcXpxMFLAA0nYX1ERFdE5yNU28V5
         UgdlH9SAcOl7Qf+0gXOhtmT/b8DRrDvKX+Lj2sJPhofVX+MwI9Eu7cuN3QNuaxVR3mgF
         Jy1vxfjukRIaXgAzw0+oVKJ27XDb68tG20RSQBZ4mJMjNIlKtKqcgOeVzsowTxqOIBBm
         tCmDKnBMTKO/rjW415392jfekpIHgSHEYVJ+wfZYIlk4a+hV5ouarMwMn6kYTIc2NG32
         Ktvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=LDq3l3mSZOO+uo7Qk5jaY9LnmHfoo3Af6599hG6MOzA=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Z3HtmRzRSisiJXAhEdT1u1OaivPhNyaQUzyawS/L8Day/uNnGpPj4g3kxkzk/7Nkl0
         nrQ6PawIRzHkCUpfsjCZHVwg0HGYaQzyT09fzJtDgUeFu1E3aIrPkF1KB4KY1hrml2cO
         asNOBy7Pbzbs7/BCWcQli2rQ3xyhrL2eCBfkClTjDFwGcccM42E6HBaXRNerQgHH94I6
         r5PmFNjWsz6XAp/7eNJfeU7ZZhc5ZC7PwZ1sIxpEx0rtRZMsBiFvpGRRRD+LpumnVrku
         YUItFMPr32A10g4cIE2Tmp3TtOlOYEbooyTEK/N+mIU0oqLTR/eY4KazirHD/mAVjuZQ
         /oMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1o5ZIdwb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe323e46si123003171cf.649.2024.08.26.23.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1o5ZIdwb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sipxX-0002aH-H8; Tue, 27 Aug 2024 02:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DnbNZgUKCm0eLgTaRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--tavip.bounces.google.com>)
 id 1sipxU-0002Sd-Av
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:45:40 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DnbNZgUKCm0eLgTaRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--tavip.bounces.google.com>)
 id 1sipxR-00063u-Dq
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:45:39 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2021ab2b5e6so47184345ad.0
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2024 23:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741135; x=1725345935; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LDq3l3mSZOO+uo7Qk5jaY9LnmHfoo3Af6599hG6MOzA=;
 b=1o5ZIdwbzG8+nHe1Vvksg4nOobb9elmLaGjmjUK1LUrNslykbgNMVtthVbD6G8fjuD
 4T22gSiZsAtT1gG+gUJzwJ9WIvnIgOfBp9MbBMdOpEzTRPRTApWvttytYd206kL+5G0c
 3QKryHDpzxAZJVaIco6dT9VIivillDULo/k/WJXCS6SBXn1+BjDtxqr1/TYrTwyR90S7
 nR8KBnjlW4/ynMKrGFzOxJ1AGhzyb7PRiekOv5jT2K5cE9auo3rEx1YcRlV6HstSIjJZ
 a+WJ/VZZeChi+hHyqKquhDouYuZRtRFY0yKJzBn/5vk2P0KDdzeqNlTpOH3DHFCPdJQ1
 5A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741135; x=1725345935;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDq3l3mSZOO+uo7Qk5jaY9LnmHfoo3Af6599hG6MOzA=;
 b=KR2t+d4EAR6rUyKeVvxtz2vA4L2VzDUT7XO4L/WnV9V0phhXcyIrEEQa6KMHIgWC2n
 yenEEVAiHZK+REXXDRnDu4hCnw/aIHblFT5FkNB+qikhLK4jYj1uSV/XBpIiG4v32tVt
 3E8NHe0cBJEbiY0zcFc2NrNwX8t7qBXJvo1FgyYvrkjnvRQeZbIVwp3AeNH7VWWbB7FB
 GqkBDeDwLNAI+j1x36+8XFP58f/hMttSCkaFi7QHHt07sl2hTj8L6Kyb/Z+SzVhfdLuR
 e36NuThmhX0t9nzK+IwrfYWhQDNBv0PrBhRvDeulI1W91bL8cl03WNll5K0fDnRP6+Wi
 hdGA==
X-Gm-Message-State: AOJu0YwEPv1dxmhNELzVbLa7AQLVi/MO2mT3Yk05on/jcM+GaU9JoYMU
 oObalHwwMD3Nv0uEEVMqk7iVyve5Xb5MGYPVUakdFHtDQNe9yRWpyKLr3cQE8RbYL7KrLOPpT5v
 ylmOiEwHMQycLXIi3bEmu2fF//2unvAUImbMp0X6CE0y1ACvBPi8OkYZQfUEu2fKHq+r/1U7rFN
 /nNYs2+yBHzurK6oDt4UqB/+AdHw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:f541:b0:202:4712:e84c
 with SMTP id
 d9443c01a7336-204df43ca83mr936055ad.6.1724741134193; Mon, 26 Aug 2024
 23:45:34 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:06 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-3-tavip@google.com>
Subject: [RFC PATCH v3 02/24] tests/unit: add fifo test
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3DnbNZgUKCm0eLgTaRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--tavip.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 4Y00UDvT+lXP

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
2.46.0.295.g3b9ea8a38a-goog

