Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5221944lfh;
        Thu, 2 Jun 2022 15:45:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHXsGCp2lxaDnxeskKINVIaXaPxMu15/zLYF/hKsVSOAQbwGAQUXaRkvjc7f6lPBLVBrGO
X-Received: by 2002:ad4:46ae:0:b0:467:db1b:f38b with SMTP id br14-20020ad446ae000000b00467db1bf38bmr1500669qvb.57.1654209910179;
        Thu, 02 Jun 2022 15:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654209910; cv=none;
        d=google.com; s=arc-20160816;
        b=agTMJN9lFdV4gpuba7vo6iCLdKt98B7J7pfli27Okwcb9GgzWY8tUfnPKrExGe5uNM
         UT0Y2IZjaMVo6JfOIgQ8DlJJkl45Xv7okdam1XB4exTbAdYybiSAp0TmCTjwAKCvPqdS
         WNwGaJZdK3TTNpqlDyCc1GBc7yVpnHzCCexayYwRz1JubsgXusVbFflZab9pT0pQc5eB
         Mo85RlrSZ9jDpzXFY0DRHNX9GN+WQHu3XySiB5mJXMsXbRkQxzookLsx4wiRE0QjxLuT
         qZJbbFzLdgVplAyYRabBIMZuAtHHucRpDgxMDQxNfAg9ZritbRZsQjXmPRdm6ltKlT4v
         qZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
        b=vmP4vP2vaar1Gdl06fmB6R2Gp9uAs/Ph2Xj7qWuyTYWluXuD2XY0U1gvEFKojylkrR
         vP0YxbC2bqDq2utF/MDes2vUIoDPdb5IINqUWq4trd85knSPY34HiPVK0bGfYhv83slH
         LN1xgqusH2bs93V7tOmuZ21lQgx3SZQ/XBlHIyS/iiQJlFIkKoW7J7A00f32T7sixgr1
         u4Ggbw20FRt8NtHTwVKmdts7g+N569UyIMv6K4XUXrg5uO/rG/5edrbFVLPWU5JRsJim
         gl4TRX/QjRN1RICeagd19YajqOBx495zlWa9UyEmSFmg7/G0dLCfjOJRJITMSzpydD92
         /iyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gsZz0Tyi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r72-20020a37444b000000b006a3367f7e61si2478815qka.446.2022.06.02.15.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gsZz0Tyi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtYz-0005Fx-MJ
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskM-0001h4-Qh
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:53 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskK-0000sV-Ay
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:50 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n8so5554097plh.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=gsZz0TyimC007DcePY8I4GsBFmI0xvPR19BY6g6qfL4iDKpXqKeSnoz60taOm6W96y
 DLGXYn16Pmu4jO5i1j5DG6ptDnC75rVssLmu3xOJH3iE9rIKbaBcJpORN6U0n6cXOQM6
 MlPArFcCsLiOdHLDaotSJgLO9WY6QwrZVqRJaPhYsw9ORC5PCGk+Wh8lo11C+SXIC+je
 KGe5XJuVnWF9fxux019CeFbK98oOvMGCD9ihw8rNg9/5OPLSxJYVdupzq9B1IeMII03X
 0aDaHaa4i3+MO55Ud3EPCvoWV+Y2F1yY8z40rQWcVDRJBb/L+8p4yosNdrzbsuVqjriC
 n3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=ygUoaDeM6W/fK9KuMONTbT0XFXLQUEc+fUldIdKTUbE7UijDcMTlDmmk3EVOhU+G+a
 hNobWvJvIc5z+R8yk8q6vG8NC3gYRuf2v3MlCO9dNLyMdgHefllYogW+OHsjeUaLmNFJ
 Tp3iguWQh+I7Gm/9uPIFTVsE0SK8jPuVqDPJ4KbA5mLtxHSOfv2jKEanA42I2umiKXfo
 KelLX4i42bSkPxSj+5YFzJxeWVt4Y2ZzdWI0MQqABm8ZLrnkjTNVW4k24d641lrkAR7q
 xTmEeYd7VDoqglSpFCzYs89IfRBCF3YcUWpvOZy3D4cN+AaxnG1BU88iQWPEpTLEEQ80
 W87g==
X-Gm-Message-State: AOAM532xNm5iMbvvgFWSkRLBt3HBFH/5tH9asEzfWB2YBO1tKJWStkOK
 OJp3Nuajt8l4po6O0HyM7OL6CeJh4yd12w==
X-Received: by 2002:a17:902:ef43:b0:156:9c5d:b0fe with SMTP id
 e3-20020a170902ef4300b001569c5db0femr6923626plx.158.1654206766667; 
 Thu, 02 Jun 2022 14:52:46 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 60/71] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Thu,  2 Jun 2022 14:48:42 -0700
Message-Id: <20220602214853.496211-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JZYqtVkXYm2L

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 3b273f6299..4af6996d57 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
+            /*
+             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
+             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
+             */
+            if (FIELD_EX64(env->svcr, SVCR, SM)) {
+                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
+                arm_rebuild_hflags(env);
+                arm_reset_sve_state(env);
+            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
-- 
2.34.1

