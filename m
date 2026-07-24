Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B0BC531D0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:12:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6Jz-0004mn-4a; Thu, 23 Jul 2026 23:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Jv-0004W0-UV
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ju-0000Uu-9F
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:31 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cbb7926836eso957881a12.3
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862689; x=1785467489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SAyYUmifYabZlR5CRo10gOux2eBGZPMIZfd2TBGiSro=;
 b=NpwLWKxACrKljYkTN5NV+zSvuLAsBJrV9KxzmqKKzNvIcOssGwGvaXTXEFzADqNlp1
 cv0nExupOPYvjsP2W5kZW/92i1C+IMtb717sEps+JpgOUPB4KUp7+dhkGorPt1NX/4R1
 +3uMyvaaqmlE5VYjkIzXcCBcCuAjHhO2FyjsQ4yTrtgobQWLNFjs/1zb93NGb3S21KKi
 bhEwdnKLJF+Bbfw6pdLJXUs7CoM9OK75cUGWoz97cHQKeGj7nqFCqvJWTFbPnfzfveoi
 eIFWkCHzLL69RzOfTpW58RN3PAJ+DFP4LXCc9hJ/ftWyonJn5VhaVbJaLDAjTmQYnmA6
 g6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862689; x=1785467489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SAyYUmifYabZlR5CRo10gOux2eBGZPMIZfd2TBGiSro=;
 b=EO8q7f5yoKnt9OY37g1oRtBW1ppmOWpajMrjQyew2KQt15kuuFM98zhI0xalcOpbN8
 NLh94oEE4KceThFDS0Ew+ZmwV1mykFXo34QgvFLNhFpQ0LvSGbVQ3Ls7yTDD8wzQHmU8
 tp3qu3+zvwhDolBEIGKRLbEoF5ZPbmUUHxuSzhrOc5zNyMg0FTvb8oJkTti5XD6kiEXk
 rID4b1SAyIQA3/cOmmF/5WjF1Nnja2jnajjt8ncjN+TdaufeHTJhquFVsTNKQsCt5YkD
 OoS2/29JhhrCgS6PpMhhizQNaq00j4G9vGU0WUARQwcnQWZEqgMe65rvcvBCJGp+4nhw
 BneQ==
X-Gm-Message-State: AOJu0Yya4XjVaSHHp1k9mOOJnjVp08df4XivkukrShOgkQ+JDW/yokwi
 iPwAX/ILXhL9ACUVJkcksz/hXqKiMZ8nAcOfIkMlruJ+3kBnxhL1Xr6VmXg+FP7r3fw0ZUtn3t+
 2pXcN
X-Gm-Gg: AR+sD13KNqCQglkHbrHp9yOv35MjyGps1zIFByiYNFLG3Kw+pn8rBqMEgXOvYbo6etJ
 8Kik+jBCOfgLe4nOEDPZBd2MYDUlnY1E3zmx3bpu0wPR/44l5yGPOw0dE6S8zq3StJG9tLG5a5z
 R/DVi//yS7CcOjSTGJflr06nfxO1bu/Z0MLdd8coztEUyk8lXhbIqetHy3ckkxXCIMwRk6QzryU
 nTs3l1hJL6GxTBDMQNqLq46QLn8JUkEj2FzixpRTQjNn5mPjHyBkUZE6AFq9OX7RZhXaBfLjdjO
 UZX0IVNNI8XdizpaIyMp/bgRLCOY4Ygy313TkRmTV065Cnn12u1ZJYmSKDXeKHCs/KEFVUC8iI3
 +IbdRqJvNHbvSVBEBgtwd4u10ODVHIoIc7YM0Sq+heo4YBLO5AF6r0cLXBLUcNIE5o5m9GAgmBv
 /Krqmtw0dcGD5zyd+ZPoMuIInS/UH1V0MB2LD/MpyEzbe/
X-Received: by 2002:a05:6a20:914d:b0:3c3:a804:8eed with SMTP id
 adf61e73a8af0-3c44b2030f5mr6619728637.56.1784862688871; 
 Thu, 23 Jul 2026 20:11:28 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbb8f0d872bsm3617697a12.7.2026.07.23.20.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:11:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/6] target/arm: Implement SCR_EL3.TID5
Date: Thu, 23 Jul 2026 20:11:22 -0700
Message-ID: <20260724031123.76597-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724031123.76597-1-richard.henderson@linaro.org>
References: <20260724031123.76597-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 target/arm/helper.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 022a63a511..c92df41707 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5485,8 +5485,21 @@ static const ARMCPRegInfo dcpodp_reg[] = {
 static CPAccessResult access_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
-    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID5)) {
-        return CP_ACCESS_TRAP_EL2;
+    switch (arm_current_el(env)) {
+    case 1:
+        if (arm_hcr_el2_eff(env) & HCR_TID5) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        /* fall through */
+    case 2:
+        if (env->cp15.scr_el3 & SCR_TID5) {
+            return CP_ACCESS_TRAP_EL3;
+        }
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     return CP_ACCESS_OK;
-- 
2.43.0


