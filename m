Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12397CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 13:07:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBv1W-0001L5-HQ; Thu, 23 Oct 2025 09:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1U-0001KM-W3
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:33 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1S-0006FY-E0
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so793965f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761224788; x=1761829588; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ylvuf688MxbDh+xWuVO8cCat37R7AD8jYlsTF5cm0AQ=;
 b=T8MnXXWVmPSfAi7e9OrE53jLfT9R3mYypMSt+/LQfIk3W1Hqj1JKw6+E5PqjMCndSq
 SSuhiSFhBYKzRI5IUEZwK4wAF/4pMz75TexpZangnbwNXeiBdo+t1RRGZoSO5lwSaDXy
 tnibppcXdshD8/7BnzNsgiHoUIkr7B7zW52kWzdv0a0S/rV1TKVBGFD0r8rAIYbIWj+u
 8m/bOpkxgz0x6rgF8h96iInOyu+qtZNUqh4EzorlROXqlnXHhnPXgRtIplAjIAWQhi+y
 Qh8eDmBj2o9EbTHH/u0bBQ+/sfa5cxQP48Fg/n5k+K5xjDzn4HJjVDGBBPWbBJXzv1+j
 696A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761224788; x=1761829588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ylvuf688MxbDh+xWuVO8cCat37R7AD8jYlsTF5cm0AQ=;
 b=G0d73DSDIMF0C4uFNbM40i+eYiKBW9HaNip6qfWzIw3G1gE/I/qTPvANuD/5keZZum
 YeAWv2UiygCj6vmthy/bN9v2VjqAV+Xu+H0Ug/YAqyikKfB5dd51T8trkzgIVvKvWS5P
 q6igM0lBKW2M+OsyKBWh+5g6WtED58W0VbiebtihJzSj2oC3izz16agLDo4GMbWxObg+
 aifLNFFc+zOEMSLQh/WQra+2EqH0kX5TJ3+PfhqL7DB0YewVzVE3vCJrAtni1i44r2Wl
 E2XjwsVU5/S+UtJ3L3caSEpyba9x5uAy8WdqsNbB/3uru7L3vLxudWg3HCnwm5WG7sE3
 8wsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQxcc4aRqwW5KbDpchbu/E/iRn+Wy/rq5svKv3A2gyDPkQn0cH2sO4gRMHN04Z3hZzcpbgRRNLsw==@nongnu.org
X-Gm-Message-State: AOJu0Yzc5Ijv2WIy4MvQ3qpkljog1ToEPoQ06kNx8YvixgP28NOIV1+Y
 BLBr/SrQsV1OooXi60WS+Kaj2HiB7FcPQ3T0trnn9WLj2JT2G4f3lh9zbPuoqK2ivIw=
X-Gm-Gg: ASbGncuFHN+uB1ptjL3O8WyYAE8MkWTDxLn8b5AUcLumjOVEATIK/trsp6x5U91TAi1
 mtxr2yX4EDXaM7TntFRKXLMus8PUbdJj/KZrHGINJ5gZuv+tk8QD8HtmP5MZZ4/67EYBxhb1CU8
 Dn7fLGphZ/5Chf8vgA28WCosJw3I4v7UaAtM9X5toIsGkFe+ZUjBvGuoYC8qi6fvOyTv1pkgZ1d
 noDViKIIf76QDtMIQHDMdEO2xMqkj6bp/aKM+FeomFs3BOBiouaNsolChkGTmIUUEPMyguzJpVV
 kWDpBDQa0q+45EkCNCbTxl9x5u0HRkYzrYYq1VYfgC9XuAdPjYY/5KHhKKmrjRLBb5wX7gKFOVY
 /JSuL8i7l7vNthRXvz2RrJ8zMW7aafgNjAzdtCI+U594UPb5a0DIR+LAsFTB6qeSe8hWHvDdh7E
 5vB+Pj6MKpT8TRJf6Lmak40hg9tgn169IzoLz3QOy8UhhW6itq8CFgE01nz2RlGxR9CaYl/kM=
X-Google-Smtp-Source: AGHT+IFlIHkStDkPc+/dZCWHm/OnHFDELZm4R4I2b6OVBpuibq1q4sm+mLYgBd7V+O5lu8LVm7rhPA==
X-Received: by 2002:a5d:5848:0:b0:3e9:f852:491 with SMTP id
 ffacd0b85a97d-42704dcefa6mr18029303f8f.56.1761224787635; 
 Thu, 23 Oct 2025 06:06:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898add96sm3872005f8f.30.2025.10.23.06.06.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 06:06:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Collingbourne <pcc@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 42/58] target/arm/hvf: Implement dirty page tracking
Date: Thu, 23 Oct 2025 15:06:18 +0200
Message-ID: <20251023130625.9157-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
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

Notice writes to pages which are being monitored.  Mark the page dirty,
re-enable writes, and retry the instruction without emulation.

Assert the fault is not from a stage1 page table walk.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 52 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 77998ab90a6..cf4746c344a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -37,6 +37,7 @@
 #include "target/arm/trace.h"
 #include "trace.h"
 #include "migration/vmstate.h"
+#include "exec/target_page.h"
 
 #include "gdbstub/enums.h"
 
@@ -1880,9 +1881,10 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         uint32_t srt = (syndrome >> 16) & 0x1f;
         uint32_t cm = (syndrome >> 8) & 0x1;
         uint64_t val = 0;
+        uint64_t ipa = excp->physical_address;
+        AddressSpace *as = cpu_get_address_space(cpu, ARMASIdx_NS);
 
-        trace_hvf_data_abort(excp->virtual_address,
-                             excp->physical_address, isv,
+        trace_hvf_data_abort(excp->virtual_address, ipa, isv,
                              iswrite, s1ptw, len, srt);
 
         if (cm) {
@@ -1891,23 +1893,55 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
             break;
         }
 
+        /* Handle dirty page logging for ram. */
+        if (iswrite) {
+            hwaddr xlat;
+            MemoryRegion *mr = address_space_translate(as, ipa, &xlat,
+                                                       NULL, true,
+                                                       MEMTXATTRS_UNSPECIFIED);
+            if (memory_region_is_ram(mr)) {
+                uint64_t ipa_page = ipa & TARGET_PAGE_MASK;
+
+                /* TODO: Inject exception to the guest. */
+                assert(!mr->readonly);
+
+                if (memory_region_get_dirty_log_mask(mr)) {
+                    memory_region_set_dirty(mr, ipa_page + xlat,
+                                            TARGET_PAGE_SIZE);
+                    hvf_unprotect_dirty_range(ipa_page, TARGET_PAGE_SIZE);
+                }
+
+                /* Retry with page writes enabled. */
+                break;
+            }
+        }
+
+        /*
+         * TODO: If s1ptw, this is an error in the guest os page tables.
+         * Inject the exception into the guest.
+         */
+        assert(!s1ptw);
+
+        /*
+         * TODO: ISV will be 0 for SIMD or SVE accesses.
+         * Inject the exception into the guest.
+         */
         assert(isv);
 
+        /*
+         * Emulate MMIO.
+         * TODO: Inject faults for errors.
+         */
         if (iswrite) {
             val = hvf_get_reg(cpu, srt);
-            address_space_write(&address_space_memory,
-                                excp->physical_address,
-                                MEMTXATTRS_UNSPECIFIED, &val, len);
+            address_space_write(as, ipa, MEMTXATTRS_UNSPECIFIED, &val, len);
         } else {
-            address_space_read(&address_space_memory,
-                               excp->physical_address,
-                               MEMTXATTRS_UNSPECIFIED, &val, len);
+            address_space_read(as, ipa, MEMTXATTRS_UNSPECIFIED, &val, len);
             if (sse) {
                 val = sextract64(val, 0, len * 8);
             }
             hvf_set_reg(cpu, srt, val);
         }
-
         advance_pc = true;
         break;
     }
-- 
2.51.0


