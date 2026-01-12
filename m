Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA579C9EC67
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:31:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDI-0001eR-VD; Mon, 12 Jan 2026 05:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCi-00019w-MA
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:22 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCg-0001i8-Ul
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:20 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47d3ffa6720so59464265e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213877; x=1768818677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpoVoyzKEMQOQOPpAUew9Gr5OoFiq3RIGI/UbsfUcDU=;
 b=W3EjPgWMTLckJMcOAoOX4DZw2vpEyVumMOLH9MVWiNkPVOB4CmSDaExEJ5V8oaUFDI
 9VnETgTANXgIaNbBzfTR2/VORfpYz60DxRxrao6Vf4FT4kAzwBMzdcGpys0KDzdpuTWt
 keSeCoE2v2nhxWhbLiG14R/l02wakirC2lNbMQsPBD2IhDR2Tj6L+n5ueeuW3zcbunuE
 JUHNDwjFFro+psv+AC993EQSPg47gBM9ctm8ntGsjLNmvm3qNg/x4QmAo8Tgp3WJzHt2
 zFf9xOz2jbt1irdEfeSNx2SbIlYdXngS7dhywnB1ZDhh96muwJ54v9c8R/g0Ohf4AQR5
 PP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213877; x=1768818677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NpoVoyzKEMQOQOPpAUew9Gr5OoFiq3RIGI/UbsfUcDU=;
 b=AwGSL3ScOUo01ckbyuwqe7ossk8+YgeVRO7Qfk/8Y06vKLfzu5qyOyTv27y6s0ofqG
 q/+Xl0haXFYvxKJ2pil8R7GGv/bsx7TJFAOjcl4ErdOFGmSqAnxZkYDWcG6eOz3OMgc8
 x0U/ufGERG+UAlxipRsO13FIUYTuQW/0kwlofY708SmhSVfVqeSa92YC+Fp7jrGMFs2x
 ULDtBK9h0ftm8HNiu6+yrR/7VdMB7XEXhasgtg7EvKbKrMDTqq4KA/flrOdbBESS8Uui
 a3rdtobxp951NPgXC8pjw36ZBZRBUyTnkHrHrww+aU+Q2LIasMI2LMU1xqHtck7NuTfF
 X+xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHveUGqZ/eUoPoXz+7JhfsOv1GE4YbwSBu1osW8fgqLkx6K3+bGmX5dkeb1EabcWLFs23WQAq18Q==@nongnu.org
X-Gm-Message-State: AOJu0YwPpO45SPAH8+nO4kW0hdwmYRjQYvybg6t5mmVa1DUlDNLDyTPj
 d1Jm2gWtAqE/d1Cia+294kHduI/yW6gWLbwtarmwBbzezm608zQYbqOE7RsH85BSkDs=
X-Gm-Gg: AY/fxX47JQel18PSQfDlPwWv5aXwVzuy/SKo473/j0xD0H9cJ9nSx4XFmWT66aC/OCC
 ZL9Ra6sRQLQAyWHkOXzGovnf4FpfVUU3Scjvpm0PQnrAatnkMWz0vs90aKFp+91GgWmabNPCSN9
 EWJzINoazit5jdqIMVglnL1qzCUSe+jxoxQ/7F4QGu/VD8eW6OY4TT6K4mPPqKKKj10hUjXr7X8
 4hAoCU/LnS6l2kzxvnhW3heu6lVIkm2bfOwLtl5wI9OoOcvDjecxj87LvtlwsL/nMVBLYrU3M+Y
 /RQFuzIeq6kUeP9NbGFbrGXhtY4h7XDJ7oIejXyqRq6SfOUTKjfh2XHSpuJkYn4yYEFJD7WJg/w
 c57gOnk6eNDuWhllIvTlS0SqR4+eQ8ayLWQVh2Aug9IJWREi06UOj6cD6RHTliXwRsmnNfOZaJV
 TTTQJrAvWq3ZNE2DUWSSg86DysNgCWjBPencUZ1es3FDiSGg5DFotBNvJpvKCc
X-Google-Smtp-Source: AGHT+IHi4hPEIeeCHvq5wDFHBvggzMvh+mlDjUUsbZKxfKK4A//iWzyjZqq1WMJULSisnocro/NlfA==
X-Received: by 2002:a05:600c:1e1c:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-47d84b0aa4bmr173588495e9.5.1768213877182; 
 Mon, 12 Jan 2026 02:31:17 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f41f5e0sm340958915e9.8.2026.01.12.02.31.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:31:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 06/19] accel/hvf: Simplify hvf_log_*
Date: Mon, 12 Jan 2026 11:30:20 +0100
Message-ID: <20260112103034.65310-7-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Rely on the AddressSpace and MemoryRegion structures
rather than hvf_slot.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 include/system/hvf_int.h |  3 ---
 accel/hvf/hvf-all.c      | 40 ++++++++++------------------------------
 2 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 5a57691885f..ee7ab689f45 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -24,9 +24,6 @@ typedef hv_vcpu_t hvf_vcpuid;
 typedef hv_vcpuid_t hvf_vcpuid;
 #endif
 
-/* hvf_slot flags */
-#define HVF_SLOT_LOG (1 << 0)
-
 typedef struct hvf_slot {
     uint64_t start;
     uint64_t size;
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 96ed79108a6..bbb0403d246 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -204,45 +204,24 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     }
 }
 
-static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
-{
-    hvf_slot *slot;
-
-    slot = hvf_find_overlap_slot(
-            section->offset_within_address_space,
-            int128_get64(section->size));
-
-    /* protect region against writes; begin tracking it */
-    if (on) {
-        slot->flags |= HVF_SLOT_LOG;
-        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_EXEC);
-    /* stop tracking region*/
-    } else {
-        slot->flags &= ~HVF_SLOT_LOG;
-        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
-    }
-}
-
 static void hvf_log_start(MemoryListener *listener,
                           MemoryRegionSection *section, int old, int new)
 {
-    if (old != 0) {
-        return;
+    assert(new != 0);
+    if (old == 0) {
+        hvf_protect_clean_range(section->offset_within_address_space,
+                                int128_get64(section->size));
     }
-
-    hvf_set_dirty_tracking(section, 1);
 }
 
 static void hvf_log_stop(MemoryListener *listener,
                          MemoryRegionSection *section, int old, int new)
 {
-    if (new != 0) {
-        return;
+    assert(old != 0);
+    if (new == 0) {
+        hvf_unprotect_dirty_range(section->offset_within_address_space,
+                                  int128_get64(section->size));
     }
-
-    hvf_set_dirty_tracking(section, 0);
 }
 
 static void hvf_log_sync(MemoryListener *listener,
@@ -252,7 +231,8 @@ static void hvf_log_sync(MemoryListener *listener,
      * sync of dirty pages is handled elsewhere; just make sure we keep
      * tracking the region.
      */
-    hvf_set_dirty_tracking(section, 1);
+    hvf_protect_clean_range(section->offset_within_address_space,
+                            int128_get64(section->size));
 }
 
 static void hvf_region_add(MemoryListener *listener,
-- 
2.52.0


