Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61518CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:12:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcw6-0001y2-6c; Tue, 28 Oct 2025 02:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcw3-0001qW-Ov
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:12:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcw1-0006eR-FQ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:11:59 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4270a0127e1so4393418f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631916; x=1762236716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aS0vYK7FAdW5kWmJPk1Aw+AgekaHr8JT0J7mwxVb5Y8=;
 b=l4MjM03AmdtHcEYzfEK377jgo1/UuHByPo565hJSUuVaETIlFN9ohhA0NedgPvZ/9f
 ZQsybBxxB/PtEKckeMdhbRJTQLmRh7g/po15lSJ1e/l3CiurMAeKlVN4PCZ4b2Sf29km
 1HRxn5k+PkbPFQenQMIQlVg52+mo7KI4UAcOSEneYPwtruEHyLV5iDvjHdW7flLwbOr/
 ALZUwHE+HUK701RyicZqwYGmyh5px6aVT0uGYxns9KtIRFKOEAd1kvj6IcOZNUQWDHB4
 weHy6EEjv5hTeIGZ8StxD1uBKs3TYlhTPEiY+vTL/MS3468qVcDPRBKVCosXoiwZ0HOP
 f+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631916; x=1762236716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aS0vYK7FAdW5kWmJPk1Aw+AgekaHr8JT0J7mwxVb5Y8=;
 b=HRxwCDeb5pMmSNvrdTeW3iQdfnxp0OKBfE1VH01S6ERfmiGdTg5KFT4SjCkipsIJ8G
 4VgijhaLGE1G0BXnbJ8J09jFHHBkdaSPpxYE36A1vsxV7boVfkAwiX3agC8bIk2UCS6Y
 Kv8Nek/zuxrk2lveCImcoQ2RTkAK41Qgh5/rhCIP8enppKtUXKGjUjX+InKM9RegWO3Z
 3j0FUo6PRmKgFDKiRElmgyDwcAwwKKu6Lc74NpGgbUyiqzVr11mCrKx522vlMZmy2Q5X
 +TSBQKyQHYfNA+BiQkfwGgX7N6ahutSlH1slIUdwDXW9CqHaJwyoFA6jBpkiU6TZSXTr
 fe5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5zSiY1+uApmeUDSrx4HT0d5RknkHQfqEX97HBpfe403RRzNjA0Lkfj+tEtlwYdktwhIGx68U16w==@nongnu.org
X-Gm-Message-State: AOJu0Yw0B8MyzkC8W35UbUKFPtjZfGgsymEQawOntN8u82BcAyW/Ih0k
 +qcuW/AxE+Vk4ECRDh9m0bg8mxpeQwg0phIQexX7GaOmE9VNFsuloKiIkoYCPBJQX5k=
X-Gm-Gg: ASbGncuToEWw0K/JZfLeiONPvXmSlzisIjIkLtRDeoyu2RfcplvqTt4uj1L0Zd4HcMN
 JHXnQZHQ9Psy7UYVfFekR+sqz4l+QWLUgwYepA1hI5V+sy2gAPpdpWy77YtrJR32GmJXDvCCzfd
 dwMS+0IkNsS/2rRqdohQKMQLo+nsQN/JIppF5NXj8kaYREqEQsTSQkbZ3Fr2n0zLe85EmwwsJow
 YQJr0WtQaLInAMBmXE/F1WRZIM5Na8hLIG56MIL1IR59aXtvjVHfyj72Yt28HAeVSvPqkWV2wEn
 MjQsHhH0piX0SWWRn7wobDGoaNSfr4rSWh9WHTzoJKNBschIWHfqkKjX0bHw4zsTFGgBhjLZHkN
 gM6aEYTTNVljzt23hL2/G45EGgeQudJMvbNAwfakp/itE3gqB/8XUk3B49NA+o+ESGsYjSinvQa
 JblN44o/SgSevrAKajHeJarUva8iCsTZlhFvkF7+lyVj+a+lHWs+cX008=
X-Google-Smtp-Source: AGHT+IE72oYOMRj8XSpUowEgkmW4Z2idwqu0qjpbI2MexT3/IALEkOeQmPs1V3bK+Xmn7o1P68mtBg==
X-Received: by 2002:a05:6000:609:b0:429:8bfe:d858 with SMTP id
 ffacd0b85a97d-429a7e96e28mr1862265f8f.59.1761631915551; 
 Mon, 27 Oct 2025 23:11:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5773sm19840666f8f.27.2025.10.27.23.11.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:11:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 41/59] target/arm/hvf: Implement dirty page tracking
Date: Tue, 28 Oct 2025 06:42:17 +0100
Message-ID: <20251028054238.14949-42-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
---
v3: TARGET_PAGE_SIZE/MASK -> host page size/mask (rth)
---
 target/arm/hvf/hvf.c | 52 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index de1e8fb8a05..da2f4cf2e9c 100644
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
+                uint64_t ipa_page = ipa & qemu_real_host_page_mask();
+
+                /* TODO: Inject exception to the guest. */
+                assert(!mr->readonly);
+
+                if (memory_region_get_dirty_log_mask(mr)) {
+                    size_t page_size = qemu_real_host_page_size();
+
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
2.51.0


