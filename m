Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B52C9EC63
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDK-0001ql-Mg; Mon, 12 Jan 2026 05:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDJ-0001gB-FB
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDH-0001mr-7q
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so57818945e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213912; x=1768818712; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y91fAvc6xKZuK9le0d8AtWKsv85XevnNosJ5k8ViqPs=;
 b=LIaRnWbrnWBEY4SZEucLHKlMk57rAjAnh28e0hctfoAsIxLWwDHmTLC1dk0pEgxFM+
 z2Kb3JdVWqbv+YtDIzJHal5Jo0EITelgzDsRyrB82l2Bg2DLx2O0YT8m5ndIwlIh14TA
 QHXNG9CNAeYvRBWKIS4E+6/BDPkgT1NI+l4Kqx5sVraCX2NtrfhQfsr8VJ67DCySst9F
 R23mSxVTCVRwpvVGgPLXyg58Y2igAS2dwbopSzDeN7fCbHyVSrLf4OTIOKS24Rzi534R
 bSLvmAs8lydTm7UFYwq4SU/LgTg03lNC7lM7a+o8jSKjjB6vfUyGqhzUzVbZKikWp+de
 d1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213912; x=1768818712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y91fAvc6xKZuK9le0d8AtWKsv85XevnNosJ5k8ViqPs=;
 b=QdBxHCZ+P/MXuanx5YxWlTmiVXtq0bluUFP2zGbZSVa8Tm6SGwSLWNqFDFDCKRnduE
 OyQAvnSk2K0dqk2hRNmZbmdjz8gM6lC1t6LiOybVoRLBovP8O4DulApwyM9CLVmt7kl+
 PNfW9t+atDJfmJ3EKGD1GOjbLXBHd1M6SzbDljQ+ChuY7KkOu3RnAvWPurR40uWJIcWY
 ZrftXB+5abtx5tApCgXP268FoTAPO4k6IloQuedEkHyJM4qSyast2rzUNkd58hW3vet9
 24BZYXBprLFSG/EV6Fw/de/zhxmBXm4EZricN5YXo9py98ruwvCiFBflBIVKfL+I0Ka3
 YlLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCFSeYRLJhHBVfbjNxq9TzQAOiMfUSQJ00Rqwb3z+qM2cMY3wbOYn1Eu9z5+0Rlr2Bs64uwKTWBw==@nongnu.org
X-Gm-Message-State: AOJu0YwXmvGZtSEwGEuRsRuZFcGbOdN8aOlnHcfVJctxtVocH/TyWTln
 3UEPfqjlIjRGAWroTPWioWd856tWl3n44sVsx14eRs5E87JrTkF6eioLwr2vDfd0L8M=
X-Gm-Gg: AY/fxX5UyMQs2ILmnuX5Pwa2t+zlZifqVQxuqa3Qd9XmoqZHQx1EdyzRvr7F6rvtNYE
 XzzKI4SMYj7cgtxi7yUNnU+kwIOLP2wDGvFCEPH/6yAYGl+9qBrXq6XIHmsIpVSqPR3IeOup55f
 cGbLJMs3i5EFPe8Ug4UhQD0P8JMjG+LJGrH5fYHJCRCPXGe6BuBV+n5aeN43aBM3bYYWqWsxSwK
 kd0mEfnLDX86dqL7bDV+wUgNxeli3zyjjc9ja///Lvd8vYCKjV7Os/7rmTQ2M4plXFj3O5t9mYT
 vjPRgL8Epo1DtloPJnnhKjJydHY/x95guEuW4oDhFQ8jHOWhmLEZ0sDVxosyqsHCsstjLtej1FP
 9zVh60ygDh1OH4gO+mQcPykTrPh4dHWgDh2SOMvEOEVnDFOCLxt882zXRHvzsSx1zKqpHrQDASk
 pWT/FRsFFK7gTU3MJhDWowE7EJutIcaFoncrZ+HV2beiH9q0gsB2EhHFkbHi/w
X-Google-Smtp-Source: AGHT+IF4tNvGEfgGyLJ0gHv50pXMI++ff4bnPOIRsPkDgJIApYNMzrEw0GLsE39MPAuclIxWVnFdUg==
X-Received: by 2002:a05:600c:4e13:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-47d84b32f30mr219949655e9.17.1768213912562; 
 Mon, 12 Jan 2026 02:31:52 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8660be14sm133154575e9.1.2026.01.12.02.31.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:31:51 -0800 (PST)
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
Subject: [PATCH v6 11/19] target/arm/hvf: Implement dirty page tracking
Date: Mon, 12 Jan 2026 11:30:25 +0100
Message-ID: <20260112103034.65310-12-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/arm/hvf/hvf.c | 52 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index fa26f63a61a..af28b8e8825 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1869,9 +1869,10 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
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
@@ -1880,23 +1881,56 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
             break;
         }
 
+        /* Handle dirty page logging for ram. */
+        if (iswrite) {
+            hwaddr xlat;
+            MemoryRegion *mr = address_space_translate(as, ipa, &xlat,
+                                                       NULL, true,
+                                                       MEMTXATTRS_UNSPECIFIED);
+            if (memory_region_is_ram(mr)) {
+                uintptr_t page_size = qemu_real_host_page_size();
+                intptr_t page_mask = -(intptr_t)page_size;
+                uint64_t ipa_page = ipa & page_mask;
+
+                /* TODO: Inject exception to the guest. */
+                assert(!mr->readonly);
+
+                if (memory_region_get_dirty_log_mask(mr)) {
+                    memory_region_set_dirty(mr, ipa_page + xlat, page_size);
+                    hvf_unprotect_dirty_range(ipa_page, page_size);
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
2.52.0


