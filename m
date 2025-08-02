Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AE3C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:40:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLjp-0005QS-HI; Sat, 02 Aug 2025 19:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLi6-0000sV-8C
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:20 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLi4-0005A6-8n
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:17 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-306e88f0b0aso894214fac.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177535; x=1754782335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=959M7Q6IuKP+g65z4hBcFTVaco9+JWPJ3YTIq2edbMc=;
 b=MlsJZATYMYbHLGfHRWpOhbYToxoktG5Disa6nEDJgMTSvw2+VGa6cAvYBJ3zCFgx2x
 8hxqjpPRpG+RHW5jQSXWaMfzYimpoy7Ghx+fU8dIdsz8BXzg6ipcYWrvAvxV4JP8RQM1
 bcDjjshtWjhRLYjxlgRjIawZtYalmTYuNjVOGfWfq3c1i0FR3ka8W3AvLHVZi7QzcTB6
 DgXLtvVIrAHwHD8JZKesQbI9BfW5N/BmKORTPtDNNTommtdBBiVL5aUxvyclJfMQdFLP
 hqHaMoOCzqAKGKJJFwS89STSazxG0h0qMEngsEs+vadB+AtyzE65mieOlNzFnS1fiLTI
 DPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177535; x=1754782335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=959M7Q6IuKP+g65z4hBcFTVaco9+JWPJ3YTIq2edbMc=;
 b=Fk7THhYgHtJKHRP22m7EPMnHoNRvpOJNlne1u5RiMBy5wav1FMW7vRekN26tspzhJB
 Fuk99zNFKBdDpiNDGDVfR/eg1W0ropDVfknQEg3U3Lrm/Fzfn3EELm5jUj170GEL7IaL
 L+Bx4vmImQTwuCeTueUFHziu3Zs4rV4sEVk+gk2CWbZSy5u3NKJHrxkx2X2ACZU1tsgs
 7SMJX1Xf7JCV+r7rc/bk1Fj0aDWtMaBBFidMVRDIqhNXt6jqIHdFvxdusgFKIF61+m4v
 NN0Bf/3cH9R1duoXRO7+nJIC7qdwGs9Ja2npsaZ7LTr378QH+jDQl2p+STbEYi2L1g7q
 j8Jw==
X-Gm-Message-State: AOJu0YxgrtG8D/pCTF+Stu0lJohKpohT/wRFamCJWwyyjbrzanW7kif9
 Gx+GnUzlEcaPiNg6NDK1FsK07YZDQgLVrr2ZVm6ZxQjmA31HzxGPYNgnCx5j0ThHQIM=
X-Gm-Gg: ASbGnctcP9RXwOz1A9vGOURZO1qImvS0zJkgkLXPYK4E2YiEWclt9BcXh2dPoPqfYha
 7VRb4AGbhRT87tgDM/Nebbt2eXuU0RsxVxg0z9NMaM95b/TouawfbKhxthJ3lEMoT+zD5D+IQFM
 bLyjCDvvwn6qyBoF9Nz4X07xRYO3VGcAF9skCZPBFQa9ghaVSAJFXXGGIkdIFrvu620FvQHKfZc
 IAmjkB7ddsem1VEUf1zFHAU7kjn/7zQqnrtInMwuhu7SOqbEeQoiN7gis1ZeX4rMcrEhAYZigqe
 9c7iBmMHgMVNJsrQVAaNMK0UqRVU8ybf6pGM1QXeMa3zWQ48E2oG6WoU4GYza2mKWbZj2jJt379
 dEosAPvauQBECHtRt3GG/+d0SAD0Lvpifvxbh7Yod3vDoszPYLCCd
X-Google-Smtp-Source: AGHT+IGY+fVi2+ldJDyqTOHUDe5qcjUcbmXULIvVhC72cV+g1+sVHiEmKjnPOz6iBG9VY32gn7HydQ==
X-Received: by 2002:a05:6870:b289:b0:301:a823:9cd1 with SMTP id
 586e51a60fabf-30b6793c06emr2353982fac.22.1754177534856; 
 Sat, 02 Aug 2025 16:32:14 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:32:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 28/85] include/hw/core/cpu: Invert the indexing into
 CPUTLBDescFast
Date: Sun,  3 Aug 2025 09:28:56 +1000
Message-ID: <20250802232953.413294-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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

This array is within CPUNegativeOffsetState, which means the
last element of the array has an offset from env with the
smallest magnitude.  This can be encoded into fewer bits
when generating TCG fast path memory references.

When we changed the NB_MMU_MODES to be a global constant,
rather than a per-target value, we pessimized the code
generated for targets which use only a few mmu indexes.
By inverting the array index, we counteract that.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 11 ++++++++++-
 tcg/tcg.c             |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bd835b07d5..23eb849a9b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,9 +594,18 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
 }
 
 #ifdef CONFIG_TCG
+/*
+ * Invert the index order of the CPUTLBDescFast array so that lower
+ * mmu_idx have offsets from env with smaller magnitude.
+ */
+static inline int mmuidx_to_fast_index(int mmu_idx)
+{
+    return NB_MMU_MODES - 1 - mmu_idx;
+}
+
 static inline CPUTLBDescFast *cpu_tlb_fast(CPUState *cpu, int mmu_idx)
 {
-    return &cpu->neg.tlb.f[mmu_idx];
+    return &cpu->neg.tlb.f[mmuidx_to_fast_index(mmu_idx)];
 }
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index afac55a203..294762c283 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -425,7 +425,8 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
 static int __attribute__((unused))
 tlb_mask_table_ofs(TCGContext *s, int which)
 {
-    return (offsetof(CPUNegativeOffsetState, tlb.f[which]) -
+    int fi = mmuidx_to_fast_index(which);
+    return (offsetof(CPUNegativeOffsetState, tlb.f[fi]) -
             sizeof(CPUNegativeOffsetState));
 }
 
-- 
2.43.0


