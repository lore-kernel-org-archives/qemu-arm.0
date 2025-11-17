Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5D9CCD19A
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 01:42:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKoFM-0003KT-6D; Sun, 16 Nov 2025 20:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEh-0002Zj-AG
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:56 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEd-0005ys-Gc
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:55 -0500
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4edaf8773c4so38201041cf.1
 for <qemu-arm@nongnu.org>; Sun, 16 Nov 2025 17:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763343650; x=1763948450; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xTiUOQ1IGaMkParvG9Ea/FPr0n/zvWff1jDqiP6qxEY=;
 b=XRJFUyDNrUId+CqIc0HK34iISbDONoVH9Suyme1QoO22gMoYqqeNk7+qUPTDoC+QpW
 SgRweS6vBTaXV5qOWRnDFneFTfRglZP6Oqj76Rer3ncMaTJ7SmampjNZk2V46lyjD7cT
 C2CIqA9uTYjPpsyTxqhhSJs70qwkCTr8x3ai5+TwPbxQYuom/XiS7BlPrZ80FJ3+sAL/
 uiy9beudY5Fn6rCPLaWccC3SKYfdvEf6VFkFlF7th7WPtzlE4ZpIFCOFLrQ6YDlL2R2j
 phAtYum0vR7cN3XVPrz/Oj8e5QzE5tgsZDYYecEH7mSsXF4Abx5jtq6B80SlPClj5U3p
 G3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763343650; x=1763948450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xTiUOQ1IGaMkParvG9Ea/FPr0n/zvWff1jDqiP6qxEY=;
 b=nESGI7piTMU15WwyvECArwia45xb3jiqMbzFgmonjn9jI5elwZRk4xbLtDDr60wNd6
 FcTBWkd9A5eEn/3wljEwcbnCNnSwq7qisEp2NWo46XL81HnFDDutGH/z6VnADxynjP4H
 p2XH3QeJMW+C8bGikZxGXGX5+8qiSuIUcGbOntuEV7h8g451TnIBz1ynfobCOo+THDlS
 DKA1tzHq1kMbkJcYd7ThKr3roaCQLIrPnO//nd+jW9y1xQQy0ANII/qgBwN+FRTUzG3T
 21JBJk0+e3r5eh7rMdE5hlWUOA8LN2wikDtIOnqCIHwHK3kMkF6jOJtjCQ4XLWTIDV6q
 fBEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnpl4c2zODndlH/nnKHrv5psJgY2tSieNZfu2r3hEEJfDSg0Ew+FksVhUKHjcj3quMgwj0FnMGoA==@nongnu.org
X-Gm-Message-State: AOJu0YwpJ00XTdwsdqIfmQ0XOZFfvLKUuahNYQdpPZpPq6dAfjEb3iJP
 fu8X+Ws/ciR4xYRzv9kdLTXXTdHxFGDipwNMvJzokIZyU7VzaGXBr4iXaIRlry4q
X-Gm-Gg: ASbGncujrhCpIqSGomG6CD3E13INof7Ok5EIAgP7ZCtH+cicNRyeuSaNP8j6/ClnCNl
 Sa07dCM0IgaJN9Ys0aXSuUGhy/6gB1Wro7/dnz1KTchDo+DVYPmz3rCzpYRTIORQioOP+a9Iv4a
 uEEp+bykg8YypfdnurPV/2FHmtTE99JAC8tP8zF+OcU4X9k2EYX6ML2kEu3FkmfGWQj2Vh2yRU/
 EIqV7fc1uwtMw+oP8RgDF3idvKkIxhOuoUZWWoN77Xw922iYj998+IvcBB4kJ3zwwAax88khhU9
 jYk5XRbUdmXdV7FzTZh+Aes9nv54LGkE7dYIS2AHEuRJsxQTh3LLPS5Y0K9EuHP2/902dyE8ZaW
 jefrN1mbpTDiTd+quCR8aGPIBQEGXsAnjv4IWatmMuhUFgq1xI8ys9NI2DkROsogaXgcrlx6wkK
 slSTbKXXCG2y51pVzITLE=
X-Google-Smtp-Source: AGHT+IFADsGLTCjPe/PJINQ+Ltzqmb136uwNv01Aceos10aAXb1YaqJITAQKmGfBu/AFCWUowoXkew==
X-Received: by 2002:a05:622a:199a:b0:4e8:99f5:e331 with SMTP id
 d75a77b69052e-4edf2111e6fmr148613301cf.60.1763343650185; 
 Sun, 16 Nov 2025 17:40:50 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee1c21ea34sm18246551cf.30.2025.11.16.17.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 17:40:49 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Sun, 16 Nov 2025 20:40:25 -0500
Subject: [PATCH RFC v2 08/10] target/arm: storing to canonical tags faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-feat-mte4-v2-8-9a7122b7fa76@gmail.com>
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
In-Reply-To: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763343639; l=3674;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=c31VaTqUU8n9+GGHtU0L8ajZrOEP0kWNvcXF7xxXV1I=;
 b=OGLArAyuyBjohMjK99H7n7OFn+WPuc9h94KvoPbXD2gPBGOpdFIFu0X5r5lyTAj3pQ2ignicH
 xpmxmq02TZ2DjRe+zLOXFFTMhg7TjXHj/QKWATLasEhAgmRQ6YpQqtc
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

According to ARM ARM, section "Memory region tagging types", tag-store
instructions targeting canonically tagged regions cause a stage 1
permission fault.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/mte_helper.c | 47 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index ddb68e11fc..9eb3777fe2 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -196,6 +196,23 @@ uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
 #endif
 }
 
+static void canonical_tag_write_fail(CPUARMState *env,
+                                uint64_t dirty_ptr, uintptr_t ra)
+{
+    uint64_t syn;
+
+    env->exception.vaddress = dirty_ptr;
+
+    /* bit 42 is TnD */
+    syn = (1l << 42) | syn_data_abort_no_iss(arm_current_el(env) != 0,
+            0, 0, 0, 0, 1, 0b1110);
+    raise_exception_ra(env, EXCP_DATA_ABORT, syn, exception_target_el(env), ra);
+    g_assert_not_reached();
+
+}
+
+
+
 static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    uint64_t ptr, MMUAccessType ptr_access,
                                    int ptr_size, MMUAccessType tag_access,
@@ -332,6 +349,11 @@ static inline void do_stg(CPUARMState *env, uint64_t ptr, uint64_t xt,
     int mmu_idx = arm_env_mmu_index(env);
     uint8_t *mem;
 
+    if (mtx_check(env, 1 & (ptr >> 55))) {
+        canonical_tag_write_fail(env, ptr, ra);
+        return;
+    }
+
     check_tag_aligned(env, ptr, ra);
 
     /* Trap if accessing an invalid page.  */
@@ -359,6 +381,11 @@ void HELPER(stg_stub)(CPUARMState *env, uint64_t ptr)
     int mmu_idx = arm_env_mmu_index(env);
     uintptr_t ra = GETPC();
 
+    if (mtx_check(env, 1 & (ptr >> 55))) {
+        canonical_tag_write_fail(env, ptr, ra);
+        return;
+    }
+
     check_tag_aligned(env, ptr, ra);
     probe_write(env, ptr, TAG_GRANULE, mmu_idx, ra);
 }
@@ -370,6 +397,11 @@ static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
     int tag = allocation_tag_from_addr(xt);
     uint8_t *mem1, *mem2;
 
+    if (mtx_check(env, 1 & (ptr >> 55))) {
+        canonical_tag_write_fail(env, ptr, ra);
+        return;
+    }
+
     check_tag_aligned(env, ptr, ra);
 
     /*
@@ -418,6 +450,11 @@ void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
     uintptr_t ra = GETPC();
     int in_page = -(ptr | TARGET_PAGE_MASK);
 
+    if (mtx_check(env, 1 & (ptr >> 55))) {
+        canonical_tag_write_fail(env, ptr, ra);
+        return;
+    }
+
     check_tag_aligned(env, ptr, ra);
 
     if (likely(in_page >= 2 * TAG_GRANULE)) {
@@ -504,6 +541,11 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
 
     ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
 
+    if (mtx_check(env, 1 & (ptr >> 55))) {
+        canonical_tag_write_fail(env, ptr, ra);
+        return;
+    }
+
     /* Trap if accessing an invalid page.  */
     tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
                                  gm_bs_bytes, MMU_DATA_LOAD, ra);
@@ -550,6 +592,11 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
     intptr_t dcz_bytes, tag_bytes;
     uint8_t *mem;
 
+    if (mtx_check(env, 1 & (ptr >> 55))) {
+        canonical_tag_write_fail(env, ptr, ra);
+        return;
+    }
+
     /*
      * In arm_cpu_realizefn, we assert that dcz > LOG2_TAG_GRANULE+1,
      * i.e. 32 bytes, which is an unreasonably small dcz anyway,

-- 
2.51.2


