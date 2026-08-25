Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50023C61DB9
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 21:31:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyyim-0002X9-8U; Tue, 25 Aug 2026 17:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyif-0002Q9-Pa
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:09 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyia-0003Le-5I
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-39652a6e963so1138513a91.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787693403; x=1788298203; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5OlP4xmBxJaU39dQm0XttdRoWfw/hb/T/Y+p7JEg/bw=;
 b=lDCHs9tNHfF0VkjO4uDKZLwYBquXIbxl+mB9OF2G38GZWTwmBfu2mZaf0/5ez+p9+o
 /ytGDMQVFifZSwRjfrtweFmybTVrUvUbu/HOAGNhQLGVElr7JHd6ZPIfGUTtHDlc0ba/
 Gr2XMK5x38Erds0Ks6RnoccfreFPla6d7qT6HMeTfdoely6O3lJtD1s66aZwysnL3RiC
 ypjo3Dfdi600yPaKKQy9NSdWkvZIEYVE+FQ2bpxJFBrmdk6FZs8n2CTRfpHNdm3mKUKF
 m/3y04bZs/V8ixfRTwut/aUrbpp6TPN49MRVRaRVa45W+EKJggKoYxhKjncrKK2goFt/
 qcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693403; x=1788298203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5OlP4xmBxJaU39dQm0XttdRoWfw/hb/T/Y+p7JEg/bw=;
 b=oAXQFDR3P7Ds9JdQvipActylS97WTI7bDA2UNBngkiKK6QNANS9i26pikOBCGgVKM6
 HUzWhFNkMk4Lv8L1KyYNz/hG7GouWq6xzAHom7dm2/10z6wZ4hMGHeO5bm1Csdi0iK53
 VfV8s0ncf/yM1wS1KIERou0uS+O9MEWySxGcXA9+K4+mTKUOMx/zQ1QhFzJDJjwmM2Kq
 CaejMTm8S2hlRv/B6N3vT8yYq7X69JPY/MPsUe4zhtMsXW6uPOHBexx0F5jRqDhQ0gI7
 8//+vhTrjiCUqmdZm/wOChFQWCtHbHwnyq22fLJXFGJ4zmMB9HxANcpwIR4qQ0BeBKm3
 xnWQ==
X-Gm-Message-State: AFuF++lCbny7T0U6ux7Rk823LI5bME7AmjfnEcFIK/jvYnsISFOu3j2w
 +I+CgnDeyO+XQ6uiqUIhxRSb6OipjVhlWjJIj/X9bTHl4FXvUX2vFhdCUaEfVCCUz+Y=
X-Gm-Gg: AR+sD10aDucs32SF/bGMGmeV/EfoUbXhk/OW4s1YMGymrC778CewOD8QmP9FI8IbWTe
 1vsHQdAbD54XlXTCmaTd2DdP13RuXxdrTrPIZF3f4HY8S5/nkGl5tuEVq6R441slPJmRY/mREec
 yhjEAH5JnVLYmbkGkNAflKgZf0ojUk5iIclI/GYkOj13cZvzvjTzP41w6STAt5BI1CUIRuSDQoT
 AnWxeaX3GS4IKbbsiL61C2BsKi/LiBML19jDjG++3L13dleE6CjTbsVXURIK6OiDC8GPwzqPBrB
 MIaK9Nwe3umsfNGiNH56L2XdzeWhX8V2U+3pklR00OMzIK+EGCeXUmWdoCS7bR9HCgXLT3Kcf2I
 rlO3lP1VDyG5oQWng+eDlPGAidcMRvkjEdqlqZ5/iC0vCP41ORpXHWhnAQC26RC6MEz41lyBVvA
 N8LP3Z1KYJL/lzzJOYQk3pekFfFWI8zqVGMIZZtCHNQupNDapXx971QXvNtyyEvHv0AjjwcVrQr
 PcQ3RZM7+5puytqRw==
X-Received: by 2002:a17:90a:d407:b0:390:84db:888e with SMTP id
 98e67ed59e1d1-3966d8528c7mr2200439a91.7.1787693402688; 
 Tue, 25 Aug 2026 14:30:02 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396689fa52csm1207163a91.12.2026.08.25.14.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 2/4] target/arm: Introduce cpu types max-v8 and max-v9
Date: Tue, 25 Aug 2026 14:29:58 -0700
Message-ID: <20260825213000.221822-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825213000.221822-1-richard.henderson@linaro.org>
References: <20260825213000.221822-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Introduce the names and allow them with the virt and sbsa-ref
machine types.  So far, the cpu types both exactly match "max".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c      | 2 ++
 hw/arm/virt.c          | 2 ++
 target/arm/tcg/cpu32.c | 4 ++++
 target/arm/tcg/cpu64.c | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 484b90053e8..56d08f605c8 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -913,6 +913,8 @@ static void sbsa_ref_class_init(ObjectClass *oc, const void *data)
         ARM_CPU_TYPE_NAME("neoverse-v1"),
         ARM_CPU_TYPE_NAME("neoverse-n2"),
         ARM_CPU_TYPE_NAME("max"),
+        ARM_CPU_TYPE_NAME("max-v8"),
+        ARM_CPU_TYPE_NAME("max-v9"),
         NULL,
     };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e7a56e37f73..d738b95c726 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4132,6 +4132,7 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
     if (tcg_enabled()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a7")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a15")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v8")));
     }
     if (tcg_enabled() && target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a35")));
@@ -4143,6 +4144,7 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v9")));
     }
     if (target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 8397f26a864..12e70ded9c1 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -744,6 +744,10 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
+#ifndef TARGET_AARCH64
+    /* For aarch64, max-v8 is defined in cpu64.c */
+    { .name = "max-v8",      .initfn = aarch32_max_v8_tcg_initfn },
+#endif
 };
 
 static void arm_tcg_cpu_register_types(void)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index b38c61ba623..4f5375deb25 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1488,6 +1488,8 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "neoverse-v1",        .initfn = aarch64_neoverse_v1_initfn },
     { .name = "neoverse-n2",        .initfn = aarch64_neoverse_n2_initfn },
+    { .name = "max-v8",             .initfn = aarch64_max_tcg_initfn },
+    { .name = "max-v9",             .initfn = aarch64_max_tcg_initfn },
 };
 
 static void aarch64_cpu_register_types(void)
-- 
2.53.0


