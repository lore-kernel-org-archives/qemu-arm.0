Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8580FC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:42:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNiV-00072P-2S; Sat, 02 Aug 2025 21:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiR-0006z0-1z
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:47 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiP-0004dG-GF
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:46 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-71a4742d81aso19662697b3.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185244; x=1754790044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKKdhFemsGNB6aPKRV6dAvFjepdpP1yhrMp+rKvStFo=;
 b=InSeZevgruqZ/wlG5LyJXiDCuqyqb5UFwtU2UdWxQk0J1BIcoma85Eu7UUX/bmSqjH
 K0Rg0G4TTaEKT9jQGTVxtT+LStfWeu9DDmNJW3Jlrc/O7kDtoKSCzSCMfa5AcRBIWbR7
 lhLftH7241vMWgtZp/7n4Nt+xzD5uajO/9KYOL0HMylZVR0hylmJO5Q+dEHBFcXCXyOO
 AHoBlp9t1RCxq7hKKcFCRDgNOajb7M/HZkq4jctLEwPkdIMrvAggt8W6PxleT9Ssmodn
 +/x0lXLx5dfubx8Z+rXEbqNXPQdNUr8lyWs6psk4wcBBgQObVTyad+mkBBtnLr7SjSqA
 g6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185244; x=1754790044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKKdhFemsGNB6aPKRV6dAvFjepdpP1yhrMp+rKvStFo=;
 b=scJIbQLnFgBSO5PXfZZxTc3RyuWS63ICXOxX63uLA8H4t36r3w/0emBZnb5pb0qVtL
 qcitY5sUR3yxZcWW/NqYfdxZwQP4Nof/kWPJGqWTEOcf+7nCebC78Z8JsW398C2F8G8I
 XRBSZOf8GvYEe+PegcFTTNDNr9RpzqplK/N72Sz4LCe968xHWyphjcWTmV+zog8p1+d0
 voxjf5AQTI5B32sJ4E1gN26LVAfcljUX6kB+o+NmkTvkvwkLQIiYpYl+qnCXZfkVQNAx
 L9K/DZ3TTslQJZe5IfTbUvdqi0ajCi8JVYsTYhGPvbHbvvLABIfGfL8QwyharEySFsZv
 DDdg==
X-Gm-Message-State: AOJu0Yz/0A4p9vLsOzsI4ifQGDGX4rICi1knIM88a6Ve4nxDeWf5M1qP
 H6H3Bs44GvYumnrE3aai5txh3WH0eAqz3yE/qDFzutm+zGdtAvQ2QtTNoK4g7EVxsKM=
X-Gm-Gg: ASbGncvbPUYwMSqqhAQ43Y2xHvJVRaDe54hS3+XL4JjQgdLJiA/vHT6o++c/lhcfnkh
 wjut+9B5fia8ns9D7rIOmqkMir6r0r6qbkwvnp7kO90X0eGYcBoDpxgLfBRN5mMGtAsAVXQqc9s
 W1PYB+GY+K4Cz9yR3ZlknB9PioHhjcgBON5VOW/wcZOu9cg5jNavmWdFiFLcKvi93vchsULSi0G
 cOKIDu9LyHN4OHp7j3JnfRb9TDljOdmwtNvhVnx14a/ujcvtcdeT5JjJdQvQ2rfuD4mzwwsrBYq
 48AldvuA4lXIQMSQshvaCHpvARhnN1R7zqZsThoDEWOS8LyXSm4kq8Sh4MB/wUim1lf3458BDO9
 n2ut2/YjyO5hfa5iAR89PrYvXTZcq/dw1QHXiXD9l1YGUUNhHdL3y
X-Google-Smtp-Source: AGHT+IFO1GSbAuNHuG3Riyg4mq6BpcUTTxud1+M1lxjY4Cf0Own4P7xDvhPIV8VqjXnyHf3Uhj1lWQ==
X-Received: by 2002:a05:690c:708e:b0:712:d70b:45d5 with SMTP id
 00721157ae682-71b7f437748mr59311697b3.33.1754185244442; 
 Sat, 02 Aug 2025 18:40:44 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:40:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/11] target/arm: Split out gen_wrap2_i32 helper
Date: Sun,  3 Aug 2025 11:40:12 +1000
Message-ID: <20250803014019.416797-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1133.google.com
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

Wrapper to extract the low 32 bits, perform an operation,
and zero-extend back to 64 bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bb92bdc296..64a845d5fb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8231,13 +8231,18 @@ static bool gen_rr(DisasContext *s, int rd, int rn, ArithOneOp fn)
     return true;
 }
 
+static void gen_wrap2_i32(TCGv_i64 d, TCGv_i64 n, NeonGenOneOpFn fn)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_extrl_i64_i32(t, n);
+    fn(t, t);
+    tcg_gen_extu_i32_i64(d, t);
+}
+
 static void gen_rbit32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
 {
-    TCGv_i32 t32 = tcg_temp_new_i32();
-
-    tcg_gen_extrl_i64_i32(t32, tcg_rn);
-    gen_helper_rbit(t32, t32);
-    tcg_gen_extu_i32_i64(tcg_rd, t32);
+    gen_wrap2_i32(tcg_rn, tcg_rn, gen_helper_rbit);
 }
 
 static void gen_rev16_xx(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn, TCGv_i64 mask)
@@ -8293,11 +8298,7 @@ static void gen_clz64(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
 
 static void gen_cls32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
 {
-    TCGv_i32 t32 = tcg_temp_new_i32();
-
-    tcg_gen_extrl_i64_i32(t32, tcg_rn);
-    tcg_gen_clrsb_i32(t32, t32);
-    tcg_gen_extu_i32_i64(tcg_rd, t32);
+    gen_wrap2_i32(tcg_rn, tcg_rn, tcg_gen_clrsb_i32);
 }
 
 TRANS(CLZ, gen_rr, a->rd, a->rn, a->sf ? gen_clz64 : gen_clz32)
-- 
2.43.0


