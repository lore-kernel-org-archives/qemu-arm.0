Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675AFFDEE2C
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:03:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxSB-0000V8-L3; Thu, 23 Apr 2026 13:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxRt-0000MK-1e
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:02:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxRq-0004cb-EY
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:02:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so85239075e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963761; x=1777568561; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGkoFuEm7+jO9F5J4WaA/pQTANhW5MV3tHvArzYt2ao=;
 b=JzWNyKd5jLVT91ecLdhSEPDPHXBHbFPjLvcqTW2hWoLSUqeXxsqjmagpH21VgAfrCS
 wM5Axl+mmX+o1dI/MRKu2a/LFemGSWPZ/ieVcZZgrsBrg5wa9NsZwxRmuSHDUz364Qrr
 7pfNH6k650XNlOOIOE1tBd4Brfkn69GcVq0uBJlJDjirrDi2lJ98EHSSnsPExM05L2l0
 JW92woBBHmb5MI6nFexVPEWHKUrsLle399jBAY+6FaTlUyHuIKPedQgQbwby7Va3qun+
 d9M99Zn4/PxHmwnU8eHlZlpXS4XJnUVUgMdOkRM6A39rZhei3kx/ELlzBcsSaTNkKEwS
 mHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963761; x=1777568561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YGkoFuEm7+jO9F5J4WaA/pQTANhW5MV3tHvArzYt2ao=;
 b=oKpNgm6EbZ9x0UaEl4iVRRPoybZuMNKgaCRL+bSrLNYGvLkEX7+cGV51NULXhZPDPj
 IFOgVvnrfQEMg0ksvDml6rpWz1PJyqDN6TLxZj2+zpSZvO5enEtHHzkwttqRlkhob2K8
 0ls5f/pI5U0wMegqAZTzHuuKa0XKAV43aowvUZE5BN+XKqThtdNqTBUIg3/ayFUsHg2n
 dQfYN9sepjMjr0y0jZCPpmsJmRZ+7uyQ2dOHJJa+JAD//5TSCjjnvMi+wwiTRItRW5VP
 cNucKpnKGWB/PA9iP2idGsUZ6YobKN3y/J1CFUWxKpr6d0ncXwetZzuMP+JG8J08ilVp
 Pckw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8NJenZJ1r0A2Ys1Ul11om8/n5kdRuOsX8PYGUVoiwT/tHAa47ZknnE1H6cLfK8jYIPTJZNYUFeJg==@nongnu.org
X-Gm-Message-State: AOJu0Yybb3hCcFpdY9E1yEE6GjGxQ+QLNKnl1OwLKy/XQVX/eaixT2mc
 pTDVrkMSd4OGfIzFmK4USA8oao04qr+p9ALeIpKbawXsmWgE82hu1/m0acvV2HA/UU4=
X-Gm-Gg: AeBDiet3j2Ta75mzeAAMlNUqxMOR728+EPXfR9Nh5gZW3X8UvOXD8MIcGkRH6FVK0GE
 ALjWfm+xqumUEKlw8uBOqBOVVZnKIszMGGLL5TX8X33lmKfM65Sl7j8qB1cZf4ZuV/d57vda6s+
 3yGdUV8HfqaFMldQ6hsR3xMrY8YkyUX1YrE9VD2x4WdyaLbDmIpl1Eiq9UJNdncZzM/3WMGVhPg
 sP5DuAkfCE7UsbR/wOQ6R4Z9bilmCWReL7N0zLVmU68vlMPwLnU9GKhnVER+YPC206vEvbBAEk1
 6unNMkGYPmwj6wFpMJ4ORCfn4M06qjFHM3dOAyCfliD0F39lWlq/DAHookcrDfWQ9CiVpc73hhi
 5qUassrhwlVImfA7LoHPdtBMexqni+g5ZQQ2iCG3vWgNgcgJbSx5z1+5ApFaUpIEfg0fEruOwL8
 n/U5mO0Jvc+M7pPKNFldte3Qao+No8ODN+aoIVIdNB2wZY8BRku3/NCE3PrzXKdTKPmHNaWOA7F
 g2GOh8mrjxzhUuviMkoCQ==
X-Received: by 2002:a05:600c:3553:b0:48a:52f2:a0f1 with SMTP id
 5b1f17b1804b1-48a52f2a5f0mr207640535e9.18.1776963760832; 
 Thu, 23 Apr 2026 10:02:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm912678555e9.3.2026.04.23.10.02.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:02:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH 01/16] target: Simplify env_archcpu(cpu_env(cpu)) expression
Date: Thu, 23 Apr 2026 19:02:13 +0200
Message-ID: <20260423170229.64655-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
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

env_archcpu(cpu_env(CPUState)) expands to ArchCPU,
available via the ARCH_CPU() macro. Use the latter
to avoid using &env.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c       | 2 +-
 target/hexagon/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bbbd9..2fb768048b8 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2303,7 +2303,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
 
 static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
 {
-    ARMCPU *arm_cpu = env_archcpu(cpu_env(cpu));
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
     int ret = 0;
 
     switch (exit->reason) {
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 633401451d8..825b236dd24 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -978,7 +978,7 @@ static void hexagon_tr_init_disas_context(DisasContextBase *dcbase,
                                           CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    HexagonCPU *hex_cpu = env_archcpu(cpu_env(cs));
+    HexagonCPU *hex_cpu = HEXAGON_CPU(cs);
     uint32_t hex_flags = dcbase->tb->flags;
 
     ctx->mem_idx = MMU_USER_IDX;
-- 
2.53.0


