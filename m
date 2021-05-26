Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5381511lfm;
        Wed, 26 May 2021 05:28:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7/MmnZ8BY87fcq4OnbgeNlc/qzj5GP1ey9F+GNxVaGxOouFfPv0c8VAvgGpA4gaPedHJE
X-Received: by 2002:a05:6102:370d:: with SMTP id s13mr29795484vst.35.1622032106505;
        Wed, 26 May 2021 05:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622032106; cv=none;
        d=google.com; s=arc-20160816;
        b=eu7KTUuRbf8SPmZz6UznX015MlpuayMKp2I9Y6HR09o5+Kgvc11mvMV13pB4/99B9o
         7XbAuy/M1Mq1M5E6JY05EH5i/uyC/A7Z+wcfLC5hKIc8aAMzCxO1SowTz16RTj5OYb0c
         AbW29WVsZn8DFJe3/1oM+IO3VByEcfLrN+jD5vXNyFBn5Pn/7rFoL3AV1sgihiTmD38Y
         Zv0kRraQlLqxsi02zyYIDlQpmGw7USagxbiggVNyTlYPPbOtm6hKgp/lBRMVY0qRawRW
         V1Ngiq7K5ii7NNhhq1GT9qo6XwzcBWb07sUHvpC5hLgq8an5ibtHkay+pKJlV+TExDap
         q7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5qHVT2mA2TWjPyo6mee0Tv5AQZrQhpH5e6Tzk+OdaYw=;
        b=aw2xDJeDKIiYDE4E5auGxr/NXpypMw/TnonRH5bzlT2JckYuLTaRg9LdS/5eLrIM1a
         hgzEQ9nxaOjjlp7xXjrrow1mAKM91bSsILG6GqsZpNKxnF6NGvuWn3mihRZEGmoi8M+3
         JPVN5W+5QIHPQsu9w0x6krwDepVe0htEhgvoH7sMvg79thleYAvT0FhQXaXfqNJAyaba
         FfPPgRjJpkmAM7evmdlFAFBcXl0MwEl85xOuYcRqkHNQp0QKEnR81RbOFwNXp24x7j58
         jhexMjbF2Xm82j5T9p1fzmTzw8ikFitDSbBB8OIE54gfPuCEtmOznBpa6rFd4rqMeGku
         swKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=pZ46IXtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p36si956352uae.241.2021.05.26.05.28.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 05:28:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=pZ46IXtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llse9-0002Yo-QS
	for alex.bennee@linaro.org; Wed, 26 May 2021 08:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV7-0001dQ-S4
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV0-00035v-5g
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x7so871835wrt.12
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 05:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qHVT2mA2TWjPyo6mee0Tv5AQZrQhpH5e6Tzk+OdaYw=;
 b=pZ46IXtvzWEFNsVPXg7mulQ8YclaSoDz/LR2AJwKW/98JnspqYM5lq6kms1mhfuMbm
 I+mGHiOOKO5nDMB/vNRACFa8H60W89+LJV70Ro6RKOFDm8UUi/7eTHg5W4MOXj+5rll5
 oWv7YT0QMTuV5SfL9nooMQlP7qA2fjgmQwsvNnVUXMmsICSRN+G7aSgEAvTxt0R71oCG
 /t6Y2vVyfWh4MZ+8v6U45MVw8kbTfZ9ser7YLm6A2UQhxYHQwDleY4eNFj9tmyd1akGx
 La94JAAsQIpeS0WOOaNp+sJgh51Sg1Kpi1XhldE1SYE7J1ZFCkYjFnlFglCs5/JCXm7E
 6bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qHVT2mA2TWjPyo6mee0Tv5AQZrQhpH5e6Tzk+OdaYw=;
 b=eIIhrONtDqg3q+mA81usz0cob6DVHyFTLnKH4+0v+nppiFP6d+toS0A7GPkQA2/Bs/
 utknoeHOXEjhQif7k2X2kdEotT5KaGhBeTVvttNSeP4A283QWmrD0QjuVQugwwyOxvsg
 5r/MNi29O6KhE9u2c/tEOCVQpJ4nGBl5wwG83Rvk278Ti0pc7BFVMooKAP7zoGhSALeq
 SebrJzPC85xPmSlxHaP3jjhFgLkzxjd5Feb+8XR8BHHbYBMtXPt4AhvLs11r2bhxRvJt
 1B9+3impKBuTQ8FPl77mAJyCLrJf7Z3/6R832bMwWLA7tur2W5bFg+rl5vuSqe0MsKOG
 Y6JQ==
X-Gm-Message-State: AOAM532zMmjixFuL2S8roG3GV53QtBDmX/0UrdASf9tQkeeFwnhlIJ+h
 OFI/31hm0CBd3El4J8WFNtYHM5V/aE4DJ7gQZtBPSidp2nk5aMHY01QKPO4pLoVt2jurQcQ2hzW
 4ZbBkZn9ePOWaeNZy1fJ9FLR/2E6AhZXgHyC09ANFQgs+4bqnMtI31mbxT+aDw6PDyw==
X-Received: by 2002:a05:6000:137a:: with SMTP id
 q26mr3186178wrz.216.1622031536174; 
 Wed, 26 May 2021 05:18:56 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id u132sm12625069wmg.31.2021.05.26.05.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:55 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 4/4] target/arm: use raise_exception_ra for stack limit
 exception
Date: Wed, 26 May 2021 13:18:47 +0100
Message-Id: <20210526121847.1935454-5-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x42b.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NBB0ks09lWdO

Now that raise_exception_ra restores the state before raising the
exception we can use restore_exception_ra to perform the state restore +
exception raising without clobbering the PC/condbits.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/m_helper.c  |  5 +----
 target/arm/op_helper.c | 10 +---------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index d63ae465e1e7..c793dc486f0d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2600,10 +2600,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             limit = is_psp ? env->v7m.psplim[false] : env->v7m.msplim[false];
 
             if (val < limit) {
-                CPUState *cs = env_cpu(env);
-
-                cpu_restore_state(cs, GETPC(), true);
-                raise_exception(env, EXCP_STKOF, 0, 1);
+                raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
             }
 
             if (is_psp) {
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 3b3daa955598..23365b33feac 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -90,15 +90,7 @@ void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
      * raising an exception if the limit is breached.
      */
     if (newvalue < v7m_sp_limit(env)) {
-        CPUState *cs = env_cpu(env);
-
-        /*
-         * Stack limit exceptions are a rare case, so rather than syncing
-         * PC/condbits before the call, we use cpu_restore_state() to
-         * get them right before raising the exception.
-         */
-        cpu_restore_state(cs, GETPC(), true);
-        raise_exception(env, EXCP_STKOF, 0, 1);
+        raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
     }
 }
 
-- 
2.30.2

