Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656F1D116F3
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 12:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOxoN-0002M2-Ex; Fri, 28 Nov 2025 07:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxo4-00026w-Cu
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:36 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxo2-000399-Se
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:36 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-55ab217bb5eso290739e0c.3
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 04:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764333754; x=1764938554; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6rMJ3udbgIpgAiy6d31R0Vx2kkWCqkcA13MTheL8sQ=;
 b=iSOV6Y5XrC7FZfRL0QtU7751OKv8dUjthFa3epUQJ/uQ6/o643RLX5REpuEFaEmc+f
 RqwW3X7kE3SCyhUDo0jLfXcZ4/Xv2rJcTBVXkhe08vQS0G8AN1ZkLl2jcD9V+NgC9qix
 3N9WF8HczJDp/Wql7ZYh1d4inu8EdfySQagvZRvK5zaq1MH775ZIpT6H88X1BV98KfCZ
 IAwBnp8wMrZ1JcdGf76K8pFUusstVcXMOD7vMlLo2nsjKNCD8Kmd2OW6Be72QzO8LA6h
 e9C6S18l1VKnYflHCuNrX4OFocHcVGEoLrWlq6/OUyDPbFIn2Cvb7fg4MN6OBCHmUUOk
 HV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764333754; x=1764938554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P6rMJ3udbgIpgAiy6d31R0Vx2kkWCqkcA13MTheL8sQ=;
 b=iaFkFOhw93dSitIxV30GPfRvsddJCVtPN0JEmA//9oSG+iJpspc/YfN1HnFT8sAT8Z
 +2TVULUJLuMYTjfWWfamzhnk7qLAJLtaiDWbQ63jZK3/whkWfiGvmEhHs2JEtn9EZeft
 Pl7s6OazJ3UaV4eZSX9NkITclv9LhI0w8f5TCEnQo3nNiTm0gBIDJZWn+CVpSoQULe7p
 Dt6NuSKim1zYCBLubSc/jOxWFpyqclMZYEDllaJHbgmcPq2xqOr0KtD0+XxiS51JhMXh
 LgHtnQrGT1o9K6L3wjhH31Y7PtcY3p8uFeDhRm9/bAdVHP4R73fiB5DVF+d0CCpvjZLl
 y13w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWufQY4uDbLjjAXh6WrPvTsvMYZ8/OnPxaHduOOJWoOKJQqmwWzPIjTCGfQ6ucxts7FCoxcSZyVow==@nongnu.org
X-Gm-Message-State: AOJu0YxdU0uOPzUgj94SE5aLKTzvi/8te/6U0lykDWRi2v0AoYsor47j
 /9AYUbHEGre/t0fEfygMosuDvDDmAOqLpwUNCaCLN/gWnbkdvVynAioSKigq9qIi9MU=
X-Gm-Gg: ASbGncuCL1CimckYAOMIekGRviukpiuBN6hteDi/KdEZAKn2RL/XiCK30Md1kd5F6FD
 yib3b9X32tuFeFIHcZ5IchJ0cCl/ez3y00TxVMQCQjUcjKLrfYSXnzRl2WQ4yDsKtImW7sfFKop
 yN3h7g1c7YFF6PBH1sUmYT+rDyYj1C6hD9xv2P06+4VIkGmDknxVuqLrYNLn7aVQoqblQ1YcKSz
 /zjEWxwiDaWCo/WEB4kKj2dhgzccJj0u2pMPL9VPDsrskpELKgfIu5wT2Shs7NsOq/SQa0Nhp/S
 XENt8atT5f0TXAli4g8avjfR32reL134nZWgH3aTbnUiOOZi0VHdpuTIHGIDPcLk1KDm6XYZ7Fe
 FQ9C18cfjfYp8AnN0/OqV+yMSOseBrPitxAIOKV8tkxNGzSc8Z74NWH1xFMxS8puTushNsGg7H4
 vRY50Sxt1Gwn1y6sM=
X-Google-Smtp-Source: AGHT+IEsb/oawwXBRNjapEzXqc75pUgGhNNk26dnwbq0ojjBMQeG+AWSNtLm+Pm7/YeOvu/HZ3rTSA==
X-Received: by 2002:a05:6122:7cc:b0:559:eef7:39f with SMTP id
 71dfb90a1353d-55b8d75c040mr8547626e0c.12.1764333753723; 
 Fri, 28 Nov 2025 04:42:33 -0800 (PST)
Received: from gromero0.. ([177.139.2.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55cf4e1d56asm1776930e0c.4.2025.11.28.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 04:42:33 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org
Cc: peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v1 5/6] target/i386: Add a _MAX sentinel to X86ASIdx enum
Date: Fri, 28 Nov 2025 12:41:09 +0000
Message-Id: <20251128124110.1272336-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128124110.1272336-1-gustavo.romero@linaro.org>
References: <20251128124110.1272336-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa2e.google.com
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

Add a sentinel to the X86ASIdx enum so it can be used when the total
number of address spaces is required.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/i386/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index cee1f692a1..783ad66d74 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2600,6 +2600,7 @@ void cpu_sync_avx_hflag(CPUX86State *env);
 typedef enum X86ASIdx {
     X86ASIdx_MEM = 0,
     X86ASIdx_SMM = 1,
+    X86ASIdx_MAX
 } X86ASIdx;
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


