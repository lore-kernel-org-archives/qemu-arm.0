Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A9C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:44:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFoa-0003U1-DC; Wed, 12 Aug 2026 16:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoX-0003T9-W7
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:42 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoW-0002E2-G4
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:41 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-84e0688b7e8so29126b3a.1
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567478; x=1787172278; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3akShtEwH2yEkecYdy8M8JZlOVHw/AUW4gO3Tv3SW4w=;
 b=OjzzHWVKremAkUUei5GMSJQV+szuk/NGFJfvbcCQ8lqWDJfSK+vIqvcWitK8LWXMwY
 WU2MEW/DT+A9LynaFzlnqdL53KX1bNPXzKr3YpMItThqm8D0tu3vXPhEUWRBDu6x5i9z
 us0iK105HEe/Zn9CcDunJho/U9BHQ0XhcvJBVyGTeFpnmFEmRB0PZmT/ZA6RHhXBCTEH
 7rc692ZrR1KlU23mlQrTp7k45YXGG5KE/pnhW08RGuD3EJDQmhZsBbdbw0VDdi7RJVwt
 uIYWF/BOCxNCP+yPFnBL/pNX0EQSPZE+1CmabmCYcpKf+3kwIMNaMc58vgVDw3ALjTsS
 bDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567478; x=1787172278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3akShtEwH2yEkecYdy8M8JZlOVHw/AUW4gO3Tv3SW4w=;
 b=kaHOKLgHIeHps8NY1rrQCrPB61P2ICSkggscY0ZcehlKpN6UZp3jteSDD7dUsi77o/
 hbTcElouTcGMN0CWoMg7iaSbgQ3aggsKBbHUv0vfk1FLa7HwFq3eSby2DKbL8Pg1e3ew
 HcjGc0BQjM12/SNE269QVxiRxHK0iWzJ3sjHzPFLADt54/N21K76yJl7GhG857fhu9OA
 q/axdhML2w+QT2ny35v+Ymo03MW3dZhtnBqPaJA1cRGHfNfdXDwZ6fOydpPOqequFIHv
 iCQ6A5S+flCO4sQIiBGAjyyKLEWUgAe+GaHeicORi/+fbL0Xgq0ykqKTo3UUzl7J/V66
 Ousg==
X-Gm-Message-State: AOJu0Yw/Cnz1N7qtsvGc0AxHvfeO/n2iLSiYEq6G35f4ayYk5oxtewd9
 iPdmIfDBqBK2ZsQRJucBqqRdLZgu9xlZz6Vd6p/apApSFfFK0rSI7LHNFoclIRTc8m8=
X-Gm-Gg: AR+sD13rahsCvrmKDqP3ub+OJcw/IoA941NO3rAuz1FQ/4ebc+6XHbnBFGxjbFb9IO1
 YJSQNPsTsOIXVQd1LVq8suiMqE05oPU69qxyrDa7e/hv4unE+Z9/x/l5w7TN3M95zQkABAxbvYB
 inKYBbm8B4XeO/bhTP0djX14NrFnV15QIwJldewyie/B66fX7TD7EEXbXeCcbfwXjCNLjG269vf
 xgiDCzZyXnbYgPII0JgVtUftY2bHVUCkisnYSI3FQrnrLMAqj/M3tFYBcAN8gKAR2g4wRqPF3Qf
 85A4ajBAniOcCmfNudZJpTi+w3dDC6dgyfuy/v23XwiqnwSLO9ZXw3gVu46iZRa0qT7YztRUtZM
 Yn7VaXHR35tO0jN7xwNjvQ0I/80+EEAsn45kD1OmgZB239IttuP3GH/hii9caUTFQEUelXXLzIA
 AQz6Xv834L/pKOUaSv7Kvr5klpvEUA3P3SNldCcJGWIq1c9MghQ+QMKZ7i9aF9SNL56g2idLQmX
 r5wE4ZP89QQ7utCz0qghBtYtuXoojo=
X-Received: by 2002:a05:6a00:bb0f:b0:837:f79d:909 with SMTP id
 d2e1a72fcca58-84fc75032c9mr511176b3a.39.1786567477627; 
 Wed, 12 Aug 2026 13:44:37 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 01/10] target/arm: Tidy cpu_max_initfn
Date: Wed, 12 Aug 2026 13:44:26 -0700
Message-ID: <20260812204435.295067-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
References: <20260812204435.295067-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Once we have eliminated hwaccel_enabled, only tcg and qtest remain.
Separate tcg from qtest initialization.  Remove an assert on
aarch64_enabled that is directly protected by a preceding if.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-max.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 88b7c04633..0a310d1b15 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -203,29 +203,32 @@ static void cpu_max_initfn(Object *obj)
         return;
     }
 
-    if (tcg_enabled() || qtest_enabled()) {
-        aarch64_aa32_a57_init(obj, !aarch64_enabled);
-    }
-
-    if (!aarch64_enabled) {
-        aa32_max_features(cpu);
-#ifdef CONFIG_USER_ONLY
-        /*
-         * Break with true ARMv8 and add back old-style VFP short-vector
-         * support. Only do this for user-mode, where -cpu max is the default,
-         * so that older v6 and v7 programs are more likely to work without
-         * adjustment.
-         */
-        cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-#endif
-    } else if (tcg_enabled()) {
-        assert(aarch64_enabled);
+    if (tcg_enabled()) {
         /*
          * '-cpu max' for TCG: we currently do this as
          * "A57 with extra things"
          */
-        aarch64_max_tcg_initfn(obj);
+        aarch64_aa32_a57_init(obj, !aarch64_enabled);
+        if (!aarch64_enabled) {
+            aa32_max_features(cpu);
+#ifdef CONFIG_USER_ONLY
+            /*
+             * Break with true ARMv8 and add back old-style VFP short-vector
+             * support. Only do this for user-mode, where -cpu max is the default,
+             * so that older v6 and v7 programs are more likely to work without
+             * adjustment.
+             */
+            cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+#endif
+        } else {
+            aarch64_max_tcg_initfn(obj);
+        }
+        return;
     }
+
+    /* Ultimate fallback: -cpu max as cortex-a57. */
+    assert(qtest_enabled());
+    aarch64_aa32_a57_init(obj, !aarch64_enabled);
 }
 
 static const ARMCPUInfo arm_max_cpu = {
-- 
2.43.0


