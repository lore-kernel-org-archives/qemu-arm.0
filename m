Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A20CC61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 21:31:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyyig-0002R1-Bx; Tue, 25 Aug 2026 17:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyib-0002MI-WD
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyiZ-0003L3-Hf
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-38a0c7e841fso520129a91.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787693402; x=1788298202; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KR13c9n0s+ysXjQ32jlNfW+FisQREx18vtaeYTqxrDc=;
 b=w6dvxCL3C8wuJKC2iBcsZv08raJhq8YfIlpzeoFIqWDXQb1bm3dtcEImy5ue3T+XVo
 D3Meykl1WWPWPnzswgu7lVaZHto6K8Gm37ZcGR+cEa7sZ3MZq9ZiOpyuMrzGtwSGYo/V
 5CbAzKqTKZ9MqIgP0MxAVZJH/tg4fN3WRSJ+3jEDsqiAzaTBdFOavfVhDBc0MtJbo5eg
 8lYzJ0e+KrWt3wP0x4pBhGAi8cWXaWyS3n5msJMXOpCWuE7rZWdPAGd0Rp2xJnKpGjje
 kE9M64JTPYvzYC896j+pFuUYeItjA77TOjqV9QttEiTsbEd44s4fKWHFfsgI9QZlanNU
 ZeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693402; x=1788298202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KR13c9n0s+ysXjQ32jlNfW+FisQREx18vtaeYTqxrDc=;
 b=ELwv/xRs3J/n/nJ8heVRQ3nI+fLohcHxXP8sysaMoN4KM31vLYM0PfcD8Kqtrz9Mak
 IwvgBfQeKXNGS7Bl0JmvenIcmSOaik6uwC6xEPNWtFN7Zz0NlA3pZvTHZD/QWHqzp/SH
 HILJJi0sOVKQyxJecgVe6xY1RE9LW8a7ktBTDxmZ78vn6j5dTTZuNzwlfbYaIRZkizhB
 uuKuLzipJbULXDy92d5zHvNBw7BDj4KmirtWNhQ229t7nrUof25mEwASvGuR7IOqPhYz
 dEIcbOqMJol7CDqPjO1cNa2gVzLwloHaN7MCH91wgBJ4Lvmoq9h70RaIotB2bBvNESQ7
 AxHg==
X-Gm-Message-State: AFuF++mTHNJS9nv+WWqsvZsZmfDGh/w9N2SweWGe60zExA8kpjci/bSN
 wNgFo3zSMf2SWemZKLwUjEJNTvpF7qc4f9AuokqvB8H6w+KJHC7f3GpvFk2g2R5+cuU=
X-Gm-Gg: AR+sD12MlKCpXELHPzUQQ/3PifcR9AcKihAOFk4hPzBwdM4Swjie4BGUbHlTKZ7anep
 e28+a9OgZ4wdBljikaU4N6v9CQEA5ZPA06iZTVV9xjJ2Y5f1o57GO6scnw2QcNahH6trPtCN3Kk
 gH0R8AZuDPvdeFz1WxpycXXXBYDa5halg2VfzTvtxuypr2J+AzXdE1uKmJFI40EhenJza/gIMKo
 tPS/M2Tc5fNUMSHYhYXQxELu+/tra7XPR7aPD6Lt7tjdYfop3Iz1o4TtyskdthWOnNQi8UZ8QvK
 vkllZB7O437P1iwfYmGcFtPqkAz+xRhBOP03bXTKNyZa84YmA28xL+XKUNAkQyEu6asd6g4NZVu
 3x3cBWv/wDQ4SrjHN7wHO41PPYqUYS3QzqCc1huDm7ThM/n5fV2sOaxAQW/hu9HS9U0CtQJ4S/B
 jYfpX1BIfVOXRAeg8iJ0UDUf6VgSmQsms9IrPvr5cOowVS5E+seCxRghefeLqEXYYBlqdurmnOZ
 QLaokLkfdLFwB4gDA==
X-Received: by 2002:a17:90b:1fd0:b0:38e:70d5:b12d with SMTP id
 98e67ed59e1d1-3966d3ed042mr4377795a91.6.1787693402083; 
 Tue, 25 Aug 2026 14:30:02 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396689fa52csm1207163a91.12.2026.08.25.14.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:30:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 1/4] target/arm: Rename and adjust aarch32_max_v8_tcg_initfn
Date: Tue, 25 Aug 2026 14:29:57 -0700
Message-ID: <20260825213000.221822-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825213000.221822-1-richard.henderson@linaro.org>
References: <20260825213000.221822-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Rename from aarch32_max_tcg_init and take an Object pointer,
in preparation from being used with TypeInit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu-max.c   | 2 +-
 target/arm/tcg/cpu32.c | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f6b4e173a54..fc7d5ad6f2c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1838,7 +1838,7 @@ uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure,
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
-void aarch32_max_tcg_init(ARMCPU *cpu);
+void aarch32_max_v8_tcg_initfn(Object *obj);
 int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 4df52bcb08e..9ed45c8764f 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -108,7 +108,7 @@ static void cpu_max_initfn(Object *obj)
 
     if (tcg_enabled()) {
         if (!aarch64_enabled) {
-            aarch32_max_tcg_init(cpu);
+            aarch32_max_v8_tcg_initfn(obj);
         } else {
             aarch64_max_tcg_initfn(obj);
         }
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index bc07e33877a..8397f26a864 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -855,8 +855,10 @@ void aa32_max_features(ARMCPU *cpu)
     FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
 }
 
-void aarch32_max_tcg_init(ARMCPU *cpu)
+void aarch32_max_v8_tcg_initfn(Object *obj)
 {
+    ARMCPU *cpu = ARM_CPU(obj);
+
     aarch64_aa32_a57_init(cpu, false);
     aa32_max_features(cpu);
 #ifdef CONFIG_USER_ONLY
-- 
2.53.0


