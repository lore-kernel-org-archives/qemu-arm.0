Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F6BCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcs5-0006p1-4L; Tue, 28 Oct 2025 02:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcs2-0006kP-7R
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:07:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcrv-00067t-1T
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:07:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47710acf715so10049365e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631661; x=1762236461; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsgMJlyY8TVXlqW6r595TkCwLDrrP0zYcTa4NqDCmPE=;
 b=R6hc3Lys9H7VY5Vc+EIwCAmL7yN3oHu30iJ54wCA/yCDFoCxIEqDvgfYtLFiBPyekE
 sfnMMdVq7wPGHNHX0Cs9b/V2+I4/4PMW/mSV36V+qSPYKjrsLSLXpK7ay5Qb/NOqErVS
 CtLQ+zppedXGmzniWftropsYCy3dOFV/vPL5p8j4bak3027G8pc8PTkxMqVfx7zndkCA
 GtDzLAy8DGsXVQDe2p6wBCLU/Gyuv//7S/gFQ+iVcyGRBR4C3ePQ7m55E7zh3Y0eSoZU
 GzWjrrQvwDC1s4J/G+tPhCiRBViY3AzrYHBz6XrE4oz03TvVofNH2aZxOx2bHj4nJDS2
 DwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631661; x=1762236461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsgMJlyY8TVXlqW6r595TkCwLDrrP0zYcTa4NqDCmPE=;
 b=V6gsGcV/HxgYSNpkvBj1ua+comjONYW3cpZ5aFrttBVPg8+hU+x+zyRZBUmhGq2jJu
 8MHmAejnnkcytnHiOwprEsBPnCgN3cQut5XO2uQ/hKXSArdAeAA3kg8u3DKolzndt+Ez
 dLJu91NSE3ijY2vPSzZ68UAYPSCkWHINrGcGAGjUBZTHuHvwqeSNbRsNB3rcaOqkRhm+
 Ef6wLxC27V06qQpN+FSH12Rl2aGaMghTYG+dnWsvAq+QUUpuXMVpLgXv75pQCubFK1rG
 aIfaMJT3CLuN/PyYUYXAOSKALq8pvhPEoWCndnfCfz6TZ4qtmbiR1JrVSjE8SXFHwVXa
 2oNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkOZk7QZaVe0Zpfrfdj6bNV+fbec2gN13BbFfKkjmeY6/NK2ThJaT30Suj5VW6/58zO2HWkXX1KA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9WKo46JNq2RxqniR1QmS1bK338BLuCAgRr0QHzZ7+034atwW9
 4DLrq3tkbY6jmUdni7QLyCa58hHb5ocjPJWRn0Ou3YYShjUd9W5ntqCHBhloO8kUQn4=
X-Gm-Gg: ASbGncsWxF3gRY88uqsRUDxBs6VHWekrQe6fTfUGSRQ53B8QDiF6hCfhm8z2roKY0XA
 4s/6PHK0+Nq2M3tQr88Sh1hqzA+VN+VbT1kyEd9ciPdcFMaCJ+K0tkW8dKsbHisAR+L6GA2/b8z
 0u76pktR/kXOis9QoRnACl/wfLGV5pXsFsukR4OLlMZ0FpE4nLC/9Pui7M/W8blRWxxDB++ozOb
 8Qh2FUOBQtSPh5f1ugkGY9KgQ1OkBPDHBAo5bS7sEjm1jkQ/zqYjMu+mwoo4lYQpNXrXu6F67jh
 b+FAX8NTA2OYYckTZZq4JoL7jzb1jrOsEWDyd2Qc9NVv4nksSQaJjxPOgjXRwwD5J7lajxkfaWv
 j7b67PJ0VjZoMRY6tacQCU4ZWh2ET9was8ypIbbkeYH/bQ4VTY9jiZC5zNFrgr6MhxmmSbFcYV9
 ehYx85PzHBgi+jxnZT0aVsxoLl7os466f17OiwmSSFzpHIS9DpVg6xZac=
X-Google-Smtp-Source: AGHT+IGhl9TK/X6SnHE2Fq/7y/NKLCGxWqQwm7XWauEgZs0GNMncNbQDU2SW/v3QjzZKy30/+RE5YQ==
X-Received: by 2002:a05:6000:2410:b0:426:ec63:18fc with SMTP id
 ffacd0b85a97d-429a7e59d99mr1792143f8f.20.1761631660980; 
 Mon, 27 Oct 2025 23:07:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da12dsm18532200f8f.29.2025.10.27.23.07.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:07:39 -0700 (PDT)
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
Subject: [PATCH v3 35/59] target/i386/hvf: Use address_space_translate in
 ept_emulation_fault
Date: Tue, 28 Oct 2025 06:42:11 +0100
Message-ID: <20251028054238.14949-36-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
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

The hvf_slot structure is a poor replacement for properly
looking up a memory region in the address space.
Use memory_region_get_dirty_log_mask instead of HVF_SLOT_LOG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 1e92e9b707b..b0c3fb97864 100644
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
@@ -129,19 +132,22 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
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
-            uint64_t dirty_page_start = gpa & qemu_real_host_page_mask();
-            memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hvf_unprotect_dirty_range(dirty_page_start,
-                                      qemu_real_host_page_size());
-        }
+    mr = address_space_translate(cpu_get_address_space(cs, X86ASIdx_MEM),
+                                 gpa_page, &xlat, NULL, write,
+                                 MEMTXATTRS_UNSPECIFIED);
+
+    /* Handle dirty page logging for ram. */
+    if (write && memory_region_get_dirty_log_mask(mr)) {
+        size_t page_size = qemu_real_host_page_size();
+
+        memory_region_set_dirty(mr, gpa_page + xlat, page_size);
+        hvf_unprotect_dirty_range(gpa_page, page_size);
     }
 
     /*
@@ -154,9 +160,6 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
         return false;
     }
 
-    if (!slot) {
-        return true;
-    }
     if (!memory_region_is_ram(slot->region) &&
         !(read && memory_region_is_romd(slot->region))) {
         return true;
@@ -762,7 +765,6 @@ static int hvf_handle_vmexit(CPUState *cpu)
     /* Need to check if MMIO or unmapped fault */
     case EXIT_REASON_EPT_FAULT:
     {
-        hvf_slot *slot;
         uint64_t gpa = rvmcs(cpu->accel->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
 
         if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
@@ -770,9 +772,8 @@ static int hvf_handle_vmexit(CPUState *cpu)
             vmx_set_nmi_blocking(cpu);
         }
 
-        slot = hvf_find_overlap_slot(gpa, 1);
         /* mmio */
-        if (ept_emulation_fault(slot, gpa, exit_qual)) {
+        if (ept_emulation_fault(cpu, gpa, exit_qual)) {
             struct x86_decode decode;
 
             hvf_load_regs(cpu);
-- 
2.51.0


