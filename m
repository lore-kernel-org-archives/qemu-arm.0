Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F40CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE2H-0003D1-0d; Wed, 29 Oct 2025 17:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE1w-0002rI-2W
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:48:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE1r-0006vq-KE
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:48:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-429b72691b4so24886f8f.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774499; x=1762379299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScX5jHXkPCfHiRHa3/7k2dJ6cTMKBNtK3/vaUFB2OeQ=;
 b=oVgKoV3rz48NwsmebP+lTtFqbKIuPcaqk0Gv2hjY/e2fjKQNWwpUXUmIDqDmptIo29
 MB5A2dW/Rf92YMKBpLfjJO57bWQo91yxjy+tUIDyY0yKUwbNqjuhMlTwSA6mephzChzf
 SQPxHyN1U3KE3cXgN+D0rZdSMz47sX3gN568ePwhl6KuBAjEsWhneU67dGkS1aKARNeM
 Zrg6p00T4sHCbgazbvT8MQ95vFtP7eSNl22P0yF7OcJfmjYMP1dpZRIrrHjlOZa08PLG
 r9eSLaa+3aWiDRvMLR4IPYSJ2wifVM08u1OPhTmyeZWecp0zMS7iPYoHcfJPPjUCBeeC
 2pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774499; x=1762379299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ScX5jHXkPCfHiRHa3/7k2dJ6cTMKBNtK3/vaUFB2OeQ=;
 b=Z52D2hg3+XnVVQ6/OsNMDZLFF24QzQGOUpU/U5wl2ayxUnCQgz3JWyDldyBZ9RLCzF
 s917pkRGDADm4TIwql1T+PQOXeluTPp1bkwp7Od+EJejvdCuU2YdtISHnkCt5GhKgX2p
 ytmWl6xzzgJMl7XJU48k+uDcTmjIi6yAj2qU3auble8vJevPlvYsBBMRZAIXp9vJszXc
 GQE6Y3/CZ+/eeUr8Tflnbo5m+If9xIeQo6igzsQhOnRTfqigyw0Eixum6pUjhyfpTrI4
 d1POJrQ0P9DD8UPJFVievnRt+bWSfdlb+xELmg4mwa7PxKASVZx9LLQEQjCZBqKna2+R
 HFGw==
X-Gm-Message-State: AOJu0YxcK0TOFk7nSWfH4cLVmpPUu70BdbojdMtoHVpulnTPPljA5KR6
 PBeSqEG1pfj1a/48ziQTcWkBuDbeDxQQFdX8/iuN+n0XAAWCVanRcI/WeVN4slc9OXIt3IrsQ8j
 yUttxzkg=
X-Gm-Gg: ASbGncu5ADkkXmPYJ5EfT/l2u4Zi0Yt5qCMBlCpGTdwOrXIunPhvgNNgtcVOF9mxzh6
 WMjuBEkhg7QwlQJbWw9PrCJCHp5WoQjMJiGpj18u5EDIXMppLEBcCXISxjZjilkXwFBcrNbIzgz
 W3vYBc4MTM1jGBjI2/LksyAOyhvM7MANPrv2oS+Ot5/sWO/OjWx/3QN8e7NsPvLRs7m8Ia+KhLL
 UPkySROtFNSYMlwNR5H3YBa1bFImfadeRDUFImZJuX6Xj07pqsuA394MNiZpPqNdbdEU75j3QLp
 FwBUkcjgw2WjHy2jF6Kf6zlKaFCpszjOTQIh+7VWJZ3DtpIE5Ll0mMfDg0dI1Y19u/GKbnBk0ae
 w9NVcVwbYwkpTKi7HHxDxERyDhOFhHrU5TcYh6UibhponTCaUOFoR7UWCor9S+UWjxnlL5MrPT4
 KI5lXa3joGRLNVqxtAbBMqMRTiRtJN6Ncb50cqtBFUrIX/OuVNyXPYNu7Rd0wI
X-Google-Smtp-Source: AGHT+IFOUMbfkddgnKumzQ9hcae4vW+5GaUyJXzVdBdODD2pm54cktBkgz56wlSn80mF+gsLZOS8aw==
X-Received: by 2002:a05:6000:40cb:b0:427:241:91c2 with SMTP id
 ffacd0b85a97d-429b4c97bbbmr745180f8f.30.1761774499223; 
 Wed, 29 Oct 2025 14:48:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db99asm28506026f8f.32.2025.10.29.14.48.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:48:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 08/23] hw/arm/virt: Check accelerator availability at runtime
Date: Wed, 29 Oct 2025 22:39:45 +0100
Message-ID: <20251029214001.99824-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

It is not possible to call accelerator runtime helpers
when QOM types are registered, because they depend on
the parsing of the '-accel FOO' command line option,
which happens after main().

Now than get_valid_cpu_types() is called after
accelerator initializations, it is safe to call the
accelerator helpers:

  main
   + configure_accelerators
   + qmp_x_exit_preconfig
     + qemu_init_board
       + machine_run_board_init
         + is_cpu_type_supported

Replace compile-time check on CONFIG_{ACCEL} by
runtime check on {accel}_enabled() helpers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210840.60112-1-philmd@linaro.org>
---
 hw/arm/virt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e19da6fd901..d3809754460 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3260,7 +3260,7 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
 {
     GPtrArray *vct = g_ptr_array_new_with_free_func(g_free);
 
-#ifdef CONFIG_TCG
+    if (tcg_enabled()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a7")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a15")));
 #ifdef TARGET_AARCH64
@@ -3274,13 +3274,13 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
 #endif /* TARGET_AARCH64 */
-#endif /* CONFIG_TCG */
+    }
 #ifdef TARGET_AARCH64
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a57")));
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+        if (kvm_enabled() || hvf_enabled()) {
             g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("host")));
-#endif /* CONFIG_KVM || CONFIG_HVF */
+        }
 #endif /* TARGET_AARCH64 */
     g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max")));
 
-- 
2.51.0


