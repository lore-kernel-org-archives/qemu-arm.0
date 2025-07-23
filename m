Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E307C83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 13:57:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueZxq-0004pF-0U; Wed, 23 Jul 2025 09:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ueZtO-00030O-Uh
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 09:52:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ueZtM-0002tP-Uc
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 09:52:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b5e6bfb427so3601552f8f.2
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 06:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753278739; x=1753883539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HZCiXqJ6zZg/VWStToH24eJmWXqFdiiJ1PQISWWaS0=;
 b=f4ZzV5dg1vtfb9264gnO7OcbEY9NbXksEpi+eTqoOt7TEVV+4jCMQzZ/PLOWBsLyuJ
 bDWQkEbjUFKagvWay9lvnV6iIO3A3eu9ir1PCVGiBaonM7kjjWHY0TLKYqyACHAfk8/m
 N/M4UeSMJLTCjf015QFFrhTuYQulXGutw7xD+ZiRPZJB9a0/VBQl3k7iYwHPMV7O9vqO
 51AIHwZxYUlEbh7fbcyp6qP7Ghnfz/ENtI184G0SPOEf9lg6Zy4vyXRcpCkHxAdu0Ffy
 mBP6BLbY38FBPGS5ZPkZAtsVCOz5KE/HXGq5GpU1bZyo3yaUOeE51V1nH/W29iuhiEo+
 UDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753278739; x=1753883539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HZCiXqJ6zZg/VWStToH24eJmWXqFdiiJ1PQISWWaS0=;
 b=lc5AfKF1j7OCfrD4jTnrGAMENTTyM8aoQkRXB3Va4YGXW54JX/M0RlMyd50bGs0H0Q
 AGcIVYlOXN2RoW0TKAqJN5ImOO7o1mYJGg0insz/rH5qlbHZ/QHw9lg5moQwcEFfcy/Z
 XdmVPXKP9jK6vAJXEpKH56w77XN6JlyJnglD4gt0C6YwRAbFX4UdHwy1DeqEhiA62vQZ
 KPiqzB9MQZyBH3prhxc90TU3Ds3voLaIeDkKdcs/xPBaofcEd/PBxRPr6q1JbOS+HJqP
 we01gO1WPkV+PyWgKBXOrfq5cq5dcIJsjhD4Rfe4uYmz8T3ypvgVVhLLoih2f9UdFgIf
 BTVw==
X-Gm-Message-State: AOJu0YyHxxNqzUSG4v5cj/cz7JFvcjAXK/HyEBXn1S0gZ4kxVXvDF5YK
 iAiQjggYix5DZ6TVgTXhDsUah65e0enV9Jhf2Y9kA4XsBTGEWUOQg/gF2WGYKY95I9k=
X-Gm-Gg: ASbGncvvz2+9WP3/xDuowOYTeFwTCwvg6qoSYg0sR91hvngNDgmPi0XsRi8NYf1gL98
 eWdbCofoXOPsh80U1UexYMJ1HJDTm1wjSIc7C1qPcZ7ZcM2pgjiZJkKA0cLr+kyapif4lGbkySk
 6izE4DqeJw+boA5z31LnOnIj5dhUvPn2yBVlvt46yeA0TFZ0c6AgihgUeUiNzTJUSyHve7Ur/pd
 ZH41zsqm4ywX5Ab1OrEbjvKI9Cr+PmgsxN/2OINp5Yd9HDx9DoQXuiZz0nXnddrWriSKmEi5C+W
 5wa8SJdq4PmY1HVthR4+FlbsbYj1djN5mz09x+RtbTeDm09OCQrWBOKfFrrSACwMR75XsabQ6Rq
 n+FZ9y1A7T/RAAh5dYLGpq4QPo60O0gKzQNSc3XEKtFDdNjmlIt2lfKgq8GSRfo62SMM768nb
X-Google-Smtp-Source: AGHT+IHDwvvKSwdTtXPkM65Zb4e5VGlOb0fOueXxV3lHOJmaYtgt5pDH+n2dlWWjSnAG8Oh/0ZWrUA==
X-Received: by 2002:a5d:5f89:0:b0:3a4:e841:b236 with SMTP id
 ffacd0b85a97d-3b768f1ab75mr2724398f8f.33.1753278738629; 
 Wed, 23 Jul 2025 06:52:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48719sm16582343f8f.47.2025.07.23.06.52.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Jul 2025 06:52:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v4 4/4] target/arm/hvf: Really set Generic Timer
 counter frequency
Date: Wed, 23 Jul 2025 15:51:56 +0200
Message-ID: <20250723135156.85426-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250723135156.85426-1-philmd@linaro.org>
References: <20250723135156.85426-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
 target/arm/hvf/hvf.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 7de770da4f3..ea9e6b1c0c6 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1007,6 +1007,13 @@ cleanup:
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
@@ -1018,7 +1025,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    assert(arm_cpu->gt_cntfrq_hz == get_cntfrq_el0());
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -1083,6 +1092,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    cpu->gt_cntfrq_hz = get_cntfrq_el0();
+
     return true;
 }
 
-- 
2.49.0


