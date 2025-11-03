Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5025CCCFA06
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrX0-0002uu-Ra; Mon, 03 Nov 2025 05:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrWy-0002uX-SV
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:11:20 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrWn-0002Mr-W8
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:11:20 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so37550335e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164665; x=1762769465; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rAlH1/lu+rh7awee2lje3uE1FvJDSXtcSFDkovTFo0=;
 b=W9Z6f/WFLSs1dKubvM7c7XENY0XLmGLj6HJYLAbCHwjzu3/bNpJRH8luXTACSlaciD
 1n4hEUnqDvayfJ0iZVxIg3rhk8+xExNYYqZIJGVxN9d2l9bE2qQQ4df+y3+kw944uRlp
 fTVc77u/+ropXR42E37vnGLt+F5GI5KMONql5Mz0t1vGLtX1fCv2HJTwNaOzRLOZ8cot
 H7ExkWrPW4R/bIoUDPD/RLJY0UsGbbD/Z3Xg+pg+54io3qZZwQii8zc2sEl4f5/U0YEC
 BqIAn/4KR2RUNT8AuCjuP2m1x+7f/Ha3SNufZuUo8pD/Bnvs4Lu3ZJ8AoskUqHutXizm
 xY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164665; x=1762769465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rAlH1/lu+rh7awee2lje3uE1FvJDSXtcSFDkovTFo0=;
 b=isFTVms4E8UsjsN3Fx8Yb3SetYQyOFab5trYse70Z1ogxEWZyDL8Uf1Ll2qNgBlCQE
 zheoYG8Sv4YecETSSPp7iX42kl66IpAsvXnQ0Bsv5HcvunJ5gSmuRCBT9MuOVwnFYQuR
 BN5psKo3EKr1NyRtOKoCnetbzCwCS4TLc5qxZG63zaxv8agAtXvGZeNRwPomBe2Ky3D7
 sYfSmf3EuCKhb9L7FS+j9fr6D/4Z0FWCUVHtzSAmGzmjOTwCgCWNY2RbYXZUnEHDiQAL
 lPsWOSTh1bt0FwANRTT+6qZ+3iAAkdKW6qaJdaD+leD0G9EgZOpiklhjtf+M5iXbpQZz
 9elw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl2sxOHkCJjGOQMeyOb5fNMxsbKvAzq6utq1ILbBIha16zJwOWqOqqoTcoVLn3psVAVubX7bOGpA==@nongnu.org
X-Gm-Message-State: AOJu0YwLlGGT+E84fADzQ2uD0uAtxDLyKFHFjZyQtg1jJqqiBKlk4fsu
 +T28IWchg+IHaRMgJAcrt1wDoFoZgNM14N3TzfvSwTgvhJUVL8M6uiLC5Q1DafpYllQ=
X-Gm-Gg: ASbGncuwkmEoqCTp3pY8nnccE+33IgEsBmJNY0MtdhOwahQsfLy+kbkrOgwuO+r7l2C
 JxoZgBM0ajiH02StjW/FyBilw2sMLzm2vyeoHpa0oPYUIBbeIcOaj1/K5804USSwiWQvgEY4cWH
 hP4uBW556oLfJa0zrAT4huM/xq8skebUVtBJh512fJqzP515imvXNkMRP24Bz/jGny5nnjFN6Rd
 smqycK4u4O1cMLKBhXhYZwOV7oIbbK/B40NEeUXJH0r+LyJshXtsKUh0VxUPR5BabA6a+f/xngp
 vmIEeWl17ZKtJD8ll5VWlx4uYkqwy1j04I+mFaVNDHIca1IGMP+1DFOeyNY/WhLql0oipOUrPCE
 Pxd74J3xWdZTlCjFpbZM41yZwXrSLcvbFP4UMoXMsNcj4FQQAuH0pNC45nkR8gELz+SVRlraqd/
 eybZj0w8nJ+ucPgeSo96f/hjv6lKULwzkK3/MW8m81/aDxjvE46chvtyg2S/jcwDnB6s1W3Q==
X-Google-Smtp-Source: AGHT+IHs/P5YscPj+tiHtkpPgXXoxry5aWicGkm7sN3Y5SjwmybunJib5OIWFCd+Nq4DsHykxWj25Q==
X-Received: by 2002:a05:600c:1553:b0:471:16e5:6d7a with SMTP id
 5b1f17b1804b1-477307ba7d2mr101696115e9.13.1762164665037; 
 Mon, 03 Nov 2025 02:11:05 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c2ff714sm145460205e9.8.2025.11.03.02.11.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:11:04 -0800 (PST)
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
Subject: [PATCH v4 01/23] accel/hvf: Create hvf_protect_clean_range,
 hvf_unprotect_dirty_range
Date: Mon,  3 Nov 2025 11:10:10 +0100
Message-ID: <20251103101034.59039-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


