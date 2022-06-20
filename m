Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp612284lft;
        Mon, 20 Jun 2022 11:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vf7RBi0pKAfGGl7rfLSUsAi4XjYs5Smt4Ie+GhWVM3kp+wTMG3KBTMxB5v8oHEO8bxH9Gn
X-Received: by 2002:a05:6214:c6b:b0:46d:82b5:b1a0 with SMTP id t11-20020a0562140c6b00b0046d82b5b1a0mr19758696qvj.84.1655749299112;
        Mon, 20 Jun 2022 11:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655749299; cv=none;
        d=google.com; s=arc-20160816;
        b=rwBE7N4lgv3xfJSKveYF+sgQphy2nfWIjIJyOaO4xpp71ovvSvxXeIZfNyl5oQDVtW
         U3RGGclHL1OjtF5YyvOQbmmcRv1ihZSWpTtamXeZLcLfpa0dXN4VM7bkKWsK6/D5lQ6N
         LahGKPN+Q1FbMcJSB0pXHFYbBU0gumxzFfRjqG3GPXBMmioYDGgb/rj2DY7sODV2INuV
         jqsTa2mvEdOASiKRz6ywD3yRoo4/Hxj2Tq6OpslWMJJlfcxmTGIlrapgcDlMfwnSRuRH
         FOjv5k01fdzjaeWaacw8U4DnWrkwLspH9zSn1zDfT+/8w7XgNQh1+kfz4+1UOcm+vhZb
         EACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
        b=ijM8VdZKlPXAzVxODEXFqaNpuS3L+xJw0yxtDgR8T4v2L5H3egJ97t6c0hYQJxSAnt
         ImyDJ7L9/IgLvSUXrDln+6q/P4NPzvkfJj6O38SbjglqSWzfaHHw9OuVVk1QOtUuJxuk
         HOpbAxT8/d9QKu69Qn6n23s7tmFqy491hjMbwSIz1Irdjs4VfLa4YXKaqq92/f+hNu/K
         pfISdOm8rvYbQ/lFWFAsnBl/FysgZPEkctP4Ef035H27gCW1CYafkUseOyPzxCZAZK83
         /phEHIuGMcCpG4zG1psMotFz7yfZVRAqsl2eskWt8zVwNPtnYNpJ89dmc7fbav9GEmxT
         80+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MECwVpZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020ae9f202000000b006a59b2a8d8dsi7481771qkg.426.2022.06.20.11.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MECwVpZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3M1q-0001JU-JM
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdG-0002rx-R0
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:18 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdE-00021v-Ry
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:56:14 -0400
Received: by mail-pf1-x429.google.com with SMTP id a15so3675095pfv.13
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=MECwVpZBF9Mx5nA2rel6uputE+EqXe27JdgLG5u01KAj5naGsQw0tloXaygg+UsoP8
 NTLUeu4GxSv983exZm8AAlZF33CJEjqqq7MRVLWehVFr7MYD8MfOAnoIUCWgGpdU7g3n
 fTP4nDmhEUuGfTLfpLdASS+J9iPHAELNcXMBacfXCPjCXdgYFvB2BVXHS25xOKITpgvE
 L5JtTs0YzRc5pMK3wCudA++Hdbt5oFVlbYfCzEH3EphTNMY86JisieJsTn7w6yR1/Vro
 hJIV5daMRR6bFjSvEI9Zbufz2ErV03QhoIshP5gQoifblji4kr8dpgehUAukgJ7AcD4S
 8qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=1cfGp497YWpz5DY9IqtoNvxa1M9sDnUNhg93ZXLQMrg3BqqLYt5Ej+KJwtqPScTfnO
 dZuXPhY8tucgAz/PTTLn4alptFhKZTpOKgYG2zWbVCjXcO38Yj2mrrMNk9OHobU9YrTM
 A3Nk0StI43zdedBpSIKYpKRT7cCaPwnQpuUJyoQT4Ye1Cv5ipAkTVgjyedL4h43nQYNk
 tlg7+Gs+wmj2Zw4ajkEEfqJ51MPeZkb3ld67BNNcGVjH2GlksxuaXvsqyxpky42iu1eJ
 Ujh5yzzS0CRApxjwASOpPBgSFv1AyvokVpKbXv7Do6UisTfpnfqXylKQAxNppOmo0TXY
 7/9w==
X-Gm-Message-State: AJIora/huxCE3wUIWgVYnOTqYSoAJFNJ2x4LBXQFpdP5EqmqSArmDjer
 EECCpKgdBPKJxkKoi/PAG8iVfA==
X-Received: by 2002:a05:6a02:28d:b0:408:8cbf:2a0c with SMTP id
 bk13-20020a056a02028d00b004088cbf2a0cmr22779162pgb.422.1655747771261; 
 Mon, 20 Jun 2022 10:56:11 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 40/51] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Mon, 20 Jun 2022 10:52:24 -0700
Message-Id: <20220620175235.60881-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: Ld6yxqAqttwl

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

