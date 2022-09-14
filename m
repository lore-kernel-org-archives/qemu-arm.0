Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5186861gdb;
        Wed, 14 Sep 2022 05:38:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6za+Jc4W9+bTphTIjYVSTAmL7oTjGr4fkLYz1P6L+g/JdiPyhF9V5oyr3P8XIbbFh2Jlli
X-Received: by 2002:ad4:5dea:0:b0:4ac:6ffc:74b2 with SMTP id jn10-20020ad45dea000000b004ac6ffc74b2mr28655257qvb.78.1663159127257;
        Wed, 14 Sep 2022 05:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663159127; cv=none;
        d=google.com; s=arc-20160816;
        b=0EaNedjeVNKuOqR2tVsRpTGA025fXkb5eeLS6JccK21LDOSHAoqKviWwALfIEWvMGQ
         wwx2rbTUgs52fme3n+tVsSVteDOJuiv9Jc/NqTC+lgiwkPvWIfIu4yO/Eh1PTmazh3Mc
         hTp2o/SO1+0W98oYOquXOwWY9+Hz8ZCvz9BpENCFs++4TEnnvz2EmfXv8C5f5AF7tGmF
         FRDVNkoVpnsNn2RlHSwbXgWOkA8NsWgYBbcaaiPoYp8gTy/tiqvVlcEXb0KWFm9033Tx
         qOdfQu3UxqdCn2e/ssFaV1bloVJkIpfFZgFYEpE4RD4uuxhKeW3RvrHMU8k5EijOJdPS
         Rx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B1HwVRetoBVY21lBSjEDvodWTQyZBfluPojpmU/kW4s=;
        b=jCsDF918AujhtBKEIgt++Ay0/cga/Nj2bb1hhlX1BQP9W/9Xj4qKO3JE81EQj/n+pK
         lgTfXbokxbrWKYq3YNz5Cmg9eB8C8aQAdSpHmAvnxEd1JWT1VOjh0ihZrs1rLIOKuZOf
         d1NZIhBPM0xDL/nQXMCmoipfFjLXLjhmARXd19E5/cMQwOGdaUiBHVxu2vIjYkKRbPwc
         dA4+NIHcUBjyIsj+0CQH3c6Pd16PvPok/HmVHtexxaWpVBoRc1mEiQRBhjYMKlVcSzKD
         IkjJ6UvhBNyZYatbwVbG4iVoZIvlivrep7Q84Nud887vukvMtsH+L9PbmhzL6i0/i32D
         qbGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNOaAo0Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020ac8108e000000b0035c50be4605si1145534qtj.215.2022.09.14.05.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNOaAo0Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRfC-0004a6-SP
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwc-0000Xt-Tv
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-00005y-Ab
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 z14-20020a05600c0a0e00b003b486df42a3so6241613wmp.2
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=B1HwVRetoBVY21lBSjEDvodWTQyZBfluPojpmU/kW4s=;
 b=vNOaAo0YZIV1C0eoznlMnJ6Y0fpoGoOeZhTF/fYvMs30beOJhl/I0NRIoyFsvCbxaY
 qDa+Pu5FTiS+rWUqTuznGveb1UprQyvxJK1+y8aAWmOUTYsfrT4akZbRzzexY+0sJUVA
 NTSr62C2tvdv4swX6nUTQfPDjd8cV9cpnsdz71phqXVCEf6lE/w2BZYisCSqYqYOTGbO
 obrcXzBl/8Jv9uassNNaR2HxqmH3UPvHEX83RFIQJ6qnYzUdUR9Nr9KBYA6gK2KXbHPB
 zCoROHGPUC8ViigtgAxbvZwse6T1v1raLv739QjtW6/tE7YwbuB/zMXd3YOs5OAkjYOQ
 izDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B1HwVRetoBVY21lBSjEDvodWTQyZBfluPojpmU/kW4s=;
 b=0hm7zCc58/maNTUJzGAXEVsC0WW7OLsR4RNTYxqLUnoRyFbzHkrN47NOAUTWwjAibp
 6mFwGH8c7nWRBW+UAOCF34IvT3hjjsTqg6FdEeqfgDAm8CO+AumWhswKOrdv9B+NLFXK
 C+rhvnWZoXJ9r8Ph0iajeXwXid+VKkFvs1Nb6xCmagu5ewcYGiRh+UdEUH+SMyhsGoD4
 t2FJe+UDmT4Lv531GB5csLko/7Xboa46s5Sii/BWznfr9kaNu4ILck58MeAgQ2ddlKNa
 RMT/Z9NHgb4ALZDLyi8qu198bNH1f8Tz059UXGRg9aSBX3O1e7lmsrrignNA17oC3wB+
 S6Vw==
X-Gm-Message-State: ACgBeo2vB27X+0kt2bRRRg3h9O8N8wJ37Ftk0m9hBxaDCYZZUKhvlGng
 DLpv+6gkRANuT4GysSwUm7o+0w==
X-Received: by 2002:a05:600c:4f8d:b0:3b4:9f2f:4311 with SMTP id
 n13-20020a05600c4f8d00b003b49f2f4311mr2240460wmq.17.1663156351830; 
 Wed, 14 Sep 2022 04:52:31 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/20] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
Date: Wed, 14 Sep 2022 12:52:10 +0100
Message-Id: <20220914115217.117532-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FTHFpvhFeGp7

From: Peter Maydell <peter.maydell@linaro.org>

The logic in pmu_counter_enabled() for handling the 'prohibit event
counting' bits MDCR_EL2.HPMD and MDCR_EL3.SPME is written in a way
that assumes that EL2 is never Secure.  This used to be true, but the
architecture now permits Secure EL2, and QEMU can emulate this.

Refactor the prohibit logic so that we effectively OR together
the various prohibit bits when they apply, rather than trying to
construct an if-else ladder where any particular state of the CPU
ends up in exactly one branch of the ladder.

This fixes the Secure EL2 case and also is a better structure for
adding the PMUv8.5 bits MDCR_EL2.HCCD and MDCR_EL3.SCCD.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-6-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1b20de16d..b792694df0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1094,7 +1094,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
     uint64_t filter;
     bool e, p, u, nsk, nsu, nsh, m;
-    bool enabled, prohibited, filtered;
+    bool enabled, prohibited = false, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
     uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
@@ -1112,15 +1112,12 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     }
     enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
-    if (!secure) {
-        if (el == 2 && (counter < hpmn || counter == 31)) {
-            prohibited = mdcr_el2 & MDCR_HPMD;
-        } else {
-            prohibited = false;
-        }
-    } else {
-        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
-           !(env->cp15.mdcr_el3 & MDCR_SPME);
+    /* Is event counting prohibited? */
+    if (el == 2 && (counter < hpmn || counter == 31)) {
+        prohibited = mdcr_el2 & MDCR_HPMD;
+    }
+    if (secure) {
+        prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);
     }
 
     if (prohibited && counter == 31) {
-- 
2.34.1

