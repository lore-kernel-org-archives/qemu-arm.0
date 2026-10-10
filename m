Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EED6CA6017
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 07:11:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFRDZ-0001fc-Uy; Sat, 10 Oct 2026 03:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDX-0001cn-53
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDV-0001CT-BT
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so3476815e9.3
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 00:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791616200; x=1792221000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VHCB9DX8tcxfGGEoMgC60hBr/Ih8fWzh/Zex2K4jIpc=;
 b=wPeEy/QYIyMViDuqF5A1Qb1/ZUB4RA8IYyU6dZEZ7XroOm4uOY5G3oN9+EIOY0kgQV
 i/872qIsT0dgqQ1aeKqfOhyaYY7qajJ7BTRji1EG3hgtExVmhoes7x6ciif7+551ixu9
 Lc3AjybkMelo83q0qxpdj2tuq3ENGobGRuxyujRhO/Opg4bMBXtsBKIaO3L79KmGUgZ2
 M00QVTsfdnvZzKhXYcbC3R6N4KdrYjVbXFxK0uXHshRdnId0/7FPerUUvl0JrzW3JoCh
 SKroweip9y6DCAVUJ8Px3DdhRK5bGWy114sSAR3A586MxhrIZzCR/d8XE0UGLkUf4iro
 mqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791616200; x=1792221000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VHCB9DX8tcxfGGEoMgC60hBr/Ih8fWzh/Zex2K4jIpc=;
 b=tfR8JCfxJB5SAmYOnuDF0XG+0qBNcg2wD5zS2J+j2+zDEPKFpWhGFrzev1p6tuwkmp
 sOyxw6emDdjLR4mPiFmujfEth/0F/MAY/hMsVpH7/1vKP5n7PneqJZyYa7+hmMq7+FFX
 Tv1o3zFVM43l4xsLZ8LxHJojZ9nGp3iSoNjXTurhOlXa4sYYFDGxSpRLA8czJPxql5Z/
 fYx4UK49rKZS7KloNnEH3e87GoSg5x8Gx7/zEf6ZAIyUc9gkm6oZQINIAmGHIQEQBnNe
 KDvNo3lBHtRg8lp0kAgg9GOYYtuJ1EW8Zk8P32NCUtQLnE+lCtVq8KDp3mpgC2DCOCb8
 yI8w==
X-Gm-Message-State: AFq9FYLQyCKxpema++v/OsNqkeQ4esU6W3COyTEBo1+c8bNw/KDKdzVY
 zKOvaIsxlyU0vsiQovCQjqCgXTtr9gybnpEo65jay2ts5lgguBNKbx2szZ/I5OVo+x7L+lPGyRL
 JvM4OkwY=
X-Gm-Gg: AYBFou21gDL99m8m5msbpG6jH4NPgm2+a00q9rEit2h6qs7x/viAaqC7KkqK9JPaCLM
 l3RDuDZtSK9M1E2ZfVrdw7Ak1g8QAz23KRrO31hMow400ev6ejalKRSMz6H/XEfliWZeBoKsBvS
 86Np+2VhGkcnUTneGQg+9g/hxR7X5kJHqJui0VAmNAG6RMuRl5qGBBAWzIIWgjd2jYO53hT80Sv
 MxMJ8KcztAM6j2VmaQ1c9xwR9zCMQ86Z58qxakKgRvloXV5YOlpAy3u1HDQmuDZa+cW20m9tfOk
 VHvaIcOcMBR3FdI+peTc4QTBs972igO98rQvkWnRwcLv52pSYsHL4d33jopSjluOU0oLxwJoOxk
 uPiZ5ZXPnUbo/cESHHXNrVCYFyE/xMNrT5eFH0RZ0DTVKBdYFspj7OU6tSNO4TW/Cc5036Fr7p8
 ZOk7MGa4Qo4kLdYBuGgSTLAVr4cnNaYTkqHg/CSHllbaXwa3AXwK1O6iiMZnDUleTHrwgc8d975
 +17GiKt/3sj+uhI/fIdVg==
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id
 5b1f17b1804b1-4a18e4a8ca6mr73389155e9.12.1791616199835; 
 Sat, 10 Oct 2026 00:09:59 -0700 (PDT)
Received: from stoup.local ([2a00:1e:e082:2901:a2d3:66fa:95e6:7d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm7662252f8f.36.2026.10.10.00.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 00:09:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 5/6] target/arm: Implement SCR_EL3.TID5
Date: Sat, 10 Oct 2026 09:09:51 +0200
Message-ID: <20261010070952.323466-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010070952.323466-1-richard.henderson@linaro.org>
References: <20261010070952.323466-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ae1b8a57617..1d78b14eaa0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5669,8 +5669,21 @@ static const ARMCPRegInfo dcpodp_reg[] = {
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
2.53.0


