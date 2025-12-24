Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFB7E776C1
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 15:16:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYQaj-0003mF-Dc; Wed, 24 Dec 2025 10:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQaK-00035L-5Y
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:15:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQaE-0003KG-4q
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:15:29 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so43666255e9.0
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 07:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766589323; x=1767194123; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gD8JU2pmVND43MkkfvpIdwWKILzGxGYkTplC6Rgxmp8=;
 b=CHg5V5NirHhInzglecSmX9OI0yQOe/AHl1E54yBE/wVD/9O7nYzX74X9K6xOx8fCg8
 IPxlDzx1W2GKPKpdgVS0LqqiAyVoqGsubba49bdTblsYoPC70bUBxZyf0aS9Fw4/o/Uy
 7hUFTk4jm3ef/01TRwtNgRHSpjSqlJqNs7vaiisQKkS31bjHML8EmRUId5/utUSN2Kpm
 ZL4wwUNnckNyR5FpwEVzpxRQSYE+/loX37pW6xxHbHMzCi+E21xXBLZlqeGPxsItTP0Z
 bDfFnT7KFnmfR9hjqO2jsj2aYNhdUiW0IiohVJRavt6vRvtr5evSq41C6w9+tmiT6x0P
 05aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766589323; x=1767194123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gD8JU2pmVND43MkkfvpIdwWKILzGxGYkTplC6Rgxmp8=;
 b=Q7dr4ovu3uX0+ewnSXW44qHDpMkDbB/v9/060p3wvS7pwK9sYhyS1K7Et7m21eyn3Q
 z0OcO8dnsfV6Y7CzchPS0HqzNVLLSXJhy7AaK+1xsYcMy/ZFpdkYK+ILhZDQNiGRmOZ+
 mDSkzddArA3rmtAWe3Gmgy5xI3Co5B9EBe+RAwffUjA0/ImGKwDKUFHz/o3aBb23T4kU
 i5FgdKK3O8m/0S4J3gLbEPe71ejzkyzeQHjPlwmy9V15wxI33qGMZzZUXrKCpsboB9Eq
 FtBJBu5fCL4w/gWTbqZcO0MMMkgJpYUtfu6A2rOAPFVdYbraUwivEbVcWUQ1jgJT9EQS
 2Cbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK+0XVXMuTL6zNyZLNfqnoGcRGcn33BwOaNggKvi95ufaQQSJnNatwrseQwfvBKTrwG4At8zdMIg==@nongnu.org
X-Gm-Message-State: AOJu0Yw4tgBzh5u3FfF4EZyw2XbmGPo5HdnEBOEZX400vdwQ9F4xqpUJ
 qcsoBsbso3kQ8OxPeWtXfxNiuSZbWsTurdI5UeNvkJSxeW7llH+uVTH3uzHkYztaagg=
X-Gm-Gg: AY/fxX59M7+0wHemRwbc2l+uzONn3jfIFHELGELj2DnOevWvYv0/Ddi1SJYcW8Tl4ZR
 WCNb0pB7HBcPwr0zdqDiLvNlMWstBsYRlTiP0qsimp7GBrGDhgqvg/t2cpfbHkvErW+RBv19Lpt
 Db3DIc7XsuYOzzAMS7j/05cAyPSiKQENDh2FrPrVPqoQ8SJ1wp+zFRI5xBe8WoIdaT5jXcn2kYF
 bmh5kUR33nHcKwUOQJaxJAM5USIKR8w/Kx2enCoUG8CwgeSPCkY/zpcX4xRDP2s591uDMLluqIb
 JY19Z/5fQ7idXlsY/WkGX7rmNBTi0WwujGy1640Wlm8enFL6PseogZVFywH6AHFzY+NvHPftRMm
 jhS09ZivQt3k3lJadt8xX/ueVQgfXHx6+2iVoT79iAdhAXJl7iR+auQeRGLLbeFhfEwHXPo8Zgg
 0ycgHZi8UU2LPhA17RfpOyNRAjcoWMhEOv+SUZpST+2w+5Q8d5sGfLzYJ1S/iqMmkuGw==
X-Google-Smtp-Source: AGHT+IED5NTiworPy9fGAYaEAYlWnUKoxV7J9qyYBS1cQtso4club+7XuXaQ+qeAhLJvb9Xr4Cvcjg==
X-Received: by 2002:a05:600c:c091:b0:477:7b9a:bb07 with SMTP id
 5b1f17b1804b1-47d195a98d5mr153341105e9.35.1766589322759; 
 Wed, 24 Dec 2025 07:15:22 -0800 (PST)
Received: from localhost.localdomain (188.171.88.92.rev.sfr.net.
 [92.88.171.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4e91sm291574785e9.13.2025.12.24.07.15.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 07:15:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, David Hildenbrand <david@kernel.org>,
 qemu-riscv@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Troy Lee <leetroy@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zhao Liu <zhao1.liu@intel.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/9] hw/virtio: Reduce virtio_lduw/stw_phys_cached() scope
Date: Wed, 24 Dec 2025 16:13:49 +0100
Message-ID: <20251224151351.86733-9-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224151351.86733-1-philmd@linaro.org>
References: <20251224151351.86733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

virtio_lduw_phys_cached() and virtio_stw_phys_cached() are
only used within hw/virtio/virtio.c: reduce their scope by
moving their definitions there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-access.h | 21 ---------------------
 hw/virtio/virtio.c                | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index c866769cad8..5b5fff5295e 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -102,27 +102,6 @@ static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 #endif
 }
 
-static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
-                                               MemoryRegionCache *cache,
-                                               hwaddr pa)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        return lduw_be_phys_cached(cache, pa);
-    }
-    return lduw_le_phys_cached(cache, pa);
-}
-
-static inline void virtio_stw_phys_cached(VirtIODevice *vdev,
-                                          MemoryRegionCache *cache,
-                                          hwaddr pa, uint16_t value)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        stw_be_phys_cached(cache, pa, value);
-    } else {
-        stw_le_phys_cached(cache, pa, value);
-    }
-}
-
 static inline void virtio_tswap16s(VirtIODevice *vdev, uint16_t *s)
 {
     *s = virtio_tswap16(vdev, *s);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 257cda506a4..fba9d347d17 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -216,6 +216,27 @@ static void virtio_check_indirect_feature(VirtIODevice *vdev)
     }
 }
 
+static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
+                                               MemoryRegionCache *cache,
+                                               hwaddr pa)
+{
+    if (virtio_access_is_big_endian(vdev)) {
+        return lduw_be_phys_cached(cache, pa);
+    }
+    return lduw_le_phys_cached(cache, pa);
+}
+
+static inline void virtio_stw_phys_cached(VirtIODevice *vdev,
+                                          MemoryRegionCache *cache,
+                                          hwaddr pa, uint16_t value)
+{
+    if (virtio_access_is_big_endian(vdev)) {
+        stw_be_phys_cached(cache, pa, value);
+    } else {
+        stw_le_phys_cached(cache, pa, value);
+    }
+}
+
 /* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
-- 
2.52.0


