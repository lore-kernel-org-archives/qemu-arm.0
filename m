Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE27CCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:08:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJ8-00023G-9E; Tue, 14 Oct 2025 16:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ3-00021P-AC
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:38 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIq-0005Jx-59
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-28832ad6f64so64879455ad.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472441; x=1761077241; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQFcykZzWxrbZtxjDQ1imqMK5f7bh9/0kLjg1nW4RaI=;
 b=NlOB77swLYXuNhoIDO2bjOD99/DliEYdeXJBI/jGzz4rNYOCZWeRT3Ukx4vnTArc8B
 kHDNXTzj9aSOPz+nL90eTYhxXLtcTao1EfClyGpf8p8W/GFe8NWP5tvKqW9xnQ3aT9df
 EzWLa696/56D0v2IWhyz4r8AMIxJhKnlq1qOQQ9E+J9UjkepnWAHVOvx5DtXGvTUKN5m
 xRmWKfBG8kghEO0/VdMgv160Q4XwndRJjGhN6eeEroK03m5wURzY4DXPJtbIDfwho0OE
 cncNzk0zyvdKN9Zc2LsgPKw6B2FU5AJ8YiviOgku4P6x90PMCXETHQRO8y6aAVu4Ys5a
 eM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472441; x=1761077241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQFcykZzWxrbZtxjDQ1imqMK5f7bh9/0kLjg1nW4RaI=;
 b=LhymIN4ZyS0tZo1J5J+X/tTACuvE6vRfk9UVe5U7ls+AYfzzX5IBi5e7qD/9n4bvOC
 ow2XMl/hCbQKcmEbC7tJfN3EWS3+YOpVwtkJVVx1pzrdZlfjSHI1REPcEVQHxaygJvkZ
 fwQzi7EBCqJ53p0SE/Dqcv/sG08ngDw2KQrvfF5BLpqNsfAPwfy/1nDJ6hVSEo4KeA/t
 yKyMh49tYees+yN8p1Dplo4IT74/vCxrC9jJiZQ1S49Xjw27N+Ueumg4UQEOsrFdGceM
 KIZo8b0HHigt4/dKOI6K4raQWANTlwXUrrrRO+cnNUs4P93LglCdsCVd0Vkc0c/6oCrz
 LHMQ==
X-Gm-Message-State: AOJu0YyruoYUyxsjUxBHyRxPbnsu888EbApldQqYX0KYmMij8hKyKmR4
 sbDG8oHe2MB6nx3zMmjgnqQ6Jrb9GgH0hExGX3H/sImOYRVxHxzUxSz1jO0iSRGIj4KugO6VLSJ
 ktXroJwc=
X-Gm-Gg: ASbGncupvImmLY9buU4UqNL0LDA9s6UFt9h1vTB5AQReHHFq1eijLoU+4esWkBD4fs8
 vQlxg6MY7H3ATpSIO2uUqN68aO1Ain2h7xkjmlOHWEEiP+BoqbavXPBDhMsiXD33FEjQTYPEpXp
 gt1Py7seEVc6lP0/F/RVPfzN9kZ2eqATWWtsNMe865Yw1T9G0DQ7vqFzwjjyb4cZHFs9N+lmY81
 +lo6okHy4HbnT0IFY32MJ3LbuYwxoMJ/vohi37Gsej9wI28T2FRRpoAq7utx3x+rOIpH2iImPLe
 KISSHBcTc0pOnSPymUmblDwhPCJMlU0aGmodij1k5LKEopUIw/EwffW3AIjd7jKyhrrlNx4MERA
 I7nbld/bvvJKx4mOH2Or1cYYejii/3i3JUSBrDvt/IPItzBI3d+0=
X-Google-Smtp-Source: AGHT+IFTekPh7oqJ8zUniHifv2uMnEIbd5Mc87XkqoE5Ja8vg1S3jEzyAj280NvyZ+C4oYWuwN0VbQ==
X-Received: by 2002:a17:903:3d0e:b0:267:a942:788c with SMTP id
 d9443c01a7336-29027216267mr338602625ad.1.1760472441359; 
 Tue, 14 Oct 2025 13:07:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 03/37] target/arm: Update ARMCPRegInfo for 128-bit sysregs
Date: Tue, 14 Oct 2025 13:06:44 -0700
Message-ID: <20251014200718.422022-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Add ARM_CP_128BIT for type and functions describing 128-bit access.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 48a406a5fb..e1d54baead 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -149,6 +149,8 @@ enum {
      * should not trap to EL2 when HCR_EL2.NV is set.
      */
     ARM_CP_NV_NO_TRAP            = 1 << 22,
+    /* Flag: For ARM_CP_STATE_AA64, sysreg is 128-bit. */
+    ARM_CP_128BIT                = 1 << 23,
 };
 
 /*
@@ -191,6 +193,10 @@ enum {
 #define CP_REG_AA32_NS_SHIFT     29
 #define CP_REG_AA32_NS_MASK      (1 << CP_REG_AA32_NS_SHIFT)
 
+/* Distinguish 64-bit and 128-bit views of AArch64 system registers. */
+#define CP_REG_AA64_128BIT_SHIFT 30
+#define CP_REG_AA64_128BIT_MASK  (1 << CP_REG_AA64_128BIT_SHIFT)
+
 /* Distinguish 32-bit and 64-bit views of AArch32 system registers. */
 #define CP_REG_AA32_64BIT_SHIFT  15
 #define CP_REG_AA32_64BIT_MASK   (1 << CP_REG_AA32_64BIT_SHIFT)
@@ -903,6 +909,9 @@ typedef struct ARMCPRegInfo ARMCPRegInfo;
 typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *ri);
 typedef void CPWriteFn(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value);
+typedef Int128 CPRead128Fn(CPUARMState *env, const ARMCPRegInfo *opaque);
+typedef void CPWrite128Fn(CPUARMState *env, const ARMCPRegInfo *opaque,
+                          uint64_t valuelo, uint64_t valuehi);
 /* Access permission check functions for coprocessor registers. */
 typedef CPAccessResult CPAccessFn(CPUARMState *env,
                                   const ARMCPRegInfo *ri,
@@ -991,6 +1000,11 @@ struct ARMCPRegInfo {
      *  2. both readfn and writefn are specified
      */
     ptrdiff_t fieldoffset; /* offsetof(CPUARMState, field) */
+    /*
+     * Offset of the high 64-bits of the field in CPUARMState.
+     * Similarly, may be omitted if read128fn and write128fn are set.
+     */
+    ptrdiff_t fieldoffsethi;
 
     /*
      * Offsets of the secure and non-secure fields in CPUARMState for the
@@ -1046,6 +1060,13 @@ struct ARMCPRegInfo {
      * fieldoffset is 0 then no reset will be done.
      */
     CPResetFn *resetfn;
+
+    /* For ARM_CP_128BIT, when accessed via MRRS/MSRR. */
+    CPAccessFn *access128fn;
+    CPRead128Fn *read128fn;
+    CPWrite128Fn *write128fn;
+    CPRead128Fn *raw_read128fn;
+    CPWrite128Fn *raw_write128fn;
 };
 
 void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs);
@@ -1115,6 +1136,9 @@ void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *ri);
  */
 static inline MemOp cpreg_field_type(const ARMCPRegInfo *ri)
 {
+    if (ri->type & ARM_CP_128BIT) {
+        return MO_128;
+    }
     return (ri->state == ARM_CP_STATE_AA64 || (ri->type & ARM_CP_64BIT)
             ? MO_64 : MO_32);
 }
-- 
2.43.0


