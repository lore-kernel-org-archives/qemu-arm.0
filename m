Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0B7CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cD2-00013R-Gy; Wed, 08 Oct 2025 18:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cD1-0000zH-CR
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:31 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCU-0007OT-Bc
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:29 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-78af743c232so275417b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960789; x=1760565589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDFNMEH1J1ZxzHPI3obv5zb1hQFKVpn2hQk3PxQwc3A=;
 b=yCo7zLccpUJ9u+ZUFM/1Am7K+IJM5qn+5dDlEi29hXzPo8Rukgl98swtVvIktfUeFM
 U5vQIdGpIFocTRUeXGuI2qklW49CWOoVbTjj4zDqaaU1r0dkYF4KM9Tx7oRogFBMTBtg
 JmnjRaLkHx28nfIytZZreQkNbfRRm5Jgk6P0G6529cM5OPwJlj+Ly5Egs7RbBMv5ECa+
 ZY03R50Ce+4pTMgpZ8zP2mCVAXB1E6ZeDi0LUktgxfKpPu2CZ6ab93/sB9EJCc87a0wv
 zK0A5v7WK6uyHVC6XsBATpkdJ9rDxTTEUB3LvdJDRTZbEL51SsnX5faC8lKvZp9aA3IE
 Bw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960789; x=1760565589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDFNMEH1J1ZxzHPI3obv5zb1hQFKVpn2hQk3PxQwc3A=;
 b=OR8YNFt+0GqVu/sRjvH6hS/dKYvCq1/Z8+eQnUp2X3YWJG/tQLmQ3XLKphwP70ROEl
 OGuCogCj6x3XQ0MOD2lN/6myElxEwT1MOVWQ+PkKD26+dzw3WZxuMmk/S4UhJNms1+h0
 gF9R66jPDeaftw7fX5V/Y88vP7j8DKswZiZFt5kzjvmwOwwUDCkanjLikRF9Xmwht9bo
 +ZLW3h05cYwsxOomBUbr1NIb3oDgH9RnbwoLqBGkxh6xP9lqXSATJGQh4wN7sQUBiNa8
 bTKxnHcJFk2ZcLMqi5Fk5IdQ4RpkRxeeuiiSy3VTT03PXMplH2icP3yjaz98WYNA4vAU
 wGCA==
X-Gm-Message-State: AOJu0YyAm1VrfzdpYTQYTKdFiuww4yt3tDbd4sZ8TkflB9sXx8+Gw/MG
 RlxDxHYli4NO0aE9Wx2POG0a8rG2bG8+b1AyiOg6GswHhrL+bApyZzxnKTtdR/35mTVg11KK4M6
 6U1Priq8=
X-Gm-Gg: ASbGncu+rFN48vW7Xjq9wAJAy4N+CU5mqmU2EjnPJaKNCkXNqydOaDHOhv27XzPVTfl
 0wmqOkZc2BYllCh61eJh5u9aM8fQICy8uJRU/cwCsYE/hjFolqtMct4T88G02JyYppu0PEnP1eu
 F3i9W+i6FAYHp1u9p1YLNywXTGLB5MkDOjuMD26F33bzbJ+Yp2mYzQZHUOLGi6lDDW71y+eYCRA
 wD9eoOoBEQLHin+rSN5hdVb8pufHH6WiPvzitnH7sM0em7PnNNl3FOH6FVEe4EDJ92LIzaNmqMr
 S88HXv1scw2P/E67J32sNWl6ykgSvQOcyBYI7HDu0VLidM2AwjDHH/aeOXpoo32aR88zQ3XmTR4
 MvDFUQCNcYSzPeHtkLACk8EsQ5msvJNyY3eoUMPMRyNvkhKsMtKMpSQpE0dZ/mBCTAns=
X-Google-Smtp-Source: AGHT+IHz7GuhxZTwbKprMWmdPJXpgA+F+YT6qRwPuPsQWgtfVuM3qPxLMXg+qvVL5nYqB7MdU9rtZA==
X-Received: by 2002:a05:6a00:6518:b0:784:5d3a:5f63 with SMTP id
 d2e1a72fcca58-79385327962mr4822220b3a.2.1759960789353; 
 Wed, 08 Oct 2025 14:59:49 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 53/73] target/arm: Implement GCSSS1
Date: Wed,  8 Oct 2025 14:55:53 -0700
Message-ID: <20251008215613.300150-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/arm/tcg/translate-a64.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 6d9145109f..e7e7050880 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -53,6 +53,7 @@ enum {
     ARM_CP_GCSPUSHX              = 0x000a,
     ARM_CP_GCSPOPX               = 0x000b,
     ARM_CP_GCSPOPCX              = 0x000c,
+    ARM_CP_GCSSS1                = 0x000d,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 3795bf7f36..eda5c498d7 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -129,6 +129,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
       .access = PL0_R, .type = ARM_CP_GCSPOPM },
+    { .name = "GCSSS1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 2,
+      .access = PL0_W, .type = ARM_CP_GCSSS1 },
     { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bb8ffba586..82ddf4e1dc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2643,6 +2643,31 @@ static void gen_gcspopx(DisasContext *s)
     tcg_gen_addi_i64(gcspr, addr, 8);
 }
 
+static void gen_gcsss1(DisasContext *s, int rt)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 inptr = cpu_reg(s, rt);
+    TCGv_i64 cmp = tcg_temp_new_i64();
+    TCGv_i64 new = tcg_temp_new_i64();
+    TCGv_i64 old = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSSS1, rt));
+
+    /* Compute the valid cap entry that the new stack must have. */
+    tcg_gen_deposit_i64(cmp, inptr, tcg_constant_i64(1), 0, 12);
+    /* Compute the in-progress cap entry for the old stack. */
+    tcg_gen_deposit_i64(new, gcspr, tcg_constant_i64(5), 0, 3);
+
+    /* Swap the valid cap the with the in-progress cap. */
+    tcg_gen_atomic_cmpxchg_i64(old, inptr, cmp, new, mmuidx, mop);
+    tcg_gen_brcond_i64(TCG_COND_NE, old, cmp, fail_label);
+
+    /* The new stack had a valid cap: change gcspr. */
+    tcg_gen_andi_i64(gcspr, inptr, ~7);
+}
+
 /*
  * Look up @key, returning the cpreg, which must exist.
  * Additionally, the new cpreg must also be accessible.
@@ -2984,6 +3009,11 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspopx(s);
         }
         return;
+    case ARM_CP_GCSSS1:
+        if (s->gcs_en) {
+            gen_gcsss1(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


