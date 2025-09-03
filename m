Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67699CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:11:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkQN-00024r-3S; Wed, 03 Sep 2025 06:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQM-00022w-6j
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQK-0008Jf-IE
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3df15fdf0caso233249f8f.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894142; x=1757498942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1utAIvfVfs8L6dutO06Y5T3knPnxj7CnsEJ7M337wQ=;
 b=yt02F2Y0FLaje5O/+gtCSxsBmelC3SCdQZ9rULxg+GLpWSGn2swvTr5+zBZIDA7sFy
 7xMMPhBUjWSuOD9TtYvnmAaNhpdd8zU9/C5Kv9lBuwLcUP3YDg8fJwJtVxZBNSxsA80I
 yvDp6iS+5XondE+U4F79r34e67XDie7LIma6lgq0fPcemRBen0KPFZW9NvU5+Gdnh1zA
 lfXHXS7N8ZdfJ02w/irwQ/L7E1W/s6jDKq0J1xgXc2B2ueWG7xlG/yWPtjGkdHFTbxkS
 r7a05N8gUfpaFjfB7d2F/EOG/TNgcfd0FNYax+rone14og2SfraQkDJvDKWI7sxXMBXD
 0Riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894142; x=1757498942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1utAIvfVfs8L6dutO06Y5T3knPnxj7CnsEJ7M337wQ=;
 b=pQHYfSYgVma3tE/mawnc+xYE60w6aoG2QAgGHAO280j4RJDOqc7UzEWV3eE3W9IgdD
 e/4So6Nc8n4v5k+Wx3avlEKaXcoZPLxCm9ZSN2Skr/Qz7DJbsjYG2a+FpVUWU+dhJuxt
 mxD8q9PZznKmcdn8hOTUW2K4PDC0FpbpxTlI8H474zDrQTkv632sEZz2/YOde+PGuDhc
 7PMP4e1OdaPiri4qEXwubVMTBtwD8JWdPtpEzuETkePMz8NoGjHWdgax3Zn3GHYMBUJC
 Sad9Wl/7NyNq3xgp5TzoUY4+MtdIElr6lnFs7CEuQs2TzPBwl0H/MDRLKhDIwH+KY7Ql
 yUOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbYvXYlY0+bdnJJk0DHL2WZB21XyKaO5SsOLHjUV5rkjAiaqknqB2C/9HsrWuFdaE5WP3/X9yoOg==@nongnu.org
X-Gm-Message-State: AOJu0YwoPoG1sjr18z10nEIaup2z3hHc8Y9hxrdPuuLwT1qE7KnmyiiT
 L22lxG4eLS4qkWVDbfQD88XleIiEfk05Mz/8BQCadvuUGMhBMDiZNSyd3CAFnzMj/08=
X-Gm-Gg: ASbGncs26fSazRhA0spaa8vcwHulAq5x9mgjlT9cQay3FBaJKaST9ZcoCjYQkHYJEFT
 JYKDh5KoWDl1JFQfgUvz9/gPFnBKaadU4whg60s16sxjL8zeQP4OqGLjuTVMPAE8jEwUEWPBhzZ
 zENYRDqfnFQ2rrv0GKv7m8n67BE/yxOAUGsVyK/YBUWkmYqIPR7EFA2hEB3rQNyJuUw04aiym8k
 OZlvhxheXTcv0Wvfy3hCHTgcW2wmsQkWxfZXkbTbCWFxM6WWkdg9H/k7iJXVQfLel14o7AMYCsp
 Q2D1XYhN0E7LpMDOsDznuPROMqcgUDKeTOjJY4xk6kIHuAwSWWTRwPmwg8wsu5rTNrHwXOWyK0e
 M3DOI85C4BnCzFx1aJAHyY0BgG3KFOuzkPlTOZbWIod5VApFwQ9zxfGjD22C/T/a5FlpYmLN2Wu
 thEfKN2w==
X-Google-Smtp-Source: AGHT+IGoftb1nGXPvfDYSp6o6GD/O8juWmGb7TE1EIXEQ2F0ztvvmCDO/+cEWuTz/83cOP2yiw1n4Q==
X-Received: by 2002:a05:6000:25ca:b0:3b7:9629:ac9e with SMTP id
 ffacd0b85a97d-3d1df34d63dmr8950774f8f.50.1756894141649; 
 Wed, 03 Sep 2025 03:09:01 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0f85c287fsm21106877f8f.52.2025.09.03.03.08.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:09:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 12/24] target/arm/hvf: Mention hvf_inject_interrupts() must
 run on vCPU thread
Date: Wed,  3 Sep 2025 12:06:48 +0200
Message-ID: <20250903100702.16726-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Since hvf_inject_interrupts() calls hv_vcpu_set_pending_interrupt(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index a9793060579..4a535d65b7e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1788,6 +1788,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     return 1;
 }
 
+/* Must be called by the owning thread */
 static int hvf_inject_interrupts(CPUState *cpu)
 {
     if (cpu_test_interrupt(cpu, CPU_INTERRUPT_FIQ)) {
-- 
2.51.0


