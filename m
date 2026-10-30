Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52103606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g61Pryev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMnJr-0006FX-Md; Fri, 30 Oct 2026 10:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMnJl-0005zF-PA
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:10:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMnJj-0002CY-7w
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:10:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so479122f8f.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793369449; x=1793974249; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KTxi2PJIPb2Jh25HIxJewBV4piE3oe0if8hJVlqlwTY=;
 b=g61Pryevi6BY/gT4bsBojsdsEt53iCbqURpouJoxV3BpuDQYEHG73FJGgGCej6875z
 QwslGEaRR9ViyVBYqdCEEgpRgZjsyiyYdJ/MGNOerQ8wja9vBfU0yHlcpVSynoouwIZB
 IfWC8BRiZAVfWKdH2WX0JTam1WCV09roKFDgsFmAl72uocY2qvZnkQIY7q6PixeQ7nTj
 DY2XdN2TsmCmrFzyi/rPyTgvFZj/u7OBeztAn+yPj8/EimPGkt21tffiHyQ0unJmI9zK
 s1abAIaVjiP1DevVH0fTJJnN2JgZEcbMen4Gu8J1+YXp4mlwSvAPGy3PC9Kczu4b2Wph
 qDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793369449; x=1793974249;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KTxi2PJIPb2Jh25HIxJewBV4piE3oe0if8hJVlqlwTY=;
 b=me9FVnz8G0D/BYgWOidzwMNtJyww2p4/9s3KhuQEkBgd9viv0c6kRLijSkurX/PBpk
 6pYNHId8FEsaXhaIg/VI4m0SZHT9NoiRRoj+opDhANxVYTHw9KtnHkzVFKtqzk8NMc7v
 dKH/yq4OJoG8VLlU40T8KMyjVOeyGZ+g3BjSk7Ilb8wf7QNU3lfcNCD155KXlc3R/Krg
 DirZozrhOjJTFR3ayRG1vcgHGjOD9NKfGaTXZ603PUcO/Trve6Bm1VhGtYLwnZN6THB8
 eE8Yrr6mg0dOTp+3w2dACPn+GkWQNpIueePuMmtt1EiYhW6EzSVqVlykEBMT7Fx+t/OE
 xBHA==
X-Forwarded-Encrypted: i=1;
 AKwUvByFeyEvl+s22/8hT1PXo67PIjz0IByEEDH7Vh3531DjBlZreK3H/HHsPa+p9RxMLoq5xVwVe7FeAg==@nongnu.org
X-Gm-Message-State: AFq9FYKqcdzfFtBGnw6HUX8+RtCzmGJbvDx64s3rjnwuvA8vNjtMl8tB
 Iav05iA3mqOPxA5Pl3GlbvY5z8L0NFYZnJP9uuZQGOWwUPXcDpkT0NOnDZ2uC3GM99U=
X-Gm-Gg: AYBFou0Hn0Ebb77yoA3Su/TCopEROiI7s11825Oxx8fQo0AMREop2EzX9NLwge0JLc5
 KooMcR7vdWzRGV1unuWAPSrhPaAJZmMM8Nw68RSTBOfelPzFBlU7Os0y8tgn9lqkMDmwenUw0rB
 L+9h0XFp7p1MxP7/Wcyu0MgDXMvpMHGlnrWkxa5+KVrYB4LZaijiIlNFIj+h8QrKut19rwRWNeP
 KWz1YNHXpTSKZymZPDnnMgLbweE1kfq9bk6rEN7EBRNFcIJh2tD15v+zw7+41qo0HBoa4yiGk6L
 o3dtYB5UKcWJuRkLu/liBrGcB7uX5jf5n8CKuGuih+UoTzHgRXsbJRJEA2UdDbaf6/UKaHbPhTL
 IkACOVaY6Qry9gMeYZW7S0goBDKN1jOOCizTe2Ux6XkYc1w5TFQv0s1iMFmPkzVA1sSlEnl84iI
 AFtEA/UNKOq/avUgw1/In948QmmU0MbdeLLWGfpxlqzfshMkqlYVDcHBIqAVqLGk720B6tilYhE
 m7OJgmehA2aPVNrq88zT13pnKg9oA33PgzXai+zc2Hnz6+XgxaQvmHWsfmBppYf1VU05MJ9pi/T
 Gal77tTupv3MvqfwMKRO03iCbSwY
X-Received: by 2002:a05:6000:40dc:b0:48e:4325:4e60 with SMTP id
 ffacd0b85a97d-48e6e2f677dmr5887745f8f.10.1793369449374; 
 Fri, 30 Oct 2026 07:10:49 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8a7d1sm3414388f8f.38.2026.10.30.07.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 07:10:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 732A65F917;
 Fri, 30 Oct 2026 14:10:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/4] target/arm: simplify wfxt_timer_cb to only trigger
 cpu_interrupt
Date: Fri, 30 Oct 2026 14:10:45 +0000
Message-ID: <20261030141046.2710206-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030141046.2710206-1-alex.bennee@linaro.org>
References: <20261030141046.2710206-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

HALT_WFE will always be cleared when leaving halt via
arm_cpu_leaving_halt so we don't need to worry about atomic games in
the asynchronous timer callback. Furthermore, a WFET timeout or
event-stream expiration is not an event that sets the event register;
doing so causes a subsequent WFE to wake up immediately.

As we only need CPUState to call cpu_interrupt we can also simplify
the user data and avoid needless casting to get to it.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Fixes: 01b223f895a7 ("target/arm: enable WFE sleeping for A-profile")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20261029161310.2065290-6-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 510fc9eeb3b..c690e2c8937 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -885,26 +885,12 @@ static void arm_cpu_leaving_halt(CPUState *cs)
 }
 #endif
 
-/*
- * Unlike almost everything else that messes with the halt_reason and
- * event_register details the timer callbacks are not in the vCPU
- * context.
- *
- * To prevent races we atomically consume a HALT_WFE and set the event
- * register. Either way we trigger the an exit event.
- */
 static void arm_wfxt_timer_cb(void *opaque)
 {
-    ARMCPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-    CPUARMState *env = &cpu->env;
-
-    if (qatomic_cmpxchg(&env->halt_reason, HALT_WFE, NOT_HALTED)) {
-        qatomic_set(&env->event_register, true);
-    }
+    CPUState *cs = opaque;
 
     /*
-     * We expect the CPU to be halted; this will cause arm_cpu_is_work()
+     * We expect the CPU to be halted; this will cause arm_cpu_has_work()
      * to return true (so we will come out of halt even with no other
      * pending interrupt), and the TCG accelerator's cpu_exec_interrupt()
      * function auto-clears the CPU_INTERRUPT_EXITTB flag for us.
@@ -2302,7 +2288,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      */
     if (tcg_enabled() && arm_feature(env, ARM_FEATURE_V6K)) {
         cpu->wfxt_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                       arm_wfxt_timer_cb, cpu);
+                                       arm_wfxt_timer_cb, cs);
     }
 #endif
 
-- 
2.47.3


