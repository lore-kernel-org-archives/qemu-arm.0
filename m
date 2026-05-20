Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF84FCD4F54
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 12:17:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPfrB-0007Os-7i; Wed, 20 May 2026 08:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPfr5-0007Ne-CK
 for qemu-arm@nongnu.org; Wed, 20 May 2026 08:16:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPfqz-00007h-BP
 for qemu-arm@nongnu.org; Wed, 20 May 2026 08:16:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-44e1ebb3122so2845070f8f.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779279407; x=1779884207; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1iwcJSNrUOiyTxOxV/al4D6PTsQbGMkX0qhlUuJJR8g=;
 b=l7iF/mLzHiUDy8Y4DPeWsHrET6/VyFJGV5zS1NVw1peDDtrx/fEXD4xauKKAYExmqC
 ScNdeByQjZVbtg4Uz+1Ye3OSHhe+iG8qGz2ixEHVZNB1PbnNKgHn9+626H14HtDjKvQp
 oVz7mKFTFMXpplzjljE4wfjGJzwZ3/0u+YSJKBJYOa5ZNCxHOXYHgoTUX6AlchO6u16n
 9HSu1tqvjqQ32O8miXDsU8qvP42f9fsGx1mMrf/2sK9BihjiAzqyeLjWyIKQRX7HwsQh
 YdV+R7p7k9SgUBK53mm6UJyDOaYIjKBo9wXc8kWy5zgtc1sM3MM0uIq6cSrqD4uzgqer
 aLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779279407; x=1779884207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iwcJSNrUOiyTxOxV/al4D6PTsQbGMkX0qhlUuJJR8g=;
 b=NjwzoKaRonqtaxX6sQ6nzlmUjgnorF2crymZ3iSKPLh8LJkKVKGOXtcYorOiRlQGTH
 UAdphXarjPgyZvzNv7oe5LpT949UGr5f7XDJkmWnSZUU0ZJ3sizKvXOnMzDaNxVXuUZ6
 J+GiZllZF9myz2+PyIKAt1WiWYrcw+devu9ILxLL4awAzXkRaJc6epnikp0omOCJiAaZ
 4npzjg4cxH4tOlVKWeufG65c88kG014ok5vm4duqbikIQ7E1wITQxglAQ3Lunh4XKy6U
 P9U6XC4PmQtIgvCS6J4PMpdC+hzblFr2FfI4Ke94nA5Io3kEYeRlc0Yzi5jZDwj1fstU
 /I9A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9kJIatfLF380cTfp2Fa3I3JLECoUxZ1IzLOrKLRqYKgNiQhSmLCCYKcDVurD4VfloKtLybRjEudg==@nongnu.org
X-Gm-Message-State: AOJu0Yx8NpcEh9xqYQWZOF4cc29Uo5ba71f1j/bWLuh8oSPaVO4IYcVR
 GTPUxmEzGMtjA593LylfOYB50idchW9B2YuIRPff/CoUtUcSQ4sqTn+GDMylRsgHYbs=
X-Gm-Gg: Acq92OEehv7tiqoqN6BuqMppMgSKAHGVli8pAMAQAXwbiukyEPSjnPuXvk0YbJ9KK8e
 2T2QgU+VvcxIa5oRTU/8yY5IaR04IDBvl7A4vHjelCDi2wkROD4kNa1Ll8yKe8d83zhciOSPii9
 u01dgaZGeuYRecDOLMk3cdAApbcEhp8dNqqGHmuIOWnxziX/EFUqgEBS/tp9Lz47elBw8hPP0iE
 1zd+UFa7Xf8myjcIJ0+IxTTqBCVzolnNexoBdoMjJvnlsD/Dt2jOlu6C0A6vLaC+2XvZuPzD3Kf
 NV++1zWGa7Kz5sSws5TdjayGm47EzqCWk4jrSuDIZ0KwNrtv89gTbhGIzhsML5OYyiU9btnVLFg
 qHZRgvxl7J4V5hod+hGxn6G1sUeftR9lWz2ykUdxn7Xuf82eONBspf8LUT10RlSkSls6iNuHhLd
 L/Qcs66bXMS2Zw0L19MfX62ATx0V4x6UVCWLApChUUFPGv4vqoX6mHePjdxy1fjnGsHyqMRoUCD
 0KM6g==
X-Received: by 2002:a05:6000:2311:b0:449:a07a:967f with SMTP id
 ffacd0b85a97d-45e5c587a90mr39133222f8f.28.1779279406910; 
 Wed, 20 May 2026 05:16:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767ee0sm50219449f8f.1.2026.05.20.05.16.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 20 May 2026 05:16:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] tcg: Factor tcg_zero_i128() helper out
Date: Wed, 20 May 2026 14:16:44 +0200
Message-ID: <20260520121644.10835-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Extract tcg_zero_i128() helper for re-use.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/tcg/tcg-op-common.h    |  2 ++
 target/arm/tcg/translate-a64.c |  6 +-----
 tcg/tcg.c                      | 10 ++++++++++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index e02f209c093..aff99754160 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -18,6 +18,8 @@ TCGv_vaddr tcg_constant_vaddr(uintptr_t val);
 TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
 TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
+TCGv_i128 tcg_zero_i128(void);
+
 TCGv_i32 tcg_temp_new_i32(void);
 TCGv_i64 tcg_temp_new_i64(void);
 TCGv_ptr tcg_temp_new_ptr(void);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9a27c4c6ec7..506ebff508b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4804,18 +4804,14 @@ static bool do_STG(DisasContext *s, arg_ldst_tag *a, bool is_zero, bool is_pair)
 
     if (is_zero) {
         TCGv_i64 clean_addr = clean_data_tbi(s, addr);
-        TCGv_i64 zero64 = tcg_constant_i64(0);
-        TCGv_i128 zero128 = tcg_temp_new_i128();
         int mem_index = get_mem_index(s);
         MemOp mop = finalize_memop(s, MO_128 | MO_ALIGN);
 
-        tcg_gen_concat_i64_i128(zero128, zero64, zero64);
-
         /* This is 1 or 2 atomic 16-byte operations. */
         tcg_gen_qemu_st_i128(zero128, clean_addr, mem_index, mop);
         if (is_pair) {
             tcg_gen_addi_i64(clean_addr, clean_addr, 16);
-            tcg_gen_qemu_st_i128(zero128, clean_addr, mem_index, mop);
+            tcg_gen_qemu_st_i128(tcg_zero_i128(), clean_addr, mem_index, mop);
         }
     }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2ca44766f64..71c2500ab14 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2265,6 +2265,16 @@ TCGv_i64 tcg_constant_i64(int64_t val)
     return temp_tcgv_i64(tcg_constant_internal(TCG_TYPE_I64, val));
 }
 
+TCGv_i128 tcg_zero_i128(void)
+{
+    TCGv_i64 zero64 = tcg_constant_i64(0);
+    TCGv_i128 zero128 = tcg_temp_new_i128();
+
+    tcg_gen_concat_i64_i128(zero128, zero64, zero64);
+
+    return zero128;
+}
+
 TCGv_vaddr tcg_constant_vaddr(uintptr_t val)
 {
     return temp_tcgv_vaddr(tcg_constant_internal(TCG_TYPE_PTR, val));
-- 
2.53.0


