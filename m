Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4571350lft;
        Wed, 6 Jul 2022 02:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGEomxGNY2bUpnM5g3zmLbhYmQMMfjWKoIfh6tpS7fTj0l644HcBCze18chSKIPXxgu5UM
X-Received: by 2002:ac8:5744:0:b0:31d:4baf:f12a with SMTP id 4-20020ac85744000000b0031d4baff12amr12909981qtx.451.1657100010469;
        Wed, 06 Jul 2022 02:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657100010; cv=none;
        d=google.com; s=arc-20160816;
        b=jNYqb44gvb5iEEUSG/2VgfOETHwap/Dnjbt9zeMHebR04gcqyGO+xrnOOmk1V72r1A
         88eJaBgm3P3uTJbUi+Pc/1J2/yexZ5zZKX0w/VJIgvmJtJchuOplX1cHD301g4bHnHro
         kMbx/t2ADmbFPpfEEs63SB4cOl7qPBwxS0kOIaCohYcW8ALbKU28QsLWRnAi7Q0MNSCW
         h8UhvpjD6nXwW+sQ5SNzYSK9mP2Ts/l7BgGWyeTWHVXbMoQFcaDje/UmFMGcwze1EKvf
         JTSdVQD1E3P7Vi6KnyyoicXnsQLy3zKkFi7L+U1Y50sYesee4mhv1e639tv3tBerpEl8
         +UdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
        b=AA+BpCYzMZQJLxZ+uDrSJqK3QRPnZz1UqOpsJawSsop8JoOgqlVBr12xEpvzM5VdwL
         LECOS3VXZZyJKCNBpaVNSmuk0cZVeBlAYkiAkAo4iGVV8cabzK2VlQnEdEoMDDqmGUQ1
         sltRcGfxgbfhIyvvRf+s2slZa8ARqed3p5ydhPVVGVloYZddUy2SOXjp8+wuhec0WsP3
         lVAAS/vxwbSCyp7NRnzZIAdIDwR31lBJPyYXuU+yjN4LrRDb53zLqzveQW8S3RgRroeA
         GYBlxMDzU5fbwhJPYHpe3Z+k3mKdNk8BEfwqFK3+XhZaT6N6pV2pfZg4DSHNPTrGwRn+
         gUlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vLH8u/YI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ad45c62000000b0047046a6f7d4si22076886qvh.206.2022.07.06.02.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vLH8u/YI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91PU-0005WO-Rw
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M5-0006oN-OE
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:53 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M2-0000gD-Ox
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:51 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b7so3233855pfb.9
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=vLH8u/YI6xNxYEqgir1ZeiCndQwgdBo+q/o9gvHh83VvtPfjnuOFng5j5qZUlVptkO
 zC9ZtRT0OUKcaK5BtjJxZcqIDLjNDpYzOo4Yrogu8y3X8BezJzHfiMYDQjq5xQG6m9Cd
 kYSJXJfqUrA3pdoHUL6cy/1ZOtUKMUbeRBGKfHU705kU/n+e/wmIJu2gMv0NJ6jRGeMe
 GDHqpvAszlmFK8TjSzYTDSehB3TnmZd1uVpaQ/pdvOXWcYdPydqFwODtDfLQMP6Z7pzc
 4+t/Jfgg41865AqcYK+zFqbgu0ev40xlhFeWZbsOC474WV1Z7eAsDNe8hqq2xROBAF08
 M+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=EmBvKPxI/TZbxluNIl+Cp2NjmG4N4sMswHlooV19rw/u6hrbQVlzaFuXstAA2u7k+r
 SEJzqWik2bU2nsf0yflAwRcwtMAllvIKeuNJGfpl+/LQECho5jjsSt/M6Oys+QChu03H
 QMrBswYJGeHLTz/ixX1rKSwa30ubjimLUpz5qOJ5wSL/jnIb2w08B7uKepfR+BjP7mEu
 AeOrmO3pKE9Ml7fZSkgL2E5HAa8pncGYf6G/ofJTfBKdTd/TvHxZ1cRfdAmuAQ+TQjNU
 aqRKXuoXoZo6STdU/XanjrpLJXZsIoyZPHIB9Kt0Yhq2+V/pa51UfmwWlIJHIP4rjml3
 OU6g==
X-Gm-Message-State: AJIora/8ZO/FHgrFb4D0TG9t2yKTBKMmaP8UP6cf7gMGBYoeOFZKfygf
 KHwVZdyEgrMPY+Hccz92OeeB0w==
X-Received: by 2002:a05:6a00:1901:b0:4fa:fa9e:42e6 with SMTP id
 y1-20020a056a00190100b004fafa9e42e6mr45598933pfi.1.1657095949999; 
 Wed, 06 Jul 2022 01:25:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 34/45] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Wed,  6 Jul 2022 13:54:00 +0530
Message-Id: <20220706082411.1664825-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: zc80INay3djO

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

