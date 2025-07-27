Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB85C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:14:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRz-0005Wx-Pf; Sun, 27 Jul 2025 04:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPf-00039w-8j
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:19 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPZ-0004p8-VS
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2352400344aso30526205ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603632; x=1754208432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fqv3pWf5B2ybNy5pOAou28ZjicdcKv72gJ4k0GwAojQ=;
 b=GNv/PXQvipuJI2xk1SOX/4qKwAwoVX0gzjmqgVgIDmwX2X0yK561PHu+GU+JWGrtx/
 kCCYT12sSNfNEtK/GuH5m4KhrEXfaW8Yyk1L6Q4mhSehR6peNhts3oKirspO+0aZqt9+
 3q/wtLvNcPv7XFcC49Z1InYpJA8qjs06mgOkZl9tZ0knnpNKPGDiQA0gpUuOAmFg/HQU
 zzxMpH1TXg+57H1Zjx4BOFoKLBuDstM8dH0RQvLAFlcTLmzNsdxixUrMPgH6xJJajl+O
 yUd9uOxyUNHrl0/NNEY5X3x99Zi3Vo77csqoAyli8U9A0YYDvHirFurk2PBjdxlrLCj6
 Ui1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603632; x=1754208432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fqv3pWf5B2ybNy5pOAou28ZjicdcKv72gJ4k0GwAojQ=;
 b=VqeilQo/EkJXLY8VOlGteyiS9jKvKC2DAoxjJr4a47VZdoUwMeLPh/IGnNTzNgW3o5
 +r7/Z9qdL+kRsn0GMwo+pwNoQPeNVo/wwsqZ0562hRn4ozzVKQojCQMZGdC3PiBhSYEB
 p/ydgVIbY0N9M1rlcCj+SPPWQp0+6IeWC1xLduaE5B1iqDM1RY+MKs+aKUkoX45e4H3j
 YFeQpcQvIPmzYronXbKRkMTIN7zTOWJhSw3CTPKG2rsKqrnySVoik+POkvCzCTFVy1py
 t1O5gS0OwRDxPQKglsUEqpbRFApdGutQtVg8mRkZHU+YF4nm21xDa704b3e3tCFaooer
 dgkg==
X-Gm-Message-State: AOJu0Yx/eh0/qGqd0huy7OWbwpNGZ3nrt2feil0p+3siepc9mWKB2ctO
 MKIVllS44Ch+zWRWUPpMg4NC3L2Yckgzpiu6TKqXBDM8aoBpyQf5Wq/dMgv2AZc38n4=
X-Gm-Gg: ASbGncsV6J2EY/DMbJ7zSTeIV+tltZ3/c+9LVIRhpr+HNihxgF2wQujhCGXwYEaEpd8
 ziqyAKwL2I6gBn6qi/L+ZFi+G/wCJbBkluGqIwBoZVwgO1qmb16GAODKBKVt9f6q6YK7BSxCzMz
 mFgIq1rCVb9Ewl1tqDri2/P8UAJkKxn/b1+Dggdwwqp4atTmqLYKu6kkp5DedYSF3OlcxqqsE72
 6Bax309JvkQSI5OPGNkL5MzDJBbpFwLzTKWpd0/QmFnTT14GqF9KNkNDjXgoWo92dN+FQ2R+y9D
 6nAW3qtWvyommUJhhJV/SWpQSdqdZN/nXYjFMnNnPFGbNQLaxhVXaFZh4O5kmRsYt1V2m7fRyc3
 Zm/ka+eqzKL8w4MDXYJjQarHtbVPgCJJZwjv/L2ijbmKMcvxXJJ0XvoV7DQwi2+707POVKqY5HC
 XPBEB7rF50/9OQ1T0xLYi8
X-Google-Smtp-Source: AGHT+IGZfWJqk8AIXcF4AAZauRlBqMgvZCim7iN7AkrYT9Bdb38lkE+ZvqumawIN4MOcc6nOaAR8UA==
X-Received: by 2002:a17:902:dacc:b0:224:1af1:87f4 with SMTP id
 d9443c01a7336-23fb30854f6mr115890565ad.22.1753603632439; 
 Sun, 27 Jul 2025 01:07:12 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 62/82] target/arm: Implement GCSSS2
Date: Sat, 26 Jul 2025 22:02:34 -1000
Message-ID: <20250727080254.83840-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 37 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ee8b870e17..1ee0bfd132 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -53,6 +53,7 @@ enum {
     ARM_CP_GCSPOPX               = 0x000b,
     ARM_CP_GCSPOPCX              = 0x000c,
     ARM_CP_GCSSS1                = 0x000d,
+    ARM_CP_GCSSS2                = 0x000e,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index bdafc60786..558e223838 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -117,6 +117,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSSS1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 2,
       .access = PL0_W, .type = ARM_CP_GCSSS1 },
+    { .name = "GCSSS2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 3,
+      .access = PL0_R, .type = ARM_CP_GCSSS2 },
     { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e4c7801740..88fe5ac4ef 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2661,6 +2661,38 @@ static void gen_gcsss1(DisasContext *s, int rt)
     tcg_gen_st_i64(new, tcg_env, sp_off);
 }
 
+static void gen_gcsss2(DisasContext *s, int rt)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 inptr = tcg_temp_new_i64();
+    TCGv_i64 outptr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSSS2, rt));
+
+    /* Validate that the new stack has an in-progress cap. */
+    tcg_gen_ld_i64(inptr, tcg_env, sp_off);
+    tcg_gen_qemu_ld_i64(outptr, inptr, mmuidx, mop);
+    tcg_gen_andi_i64(tmp, outptr, 7);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp, 5, fail_label);
+
+    /* Push a valid cap to the old stack. */
+    tcg_gen_andi_i64(outptr, outptr, ~7);
+    tcg_gen_addi_i64(outptr, outptr, -8);
+    tcg_gen_deposit_i64(tmp, outptr, tcg_constant_i64(1), 0, 12);
+    tcg_gen_qemu_st_i64(tmp, outptr, mmuidx, mop);
+
+    /* Pop the in-progress cap from the new stack. */
+    tcg_gen_addi_i64(inptr, inptr, 8);
+    tcg_gen_st_i64(inptr, tcg_env, sp_off);
+    tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+
+    /* Return a pointer to the old stack cap. */
+    tcg_gen_mov_i64(cpu_reg(s, rt), outptr);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2977,6 +3009,11 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcsss1(s, rt);
         }
         return;
+    case ARM_CP_GCSSS2:
+        if (s->gcs_en) {
+            gen_gcsss2(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


