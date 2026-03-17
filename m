Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F4CFED9EF
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:52:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YXa-0003uT-K6; Tue, 17 Mar 2026 13:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXN-0003cc-9D
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:01 -0400
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXH-00075C-LJ
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:48:57 -0400
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-2beab594d8eso646011eec.0
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773769734; x=1774374534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=Srkct72KVBpskW4PenA7z/KmiMedFK3gMmdf1rvjwjDF8dtoTgPVCrMjd/KcL1QxV0
 g0nODKKjV7DYV6o3hCZnIuVqTwzPtQ5xARGDGKE5WIGHaAV7fHE1Hrm7ejHjvsACTneB
 sGsF95WvE7GE/xt4+6Ud6lsCw/C71wlSs6dGCmkBBv3JRllPZSjkh9X9ZtT1AdQ5/MM/
 NdC5kpdD3FMFWal+VcGndlhhTRuwNTw087l2beA1q3sn3GH+lB/r1A5+7zy42j3ZDtos
 8rp2SL8Wez4PIPM7xtxSB5KDLatezjOGLJZS/npQ3imi3eTZnXMRiWqB4upss+VCDnn+
 MXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773769734; x=1774374534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Okui3+LoiEw6Ead0/iU3+dwFPXpVpxuXn0Pb9e4RdJE=;
 b=T6CznNN4rwmFiLlMvr2aOU2SNlRRIfLxFGFQKEXg0xRLAQhOvCd1H3XendOfI/6Zla
 /kSSYAMihRtqUueMXcBo2Astj1hRq7BGHiZQ4eeDay7bjq5/kZsoPdkdluVItICmoZzO
 0v14oxQoy8wcWfF3BSlNSIoaqGgGXSvROLTAouoGTEuuI3BUFwOT4I6KxA/Iojz9Vw3s
 WLarrtSEugEAooi/5XWkTEH3CXBkH3GHeJb6UrUpmCvH9og5QXWditXLfOKgZHEFLCdY
 GIn+aPD80hhSt6YIFGygQiWGIbYIxzC8gFCJrz877+/qFHD2th5p1vQZVEq60ly/C4in
 QacQ==
X-Gm-Message-State: AOJu0YyITLmfONOFrx/w9KtztxZVXaPxnCm/dxZJkACtRlmrzPF5YJEI
 VGAjQYTGHju4ObGYqbLZgyx4MgmODPcuoDjAaeLsdDXx4WAAPwLzGUOh
X-Gm-Gg: ATEYQzzIXT9bXhzopBfHcxPPCaEx1Ps5CvC9DXdgzh+7XUdcKm8PtX7rFs3UeYHX27x
 qu56G/eydrM+/3AOgPsUJrFXkt/SQZkrPut1rZMipFvBsQdwAd65zfse89uLVKKOpH9hi6Qlnno
 4qpgoierVZnXKElDnvRF8Iiv0kbJuYzcMTVf68K0yJnLMXaCPcYqggOiOfwfCJKiV2dQw7Dr0qM
 ZKfjlWw6nzVaBI7AXz8De6IiRWM0zA1h+qUnk2PHZq5+47ZO5ttOxtvzuSJKV2v8ekBi3UdB2ZJ
 gZjylBa24aLxwAHs02M8q+nH/9SYVmAinLMZL68G524Cx8OnrrOsKr+L25ANG6uY4QdIR7kngcE
 XznOwkdvvQNVrj0hKSOYaWwv52IUud+qPV38a8pT9gWhwr3hb8blifueWgFZ1y5YPe0Hd2I46uA
 VvJcGZuqHFTOtKIElUO/Gsty1Ejqihh5g5xKE6GN8jqIw+3O9ZSy8o
X-Received: by 2002:a05:7301:1691:b0:2bd:c8a2:954 with SMTP id
 5a478bee46e88-2c0e5041a17mr182287eec.24.1773769734014; 
 Tue, 17 Mar 2026 10:48:54 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e5583533sm190487eec.18.2026.03.17.10.48.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:48:53 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 1/3] virtio-gpu: validate host page alignment for MAP_FIXED
 blobs
Date: Tue, 17 Mar 2026 14:48:43 -0300
Message-ID: <20260317174845.31768-2-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317174845.31768-1-lucaaamaral@gmail.com>
References: <20260317174845.31768-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1335;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1335.google.com
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


