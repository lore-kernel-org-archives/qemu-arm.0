Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp788437ejc;
        Mon, 31 Oct 2022 01:46:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67lARyzLmyaF7cVHDMFtYLTGz1GyZpTkURzOhXb0mXhLO4IBJNRiyREJEHaSr8f+55JarB
X-Received: by 2002:a0c:9a02:0:b0:4b8:256d:c821 with SMTP id p2-20020a0c9a02000000b004b8256dc821mr10130392qvd.71.1667206005576;
        Mon, 31 Oct 2022 01:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667206005; cv=none;
        d=google.com; s=arc-20160816;
        b=oPvKkvk5LhJE6Nti02NiY6Rw8NlaeLiaHXLBrMLzhnLmWobwoBbn390tXaXOoB36Ix
         Bx2DylOBXKhp14VuI567ymYXQ5yTTjPMp9vMyffA2VdHokxGa9x7qIl49jT7kaTn6rwI
         j30A5ef7vPSbAcwwBi81erMrC5FYOZ2NJovwUYpE11nnxQ7MT36g6IZLtTnqCvA78nmE
         0aMyfN1Ve7h23VGPTFDBHfG8FMpumZeaT7gUyw8dc31gzZPp/kXGNDnTrzH87NNZIo+Z
         eGiHJYm3Ti34S1Y/9FOHf8DrczwE/xIdc6ASJSlORWzitQVtqaTw80G+HWgb2FkVk5VI
         isWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4NC4CbXNET7QgKVIkEBX2g1Hrhwce2DSB/31NQyzbcs=;
        b=VRw+paP/s2P99JjVRLP9I+cO+KiOQQmLvPhxMmCulgAk0loATWIM1xNeWWkoT1DlhO
         FgeoB9axBFBrvHN5+QsY8IyylFS7WBp2JvO8suOJKkKdeR4zXiKN0/udN2WVFSp8k9rY
         1ku5eXMWHYjnYbMXNXmWezxp79SnvQFGsfomIrjiIyu7RWZkm0gW2sNrgnuc9r6S2ydh
         P7j537STzDEfivmseaiMgcgrGjfPC90ajsJEnoPf0yabwrhoC4bbAoxsstf3YTbDAvae
         fsPr4lq5Wvfi0ztEDcp8ouf8jO/v22pv9Nlf2LK3Yy0Mcw43WmEYNWF0QU7GbyJ6EmDP
         TIVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=1hhwDUqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz4-20020a0562140e6400b004bc04a08632si295964qvb.523.2022.10.31.01.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 01:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=1hhwDUqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opQQv-0001lV-HJ; Mon, 31 Oct 2022 04:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opQQr-0001lE-RX
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:46:09 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opQQo-0005Gz-0i
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:46:09 -0400
Received: by mail-pj1-x1031.google.com with SMTP id k5so2234402pjo.5
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4NC4CbXNET7QgKVIkEBX2g1Hrhwce2DSB/31NQyzbcs=;
 b=1hhwDUqKUQAV2Qk9F9ttMxXYnXky+Wl7FQkFWWE2SyhWrJ6IdUzGafxkSlIyc82hL7
 I3zebG2xJDYo2JkOgOB8T+68HOBXD93iMYEm5EvlWwg7Qa0EHpQfEC+gHO0RoagBnbLe
 MfEmuj0FyhLksPTk2DKIOGyNA3lZzA5nTSU6w8tYuQEdq9GgVkkFfQMRSpTLcQoYs+0s
 P1mbDI/6Gnf220/1mFfHu5U5qyKTji5EvIgz5jLP3tvelqHEvkJnu3E0YCt5BNctPVMW
 cV02vovH7Lgnuxl1OTf0A8g8QxYBdj7VaPzyBEUOl9Hei03i5PouZZEjznjg1YnsmITI
 NgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4NC4CbXNET7QgKVIkEBX2g1Hrhwce2DSB/31NQyzbcs=;
 b=LrhLk1Mp0kWoOAeCxN9gf/Qb/wmiIMLVyHlR3mfgTvqj0M0xMb2T3EijVpqUl5BqvD
 fJWXtX595GPEDOi8M79HNzMuonYcheTf/MSHVWL9/026oLJhx7LpK7ruepY1H9/Tqi0a
 ui1Rr7HDVZSizCJnRPRmGwEYpc/u2ZFpOu+UiIRO5RJmg8BYunPfUql4QNI7drz9V9xS
 OcxnAFfIlKMlWdpg+yXfhYis+r6XQfWgARnFd0WmS8q6vilp7ZeXB3paasWqjJkK3F9f
 H7XEGx1qtyvRO0P0idYOn8UJVThQmClUTIB+wvQx3bppbIsoh76isfx8sGd6yBN8Cc1G
 Iong==
X-Gm-Message-State: ACrzQf12ipn4uUz4Jqj4tUGB0nmr7fNeLtsyb/XEChXe2MHC+al6D72m
 DUhvZrtRQVJHALACOVeQJDDYfQ==
X-Received: by 2002:a17:902:e54e:b0:187:ba9:4305 with SMTP id
 n14-20020a170902e54e00b001870ba94305mr10012405plf.167.1667205963312; 
 Mon, 31 Oct 2022 01:46:03 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 g139-20020a625291000000b0056d2797bf05sm3478385pfb.217.2022.10.31.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 01:46:02 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Ake Koomsin <ake@igel.co.jp>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Date: Mon, 31 Oct 2022 17:43:25 +0900
Message-Id: <20221031084324.844220-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ake@igel.co.jp; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zGseYXFCr3tG

We need to check HCR_E2H and HCR_TGE to select the right MMU index for
the correct translation regime.

To check for EL2&0 translation regime:
- For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
- For S1E2* ops, check only HCR_E2H

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---

v2:
- Rebase with the latest upstream
- It turns out that we need to check both HCR_E2H and HCR_TGE for
  S1E0*, S1E1* and S12E* address translation as well according to the
  Architecture Manual.

v1:
https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html

 target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b070a20f1a..f7b988395a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3501,19 +3501,33 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     ARMMMUIdx mmu_idx;
     int secure = arm_is_secure_below_el3(env);
+    bool regime_e20 = (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) ==
+                      (HCR_E2H | HCR_TGE);
 
     switch (ri->opc2 & 6) {
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+                if (regime_e20) {
+                    mmu_idx = ARMMMUIdx_E20_2_PAN;
+                } else {
+                    mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+                }
             } else {
-                mmu_idx = ARMMMUIdx_Stage1_E1;
+                if (regime_e20) {
+                    mmu_idx = ARMMMUIdx_E20_2;
+                } else {
+                    mmu_idx = ARMMMUIdx_Stage1_E1;
+                }
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {
+                mmu_idx = ARMMMUIdx_E20_2;
+            } else {
+                mmu_idx = ARMMMUIdx_E2;
+            }
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
@@ -3524,13 +3538,25 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = ARMMMUIdx_Stage1_E0;
+        if (regime_e20) {
+            mmu_idx = ARMMMUIdx_E20_0;
+        } else {
+            mmu_idx = ARMMMUIdx_Stage1_E0;
+        }
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = ARMMMUIdx_E10_1;
+        if (regime_e20) {
+            mmu_idx = ARMMMUIdx_E20_2;
+        } else {
+            mmu_idx = ARMMMUIdx_E10_1;
+        }
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = ARMMMUIdx_E10_0;
+        if (regime_e20) {
+            mmu_idx = ARMMMUIdx_E20_0;
+        } else {
+            mmu_idx = ARMMMUIdx_E10_0;
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1

