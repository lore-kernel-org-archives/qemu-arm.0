Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8226CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:04:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbr-0004r3-Ip; Mon, 22 Sep 2025 14:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbq-0004qN-74
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:58 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbl-0004AJ-Bc
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:57 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-77f2e960728so1970864b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566992; x=1759171792; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dwXNsvpsI+ev3l1X0Dinc/JnjQKCdGo0MRhCsyBFRqA=;
 b=dKecoTV8MjKPczlOi194es4WtbUA3l1UF4WW1OlGjPmaXLlH62Uf/4LlpizkeZogmb
 PYv3RERNSgpxxdryjgf6L19NEjBgQqwkYLmgu3BupvnmmRDS3T/rQTZce1t7fa9WqPj8
 VTDhFUYz85luGpWcZCnYCG2K7m/ylSCg6Kp8FwpvhGAkdFOz9gqyOkkyuAdrvshpDJUs
 mcwkoPSDGqrijKCFfpeyKMlvCSJZkEMFIex4hUQS69PX4Ktvn+4vEmlnFz9i3fO9hEcp
 P1F0vftvpOtKoJX8xZ1GX9X7iOFal8GWH7+fkH1ReNOEjpj1G4XOP6EJ7hah+de9GRxu
 WiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566992; x=1759171792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dwXNsvpsI+ev3l1X0Dinc/JnjQKCdGo0MRhCsyBFRqA=;
 b=I45h8NNn440NpR4inPjLqheE30wno6Xs5PdsrL+WsrtG1igdxIVk/6VBP91ltn7Jxf
 EPx5tALQ0DZzogrlRIaC6aTiHLZVuizdxUvtg3dGHX2l5Q5pIAyIhDZqmLX5CymxQxc2
 rByVKX/9iVAX8DqXS8wQ/VskHe6hj5sL7CUURyYDWwekA58W0j/LQPLxiM9Elz0+lVPD
 zsdH41Q/7MurHpawPxlzxCiCWR17czoWrf9P2nMkehTUf9liFzK7IdH97wl56LyHKGjS
 mcCzz6k2mL2YbTXrc8eoUHJO3XUGS4ugZe6MxiKFdhr6ZUVmhPYxdXOHXJFD+PTr6pZd
 OEbw==
X-Gm-Message-State: AOJu0YwTIcXIvfIM2roXLq0NLX3P7qsiNyp2JC9Qy99t8leqXwy98LNO
 TqTJLgsCHwNLzx/g2J/QrTiKy1CAA4GyzuQahtLNpIGi9liNJxyAfqTX8BydGsU9ZjuqjNyCIrs
 RaZgW
X-Gm-Gg: ASbGnctO6UZ2q1TLxUkAr6B8VafjV9uq+JBIRueeXEeYg46d24lbpdxZP07PaMT9r1K
 YpGFZl/DpjIQqpxNCKTzY3yAkcHbUVVBfVXFCX6sNV2e9WU1rQoykxX2OGf4T+3nYGznhbJiTZz
 KTkZooYW1fc/SC0a5/UlmWegJKt6Dovmjz0+EdLduEDfmBit6l7VNcMunHvDqhv7G2jx5Zz2r3v
 itbdij2EzoJj8Pius/4o4vOmSGibJsB+mtoto0ef64Tffrj2nNCDyNhQ7YvOmY9TyXIAWC5wKec
 xQ4kv29EiBWF2aR93EA/bxVB1iSram03gtmxizG5REZ7mrUW4E2+P+6t21zftjdXltocqeNsM9j
 voA7dA/dyY92d8LSJG2ztFKPfQHtO
X-Google-Smtp-Source: AGHT+IEPL0u1ll3ZFjgOMl2zDHZVPngTrnSqaXnTj4EuWS0ZeHoSKlrPdKDGDxgPAf6XLeyVIzYQcA==
X-Received: by 2002:a05:6a00:3cd6:b0:77f:50df:df30 with SMTP id
 d2e1a72fcca58-77f50dfe612mr904881b3a.17.1758566991740; 
 Mon, 22 Sep 2025 11:49:51 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 18/76] include/hw/core/cpu: Widen MMUIdxMap
Date: Mon, 22 Sep 2025 11:48:26 -0700
Message-ID: <20250922184924.2754205-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Widen MMUIdxMap to 32 bits.  Do not yet expand NB_MMU_MODES,
but widen the map type in preparation.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 accel/tcg/cputlb.c    | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 89fe937a6f..83d6e9c24e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -201,7 +201,7 @@ struct CPUClass {
  * Fix the number of mmu modes to 16.
  */
 #define NB_MMU_MODES 16
-typedef uint16_t MMUIdxMap;
+typedef uint32_t MMUIdxMap;
 
 /* Use a fully associative victim tlb of 8 entries. */
 #define CPU_VTLB_SIZE 8
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2a6aa01c57..416aaa1040 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -89,9 +89,6 @@
  */
 QEMU_BUILD_BUG_ON(sizeof(vaddr) > sizeof(run_on_cpu_data));
 
-/* We currently can't handle more than 16 bits in the MMUIDX bitmask.
- */
-QEMU_BUILD_BUG_ON(NB_MMU_MODES > 16);
 #define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
 
 static inline size_t tlb_n_entries(CPUTLBDescFast *fast)
-- 
2.43.0


