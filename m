Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BB1C9EC63
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFCd-00011O-4M; Mon, 12 Jan 2026 05:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCb-0000xA-RQ
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:13 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCa-0001h3-1F
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so3493917f8f.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213870; x=1768818670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXbd4IKEO7Yjpowq+VWguY9db9jI9msI2RfrvzCs7NU=;
 b=VpFOxpviNZLGwr8rg3SM0PmDB+Vikp4WlAatwbInqU/Tx8HK+DSOG3BWMTtpHJHnOe
 8rsxXcgZXUbswughuktmbI0RQIvBtvKPkuoLU49teUisAiIuOnqtsUaLPAzKLqjoD6Bj
 vv5p5oPNhjngCuLfKZcgrwhWMXEL4NEviRuF3dWkefWuXsP5UHxoAEeFpZndLc9f4RrQ
 74Lrdz0nXiYWeUaw07JUvKanJ7BALF/VzPrTGJQlZerZ8XoTVD7e2+A2wCuXERFom9Pd
 8/9XL/8sHGAoJxQ86RlSFwIwrImGYADxCrz7soTx66pKCevwiBfz/OtQXGjFwFI9SVbJ
 mq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213870; x=1768818670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CXbd4IKEO7Yjpowq+VWguY9db9jI9msI2RfrvzCs7NU=;
 b=Wy7FizZy+sIwib+7C2d190y69J2VoQG1opp1qOLhQAWYJDmnU4t9q1WsYWRf3V1fLp
 ivMGshw+Jkcd0stbRqBKSil0J/dhWTL0Dj1RXGCnBD1QtFd8T6nx2nBmH5DPUjz6h+jp
 3U7Uu84nd5wt03T5w9kfidfbKSkKVYOSrhFnCBEwpegjFIqwgzCtn2wZ2Sz09OBZesRj
 5LIYcLVxKSWqzHsaCrWdV8Ae4Uc3ftFn6KHuaNuEVbo1h/W7A1bBlj/uXmyxvSdK+fjn
 bu9H4Z2CbmHrIFPHa2GCftfPMGhH3QtVWABL2IVQBcE1vPnUVpWz/NX17207nZmorX9C
 84lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoZ5Kdf1V8osnMp9/qU/g3nJktMsZbijL1F4ijWJE973bd3gzfksPVq+hBAu+JqTSRwVx+KwHVtg==@nongnu.org
X-Gm-Message-State: AOJu0YyYwptF6hYxpKPGGbEh/P0JMOQ9GE61lSKXmWI8llYxly7t8HSJ
 eFMze8yXx3LMJ+iw777HWutvB/Pmyd7ExDzNpU2GBBvVs7yCsEDswg60HcstKCtvZrc=
X-Gm-Gg: AY/fxX5JI6Pm/sSOsEGiYSPipvRzwsQx42XXcDBsJlAU1CufE+UOrDm4/Hg9CV5q4UE
 BmHpk08POgNDAhobayeLlBWqOXxP68qucLXpbU80GpGiMC0WXRiBj9uFb7nDVpVjT+u0/Fe/5hy
 lZdDm54cPby5to1VMj956/y+5K/tMgTnCLw+wLEXRvLsQjKgnpqBh3CjXJ2zy/gNA/V+96GGIM+
 54zj3u2BvcYohQ7/rUjjlgvIF2Ba0fq5PoB1p+4P7F4xBbiJql2ZtrKWpf2C+nobIRolq0J0U37
 OWXG213Ui/jhHJ2PLXN5H8Isq7mVt03XKtzpJ2Jj8qrRJJdOvt6w+BkIvjG5bmz3iQcGHQNsb31
 M8ReL1n1QSondYQTWvi42S7ZTT3OnMORapZtdvKYdZTuotT4yJJFYxf5l9TKfmi+LPJ3bq73lvw
 i8GYAUzQqj7QzS1IQTvt3D7slUq96BqmHiaCzq7J7iXPKcdoQYg1qUqmRE5cwV
X-Google-Smtp-Source: AGHT+IEjcypaFFeEkp9bj/xQCnQ7dKTD0qxZvP201i+RQFNCuzf0fZBezE939nGdivjjpC1gkSHxlw==
X-Received: by 2002:a05:6000:2410:b0:430:f58d:40cf with SMTP id
 ffacd0b85a97d-432c3633514mr18598022f8f.16.1768213870400; 
 Mon, 12 Jan 2026 02:31:10 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432d9610671sm20189887f8f.34.2026.01.12.02.31.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:31:09 -0800 (PST)
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
Subject: [PATCH v6 05/19] target/i386/hvf: Use address_space_translate in
 ept_emulation_fault
Date: Mon, 12 Jan 2026 11:30:19 +0100
Message-ID: <20260112103034.65310-6-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

The hvf_slot structure is a poor replacement for properly
looking up a memory region in the address space.
Use memory_region_get_dirty_log_mask instead of HVF_SLOT_LOG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/i386/hvf/hvf.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 1610000d9ca..e3e54c10bd5 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -119,9 +119,12 @@ void hvf_handle_io(CPUState *env, uint16_t port, void *buffer,
     }
 }
 
-static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
+static bool ept_emulation_fault(CPUState *cs, uint64_t gpa, uint64_t ept_qual)
 {
-    int read, write;
+    bool read, write;
+    MemoryRegion *mr;
+    hwaddr gpa_page = gpa & qemu_real_host_page_mask();
+    hwaddr xlat;
 
     /* EPT fault on an instruction fetch doesn't make sense here */
     if (ept_qual & EPT_VIOLATION_INST_FETCH) {
@@ -129,21 +132,22 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
     }
 
     /* EPT fault must be a read fault or a write fault */
-    read = ept_qual & EPT_VIOLATION_DATA_READ ? 1 : 0;
-    write = ept_qual & EPT_VIOLATION_DATA_WRITE ? 1 : 0;
-    if ((read | write) == 0) {
+    read = ept_qual & EPT_VIOLATION_DATA_READ;
+    write = ept_qual & EPT_VIOLATION_DATA_WRITE;
+    if (!read && !write) {
         return false;
     }
 
-    if (write && slot) {
-        if (slot->flags & HVF_SLOT_LOG) {
-            uintptr_t page_size = qemu_real_host_page_size();
-            intptr_t page_mask = -(intptr_t)page_size;
-            uint64_t dirty_page_start = gpa & page_mask;
+    mr = address_space_translate(cpu_get_address_space(cs, X86ASIdx_MEM),
+                                 gpa_page, &xlat, NULL, write,
+                                 MEMTXATTRS_UNSPECIFIED);
 
-            memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hvf_unprotect_dirty_range(dirty_page_start, page_size);
-        }
+    /* Handle dirty page logging for ram. */
+    if (write && memory_region_get_dirty_log_mask(mr)) {
+        uintptr_t page_size = qemu_real_host_page_size();
+
+        memory_region_set_dirty(mr, gpa_page + xlat, page_size);
+        hvf_unprotect_dirty_range(gpa_page, page_size);
     }
 
     /*
@@ -156,9 +160,6 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
         return false;
     }
 
-    if (!slot) {
-        return true;
-    }
     if (!memory_region_is_ram(slot->region) &&
         !(read && memory_region_is_romd(slot->region))) {
         return true;
@@ -765,7 +766,6 @@ static int hvf_handle_vmexit(CPUState *cpu)
     /* Need to check if MMIO or unmapped fault */
     case EXIT_REASON_EPT_FAULT:
     {
-        hvf_slot *slot;
         uint64_t gpa = rvmcs(cpu->accel->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
 
         if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
@@ -773,9 +773,8 @@ static int hvf_handle_vmexit(CPUState *cpu)
             vmx_set_nmi_blocking(cpu);
         }
 
-        slot = hvf_find_overlap_slot(gpa, 1);
         /* mmio */
-        if (ept_emulation_fault(slot, gpa, exit_qual)) {
+        if (ept_emulation_fault(cpu, gpa, exit_qual)) {
             struct x86_decode decode;
 
             hvf_load_regs(cpu);
-- 
2.52.0


