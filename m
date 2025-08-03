Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543F5C87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:43:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNiq-0007Qh-Me; Sat, 02 Aug 2025 21:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNii-0007Hk-CQ
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:04 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNig-0004fJ-Sd
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:04 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e8da9b7386dso3594933276.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185261; x=1754790061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMxc6fiRC/TSWaDb+UxvoNbCW0f32j2TXZfWROF6WOU=;
 b=wQcNqSPt3un/SFnjVAa31fQz96RT7o9DQae9fSat3t0t/AzLXIveQo+G+ZYcObwXio
 TzNFPYVZSvzrZ0+CAR520JWOP+gVTfbFRTVbndBFXFb5/gfuHu0/oeseknsKBEZx0XZI
 vrnY2wRxCyEdWo5qkkjEhFfo86cThDcEzJMdWh+jBnlfDE8pxCMOEh51rqyBU4cnr5fr
 7ugYPD/fNNTEfO3AgHkd33H75CdBtqTyEQq883ijYNvX5fGeg4v0O/orvtT/j2WXxOuS
 SjKzam2NZbErqz41zLUKW1Z0cvl1AC2I1xkPyQeGsjR5EIKPAk60qMksry64/x/IKAtO
 fkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185261; x=1754790061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMxc6fiRC/TSWaDb+UxvoNbCW0f32j2TXZfWROF6WOU=;
 b=a/N+YDeGjWV5RyUMZR1ouH+HPd/EGigH79YiXLKNHySy0mRWR6OOuLjUs1HcqE4uks
 M21j0wAf9xjP3qot6FapjBs/AY1DGJ7/PGdlFQ1tvDJ4ZiAGscrZm3Xti3IupXT69Y7/
 OP4xNul3HOhPm0KSMdMJbPSaM2jZPbSpos2gvpAyiwBfkSydBP1hGUWATIbBtlsCfroJ
 NvB+9nVAc6akl5uxRykVx8xtgOWa/FWU+47GXLExxS5nadBj5rKK4UIUCXF0eMm8Zc5i
 d/vys8C6erwIKlWhYJZsEN5K8j2gRnrQxuU0Fw4lPl4OdSpPeC5nXLPeIwdFQy6PY9Hv
 PHNg==
X-Gm-Message-State: AOJu0YyWaz1vNRcO7mzuT9Y27WTEjR3K0lhmuQspw8mpkq5/0P/6x2NC
 vufI7pbRiwh1sX5wGnKH0cMbWkEw6Omb11b/jBS9ur005GbCc8gC9lWlsVCWkTz+k1o=
X-Gm-Gg: ASbGncuW+eUaM5ouyKe/XhnXlMPlIbiQvDRuOdM0qkmAUkIh8X/TagOkyZUmjVGOiJ+
 DIkzD0SeOJ8KB2yxfdxTZ5J/MFFDGxJaf9k0mnrOQzjq7q50zTXrKY2jkfrQX7f93PKn6ul09pa
 uHgQf2W2Ay67lynwfLPBYq7g1kOj1/uEA+H8bwolDBsF7NddYb6WXZ0aueyaIfAzBnNvsreP31R
 pme/RI2hCsWu3cEAfwF7leQzk0Uo5R64Q6cHOWTxLsIDEqz3S9osREX9vxvV/lGPQkrUY3mY7az
 LyW/1wRBYiETCNlhuhat/tmuAWAkpE/brrksj7TBs/jQze5QCRqNUPlmgGiz1VZBVLC/4bjLLhe
 9yr1gtDxqSb8tvYd3PzP1fhlXsBliltt8KJBam6D+sGiFmaC6IrK3M3uwg0xYFFM=
X-Google-Smtp-Source: AGHT+IE7LTXFZXxRSjSbqziM+GlJjcZbOlYWM91f63DAI3WlHcfiFrh6LoDq8hABhe/qIFUDdsLsXg==
X-Received: by 2002:a25:7e07:0:b0:e8e:1983:668a with SMTP id
 3f1490d57ef6-e8fd5308f2dmr10188122276.1.1754185261473; 
 Sat, 02 Aug 2025 18:41:01 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:41:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/11] target/arm: Implement CB, CBB, CBH
Date: Sun,  3 Aug 2025 11:40:16 +1000
Message-ID: <20250803014019.416797-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb29.google.com
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

Compare and branch instructions, with various operand widths.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 60 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  5 +++
 2 files changed, 65 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0c78d4bb79..f3970ac599 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1706,6 +1706,66 @@ static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
     return true;
 }
 
+static bool do_cb_cond(DisasContext *s, int cc, int imm,
+                       int rt, int rm, MemOp mop)
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
+    TCGCond cond = cb_cond[cc];
+    TCGv_i64 t, m;
+
+    if (!dc_isar_feature(aa64_cmpbr, s) || cond == TCG_COND_NEVER) {
+        return false;
+    }
+
+    t = cpu_reg(s, rt);
+    m = cpu_reg(s, rm);
+    if (mop != MO_64) {
+        TCGv_i64 tt = tcg_temp_new_i64();
+        TCGv_i64 tm = tcg_temp_new_i64();
+
+        if (is_signed_cond(cond)) {
+            mop |= MO_SIGN;
+        }
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
+    gen_goto_tb(s, 1, imm);
+    return true;
+}
+
+static bool trans_CB_cond(DisasContext *s, arg_CB_cond *a)
+{
+    return do_cb_cond(s, a->cc, a->imm, a->rt, a->rm, a->sf ? 64 : 32);
+}
+
+static bool trans_CBB_cond(DisasContext *s, arg_CBB_cond *a)
+{
+    return do_cb_cond(s, a->cc, a->imm, a->rt, a->rm, 8);
+}
+
+static bool trans_CBH_cond(DisasContext *s, arg_CBH_cond *a)
+{
+    return do_cb_cond(s, a->cc, a->imm, 16, a->rt, a->rm);
+}
+
 static void set_btype_for_br(DisasContext *s, int rn)
 {
     if (dc_isar_feature(aa64_bti, s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 766c610c01..fa94631123 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -208,6 +208,11 @@ TBZ             . 011011 nz:1 ..... .............. rt:5 &tbz  imm=%imm14 bitpos=
 # B.cond and BC.cond
 B_cond          0101010 0 ................... c:1 cond:4 imm=%imm19
 
+%imm9           5:s9   !function=times_4
+CB_cond         sf:1 1110100 cc:3 rm:5 00 ......... rt:5    imm=%imm9
+CBB_cond        0    1110100 cc:3 rm:5 10 ......... rt:5    imm=%imm9
+CBH_cond        0    1110100 cc:3 rm:5 11 ......... rt:5    imm=%imm9
+
 BR              1101011 0000 11111 000000 rn:5 00000 &r
 BLR             1101011 0001 11111 000000 rn:5 00000 &r
 RET             1101011 0010 11111 000000 rn:5 00000 &r
-- 
2.43.0


