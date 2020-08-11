Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp147560lfy;
        Mon, 10 Aug 2020 23:09:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypiZklC4+gJ43Z2TjnhispzjcX/FRVtlh4B1b9vi3ulNnwrjSSJGwxcJ6rrQqleiko47Fg
X-Received: by 2002:a25:4c8:: with SMTP id 191mr43140208ybe.170.1597126155642;
        Mon, 10 Aug 2020 23:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597126155; cv=none;
        d=google.com; s=arc-20160816;
        b=KGd7+Xd7k7SvJ4GfbNAwr6m9D+NJl9S+QFkds813pJjlwLThqpbXnJuCw2N2AlIV2o
         JkHsJzZPa8B6wCCqFK/mkaejDehdpc/9EdHH1qb4N/+7/Jkg1S/68RuzlLV4qcovZnT6
         YV8pWd+EFWyMgy2dAP8sPIeNi8111XqmHO6QAnI+oalKYkFklz8CBTllX2/9AhOr311x
         J+5Z8R+DQ95aZPlg2eyegrqq1fFHr7HTxb8GHQ3sLScw/4bnACjZ+vok0uFIuDx0Dtyv
         F0SuNmINLOKuMyeZgnZMiadsO3AQoaAyG5OSrxH4pFGnXMJ1K0sP+G4W3dqB4CfND/3J
         PDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=R43ICI/1EPQ6tRkh92YtUWHUzIgfB53Zb5n3N2y35bU=;
        b=rbgrGovvm7B25yCDiLeTAVyewLUPrMrPs1QA50o7iDaOJy37jU+fnFYm6we1zeZ59B
         9Jpn+VpUs7t1QoIvd0rgyP8ewdbMEZ6Num8iC42Lfry7wH4w5YT9oruAv2B/xQq/6OaO
         2+DnZKW+5ko/wBsJbCWod5oja6qaJkEs2Ulju2QxhwmnrI3tK5Yxi2mCW2NazRxbnf9q
         SsNlzXo/Vkbsjeejt+Z576Pbts336amcmOy6aGpqnX8YcnDCmYTjapm26geL3qwAOGLU
         HI+1K22Bk581vzj95CMCU3sjVcRPbIpQ9T0LKOnvNIZTSvVNZdj25bAllYWYfhn4XVOw
         VH1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si19477441ybp.170.2020.08.10.23.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 23:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5NTH-00018F-0p
	for alex.bennee@linaro.org; Tue, 11 Aug 2020 02:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k5NT8-00016u-Mm
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 02:09:06 -0400
Received: from mail142-33.mail.alibaba.com ([198.11.142.33]:28446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k5NT5-0002p4-By
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 02:09:06 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06837587|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.565985-0.000114229-0.433901;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07440; MF=zhiwei_liu@c-sky.com; NM=1; PH=DU;
 RN=5; RT=5; SR=0; TI=SMTPD_---.IFpw2zh_1597126109; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.IFpw2zh_1597126109)
 by smtp.aliyun-inc.com(10.147.44.118);
 Tue, 11 Aug 2020 14:08:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/1] target/arm: adjust CPTR_EL2 according to HCR_EL2.E2H
Date: Tue, 11 Aug 2020 14:07:48 +0800
Message-Id: <20200811060749.159-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.33; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-33.mail.alibaba.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 02:08:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ODfrZCcSaKZE

From DDI0487Fc_armv8_arm.pdf, the CPTR_EL2 has two kinds
of layouts according to HCR_EL2.E2H.

When HCR_EL2.E2H is 1, fp_exception_el should refer to
HCR_EL2.FPEN and sve_exception_el should refer to HCR_EL2.ZEN.

Change-Id: If1c8f88db9fb505c36211ceafbf25e838ed96ec0
Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/arm/helper.c | 53 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ef0fb478f..19b74b25e4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6116,11 +6116,29 @@ int sve_exception_el(CPUARMState *env, int el)
      * they will be zero when EL2 is not present.
      */
     if (el <= 2 && !arm_is_secure_below_el3(env)) {
-        if (env->cp15.cptr_el[2] & CPTR_TZ) {
-            return 2;
-        }
-        if (env->cp15.cptr_el[2] & CPTR_TFP) {
-            return 0;
+        if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {
+            int zen = extract32(env->cp15.cptr_el[2], 16, 2);
+            switch (zen) {
+            case 0:
+            case 2:
+                return 2;
+            case 1:
+                if ((arm_hcr_el2_eff(env) & HCR_TGE) == HCR_TGE) {
+                    if (el == 0) {
+                        return 2;
+                    }
+                }
+                break;
+            case 3:
+                break;
+            }
+        } else {
+            if (env->cp15.cptr_el[2] & CPTR_TZ) {
+                return 2;
+            }
+            if (env->cp15.cptr_el[2] & CPTR_TFP) {
+                return 0;
+            }
         }
     }
 
@@ -12492,10 +12510,29 @@ int fp_exception_el(CPUARMState *env, int cur_el)
      */
 
     /* CPTR_EL2 : present in v7VE or v8 */
-    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
-        && !arm_is_secure_below_el3(env)) {
+    if ((cur_el <= 2) && !arm_is_secure_below_el3(env)) {
         /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
-        return 2;
+        if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {
+            int fpen = extract32(env->cp15.cptr_el[2], 20, 2);
+            switch (fpen) {
+            case 0:
+            case 2:
+                return 2;
+            case 1:
+                if ((arm_hcr_el2_eff(env) & HCR_TGE) == HCR_TGE) {
+                    if (cur_el == 0) {
+                        return 2;
+                    }
+                }
+                break;
+            case 3:
+                break;
+            }
+        } else {
+            if (extract32(env->cp15.cptr_el[2], 10, 1)) {
+                return 2;
+            }
+        }
     }
 
     /* CPTR_EL3 : present in v8 */
-- 
2.23.0

