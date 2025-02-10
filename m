Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2250873njb;
        Mon, 10 Feb 2025 14:19:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbwBuGE1ldo4PDaMGBmD+/mA9itzRDiIuYSImKHVIYGPQ3nQxx6z+wgVpjdD8txaPamextCGNLNtf+Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IHOACrRiTg3qOXBkC3jP4s85PsLj2aJlRKWSonfdMm+OzD2uPSydiGrIwCOx5O9fQSBzskV
X-Received: by 2002:a05:620a:471e:b0:7b6:d97a:2608 with SMTP id af79cd13be357-7c0686e09bcmr203977385a.17.1739225946174;
        Mon, 10 Feb 2025 14:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225946; cv=none;
        d=google.com; s=arc-20240605;
        b=RTVi5VLAIfpAlw2iqmHcq9TXvfsadnSWcJvOTLeyAtpnU1Sk3Lyid5ssMKU1GCoJ1N
         uMEeKLEIWPN8jx9QYGmrEr3Ds61uZ49DtRF8KGFR5RChDNaTfr8Avy1SuhyWqtwatxmm
         o6GyMX9h/Y2S7HG0i5PEPpZ5E2PxkCwXLblt4SQpiU2hTn/nHnJcZM+sVtgU8t5CQWgj
         cRnB40mRbC39lAOMuvEazeifkiT6rcnlJIwJiQWH6HtIC4Hl05gYeZjCl0teAplGB2Bg
         ZIJbYw28WeSd3Xaa/87ahGloGBYTe9Ncntkej1kPdyGXwgzAUe1bHeWtECLB2ije4Szn
         7GMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=verx53GTrTT7sD7mWRhDwPgxK/V6+ka4Dj5r4zGv8rc=;
        fh=doXZEVUJH+dapJiizu149WUeHyW/vErWQPij+1RQ77o=;
        b=hCdF0MRqj6KGyqxJKwIwpzrCLu2FMZa//zkprqFPizHmxa1swYaj3xDjRyM04u7zgk
         VrZZSPGc6E7VSNzSdMrRAoRHlK2ck/qDWIfmhosFPfuhdpJvWSBrIRuXJDNWNiYFTKHQ
         Y7qsqIKyKKTFCSYQHHc7t3El2NpVwhU0p83uOuycmhFptZDCTPBHNjqOs4+PESR372wd
         Fd8HN9mPvJIwvAeKjvzevGvm0Q4pwZB4uEA1zu+X/F+Sn7kY+ASnOKgDBQ0LjoFPip+e
         I8ELVrG2fShqOIacnyHCbNtndNb/j5KZSb3YetcZ0y+Q5FLBCdWM6dzvr6NVV2E3BKxX
         4bAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FD45hCCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ee683csi992476485a.619.2025.02.10.14.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FD45hCCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc7L-0001qh-23; Mon, 10 Feb 2025 17:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc79-0001he-GU
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:18:52 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc77-0002pH-63
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:18:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38dd011ff8bso2702592f8f.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225927; x=1739830727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=verx53GTrTT7sD7mWRhDwPgxK/V6+ka4Dj5r4zGv8rc=;
 b=FD45hCCChnTWHaHseVR9p5vcGmvatxekjMWbl4vgRSa5qlxZtZ4JmIoBn0wHTkIGkV
 V63WFEMk7m3AphYWr7qIOqHDff2SSRv7be2WWYBdsHzseaviSaKT7BUf8or+MvbVN8ow
 DnP8sNOJ21zKhr+oAT0QaaG2hCHCu7sVYKSlzIQABv0CR1l4znljkhgemUMIYGX3nL7L
 Xb/gF9GL2FRgQOwCsuUhHbNYsM4W1a1L134mQbAZH3SSqRWKmHrh1+T+PYBnHyPvNFgV
 jzfcEMY2bysRrGUA+zZsPCqy7KwFzdUgxV2g1HaUHLy5Qw4QMMVoXJq0ZKO7bBNO5GBp
 hHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225927; x=1739830727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=verx53GTrTT7sD7mWRhDwPgxK/V6+ka4Dj5r4zGv8rc=;
 b=Vk+1tBhttcKRi22p8WemjrCjPFJ/ngq5hEWYsZ1j/M8Z2BE+WOrcsZXWH/uYnpFStH
 9mGb8ScPqZmCwhe+SjJGnZO3MeoLBlQTXQNahNz0y3TCiAUoGtho4e9gVwSM5mfQ7G3v
 qAHedQ/UuvEMc9+8kX/fz1y61RrFKyGSgGu3FD3owmjsca4jd36WmZ3q7b8e704Y2guC
 RIfZmqi3T83zq4Bd+kZiqa37WvPY3+uU/pDDvOJI5KQqo2+ABoTFpmotKeoZgxFYptNs
 ulMAda2BDF58uao0ObaHkOdu+iih+45ekxgRX3U5FnZtI+7UYACGTtOf3Wx1f08Sheuh
 yBrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaoAzlNNYrTgO/rP4d9iJvaGTIWBvGB7lChlugDncLQkcAXhHivNw+StlhmSMdYslQzrwISnn4+A==@nongnu.org
X-Gm-Message-State: AOJu0YxT23dq18tXudguDWkV41SYtrDCWBWcNt/st6F7OMYzh0q53/44
 XvT1nBO/1VK6O8voG85Vz7rwaACGEL4TaI6We06rkA2POX5DmtiZoDpsNe8GeSw=
X-Gm-Gg: ASbGnctMaScAkCdcVk4+ZbbUOND6T9ytP1iv7gn78Kvu/w889Duph2J5t8hVENXkzvv
 aCvb+eVKXtMRBL+LqyFNiEG977zEwBu6qiAk4xSk6lRgeJqWgSXtGZswZAORhNpN9AE1/b6P09b
 bvRP9EYG81hZJadSok/LCqf0pYVsfd7thw1028DPLF1yPfEG3U4IzP8hO0fDisPRf+RxuG3vDhs
 /BZNsUWt/2HPYKvmzRQSm5C1V7sapbjdSYeVTqmvE6WeK08PAlhXD6j2V+IdeyyUETXrXdJ/TLF
 cScL12j+oJzYZvwg7ayIX2L55nX8kRqL2l69Qg4s/Cdgn4I6/wTXP3j9gRHK2fB7wQ==
X-Received: by 2002:a5d:648f:0:b0:38d:cf33:31a1 with SMTP id
 ffacd0b85a97d-38dcf333704mr10350016f8f.23.1739225927584; 
 Mon, 10 Feb 2025 14:18:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc17e278bsm12408209f8f.48.2025.02.10.14.18.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 03/10] target/arm: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 23:18:23 +0100
Message-ID: <20250210221830.69129-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m00P9fL/QID5

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 94f1c55622b..68b3a9d3ab0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1188,7 +1188,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     ARMCPU *ac = ARM_CPU(cpu);
     CPUARMState *env = &ac->env;
-    bool sctlr_b;
+    bool sctlr_b = arm_sctlr_b(env);
 
     if (is_a64(env)) {
         info->cap_arch = CS_ARCH_ARM64;
@@ -1215,13 +1215,9 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
         info->cap_mode = cap_mode;
     }
 
-    sctlr_b = arm_sctlr_b(env);
+    info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-#if TARGET_BIG_ENDIAN
-        info->endian = BFD_ENDIAN_LITTLE;
-#else
-        info->endian = BFD_ENDIAN_BIG;
-#endif
+        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.1

