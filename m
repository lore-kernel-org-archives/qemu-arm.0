Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D5BCA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:51:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lcm-0005Xc-43; Mon, 22 Sep 2025 14:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc8-00054G-5n
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbs-0004Cd-1C
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:15 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-77716518125so2449396b3a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566998; x=1759171798; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HidgR8YbdGgwoHKVV2oZVXdM2RMQ3ecG9VGCjbLMY1s=;
 b=hFS9XJylgsenpGO6uMkh8PMcGh4z5swIi8+qjIH/YX7WHpKFWA1ed1gtctls2UzaLq
 Wgw/Pu3JTRVPAw1spggV/16qH1ArdUCdwjZ4RoHSmyONMYER7hIbfX8FpqC8yJAXRidY
 UPeZnDLF5lYF0oF3n17NGFylAxaqoAPbzMnZ+th2s5ajZA7mR9RsBKnr79egKZVUgvl+
 MKbVsrPisMZD1zj8ZTrT/56ff9wJepMUzVLQAjFjXI0+dejgtSl1HZKZh/hQJuspasfQ
 NqL79oSUsnzzBPnPX3/dB9Uiw1v1aPCQGFe983JI4ASpUFuAv8YPfVSRb5iHuP8V/xXp
 GQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566998; x=1759171798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HidgR8YbdGgwoHKVV2oZVXdM2RMQ3ecG9VGCjbLMY1s=;
 b=VBKJvaKJts6dT+LIHAkC8FYKbM27v/bZ7lBbe6OKC+lOObO6Yw7rAxBLtn4cc5eG/m
 qC+iB7bk7d4FeOaCeq4wxRkAD9UVrvA2v6LkVWiwaw6QFg/2e/JuFUTMejXE7hamqb4Q
 HLeWfpG/2fVSR0oU7ARxjmu2+kg6uYBDkX1UsxtJH0AI0Mv8cVqlROI10YWons346iF8
 bQcTb2CX98JnnVC4iygZYMmQU44EpZtiEnBUhZgIbg8+WN2cm5gL+qnKZOCpIar7ufR+
 g+ULfrOs8AGqXNzeKLXziMNLgr1yTybq0Dw7ibbbfwibTXCjAGCckZbE0TYemG+Wx8bj
 82dw==
X-Gm-Message-State: AOJu0YxUHBYkfMvY5Z7o7hk+ctqvYujmOE+7bv9+jMnOU516AvIirSsi
 5/2v+XL7F81wb6R0fRFiz7ZTk3E39XziCjPjcreyhgUfrfyEFKBHTqdAj5P1brqHfDo=
X-Gm-Gg: ASbGnctlC+6RWaI9ZfBn0eA8T63dzKyOdrUCswJWcFOp7HKb+9wpEdEuDmALJ7BRzV+
 ORu3217jtODCQAdNs+hLPCbSynJCK8ghvvnlUu+DAwNFMoTu0NR1EidrqOwXg7lkea8YziIz0X2
 ZMZ5DCcaeV3IzfPTFGSKTugqtSr4UOT7Q3bftf2Pl93XiTVE+EYCmQ1HtdTUc9ySr1eYAEJ0FFr
 DGCwkNKv9UsGuqn20SThZWalUpKkVo/VcRcpuLCuH9MdTcnFoeLGTjH0vRrMlJQkkfehRB6aZAx
 lqsvW7AauuTzyrm5FCG9lBHc8njWq2N5Bk+a6UaltGhuaV/gSy7/MdC27Cia5+iJUx8TC7amYF2
 Pxe0L9MieVS2kj4UfxxQdL8Yr9UOn
X-Google-Smtp-Source: AGHT+IEz49kNzWGti3Us/0yjyZzEpNLwdomoQLQFyFMC90XvzhCEeZzjsrGNFZcfduEuXuW6QybXww==
X-Received: by 2002:a05:6a00:23c3:b0:77f:42d5:b914 with SMTP id
 d2e1a72fcca58-77f42d5bb6amr3565135b3a.12.1758566997680; 
 Mon, 22 Sep 2025 11:49:57 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 24/76] target/arm: Remove unused env argument from
 regime_is_pan
Date: Mon, 22 Sep 2025 11:48:32 -0700
Message-ID: <20250922184924.2754205-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/ptw.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a25ef90c4c..b32c31779c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1027,7 +1027,7 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
+static inline bool regime_is_pan(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_Stage1_E1_PAN:
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 622b5cf520..db51e55cd2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1393,10 +1393,10 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
          * We make the IMPDEF choices that SCR_EL3.SIF and Realm EL2&0
          * do not affect EPAN.
          */
-        if (user_rw && regime_is_pan(env, mmu_idx)) {
+        if (user_rw && regime_is_pan(mmu_idx)) {
             prot_rw = 0;
         } else if (cpu_isar_feature(aa64_pan3, cpu) && is_aa64 &&
-                   regime_is_pan(env, mmu_idx) &&
+                   regime_is_pan(mmu_idx) &&
                    (regime_sctlr(env, mmu_idx) & SCTLR_EPAN) && !xn) {
             prot_rw = 0;
         }
@@ -1535,7 +1535,7 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
             p_perm &= ~(PAGE_RWX | PAGE_GCS);
             u_perm &= ~(PAGE_RWX | PAGE_GCS);
         }
-        if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(env, mmu_idx)) {
+        if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(mmu_idx)) {
             p_perm &= ~(PAGE_READ | PAGE_WRITE);
         }
         perm = regime_is_user(env, mmu_idx) ? u_perm : p_perm;
-- 
2.43.0


