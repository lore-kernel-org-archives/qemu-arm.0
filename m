Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C3FCCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBttC-0006OI-0C; Thu, 23 Oct 2025 07:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtt9-0006JB-JS
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtt7-0002ei-5f
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso7851405e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220427; x=1761825227; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ksRzEOXsw7/qT6nxPgIci4xbN2jOFu95y2T7RO0BwU4=;
 b=WpF15k2SyaVgSbx2/ESlRjKNToVzvaAANQhE8d/iqBCV5uWcwMHai97Mu1dt6gtnw+
 U6NqhSwQemwJlr5Gfs4SMWrBs4vPASyXzNQny6NgyN/hhfbjq8Uzlls4OoKB5n7IHh+4
 Le7swcFnx6+MExOfNMs7yFgTg2w28ayv41B7n9KnHPCFcn7iBxBoR6Lf48Bn7Oain6wH
 kLds+cBJ17Da8NKfG8QYqYx38BPRqtHDZG+QSEE3OFG/Ok6AnxSapbCmfw/2H/cwr4lj
 1hm9job3dPAo9lRaHEu9z1wAjqHts1p+9y627GDlnYmnTeBOMWWEOFiZZDSZGWcv6jKz
 K2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220427; x=1761825227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ksRzEOXsw7/qT6nxPgIci4xbN2jOFu95y2T7RO0BwU4=;
 b=jMwWYxM1J7QFMLOB5OoJ7xYPm5lsl0umY3D2K8GLfvBEaKIZ7F8IEdShbYsKtSnsl8
 aW1F2Siwg+mXzemBHNf0HEDMSeRHszga30qUtriU7AS20Vm93lsITJVcs+jWKKBpkt0h
 fDj9Jy584sXkEiyNLjkwFP0heV8uNFYr41HT7pSnL8lOqNFptV3tlywhgpS3nt09E07x
 wyoLPE833IsJQb7UayfF6nqMc/+sN2Nl5cQ9Hs3nLQzCeQzehOj9JPSJliNKmSZz7mlg
 GJIqfQuCAuP4huuuAfiekaB6tmholsCmC7x3FFMgst+kJ2FwQg1ZCw0XHNp8oLCQ+xv1
 vZKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQCgQEuJrGJtFzHFU5Bn3RPi/lxy8dksRYLUIgY7AeMuT0EW7z2u3hnbglzDrulSrMHhtW2l4bWw==@nongnu.org
X-Gm-Message-State: AOJu0YyEcb3ZxYimuDuFUi3dgmWHw8Y7mXeXFR3icEl9l7ln6No9x1/2
 N6Z8jG+W58w35tjakkr40/qoZSDtDlH2OjCkZd0bkYbd7g3rbVgJmfYAZA0RyEKTHD8=
X-Gm-Gg: ASbGncvQ2qpQQJoaoxkqkFQa1N78H+h8u/bAAtOYCdsWFajfKRczL2r9ixeJEpY7d64
 dT7WpM7/Rbj0cXKMqa2jZxWJ2k43p+gXa6TxuY8QJJx3RQcpgaXXBxzcRmt9cP/cgV65GICCCIL
 JfAj3nP4t2cAxZqrEB3md5CUREYlXfbhD5WqL2XY1TYQVOFoMXWzlbX1MWtuiP5ptQ64YxI9c95
 FGqiEUCqUhoodPZ4Sxj04PJ2G8fh/xujvDFh+6cqGox5AbSMWyrMsoCv/iu0/ftgpwPinAgEm0v
 XMPfW/KecCSGBe762qySR0BmCWN5bVvVO7ApN6Vh5JC219++gpOKkA82SbLzlZ+iEBoDC6KEe3s
 VV44ollghOxn0lZuVmagy4/f2jYg7Vme+vY9p8YgPY+e5CRkXHkRY+W7PvhBl/Sg2p/br6C1hET
 1MX8OsI2KcazSYBHIl4vFbsAvj+wUU9GtpBlUOCQhkUOJkwciQd1eYv+17YFmF
X-Google-Smtp-Source: AGHT+IHnaCVjtUWUAaXIHvDzg+vAp/gJUckpHD+CDTGKlI34zNdNqoNOsIx7k+eYph5Os6YS7RSHZg==
X-Received: by 2002:a05:600c:608a:b0:46f:b42e:e397 with SMTP id
 5b1f17b1804b1-4711792cd70mr162423305e9.40.1761220427410; 
 Thu, 23 Oct 2025 04:53:47 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf15498sm40025825e9.12.2025.10.23.04.53.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:53:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 37/58] accel/hvf: Simplify hvf_log_*
Date: Thu, 23 Oct 2025 13:52:48 +0200
Message-ID: <20251023115311.6944-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
index e13abddbd9c..1be419652e0 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -200,45 +200,24 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
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
@@ -248,7 +227,8 @@ static void hvf_log_sync(MemoryListener *listener,
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


