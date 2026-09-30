Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A12CCA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 19:26:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBzwP-0004OW-9t; Wed, 30 Sep 2026 15:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOy-0000pf-2t
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:36 -0400
Received: from mail-wr2-f34.google.com ([74.125.225.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOt-00080p-0A
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:35 -0400
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48b00a0ac65so664856f8f.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 11:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790794289; x=1791399089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vqQmC6CDMlPYibl5/L6XkExEQME5eKRF7tUaPmypv+M=;
 b=ms7X/Q76ommKVdJricQ21klJZpKU1E8wKuZgbXDYLiVP0N498d3qO3D10CePkOvTwK
 St17PEz5vGxDO9smSbsT4+nnp1wuBsEfFCcSkg3C5+9r/cT7KRlPg/Y1xR67wO4iIdet
 e1jgZqwNWofkkpnwo4vbiensQl/GZDP4Gi0Z1zX1aUJk07h4MOM65IrtdBt6FuLeEvD7
 RCBVe3mtXH5vlOSmz3jPtuVpWovds0z60zDEuDdlCF8DdPLbGBuIg5SCWNZvH2UIUf5e
 c00qCSS9OFpT6w3R50DM6hwhk71HQFUJDigV33jcR+cPIg0C9BvayoEsx191BdBMkrbv
 ACCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBySVobuQ4tiCeyVs3I4yul/KgVVoo+Br51FldGP9CbFhzx1Af+TpJLfK/Jr7/u3XaI0/MT1n20d2Q==@nongnu.org
X-Gm-Message-State: AFq9FYKq5g/v8RAUaLKZEb1W2aVm3lkK/l0AqV3AUagdBgBl9uFv5Lwr
 DVOkiBDdoB5qAJWpgayHKwYVLL8MJZP27rVe9Rn/PozLa59/NXwIJqui
X-Gm-Gg: AYBFou2zBeDaeongde49gQ07fp4mGHSGoEjQBvfjAQDji7cyVxn3W+R78OHSSpuzk9l
 cHt1X0+BZ2NtXdPrHSadDWdbjr9NIxoS4G0E+3lDFXAU7+/TwGsGZVNpWstCWmMJCwe3iWxEUQl
 FnqFT9skeZ14ZtMI9LpgvQot3eYRN4Es7p9i2oBP2dDVgRiFnee1EpTY3owgXVQzvCWzBhTd7Ys
 a/bxr2HwNHYBeU+iV3X76l9wSzpEuiFv/Ae3msZKXUaBi2goJ0XHg0lEQ/ozLLl2ofcMNOUKZgI
 +4TTUS8IeHNmNBFl2FiVEJvJJy1Hx1apaNqEisihIDQEPoauIXpKqMK5vnFAMytAzHVCluo/cMT
 9fB7nUkyPckzKbQtkTOL9klPuaeFkhOnjcKhpLIr+ZkRgNo3GNzHhIM19PFrTb+qm+3/01hezAr
 WEVO3ATfXk6Nmo3dWGBn/YTtdHhqyD0o0Atanall2W4178Dec9xTcRUp0=
X-Received: by 2002:a5d:5846:0:b0:48a:f215:c67b with SMTP id
 ffacd0b85a97d-48b0251d247mr4972583f8f.37.1790794288662; 
 Wed, 30 Sep 2026 11:51:28 -0700 (PDT)
Received: from tower ([185.182.52.52]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff96dsm1162790f8f.8.2026.09.30.11.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 11:51:28 -0700 (PDT)
From: Dominic P <gcc@gcc.dp11.uk>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Subject: [PATCH 1/3] tcg/optimize: Do not derive s_mask from rotated s_mask
Date: Wed, 30 Sep 2026 19:51:22 +0100
Message-ID: <20260930185124.3036980-2-gcc@gcc.dp11.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
References: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=74.125.225.98;
 envelope-from=dominic.plunkett@gmail.com; helo=mail-wr2-f34.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Sep 2026 15:26:08 -0400
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

fold_shift computes s_mask for a rotate by a constant by rotating the
input s_mask.  The result is not a sign mask.  For TCG_TYPE_I32,
fold_masks_zosa_int then ORs in INT32_MIN, which can make it look like
one: after sextract_i32 x,0,8 (s_mask ...ffffff80), rotr_i32 by 1 gives
0x7fffffc0, which becomes ...ffffffc0.  A following sextract_i32 0,8
is then folded to a mov.  rotl_i32 by 31 fails the same way.

ARM, qemu-arm exits 255 instead of 7 (correct with -one-insn-per-tb):

    ldr   r1, [r2]        @ *r2 == 3
    sxtb  r1, r1
    ror   r1, r1, #1
    sxtb  r1, r1          @ dropped
    cmp   r1, #0
    movle r0, #255
    movgt r0, #7

i386, the same with rotl_i32:

    movsbl %al, %eax
    roll   $31, %eax
    movsbl %al, %eax      # dropped

Handle rotates like the logical right shift and let fold_masks_zo
recompute s_mask from z_mask and o_mask.

Cc: qemu-stable@nongnu.org
Fixes: 93a967fbb57 ("tcg/optimize: Propagate sign info for shifting")
Assisted-by: Claude Opus 5 (Anthropic)
Signed-off-by: Dominic P <gcc@gcc.dp11.uk>
---
 tcg/optimize.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1e4d2a0a42..27b7682bd5 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -2703,9 +2703,12 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
         z_mask = do_constant_folding(op->opc, ctx->type, z_mask, sh);
         o_mask = do_constant_folding(op->opc, ctx->type, o_mask, sh);
 
-        if (op->opc == INDEX_op_shr) {
+        if (op->opc == INDEX_op_shr ||
+            op->opc == INDEX_op_rotl ||
+            op->opc == INDEX_op_rotr) {
             /*
-             * Logical right shift will force the sign bit zero.
+             * Logical right shift will force the sign bit zero, and
+             * a rotate may move bits unrelated to the sign into it.
              * Don't bother computing s_mask and let fold_masks
              * recompute from z_mask.
              */
-- 
2.55.0


