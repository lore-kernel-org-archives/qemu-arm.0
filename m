Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1154286eju;
        Fri, 5 Apr 2024 11:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg2cD5OvukQdjVLT2tvn4jjAjQxe7Mo5mM2RabVV71MhBeZNfVQHEYAQoiREQRuoISFyU45jNgzjqS67oV4l+0AzUN8KGB
X-Google-Smtp-Source: AGHT+IHXcCmUqqTdu3NUSzwfCpPI8a++yjXWr/2WbpAGbpRKpqrdJcUM68YmhmE+jOqR7mN5iqY7
X-Received: by 2002:a05:6214:580a:b0:699:4452:518e with SMTP id mk10-20020a056214580a00b006994452518emr2564831qvb.31.1712340185397;
        Fri, 05 Apr 2024 11:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712340185; cv=none;
        d=google.com; s=arc-20160816;
        b=sH5vlrxvkjzXCykdaLB4Uq0r7Z3KWt/9csv8+M7q405ajpSYx5Y1cCP3uGEIJx/uYr
         HMFeET+8Y9iVWpCpluGj5Cmj9HsmaHB9OXTIiM0pslI0Z7HLuhg/T1oZEQ5VbkU/ADaX
         BT9FV8FK+W1ao60sQVDmZaPAgbi1MhKzogrb1KPIQw7oYVtmLGGa+l3iYUrWL3Pb4hx+
         niSNscwqsKsmFei8hxbYKYeuhf0rqFb6Hb0gl/SV5xDETi01WFOqyhi4FioFdCJc2fqW
         DqfgwROMVuie5S0O4S4bUbucR3STfJqJffmj/uXFD+ov/1n8OiQJjfgHcTKpk8Bq3ffo
         farA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=m0U4uFdOEq535ExzLiuM9D+YMI23y51gRPpkAZoBeQM=;
        fh=zDhg6w4bwkWusGDD/uic7oqQm5uhcNxMro2bSfLKhR4=;
        b=HsDJLebn4fgn2S1za9c3tExgqOlPv/W9YtuwR5VAjM7QpQCD2BsYNMwxkxoQd3RKwl
         JEKQDeHXyA8mpjbmCYeVF5y0EDX/Bgnyd2T6pTmGG0rWqdBZVJ5R4vKKPMfaiQkvycfk
         9hzT5PrPt8knvu2w5+LprhUcCcN1WxKsv+pEUumEPQ2AF4K4tLMujG+RUYugp0LsbnTP
         Z1+uchTiXJfdtEk9BKV5ZYnIP8vYZrnpDPDb0TK873cF0KsbHlYUwWgUUPZcpCOmxinX
         ayT5dpo7DuIGPVlNdCfZZO/Yfr7hGbV/N1SDsDy44vdqxfxJzJwyYhdKDiuK6goEVr99
         2LdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCZxeyXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fs19-20020a056130199300b007e3e5379b81si494935uab.113.2024.04.05.11.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 11:03:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCZxeyXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsnts-0004lI-FU; Fri, 05 Apr 2024 14:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsntr-0004ks-QD
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 14:02:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsnti-00021u-9X
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 14:02:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343b92e54f5so1505777f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712340154; x=1712944954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m0U4uFdOEq535ExzLiuM9D+YMI23y51gRPpkAZoBeQM=;
 b=tCZxeyXrB/D96e+4a3R6d6ept1RCRGpMMY5P8Qa3+XWu+mK25RdM9MebC1UT2PG8qF
 Kj4uzsj5RaIvyOn+BC6f8/BsycE2KKAc5aLHyKxE6pgFWKCMdYePTyr53KpjL7lNddaz
 2n3hm7B6AjK3Q5em6hreF/s0vwD0dqzIARLW7e/A6L6AFXVBGXAa8Z9rDGEZw6/Yy+kd
 nTGiNfIHUmGO4SWvsD7Ktp/COJLYkjAcY4xT4ulY8M1oky0W7jufl8qwQB/ik3kt92pn
 wK4ictKnF+KswWJAZU0CrLCNva97x8/BBJObK95p9cc5cjhZRCYw5utSmk+6Wv6nb59o
 wDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712340154; x=1712944954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0U4uFdOEq535ExzLiuM9D+YMI23y51gRPpkAZoBeQM=;
 b=hE6uc9rVgCWEwLi7yg24uMF0Hu88dYjHYLuSo9x7I5rmWsQqNlTdxlZ8e/nZq3VJJv
 Xn6qD8H2wUtW+XM6yFrOo59JoLw8DGIkGbMi+XKRjO7slxb8J0HxFeEWTzoQfuRnKBDX
 2o5RZcOSZuz8qa8kUqroVbQVfQyg+1wpWIqzhIm+Lc7r7osCt+d4PDSsIEmTYFMyuqNV
 5XUuxxUgF+jL8BC/YX2GrKcSMfqr/l07pME5k8MaaPd+ieVdAAgSAqnR+uhG4z3fl2ab
 7TF1rU+rPLGNH/XMOsED0i9SsVswsr7jdO9IFacSsuz4dGmCucPQH6bPqU/Xy78pIx2L
 qf6A==
X-Gm-Message-State: AOJu0YzL/gr3tsslhvRkkaCP75so3qghGU3XEsOWRG52wuOcu3NM5gma
 qjf2r5D7peSEFAyIgFFGUnfOc5hLD65r1J/YsT86OoQxdX4N6ANHjeIlcFEk+Ny38cn8QmXCrEf
 Z
X-Received: by 2002:a5d:56d1:0:b0:33e:8ba7:e53d with SMTP id
 m17-20020a5d56d1000000b0033e8ba7e53dmr1736654wrw.7.1712340154123; 
 Fri, 05 Apr 2024 11:02:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056000136d00b00343e3023fbasm2265751wrz.34.2024.04.05.11.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 11:02:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH for-9.0] target/arm: Use correct SecuritySpace for AArch64 AT
 ops at EL3
Date: Fri,  5 Apr 2024 19:02:32 +0100
Message-Id: <20240405180232.3570066-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d9zrKi5CvN2g

When we do an AT address translation operation, the page table walk
is supposed to be performed in the context of the EL we're doing the
walk for, so for instance an AT S1E2R walk is done for EL2.  In the
pseudocode an EL is passed to AArch64.AT(), which calls
SecurityStateAtEL() to find the security state that we should be
doing the walk with.

In ats_write64() we get this wrong, instead using the current
security space always.  This is fine for AT operations performed from
EL1 and EL2, because there the current security state and the
security state for the lower EL are the same.  But for AT operations
performed from EL3, the current security state is always either
Secure or Root, whereas we want to use the security state defined by
SCR_EL3.{NS,NSE} for the walk. This affects not just guests using
FEAT_RME but also ones where EL3 is Secure state and the EL3 code
is trying to do an AT for a NonSecure EL2 or EL1.

Use arm_security_space_below_el3() to get the SecuritySpace to
pass to do_ats_write() for all AT operations except the
AT S1E3* operations.

Cc: qemu-stable@nongnu.org
Fixes: e1ee56ec2383 ("target/arm: Pass security space rather than flag for AT instructions")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2250
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I guess most people don't run guest code at EL3 that does AT ops...

 target/arm/helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f3a5b55d4a..0af4ce2e8a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3878,6 +3878,8 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMMMUIdx mmu_idx;
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
     bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
+    bool for_el3 = false;
+    ARMSecuritySpace ss;
 
     switch (ri->opc2 & 6) {
     case 0:
@@ -3895,6 +3897,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
+            for_el3 = true;
             break;
         default:
             g_assert_not_reached();
@@ -3913,8 +3916,8 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         g_assert_not_reached();
     }
 
-    env->cp15.par_el[1] = do_ats_write(env, value, access_type,
-                                       mmu_idx, arm_security_space(env));
+    ss = for_el3 ? arm_security_space(env) : arm_security_space_below_el3(env);
+    env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx, ss);
 #else
     /* Handled by hardware accelerator. */
     g_assert_not_reached();
-- 
2.34.1

