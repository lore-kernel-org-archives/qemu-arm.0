Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B968C9EC68
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:31:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFCW-0000iz-NR; Mon, 12 Jan 2026 05:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCA-0000Nd-En
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:30:57 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFC8-0001cu-GV
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:30:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so43740015e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213843; x=1768818643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=coZfcJZ/6iboNtDXNLPBr0JOWH2iJ2AVZq4q6R/3X9c=;
 b=B5Uq/XKgBXwL/sBBXdXCkGEaJWr2VWFREz3K7s0lSODnaS0ekOMUB5Ca5jaEd2Q+2d
 +MAxQEmdkY5cuNJA9KdUZoZzH81Wn+AbEcVkY3kWP2sCffMLfiMsvhbrkJfg5qNhjTbG
 CRQQTBggrEmlxEFvkOSppb5+ydYjcoI2bQhwommWWPSnj8gwBpE6UxZ/enPV6ww6v5et
 aikcns2kSOYqfvVK6N6cxqJDkQKrlMdO2DnCaIWY0529UfbUSkpxAv51xgr/9HCxpbkp
 PDANgaHexjS6RkijY1dU2apeJdDZU/IR+Gf/GqYedVKSUohhOjo2sjvAUFw2x2QCHFMC
 rWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213843; x=1768818643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=coZfcJZ/6iboNtDXNLPBr0JOWH2iJ2AVZq4q6R/3X9c=;
 b=G4O9Lko1E9fnV8fLnitNO+9XsByIUEDmmtWBwOn8JV7VikRCf5TI2ZpMjSWOco4oG6
 JTneT22eeeIpmpFkBdZn1LnIHrZNPDMRpaBdsVBmonysahhjyfABG89iFrIImkfx9M1A
 vy9GYQICLaPNXSbIXJUhFzL21F5+HyhfWYo0CKBxrLJx1iYsyrCWilHsIFqn9UKkfA/9
 zYmFkQyM2xBYQiC0DlqXEr0f9dk2Bt5BaMa13ozkdZSEYBLUk68lN/HjrSUKQ00VP7el
 aYCfYL/+Sv6jxMFvgIU9tOOnTwiOHSJWbrqSCRQSPjsa10/3ChkE94L0zlYhIpJbokwt
 8NXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjQPYN+/JXo0PiekNzPzx/dGKuesL/8rrsiVR1m3N6Ac8GNeEzTgE2/2PuWz7vsVDA2OWy3UXX8w==@nongnu.org
X-Gm-Message-State: AOJu0Yx+FGet31a+7krSJuixmr4Caz//AiKzbru//Sukoso9mrStvvB1
 HicEvzywnROtOkO4ZttJ3Ts78rgbmJi8baMXMnW6XnATtzuUYPGEvHhJVRjI//38abc=
X-Gm-Gg: AY/fxX4UNP2GatgXd+XMVbCY6iGTdDqUIdnNnCaR0LTEJBsrZ9KsNxgcXXBHIuI2IzF
 FASF4LrJ7hYoCwLxRWYzL4Rz1whbMjZ6Oen78P1oXEAf8U1C8qK9QPIjMc96i6Znq2j/CigeQfr
 AIUsKTgKxqk3rbmRuIvYNorVVS5ZhIGOPrGSlICkdWCuTPRYwUIdLx8c8VFoi4BNb2PsRXgEcLF
 Oa/M/3Bm2yMD2tP3DaKAMc0k4fl7Dsk3W9+FkJWaVNjgZSQEBKu9krNsvPT25c5GNbx/ZT5sGFP
 0hB7pKw+jPOTS+ZyC0BG3MufXthD2c6JxkHs0no04DeAHicGP1vEfISjILeAmTVzs+2Ec5s3w+R
 xIDRrPxm+p6VQ1eAElFIIvMnSH5XQ7GbfQzyB5G/NlAE0g8oFAl5O42vVZeu8NN3F7R1TFO/pYr
 nvN/58+EW4v++yRutl6xK4LHY4b6DZtR4gzPbPp6B2db5C+LuQcUb67LyvVTw1
X-Google-Smtp-Source: AGHT+IEswK740VpVL/UCsNp9N9yljG87McVTz3t8hqlQTwOPwB43DhhJOUwSmmg+RrCcQ62s0LuFrQ==
X-Received: by 2002:a05:600c:3152:b0:47a:940a:c972 with SMTP id
 5b1f17b1804b1-47d84b18752mr191302105e9.4.1768213843127; 
 Mon, 12 Jan 2026 02:30:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f65d9f0sm356986665e9.12.2026.01.12.02.30.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:30:42 -0800 (PST)
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
Subject: [PATCH v6 01/19] accel/hvf: Create hvf_protect_clean_range,
 hvf_unprotect_dirty_range
Date: Mon, 12 Jan 2026 11:30:15 +0100
Message-ID: <20260112103034.65310-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
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
index 77f4e4e4f30..741b4bdc4fb 100644
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
2.52.0


