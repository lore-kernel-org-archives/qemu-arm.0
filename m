Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9D4D58B08
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 03:43:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1cMg-0004wB-0E; Sat, 14 Mar 2026 23:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMd-0004vR-LL
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:42:03 -0400
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMc-0003kZ-2x
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:42:03 -0400
Received: by mail-dl1-x1235.google.com with SMTP id
 a92af1059eb24-12713e56abdso2458991c88.1
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2026 20:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773546120; x=1774150920; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=jgS1ExvettYLyNojPaWzQ8XBvgLB81dAA/7ZEyeAB8+CUhrRSl///LagIGt0+Y8FXI
 N7PmhI8Oc8d8agPwahcUuEK2gd+xZIn1JNCtlHyZZCdBMcqeC1tAqzV8ksHNGroEv+cW
 u3EAZfzq3Fcg9fnRrHgOxCCWRMJNv+g9r50gDjrxqstgn+sNWf5yo29CWD3YPEpx4489
 WCpCqOwmS2zJ+R3QXwCpKWpInmEnJvg4ARPTSCVAhaTh0N7RsphMpSd6K6Ei+eAFEtaH
 ti4n7TZlvWhGuQX4yUYtZQpgBq0ayWbN/1jzHHuEva4rHGDQdM9K/DmUv8OQVDaaSUmc
 MvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773546120; x=1774150920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=E7F6CNYWWy8O9Cv5r9GhpiSiLPmU6mGpc2o2xE/l+junFMorYSyhPOIJwAeXl4s7F4
 UZqTGdU//FqtvRqgTvazch7FJp7h5AQsGTC62JhEetd34+g+bdz5UWJYZzkhF1WJQLtV
 +DCWgJEHA2oBvp8/bYXmU4NfD27nAyIBDf4wFZQOAjh/CU9BnVxPecy8xL2Tictwak2P
 mcxQMqCOtwAv8HCP/kL8K3V650rR4/Py9gjNMLFP0gbIrriCDDSd0a55DiLjokZS1E9x
 WLpraG6K+FHE8OiHypbMz9g+gj499qbwCOcsV9rU1zElR0qvXh8PTmii9sCnE0Oa4uLq
 aD+Q==
X-Gm-Message-State: AOJu0YyXSaqAg1qX1iFuIfc0KsrBhehllXU8+tHqqalAOVKPRcHpZNSZ
 TzWYiaBtot4QUqooRJkY03iJnmuAdhb3Fc2gIs9JX+mBdF3ki598Y8K+
X-Gm-Gg: ATEYQzxtVfsxpAzO+j3nurRvDeh4ql9V3u0d9ex1Si674BYg3Yy01Yu/FCdQlPV+wFM
 QxzmifaUC3beG7XZnKoMJDAogxZDgDhabAQi5Wulxgd4NbWb7TyAUfeoa229orqe8nDvLHf8RHu
 pFd0Fq/gKPCq/3gXb0qPQzEz+7zVGWIuoLCXs9GFV0jeawmRG3ZLZiw6S83FC8WJwMdiDdccZt6
 zW/awMHKxnrayUQPJHfgMzHYRTBgBOMv1Y5QRo1u3s/hQG2B4ZqQgx+k8DTFBlijQEhCjEH8FBr
 xP4g1kS4+VYZTzOZj6wRvEGypQqIYIPeUdPNGZIPHIDrAu3voJbmi2oEFp/BGdV24A/62eLMwaa
 0KYvlNoGdQFvHL6u5NMHRawlroiOUKj01Ew8fwT1I3MilRjkcqvpDJkIR+4EAVUUHpBgup5TbqV
 5ftHTzN+BFsZV3BBoGHH1a4C8Nd2dNkI7lOGuY+nk=
X-Received: by 2002:a05:7022:2385:b0:123:331f:978f with SMTP id
 a92af1059eb24-128ecba8bb9mr5189261c88.7.1773546120423; 
 Sat, 14 Mar 2026 20:42:00 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab57b2b2sm8862982eec.33.2026.03.14.20.41.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Mar 2026 20:42:00 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH 1/3] virtio-gpu: validate host page alignment for MAP_FIXED
 blobs
Date: Sun, 15 Mar 2026 00:41:52 -0300
Message-ID: <20260315034154.41986-2-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260315034154.41986-1-lucaaamaral@gmail.com>
References: <20260311022732.64141-1-lucaaamaral@gmail.com>
 <20260315034154.41986-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1235;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x1235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


