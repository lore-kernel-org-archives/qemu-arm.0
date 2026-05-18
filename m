Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A87CD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 17:49:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wP24q-0005Wt-1y; Mon, 18 May 2026 13:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24X-0005SC-B2
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24R-0003m6-8R
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:06 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b9fcf7c91bso27579605ad.0
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 10:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779126473; x=1779731273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtjlPS4phLWwZXeGR6GMzLRtHY+h8FoS/XJKt4A73dQ=;
 b=JJDPFsMnAD/M5czstN6YWLVlGtynx7NW3aXnstTYAMZAoSTjsKV6sUK+UNvn91G4sb
 wY4Ue43quAfsvpCj+Bk4GLsmzBLYYVYFNjMobE5wLKu3tcVWa3rew6QbguZ2Y4T+LhhH
 NHVEGVruN/ajw9qROmeczT4y/GhWv9QUlLRWcmQyB/AagrTnX71V20PEqL1qqbF2gkT6
 1pVDU/znV7r4/GJVMDQMr1GOwG64K1nUcf1G5q9/atQpU3F2adDqoktdbFVjMuAIrASG
 h9UKLX3wS/03jq8SoLmvH6opSBsm1khwd0t1lJQkem87rz9G9W8kQ1etq+Ypj979CbXl
 EPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779126473; x=1779731273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KtjlPS4phLWwZXeGR6GMzLRtHY+h8FoS/XJKt4A73dQ=;
 b=R2b1t+pvKpRo9uPByrcvpjERRUQo+IzO9cBTLgdt8eTOhdmyNUmd8Yn/PajIz1Slag
 V/wVaGbvquzx4nwZNyTCLY946LYnAIIngbyMzzphCX0C/Dq1XToR4nb6EPe8e0HJHnhR
 CtlvoucsmOL7YqfNRIZJmAPHJjoLSOvOAjWF+oKSPVa/M4UUzFIMFsM6XihRq4eI5Squ
 tOGrugN0eOH4eM94PGF6Qfn7VRhOrp+zdtYrv3Tx7ztePnP7crWaxmJCvDItmSD2E7X6
 vHWyjJAJqAsaCFgxgsJ3J6xaRorB06xFYWAwvQLK0LdsY8vHn6PmICdHMJXs2SNaVTLI
 rn0A==
X-Gm-Message-State: AOJu0Ywz95ZdqvFoZsQuJ9LsUwDNUrMalkOcXgM+2Z8GOEpt0FZRDcfF
 5DyldyJjas6jZFUvvfDLrRNbogD+RMk1wd5Fd6g6wMblT92KaaM0/shK+On9yWylFoY=
X-Gm-Gg: Acq92OH+vA3DbTovpiBtvUtEeG59fi4O6p1dp2OrmJ5hsgKrAUBCId597arRiyqq5Ei
 xcpbnEEYT++zmg70f2DXtIAdo/k/1/1t5QOrmrt3Os962fsE2T6JkIFdAztuKav44H6xSNYnXSl
 sNmfWuW83Z/ucYog7WrXG8sMjvJr0ztcVXaLkZAzcBBZIOCBwJId/BX/za1sZWkBESxLikEkKyZ
 Ap5rU1nipP2HKIBCLPTdOruUHQfF1HcYxbXEzDFpEpgD4sAfq4gWiZ8Hq0+zBSTJsOYg7adWF7k
 8pLDzpJlpsjQ1twyNjhyhrxecrbgc2SW0BDaxrRPvg2VO7Wcds0kSrvOUhoCClA/hClb9fqQjO2
 HmVMiZhVEbXlpzPn1pDTLkmj0hp0TX4VVKB6phovaYWPICQYuUf5xMdTOWQO5VrxK9Vo3agCdLj
 IZU1wgSEUeXIFdGBfUpjRjTlyRABXrxz1HLGKJUK0=
X-Received: by 2002:a17:903:8cf:b0:2b0:4fb6:85ce with SMTP id
 d9443c01a7336-2bd7e8c570cmr113802005ad.21.1779126473067; 
 Mon, 18 May 2026 10:47:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d12e38dsm157334905ad.77.2026.05.18.10.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 10:47:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 2/4] target/arm: Implement CB, CBB, CBH
Date: Mon, 18 May 2026 10:47:48 -0700
Message-ID: <20260518174750.660258-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518174750.660258-1-richard.henderson@linaro.org>
References: <20260518174750.660258-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Compare and branch instructions, with various operand widths.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 42 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  9 ++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9a27c4c6ec..293aa43cc9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1774,6 +1774,48 @@ static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
     return true;
 }
 
+static bool trans_CB_cond(DisasContext *s, arg_CB_cond *a)
+{
+    static const TCGCond cb_cond[8] = {
+        [0] = TCG_COND_GT,
+        [1] = TCG_COND_GE,
+        [2] = TCG_COND_GTU,
+        [3] = TCG_COND_GEU,
+        [4] = TCG_COND_NEVER,  /* reserved */
+        [5] = TCG_COND_NEVER,  /* reserved */
+        [6] = TCG_COND_EQ,
+        [7] = TCG_COND_NE,
+    };
+    TCGCond cond = cb_cond[a->cc];
+    TCGv_i64 t, m;
+
+    if (!dc_isar_feature(aa64_cmpbr, s) || cond == TCG_COND_NEVER) {
+        return false;
+    }
+
+    t = cpu_reg(s, a->rt);
+    m = cpu_reg(s, a->rm);
+    if (a->esz != MO_64) {
+        MemOp mop = a->esz | (is_signed_cond(cond) ? MO_SIGN : 0);
+        TCGv_i64 tt = tcg_temp_new_i64();
+        TCGv_i64 tm = tcg_temp_new_i64();
+
+        tcg_gen_ext_i64(tt, t, mop);
+        tcg_gen_ext_i64(tm, m, mop);
+        t = tt;
+        m = tm;
+    }
+
+    reset_btype(s);
+    DisasLabel match = gen_disas_label(s);
+
+    tcg_gen_brcond_i64(cond, t, m, match.label);
+    gen_goto_tb(s, 0, 4);
+    set_disas_label(s, match);
+    gen_goto_tb(s, 1, a->imm);
+    return true;
+}
+
 static void set_btype_for_br(DisasContext *s, int rn)
 {
     if (dc_isar_feature(aa64_bti, s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 01b1b3e38b..8fb1314bfc 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -208,6 +208,15 @@ TBZ             . 011011 nz:1 ..... .............. rt:5 &tbz  imm=%imm14 bitpos=
 # B.cond and BC.cond
 B_cond          0101010 0 ................... c:1 cond:4 imm=%imm19
 
+# CB, CBB, CBH
+%imm9           5:s9   !function=times_4
+&cb             cc rt rm imm esz
+@cb             . ....... cc:3 rm:5 .. ......... rt:5       &cb imm=%imm9
+CB_cond         0 1110100 ... ..... 00 ......... .....      @cb esz=2
+CB_cond         1 1110100 ... ..... 00 ......... .....      @cb esz=3
+CB_cond         0 1110100 ... ..... 10 ......... .....      @cb esz=0  # CBB
+CB_cond         0 1110100 ... ..... 11 ......... .....      @cb esz=1  # CBH
+
 BR              1101011 0000 11111 000000 rn:5 00000 &r
 BLR             1101011 0001 11111 000000 rn:5 00000 &r
 RET             1101011 0010 11111 000000 rn:5 00000 &r
-- 
2.43.0


