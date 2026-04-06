Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D0CF46C6D
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:30:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oen-0007VM-5I; Mon, 06 Apr 2026 14:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oei-0007Q1-Bk
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oee-0002P9-DZ
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-3590042fa8eso3011045a91.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499991; x=1776104791; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=SlW3uNlLwrd6c21OAXl+ZhX9F+wpl9TSFE3wPb2wKYResFSuqL7MLPhWQRbA476XfO
 ILsCVIh5wDXK2aK2AkYGmCb8qwcpzMqpSmAqZjomLG7F2GzExtFOq9zhbnuxE/QGsmXL
 b2kK/cnfgyocO4WWPBP6uoOtJXzzEx0pV+tYNUuAI2o8cyl+aSxA2msVm5Ee6o5zNouV
 MBL8OGs3t5KfKQDBHn6V9GnFQDRJNvlGMR1ZUlRhEdFuakULGUT03bGwROjWyOF+Kibu
 3aEGOA6FT4lCAfb1CaDkNRla+Fg2+X1m0aU9TADJ5RVYoqrdQxjfI6F+F04eXKLz9kyA
 dqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499991; x=1776104791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=KJpIRlxfHa91QY7s9PlWrvd9E+7kg4EkksFGjT4o8ofShoTdyAV6iBJCwIoaVMjJZp
 VdnDUHAOBvaryuRC6yvXx9DZctHKHz1e9F3VrYiGr/5eresQGFH/WL6j52eOqgpL2kby
 /9ae/Cmowh3NDzi5dwvt2Rd+ZDh2Jzfo5Y+wrtedWqmbwUzdMYUqxMrASizN089clDpf
 ZuAYTDlBT7JnFA07VZ6UMzVcaWd+L4YnUHXyw9sFFp0TzZGhrvqByJUny7WUAMLU28Nj
 6UKS06hFD5UF3Nl7otvCVKUStkTOO9KR2Xf9JpLNvpe+IHwLCVVjeui5k/VEC8SW5cFL
 GnQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8OeofmFjSxIjmYGuEx6RjNqUWvVLFX+HhxaYuTvP9bSKQEfutv59ENKAVnsfAC4T6dbU9zo5C8w==@nongnu.org
X-Gm-Message-State: AOJu0YztPkjji1cEMYOWvoUPuOX3P0TAJvsH13FZvydZ4hObY10zSHHe
 lNIVMQCmXqkVdfqgA4gg+1G1n6ctpuZUNwiMX8SAKYjE1jIGkRc4v0sDnvlLQpSYi8o=
X-Gm-Gg: AeBDietF3RbV3TbWe5Ev2gymM4t4FFI7L97v/qTojDTq9FTR+H/w5UfQh5Ffi7JpHeF
 RJeXoOpK5Ej6tVUyTLp5Gg+4pnCuGg0AK3giL1kkwBQDMMzONAo7629I7Qgq6VxPqNGR15behK5
 OV683M9BmX75JYHi1HpCQj3914QChWkzQ5e2sP+cRVLn1u4ttorxTs4Ok8PpuK+20JcGrv4CPZl
 MxFnNs6FvvwiqNeI7ue1DtU4rfD4XYTLo7fIAE1U3zoiWrcCSsqjhzKC5R5VrOC4wHuwkz5mR30
 ASBeLCrRHycXyc4wa52lzOOSFEu/SsKNLxhbMFsmqViP8vGpTu9ZfAcakzVp8T310nvexG68GR0
 S2BxpdOjGNBEN9mm5kiYm3mR2hJWRaPEYNvOv9eiu45C7cXZR8DtiM1uoI5Erx/jHiEyNb8Ts1j
 LTLpZxYvJHCBkJEelwUi/owa4LzxAiLHd/D4Kt/mNZ3GsgsbdKIJQHg7TMZHMiWeape8fT5laJv
 ELP
X-Received: by 2002:a17:90b:3e43:b0:35d:a4c0:a0ac with SMTP id
 98e67ed59e1d1-35de6813794mr13641773a91.3.1775499990957; 
 Mon, 06 Apr 2026 11:26:30 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:30 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 12/20] target/arm/tcg/translate.c: replace target_ulong
 with uint32_t
Date: Mon,  6 Apr 2026 11:26:01 -0700
Message-ID: <20260406182609.193886-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102b.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 4546bbeeeff..204f9657993 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6450,7 +6450,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
      * fields here.
      */
     uint32_t condexec_bits;
-    target_ulong pc_arg = dc->base.pc_next;
+    uint32_t pc_arg = dc->base.pc_next;
 
     if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
@@ -6612,7 +6612,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     bool is_16bit;
     /* TCG op to rewind to if this turns out to be an invalid ECI state */
     TCGOp *insn_eci_rewind = NULL;
-    target_ulong insn_eci_pc_save = -1;
+    uint32_t insn_eci_pc_save = -1;
 
     /* Misaligned thumb PC is architecturally impossible. */
     assert((dc->base.pc_next & 1) == 0);
-- 
2.47.3


