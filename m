Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7883ECCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DPi-0002Ul-Dg; Fri, 10 Oct 2025 09:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPV-0002N2-PH
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:43:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOq-00088Y-9G
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:43:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42568669606so1508668f8f.2
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103788; x=1760708588; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oW7ljjIx6q7XqiZM4nIHhftMogwFYcVf1dksbF3LOtw=;
 b=XFIEcUMiYaWph1hWEOxt1k8H5YPVjwmTtsi/HMfEx5rSs0zGpm8nKYuOIVBqTwnahd
 YMVMOhAW8NLSxMorvM3wkPYr0VubmG24z9ETWAodiofGYOD3NceQiR7yyzxe2Su+axIB
 6+aaCsXbpsfj+SPyBurtwIGdKmD7+E3S8+C55WbV7gwfYkbv2d8yBPjBxlmsSvFy4PXp
 bJ+xtjVCTUJa2TB9J41TFA+/L+Hec+T3v0TCBnEDTy7F2soy2J1f0rlcRcWANPhckXW7
 rvVTRDUQliXvzlBgxUbscEFLthUnoM0Dh2goqq8uvNeQzdQR5joxIGDqNPnwUcPbDhKK
 AgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103788; x=1760708588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oW7ljjIx6q7XqiZM4nIHhftMogwFYcVf1dksbF3LOtw=;
 b=QNFSO5AlH28tLUYeitroqjnQmpDX5u+NlPUmzIfcQhm29Sa0hHCx7Yb1g+XzIGTLWk
 UGSBVtDxFpJH2hnK2LKPTtKZBGpUA14+a6ryqn8ZhVS06p7q4/N3UE54ch3i8Mp7/Xu8
 SrDgUb+WneEsJJ5tywxzADtjilHjyZsPCqxuSispmfkhMPIeHYHmUgCi9waHA74Mvf6W
 ZxaMTehtdxGJLYHA+B7vi3yrA/QuDuiu/9xfhuZZ1ckLcgysds9B05s37mYMxDekNcOG
 lMpKNyPi/K9HjWqM4YTZgMsCv0RggnvoJZ8UQ8VtPCLYaXP2+I7IB7dFPZQNlfS04SvJ
 BYag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU21uVCqGs/iD45+PlGE6A1L9/PEjw6NzDMBgzSTPpCgZr4jr9wVC8c9rNy3tJlGvlNapCzBf2RbQ==@nongnu.org
X-Gm-Message-State: AOJu0YykQbJfTNZstU2tqytEI5G2LkG30xlI/a7DLYV6IFaryB8Lnn7E
 1l+/I4MFp7KmTEy1EnGZ5X4KCNKT9NSN7vrKLHIJUozc8Fc4aW27X4g6urWBFhEaPFg=
X-Gm-Gg: ASbGncu1WtnUnRcdxA/9Ho6WRB0n9bDBr5IrrpsZj+ZsrNsoKJIKu+Mxj2WfY7wDMmN
 nvBQf6LY2uoWffR//CuE6kvq4XCR1QddIlxLtP17dTOSko935fEGBmDcDKzwcZaeyUg7GNUWFhA
 IaEE4QF55l4DlpU08XVnbosPbC2pIcbOoRQswgkHiVG0Cy0efwKIRba/CheKKBGOdKhP45EKZ+6
 vfT15PRAN3NS2neVUdUjX7rRpgENQpTTJ3igE8xEMYQPScfqv0LwFj21aGa/qOJIi3YZg5aqxeg
 XL+86vr9DZWfqq4/aDGDej3HIf2ShhcfDwD+Gksj6cEVGmKJBZYM7k8iSSWGIspTe83mMmFAEa2
 0Vl19gLvUvh7Htu1aVp5tAMrkDIUVqRNpdYwe+z+3qcOqCyJzTsJDDPDlkQDQn9SRvlQGf6pw3I
 V0SHI2z1aT4IuuYvPL7BU=
X-Google-Smtp-Source: AGHT+IER+sO3KvNTLcD7naZf2cjwxuD5AfMcwMWeeCbkQGK5l5rY32mSt+FRAWoPj04hX800Z8y8Xg==
X-Received: by 2002:a05:6000:2303:b0:3ec:dfe5:17d0 with SMTP id
 ffacd0b85a97d-42666ac42d9mr6674973f8f.9.1760103787601; 
 Fri, 10 Oct 2025 06:43:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e0a03sm4251914f8f.37.2025.10.10.06.43.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 07/16] hw/display: Replace HOST_BIG_ENDIAN #ifdef with runtime
 if() check
Date: Fri, 10 Oct 2025 15:42:16 +0200
Message-ID: <20251010134226.72221-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-gpu-bswap.h |  6 +++---
 hw/display/artist.c                  | 12 ++++++------
 hw/display/vga.c                     | 20 ++++++++------------
 hw/display/virtio-gpu-gl.c           |  8 ++++----
 hw/display/virtio-gpu-rutabaga.c     |  8 ++++----
 5 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index dd1975e2d40..279734231e2 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -29,7 +29,9 @@ virtio_gpu_ctrl_hdr_bswap(struct virtio_gpu_ctrl_hdr *hdr)
 static inline void
 virtio_gpu_bswap_32(void *ptr, size_t size)
 {
-#if HOST_BIG_ENDIAN
+    if (!HOST_BIG_ENDIAN) {
+        return;
+    }
 
     size_t i;
     struct virtio_gpu_ctrl_hdr *hdr = (struct virtio_gpu_ctrl_hdr *) ptr;
@@ -41,8 +43,6 @@ virtio_gpu_bswap_32(void *ptr, size_t size)
         le32_to_cpus((uint32_t *)(ptr + i));
         i = i + sizeof(uint32_t);
     }
-
-#endif
 }
 
 static inline void
diff --git a/hw/display/artist.c b/hw/display/artist.c
index 3c884c92437..8d73f2d894d 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -738,9 +738,9 @@ static void combine_write_reg(hwaddr addr, uint64_t val, int size, void *out)
      * FIXME: is there a qemu helper for this?
      */
 
-#if !HOST_BIG_ENDIAN
-    addr ^= 3;
-#endif
+    if (!HOST_BIG_ENDIAN) {
+        addr ^= 3;
+    }
 
     switch (size) {
     case 1:
@@ -1132,9 +1132,9 @@ static uint64_t combine_read_reg(hwaddr addr, int size, void *in)
      * FIXME: is there a qemu helper for this?
      */
 
-#if !HOST_BIG_ENDIAN
-    addr ^= 3;
-#endif
+    if (!HOST_BIG_ENDIAN) {
+        addr ^= 3;
+    }
 
     switch (size) {
     case 1:
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 90b89cf4044..01b1cfa98d3 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1307,13 +1307,13 @@ static void vga_draw_text(VGACommonState *s, int full_update)
                 if (cx > cx_max)
                     cx_max = cx;
                 *ch_attr_ptr = ch_attr;
-#if HOST_BIG_ENDIAN
-                ch = ch_attr >> 8;
-                cattr = ch_attr & 0xff;
-#else
-                ch = ch_attr & 0xff;
-                cattr = ch_attr >> 8;
-#endif
+                if (HOST_BIG_ENDIAN) {
+                    ch = ch_attr >> 8;
+                    cattr = ch_attr & 0xff;
+                } else {
+                    ch = ch_attr & 0xff;
+                    cattr = ch_attr >> 8;
+                }
                 font_ptr = font_base[(cattr >> 3) & 1];
                 font_ptr += 32 * 4 * ch;
                 bgcol = palette[cattr >> 4];
@@ -1489,11 +1489,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
     vga_draw_line_func *vga_draw_line = NULL;
     bool allocate_surface, force_shadow = false;
     pixman_format_code_t format;
-#if HOST_BIG_ENDIAN
-    bool byteswap = !s->big_endian_fb;
-#else
-    bool byteswap = s->big_endian_fb;
-#endif
+    bool byteswap = s->big_endian_fb ^ HOST_BIG_ENDIAN;
 
     full_update |= update_basic_params(s);
 
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index c06a078fb36..c29152a3c7a 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -123,10 +123,10 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
     ERRP_GUARD();
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
-#if HOST_BIG_ENDIAN
-    error_setg(errp, "virgl is not supported on bigendian platforms");
-    return;
-#endif
+    if (HOST_BIG_ENDIAN) {
+        error_setg(errp, "virgl is not supported on bigendian platforms");
+        return;
+    }
 
     if (!object_resolve_path_type("", TYPE_VIRTIO_GPU_GL, NULL)) {
         error_setg(errp, "at most one %s device is permitted", TYPE_VIRTIO_GPU_GL);
diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-rutabaga.c
index ed5ae52acbe..f82a84b53aa 100644
--- a/hw/display/virtio-gpu-rutabaga.c
+++ b/hw/display/virtio-gpu-rutabaga.c
@@ -1074,10 +1074,10 @@ static void virtio_gpu_rutabaga_realize(DeviceState *qdev, Error **errp)
     VirtIOGPUBase *bdev = VIRTIO_GPU_BASE(qdev);
     VirtIOGPU *gpudev = VIRTIO_GPU(qdev);
 
-#if HOST_BIG_ENDIAN
-    error_setg(errp, "rutabaga is not supported on bigendian platforms");
-    return;
-#endif
+    if (HOST_BIG_ENDIAN) {
+        error_setg(errp, "rutabaga is not supported on bigendian platforms");
+        return;
+    }
 
     if (!virtio_gpu_rutabaga_init(gpudev, errp)) {
         return;
-- 
2.51.0


