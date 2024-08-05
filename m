Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986341njb;
        Mon, 5 Aug 2024 13:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaiNJLepPPk7hvf9ml/KpIoBro+UZnFGNctFXbos33AyICE3A8x+w3vsy5MmLL9Pk0tK92kymhoOqkKFz91ZdFMsHwKfdU
X-Received: by 2002:a17:903:22c6:b0:1fa:b7ea:9f0f with SMTP id d9443c01a7336-1ff5722de89mr179228185ad.7.1722889044446;
        Mon, 05 Aug 2024 13:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889044; cv=none;
        d=google.com; s=arc-20160816;
        b=q70QFFsUWJLfsJM39uBmUx/EvzQrvWuRtz6MqYzapXOjGs1Bndv4nFHZDtOF9NrqMc
         l3lHTWVU/NgHxgkANgHRBVlt+hRauZdXiY+3hhajgiaVNpa4iUmcZLFVinvVBlQFq81Q
         CutCi9RSQY0PddNlyopw6E4EZ4LCxCtyc4rizKwMv+g4459GvjK30xs1RlhRVtSTUXts
         gt19n8/S1kDloedVYFf+2X8iGgnwZWfYRKJvvLOo3X7jUHGS4hEIvU+x/o6/vHRS/PZr
         5vdH/E9qYmnDtIFlMLlgmh3B+1ac8z/+yPnWrVAXm+OIvrdRvv96OlTao+MF1rFBPg49
         M9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=JASjBppiABUPjVgHvBEg2ThgRlH+bgfpU7wO5e+NaYE=;
        fh=Fc9DIKtzui1GJw1U9ByT7Xn/i8pCd1rPkG/qAOYJuks=;
        b=SRD+sz61RFY8tYumAYRQeH5QRweXoV7u9IiL6+1nWdnVdu33Y98IrROOZ2AxdyEPaf
         43ovT5By/jqV46XeSIuJ761H9Z8K/MjNI72rcPY1+M4J0uOc03hk3HxTyGLrJcsg6QmW
         v7D5Al+w0XjkR/JJpi8AzHm5oeKv0nMvHRB8VMETJeNgygbW5FA3I8oBAT18vfmUSJu6
         LDxXECKtsdmyKlXtXM8DVjCOQvuhm7o2VBzO7mktwwlLtaH2AXQXo7WPEWdd79gubsPy
         m1l3w5l23l7x/3iXSPkRInIadzmah75s5/yjBK9ce/GfTzbzBJ+DlmgB1oojqso4LgQu
         SRTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PkMQ5YWV;
       spf=pass (google.com: domain of 3uzoxzgukc7oyf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3UzOxZgUKC7oyf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3UzOxZgUKC7oyf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d9443c01a7336-1ff58faf3f4sor83861035ad.11.2024.08.05.13.17.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3uzoxzgukc7oyf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PkMQ5YWV;
       spf=pass (google.com: domain of 3uzoxzgukc7oyf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3UzOxZgUKC7oyf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889044; x=1723493844; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JASjBppiABUPjVgHvBEg2ThgRlH+bgfpU7wO5e+NaYE=;
        b=PkMQ5YWVIlih2vxqtnBVcuvOD+MpUPfVspMjh5cvjDZRT3hwJ5gTJ9Oh7cwn8oll9F
         /y/6ysSUll2fprOPjfegnAPMRC/K8FzpOhxHlPGVfVNubwoAL0y78pMEzPvyBQ/yXnzH
         83A7LMnINcBnxBHnKsdwyvAtclrN9AtazFBnvUyiwtAIgjfGF2n8fUtYIZyeScnvqGX8
         NABeDYuqOUvLkWX9Hzi3p2zXkSDzE/x3KnsagylOwHoHnMCOIOKNY5jP/g5EPOQ8opNV
         xZCxZ0ac2YJy+yOqRmYDyIx68Ntm/WFXSYiUkg9QUYv22GjlOw/KKGXBwNwy68w9OIqU
         42Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889044; x=1723493844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JASjBppiABUPjVgHvBEg2ThgRlH+bgfpU7wO5e+NaYE=;
        b=lterZtIZnLAS7khr+fFcjmFc6ahzob+r1Dq175hwJ6qLKNp3IeyqVDB6eA/QxtNTFp
         n0D3Tju2VPtRmdXZNjhEQYTpgoGfAvaNAqo3lMj45Bz0KrortpOL9fWazR0hQ/5OH+pN
         Nq6FtHRRee3vGdUIzBhqqpI3whRQV1e9HzUzQFg55pxqC97Fzf4XCOHv7YCA40ljO7Af
         1L5D7KONqFDzyzed0qae11nog8zWkG1nDbuKIXOP4YyT+QX1pYCfjqRkuhH7oEBEyZqP
         yysRZrWpBTzweZIMxm9kcOHshVVkmUd6JHVg/TgWCvE4p+2lga/nC0VjexKLSKfjDhxe
         N/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVKifmcGgyomWetciekZxl0Si5yi7V+NxRptXY2v4Izv1DSZlsTKhjmUADvSMw0z+rADiZc8dB4pg8Jt1+sXQ4j4dZ/JMR2
X-Gm-Message-State: AOJu0Yz7TOJYbgfpJeg5mCLVfG4syweQYd90E4GHgAzHjLBhWoj2AQ30
	wEGjslVMCo6QzdLO3+Vj0R8RI8BktxTqpdHm6f+LjBZ6nO8QGOyALkmGRorx+754FcFPejrKIw=
	=
X-Google-Smtp-Source: AGHT+IGyyrIk3asawWetry+p/a5ZrU/dzfAfbZwm1JHiJ5mZUxhVOeR9NEDFuaROBsMRxBz+palCTk5KCA==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:c38c:b0:1fb:7f2c:5642 with SMTP id
 d9443c01a7336-1ff5730306cmr8797235ad.4.1722889043889; Mon, 05 Aug 2024
 13:17:23 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:16:57 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-3-tavip@google.com>
Subject: [RFC PATCH 02/23] tests/unit: add fifo test
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9IlP9hqDtdgA

Add a simple FIFO unit test that test wrap around and push, pop and
peek for both fifo8 and fifo32.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/meson.build |  1 +
 tests/unit/test-fifo.c | 98 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 tests/unit/test-fifo.c

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
diff --git a/tests/unit/test-fifo.c b/tests/unit/test-fifo.c
new file mode 100644
index 0000000000..1686f8bd59
--- /dev/null
+++ b/tests/unit/test-fifo.c
@@ -0,0 +1,98 @@
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
+    int i;
+
+    for (i = 0; i < cycles; i++) {
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
-- 
2.46.0.rc2.264.g509ed76dc8-goog
