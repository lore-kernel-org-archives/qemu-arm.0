Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A0F531DC
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:55:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS2V-0000G8-SB; Mon, 13 Apr 2026 20:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2U-0000Fe-9x
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2S-0000JU-O7
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso49423005e9.0
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128039; x=1776732839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7kISm5AhX1EU2bR0bLryhHMON6XL0ZyU+Vh4s9MTrQ=;
 b=D27+WbTpCxTxcS2c7zBiZuGYC9yKaG8tZZyO/duI3hKFTl3fEQj3MtAO+iamm12VhN
 cchq2fsb/lbpFFsTczywZXefeApQLlJJDfCO9e3NEY0do9qwvYi0xbmihBNcNrQ2ikZk
 hvcYCat21KARMccdkl36XD2qc0hM9qNYDA05h1gJg9ELxv++A1q63Q5RJzIBIj0wUfFm
 WtgM6dJvRk4Nh0o70YUv9SLjuJxAvFEjV4p0aI+qxKvehq2W5Gpw1MMDfSi1SlEG3Iig
 +ODiyFvbJdGgH4EtvUruXuzDy+NVAWs0ViBH728WDt68VurGsi74REH2PrJdv2hWW5xN
 Mblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128039; x=1776732839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S7kISm5AhX1EU2bR0bLryhHMON6XL0ZyU+Vh4s9MTrQ=;
 b=TullWCbGSxRaT172k6CcHQIesiIKTDzNL81GBpH2zJPhh8njD5kAuwtgY3BdG6MoOq
 4KTclReYIaJvfUXIT2EPXC5//v5VfP7vEMriYTTcwQ3f/T7M7+l9qZIgGKOGJPxJzZC6
 b2H+zLqa13xIQ4DL26EvTiJnMkq5ijGYboEjtKUuAXCyssF5cEe3qb8JyI6Pr6rdJnvn
 EVclQFtbQxzKKtoxXlHBty5w4S1qmAkxLz9ZH4rTqqNnjusKlZ869QHfLyJYYH1/CNWR
 kUBFynkIpD9aOFAdZspXFI0jPF+nX8Z6JuSRklXCkbb22BuLTg+eDlmokk8yHwyocH6a
 MbRA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9VRntVLCSgZ1/I9EhoqX6I+m6HioOVvxOOYBuExEGiCNX6pxOvJohL8Pree4Uc3q4/suh3pyG8vA==@nongnu.org
X-Gm-Message-State: AOJu0YwKFLtdo7qVSY/6sjS1k80GqztvY6SblOneF2BRRWtiuz+5RaPK
 XZJvf7w+NKvcm8kF8W3OvVHeJtKaa6cY9p+AMZhrzy7VkDa/js4mhhGTIqpdYJAk+V4=
X-Gm-Gg: AeBDievLdZm/6CB1+evWLjs7mZ8r7XZN+5xQgJLgjJ+fY+7v2xjWa+EGzsDSSWCtt59
 hVpYpomOtoXP4LpEI62j550M4UHsE4JQuoHXjCHBVhHFrzFSo8c4ZNbpPfzUDnB40Z2vrKvHJ6Z
 U/u2kaZBUPG3ISQVMEO72A3CTet2IjjCPZOujC9Ra9dXUCLJ7p3X9u8dWWyzQ1K0cRYjeWUYKop
 2ywT4OtwMCD44UVdekKcPo5SBQJasRRzDzLH3LmybM8mMfl3UFpsdLpX2lgUI+C0ua6W0Gf7yrS
 QjsmYMTd9DmGQSKKwco5XqFTL9HWe2W4xTZU82ttqHeWSml1s0SfysgJ80DOTfW7I0ZE+PqTTju
 z/Va1g0zqz9jxATihdPk1Q/IN4Cce5maJpkfrf/s+N0eUPrTBDMA5MtmbmNmnx8xbGiILeANYlj
 c26RZrq+3iagsMXk+Loc44g3zf4CVAc8pq7RgolddZC/vjDwgb7xtcbF+tKFoZlTMmyYSWTrmR0
 Wi8hUl7bVM=
X-Received: by 2002:a05:600c:45cd:b0:488:9ed3:1492 with SMTP id
 5b1f17b1804b1-488d67f0bb7mr185223925e9.10.1776128039288; 
 Mon, 13 Apr 2026 17:53:59 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d67e7e45sm161438945e9.9.2026.04.13.17.53.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:53:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/9] target/arm: Ignore endianness when setting MTE tags
Date: Tue, 14 Apr 2026 02:53:40 +0200
Message-ID: <20260414005348.4767-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

As mentioned by Richard in [*]:

  We don't actually need any specific endianness here, because
  every byte has the same value.  So we could simply drop MO_TE.
  That would produce a store in host-endianness, which will be
  fractionally more efficient on some hosts.

[*] https://lore.kernel.org/qemu-devel/d64d3576-9188-4e74-afdc-3492c9feb8e0@linaro.org/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/helper-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 2dec587d386..9f0801b88b8 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1019,7 +1019,7 @@ static uint64_t set_step_tags(CPUARMState *env, uint64_t toaddr,
          * the page dirty and will use the fast path.
          */
         uint64_t repldata = data * 0x0101010101010101ULL;
-        MemOpIdx oi16 = make_memop_idx(MO_TE | MO_128, memidx);
+        MemOpIdx oi16 = make_memop_idx(MO_128, memidx);
         cpu_st16_mmu(env, toaddr, int128_make128(repldata, repldata), oi16, ra);
         mte_mops_set_tags(env, toaddr, 16, *mtedesc);
         return 16;
-- 
2.53.0


