Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3C8CEACC9
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:11:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK08b-0008DN-Ci; Fri, 14 Nov 2025 15:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK027-0006cP-JU
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK025-0004iq-Ji
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so17352345e9.0
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150672; x=1763755472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rAlH1/lu+rh7awee2lje3uE1FvJDSXtcSFDkovTFo0=;
 b=uwKliTfoZ/O9qq1VHbrRh8PevPDw/tno82ytxbDDG9hv/XcTxwLPsKIlom4jlDeN+6
 xWG4WXKmM73kZIu1JBWMf1PYaUL/OQ2PLpbOEK+xLu/CzJfHoSnLQvQf3/tmRe0v19Mg
 Eywm6LJefdWBaEEtL901Ctps2QGUiVKG8nKsxbEP1ZGS0jnlsk9uP3mGGMJyyhzRyNn+
 mYm3qfhXWt9iggegyf5KQzJ9icuj4f7NmBToX1Deh9Au+KmTcl9ZdFVg3KRrhzxltj/k
 gtzt9tpyY9isE+a2kqkvXah+PcnGYgkFyyfN3ae6dNAuKD2SvwbqlRhrEU5jJWqiRGzQ
 1vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150672; x=1763755472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5rAlH1/lu+rh7awee2lje3uE1FvJDSXtcSFDkovTFo0=;
 b=hfuGgXsKYF1ku7yiJd93B4emP/3mTQ2CXtMSaO/if60DzYvKXRSXHsXCCwTpDcxkyx
 evCrdl4XhK/vIJymdgQgwfFW4ByzggxZDP/W7R0OiXhQQby0j/fBebqEl4nZs/aVy927
 xLgX7m20668wwy40QJ/OMvNtZviBRsPfFJBlRq7eFHF41+fYg946fxcY/JHX+bOxBO48
 nua8Na6PK1CQa5lGsyOVjxG9U68uvJzkVx7XWTDnbN03owQVNRHLc1e+gVg+dQerr1hh
 XAyiiQtAXnIm7NEMP3d1u8VT4woK9n16jvmwT13F3IQgf8ZF/nWxLTK6Ga2tJQplcBwl
 vxKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyj1vq4LjFb2z7XXzSWnrndJsTN4nGghhChRbJ4JIBI0ZWY+DjccSUQHjIjmEMeKJLb5UsWGqcqg==@nongnu.org
X-Gm-Message-State: AOJu0YxDAtTuXm3SXyZCt8n8eb+n37s5lEK54jn/T6e7Ersu0b57lo6E
 MF5DJCzA6Sf41rR9gFFEmrVKwXZojTCF3ptZLvJJ6WbMGh1yPe6vT9qtnYu5Iy+3Pg4=
X-Gm-Gg: ASbGncuxm/GwQ+QWJuQFVg/ayd4xWyOlku2YJL2vePHkqOTn/TCQpsZXHgJiRugGw1X
 q2ank0DWn8JC4vhrWoBvikN0uqvmXLi9Y4GrvthugS88cwkeVIucOMv5mHvBnogNKsY+y2BwRT7
 ROnyp8Jp3g6N/gEhhMdaMgs74AubjuyO6O4TfD372uoilugqqzBZzt/CWkIfxzt/j/pVMqprJdD
 B6Nc9DqTuFxIr4oFEgdWP7Dg4WUX9uOmMfXPl5i9JLGAYCe8BOURWGZFsuPuz2gpZfCmihmPmc8
 Tg6qFDVuG/RUPhqFrhxGyr6sVo+XWUJThps4VVHByKt2/pRPPRGJ5meJ3JK9L18ajJFGRd7JBMM
 /3imTcN+yo2lsrYMOBTFpD71MSYcNYK8TG8n8fiFc3dPlxB0mq23RcjdawdQrN+qVJZg0QF87GN
 BJojSkcIzx4g7bkJ1TtbDN/TorscvVnDIN6/Ch+wp2J3oRsDM+Zw==
X-Google-Smtp-Source: AGHT+IE/Peslf1OXX9yKIDVEJMqIQIkwdLX98UYwlr0AHuUTIL7K5CwpTaK3typJs5/qi3Zg0EQ4UQ==
X-Received: by 2002:a05:600c:c4ab:b0:477:8b2e:aa7d with SMTP id
 5b1f17b1804b1-4778feaf8e6mr45412785e9.30.1763150672037; 
 Fri, 14 Nov 2025 12:04:32 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779527235esm26904815e9.8.2025.11.14.12.04.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:04:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 01/19] accel/hvf: Create hvf_protect_clean_range,
 hvf_unprotect_dirty_range
Date: Fri, 14 Nov 2025 21:04:03 +0100
Message-ID: <20251114200422.4280-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h |  3 +++
 accel/hvf/hvf-all.c      | 25 +++++++++++++++++++++++++
 accel/hvf/trace-events   |  1 +
 3 files changed, 29 insertions(+)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 3d2be4092ef..5a57691885f 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -89,6 +89,9 @@ int hvf_arch_get_registers(CPUState *);
 /* Must be called by the owning thread */
 void hvf_arch_update_guest_debug(CPUState *cpu);
 
+void hvf_protect_clean_range(hwaddr addr, size_t size);
+void hvf_unprotect_dirty_range(hwaddr addr, size_t size);
+
 struct hvf_sw_breakpoint {
     vaddr pc;
     vaddr saved_insn;
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 0a4b498e836..e13abddbd9c 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -58,6 +58,31 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
     abort();
 }
 
+static void do_hv_vm_protect(hwaddr start, size_t size,
+                             hv_memory_flags_t flags)
+{
+    hv_return_t ret;
+
+    trace_hvf_vm_protect(start, size, flags,
+                         flags & HV_MEMORY_READ  ? 'R' : '-',
+                         flags & HV_MEMORY_WRITE ? 'W' : '-',
+                         flags & HV_MEMORY_EXEC  ? 'X' : '-');
+
+    ret = hv_vm_protect(start, size, flags);
+    assert_hvf_ok(ret);
+}
+
+void hvf_protect_clean_range(hwaddr addr, size_t size)
+{
+    do_hv_vm_protect(addr, size, HV_MEMORY_READ | HV_MEMORY_EXEC);
+}
+
+void hvf_unprotect_dirty_range(hwaddr addr, size_t size)
+{
+    do_hv_vm_protect(addr, size,
+                     HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+}
+
 static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
 {
     struct mac_slot *macslot;
diff --git a/accel/hvf/trace-events b/accel/hvf/trace-events
index 2fd3e127c74..f989da59492 100644
--- a/accel/hvf/trace-events
+++ b/accel/hvf/trace-events
@@ -5,3 +5,4 @@
 # hvf-accel-ops.c
 hvf_vm_map(uint64_t paddr, uint64_t size, void *vaddr, uint8_t flags, const char r, const char w, const char e) "paddr:0x%016"PRIx64" size:0x%08"PRIx64" vaddr:%p flags:0x%02x/%c%c%c"
 hvf_vm_unmap(uint64_t paddr, uint64_t size) "paddr:0x%016"PRIx64" size:0x%08"PRIx64
+hvf_vm_protect(uint64_t paddr, size_t size, uint8_t flags, const char r, const char w, const char e) "paddr:0x%016"PRIx64" size:0x%08zx flags:0x%02x/%c%c%c"
-- 
2.51.0


