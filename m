Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3EFD6554E
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:33:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsaF-0001i6-05; Wed, 17 Dec 2025 09:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsa3-0001d6-RM
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:45 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsa0-00078Z-8T
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:42 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-431048c4068so514478f8f.1
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981959; x=1766586759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1fwsgtFaKbQAG4JXp0styAfpJOXTnc0HrVyb3kjNSp4=;
 b=ElsVR5X1T7ByU3o0QD90UPFcvxdoYjQ66pZJUgOJEr/qH4HgNAnwze3vHaixQtScsT
 wAyk1OLw0mvxkrkTDXKburMAmppp8fJMPQA76WAlS813xMSXA4vjUl1xK6PW+cO9owj8
 FH9rB+NxtoEnaSDNdHjyJZ6eqw3jxjDua3lTBTxpOt36yqXuVA1+Iz2+zkdDoYNzv9ib
 2F6mprjiOtfgPZkXuiI0gRHuIH5ZTtsSPd99OnHNgMYC3HOG+J2bMGHMzFcwKvY4uICo
 KIR1wq5QpWusF2oszK4o7vwwp8blK+N2r0pldiMcFXx11Uj7vRSx1MgpYLJgka7gpyF3
 O/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981959; x=1766586759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1fwsgtFaKbQAG4JXp0styAfpJOXTnc0HrVyb3kjNSp4=;
 b=jVbKqb1nc//bTLohXNXBtyVxNZjOGIHRbpsehGnm+NoFVfNz+Ku7juz7QV2JQi7yWz
 WLCKSNgh8FzxH7afAMn4s01cLux4DYjLi9h3rxTApnBVGKNX1PzKDapupmGmLlKYKZ0J
 HdqXZHhSwx0t1R4rBj0aDrZU8AvD0js7T9pzOx2IhqRarE3InTkuuzLfTrXAS2r0ZHKc
 9Fq4IzTqgmfmne36pt8+HeBIdvbLu4WCQdBNh9pOXR0ESw5zms/87HVkv0vCmd48j85E
 BlWFFLDG3QBaFPQqwV1/+t+kCLhc6L7cth/G2der6kKWFqG6AOCx80Ncgle4Zr4skuVJ
 vFAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKP96JaLGBFKAUUY8T97wStbgXFEGyqZoojdgQHAKcHBTFNiW+JXCNt+Sf8ww/JPGkNeFTLYRBAw==@nongnu.org
X-Gm-Message-State: AOJu0Yzme1pF2xl7Wn5vhjsznN91DJn38/JZmwYXgWDznMK2JIaQZlWH
 w0SJkGdRplE/AuSJamWaZuGi+xcXb+dqiUjOyctCv0JfE9y7JpKW7f6AJJZmddFCw0mi3aaovk/
 zbVTrZ1Mjew==
X-Gm-Gg: AY/fxX73ia22HXwb9UsX/suNAiTlQxWqlArbojA8LFe7z4f5AD90OVYND8j+RRhaiNH
 4rJ8Im5kCqHKH9PewULUMTfqWhp4nKomTr6p7snhX2gLDXPS94z7pDPxdvRZ0isHL4hIxWFX2bS
 pnHnYNJMT2t11A9HDt1YsiVbY9rkL5CmlsrskOIyiOFe9nH86kaW5bpuHiSW7LOtXVLiiNrpGsS
 T8/MwKpnjTjIgr/w+6w0KVnVOi+Vuyn1KVPOutAMZ7by/mfoVb1PgCHxMjIbAthp7zeWYE6K3VC
 Wpv+GVzhK33mE3CUe1GEurYfWzdUAgyho8NR3TOISX5sMqSPha7eZDv9kPVgvI83LRs9QEGS4J2
 XsTfsOjDGFTo79QmSlBS44fOlcn6nYbYVqf4vU/gVpPxjs5+1tyoVf5k8K/dvX098zoKKb0nTxI
 BVbPqonVjTRaFgKqppoHl+PAg/qfmLnXaNAqg30E07mzM+9x1x//NN4GM4hz92
X-Google-Smtp-Source: AGHT+IE0XGXOlrf3bv1/geEBCvD/Tg4G7Dha3GeGD1NXZX2t+fKUE4k3RXS7jdypqPcRBJUj3mvC+w==
X-Received: by 2002:a5d:5d09:0:b0:42f:7686:5693 with SMTP id
 ffacd0b85a97d-42fb3eb87d2mr25060054f8f.16.1765981958541; 
 Wed, 17 Dec 2025 06:32:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310ade8072sm5311445f8f.25.2025.12.17.06.32.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:32:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 06/14] system/physmem: Use explicit endianness in
 subpage_ops::read/write()
Date: Wed, 17 Dec 2025 15:31:42 +0100
Message-ID: <20251217143150.94463-7-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Replace the ldn_p/stn_p() calls by their explicit endianness
variants. Duplicate the MemoryRegionOps, replacing the single
DEVICE_NATIVE_ENDIAN entry by a pair of LITTLE and BIG ones.
Select the proper MemoryRegionOps in subpage_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 81 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 17 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index 1292f49095f..d8465f085bd 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2896,8 +2896,8 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
 static bool flatview_access_valid(FlatView *fv, hwaddr addr, hwaddr len,
                                   bool is_write, MemTxAttrs attrs);
 
-static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *data,
-                                unsigned len, MemTxAttrs attrs)
+static MemTxResult subpage_read_le(void *opaque, hwaddr addr, uint64_t *data,
+                                   unsigned len, MemTxAttrs attrs)
 {
     subpage_t *subpage = opaque;
     uint8_t buf[8];
@@ -2911,12 +2911,32 @@ static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *data,
     if (res) {
         return res;
     }
-    *data = ldn_p(buf, len);
+    *data = ldn_le_p(buf, len);
     return MEMTX_OK;
 }
 
-static MemTxResult subpage_write(void *opaque, hwaddr addr,
-                                 uint64_t value, unsigned len, MemTxAttrs attrs)
+static MemTxResult subpage_read_be(void *opaque, hwaddr addr, uint64_t *data,
+                                   unsigned len, MemTxAttrs attrs)
+{
+    subpage_t *subpage = opaque;
+    uint8_t buf[8];
+    MemTxResult res;
+
+#if defined(DEBUG_SUBPAGE)
+    printf("%s: subpage %p len %u addr " HWADDR_FMT_plx "\n", __func__,
+           subpage, len, addr);
+#endif
+    res = flatview_read(subpage->fv, addr + subpage->base, attrs, buf, len);
+    if (res) {
+        return res;
+    }
+    *data = ldn_be_p(buf, len);
+    return MEMTX_OK;
+}
+
+static MemTxResult subpage_write_le(void *opaque, hwaddr addr,
+                                    uint64_t value, unsigned len,
+                                    MemTxAttrs attrs)
 {
     subpage_t *subpage = opaque;
     uint8_t buf[8];
@@ -2926,7 +2946,23 @@ static MemTxResult subpage_write(void *opaque, hwaddr addr,
            " value %"PRIx64"\n",
            __func__, subpage, len, addr, value);
 #endif
-    stn_p(buf, len, value);
+    stn_le_p(buf, len, value);
+    return flatview_write(subpage->fv, addr + subpage->base, attrs, buf, len);
+}
+
+static MemTxResult subpage_write_be(void *opaque, hwaddr addr,
+                                    uint64_t value, unsigned len,
+                                    MemTxAttrs attrs)
+{
+    subpage_t *subpage = opaque;
+    uint8_t buf[8];
+
+#if defined(DEBUG_SUBPAGE)
+    printf("%s: subpage %p len %u addr " HWADDR_FMT_plx
+           " value %"PRIx64"\n",
+           __func__, subpage, len, addr, value);
+#endif
+    stn_be_p(buf, len, value);
     return flatview_write(subpage->fv, addr + subpage->base, attrs, buf, len);
 }
 
@@ -2944,15 +2980,26 @@ static bool subpage_accepts(void *opaque, hwaddr addr,
                                  len, is_write, attrs);
 }
 
-static const MemoryRegionOps subpage_ops = {
-    .read_with_attrs = subpage_read,
-    .write_with_attrs = subpage_write,
-    .impl.min_access_size = 1,
-    .impl.max_access_size = 8,
-    .valid.min_access_size = 1,
-    .valid.max_access_size = 8,
-    .valid.accepts = subpage_accepts,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+static const MemoryRegionOps subpage_ops[2] = {
+    [0 ... 1] = {
+        .impl = {
+            .min_access_size = 1,
+            .max_access_size = 8,
+        },
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 8,
+            .accepts = subpage_accepts,
+        },
+    },
+
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [0].read_with_attrs = subpage_read_le,
+    [0].write_with_attrs = subpage_write_le,
+
+    [1].endianness = DEVICE_BIG_ENDIAN,
+    [1].read_with_attrs = subpage_read_be,
+    [1].write_with_attrs = subpage_write_be,
 };
 
 static int subpage_register(subpage_t *mmio, uint32_t start, uint32_t end,
@@ -2983,8 +3030,8 @@ static subpage_t *subpage_init(FlatView *fv, hwaddr base)
     mmio = g_malloc0(sizeof(subpage_t) + TARGET_PAGE_SIZE * sizeof(uint16_t));
     mmio->fv = fv;
     mmio->base = base;
-    memory_region_init_io(&mmio->iomem, NULL, &subpage_ops, mmio,
-                          NULL, TARGET_PAGE_SIZE);
+    memory_region_init_io(&mmio->iomem, NULL, &subpage_ops[target_big_endian()],
+                          mmio, NULL, TARGET_PAGE_SIZE);
     mmio->iomem.subpage = true;
 #if defined(DEBUG_SUBPAGE)
     printf("%s: %p base " HWADDR_FMT_plx " len %08x\n", __func__,
-- 
2.52.0


