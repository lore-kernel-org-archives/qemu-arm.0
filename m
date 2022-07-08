Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp354530lft;
        Fri, 8 Jul 2022 08:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsAz/h0JnZzZjEGGEHEJMHqfL6TVoaCBGYaem+PZvq/SQoMu9rW3+p8To20I2QOFUXvwJn
X-Received: by 2002:a0c:c186:0:b0:473:bed:a148 with SMTP id n6-20020a0cc186000000b004730beda148mr3443091qvh.34.1657295835447;
        Fri, 08 Jul 2022 08:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295835; cv=none;
        d=google.com; s=arc-20160816;
        b=ub85LboNjG0rzwCbtA+HMvV2/XNXCjjUxapfnoKRWaSLch7KZ+s6XKRQlo/7c7gxwb
         wbKMN1cB+VoIY4RZRVUlEK2YVpJSV66rdVlxfSyf58drHJLqM6a++MJlQ9QxcB9+MAWA
         R2va38vyicFo5p7z8BqbqPE58GlvPYAzrBYHGkltH5HlK4wZrq4kCjZEYgc4/W6cO/nN
         sIsYZR7/iezWsKdqzvU+Guu1wJS/Oq/CcTxE/xfBcbl/ZzNv3ZIkE6/wvqNqhMyXgmyD
         /QmSp0YJFO9rdriPvMNmxQNw6VX1h9kCBfVm22MJxanxTRZs9USzJ3BlyeXhHHYHj4/X
         k29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
        b=blohG/QljrCcbuvZElRBLu0kIQdpJ8AiIlR5k6IdIeG3bUNJdXwP2j+ck1glGDCpUz
         w1vQM7UHLOTrZqxBsZbPWIZbc4DwthuLpb2+wp7ovAPWgoEQE60XAsvuSRMVP5TquVff
         TshCXXgO3a2qDHs5PUQbAygAKo/Ltgem/FfvxmAGjDYhjL0x5LlhBgwTHe6lR4fds/b3
         kAwvEFFpb9UR5gP8gZahyYt6QuFDpeJp1iLUODMX4Z4WP1UG9n8UJ4vr1oEMDYguAAlI
         qHJDnxcgjC4oE2mO1nyq2bMDX2oB7GuxQPkvMQgGHU6HbZUqeO8Loa/lHHEOIKh8RLby
         9eMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPqiAvNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q30-20020a37f71e000000b006b2849cdd41si8682452qkj.78.2022.07.08.08.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPqiAvNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qLy-0007A3-Vy
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pja-0004Py-Tz
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:40 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjY-0002Xo-F9
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:34 -0400
Received: by mail-pf1-x430.google.com with SMTP id 70so8680692pfx.1
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=iPqiAvNnaPHiE+AFIGN3QAnhp87OHXfDLk7LAnf0PL92ygxf9A/1QsN8BOPsAA89lw
 4tkayynTtTHbSXgy5HFOAqxP+pvV20i6XZ3jd8pMmu/VP1DrdIUsmAbp+9lL4GD8GDyN
 9PQcUZzU27o/FB5ctTGsLVVXVRhV5mfb1bMBwXHYsCov9RQnMk4iKojYCq6xAhelh30N
 H6LF3VNsSokP9E+fxT5jj8O44Ajzp45v1gxk2X1iTqDjwF9PWHqGAkba4s/mH/KY9rak
 UF2R2/uOAekTQM9WyEYuSIPqcmYpyXNmQP2b3scGTLtW7WMpVvCOoSGW04V+QsCu8lqD
 w+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=VloBBce8roeRdji4EmICWo7S2iZwNMJv1AzCaPIswWTPZApYraLzYA4yVT3Ua+eeDs
 rotDunj/xnFfCIEmVfJx4wN+vYfPnMoZczxtbcweO3AxGSkjOZshTkYpTXTuXhrcWnJP
 koCB7iW3ZmPU2y8r2U0/hejO/Hc46AXY0otdQMnNRQcyFgFVw8c0Hd+ryMRqwKdZ7z2T
 9SKYWkxVF9vmRA52Kr7EgbgsIVpbDBg3Od/QJEIiL4h9EldcF/Y1I+dD5KXkaU724uBy
 5+ZJ+WheoqmEvcGLbUFGupyan4hrjTKhmrwWRAshZAqdD+Po7u4TiQRmnv5Qnlc1Divx
 QdMg==
X-Gm-Message-State: AJIora9plac4Ifzjnyz7DcFE6AyqEKhg6QiIgibwpjPtYZwVcy65UyPq
 r0VmKpqoJaKJJW/N+pqHCtBhXA==
X-Received: by 2002:a62:29c2:0:b0:527:ab6a:c310 with SMTP id
 p185-20020a6229c2000000b00527ab6ac310mr4239129pfp.12.1657293448077; 
 Fri, 08 Jul 2022 08:17:28 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 34/45] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Fri,  8 Jul 2022 20:45:29 +0530
Message-Id: <20220708151540.18136-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: tt46bMn38bAt

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index f7ef36cd9f..9875d609a9 100644
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

