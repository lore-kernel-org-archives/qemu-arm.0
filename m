Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EAECA0FFD
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 10:22:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut1gA-00014K-6m; Mon, 01 Sep 2025 06:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut1g7-00013q-FP
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 06:22:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut1g4-0004KH-B6
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 06:22:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3c46686d1e6so2748715f8f.3
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756722137; x=1757326937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GHK4Qse9WWiTjasYuuceh/FCOXisvEzKhy7w/vPr4MQ=;
 b=znNQyhRkUo3YIMi9zku6I0G6+hYXOMsRasr3BIhjEvDfChRwCTJnPb6H6s6K0GqMfM
 SIgxgBuPy12VMqFf+qttMtgBcQl+0wp+JgIWhsxNiv7wQvXZdQ35mOV4x5AOPr0aMgn8
 uXdgYii2LycS4jbZx5P+d2B55fs5Np2A/DHMmjZRj1xRMvW9O5n7+Zjm4dYxs/z+PPqH
 2XLgeGEE6ODogF7pEI3xv+syjTOqo21aUI4M/8a+LZ8p5Okpbfd9NDjvBrwpPxp2GHYc
 wwxPPycOdsFB4x/d1ZH7rRyQIdFpHPd8xpc2WJCg9qLLrwavfb8+CxpdLUk2ftoxZEWX
 25Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756722137; x=1757326937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GHK4Qse9WWiTjasYuuceh/FCOXisvEzKhy7w/vPr4MQ=;
 b=m9SC+Eo3CJEdVmejS8dn2Qvmk4WVkXHza6MDEjCxQ2MWWQuPYBwAalhcW4OxfWgphb
 QIj9Qvmc6a3ZgCf8XgIdrbLT9SbJ09RMn4zkEX/lY/ZDUFCsSmcYcI1sxAnsTuoJgJV2
 BaS9rgAIOaZ0zJ+xz2gE3DXZYbWOAjcaRcxcWk8pspWevybWL8EThwO3OUeJbJkR71X4
 cQpLHnUZ9lpN2rHjQLrHZsiTziHL9h3MaIzYfFD0OowzTIW01+XaM0aHMIhSuQEZce5Q
 tye7k6ZC+efPqPDcQCrtd05eYy++dbTAQycZgMD4juNcNOpVNVg8jpbA8/mGi+jqUBkf
 cYkw==
X-Gm-Message-State: AOJu0YyjuSlRX3kpAlxHHncDBbzarrNay8CAAPWYPJGGUTOe/59XGLwt
 SrmyJdt13thBhFji1MzApiMV+9hEn6XBj8R5zHpl/BkJzyaJYFzr1MkjLCNkbYHhaD1v0c50i3V
 MW0HO
X-Gm-Gg: ASbGncsB3UWrEHXAH6TmnAvIkcD1kEwDZx53H3xjmEoM1KAXHISuMLjhgsuNyctmbGz
 +UrRHIZV074Hf8uQsZvBN/iXyT5AXdTPqfd7J17Ksoxcih8NcvIKni4gy1O7wnseXcQam3CjF/N
 x2fxmBIVwYUF9gPWpQa+wvG7jFRn+6B3nwSBEUzDoyaQRRbytyuc5yhcjWK2SWx45DTTDS1YGgD
 0e6PeXEF6VklXwaEH029I8UKYzABHL8407UlKNydZPyOfbQ9wXNyVNKZN35lNdb6PUV58ukhHAh
 awY6WQ7aa61YRHJ4loDZ/cBuI4CvRhJ3Uev/pDwFbOqJb0xGzo41OsByQL7XShmMLnyhn0n1vUe
 fcAHInN090QZ7PX9UO9uUGLl8NPAPX1fgFkDbJgM=
X-Google-Smtp-Source: AGHT+IHEZWTE+SFYOqVHJn4EJs10dl+gjkQVbYDFxoOU9lF3TDj8cJR5xhEzgoQgffQW3sOzD5Rg9A==
X-Received: by 2002:a05:6000:18aa:b0:3cd:7200:e028 with SMTP id
 ffacd0b85a97d-3d1e01d6119mr6359942f8f.47.1756722136623; 
 Mon, 01 Sep 2025 03:22:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8f6cd502sm8470115e9.1.2025.09.01.03.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 03:22:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH] hw/arm/boot: Correctly free the MemoryDeviceInfoList
Date: Mon,  1 Sep 2025 11:22:14 +0100
Message-ID: <20250901102214.3748011-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

When running the bios-tables-test under ASAN we see leaks like this:

Direct leak of 16 byte(s) in 1 object(s) allocated from:
    #0 0x5bc58579b00d in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-aarch64+0x250400d) (BuildId: 2e27b63dc9ac45f522ced40a17c2a60cc32f1d38)
    #1 0x7b4ad90337b1 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x637b1) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
    #2 0x5bc5861826db in qmp_memory_device_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/mem/memory-device.c:307:34
    #3 0x5bc587a9edb6 in arm_load_dtb /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/arm/boot.c:656:15

Indirect leak of 28 byte(s) in 2 object(s) allocated from:
    #0 0x5bc58579ae23 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-aarch64+0x2503e23) (BuildId: 2e27b63dc9ac45f522ced40a17c2a60cc32f1d38)
    #1 0x7b4ad6c8f947 in __vasprintf_internal libio/vasprintf.c:116:16
    #2 0x7b4ad9080a52 in g_vasprintf (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xb0a52) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
    #3 0x7b4ad90515e4 in g_strdup_vprintf (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x815e4) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
    #4 0x7b4ad9051940 in g_strdup_printf (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x81940) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
    #5 0x5bc5885eb739 in object_get_canonical_path /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../qom/object.c:2123:19
    #6 0x5bc58618dca8 in pc_dimm_md_fill_device_info /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/mem/pc-dimm.c:268:18
    #7 0x5bc586182792 in qmp_memory_device_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/mem/memory-device.c:310:9

This happens because we declared the MemoryDeviceInfoList *md_list
with g_autofree, which will free the direct memory with g_free() but
doesn't free all the other data structures referenced by it.  Instead
what we want is to declare the pointer with g_autoptr(), which will
automatically call the qapi_free_MemoryDeviceInfoList() cleanup
function when the variable goes out of scope.

Fixes: 36bc78aca83cfd ("hw/arm: add static NVDIMMs in device tree")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1e57c4ab9ee..d0840308f5a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -549,7 +549,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     unsigned int i;
     hwaddr mem_base, mem_len;
     char **node_path;
-    g_autofree MemoryDeviceInfoList *md_list = NULL;
+    g_autoptr(MemoryDeviceInfoList) md_list = NULL;
     Error *err = NULL;
 
     if (binfo->dtb_filename) {
-- 
2.43.0


