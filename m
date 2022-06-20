Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp609111lft;
        Mon, 20 Jun 2022 11:14:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sN8B9mEDWkRrIyJBUkGDJY59RN7QWKPuj7VF5omjlJPBYqfra9pQjwthFFN2+itWIfOcWp
X-Received: by 2002:a05:620a:288c:b0:6a7:9aa0:ab89 with SMTP id j12-20020a05620a288c00b006a79aa0ab89mr17297148qkp.113.1655748891873;
        Mon, 20 Jun 2022 11:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748891; cv=none;
        d=google.com; s=arc-20160816;
        b=JTsrIgVkYi62WNcWVaTHE4WRetus6TKPekNR7nveRM9fgsg+r5GCOt8IxuuGrK3z6L
         2oLvvLUX2A/8fCqQgWwLBkm8+W7s2eoa/WIRbsFwBZIIqc1TghIvjZfrM41Jti49LnjK
         qIp9CJyO7n5fomEhUwDz+TJyl2NTzh6IKUvevxh0u44nHPftiC+NUJTPOM9VCc6n1e8b
         dicjGYsmFnVJ0EmCPueP+IAqd2vCP6t+5ZynoyfSXO7HCWJ5uyKmXx2P14MJTKlH6Igx
         ShB5s1fB/I9Fd3NJIQCcM4YcY4M9hfHmSaPUZSh8yfHZN1N77AckN4yC3dwoZBqgVtI+
         M4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zl3UQa9L83DTzd5dN0hhGMfsA9e6o+OsnHnXrS/Os6s=;
        b=i3VhcnJO76AhSiljY/BNCR58D5/KXI2Yz+AyDmQD+vBujYu+rqINFKRZkJ3OhEPdRE
         46Yny/Bc9vfuuyYTd5foqpIDos7IrQmMZBolNeJazCQUHYtU2RVPSGUx3T697eIwLyaI
         5Mp6XfUGRUiBYHvs6T6bt9xH630i7sxLi8ldq8c6uPHlrgaf4MSuawWoTca0UH075Awm
         J4q3clbWARggExknL4LIWBfGHOA1sRvRyVuLcrk/kFIr17+bRfrXPYDG0YE58l8el28N
         raes/JOdmVWnr0wybvTMVSHKFzZ50NkSL3OfSFYsgO/1eCGggFbukYA/BZhzDqeR09ff
         6s3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xh2uG1T/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020ac858c9000000b00304d8881540si8465037qta.547.2022.06.20.11.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xh2uG1T/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3LvG-0004zj-Ec
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaO-0006OT-A7
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0001ZE-Pd
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:13 -0400
Received: by mail-pl1-x630.google.com with SMTP id d13so10359020plh.13
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zl3UQa9L83DTzd5dN0hhGMfsA9e6o+OsnHnXrS/Os6s=;
 b=xh2uG1T/oYbbuFNqTvwHHhyXVAxgJZQei6IkfqezkwKW39CsLPX0qmRt5a0VDfn6Vm
 NlUplWm5ipFiQv8z8o4afiKAE6yYOwKZ4qZzz8tSCXkj2J0C8qBsaYgRthq+uUoUx9ek
 Kfy5+FFZL0dtS7qfm5SiPNgY29M+SUb1yYx+T2ln5eML2xISaRKJPgk79w0S2L/knmbS
 GDPx8xwd7haF9vKvTHetZveq4DeEWijg0s8lIxa58Ov63gbUAZ6/fUlw/p6I0ecPqjll
 q9pl3E6yYtGHZjoXejqTRbTMWoDAkzB/PmtJKd2txVgpYG6N0Kl36Uf8r6hpveU5HjCe
 UXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zl3UQa9L83DTzd5dN0hhGMfsA9e6o+OsnHnXrS/Os6s=;
 b=VrdtDXkXX+DqR7hVtouAZfGubboAjxgrRjLHevlnmKhIQ4Mc314c9zgRpcrhn85UsM
 bkCfwF7eCm/Z4KCDEGiVE7/ud6Q5LeAy6Jdz0BLIRDy7a7PnBzZ7szMahbwinPflrS43
 ZTw25lOv0wDYSIB2gcF3/h+OX6kK+xAmI/rzJ3tMeaIwMQT065DE5yc5ZK8c0GL6rSnd
 HeuSIDOTisuyN4lm2/6myk0P9eVXW5ekJK+XBHWT/APH+pfRW0BfrXYhjsgTV5h3Mb8i
 rySx2pUN6Uf6kkv5Rjax0XD0eb2s34MFTiksEhvhUYlk3lEAdB+ToMfPp5c2zlXbhQ7l
 XOUg==
X-Gm-Message-State: AJIora88Vc0MQaKSmVW0nO0hxzapUDt5djp5Vxv5AanUhoOmtpCLW1Ns
 LHWfvrOzH4nRcxy0mycjlirnq5ACIsbIzw==
X-Received: by 2002:a17:90a:2f87:b0:1ec:87b2:ff15 with SMTP id
 t7-20020a17090a2f8700b001ec87b2ff15mr16295045pjd.135.1655747588348; 
 Mon, 20 Jun 2022 10:53:08 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 37/51] target/arm: Reset streaming sve state on exception
 boundaries
Date: Mon, 20 Jun 2022 10:52:21 -0700
Message-Id: <20220620175235.60881-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: 4BO39Ga+7nft

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 26f4a4bc26..9c5b1a10eb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -11766,10 +11779,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1

