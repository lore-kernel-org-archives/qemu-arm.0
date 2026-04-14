Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8047AF531DF
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:55:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS3M-00021c-GO; Mon, 13 Apr 2026 20:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS3K-0001ni-O4
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS3J-0000RL-3i
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488c21c636dso29754415e9.2
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128092; x=1776732892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHW44GHNwYo//iL9S+vNgBtIZBRoswNn2La2YETdq+g=;
 b=PbSCEJtjKZT+5bvc4i4kH7rPPgA7z/NaxzSesr+u6wP069oMPEn5oaKhemhaztXHK1
 dGyTwzGm9/MX0P3wcdzQgMzfFwjYtig0RsvrUZboODOqNDgl01pfoWYq+lp45SBjjjsy
 uQWFeQn5qHtZVWNLXzO23oNsGMqsvesGxQ+QFDNDV6cI1AJceufWvI4YzCKCurq5dXkM
 HLaeMss8RR/DYN4s2mawiOUNHu1JqQvXJloNVwupDg7kp8bAj6Y+qycC2VtQNoypXmwH
 wvSCMv/jHS+YlIZFMQq4Og8GfAwfzHKxMW6S/HfQ0qORnvxzFpIa1Ndq53NxJNbot2lz
 Rg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128092; x=1776732892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cHW44GHNwYo//iL9S+vNgBtIZBRoswNn2La2YETdq+g=;
 b=j7a2djE1A8dzj1/i1kJ6VFypaZvrY7X4Hgx7UjXHDfIg8EaaQPSa0OsNnfqi4ploYr
 Md5uEifKUZnZW6B+z5e+EifiQ9gpp/ZZiNXWXMj97bsaTb9vPilhLSH6g3tT222ivZEd
 I0Mb9W5PsdXvZ1vpVIbvplPBIk9gki7XoG0lMvM8L5V3GX/bgVXCDea/rSWomkY+zRTZ
 mrnYaiUE6NF92XTSjHVpEYXbnCaRHVLb/BG5ymq16oqiJdE1D4RihXIuR309hZQnTbpq
 r8TlqDoAxtmqFAW6GtkW040chTXhHNtfHpqgc7R7qoafbjS2q+uoPFQKYPUyMzpOwQ0/
 4bKA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mXIA5ueK2MrEsYNgpzMsMuoMmWm2qPKJkA8goFHLsVjosFSEiReij9ADrBpvBSoLZTTDdnnYWow==@nongnu.org
X-Gm-Message-State: AOJu0YxTtLuZRkN2RCxhHaK80RsJqO3kjiJcqJg+EvxyPRvb0WmeVwZZ
 KxmwBY+ruC46oNxRYaPWV61jz66hgVAH7uy1LVs2PYsavofMzzEkW30J1mrXlKYgmjs=
X-Gm-Gg: AeBDieuFR62W1ZfrX/rsk0igxCc4iwru9PRGTSkoDvxLx8cCVpBNKvrtOtZJTWYQsYQ
 uNlOdCYNJRgLkS/G+5oxfiMLTMw9r5kbJ7Zt14GFDlbLBstYJ9pUPoczgixTIGwBItDwzyJuwyr
 5VCjkbTsJX/kPbS7jqnxT7ORESmV58pfMN1GnYnmD2Eaya7l/8o57PnXbvJ3aBpFyQWGrjuqyPc
 nId806tkqL/4sg8m9YNvksawkg631GHQ1H+eJRbLsuzUbxb9kmSbt6VbQ8gOz1hPXYkM9rAcsPn
 UR9xJ0DlnMjTXP7ti4oT/INs9QLU8I1OnxHXtf+yddk8YCoQ7FvTzlbg8a5v8JKCPPMv2Zmo+Zu
 7vDiuqRh22+B0D8VCqDRG4hqGMMwtYvHz72WIdpjaYEBqjx6WT4F3vKOJZRR0LuVwncRz4Rd7le
 Mv4YNMx11LSV43xGgzNhJJXrXF7Nr7m/CdRT5lPGVpIeKH+9hLt3PEVhVfA2+jrEhPQMxGa+/NC
 R/Q6T23b38=
X-Received: by 2002:a05:600c:474c:b0:485:35d3:ce59 with SMTP id
 5b1f17b1804b1-488d68101edmr191625055e9.10.1776128091721; 
 Mon, 13 Apr 2026 17:54:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488eddb9751sm12940005e9.0.2026.04.13.17.54.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:54:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 8/9] target/arm: Replace MO_TE -> mo_endian() for Cortex-M
 helpers
Date: Tue, 14 Apr 2026 02:53:47 +0200
Message-ID: <20260414005348.4767-9-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/m_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index f5954ce9bf9..1bec8e9aea3 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -634,7 +634,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
 
     /* Note that these stores can throw exceptions on MPU faults */
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN,
+    MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN,
                                  arm_to_core_mmu_idx(mmu_idx));
     cpu_stl_mmu(env, sp, nextinst, oi, GETPC());
     cpu_stl_mmu(env, sp + 4, saved_psr, oi, GETPC());
@@ -1055,7 +1055,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
     bool lspact = env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
     uintptr_t ra = GETPC();
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN,
+    MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN,
                                  arm_to_core_mmu_idx(mmu_idx));
 
     assert(env->v7m.secure);
@@ -1131,7 +1131,7 @@ void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
     ARMCPU *cpu = env_archcpu(env);
     uintptr_t ra = GETPC();
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN,
+    MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN,
                                  arm_to_core_mmu_idx(mmu_idx));
 
     /* fptr is the value of Rn, the frame pointer we load the FP regs from */
-- 
2.53.0


