Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF74CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:54:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtt6-00067S-87; Thu, 23 Oct 2025 07:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtt4-00065H-CU
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtt2-0002eE-9v
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:46 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so4410985e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220422; x=1761825222; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAxR7mUpNjwjSajsZFGtwQMzgIfAC9EBDPwVN/5kdzk=;
 b=hP9VwXjL5QtSLAipke4qPnB8OIKei5FgSAYp7B8rlH/aCZe88RsRFqu7r1hCyBPJYa
 Bp83oLgjP7tYRBuBhRsbxqjNQ2RYg/CxWsyYQmUD18VJy/Zu+sL89PGlLgYi3oC434JC
 1qyDMbFlIve9BpFa2VPPNl1ntqc5qF1l2THOeQFOrS3UHpnIEoFSExBoxgJ6emyjlcuz
 7k8HSFy0U/xV1ZlYT1il9acpOlt67SxA0ggqdRl0c52bEUZGAE7fJRBvhucXdEK5vBPZ
 jyLdGULeZ1xLCno8KzPl7PGnVlt4hlnJ+0zDlX8tCeLjYFz0fxY09h0sXqAFppkQHMd2
 Nwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220422; x=1761825222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAxR7mUpNjwjSajsZFGtwQMzgIfAC9EBDPwVN/5kdzk=;
 b=mT7xuOibntwDwz3TVwvdltK9Yo8GLV6wWxsyUK/+FiPct2xK07B0x6YHcyAQ5x58oL
 vf0SmUMH2z1cMsZIxdBLT4tgIt0RezhhgBv6c/ZQYmAeOl/QyqszlygR4NlRjUmzNbyn
 A/DYDASnqxe/c9i3K7mjROnmMJ0s95Gf/1EB/+VkrS6EbMri2ex7aWHxkY/fkbnpEYAw
 ol56FpFBqS7ierCn12GM8WXuRWwOQYaI9OrrlDDwPjH9inEfuA7QG3eXLkmAWsSH2BEm
 SmUAXZtQaGeKNw6AbZ2WDi1rRwVUSiVtDYz4ubjctmos1Pl46O2/7L7gbgNJT+dA6R06
 hycA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXip4SpqSEXkVqxmpdjnFo7oqET+IT0qpxljo4zZ084Ki7Fz8yOI79Jtm/FqHboSVc7dOzEaQNjMg==@nongnu.org
X-Gm-Message-State: AOJu0Yw+RXyLWk8xSfVwLCxTtgnSQQFnQdnn4E4NB6EnWIik3fewlohZ
 V/j0/QzIA2nyNQ28tBgZx35TA5V3sHSBgLgEdYjdiZq+3hIlr4DsiPxuUJKAMCryNig=
X-Gm-Gg: ASbGncvQvhbVg51TKLOTzJJMSLIaWwvK37orRf+j6WRaQTjX/SmZbOL69CdMWoqhbNi
 7sNIYVnV3WrFqp8gWh0le52vUR1E49eQSPbO76i9pHsmcNLIO+v82vZWpu/EMixenvJovI8bVik
 MC5YXTi6+eNVd7bnHi5Qx1Mdu6bgmsNoMpCl6BQtxwk6oYYlihwXAKvZy4xLuiaqz8JXkf6IR5M
 MDPyTweONhjOwfIMoaa6P4nRyYZeaCtF1XV21xseLR/UKZP9tjyOFmckZOy1tZSz85GfGeqDzfO
 4i77OGUQwLYZmdJeEqvLqbTraBjqZeVk9SzDhKv4IkwHXaVivCKt3qUXUdFk5GjliFO9BXBsj2o
 pVD7sXJ7VRXaNOW0wNhq0bg3ohEUJoihYrgC0Ux2gbRXfTnXoDlghAS4BSrsIoeBLc6ZFVdK2BA
 nsMBlIqs+3qJo9CvyJ8TVfcrPw/phGDb4qzLEtL5W6YXvdTD+m9w==
X-Google-Smtp-Source: AGHT+IE2qeF/JXnAb8/QMIGST/cg5fHI5kD1OiBmI18xcMweO45BIvrynKS+h0d7N0RRheTfHzR33w==
X-Received: by 2002:a05:600c:a4e:b0:46e:711c:efeb with SMTP id
 5b1f17b1804b1-475cb02f5b9mr14221605e9.25.1761220422542; 
 Thu, 23 Oct 2025 04:53:42 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428f709sm94694775e9.8.2025.10.23.04.53.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:53:42 -0700 (PDT)
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
Subject: [PATCH v2 36/58] target/i386/hvf: Use address_space_translate in
 ept_emulation_fault
Date: Thu, 23 Oct 2025 13:52:47 +0200
Message-ID: <20251023115311.6944-7-philmd@linaro.org>
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

The hvf_slot structure is a poor replacement for properly
looking up a memory region in the address space.
Use memory_region_get_dirty_log_mask instead of HVF_SLOT_LOG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index aae4877d568..4597d191f9d 100644
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
+    hwaddr gpa_page = gpa & TARGET_PAGE_MASK;
+    hwaddr xlat;
 
     /* EPT fault on an instruction fetch doesn't make sense here */
     if (ept_qual & EPT_VIOLATION_INST_FETCH) {
@@ -129,18 +132,20 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
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
-            uint64_t dirty_page_start = gpa & ~(TARGET_PAGE_SIZE - 1u);
-            memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hvf_unprotect_dirty_range(dirty_page_start, TARGET_PAGE_SIZE);
-        }
+    mr = address_space_translate(cpu_get_address_space(cs, X86ASIdx_MEM),
+                                 gpa_page, &xlat, NULL, write,
+                                 MEMTXATTRS_UNSPECIFIED);
+
+    /* Handle dirty page logging for ram. */
+    if (write && memory_region_get_dirty_log_mask(mr)) {
+        memory_region_set_dirty(mr, gpa_page + xlat, TARGET_PAGE_SIZE);
+        hvf_unprotect_dirty_range(gpa_page, TARGET_PAGE_SIZE);
     }
 
     /*
@@ -153,9 +158,6 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
         return false;
     }
 
-    if (!slot) {
-        return true;
-    }
     if (!memory_region_is_ram(slot->region) &&
         !(read && memory_region_is_romd(slot->region))) {
         return true;
@@ -761,7 +763,6 @@ static int hvf_handle_vmexit(CPUState *cpu)
     /* Need to check if MMIO or unmapped fault */
     case EXIT_REASON_EPT_FAULT:
     {
-        hvf_slot *slot;
         uint64_t gpa = rvmcs(cpu->accel->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
 
         if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
@@ -769,9 +770,8 @@ static int hvf_handle_vmexit(CPUState *cpu)
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


