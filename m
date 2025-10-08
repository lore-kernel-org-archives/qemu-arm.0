Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42D3CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:06:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cCf-0000Bz-Kd; Wed, 08 Oct 2025 18:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCT-0008TI-BM
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:59:57 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCI-0007MF-VI
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:59:55 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-77f68fae1a8so383818b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960783; x=1760565583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRMGkSahDRDIyhY1Pf+KcfrLPaCj+CJxCc4+NBDjs/c=;
 b=j5lBAWN7GC+HFcNI2x90h4rDUtLs6G09/KgLUPpkRpdHPhNbb5oG1f3QA9WY/qnM1x
 F5EmBEuxDf6sukMB8Tdn98Jx+DT9VagNSkLcVa3iTjcc3Gk8lItsYfa0Uu2CgHN2S8ky
 pXWd/WZXGZvgQzqrP6n8RrhJUM9a1QdxHJutAavp964RoBBSoGDW7qIM44wledohkw+C
 dE9RhksodOhPlHi9W+WYXnxjdVH4v7Vp5rM9DPFnsaKzjANjlAy2L5eUbYRNkPmPDvHv
 N9PLt0UHbOXk7zZYU3e1g/9CCubKDDHPqvtRSfnaGcawX20A/CPk0VYdoCWSaPzMEs9b
 KxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960783; x=1760565583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRMGkSahDRDIyhY1Pf+KcfrLPaCj+CJxCc4+NBDjs/c=;
 b=Vm6E2I1fOnMDHm3VAx+NWcuZ2YL/WDz8LSIdi44y6aJCWFUbDWF3KQIRXk+7mLGSDg
 XyxeKlhO8X9BbzQNSvNRjpz0wcMg8qYLhquOUjqapto5SpdWGYYgKLp68fmFUW1RnazD
 ISbnHTQj1Y4zPHDNrDZrrFqD5+3617d73QcclaSourvrDaLrwQaYK4B0xSUtrbUnijMy
 DU0BnqoOIWH9dqefGNoAZEyG7mlKVxNgNvxS+18cbZ5/wQ2YwG2ex0qqCIu5lWe3ECre
 HAsffYMrsE2tmFYnQlR92D6wkZ3a86sldmk4OpetXds6WLg3pO5urFtBJHoIssZ3YPHY
 2Y/Q==
X-Gm-Message-State: AOJu0Yy4YH21vO+dqa3BRcbAeofeEsKGTUI7/UtIA9u8IPssn44yQajC
 4rt9WY7FmVkATnovQxPaKaoJwnsXUS1vjtxp04nTHWRarROq0S2P1dgEXyBkhCP4oqg=
X-Gm-Gg: ASbGncvIH3o8szdHUr40X5DvwmaLsBUzLH0Xv0mdjtbq5xdw6RwtyqhMrzh06RwKYy7
 UM4FkTE2MmUx+k0UhYGWcGwCLlGiFtp+R8XYWBzuZyHgAU1WblE07XM/ZCL9PMMeOXKWShsdS1c
 UEie61bHJ4chCZ2uohDjGm4zZQfqEccsry2eY16qd9EiSCkiwHalGOHb+QRwOXsFMKxs4Au/WKe
 vaQCanhIk75Lze69r2+wyIvKCYlEgDcG19l2/aOCW6dwtto9lz4qUQo2QdW2CRHM2ceUcTZn+r1
 7mA3LDTgAXzntygmq5ZItW2HVQs8ZvIaKDlP1i30jpNkxINJPLpGa70myoYodU5U02IWk6dIgkR
 d9jfFoLWhbcSCKnASemzF9rT+wjQpiyTatTt3TA//XpKSJe5hFb0I8U5i
X-Google-Smtp-Source: AGHT+IHW/SwPEbLKhMILzadeCRHrcFvtoUFhuYMlcp4OACdN4ujarSVbpcjsMmn23pPjKBm9Hzpn4w==
X-Received: by 2002:a05:6a20:3ca8:b0:2fa:26fb:4a7b with SMTP id
 adf61e73a8af0-32da84ed64emr6062110637.57.1759960783370; 
 Wed, 08 Oct 2025 14:59:43 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 44/73] target/arm: Emit HSTR trap exception out of line
Date: Wed,  8 Oct 2025 14:55:44 -0700
Message-ID: <20251008215613.300150-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Use delay_exception_el to move the exception out of line.
Use TCG_COND_TSTNE instead of separate AND+NE.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 78d26aac04..57bc8ea4c5 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1774,21 +1774,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
         if (maskbit != 4 && maskbit != 14) {
             /* T4 and T14 are RES0 so never cause traps */
-            TCGv_i32 t;
-            DisasLabel over = gen_disas_label(s);
+            TCGLabel *fail = delay_exception_el(s, EXCP_UDEF, syndrome, 2);
+            TCGv_i32 t =
+                load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
 
-            t = load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
-            tcg_gen_andi_i32(t, t, 1u << maskbit);
-            tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
-
-            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
-            /*
-             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
-             * but since we're conditionally branching over it, we want
-             * to assume continue-to-next-instruction.
-             */
-            s->base.is_jmp = DISAS_NEXT;
-            set_disas_label(s, over);
+            tcg_gen_brcondi_i32(TCG_COND_TSTNE, t, 1u << maskbit, fail);
         }
     }
 
-- 
2.43.0


