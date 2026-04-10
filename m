Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE9CF45A08
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 20:08:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBI7u-0002MK-IZ; Fri, 10 Apr 2026 16:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI7l-0002L5-Qx
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:06:43 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI7j-0008HC-PL
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:06:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43cf5ad500fso1987047f8f.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775851597; x=1776456397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxdCIiLVf7pGRaLAb6KWkvzy9CBgc5YtJ1SBCrwni7Y=;
 b=cNGk8eJNblYrFEPAdv6/pAdDC16Ryk5s/qNHIBv4RIDFJsdJ7zlmoIIu/vIbDsyBPH
 uq81LFE2ltSbQNn1mV5XQLlFAPs8D7EgcIovk50l5rBeOcQaUIvasnTx6LVfJsah5Lpu
 3f8PpQ3rw+btSql1wnTcUUQgNxetcSVKgnSSLs7o7EREID1wBjR4Rrd1rhNYtdkIhye1
 Da4YOzUJEhduBPm+LOok5mg6qEk4cXuJcOGOTua98m/ls2XhvEAGr5BDQl4grYFHYegc
 rfByD4ymJ8Q5LTm9udqNYVEyqKgkuSaXnaiXWioNlDTZtUOqJVRqHtDlf+npw1moqBms
 SvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775851597; x=1776456397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MxdCIiLVf7pGRaLAb6KWkvzy9CBgc5YtJ1SBCrwni7Y=;
 b=QfizKj+zW2JIijmH7hiT54y+udAmiGsGHm7C1eSjSCDLhjZPKJqjJloQvtnhP33Gu4
 pixQBWeQyZbIPHG03u0UrSKxrK4ZLKKXOyngPx0JOY9u/BrZR71xtcYsopwPJt8l6T7r
 BN+9IHzC7MuLi7WWOOIA7iSfaJHW2MAerBxLD+tgevItmF0NHZVEuB2vb7/jOuLTERV7
 joitb2/8nKU7OvmUQF5KNSrvS4lguhMd0x6JvvyOgcjoRuxf1UQIeGTYBFvRQRKs92dj
 D0xVXl+4UzREawFeyLTpbtPaR8+MEFXxFp1XSrmNDsBrCwgcPv2dCghHKCxBO4Iwd7u2
 oKrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXKjcY7Zsf8eZ8ZSpBwN78MKeBNKo5YtCmOLmI1JUIa9lSTpylHBLxiMkmpzKUtwfwh6iKKhSBXg==@nongnu.org
X-Gm-Message-State: AOJu0YzkDJy4F02Cb023qLIO8CHPNQsD1oyrptQ+mkvktV+W14Gdcbm0
 uVKvq4Y5o/VWRxvWwpK1+OKOWw0rVYYtP0jMTeVy9IEiPRBUd6ambjY/MGls2QTQ7fY=
X-Gm-Gg: AeBDietjVGgdZGvVZS71xWh2zPAK1q+LJRgkWcCyqsT3fcK462kR4jZr/AVgmnKu5WU
 ebIZBZ/15NHO7rtM3YEiAseHHe00ttUHD+kucZFiKdchhoZgS29FVSUvfB0kz1TJrXKeJM03ddB
 O7KjUABrr2VsN8cKlzTGYb7h29uINmGkpWfWjK0KIw76RGDDu79fyVitj/VD7xnmQJHt++VENV3
 0NLvBJpbqQG3zczabVlr1noWHad3UUJiVqTaDUociRRaJ4IWtlHNSJggVyUolMjOHTwd7tR7UoN
 OnnYUWA7D675sAo9dlHjflcuGORQnwSXZiw2FxNq+eQkoHGSS+rAzIDmD0jAYg3ZU4Sr+C8SAHK
 nlHti9gDYdVRjnfV828m/c/Cyd6VfsTtj1ewvHF7n4p/Juhh4W+Ll2hrPqP2+F6JEUzBqFk5+dK
 38mz3buHREHsYtZqbQ2bhkMC3rcU7g3EEpmAWb0/4EC4tzmm1ZzAbGpjXZe1FuDY4FcWx5bwzNN
 6kgy4ZOFJ8=
X-Received: by 2002:a05:6000:2489:b0:43b:8f04:2ee1 with SMTP id
 ffacd0b85a97d-43d642c4ee9mr6675157f8f.27.1775851597158; 
 Fri, 10 Apr 2026 13:06:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5ccdasm10358700f8f.34.2026.04.10.13.06.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 13:06:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] target/arm: Replace MO_TE -> MO_LE for Aarch64
Date: Fri, 10 Apr 2026 22:06:20 +0200
Message-ID: <20260410200628.19378-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410200628.19378-1-philmd@linaro.org>
References: <20260410200628.19378-1-philmd@linaro.org>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/helper-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 2dec587d386..dc3c8a036d9 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1019,7 +1019,7 @@ static uint64_t set_step_tags(CPUARMState *env, uint64_t toaddr,
          * the page dirty and will use the fast path.
          */
         uint64_t repldata = data * 0x0101010101010101ULL;
-        MemOpIdx oi16 = make_memop_idx(MO_TE | MO_128, memidx);
+        MemOpIdx oi16 = make_memop_idx(MO_LE | MO_128, memidx);
         cpu_st16_mmu(env, toaddr, int128_make128(repldata, repldata), oi16, ra);
         mte_mops_set_tags(env, toaddr, 16, *mtedesc);
         return 16;
-- 
2.53.0


