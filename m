Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A0FCD4F4A
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 17:49:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wP24i-0005V0-7G; Mon, 18 May 2026 13:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24W-0005Rt-HV
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:09 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24M-0003mI-La
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:04 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c827313dac0so1540840a12.1
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 10:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779126474; x=1779731274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rploCqtm6vwFDDVNHGChrFcyZYIAeak0Auxi0lz+BRY=;
 b=dapBc2FRs9bjWpE2YSeE0q26ReYohfBftcYoYCscS87hzprSmrBlZg2wCdw4J+CT2W
 I64ge2t/C3BF4WaXik0Bi4EzpSDr1BSxCjoVDPlwOctfhqnV4Pp/hgiHMpCagokF1kYM
 nYIab6t4Zz4ke/3xfxo0X5d2NiYrkVqxDaYlBBcUISB6z03se6AaBDx0FEKlHpMAsM2W
 Dz0bnMhh4yLUxisuOnSh9V4zNPzgT9QkWMcCG/D7Mr65zhRT8MgtGI5lmYvSukMQVWc6
 o3m9T6nJtfPHUTxayOyOSzKWnhJTWHcJgXQkZeNTzBM6UqhSRnNHlsEo6+xr3kDJ5Qke
 UNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779126474; x=1779731274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rploCqtm6vwFDDVNHGChrFcyZYIAeak0Auxi0lz+BRY=;
 b=OqmrMb5o7CTVH2/ndeIe3NHOXM/4OQBE4hcM4WprUxQ3dSf0OKQX9QOshKoSvZNRTO
 5udahQUNttYzPiQKSChBHyCx7kGfkbH1Yw+8M5AfjVmLbG7THo1i9RLRXDtXjRTrHKkz
 jx/HBnlz3/97je/aHYUFFj0UJQfBou+2d0HQO/hKKwBZNNe5Jqb1CkDmr6tXN6U+2103
 EF1VmVCGy3tvWm27ha7kasgwtjAUko6jGM8/lDEw/B4MHu9RP90RxyEmWe4YolLsYot5
 /4PDCsJGu814Eyo3FYi2mQDS3ztqVAF3C0F0O3S7qF/EE64rvSzmIfN9gWI5OGQoRrOV
 fCig==
X-Gm-Message-State: AOJu0YyK3TvILQn50pgnTY1O+WmCH69rX0I87Anx4wCsXFhfzTNlhP6q
 S873XAbO4TifPr+r9TTH1tMR/najDiymni7g5osTk8D6Mb21OymPmJt81ek+6gamaeBLV1dd0Th
 QA7igcLw=
X-Gm-Gg: Acq92OFiy0YtEswNi6+peP/jCoIPeA8DNKGz6ZgVR8y9BRcyVk4b0LZA1BosAfYmJMk
 inyLaxmxC3/xeNxKMmajw4Aq+Y18IKWTpMQLhLjXv8slr1yxCDTBsHsn3rMvG9VfQrnlz56kDj3
 FLZhKpzV+BkFaD9LGmaUjAzrpjfreupKoCRyMJ0E1VLPSivebCTaOp2yiDj95FgM9ZuJ6yq3iaa
 8eFBj+TcmRVIt5J8aRXGbVDIZBKjHbHzKEUOlDdfMH9nQl2hUwdmEhKhrkMs3VSd8+BAGKqTZFi
 NzjD7G6SAYypcDPNLqof9ooJS9JWTt9D8myi9CMPF9JMMxphaNQdMSpm8yxM842Ovn3KPN9/zki
 cdlIyZffJkr1UrSuH9een7iTkgnmyoBptmLLKiHP7Z4WOJjhEdPOCVN7AP6cUd+OlhOvGNiE82V
 lb4Yq6imcsBnzFzx7ZWIZsicYN8jmq
X-Received: by 2002:a17:90b:4b0a:b0:368:b92d:df93 with SMTP id
 98e67ed59e1d1-36923604ec3mr17560409a91.9.1779126473668; 
 Mon, 18 May 2026 10:47:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d12e38dsm157334905ad.77.2026.05.18.10.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 10:47:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 3/4] target/arm: Implement CB (immediate)
Date: Mon, 18 May 2026 10:47:49 -0700
Message-ID: <20260518174750.660258-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518174750.660258-1-richard.henderson@linaro.org>
References: <20260518174750.660258-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 41 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 293aa43cc9..c4a016f36c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1816,6 +1816,47 @@ static bool trans_CB_cond(DisasContext *s, arg_CB_cond *a)
     return true;
 }
 
+static bool trans_CB_cond_imm(DisasContext *s, arg_CB_cond_imm *a)
+{
+    static const TCGCond cb_cond[8] = {
+        [0] = TCG_COND_GT,
+        [1] = TCG_COND_LT,
+        [2] = TCG_COND_GTU,
+        [3] = TCG_COND_LTU,
+        [4] = TCG_COND_NEVER,  /* reserved */
+        [5] = TCG_COND_NEVER,  /* reserved */
+        [6] = TCG_COND_EQ,
+        [7] = TCG_COND_NE,
+    };
+    TCGCond cond = cb_cond[a->cc];
+    TCGv_i64 t;
+
+    if (!dc_isar_feature(aa64_cmpbr, s) || cond == TCG_COND_NEVER) {
+        return false;
+    }
+
+    t = cpu_reg(s, a->rt);
+    if (!a->sf) {
+        TCGv_i64 tt = tcg_temp_new_i64();
+
+        if (is_signed_cond(cond)) {
+            tcg_gen_ext32s_i64(tt, t);
+        } else {
+            tcg_gen_ext32u_i64(tt, t);
+        }
+        t = tt;
+    }
+
+    reset_btype(s);
+    DisasLabel match = gen_disas_label(s);
+
+    tcg_gen_brcondi_i64(cond, t, a->imm6, match.label);
+    gen_goto_tb(s, 0, 4);
+    set_disas_label(s, match);
+    gen_goto_tb(s, 1, a->imm9);
+    return true;
+}
+
 static void set_btype_for_br(DisasContext *s, int rn)
 {
     if (dc_isar_feature(aa64_bti, s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8fb1314bfc..1f114443c4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -217,6 +217,8 @@ CB_cond         1 1110100 ... ..... 00 ......... .....      @cb esz=3
 CB_cond         0 1110100 ... ..... 10 ......... .....      @cb esz=0  # CBB
 CB_cond         0 1110100 ... ..... 11 ......... .....      @cb esz=1  # CBH
 
+CB_cond_imm     sf:1 1110101 cc:3 imm6:6 0 ......... rt:5   %imm9
+
 BR              1101011 0000 11111 000000 rn:5 00000 &r
 BLR             1101011 0001 11111 000000 rn:5 00000 &r
 RET             1101011 0010 11111 000000 rn:5 00000 &r
-- 
2.43.0


