Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81028CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:06:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNyU-0006Vv-26; Sat, 30 Aug 2025 11:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQy-0007Kw-PH
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:32 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQw-0004wI-P0
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-24458272c00so29632075ad.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532845; x=1757137645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnuzD3f6fqniCnUr6zHfwv+Jhw4Kn2Qu+tewJzRiqxg=;
 b=SIocrkGU+xLalzYZt+kp8m4W42HRWGffcpfLpFGgyIAr6ZWguTyZKqhMOzVu+Mg8X+
 p6147uog0Qn6+WSBgzf3RHIpBYptyAcXpC4WacASuvElEKb4BSN0+qpD49YfomaUSLKD
 mer8XlSsuNAdLb6QTXC6i4mF1TwMAe6PMoe0w2+ly0qLYKo/OsqcS2fD/zNSveQj4kUE
 1afpW7icdwpqbYMEJCf68mfOa+HuqVLFQHHryzstxJJ/xBBbaD2S4ZHPwijdpa5ixMV3
 XvxYFjtSd9oq3ISGzgbDAfFjWKicGtcr3vJ1YeutlaOSYme22GoRLR1KKyBrtSZnViQ6
 WpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532845; x=1757137645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rnuzD3f6fqniCnUr6zHfwv+Jhw4Kn2Qu+tewJzRiqxg=;
 b=QRVowLNoaCQ2BljMWXdfUOmvQu6eXZ2Gcc1U0HjQTfYJyKCW0WX8U7kFDh60oPk1ww
 2nw5SK4CkEJas68i1JolbYzxAonN3fJsQ3Kb8fD7SaMnBpb14JMvibg18b9eKNlW4TuU
 QsSLaFd1hPaGjkmPwtlcjOkZtY8qQsGm0OqsqdfTT29wtXG1Xus1zWKmWvIEoJCgB9Wa
 a7wI3rI1FmDfgV4XXNsHiaMx7LEBAYOm3isVZkVNH1a6ITXeI1c899MPF3LH7A3rSpGW
 gr4e4gQ3eqa9nQYDI+n3T0GzG1pzGbHnLAoi/xw5g+FnruWKLYttHV8i8cewYe9LkkS+
 VW2w==
X-Gm-Message-State: AOJu0Yxd4EMQrRrPrjvrpe4yYdv0KtfLKvX746ihjPKnJHyeaqI7hQI3
 Hy96o0jkAZXhjeWjU7p1IlT8gb3EvmUzrCIz425irDsiRGdWOeTVLzaS4RWMuC8ZOMA=
X-Gm-Gg: ASbGncuKAjXdIsAGaoEo5A8EXbLZJYgEdE2FUwDwjrlHQyGFU1o8Tex4G+ljKfpmBLo
 2zjWSPdOxx8yrGpfNzXckfjzueB34CAwJiujRaSI0nEpmn+tTd1MpSJxvRX7YV55vbj7DU9EQHV
 vclWQz52wap70L6piX80pYrmbZS7iZMzMQkmSbMN9EjaXqxTK89E0gkREJYmjIgb9IFn4xVAOcL
 e8RP9KHOr+R4OwKdoArdvBLP98XATqoYYPZM0Ydf8q2gWXYOFM5d2jnh7K1ck+H7Iup+4OTKKcW
 ZylHJVosknD7cgbK39dG/GGtZfCr65h+BKq6f6fLFcrS1ljTUqfVfxBceAF7yMK6I18G24oM27k
 qB/U7mjkkFhlhbRfJjcRG6ki9+HZrRywI+f6DOx7mzG/8VHMVph1K9MiBAi68bIw=
X-Google-Smtp-Source: AGHT+IGChp18exmULT17wkoBYnzsW9UHJ0uJNbjFtYzYpcd0kveQTLZkj3vJVu8wZc+t3pO8xOv55w==
X-Received: by 2002:a17:903:440f:b0:24a:2998:91b6 with SMTP id
 d9443c01a7336-24a29989633mr9565645ad.54.1756532845204; 
 Fri, 29 Aug 2025 22:47:25 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 60/84] target/arm: Implement GCSPOPM
Date: Sat, 30 Aug 2025 15:41:04 +1000
Message-ID: <20250830054128.448363-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 24 ++++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 93358e6123..9b19520346 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -48,6 +48,7 @@ enum {
     ARM_CP_DC_GZVA               = 0x0007,
     /* Special: gcs instructions */
     ARM_CP_GCSPUSHM              = 0x0008,
+    ARM_CP_GCSPOPM               = 0x0009,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index d17c17dcb7..fdefb2e17a 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -96,6 +96,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 0,
       .access = PL0_W, .accessfn = access_gcspushm,
       .fgt = FGT_NGCSPUSHM_EL1, .type = ARM_CP_GCSPUSHM },
+    { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
+      .access = PL0_R, .type = ARM_CP_GCSPOPM },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0d2df839f6..badc24d2a5 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2513,6 +2513,24 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
+static void gen_gcspopm(DisasContext *s, int rt)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 value = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPM, rt));
+
+    /* The value at top-of-stack must have low 2 bits clear. */
+    tcg_gen_qemu_ld_i64(value, clean_data_tbi(s, gcspr), mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_TSTNE, value, 3, fail_label);
+
+    /* Complete the pop and return the value. */
+    tcg_gen_addi_i64(gcspr, gcspr, 8);
+    tcg_gen_mov_i64(cpu_reg(s, rt), value);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2794,6 +2812,12 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_add_gcs_record(s, cpu_reg(s, rt));
         }
         return;
+    case ARM_CP_GCSPOPM:
+        /* Note that X[rt] is unchanged if !GCSEnabled. */
+        if (s->gcs_en) {
+            gen_gcspopm(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


