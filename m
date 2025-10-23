Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD92CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:41:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuXU-0001yv-3d; Thu, 23 Oct 2025 08:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUc-0005fR-Iz
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUZ-0008SI-5m
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4710683a644so6325855e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222748; x=1761827548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2a4PoXZUReoA7VfVNmy1fiLzr59C5J9k1wUFYONVrhA=;
 b=kPJiKj2cbJKGdhb/RU9bLUahmVkd9PRuC9zqRcIEOoAUS5ElVG+XIY3+RVzLgBC5kv
 DUB8JaKRZew3sk2PVJsiage8DfBcEDd+lE9PMUzxMI7RwZlKasw8CiWm5dt+9JtshL8R
 yVb7jQItet0oWcQ+x2ERm9vunnrFxGa1F674HkCpoVEEy/V1apwAkatKECVUZdiij4sG
 3nIFt9s+Xp5W9aS/qFSxEz1TCDMUPgK/3WL3qu3uf+SAZmpYrGoWUXRGFQs1zvFZzdec
 SiXt1qvbApTsSuqHFXSAOApnLtM8ZyH1NdSfWUX3Gef7Mk0CW0SOvq3sEKHC/Eg1I0Vn
 LJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222748; x=1761827548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2a4PoXZUReoA7VfVNmy1fiLzr59C5J9k1wUFYONVrhA=;
 b=NBWpoUrp3P+6xqNkzf+cpXZ2hNJrZa9lumBe5BUTpvLSxALxhroSz6QuutdVnlcGQw
 5a+V5dtxaU+k0LXh1ZThoCxo+3SpLEVAPAUUX886zM/LsYQiBj5+JS7dvJgzouZXFnip
 BFwRB1/9QMrCYd8+K8oR/KOr5UFUZF8KJFpzZBgCWguhD+518Pei0zot8/+MmnrTuBBN
 Lv6YiyIdeMSWuI+8yCHpKzNfUeipymOZce0xvzkkPgzscWTafWNbqbflhatC045OyWZu
 aWfjkjtGnzZy65PJqSnxQ0JM8PWMls6LYK3CkbFqcmV2aqWJ8z2fZMWTtIEDOqIoG7RF
 Z6lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK1xxIHP2D2hr+RCHwrBL8KGmEISPx6PYZ8yDgOjBM+z8vtFXUJ2Nkbvx8e0inlTvdcPgGWRqIrQ==@nongnu.org
X-Gm-Message-State: AOJu0YwzyBweGDQ0DDZr3sNAV2xK+XDOq8TNqTdbVOALqhq753duZ3qZ
 Br3rUt2vXP4KgAFIK72lJ9RXqiFs0bUw8xZroQcrHFRd4w905egeoRQnpxZHkSe8Utk=
X-Gm-Gg: ASbGncsXri72vVKR+qK8HuYjLE6LfTV5zIsiiHx56gAXVt+hNKGDlQgUqiMHVICJl31
 0dA0SdToCFgr8eEeMcrXV6vrLN4GppvxwQ7WSjs2gA4zkzhd30GPM+MEhtwZ7+7cTpzu+w+vEYR
 woGrqGpZEO7OiSjAsk3S5TAi3TCX6erIoEgLVHj58xZOWVhT/OCEjZLBvGgJ/T+06OONcMHGDH8
 piIYGiSPSLrEvsso69oJcebPcX9apEelPtMZJQ9t/SX0o2X3Rh6AhFnWuxkLIICH6yv4GOo8vcp
 pjD638tZhhGIYn6nWlxDxo0msXPZAuXe/Uaeva9H0xgYKY9kurA3DrhP5LsHF/1OpmQEVevgOtx
 9MeJL2/wB6sGCWWmLXE7a5JA5F0nvLM4WTiAfekz9YRz6ZlIhHOd3gxgrN4e2rtYwONkt08r+N1
 xm6rq83gY4KRYgptUh8QZXC4E8EREN1Qu8+olOoE0QRIJFC8yRp5LbbHa+L5X3
X-Google-Smtp-Source: AGHT+IHXSw/fevYz6MyC72SPBobc67WK2XNzTHBsMH/1mqhupLtvi+rVRmQeKXVOKH10Ct5cjU3tmQ==
X-Received: by 2002:a05:600c:8b66:b0:46f:a995:55f8 with SMTP id
 5b1f17b1804b1-475c6f5df70mr37661025e9.13.1761222747787; 
 Thu, 23 Oct 2025 05:32:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d4b923sm56754855e9.14.2025.10.23.05.32.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:32:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 58/58] target/arm: Only allow disabling NEON when using TCG
Date: Thu, 23 Oct 2025 14:31:42 +0200
Message-ID: <20251023123142.8062-9-philmd@linaro.org>
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

Only allow disabling NEON when using TCG.

This avoids confusing user experience:

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: Property 'host-arm-cpu.vfp-d32' not found

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bfd3b57e8a8..9343c6093b9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1457,7 +1457,7 @@ static void arm_cpu_post_init(Object *obj)
 
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled() || qtest_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
         }
     }
-- 
2.51.0


