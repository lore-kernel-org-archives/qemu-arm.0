Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5115457ejc;
        Mon, 27 Feb 2023 14:59:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9Ca9wWchfwbUeQITsurs2dqUA9dWvd6A0xppo/KNaqFFbYxUUa/lP+4BUHS57dmzIKr7EY
X-Received: by 2002:a05:6214:f09:b0:537:727f:ac28 with SMTP id gw9-20020a0562140f0900b00537727fac28mr2473322qvb.27.1677538794848;
        Mon, 27 Feb 2023 14:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677538794; cv=none;
        d=google.com; s=arc-20160816;
        b=Arz+Wgvhqd35amS1DCIWTQw2DgJ2yxSxIS48QhRilBBGxitKc8S+v9U+3sBjoja/U1
         8LKGir6UCa0uEnktqItzRt5ueCmem5EELgpqPHkwryoOQivVA+lB8Sr3P0U2rJ7O3GsS
         buZHB6JqY9hyyyF0bpqqrPk+hQP/O5b2HR3sCYRmeFTrhl1hAmLh98LWvz/O161wjtye
         FiZVBVc4TdgbbC5OShBSIDgn8dKoqq2dXatxiDbcWpxrSbRVe739Fm30g9Y36rJXjjIb
         qij3bYAhVju+OOYFAE4tUQOYG6Xx5mFhanKZsXwZs4tDuYZLrJ8VcuOZ3hXIGG+iQ5qV
         TX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pUw/Q9WV6uI2o5+wRzg6/DeRVdVBmeUlUspfEoqm0lE=;
        b=u4/4qvPEaayEm09THEJ82dGwXUo5u+3iekr6ij4aJFeUX6Jtwg2cbJ+55C1CJaHE13
         kw+n1YKDXjWnyThP6W7IV40zQV+5Q5b1kB5e4/8oFvXmZ2NtvAGSkVmpb5IvAM+3EWs7
         6AlYilo4qkVMdSmhEs5+qch/nkn98umUxqhdfDspA0TOqP/QBbNREwnlVadiEEzcItpj
         NO/T9/n8EwvxHYdmfbzdzSpVrC1wu0v13jcR6ISlFcqz+oQavzKPAVhKOJZt8ZjcOS8k
         dIrPjjRNrxzLlc/fTHyOC63y6YENsEJtaIwzuyOX31eXS5dnFigPkObnQ8/FvHSZcllw
         dRCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vECubhlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a0c8f12000000b0056e9cb06e56si7203454qvd.322.2023.02.27.14.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 14:59:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vECubhlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmSD-0001RP-3T; Mon, 27 Feb 2023 17:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmSB-0001Pc-1c
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 17:58:43 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmS9-0008UV-BX
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 17:58:42 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7774045pjz.1
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 14:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUw/Q9WV6uI2o5+wRzg6/DeRVdVBmeUlUspfEoqm0lE=;
 b=vECubhlKRdQsN3lP8ZDYsjEKaVPJU7IbO2Bi8mzQPB6UOv7S2WTn3+w4fr8Ba6PlJ5
 0B+EkahIrihV88wCB5zYCRFbUWLtnSNNXB1mYZ9aFE8o7QXF16rw9yZc6ADmhKLhUVeS
 Qpx2TZfgco2oVSGtNVcIDADi3VdreXHMHyL8H3BRWrs6015roN0+dKGPdQP1+wNLehwz
 2Pm1zbVWyI4zZrvo+glxMCmJmEj2KK/NqvdUv5Sl6w7uxewrQ4PxjOpO5U9FT8orU81g
 H6BPHLWOcjdL91Hpv5L9FnvN5wH58IUvub6HhLpJ9qZgxDcUoAlCppOMf3Lm1S3pOchS
 xx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pUw/Q9WV6uI2o5+wRzg6/DeRVdVBmeUlUspfEoqm0lE=;
 b=GWmQ7/VLeZN/jvbBhH44GODltLAeg0mendZF6fYsG4MsWsxekUDc7zzuF3xhezS1Mo
 1MLaXGRE1e4tvNLgUAwZwsMFJePNfX/tU+dS3hx9w2XDp3ncExlqySUUjKFa9oIJj89W
 i97HzWYH7uCujM/sx0qeKCJsL0cWnGQLQgK3RYcjI8jECOfRALbz3S9gVXehN8eWxq8t
 ycLNSfYAlx55NddfBD7+OPM2xCxi4ddUq2Pq63QjrhqtU08NEo/gMxa8aTs2EreeX2Dj
 9b6He6/jEof3R333X+0PMOsQFyoGKiATi2WRV/vkLpxUgt+J910yV74Vmo5DLqavon7A
 i2eQ==
X-Gm-Message-State: AO0yUKWGcaIq+9v0xmuX7F/321j6fEiwBUayCvdE3+HsKBaaGBpG/uot
 Mbi4AJG9R5k62o9AOTzvMZMFRB5Zap0Cf3ZPPXI=
X-Received: by 2002:a05:6a20:691b:b0:cd:a358:bb7 with SMTP id
 q27-20020a056a20691b00b000cda3580bb7mr972153pzj.37.1677538720613; 
 Mon, 27 Feb 2023 14:58:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a6566c2000000b00503000f0492sm4441050pgw.14.2023.02.27.14.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 14:58:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v4 3/4] target/arm: Diagnose incorrect usage of
 arm_is_secure subroutines
Date: Mon, 27 Feb 2023 12:58:31 -1000
Message-Id: <20230227225832.816605-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227225832.816605-1-richard.henderson@linaro.org>
References: <20230227225832.816605-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: OmaUvDu4Ig89

In several places we use arm_is_secure_below_el3 and
arm_is_el3_or_mon separately from arm_is_secure.
These functions make no sense for m-profile, and
would indicate prior incorrect feature testing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7a2f804aeb..cb4e405f04 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2389,7 +2389,8 @@ static inline int arm_feature(CPUARMState *env, int feature)
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
-/* Return true if exception levels below EL3 are in secure state,
+/*
+ * Return true if exception levels below EL3 are in secure state,
  * or would be following an exception return to that level.
  * Unlike arm_is_secure() (which is always a question about the
  * _current_ state of the CPU) this doesn't care about the current
@@ -2397,6 +2398,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
  */
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         return !(env->cp15.scr_el3 & SCR_NS);
     } else {
@@ -2410,6 +2412,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
 /* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
 static inline bool arm_is_el3_or_mon(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (is_a64(env) && extract32(env->pstate, 2, 2) == 3) {
             /* CPU currently in AArch64 state and EL3 */
-- 
2.34.1

