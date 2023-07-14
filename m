Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4133942eje;
        Fri, 14 Jul 2023 08:49:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFIWBhinniXo86nL+zMcvUViw9g4DIIWCUvtst4fSnVoSqBv9KDm4JWVRy1xaRP+OxGt89W
X-Received: by 2002:a05:620a:17a4:b0:767:1d7e:ec40 with SMTP id ay36-20020a05620a17a400b007671d7eec40mr6627675qkb.1.1689349781951;
        Fri, 14 Jul 2023 08:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349781; cv=none;
        d=google.com; s=arc-20160816;
        b=duq2A8G/nzTNHrx75GOSRiJJ8vlWSbtQ4gienDnA27ts2zgYBQvpVQhnOEX1uEjDfv
         SKj0azPd3DSluuAJu43NbWvwMnn40FcwCpXUxa5Vlq/12pDsY6t3UemAPYi4oQ38T7Dc
         9zN14TbxcyJCc5BXd934iGOhTjuyzySvus0wyeOp5SV7t+N25GiToXzHUH1LiSTHIr3R
         pfoeQr9br9jti4J16aM8K+E+5DHEVfANiud8T/vbVQ/Qhr9pjOWHU4s3qYvuFdKn/BtA
         rgmvs+QB1q1omSzlVRFJizWrSr49PPeu1LGYLXoQMBSi/LcAV2viSI8/NPZo+HIfBBPP
         ZJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FCSU4FtaO/3zeArkUS9xQ1e+FjPheX63usjZ65/2/SU=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=b0PryowvcNhCtuZIGg2mrgs3DJhJTs777fSe78eG5S0xFXtMTPjNIv25WM9OU5BPuJ
         7PC25EbiZrjuMarvFQCAYyQQ63mtUmwjolHLoxWDU2cx+ju9KJPuSmFu5NvUzv7Nf2nL
         2qG+7fVnV/DqFufnKeaE4QKdt9nhLMBrCaHnw0nvioDBln17zN2tCHMC23sI+HfhtV8g
         uSTF6Ia+MewBXX/s+oXAc3z0yFcmA9v8R2gksTymK85s8F0/O5n8aqNIJikTIfapjzP3
         E7YZIEzdI5z7DOkuyWTBr8RsLeHIikThALLHLpuqN+l2SoUV1UCHhsxm2suUQYBIEfyP
         a2EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I40HmBU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i187-20020a3786c4000000b00767cf648a19si4519281qkd.443.2023.07.14.08.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I40HmBU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0X-0007Fm-JP; Fri, 14 Jul 2023 11:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0W-0007EZ-HR
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0R-000763-Vp
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:00 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fc04692e20so19553525e9.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349614; x=1691941614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FCSU4FtaO/3zeArkUS9xQ1e+FjPheX63usjZ65/2/SU=;
 b=I40HmBU3rZY0v8A2a6SryEyazK4Rika5QmWP1Ios04mMrSxepkYPiMIH87VL9FZWDw
 2rXoYF+OAm6chK0IFfeZHDRQExP97xeVEq6NvbLmLvh3Jbj2/zqEFfu39jJP7ScHpeZ7
 r1O2rbAdc95BXROfBbMtD9lvnjOhnMT95ht+h/uKFqUmbtJ8j4U1jwqEXwDpkITMBN4u
 btY+x8a1GnjU6DfuAOwWjgD/Jl2KMkCzG4hy6KU6Q1FzjaUJIQebMWmomvSfMTehymXs
 Or4/6mYmYnXeoVQ5ZTmkMY0nrO1L8BdFM9DBTVyAn7INFGRRFmQIKA2kM2z/gOEOMcp/
 6XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349614; x=1691941614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FCSU4FtaO/3zeArkUS9xQ1e+FjPheX63usjZ65/2/SU=;
 b=aFxu3LhQviUQmdfdfAJuR75B1Drnw+EKnpCMiK5j68+3hpnYrcDBUTUghIAojjX020
 rZ4fwoYhmcbdngZHeR3K2HKBtb7bHvWCHYBSuZx1Z/7UU/34xVZ24SgSTH/JWBdEC6gh
 4GIl75wTn08kqHpZHJJQtebGeeV2iOuTZQziSUY5AaTfWziu3tyZ/+KRpeOtfLrdE03K
 YxroQKyW/7Wj3g2Qlgw4X0BOVGWzOamqQv69vjPIraY2y882oIqfAGSdXR6PGMnOdA7i
 JiYhzzUUZxzeCFs24EM/A9AlCzyDLyN3C/w6ra6nxAmTLDdqcglAkhn4m+x6mueyWHtJ
 6gxg==
X-Gm-Message-State: ABy/qLb/HKxMeKcK2/OkZ4k3e+7pM9EeKPuPVkZDbIngelvzSrQW4AWm
 Q3i+3vt5mNfgXFyITeBafCGJRJTKl5foH81NLM8=
X-Received: by 2002:a5d:538e:0:b0:314:36f0:2214 with SMTP id
 d14-20020a5d538e000000b0031436f02214mr4443398wrv.6.1689349614715; 
 Fri, 14 Jul 2023 08:46:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/14] target/arm/ptw: Remove last uses of ptw->in_secure
Date: Fri, 14 Jul 2023 16:46:42 +0100
Message-Id: <20230714154648.327466-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rnG5VqQuFjty

Replace the last uses of ptw->in_secure with appropriate
checks on ptw->in_space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c30d3fe69a0..bc834675fb2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3247,7 +3247,6 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     ARMMMUIdx s1_mmu_idx;
 
     /*
@@ -3255,8 +3254,8 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
      * cannot upgrade a NonSecure translation regime's attributes
      * to Secure or Realm.
      */
-    result->f.attrs.secure = is_secure;
     result->f.attrs.space = ptw->in_space;
+    result->f.attrs.secure = arm_space_is_secure(ptw->in_space);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
@@ -3270,8 +3269,12 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
-        /* First stage lookup uses second stage for ptw. */
-        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+        /*
+         * First stage lookup uses second stage for ptw; only
+         * Secure has both S and NS IPA and starts with Stage2_S.
+         */
+        ptw->in_ptw_idx = (ptw->in_space == ARMSS_Secure) ?
+            ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
         break;
 
     case ARMMMUIdx_Stage2:
-- 
2.34.1

