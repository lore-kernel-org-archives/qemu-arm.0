Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4644837ejc;
        Wed, 18 Oct 2023 06:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOTxx646i2cDatBRGIeJFc6hc+5F2rAYWvHqXQTkKFEzM157vViHyh/3UO7/kzS4GgsrBd
X-Received: by 2002:a05:620a:2887:b0:76e:fea2:cc79 with SMTP id j7-20020a05620a288700b0076efea2cc79mr5514297qkp.67.1697636340337;
        Wed, 18 Oct 2023 06:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636340; cv=none;
        d=google.com; s=arc-20160816;
        b=KnDi7fxRtSTuIzx7b81Q9Fu8Df3uk8WR2Sc+yMWrjVCn4Bp8cPO6IS4KiTyHU5f5xX
         IaWzZ9ZHwExUX7h3baNZUS6KRqVfct5iIdzx2sLGeMJ8Vx8XvQwCWuXadUOhHYn1ajpT
         GIT9IqEBpYC7UNjNQjLd4up3Vljbyb/W7VndYlTN9uA0OcuiChkgIhxpcizPCcRYSqD9
         fmU/HB5HG5Y5mqFXZhLVNXYm0qZ8nZwxyGYJSiZ4AORo5h7ip8jOlZlr6Rh9pL2iWZlU
         gkXOI9sWL/y9JwRKl1WfokYGP4jnJpl/dof766Xag0/dI/417uwt4k1hdeCN+5rUQ2Zd
         1z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=giaq0Ce6Aj/6HaP4odif9+C/Ykb1KzGoFVLRpAb9vds=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=VrRb1NseTTsOMrIo4eEYfXqjTzfsdmH7VBTye4Lmb3UpFyV80jJ9ooxhx8kY6aBf4D
         rh/G7uYV3IPzdpqZFyXVjfRdzE3gKGek7ptJmIZJmx4qChTgZrk4tVPXVLWCac32hENi
         A70YbNx4rOyZJcQH3TdEoY2VnsWoJ542TW3hD8DestEZVPhq1mWh/NT1NSAC3hnuHkgr
         BHcI5aLgSIrT947C4Txs2TDyBN79NLca137UNfWOJO6kNyvh9BrE6+j4BPluwIP3u8xQ
         VKPdO2pIuLLITe/VyFJEXou7wj6DcF5uATi99g85qUsyCa7D5Icp+jz+pAUo6wXx6Gvn
         R57w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTRJQccy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20-20020a05620a0d9400b0076f18ae10e1si2720459qkl.395.2023.10.18.06.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTRJQccy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6l9-0008Dv-HN; Wed, 18 Oct 2023 09:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6l8-00088C-0t
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6l5-0006Aj-Au
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giaq0Ce6Aj/6HaP4odif9+C/Ykb1KzGoFVLRpAb9vds=;
 b=PTRJQccyfnOrUns3jTXKfMMmXRX06DbgoZYexoSAjxIIb5vWc/LPIxnym0ZnQwnQqGXnRi
 2x+3jNWNcGNCESxa9jzVGKJ5cYqyb/Fc9LI5zNSP+H22JLmQ5lXBSeJooCUvzuuehMo15A
 76AgVAhM5goPzr4eN7MZOBVj6zui/x4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-st7cMW66O-620Yr-n8g3cg-1; Wed, 18 Oct 2023 09:38:38 -0400
X-MC-Unique: st7cMW66O-620Yr-n8g3cg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1658387A9FF;
 Wed, 18 Oct 2023 13:38:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E68932166B26;
 Wed, 18 Oct 2023 13:38:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 03/19] ui: add pixman-compat.h
Date: Wed, 18 Oct 2023 17:38:04 +0400
Message-ID: <20231018133820.1556962-4-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ItmhK9WyAqyI

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is a tiny subset of PIXMAN API that is used pervasively in QEMU
codebase to manage images and identify the underlying format.

It doesn't seems worth to wrap this in a QEMU-specific API.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/pixman-compat.h | 195 +++++++++++++++++++++++++++++++++++++
 include/ui/qemu-pixman.h   |   2 +
 2 files changed, 197 insertions(+)
 create mode 100644 include/ui/pixman-compat.h

diff --git a/include/ui/pixman-compat.h b/include/ui/pixman-compat.h
new file mode 100644
index 0000000000..566ad99fcb
--- /dev/null
+++ b/include/ui/pixman-compat.h
@@ -0,0 +1,195 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Tiny subset of PIXMAN API commonly used by QEMU.
+ *
+ * Copyright 1987, 1988, 1989, 1998  The Open Group
+ * Copyright 1987, 1988, 1989 Digital Equipment Corporation
+ * Copyright 1999, 2004, 2008 Keith Packard
+ * Copyright 2000 SuSE, Inc.
+ * Copyright 2000 Keith Packard, member of The XFree86 Project, Inc.
+ * Copyright 2004, 2005, 2007, 2008, 2009, 2010 Red Hat, Inc.
+ * Copyright 2004 Nicholas Miell
+ * Copyright 2005 Lars Knoll & Zack Rusin, Trolltech
+ * Copyright 2005 Trolltech AS
+ * Copyright 2007 Luca Barbato
+ * Copyright 2008 Aaron Plattner, NVIDIA Corporation
+ * Copyright 2008 Rodrigo Kumpera
+ * Copyright 2008 André Tupinambá
+ * Copyright 2008 Mozilla Corporation
+ * Copyright 2008 Frederic Plourde
+ * Copyright 2009, Oracle and/or its affiliates. All rights reserved.
+ * Copyright 2009, 2010 Nokia Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef PIXMAN_COMPAT_H
+#define PIXMAN_COMPAT_H
+
+#define PIXMAN_TYPE_OTHER       0
+#define PIXMAN_TYPE_ARGB        2
+#define PIXMAN_TYPE_ABGR        3
+#define PIXMAN_TYPE_BGRA        8
+#define PIXMAN_TYPE_RGBA        9
+
+#define PIXMAN_FORMAT(bpp, type, a, r, g, b) (((bpp) << 24) |   \
+                                              ((type) << 16) |  \
+                                              ((a) << 12) |     \
+                                              ((r) << 8) |      \
+                                              ((g) << 4) |      \
+                                              ((b)))
+
+#define PIXMAN_FORMAT_RESHIFT(val, ofs, num)                            \
+        (((val >> (ofs)) & ((1 << (num)) - 1)) << ((val >> 22) & 3))
+
+#define PIXMAN_FORMAT_BPP(f)    PIXMAN_FORMAT_RESHIFT(f, 24, 8)
+#define PIXMAN_FORMAT_TYPE(f)   (((f) >> 16) & 0x3f)
+#define PIXMAN_FORMAT_A(f)      PIXMAN_FORMAT_RESHIFT(f, 12, 4)
+#define PIXMAN_FORMAT_R(f)      PIXMAN_FORMAT_RESHIFT(f, 8, 4)
+#define PIXMAN_FORMAT_G(f)      PIXMAN_FORMAT_RESHIFT(f, 4, 4)
+#define PIXMAN_FORMAT_B(f)      PIXMAN_FORMAT_RESHIFT(f, 0, 4)
+#define PIXMAN_FORMAT_DEPTH(f)  (PIXMAN_FORMAT_A(f) +   \
+                                 PIXMAN_FORMAT_R(f) +   \
+                                 PIXMAN_FORMAT_G(f) +   \
+                                 PIXMAN_FORMAT_B(f))
+
+typedef enum {
+    /* 32bpp formats */
+    PIXMAN_a8r8g8b8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_ARGB, 8, 8, 8, 8),
+    PIXMAN_x8r8g8b8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_ARGB, 0, 8, 8, 8),
+    PIXMAN_a8b8g8r8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_ABGR, 8, 8, 8, 8),
+    PIXMAN_x8b8g8r8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_ABGR, 0, 8, 8, 8),
+    PIXMAN_b8g8r8a8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_BGRA, 8, 8, 8, 8),
+    PIXMAN_b8g8r8x8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_BGRA, 0, 8, 8, 8),
+    PIXMAN_r8g8b8a8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_RGBA, 8, 8, 8, 8),
+    PIXMAN_r8g8b8x8 =    PIXMAN_FORMAT(32, PIXMAN_TYPE_RGBA, 0, 8, 8, 8),
+    /* 24bpp formats */
+    PIXMAN_r8g8b8 =      PIXMAN_FORMAT(24, PIXMAN_TYPE_ARGB, 0, 8, 8, 8),
+    PIXMAN_b8g8r8 =      PIXMAN_FORMAT(24, PIXMAN_TYPE_ABGR, 0, 8, 8, 8),
+    /* 16bpp formats */
+    PIXMAN_r5g6b5 =      PIXMAN_FORMAT(16, PIXMAN_TYPE_ARGB, 0, 5, 6, 5),
+    PIXMAN_a1r5g5b5 =    PIXMAN_FORMAT(16, PIXMAN_TYPE_ARGB, 1, 5, 5, 5),
+    PIXMAN_x1r5g5b5 =    PIXMAN_FORMAT(16, PIXMAN_TYPE_ARGB, 0, 5, 5, 5),
+} pixman_format_code_t;
+
+typedef struct pixman_image pixman_image_t;
+
+typedef void (*pixman_image_destroy_func_t)(pixman_image_t *image, void *data);
+
+struct pixman_image {
+    int ref_count;
+    pixman_format_code_t format;
+    int width;
+    int height;
+    int stride;
+    uint32_t *data;
+    uint32_t *free_me;
+    pixman_image_destroy_func_t destroy_func;
+    void *destroy_data;
+};
+
+typedef struct pixman_color {
+    uint16_t    red;
+    uint16_t    green;
+    uint16_t    blue;
+    uint16_t    alpha;
+} pixman_color_t;
+
+static inline pixman_image_t *pixman_image_create_bits(pixman_format_code_t format,
+                                                       int width,
+                                                       int height,
+                                                       uint32_t *bits,
+                                                       int rowstride_bytes)
+{
+    pixman_image_t *i = g_new0(pixman_image_t, 1);
+
+    i->width = width;
+    i->height = height;
+    i->stride = rowstride_bytes ?: width * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
+    i->format = format;
+    if (bits) {
+        i->data = bits;
+    } else {
+        i->free_me = i->data = g_malloc0(rowstride_bytes * height);
+    }
+    i->ref_count = 1;
+
+    return i;
+}
+
+static inline pixman_image_t *pixman_image_ref(pixman_image_t *i)
+{
+    i->ref_count++;
+    return i;
+}
+
+static inline bool pixman_image_unref(pixman_image_t *i)
+{
+    i->ref_count--;
+
+    if (i->ref_count == 0) {
+        if (i->destroy_func) {
+            i->destroy_func(i, i->destroy_data);
+        }
+        g_free(i->free_me);
+        g_free(i);
+
+        return true;
+    }
+
+    return false;
+}
+
+static inline void pixman_image_set_destroy_function(pixman_image_t *i,
+                                                     pixman_image_destroy_func_t func,
+                                                     void *data)
+
+{
+    i->destroy_func = func;
+    i->destroy_data = data;
+}
+
+static inline uint32_t *pixman_image_get_data(pixman_image_t *i)
+{
+    return i->data;
+}
+
+static inline int pixman_image_get_height(pixman_image_t *i)
+{
+    return i->height;
+}
+
+static inline int pixman_image_get_width(pixman_image_t *i)
+{
+    return i->width;
+}
+
+static inline int pixman_image_get_stride(pixman_image_t *i)
+{
+    return i->stride;
+}
+
+static inline pixman_format_code_t pixman_image_get_format(pixman_image_t *i)
+{
+    return i->format;
+}
+
+#endif /* PIXMAN_COMPAT_H */
diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 2ff6c4a656..de303d7654 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -12,6 +12,8 @@
 #pragma GCC diagnostic ignored "-Wredundant-decls"
 #include <pixman.h>
 #pragma GCC diagnostic pop
+#else
+#include "pixman-compat.h"
 #endif
 
 /*
-- 
2.41.0

