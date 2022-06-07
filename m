Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2433426lfb;
        Tue, 7 Jun 2022 14:44:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGn7SLOXnst5co0TgOuW3lADNroYt0kdIYNJIHqIUlYjWBUeVldJRoBrgITEBFoztrmiqN
X-Received: by 2002:ac8:5cce:0:b0:2f3:cbea:57c0 with SMTP id s14-20020ac85cce000000b002f3cbea57c0mr24889572qta.422.1654638259983;
        Tue, 07 Jun 2022 14:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654638259; cv=none;
        d=google.com; s=arc-20160816;
        b=EKsACWL3WqYVdv3LyJKDeYY2aKK9Oc5ikz+GcTI5DQ+vcyUTQORyp+zswf2VBo+r44
         sd/pkcfbCb5d+Bd6h/2zhj3lW3Jgl4aTHo+i/xcqz7LQ7aifOrnB0O4k/PgPZYyXncK0
         BwHDL/s6QsWLUDVp0ODV0GnVlhUBFV9oohFtTFnEKODKeZHf7/EpG0DXySJu59uIBv41
         02BTuIu6E95SbXccAc0gt6qqlimE2uPaVElo+bODWnYrO2dE3YViAYe9vR2G5nSD7cK7
         kpfdAe7gnK+edwMDkQU6n01IPRkGljA58REVRTnVkQ9AtNdoMEqxrcyTCJsZoYsVeer2
         G+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xCRHyiBxfCdHSn9JLF03/2mnxPSf+jP5kgzcaj+4wgM=;
        b=1CsHjsswmV/mydUgsKKWVFKOJWq2S01a7vE+poup2HHUKdrVKbXxtb2M/NqbERzNYi
         Mi+7KDI+EV8A3TIcAPjL96TPwN1v44+YionzyalGFU6pjutRgLfgNCi5zsh8eUYvrKNU
         AAqRWPdE4E24mQnI0iYVuSYTcKUlYdk2rhAxXe+9wVYaBLB6UqdLSzMKV+3aXdI3GoUo
         FLj/u0qDbYzPBlayfcCYYl4lT7KcpZq1x7ifKc540RoQHb4zgRJFWTuGEVM3zE9xYoUC
         ab/OVOPErEQrwQ1WaIVLbN67o0KS/zE56OsJFX5+/JQMC6uGca1bZiFL4Kip33czxLlq
         BVLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N04GvOk4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a05620a0c4300b006a680ed24a0si9411445qki.736.2022.06.07.14.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N04GvOk4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygzr-0002pA-Ee
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwq-00071Z-UN
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwk-0008JN-5x
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:08 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q18so15778529pln.12
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCRHyiBxfCdHSn9JLF03/2mnxPSf+jP5kgzcaj+4wgM=;
 b=N04GvOk4K5p0AnqkIX0Wj0j2pIcvfpejB8Rc6S3RpcwrjhQnEbeejrAnxu4RrPo1Dr
 lzqUdonhPpnmb7DTPjL9PP093FVHPpoMz0A2ssO1eptyOvbuhX2e7Zx1Xpajwe+o8rGq
 w//43SYKUhR+0JQXd1ivERrH5NxtiP1RNzz9WyXBV9/G/258j8kBHpH9EHUp6YVtJmZr
 PDy1DHsCVzyYTFxBuwrMJjMWjTYVZ1/9dwQX1LaVE0ovKX5UHn6pDMLmOrlV6SfLFEp0
 Rlde28i3NsYB62+8Ozks30hrtI2yCxgeavAWb9wtdZhixdUOQI3CqUSrWhazf2d6jHRA
 pq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCRHyiBxfCdHSn9JLF03/2mnxPSf+jP5kgzcaj+4wgM=;
 b=oPBbP5o1hwOaPU4AaSgqvEfmT9Y/O06xgkaCI6XDGivhat8D9cnuKwk4DK9QkdgxwF
 V2dDS58VRzXoFDy3rCjQA9fKiTD3ypiC1+gBFiaxSkgdVWPaVOVL1it4yWXZN9Od3zOX
 mKqn6+E5u0jp1wovxatS9FCDS0A4q+dxSQlErNacPRaspVhtZpDX54WoftCD2n92dT2u
 JCD4Dqd2wPJN4ugI2523E0TMAm3fdis/6mBw6W3H88aBTlXQxBataWUWIDWc6reNqoik
 hOHfGpVzDVBQebhBZ7YdAY4VrYaXrv77lFl6ZGumHJPkTdj5pVD8IjOPDaD8THN0bQbr
 QsSA==
X-Gm-Message-State: AOAM531G2D2cZVkJs3ujPd4eY2dutTLrP2qod5krOb8O+qQm2aftqysN
 auY+smwYiRWl1RijGDfj0I7r265WtieC4g==
X-Received: by 2002:a17:903:2310:b0:167:5310:9f03 with SMTP id
 d16-20020a170903231000b0016753109f03mr21484018plh.48.1654634220842; 
 Tue, 07 Jun 2022 13:37:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 57/71] target/arm: Reset streaming sve state on exception
 boundaries
Date: Tue,  7 Jun 2022 13:32:52 -0700
Message-Id: <20220607203306.657998-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
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
X-TUID: 0vnbHTDExRt5

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3e0326af58..205fbbbe42 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -14276,6 +14276,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
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
@@ -14288,10 +14301,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
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

