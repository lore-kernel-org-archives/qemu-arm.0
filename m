Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1BBFED9EF
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:59:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YgO-0004Xp-Gf; Tue, 17 Mar 2026 13:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Yg4-0004Vo-Km
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:58:00 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Yg1-0000is-8F
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:57:58 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-2c0e3a2605fso663975eec.0
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773770276; x=1774375076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=bVp+36gg9J82r3DIc8E3e+ce4fTiXUXIKxGSn04SuRrw42eRiMNnEDfamRNei2f07k
 fekZRVEjK49sFJMOGzmVdZmJNxrYymQwi5ddZAf6cu5l0KpB60pFavgSTMcHEMSPmGNQ
 KvR0g5nvGen00//SmsU3aFRirWvzjQyXR4KaLFSPNAD7MLYxNv8nybt3yeWRl7ps9MKk
 Z40QSu3qe3/kZKizu9JhS/ru4RF+3DLBPLeakBXwBZglIHRtVsFDV/bRbfjq14mfCAJX
 mXqwUn1lZqvRDtXS11MqYiGc3T3e8PdpGqxCVGESir31HDwk+bJNKHQTWIlwXQieivZc
 bEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773770276; x=1774375076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=QN8wa7rdfI15M6dixC+pKn4fk83hNw4ZRg/m0Lzr6Of94y/7IuqZUgs/0/RIbjb4uD
 la72dtJtNvoHP1y1Vj0D7Nqmr7DlAFpt4c3pD963sbnBzenltrqoo8MTZBzMAlPfZH3W
 IlWC3XSix6ClRaqOoWvRbhEHGw9B/274YaTjQl9shimy8aHU11oCO82LrMOFGgnMcQxv
 v+uMnWlpa4VvIv4EU5iU9pap9OZ6o7SLMO9qFPT+vm0DPhRtEy7d7ifzATnHC1BYj+Gn
 CEr8h3mN70hcYcm94aYW75qbxE/UNexVE55XkyCV/QLrrdAMAWWudbvsFmHoaPR9XgNI
 fIbA==
X-Gm-Message-State: AOJu0YyTiEX5X4ZLI5cZr42fpHg4mBFwxgbrLnECepT2kozs3GQYkPwt
 jGH8RZd1rz8h3uXfKpspdCpqlGXcoakOdepx167oeF/6EBU/3hLfEZKzbTJG0XMq
X-Gm-Gg: ATEYQzyjvLGAkuFujZjsQWWikWGSczXM/+5nBbKo5IsFs76gTewfZlxsoWHTgUyPka5
 cXJyuxeRIT/b2fwhi4I7VkGQZhxgiboOF9HPbtcLOQRBnEm93a2WQ1/PCzARD4Nud8Fv1HVurBT
 RfKZVfx0QSb55TGeK7KJh7pqy9wr2+nz+bd4TCWzIiEmmADGOXsf8YRijMtRWl3BXOpyLIS7PeF
 /bWt5T2/ew9TsRocF06W4zF7EEckgNMR0QVrSFRwLlOaUxz+B4VWTzSbAtLKx93GoYWijfKFvmN
 qYGWIlGPjKYHu9NMB4gefdJng9MbhV5XQpKLYgbsyzbUH2+WE5ejQdrtFMViGgMNUvxTxh4Yd7E
 E/a/0myYr6zfVaBGT6nv1BzltPcz83wM2Ms6Z81PG0doz71KFKw8GfXWCTqnm2HERvF3law2/1G
 3iSOB1R+ZtmCQaiQMu/ZkLvo8uZ9ShxqWydTdA+RkK4nO6d9qKEb2r
X-Received: by 2002:a05:7300:7491:b0:2be:c4a:d31b with SMTP id
 5a478bee46e88-2c0e50a919dmr148331eec.18.1773770275514; 
 Tue, 17 Mar 2026 10:57:55 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55a2be4sm237884eec.22.2026.03.17.10.57.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:57:55 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 1/3] virtio-gpu: validate host page alignment for MAP_FIXED
 blobs
Date: Tue, 17 Mar 2026 14:57:42 -0300
Message-ID: <20260317175744.32469-2-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317175744.32469-1-lucaaamaral@gmail.com>
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132b.google.com
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


