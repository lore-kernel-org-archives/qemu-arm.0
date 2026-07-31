Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F818C5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:06:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpakb-0001nB-QG; Thu, 30 Jul 2026 20:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakX-0001kF-B4
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:17 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakT-0001MF-Ba
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:17 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-ca913a601fbso241845a12.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785456312; x=1786061112; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rF9N2CY1bZsgTOugZFtnqkshHdgIZ9fG+p309nwOK2g=;
 b=OtHamJp83uTsH8sg6E2gjibGTblWURuZFkZ4vXESaxBKGy/nhp/gNprycFLgJTQI0i
 VEzWQ6/brqtS69QQer8RIkuKie/LV/zmgmU4Wm8wahiA25H8W3YEloK6Ufk1OqF7QqdX
 WRYkrpf2eo5/Fp6am/1MQkyU7M/bySTATjYePwRFdvsiSFBoXqRk8XOXLO1Ue5tOs5e3
 PZoLAa31da7dxvw+c/2UJl91IDAyzRKUKZnXaoF3677S+pZpT9VHCzkxwOojHwVS9yFT
 3LZs3Gvx5zK3ECy/BFRjXN6XhqQqnc97RoCEv0Kjj4l+0Thu0921QfQiEXaDaghC6DbT
 wFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456312; x=1786061112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rF9N2CY1bZsgTOugZFtnqkshHdgIZ9fG+p309nwOK2g=;
 b=VEs0F8bx63mcCMsUrxQzleHcfXGX1yYLevjzzNfm4G3gxsqf+iNMY1A7b+9F32zUo9
 UevUiX6RWAB7XY5fOvEXJAMdIOGUqZsL6XecLPqBZcGzIB4+BhI+B2NzVflZUnAgYIIY
 ArHKHOo8lI2IPLBIFTeUNOJE4q9njvJ/uQCWkbA3SLaxA7DQlg+EPT1rdh2X7n9blA2i
 LkGWTogUV6S22U1xeZmalFdVELeNLpsQ1Yqy7ZFT7mfwG/aVEzvx+ssJeXwqsouW+3zg
 zmGyhcyWtyWICjSykWxkIAkcseSU+zuugIBrhQt+Et1OsMV/violemn3faHpz1CZ74xL
 kgjQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq/xOexgxkFyvOCZdAdMtKEDuJWi3mXKuGzD6jQhTcTbeFpVr4uJgEDeWvugpkcoyAjDgf6Mf9sYg==@nongnu.org
X-Gm-Message-State: AOJu0Yzi8ISEyfDN07sfvaWiwKgb42uotuCKZUXqC/sYGoBNKklpWVuT
 h17EUjoKjur0ikgW3C2S5ig/JSAjGBAfMTnaaN8v71weMIRb+gss+Re0cYDbBHJZvbc=
X-Gm-Gg: AR+sD11aFtpkkm86hbwmpk3N3Aoz5dRmIQidnrYQWEn13Hh6vT7dDraQsGQGnwIKne3
 E02co+0TSe2q/CY1MMo/29qcdhCuxqd6K9wZGKlbIUenFrfPJBeHCb7h3dwHVGYX8uDpANfgRuq
 pJcjdrCSYlAYxarDZl3TqcEjd2lBUM/1eH0W3tfFT1oO5rscOzO2yxFMt4qSPlSdyt3daXe71Dt
 y3/BmA1rGNbfRX0MOa2YCBdd4J+qfuQPqvqe85C3hJyIoaPI3Jzsf2OY665FHInRJTnFlJCNbiT
 QsTc/MQn0MiDREjraoEEqFfCdkb6xxEyJ6M2SDrCotBDnQzAkgi+rF9M6guKHnO1CdXgEcmJmDv
 ULK7bYKq5cQk4iz8klF0gfVB+EqJLcBCo751qQXxO3+QwL/+LOQaXUFcV9xXON0aWNqgAy2yOv/
 X49zcyLPVe1RxBBP1/wzOIJMsLbgI/3BcozfyLz3990lLk9JmdLRJ+tG+I+Eh1gubzxIQ04uBCw
 2i3OWb5T6SvFHWbBTK3
X-Received: by 2002:a05:6a21:9d8e:b0:3bf:a7d5:df38 with SMTP id
 adf61e73a8af0-3c90067d551mr4324997637.9.1785456311768; 
 Thu, 30 Jul 2026 17:05:11 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a999ddsm2656460a12.4.2026.07.30.17.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 17:05:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
Subject: [PATCH 08/11] tcg/optimize: Handle revbit{32,64}
Date: Thu, 30 Jul 2026 17:05:00 -0700
Message-ID: <20260731000503.170446-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731000503.170446-1-richard.henderson@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

These are nearly identical to bswap, so reuse fold_bswap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index fcdef25bee..49242bdacb 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -534,6 +534,13 @@ static uint64_t do_constant_folding_2(TCGOpcode op, TCGType type,
     case INDEX_op_bswap64:
         return bswap64(x);
 
+    case INDEX_op_revbit32:
+        x = revbit32(x);
+        return y & TCG_BSWAP_OS ? (int32_t)x : x;
+
+    case INDEX_op_revbit64:
+        return revbit64(x);
+
     case INDEX_op_ext_i32_i64:
         return (int32_t)x;
 
@@ -1491,41 +1498,34 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
                                                     ti_const_val(t1), flags));
     }
 
-    z_mask = t1->z_mask;
-    o_mask = t1->o_mask;
-    s_mask = 0;
+    z_mask = do_constant_folding(op->opc, ctx->type, t1->z_mask, flags);
+    o_mask = do_constant_folding(op->opc, ctx->type, t1->o_mask, flags);
 
     switch (op->opc) {
     case INDEX_op_bswap16:
-        z_mask = bswap16(z_mask);
-        o_mask = bswap16(o_mask);
-        if (flags & TCG_BSWAP_OS) {
-            z_mask = (int16_t)z_mask;
-            o_mask = (int16_t)o_mask;
-            s_mask = INT16_MIN;
-        } else if (!(flags & TCG_BSWAP_OZ)) {
-            z_mask |= MAKE_64BIT_MASK(16, 48);
-        }
+        s_mask = INT16_MIN;
         break;
     case INDEX_op_bswap32:
-        z_mask = bswap32(z_mask);
-        o_mask = bswap32(o_mask);
-        if (flags & TCG_BSWAP_OS) {
-            z_mask = (int32_t)z_mask;
-            o_mask = (int32_t)o_mask;
-            s_mask = INT32_MIN;
-        } else if (!(flags & TCG_BSWAP_OZ)) {
-            z_mask |= MAKE_64BIT_MASK(32, 32);
-        }
+    case INDEX_op_revbit32:
+        s_mask = INT32_MIN;
         break;
     case INDEX_op_bswap64:
-        z_mask = bswap64(z_mask);
-        o_mask = bswap64(o_mask);
+    case INDEX_op_revbit64:
+        s_mask = 0;
         break;
     default:
         g_assert_not_reached();
     }
 
+    if (flags & TCG_BSWAP_OS) {
+        /* s_mask set */
+    } else {
+        if (!(flags & TCG_BSWAP_OZ)) {
+            z_mask |= s_mask << 1;
+        }
+        s_mask = 0;
+    }
+
     return fold_masks_zos(ctx, op, z_mask, o_mask, s_mask);
 }
 
@@ -3095,6 +3095,8 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_bswap16:
         case INDEX_op_bswap32:
         case INDEX_op_bswap64:
+        case INDEX_op_revbit32:
+        case INDEX_op_revbit64:
             done = fold_bswap(&ctx, op);
             break;
         case INDEX_op_clz:
-- 
2.43.0


