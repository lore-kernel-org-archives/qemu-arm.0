Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4286884lfm;
        Tue, 25 May 2021 02:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT++blh2czTCitpcsW434fS6vvp+ORVdGaMCqzbTMPgwb8qZvP3/MSyG822g5Na4lUoM7L
X-Received: by 2002:a1f:f84a:: with SMTP id w71mr24161192vkh.4.1621933311509;
        Tue, 25 May 2021 02:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621933311; cv=none;
        d=google.com; s=arc-20160816;
        b=CvGAwZvRfuZeyOcH1hD7jEO8duL/m78eYn5AkPpZe8vSDboV17lpg8t/H7QgGD7C+n
         fkUC7fekJpViUz4NylFyx6WMh2r5/hSxzHuziNSBw/CCy6f5ylN0WB+ec3FoD56ReJ0Q
         FNLlqs2fDS/vjv+mSWEzPWYN8SIyWQRRLZKRUAnV17PaSwF7RC2cveZtK8YS1HUipYG1
         p/+EFmyR5OoWBtyfHPCtnMuCFBNf56YWhG4G75pwQWgKG6AHhbn8lDaXATWszILPaeV3
         FGEjNjTstPpk/WRcQTXjcm+53XLzLUvutrw9eFlZmr3NB7N/r7uoPH1BAE9XIr+1+73H
         m/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LwQp4D79OpsnznTbTqhyijFdbT79aGK8mayrG8iYxJo=;
        b=t7RzNGmVYeSGDd+1QYr1C96mRcNIuGYKNwUgOOVGjDwkpc22zgB/3hiBUT2HKFWPnE
         uSH+3BlgQtKe66iR0ugpqa8NWlO/2cefkGi5H+C3+g+cw4CirzjYsezOyy8R3X02Qj4F
         FYgu7GHlXStOjexFbmtsWVyerXeG46fWTJNrYudjxOIBIZF6U/dzOmG2DqNr4X7Ip1cn
         Z0myVR9iz0+fs3lMmHTkNkP6X6K6+rdR7amF0cXwscE6pDfuW2tGSEf+J0LocYf1peFF
         y/1RgJ7Hi6OrNs4C7sSuGSsfy1MDCMO2NvFyj5t2HouTOjEDMMJzEn4DMdtoowaP94ta
         AYnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=dAlWTTLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t30si3741154vsj.34.2021.05.25.02.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 02:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=dAlWTTLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llSwg-000595-QB
	for alex.bennee@linaro.org; Tue, 25 May 2021 05:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llSw8-00057w-Sb
 for qemu-arm@nongnu.org; Tue, 25 May 2021 05:01:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llSw3-0004EJ-JM
 for qemu-arm@nongnu.org; Tue, 25 May 2021 05:01:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n4so5390615wrw.3
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwQp4D79OpsnznTbTqhyijFdbT79aGK8mayrG8iYxJo=;
 b=dAlWTTLoId5vWlA1+CftPh+waC4D263Eo/LHaQm9+X71VYqp3NU9t6tESB5eyJiCoV
 zuKUq9oV6073N1Zn9zm5U1RXVFI9Bz8QWMh1LaQ2/PidsSI5q4SfdmyD1AIwzEkpiW7D
 0oAEjSnjlMWp7O523KKrPcp6jZx9Insev24/bWDaPnubPXoqRrP4XuC9AQF5sArTcYlN
 zo6/QOyjx4ndvIVTF1YDgWe2UzuTXWEv8rD+Azzpsp6QQb8P4h+wuxj7dopgeRmGOfS5
 kue5bBHCqnLQdc+QbxRrdpJM1iw0ItyaUCVnqHXigSHgi3ThF2shYAOHQ1srA2Xo7p4t
 zPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwQp4D79OpsnznTbTqhyijFdbT79aGK8mayrG8iYxJo=;
 b=cOpO2syo1LpL9fQH9UMsE1xy7mq/6UMPUf4HNrLc1jPoD4tb1AV3iMbmJT6g90ltcP
 +DSEIstg1UON/OhoQfYe1SNemE5MJ5kIYLBSp0Q/alA9V+qgzbG7dEUiKS/LFfh4lW0b
 L8sItqrWbY88wljVgszGKcYQ2BAL0idDOaIS2pBlAUc8Pt952TyCAAC4kPcs2LszLuSP
 EIIY0r9gIKihx0nJPaP8BJk6fSLMRRD8knwnKlbtHYEUqTmg/f/gZU65nunrYciVbxP9
 SGvc0fBc/dZVstWzJneNGvhHlW6/nr5WZIUy0hfe2bx4vSItmoFFjRlmYOXxb0qVWpX/
 UmoQ==
X-Gm-Message-State: AOAM531nvVBNEZ6SwaHX40+ftBnP9ItSfjVcskgZi0XSePkufqRqemQE
 pK0PB0cXQ5vGhbhPrzu6hmOV4rfJqXhsLVPf9xxKgixNvcr7gKxOvnYBm94ixIgg6gyXNrnoGZb
 9L8vsdYr3AiD2M6CENB3kLUbaiYLaSezm02kqwqiICOsjj1K8MCy8E1M1esUV2KOnxg==
X-Received: by 2002:adf:a2d1:: with SMTP id t17mr10372377wra.367.1621933269317; 
 Tue, 25 May 2021 02:01:09 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id o21sm10250665wmr.44.2021.05.25.02.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 02:01:08 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2] target/arm: make pointer authentication a switchable feature
Date: Tue, 25 May 2021 10:01:04 +0100
Message-Id: <20210525090104.1761645-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c1bf2744-0448-51c4-551a-779f00af5a2e@linaro.org>
References: <c1bf2744-0448-51c4-551a-779f00af5a2e@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 leif@nuviainc.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s+2S+v4nOo06

Rather than having pointer authentication properties be specific to the
max CPU type, turn this into a generic feature that can be set for each
CPU model.  This means that for future CPU types the feature can be set
without having the ID_AA64ISAR1 bits clobbered in
arm_cpu_pauth_finalize.  This also makes it possible for real CPU models
to use the impdef algorithm for improved performance by setting
pauth-impdef=on on the command line.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---

Following Richard's suggestion to make impdef selectable for all CPUs 
where pointer auth is supported, I've moved this up to a full feature 
and then any future CPUs supporting pointer auth can just set 
ARM_FEATURE_PAUTH.

 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c | 13 +++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 272fde83ca4e..f724744c4f2b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -969,6 +969,7 @@ struct ARMCPU {
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool has_pauth;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
@@ -2115,6 +2116,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
+    ARM_FEATURE_PAUTH, /* has pointer authentication support */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f42803ecaf1d..5a4386ce9218 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -760,10 +760,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
-
-        /* Default to PAUTH on, with the architected algorithm. */
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+        set_feature(&cpu->env, ARM_FEATURE_PAUTH);
     }
 
     aarch64_add_sve_properties(obj);
@@ -835,8 +832,16 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 static void aarch64_cpu_instance_init(Object *obj)
 {
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
+    ARMCPU *cpu = ARM_CPU(obj);
 
     acc->info->initfn(obj);
+
+    /* Default to PAUTH on, with the architected algorithm. */
+    if (arm_feature(&cpu->env, ARM_FEATURE_PAUTH)) {
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+    }
+
     arm_cpu_post_init(obj);
 }
 
-- 
2.30.2

