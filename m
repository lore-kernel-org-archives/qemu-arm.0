Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A308ACCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBttd-0006tt-ON; Thu, 23 Oct 2025 07:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBttO-0006g8-0Z
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:54:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBttM-0002gU-5n
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:54:05 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47114a40161so7117675e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220442; x=1761825242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vLxjW3kGnAkcgz1GaQCATP0ZMz267FP3u+/JVs3d3vU=;
 b=xdVCJNAeI7WAKLJpuZ4vJadz8jAGNT6KBRd2BYeCV3w8EMtSLgVla7isw+vEvDJ7gt
 pf+Q/lDDsdW5DJsfbNgbeCBXpwFeOqWOtNDutMKRkrOnFVzfLsmf3ySVCLeXf3uV2cEC
 AWurrB6Cxk1K6zixqGNDGPxQJj+dFAquhVqXGkKcJ5d3GYx03sPibGW+AbPruGQLnUwd
 VDsOZLkKUYIiWmiowkEy0BqZQv0gIm14PojG0QkPUEsABMTYHEpf+fpR+9G0Vm1dF+j7
 Uvk+Cc6PxkhMnkahdpiJO9w5Nf0mcGWhy9cYZlYmlwC0SxekaTXTjDQ5YTyV9zemHOJB
 lC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220442; x=1761825242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vLxjW3kGnAkcgz1GaQCATP0ZMz267FP3u+/JVs3d3vU=;
 b=k3OeGYLx5ftOup4uXof7EiFpwXP9RnW9Qkhqi539PYkA8S6UR558SxfJNAzNNTlzrX
 suqCK8OVB02/6PXLH0KV5Am+5IsjJmKxm2w/4/bcP48o13gqLlzkOBTPl1Hrow4lO3SX
 iROvu/RH2VewnlLzS/ixkewEaxErRMNPuDYFkGHj310lV+vIIt/ZtykMQpaHPXlqnKym
 dwCX9CR6OyQQVoZyqGUKqeTIZs1xcbWdeGfrdvyCcfzRwelg5soSXzYhGaVuM8ZBkBY4
 bXetS2PHe/n7nz/32lZAzopQe5P8fGbXi3ltJV5efOPi33ukVNM0qD15K8iwaLiyIhHT
 3b6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVXyZQs8YoCpULbRGqUG8RXkdCAKvSNWRZ1tr2qdaWS5WRVKlTiPIfYPkmDBZ1fLaeHWgw+UVR7Q==@nongnu.org
X-Gm-Message-State: AOJu0YyF/DP/FEd1h5is5FlMvojfXe/KVaLOlrLTZ4+WdvumIaEftxGN
 uMPRiKDZXd5UsKnYa+6CVtepfxPtagA83o5gXUima/GxAb5dE0ohVZ4TiAfSflfcvnI=
X-Gm-Gg: ASbGncsBXSzkq/6oNyjT4AhCgKoSqITpq5vKELGlJQkck63VS5HNLa0ZMz/0qCIp3eP
 9mbKJdK1JbT+CvAWL6P/6ajFF1fBdsNLfOr3okARUmjT5Mo5SU/g0lVI5cnSsZcpy8H8uKM0KGn
 +aIWJdMgyQYYAbYnNIMrYfQSFc7dTJZ9zVKfANxt+vIgLVHh3UG3sr6/MDywsKg3hCvntM3IBgg
 Vu98yP/SQDGYcluD80DFzR6WLOOP2nXBKY1RON0kWs006efQFoXr7R+r1s5AfAkj3ehMnay5FYj
 3Grxi7to4X7YfXlci1RSE8YcZaJpQzFTF0a5ydl1ThGtHU+zlJ6PVecOF7q254jPGktxrAyI96L
 zMdvGjCgFmNyVjmR5PNJ0HfgN8hB/RfeNWDj1bTpY9li59oz6iWqGoKD8p2V+kAy5pCIRmN9XJB
 3QkK0VOJBtsVPrc4Gy5fSBKZCPhrlNhQvBeYCQYafFkoZQ/yGsYaoCJL2MtIdr
X-Google-Smtp-Source: AGHT+IGY16BhHQsHiZOVCn3Tj+DCOd/FlYhKEtMNlajydXKGb3mFmPJVbPfE23y/uVEYjLK3mU+zjw==
X-Received: by 2002:a05:600c:354a:b0:46e:59bd:f7d3 with SMTP id
 5b1f17b1804b1-47117903f24mr160650345e9.20.1761220442544; 
 Thu, 23 Oct 2025 04:54:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494ae5510sm58251365e9.3.2025.10.23.04.54.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:54:02 -0700 (PDT)
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
Subject: [PATCH v2 40/58] accel/hvf: Drop hvf_slot and hvf_find_overlap_slot
Date: Thu, 23 Oct 2025 13:52:51 +0200
Message-ID: <20251023115311.6944-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

These are now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h  | 13 -------------
 accel/hvf/hvf-accel-ops.c | 14 --------------
 2 files changed, 27 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index ee7ab689f45..d842d4b2b99 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -24,15 +24,6 @@ typedef hv_vcpu_t hvf_vcpuid;
 typedef hv_vcpuid_t hvf_vcpuid;
 #endif
 
-typedef struct hvf_slot {
-    uint64_t start;
-    uint64_t size;
-    uint8_t *mem;
-    int slot_id;
-    uint32_t flags;
-    MemoryRegion *region;
-} hvf_slot;
-
 typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_pinbased;
     uint64_t vmx_cap_procbased;
@@ -45,9 +36,6 @@ typedef struct hvf_vcpu_caps {
 struct HVFState {
     AccelState parent_obj;
 
-    hvf_slot slots[32];
-    int num_slots;
-
     hvf_vcpu_caps *hvf_caps;
     uint64_t vtimer_offset;
     QTAILQ_HEAD(, hvf_sw_breakpoint) hvf_sw_breakpoints;
@@ -70,7 +58,6 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
 const char *hvf_return_string(hv_return_t ret);
 int hvf_arch_init(void);
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
-hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
 /* Must be called by the owning thread */
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 3e5feecd8a7..bbb0b385fe9 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -64,20 +64,6 @@ HVFState *hvf_state;
 
 /* Memory slots */
 
-hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
-{
-    hvf_slot *slot;
-    int x;
-    for (x = 0; x < hvf_state->num_slots; ++x) {
-        slot = &hvf_state->slots[x];
-        if (slot->size && start < (slot->start + slot->size) &&
-            (start + size) > slot->start) {
-            return slot;
-        }
-    }
-    return NULL;
-}
-
 static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
     if (!cpu->vcpu_dirty) {
-- 
2.51.0


