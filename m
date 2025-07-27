Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62856C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:22:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwSN-0006dK-76; Sun, 27 Jul 2025 04:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPv-0004gs-Na
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPs-0004w4-HJ
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:35 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso31850005ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603650; x=1754208450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9biC4m5Z/jWTlu3yNFuyIx6JyDKTGnmYvdUOQcfLcyY=;
 b=UE691dt/eomuwxuLQ1b8lIyKMSH/7w1CZJVZR+0ypovHeqReSlkra5elUzhwi+lTMX
 X94c8LzY4TwiBtjLLUBINQzZjuYRxBQE4+iNZJd48aK+CeWvjfm7IdHj3M0o3owY16V3
 svj2lOzQwE8BWEtke7YJJjkOZhexi/ew5DkxhY62hZ3XKPiNNB+80HwB/A/0wR/I55B/
 7U9jGmUrhrCqaVZY+ie2/wNZ/K6rmg4WBOy8WcelRehE1hUMPUxTsbQd01AtMESyrXhY
 KuNIV7OO8yLwxl2P9bfEss61obBjXNdoxBvtEJ1QJudzg36cO056LbADwZY4YTLUBrSD
 OzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603650; x=1754208450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9biC4m5Z/jWTlu3yNFuyIx6JyDKTGnmYvdUOQcfLcyY=;
 b=JzYswAy/qkIekP+9F/2ydWZqt35TmNwQjwU6uaOT9X1+dARa1BjJXThRh15AdaaEMn
 8YX+TW31L8z14n1f2+bsJFmRILmt36x2HNSI0lXnFnm4tWrlXP2qK4tlXzPtqlyyn3p9
 aKmud78b86ShrplI/bW45uHIgSqeQ5855ZKRySp6qDsIrbffd0aDslKKY+h8xk8wpJa8
 LY07lqStQs/zfELsKpNUKuuAysv0cDp2fPf8k6qzLX2XUnTbUYte47Rj1+W7YqOEwmqP
 88LwdEr3IgQ1zxQ0fiIEUVU9wTk1pfAYZF03gz3292HXCTB7BCcB1SaOe9U3Ae8O0SVQ
 28OA==
X-Gm-Message-State: AOJu0YxIGnXSX2k085nrbTyRdLUF5lWX+UoQ63RSDuTkWvio76EJoD5F
 F0WpHAorsIG94stTGeVTU0n4orjs/9PF1Q5j5wbtGt8wF0ZAshgPgt23gMHxkUh6JFI=
X-Gm-Gg: ASbGnct2O/1bKYj0OQQXpg/nr8gsa0qUxc18zkxbnteIVWeW/UeP620fbz6Mb9HzXlV
 iAd00Y2lmblJqslnyHA2BgLWoJ8IWDdm/VDNrcESLVZ866Y98BYBiIfzbo+GWH13a5RtHqp8BEo
 5MNqRvO/cpYBe8sYg4P2ftkEaJFIlkQFQ0m+SK8ljWfwilZkG56LHcRk6+eHkZ7y7oVMVz1xHhQ
 Q0sgT2qTjZc1fE20I+yROU+WAQvS4JTFOT+U60CbOEno6PNMISgkU9Z/oHVmerEhYcFXPncgVr1
 LEhhsYeYqbyVjJtXaC254LkJZD9lZQcdn+HOzhqHs2JEPWyz69IoXd257QdYW/UJ4cKh3QbMs+u
 9EiUkq0d9azWXXXRI1vFc714WfHLVQhHnrFijHslbITH4M9qOVbcQq7ILL5z9IhYYtTryhBLXCN
 99gHfTkE1oMtvSCeqrJL+q
X-Google-Smtp-Source: AGHT+IEg9NX2MMOvAdB+/kV0mFV+vFeeiO2FB68ptY+7GX9OsqPm8d7rxf23vuBeIp+S+FdsVOF+hQ==
X-Received: by 2002:a17:903:2f87:b0:234:8ef1:aa7b with SMTP id
 d9443c01a7336-23fb3085301mr105934895ad.20.1753603650251; 
 Sun, 27 Jul 2025 01:07:30 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 78/82] linux-user: Change exported get_elf_hwcap to abi_ulong
Date: Sat, 26 Jul 2025 22:02:50 -1000
Message-ID: <20250727080254.83840-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

AArch64 is about to add the first 64-bit hwcap bit, so we
have to expand the return type.  Since the only user
assigns this to a abi_ulong, match that type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loader.h  |  2 +-
 linux-user/elfload.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/loader.h b/linux-user/loader.h
index e102e6f410..e1badd4393 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -99,7 +99,7 @@ abi_long memcpy_to_target(abi_ulong dest, const void *src,
 extern unsigned long guest_stack_size;
 
 #if defined(TARGET_S390X) || defined(TARGET_AARCH64) || defined(TARGET_ARM)
-uint32_t get_elf_hwcap(void);
+abi_ulong get_elf_hwcap(void);
 const char *elf_hwcap_str(uint32_t bit);
 #endif
 #if defined(TARGET_AARCH64) || defined(TARGET_ARM)
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ea214105ff..d87d1a16e0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -511,10 +511,10 @@ static bool init_guest_commpage(void)
 #define ELF_HWCAP get_elf_hwcap()
 #define ELF_HWCAP2 get_elf_hwcap2()
 
-uint32_t get_elf_hwcap(void)
+abi_ulong get_elf_hwcap(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
+    abi_ulong hwcaps = 0;
 
     hwcaps |= ARM_HWCAP_ARM_SWP;
     hwcaps |= ARM_HWCAP_ARM_HALF;
@@ -841,10 +841,10 @@ enum {
 #define GET_FEATURE_ID(feat, hwcap) \
     do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
 
-uint32_t get_elf_hwcap(void)
+abi_ulong get_elf_hwcap(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
+    abi_ulong hwcaps = 0;
 
     hwcaps |= ARM_HWCAP_A64_FP;
     hwcaps |= ARM_HWCAP_A64_ASIMD;
@@ -1824,7 +1824,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define GET_FEATURE(_feat, _hwcap) \
     do { if (s390_has_feat(_feat)) { hwcap |= _hwcap; } } while (0)
 
-uint32_t get_elf_hwcap(void)
+abi_ulong get_elf_hwcap(void)
 {
     /*
      * Let's assume we always have esan3 and zarch.
-- 
2.43.0


