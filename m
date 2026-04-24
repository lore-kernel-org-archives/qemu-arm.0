Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31079FDEE28
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 00:06:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG43T-0006fW-95; Thu, 23 Apr 2026 20:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG43R-0006eW-L4
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 20:05:57 -0400
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG43P-0000yU-UE
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 20:05:57 -0400
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-2de831d2b20so6295077eec.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 17:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776989154; x=1777593954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=J2Y4Oi3sVRMaT2q9TiQJHMk+PjqyMUozfm/XifvWHdu+iDnIYDE2MowwDq/Nyx341b
 Y7feFqXWeP7tXB4/7Q160fgsQjLW0GUv+PxqUrNR3m4+hB5IPpPSBi2PY64ODVVwsQCz
 34Go+jHqQ5C3R9hamV0oHN6R7GyoSJ5EqqxyPv/HNrxLR3ShGseRvy0qsFgKx7Jpw8df
 nLHr921CTLtFwTmD3XtJch3eL4OZh2HLOVgwOVOiUynFMnc+cz6mIygJ9T6nG3ShbiBF
 BXWifCBngWdssWB7HmWPHXVVh/Bk3hKwVlGgJTimlsQQvQ5KDxwnhEL0V6KGoidc2uVu
 rb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776989154; x=1777593954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=nUNjklaRhWElT4YRh/RjqkkNNKfiaOsIdJwxwU+6AGNOGe1sODdf8ZScYDuisO8jgu
 b/I2qX2Jz3z9VQ73fEIAJUew2euIArlmWzhlBb4rTNbPNqAB+HIb3QsLnnXg5xKmuKJg
 JCuNRNixPnvOJgB8DZizzGApsyyoy4wsKi4GcM4OqWU5Zj0SG9ol+CdUDN0JYLkVisw5
 2V/1nduvkgkjR0VThBuhOMKikK0LhiQLwOdqv10oMqFuQgZ6nIx+Ovn+5DjrvMJFUpDF
 h7w+GiFnrXYgl4Wh1lm7uBwr3EZSN88lUieLO26Li75AVlfXJ/uGJLWA+vc9TeEfdY7b
 R9yQ==
X-Gm-Message-State: AOJu0YwpBJUkw15JbRpYpnOqzWGkMSgc2VOnXMWw8thDPHMOb6OU9JiK
 sJeEXhxvD9Rkh5jVIWBqYAKz3yTjMbcYNN//EFbLMwTt2ujYYjE2qVpG
X-Gm-Gg: AeBDievWibdEFaBQd5Vl4U033l5miQKniBVQgP0HEKHMWW+edmZ2S6PeTosQZhTo6o4
 q/GcgNiysx34GFJv5V0UkPAiT9vghPduo8etKvYzrPe3mUKgWyiDQJkda8mYp3ib+IFx6RRGVir
 4E1dHnc579of3zyqJb1e4C5Rdipqze5AeqvHWMX4PoMzQUdAT/lzxRyxRxK1kINgDU9bfaKPQJ2
 CrjSTZnzBqEjcz00WptB7MZrgpIPf7QSOKPlFmqppDuWabwE2wbCjfgAsTVNMWoHn1vTCFw3S10
 MtzMcDgF0xcpoVTqDYlCUH09h/8F4m0QOLlu4GIfzrf6aDfvHFownxyaO7pf0xz/52Pw5C2vJ41
 895k7nfy4dBO5SbS+ubOaQ2wqhPP20q52kjuz04j4CAQTk0FPQXP5RGoMpjHT8hQHUVUKAXQgw6
 EkD8V0YDyzFXyezayY1VABdEJZ8VCa1LVzH1wSyZuMUUeRQyPHThSlAmiIK3SgQhWQsKpXkXQV
X-Received: by 2002:a05:693c:2b04:b0:2d1:a3ea:d8d4 with SMTP id
 5a478bee46e88-2e4647d03a2mr16651570eec.6.1776989154285; 
 Thu, 23 Apr 2026 17:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:44a8:c4b9:45be:963d:f3a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ea8e4b373dsm12958055eec.6.2026.04.23.17.05.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 17:05:54 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, alex.bennee@linaro.org,
 Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v5 1/3] virtio-gpu: validate host page alignment for MAP_FIXED
 blobs
Date: Thu, 23 Apr 2026 21:05:42 -0300
Message-ID: <20260424000544.9617-2-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424000544.9617-1-lucaaamaral@gmail.com>
References: <20260424000544.9617-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Commit 4eb0aace ("virtio-gpu: Support mapping hostmem blobs with
map_fixed") uses mmap(MAP_FIXED) to map blob resources into a
pre-allocated hostmem region.  Both the offset and size passed to
mmap must be aligned to the host page size, but the code does not
validate this.

On hosts where qemu_real_host_page_size() exceeds the guest's page
size (e.g. ARM64 with 16KB or 64KB pages, macOS ARM64), the guest
may provide blob offsets aligned to its own page size (4KB) but not
to the host's.  This causes mmap(MAP_FIXED) to fail with EINVAL,
and the subsequent unmap (which also uses mmap MAP_FIXED) fails the
same way, producing:

  virtio_gpu_virgl_unmap_resource_blob: failed to unmap(fixed)
  virgl resource: Invalid argument

Add an alignment check before attempting MAP_FIXED.  When the offset
or blob size is not host-page-aligned, skip the MAP_FIXED path and
fall through to the existing subregion method, which handles any
alignment.

Fixes: 4eb0aace ("virtio-gpu: Support mapping hostmem blobs with map_fixed")
Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 hw/display/virtio-gpu-virgl.c | 45 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index b7a2d160..f6583b48 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -185,25 +185,34 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
         return -EBUSY;
     }
 
-    ret = virgl_renderer_resource_map_fixed(res->base.resource_id,
-                                            gl->hostmem_mmap + offset);
-    switch (ret) {
-    case 0:
-        res->map_fixed = gl->hostmem_mmap + offset;
-        return 0;
-
-    case -EOPNOTSUPP:
-        /*
-         * MAP_FIXED is unsupported by this resource.
-         * Mapping falls back to a blob subregion method in that case.
-         */
-        break;
+    /*
+     * MAP_FIXED requires host-page-aligned offset and size.  Hosts with
+     * page sizes larger than the guest's (e.g. 16KB on ARM64) may receive
+     * non-aligned blob offsets.  Fall through to the subregion method when
+     * alignment requirements are not met.
+     */
+    if (QEMU_IS_ALIGNED(offset, qemu_real_host_page_size()) &&
+        QEMU_IS_ALIGNED(res->base.blob_size, qemu_real_host_page_size())) {
+        ret = virgl_renderer_resource_map_fixed(res->base.resource_id,
+                                                gl->hostmem_mmap + offset);
+        switch (ret) {
+        case 0:
+            res->map_fixed = gl->hostmem_mmap + offset;
+            return 0;
+
+        case -EOPNOTSUPP:
+            /*
+             * MAP_FIXED is unsupported by this resource.
+             * Mapping falls back to a blob subregion method in that case.
+             */
+            break;
 
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: failed to map(fixed) virgl resource: %s\n",
-                      __func__, strerror(-ret));
-        return ret;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: failed to map(fixed) virgl resource: %s\n",
+                          __func__, strerror(-ret));
+            return ret;
+        }
     }
 #endif
 
-- 
2.52.0


