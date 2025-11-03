Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557B0CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:13:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrYy-000573-Ck; Mon, 03 Nov 2025 05:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrYw-00056g-9V
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:13:22 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrYs-0002xm-Io
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:13:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4711810948aso29601025e9.2
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164793; x=1762769593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0L1rNSBbDA68/IWNXBGkYS13/51Kd8iUuA26ASfqQc=;
 b=D4rxOSNM03I9Sc9xptgO8YrgCbSfCcUKpF9Rx6f0bILgeuuwQ5izI0WK7KO/1BG5v2
 yXnMXNZctYqoIeEkICIfGedytNBH9R3iu7dJ/nRlxAIAxRVrJ3rngyibvwMvPTE919xP
 LHSe0FNagqYysU90WM7Sq4qMq+0qXu83OkjLnQxZYt1+CzcTpRjrQJUSqMOeuO1Xwxmd
 a5GMv7YzHK/qNQarqa2Wl4U/fbrwVFHzvGSr3GRhFLD+Gdy/VisyiycHD7jrtJ6SvR44
 OmdrMy69ZI8XPvy8hSpnFLDoxJ2iVjC4/qNd8c1WTvXFUAhv5WnZ4PUc3aLmLxUd2V8m
 IJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164793; x=1762769593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0L1rNSBbDA68/IWNXBGkYS13/51Kd8iUuA26ASfqQc=;
 b=reFg34QRq2EGuLbQlQdrhjYNm9AHiPRw/BVITzvX2VAs5S1lYz6Xwe4gpcXS15ke46
 9d4qKdivjCCdSlG69KOS+xP69J8XDDn3EO7N3OD9DhH0vl5nhgsgKo6I5gw95ilss7rL
 VEz22Xv0f7ffwC8kPVvQqJVVMLDlX0DPvsOwk8ODArqPA1HWvxVeKgJf++FYICSETsAa
 ZzECUnxPUA68HVxfnOetozm36Hfx0ArEvNbIk8i2P7lukRPtfXV+TJbAW6A3sQEg139I
 +4HlDmnhIuKCX5JnwhlO8IplDwmsyiCxn4A0Cr1YQ4dqexVUjWRqEwv7fy1QKb/iJi8J
 tsDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5EscCnjNGAxi6BxxTmre1iDehOgWbXz7K4l4N1WvJ6O2/RGwXeEY7dJWsa6rkl5V+GzCIJqYlWg==@nongnu.org
X-Gm-Message-State: AOJu0YyUpxWN5LhawIxwM3lNSR1AScN3T/1+CfDQvkZ7MPOWVO1r4J6K
 S/jErGxgj805EuJi/bApgtJa6zBfNvSj7EMy/x620+ZxiXhRunVfiXut3vIl9M2ysSU=
X-Gm-Gg: ASbGncvADCOowi9cyE6ET7vy/e7IPAjbeH2SL6WxpJxcj0ImWlQO3ncKoKENPTCd92D
 IfNYo3FL2uSeAAi1O7CxwNPuMFGi6URAvh1aB1Xs+Zc59rYRex3pHNEMAs4xqaq9110E9g9g67Y
 phopQQoqd0O6PfzsPzuAwPrQ7njy+Pv96ucQ7jWekYohDqDc8B0IaMREG2L2/e17t/DE6ctfB4n
 A91tqGxYPp+Kg5T843n6PHFaTyHotmbHyQAvWAR0C/lIK0HsGD/0DndH4xxBMsk4bZoYwRqgg9C
 48LWl37MO1vk87AIuQObW6ggXxw0QQxPf++bWgNEMLKw2ZjoneU5+c7GCQh/h+hv3YXea8vZQwZ
 8kh45z+ZPwBVAyQ2bxeAwsGo0m4nIJT5O1Txc2eN6AL7McZMIoWGkr3mwuY7V3Xl+Eiv7Cf3FwK
 lmbgqCO1e+RbNlPTlJE+IfJBbR7+jLjDjlDnVJOJmo/AvRNFj6KMsSBSBoahs=
X-Google-Smtp-Source: AGHT+IFKiOsfs/H1/75JT2DpnBWXcqBuFxoYVJwBciVYxXmT59enPvZavBdmyeUIw6Lgw3CSqAnydg==
X-Received: by 2002:a05:600c:8415:b0:471:1765:839c with SMTP id
 5b1f17b1804b1-47730871f97mr85060715e9.20.1762164793101; 
 Mon, 03 Nov 2025 02:13:13 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fe0da3asm85728615e9.6.2025.11.03.02.13.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:13:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 06/23] accel/hvf: Simplify hvf_log_*
Date: Mon,  3 Nov 2025 11:10:15 +0100
Message-ID: <20251103101034.59039-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Rely on the AddressSpace and MemoryRegion structures
rather than hvf_slot.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index cb029e4dd4b..601e63c7f9a 100644
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
2.51.0


