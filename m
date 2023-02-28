Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5184363ejc;
        Mon, 27 Feb 2023 16:37:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8PNTSKfLrc3Bwkz6VbPM7QRAlRB2L5lDo4lt7Y7gzTr/pc/U/S7XYSEPAyhWE0pAM+tYTm
X-Received: by 2002:a05:6214:e88:b0:574:d6d:a317 with SMTP id hf8-20020a0562140e8800b005740d6da317mr2341151qvb.39.1677544673878;
        Mon, 27 Feb 2023 16:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677544673; cv=none;
        d=google.com; s=arc-20160816;
        b=H8suum1c1Q9OWgzEA0J0WU7j8sy1akaPBmT5gbQPw2YMfMDvzGwISbEITXVUHKvgwj
         u52ibCYMMoijhyUUv2XkUJnSQLx/Se87Jp+U1qojvy0giAegqA/PGu9rmkSPRdZaC9qT
         hjH7USmSsc8Afp/R1IoXK84r9fA26ah3cR5HKWeS3k8uVuQa3XV5u2nNNmegf9BoIWes
         Fza6/xYZj0AkVvo9acHVIWoutBXhoRCGTSchmIJDNeRUJwRt2OnpEuqnndbDoYw18xvr
         pQFrPxqzDsywiGG7sYOuiw4XisUNeO7m/E0IdRMhWZUc4DTz2xATfIRi7CrYSyTAXiuM
         BgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q4xxvNNq9D11d2cHOwhM2OgWfJwvQhuk5jBDpKihxi4=;
        b=KfVL/bRtYgnDzep6gmFCOD30uty0Zfexau1vVuP6euA0H+cGlIR9/kocO8qE9172DZ
         DI4tDIQUNX35rT2EQidYXNj8lK7MVV8wmfTzBK9Q8WkCLja4a98O+O5vkQDJwDxhTCIr
         3awYSr7gfo8UkpMY+3B/awhV/Hq121bmPu5wfg0GXT7HlQriap9CZWL6DRmUYthaR2DC
         V37qXGlWiePd7vYwWVo1+N6kb1NSiVcXV+cw+2EELY3k1pE+xB9ohoVYsnGJwzM4uNUE
         anpZnrjrY460pXcWVUHkJY6Xkk5eGZRMA/5Q7WhDxlM0BrI1osmfI7LP3sAGkREnZdDW
         wHjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ze2l0GJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a0cde06000000b004ad5edaeeb5si7046836qvk.357.2023.02.27.16.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 16:37:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ze2l0GJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWnze-0006S0-Qg; Mon, 27 Feb 2023 19:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnzd-0006QY-7T
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 19:37:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnzb-0001XH-CJ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 19:37:20 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n6so7330965plf.5
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 16:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4xxvNNq9D11d2cHOwhM2OgWfJwvQhuk5jBDpKihxi4=;
 b=ze2l0GJ1BJATmCRIXOfRHppbNHxsT0HPiXQI7hw6Ow5iJQqyguT1nORQXuaxzQDokU
 B+YvXMSrWZi41Yg9zArlfaPPjwR8lPDhQLp2n57duPN39gKySJ3nldu6RHoCz+ddbjfc
 IF2PlZ+7UKVwitEHBKh+xWDgPQFCMMsp0SPWD76+0J/2ppViJminzoh1h5+2IPJmzRmP
 KJ/mnmxEvO9KPCww0LUDlh/PzLqxx3DNMyDd3SyblFcEVYzZmlJBaZNkoS5cQDW5CTa4
 i99SlENejdZeu6uQa26sPjTHoaOrwAjkmGM+gZqjlVt6KhnMsR+8T++KKGSMKIiGbZmj
 QUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4xxvNNq9D11d2cHOwhM2OgWfJwvQhuk5jBDpKihxi4=;
 b=W7tYn6QHP6BhI7GGE7B4MEiiYM3L3O5OL++brcnHVa0Y5yk6Vj+WobsZn+t6US9vlo
 6ocdHvrqbcz1d5BTWg36ofh3hAAxZR/p+d/s/Sd/TzFHBdSMxx+wRvttKLWRLYXXunQ4
 0IvCWw6xyZwvlN4SM7tjSlYVx+7bS1t6pTC9jyfGkWOkUqu/2+8XxFKSNI+aIxqguMDE
 XUhsia73yDp6eE85dArGfvWHbEv1EatQNAWTDf0gbT26cfRDQo5yOc6sP4/PRDi2b2/U
 lDB40f2joErK6v95kU9rxvn6h8dKoNPqv2Luz9hWFcFH7G6argsGdKyV+Ql/t5m8mNRh
 U1cA==
X-Gm-Message-State: AO0yUKXbFnmCmam/24cbbJq+Xw4+CYlndn8qLusbfDZXUS3iy9ak7lmZ
 KCL5dBLfykMZts2zx/drBNbMoSUOGwUn96QPBJo=
X-Received: by 2002:a17:903:1386:b0:19c:f18d:96b6 with SMTP id
 jx6-20020a170903138600b0019cf18d96b6mr617218plb.36.1677544637966; 
 Mon, 27 Feb 2023 16:37:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b0019cec7d88c3sm5192651plo.236.2023.02.27.16.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 16:37:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: Avoid splitting Zregs across lines in dump
Date: Mon, 27 Feb 2023 14:37:11 -1000
Message-Id: <20230228003713.861168-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228003713.861168-1-richard.henderson@linaro.org>
References: <20230228003713.861168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: Deu+7hqGj/+G

Allow the line length to extend to 548 columns.  While annoyingly wide,
it's still less confusing than the continuations we print.  Also, the
default VL used by Linux (and max for A64FX) uses only 140 columns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5182ed0c91..f1f454e7a0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -953,7 +953,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     uint32_t psr = pstate_read(env);
-    int i;
+    int i, j;
     int el = arm_current_el(env);
     const char *ns_status;
     bool sve;
@@ -1012,7 +1012,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 
     if (sve) {
-        int j, zcr_len = sve_vqm1_for_el(env, el);
+        int zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
@@ -1052,32 +1052,24 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             }
         }
 
-        for (i = 0; i < 32; i++) {
-            if (zcr_len == 0) {
+        if (zcr_len == 0) {
+            /*
+             * With vl=16, there are only 37 columns per register,
+             * so output two registers per line.
+             */
+            for (i = 0; i < 32; i++) {
                 qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
                              i, env->vfp.zregs[i].d[1],
                              env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
-            } else if (zcr_len == 1) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
-                             ":%016" PRIx64 ":%016" PRIx64 "\n",
-                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
-                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
-            } else {
+            }
+        } else {
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, "Z%02d=", i);
                 for (j = zcr_len; j >= 0; j--) {
-                    bool odd = (zcr_len - j) % 2 != 0;
-                    if (j == zcr_len) {
-                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
-                    } else if (!odd) {
-                        if (j > 0) {
-                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
-                        } else {
-                            qemu_fprintf(f, "     [%x]=", j);
-                        }
-                    }
                     qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
                                  env->vfp.zregs[i].d[j * 2 + 1],
-                                 env->vfp.zregs[i].d[j * 2],
-                                 odd || j == 0 ? "\n" : ":");
+                                 env->vfp.zregs[i].d[j * 2 + 0],
+                                 j ? ":" : "\n");
                 }
             }
         }
-- 
2.34.1

