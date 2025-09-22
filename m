Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAD3CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:08:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbr-0004qv-Dg; Mon, 22 Sep 2025 14:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbo-0004pC-QG
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbi-00048s-O6
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:55 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-77f454c57dbso790116b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566987; x=1759171787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRoS3UC8ynsEV5t3sfVyTe2E9WbHdc5gfYPgW1+H1wE=;
 b=agncZOIFEXRV6BoZVmNDjFhystcd57uVpRQlwVbbLzZxWu8dxYQQv7whCQMdP5SZAs
 m8dxYTyHjpF0+Mjy6wKDfzxMDMPgRE8+CU+v9LrtJDIP7N39sYajTKd3w1k44CxPd5ie
 SDPgg8x3pIDpHr8VwlskpsljMG8LxxpRYtzTqMjvR/aokm9/kr2Xbi14TG3bUrZf3Jrw
 mVwoyhyoqTXHF7GGfOqvd5mBU34qdAvhj2USHhV+7rQQICZVu4BXSpTyvBU1T/yoQZuD
 5Oe9WGr5JLn4F5XaAKC/A/osiWp4L2q9d65EUa71e/Ii7Xa22Oy9/q5L/7RDiUB2aRxq
 7ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566987; x=1759171787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CRoS3UC8ynsEV5t3sfVyTe2E9WbHdc5gfYPgW1+H1wE=;
 b=OtxlE10n6SwOjsg5OaQg6vv+FfWRWqqOmvU2St/0qhd8py0mMEEV8VWd3kMzd0ybRd
 qr8kbX3MDwb72k4aadjO++3e/umJLtB76GJB2jm0KVeTqMJLGUR1xR/gJoDLTxVDYGmI
 G0rGf7ApZpmkAl6udws5Ko+MwBmgj+CuK913A5+pIM50v/zYjGv2P8nxuc9ta1ERMfnl
 ZWK08dy94eMr+mV5mFKdz6KJH8t/bC81v4lwDdaedxFTq+aPRifP/tfc31nTmU/GpxP5
 DOTNem3MCGFP9pd/XV4v6Eq0XeNrS1kmrOUDpWXdT1CnwvXEyegofn9hc0LkwuoB6uvF
 bhvA==
X-Gm-Message-State: AOJu0YzotWTzu40YybAdc38L5gLUwWYmnHJuMt9J8DNuJ5ve253OvqLO
 k2zNGQNTlCq7JoZr2NnqdwZlBXmbMepVwyVifW6DJ5ZUE2420hJ9GmmdSIFZkTjFsltY8Q0Kmd9
 u+5Gj
X-Gm-Gg: ASbGncvQE5OFJ6jdk1V+wTKP7L4LlCD5t1x0sCfrKSYnWVEFKYMeaxHaIxUSx8BcIhs
 oJ5jQ3gZU4NIvwLAFOUQI3tcFL87BGr2fWlGalvj66RkZp8eZ3VTGJTotxkSMP+B+Wtl7Uwzcp7
 ClGrwHI9XEkNRtVIuzBsAnVHn1pvM4uJ+/DYogLoj/iB5XLbLVRbQ31rjKedaEoKVDS9qYzyF7o
 mTesJoi+eJYo6/kGngl8IjzcjVw1H6zfC5NGqnRvkPFiQNAasd/tiDNrniw0USy+zc0v2R+nE7I
 hfql6AtVVzi2mEojEbtdxMvD/bZQTK6V+aG3pfR0QA9oVcxPfWP97Xyw9L44QREpRvGLSveoUPc
 Nn5nkwsm5I544r74E+rQvrU8LfJRd
X-Google-Smtp-Source: AGHT+IFQNqhco4itF03EKjOw3uvmKZWs6kr/zNFfVaHpdJUJzD/Uzstne/WFCk/fAKveIeRR+rWxrQ==
X-Received: by 2002:a05:6a00:2190:b0:77d:52a1:ac6e with SMTP id
 d2e1a72fcca58-77e4eac6e2fmr16198998b3a.19.1758566987601; 
 Mon, 22 Sep 2025 11:49:47 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 15/76] include/hw/core/cpu: Invert the indexing into
 CPUTLBDescFast
Date: Mon, 22 Sep 2025 11:48:23 -0700
Message-ID: <20250922184924.2754205-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 11 ++++++++++-
 tcg/tcg.c             |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 30e335d7d0..89fe937a6f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -595,9 +595,18 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
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


