Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7196620eje;
        Wed, 19 Jul 2023 08:57:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGSVnUAQ3qgzozqIYQ9mtrlBvCEwAdFzLzgy/eBA7a8Jq84owcJkjPY11g5ueJiOIPtlsyn
X-Received: by 2002:a1f:4bc1:0:b0:481:35ea:10cf with SMTP id y184-20020a1f4bc1000000b0048135ea10cfmr4290591vka.4.1689782254680;
        Wed, 19 Jul 2023 08:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689782254; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcY8DJTBG1HcqRnCqiB2mJtHnuo8LCRaRywDLXX9yC44fZuOpHv5N7dv+btDKF0LDp
         K7hcDa4ZBKAJr+pH/Lvm+/gAxTNokDDwYnEto2XkYRP6G8ykJJAe+nttpHpFkJH2cDhY
         g8Vm4UiSsW022clbURVJietydZVgeeZ+CR06mAqoO4TpPUj/uJdtB8YI3f6a6Jk5qeaN
         dO9fGmReUjM1xY1UKzUY5XTBNc6w8BsrFWGDDFZHcqXkiIw9tKGDWtM4iU8/S3lf2wh8
         +nOAa8FKp2qs60it5Y5rjn3qxSHr6scyhP9QErds1eynnzlqBu5HmAICIgavi+fG7HwL
         NXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WNPqefvQgMivoBtumxDAYGfl0jiPjDA6sqhpbGZ4NhE=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=V0OzKidyAKTQH/wtWMm10vF+BSdrJs0nUvY/oRYL2vQUiQ6sLWCfLARtgzC9rsy/5h
         s+oFW6THVXqHeZbTbJDFmhiiCyK18LoDGD634GkeyHe567gP9Y/K/QbbFPAJszry7eUe
         in/wHTOY0Tr0zRdhpeA5dxN7B+SuQxFRNhFVpkTtEts4/o2EVbRIUqxpQ2Bp+cgVZeGx
         fPyFCsim2+cDdQwxUCqwM8ozkSG9Cr4pEwMpPf+Fe/kSLvrokJdVIZoXNxP3kVN2kcDk
         4xNalEYTXBDDrfHpZVubMIKcbc6Bo8DuvYkNCJS4K+WWWO4OOAfCImMc/ggGUH2I1LEN
         HRqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/0hKs0Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a0c9d07000000b005ef676dbf8dsi3023873qvf.96.2023.07.19.08.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jul 2023 08:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/0hKs0Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qM9Xz-00039f-CH; Wed, 19 Jul 2023 11:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xt-00038D-3V
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xl-0007IT-89
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:56 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso65060995e9.0
 for <qemu-arm@nongnu.org>; Wed, 19 Jul 2023 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689782205; x=1690387005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WNPqefvQgMivoBtumxDAYGfl0jiPjDA6sqhpbGZ4NhE=;
 b=b/0hKs0QxDQccRusYNa5gcfxhSGWwRIFg3RS7TS0wQgh2xg/t4sOawHxqaNGQdze5u
 Y1ZS1No5vF3tbx5w5qdPbQ74gugYWY0XVGl8bOALogHaofJA5C4+8eYamZKn8poVx48A
 IFpqCc11TaMrB3JdRllZ+M1ZheG03HCZllNjiLBzGroGFcDX57QYxtQqo7vR9JqEShDO
 uxltFYAXNfBGZM9zMEk2d3pDUSzHsVcx1WS1S2yahaK1zn9UTrNwVxbvK8RwoZafVRTU
 whrKLmX53YODwWc9yc0AMp2S5DJn/J8FZjp/SIRBhKd3LwRlyDfUVyEbwiO+JZf/94rn
 Irdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689782205; x=1690387005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WNPqefvQgMivoBtumxDAYGfl0jiPjDA6sqhpbGZ4NhE=;
 b=aRIbntr4rDLTU3MVb9ljxx87GVjFPLdnqES+GhUF/Fy7Ehyiu8JcRUDtSG/DW7/Uop
 jvWFnY4X+VVLlg06Wxq8OpffGhCOx5kg5ZQAqvsphaYXaElIYDfxdTJEmFGJzkIGF0dr
 /BAvYmR3k4uvaAwbxvCdxBJAFDM9mZcP6g/5XmOUjo9h4i2ujbito986VM6wEpEGfAXy
 E0AU3ErVHkap4FjuokSU+lBNopIxpnHqLKKrkl9K4PYe+lLmoJLek6XVdzq4QCS0EkSM
 vYOGl8p0DFoZzWkasWl1Tju4PgryUphdn/OBZfi/6cnYa+N46I54UCdQOqw6RJ+kVGk1
 LFSw==
X-Gm-Message-State: ABy/qLbitz83c3/Q2ItJZJNGAi5Yvrfklx9XzUdLt0EWE4g67GuITz1A
 dYshuqkhyIyzsqVEZtc+4PBY5g==
X-Received: by 2002:a05:600c:20d1:b0:3fc:80a:993e with SMTP id
 y17-20020a05600c20d100b003fc080a993emr4651088wmm.17.1689782205641; 
 Wed, 19 Jul 2023 08:56:45 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1c790e000000b003fc3b03caa4sm2351006wme.0.2023.07.19.08.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 08:56:45 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 1/5] target/arm/ptw: Load stage-2 tables from realm physical
 space
Date: Wed, 19 Jul 2023 16:30:15 +0100
Message-ID: <20230719153018.1456180-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719153018.1456180-2-jean-philippe@linaro.org>
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QZcl0kgsPeIh

In realm state, stage-2 translation tables are fetched from the realm
physical address space (R_PGRQD).

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/ptw.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d1de934702..6318e13b98 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -164,7 +164,11 @@ static ARMMMUIdx ptw_idx_for_stage_2(CPUARMState *env, ARMMMUIdx stage2idx)
      * an NS stage 1+2 lookup while the NS bit is 0.)
      */
     if (!arm_is_secure_below_el3(env) || !arm_el_is_aa64(env, 3)) {
-        return ARMMMUIdx_Phys_NS;
+        if (arm_security_space_below_el3(env) == ARMSS_Realm) {
+            return ARMMMUIdx_Phys_Realm;
+        } else {
+            return ARMMMUIdx_Phys_NS;
+        }
     }
     if (stage2idx == ARMMMUIdx_Stage2_S) {
         s2walk_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-- 
2.41.0

