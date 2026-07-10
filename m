Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4182FC44507
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIEy-0001VY-Lu; Fri, 10 Jul 2026 16:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEw-0001SD-GG
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:30 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEm-0000jA-7m
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8423f236418so1050586b3a.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716859; x=1784321659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sqD0i4B4xHusdPHG8dIAD4vZ8p3PsgamfaStAkj5bxU=;
 b=W7p4KMSRHRVwda8Ne3q5fOWJOCW5UxyVlhNNHIYiovpsTH/tyEW9GCnXYA24bVRrSL
 ESpCQm6E38xmSDXcj64tXhc60AjNiQHlBV+zuGg8KaCLSO/rRvgsEJvPSJm1yh1m80ri
 f/AIwxidO0XrsZF6BwQtdD6Sp69xdAPWV8cV9uLtHzCGCZcVlIAt/6hFNihjFEhub7gD
 gf5blITHz1SV4a874n5+xoUtTvpMyXNEX9RF6CUICnjp2x87iEIVx5xJYRHiw+eD4wvJ
 d2TSDq2/LdCVpsUqTA73qtzCKTWSX5Db404+ApQunWTTsaOjsb7VzeXJhBMprwRVcERX
 TeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716859; x=1784321659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sqD0i4B4xHusdPHG8dIAD4vZ8p3PsgamfaStAkj5bxU=;
 b=qtudwRc8qFmdeAy59nfWfrTzoZWAUHUJ6WNCXeF4yY6E7bLuTrpHn5d2g8HuC+ttpV
 2+ov3cgiEyL5qK4nMAHKBTapKacfC6G/Y7tL2349Xm/pxA+rliu2pfSvw+zf0FKxPsXv
 KaNlmn6ppmcgDKkPhJ8j6uoRqlrLm5PT9S2/CuscUmhYm17a5sY1PK/FjuDgwbDXdaWr
 GOcubiB+qUC/ZJ2tZY6/NBU1Op514iSVJBkLq/N6pG5isJA0MoHMFHQf/PHS6v29qxAy
 Cnqq/u8sObQmmI7nUIvyT1bPS2CheDJBOfrrdKchcZ8+bDRHhwBULZDEcEvnLM4EigAa
 mFVQ==
X-Gm-Message-State: AOJu0Yy8gLV/k/M3YLKIPNiWNT5Aa1fD6n3t/y6LTOtMDLh/yQxGrlat
 XUBerCPqHjqy4ejAjP9+lxPkYEtC5lv9OS69iQypzLzYAZYpb3LV2Thce/P212QNrBQ=
X-Gm-Gg: AfdE7clJZ+cigbmrN/Hvtnzj1mB+dMXnIpFIXSI1CZlEALBBZqhAfQvyLHq4NYb2zXN
 KgB9xHmroTLkwZxpVwVUKsGX57XKWHNrlAaU6dnDOCANoqcNYqhNhg1dq4h8ERfPlevrAZrdtG9
 KE5SDLSPiDov1+ukCQfSwC6r6/23P5urDyPaMfXiWBRDwRgHfvzsX5nZa9miwFIafXdxJu6dD8Z
 2i2+LIsFWKoGFNtlHeW4b0XH7QV/g1Lgo7Q2HW/fpBEk7aByU6h1NanfwN68AE0I4G2zcEfj3M/
 5PChihLs3K7gwNf4IDvfYQTjmBD8d5j59CauVGnKJ+xc/F0/i9WzXAI4XVK1W6oAtOJE+a32lhr
 CeJ5fQSv1IZeukQ6X4q/bxdKoU0Djy3iXkRvviCnHzYoFGj4AlAJSi4F/ZmnFhlf2q4zANDBhnE
 TnWB5AlrJSdw4/cjO4SnBe2rFxWWco
X-Received: by 2002:a05:6a00:3494:b0:848:8445:6956 with SMTP id
 d2e1a72fcca58-848895feb43mr459561b3a.18.1783716858692; 
 Fri, 10 Jul 2026 13:54:18 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 14/51] target/xtensa: Use bp argument in
 xtensa_debug_check_breakpoint
Date: Fri, 10 Jul 2026 13:53:24 -0700
Message-ID: <20260710205401.836304-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use the ID of the breakpoint instead of a loop over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/dbg_helper.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 557a7852c8..b08bd03435 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -67,18 +67,11 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
 bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
 {
     CPUXtensaState *env = cpu_env(cs);
-    unsigned int i;
 
     if (xtensa_get_cintlevel(env) >= env->config->debug_level) {
         return false;
     }
-    for (i = 0; i < env->config->nibreak; ++i) {
-        if (env->sregs[IBREAKENABLE] & (1 << i) &&
-            env->sregs[IBREAKA + i] == env->pc) {
-            return true;
-        }
-    }
-    return false;
+    return (env->sregs[IBREAKENABLE] >> bp->id) & 1;
 }
 
 static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,
-- 
2.43.0


