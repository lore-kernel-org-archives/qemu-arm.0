Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D5CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:17:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDd0v-0007bA-TV; Tue, 28 Oct 2025 02:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd0t-0007ZR-DJ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:16:59 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd0r-0007Fe-Ez
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:16:59 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475dab5a5acso18602425e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632215; x=1762237015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxV/2r9+8lCPChHU0lOXZfa15B9thwum86CBvfFa9fY=;
 b=D2V+LU5DTRDASeyJkUafW2xc/NHDd4r9my4+31wTqP7NMuxNON8JZA/DYKFF4/ewVU
 wbj/TcdXTm4rhIr2j9V4Sj1NtvcJcpaE5LiqvKBbAt1ks17hcTVKwAh07X3dP67A4Gmw
 t330un/SZmN/q+q1f785PZ226pWGyfyXJMmYFd6ICVywqlAJQDfvKpD5sq/Aey9zVQ/n
 moo2oIDaOQ1GPRvtUSigDLC7BJIeGx6D0LSnX24EXglRXZvd1W/2A9WoXow4AVXYaSD5
 uq7dj0W1epgK5OucGZyeQ4oPTuExGiO5Tw71vm+x7Xe4UvP1MXd12uDvvbQ873wDjr1w
 n5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632215; x=1762237015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxV/2r9+8lCPChHU0lOXZfa15B9thwum86CBvfFa9fY=;
 b=xBQnoydMc3vazZFSdYcX32P6AGs5GJHlWKmnVa9vSbIy1nbjizYyXQEyxBOfRftHJp
 ue4aGXBSALwITAJtgbBe0rnH/NFiLykA3ucl3JkmuVkbNNvXdHFE7gRPz4Gw+QuUdHWd
 zHJoCC4HUV5gn2uDj9hX24LdZq26PSuYpYeIt8C7Icq4otBz31C3Zo9X/hsVToHljjJb
 zdyZGUDTMNBW7MGKhQpfPeFzOI7uhE5p4Rlo6DxTtZC4R+8rpQiYFRM7tQt3FH7weL3/
 NnpAhd6nRt2tWO9IFFJTf8cTNrIG/L/rpyoynh2YQ2Spx1UVxK2FuHTPQkSOt7zbNavV
 JvVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9THwcS/uoGAj9YavihKBjszytPPpFvAV+2bmRtovuAL6OqrlMNPUQqW54/IAAj4PSsLriRwlxcQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx3G9xFlz7x4gyfmE9QupF0qe02h6aD+9CnyXqIuGa0yJj6T0kc
 VWbbZt7pOTulpRNXfeXHr+GcJ18AaSEFmBMgex7k4grHQc0ZmbHYp/AL+EytiRXJCfXGs3EwPjQ
 4SKeKJxU=
X-Gm-Gg: ASbGncvISSUzokHWBEJT3tHENHH6rWODj0w02/ec1HPamjsjWNG01PgStQOoNSJfASX
 WcM2Qky7pQWvh3WGK8UlUQJ/u4m+6mQrG9uG5TRd6RM8GIciwFwsJDBNQmlhICnTpraStVc1jgp
 G8rKGEuNsDIFoPvRoGpsvtSPQ5CqFLrDTXZ/q333ip/WsKc5X338sz6bIskflCDfgggjBftYW9w
 iaGxd/GFjJl/OgiLcNXAG6eaQPp0P0+LAtFonrLRqh88ODX0YR2NpJPLS/JbuCu43yueQO1xk5n
 wkOdaMQrhheA1pnq2PShwizt22wIKXTn5tj8URfMhcbkN1sJtR8ixtIFUnnB8E3zLmjJefirzQZ
 dvJ1Rt2Qno/ct7bkrqKNF3SguXpPSV1tts2Kbpmw7Ar07/Vi1Lv3Nfx8g7YkfJPJx1nQQxMLbIm
 kW1tWDYrk2XvBvuVVdKPFUaapunpzC8wRDnplAIi5EQtfPmcXHDUA+9Pk=
X-Google-Smtp-Source: AGHT+IF1T3+EqgBz79aC6U9v/dDOF9H/syKTBguPltH3qws8/5CkahRPoBI6+cdDzT6gyea0Nn4VRw==
X-Received: by 2002:a05:600c:3b23:b0:46e:376c:b1f0 with SMTP id
 5b1f17b1804b1-47717deeb98mr16406715e9.7.1761632215560; 
 Mon, 27 Oct 2025 23:16:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df3c7sm18048239f8f.40.2025.10.27.23.16.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:16:55 -0700 (PDT)
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
Subject: [PATCH v3 48/59] target/arm/hvf: Really set Generic Timer counter
 frequency
Date: Tue, 28 Oct 2025 06:42:24 +0100
Message-ID: <20251028054238.14949-49-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
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

Setting ARMCPU::gt_cntfrq_hz in hvf_arch_init_vcpu() is
not correct because the timers have already be initialized
with the default frequency.

Set it earlier in the AccelOpsClass::cpu_target_realize()
handler instead, and assert the value is correct when
reaching hvf_arch_init_vcpu().

Fixes: a1477da3dde ("hvf: Add Apple Silicon support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b053bdd7cf2..0788b20cc05 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -897,6 +897,13 @@ cleanup:
     return ret;
 }
 
+static uint64_t get_cntfrq_el0(void)
+{
+    uint64_t freq_hz = 0;
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(freq_hz));
+    return freq_hz;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -908,7 +915,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    assert(arm_cpu->gt_cntfrq_hz == get_cntfrq_el0());
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -974,6 +983,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /*
+     * We must set the counter frequency HVF will be using
+     * early, before arm_cpu_realizefn initializes the timers
+     * with it.
+     */
+    cpu->gt_cntfrq_hz = get_cntfrq_el0();
+
     return true;
 }
 
-- 
2.51.0


