Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6A0C87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLwj-00031b-Gg; Sat, 02 Aug 2025 19:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLrw-0004To-QC
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:35 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLrv-0006sB-9s
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:28 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e8e14cf9e2aso2812630276.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754178146; x=1754782946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mn1fK5l3yCLKQ4lorT8vlvbr/nAjsRIkl737awJXwL4=;
 b=FMoQagPF/kptnQjqXSc/DbxrJ/yzLftiH7fMIhFOT53Ll6sKsFEWZAk4YeXsxpqXTA
 Xgnowh4nOy3yqdBlrs8Q5/qbhuJDPByvk2vVrSD1dBckq6T9F/nS8ar0sugPKPpCCi95
 4plyr6cxclpw7sgU71HkQ73geV9FfZQb3ex+X4kHku6sm8Wt41/79yQFrS8BVoxV7TAo
 pqPU1pKSPE4PcTODr6KhrlfupwRyRHo8EfMCYl6bUuqM5DvoDWttiW+1uSlcmt8FSMbT
 OkpAmSg1QRqmwpCNajwDRMdbJAOXGK+qvERxagrlPbJg6SXmSl1Q/4CyhXq+REhnC0eF
 qi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754178146; x=1754782946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mn1fK5l3yCLKQ4lorT8vlvbr/nAjsRIkl737awJXwL4=;
 b=Tuty09vlfbWz1rPmv8bi6ytIiDjaCm59a013c4dtYZC6aKpJMzns2IbnUGvmxwJUCP
 qofrb98QNIUON+GxsRVt3mPR2gTeJNom01uHH6EadKQArWzTdGizbzHCaNJgJ3XepsUq
 cNQVj7hWV4Cvx/7XOqbrazRHhzqxIiNrBccWR2sTcxrfoEcv3USFDkRLZqWJiYxgaqmX
 cKGn9rwaQcZ0FVqL9IHt+t+JSF6J4BucgbsktQpWtEJaySAgFKwR3GEQSKWKUJPunHnW
 I8GNXbUNTALKjHB91Foh+I4/YGoymcKku87uI9dDnEWosefQilA9P6EXcFdBuwKT0W9k
 PhYg==
X-Gm-Message-State: AOJu0YzCqJh1UZ8Jrqc2sQYxOKZxhBHcZ/glfGjK9dciNU1Zp2n9rVzZ
 iXqH0AAg6vxgsDCjZdeM25QNKGsKMgT1ox9pGTd8zmR0SblE+c7rMjsPPypspewzSeA=
X-Gm-Gg: ASbGncvkssGVij3OV8zO1pm2Pzz0LCxtLQAs6YBaEHTMeXo1WIdd7LTvbPh9rweTHA4
 Ac19298Ui1NbYCVnz1U2Mx9M7dyHFBurnLoIzK3dd0jMO4WbjWqvC3p/RhQWwiffq4em4c/dKsl
 MvoacWVWFEcp15qR/zQ8JOE56HZuHqMYEA0zUoUcdy2lEiLmcL3m5vYwBeB65QHTXusZ/0HHVXk
 jiQLBbwn2TNhjJ1FXS08GUaBKgP8REOetBxdWpR8Ss/0gxKMm3aDCoThhUTxJWUmFDO2eNGpsFm
 MEK+oBoFVfmJtDaklqKFQyqnCCADdecqQbjJWdKbMuIjrWZb3pG36UKdg5JMjHHv23G9DaYyfD/
 SqLgN7c7JRwTZI540mw1hHlrwuEgH7ATXIBklTu3bQvwjcFA/eYTxxBky3vvRGCE=
X-Google-Smtp-Source: AGHT+IFOq8CxVLu0H363YNAcS5STFfcNfrykWc7MhpYsZbR2WCOwTRF5jFjICzn/kIuETJ5Bg7eyig==
X-Received: by 2002:a05:6902:4388:b0:e8d:72d0:9733 with SMTP id
 3f1490d57ef6-e8fee1ecb03mr4836191276.32.1754178146249; 
 Sat, 02 Aug 2025 16:42:26 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a423f38sm18461527b3.40.2025.08.02.16.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:42:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 81/85] linux-user: Change exported get_elf_hwcap to
 abi_ulong
Date: Sun,  3 Aug 2025 09:29:49 +1000
Message-ID: <20250802232953.413294-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2a.google.com
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

AArch64 is about to add the first 64-bit hwcap bit, so we
have to expand the return type.  Since the only user
assigns this to a abi_ulong, match that type.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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


