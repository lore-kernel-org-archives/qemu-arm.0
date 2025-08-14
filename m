Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63C6CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:00:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXYb-0002Ri-FQ; Thu, 14 Aug 2025 08:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYJ-0001zr-IP
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXY6-0004La-Kt
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:30 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-32326de9cb4so813524a91.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176355; x=1755781155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGaWh6qB/XNYeP5vG0YKYiWrjkJVNrqnpJ3x4KugETg=;
 b=yW5a5+dGpsslyK88x6O45q9JKjThEdF0XzbvKYEI95HyMb/er4lPlHmpWDRKX7Y/aC
 s7GBZkdZdYMBwixx52Gu0zyGjIUv5xpffdmkxfbNurL4lJIUc44TgjJI7OeeicOajwfz
 oD99Gu1nCfSgCovS9J3Rm9BJhp58cijSftuLm9ezW82TqivmbUmq9xqZ1LHEjX6rfmMM
 yI7LMpsXgDAUDl0VK7i2N99nefgFOooNc0mp/AU6Si2pRZ5yHKSm4k8e30pmCPb2vX3t
 XY7explZJbkev4T3ZanNRyXtxZ/SdfkRdjXz4MNDvR6GJI7DsA1C5XaXGtzg4bbJCAsC
 r1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176355; x=1755781155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGaWh6qB/XNYeP5vG0YKYiWrjkJVNrqnpJ3x4KugETg=;
 b=N6azzCT5QUHF3q/LZF4rEvnvzVuyXnwi3FmaAD2nLIMRt2fmOfLrK/RbiRCQJ5S5Al
 rWrbqRYcxN9uI4ubv9S2aBJ7rxnAnO0wgIZWIPNklkD6i9BCIHQfsK0dyZAanOckmU+9
 bSd9wLTNg5hlNOQje+Z1HQLnMWg11RYDIfLlsLLseNEwfoXOQdSZQotDrbyV/CkfNJAp
 RQx6N5wCBPF6GT3rnCc4NSjeYSor9q8USELsjzyeK081A3EFIFu7nmtFmey/x9CiSUXl
 77qsG0KtPHuUtSQrf8A6+CxTddLLGCZURL2arKsUYw7EABU2/v9DVlAgKjpuWCGpFP4l
 rW9w==
X-Gm-Message-State: AOJu0Yy1rGm2MgcYPrBB8j9Zvfy91ucZ5Inq81cjGm/pFqP7yeg4J/vn
 w+tMx6209CyhBYARkhdAur7/ReSU76dG3sXIq1b7/G70BQ40PF22wnfJE5l2aYt8Exj7mx38OES
 ub0Pi0WY=
X-Gm-Gg: ASbGnct3eQZ53DKEibF8En/vmWv4Bm4m5EtjeL0+G/evLyiuCfot0RkLELdjbO6HSqs
 eRWMWwQsNqh5HTi0WB7Zt+DIkEHsZ0ztReyGcPeKrtdxDzEA1h6lD7/0sJ+enTekglKNtbrvOz1
 sOnfMr52AVj/cRLbCgtVXsCPCzFOVOB7oVXpyGQjkA3rwEXC6WTiJjDilktiKXFgc9ITxCIJ6rC
 r1znuyQVxbt0gZ1wRnXSOlJCN42xTQqjpPYPPJY8/h9IUtJVjGCxWABB9d52b0qVQMyQG6iR6mN
 YB+hSBXK5wYc0gh+pKdoN10B/W4KRGFvkg7Vgk16CVN7EOLrPzEiLTXc/fwbFEVS1YPHGWLK/Na
 CDstyI/Agr+31U8UUa2qQp+1f5TY1Kg2CACeHVjQzUxAGeo8l7Q/dlDWSMg==
X-Google-Smtp-Source: AGHT+IFFMfxm3JZhenTz0m+BsUhIP3eUhPlUhnkJDjenD52/ZfxQRr8DM4Kn04sV+Ad2vXjvNMUZiQ==
X-Received: by 2002:a17:90b:3e8e:b0:31e:c95a:cef8 with SMTP id
 98e67ed59e1d1-3232b7b7707mr3016530a91.32.1755176355187; 
 Thu, 14 Aug 2025 05:59:15 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 23/85] target/arm: Expand syndrome parameter to
 raise_exception*
Date: Thu, 14 Aug 2025 22:56:50 +1000
Message-ID: <20250814125752.164107-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Prepare for raising exceptions with 64-bit syndromes.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 6 +++---
 target/arm/tcg-stubs.c     | 2 +-
 target/arm/tcg/op_helper.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f0e888ff93..fc82dd65e8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -306,14 +306,14 @@ FIELD(CNTHCTL, CNTPMASK, 19, 1)
  * and never returns because we will longjump back up to the CPU main loop.
  */
 G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint32_t syndrome, uint32_t target_el);
+                                uint64_t syndrome, uint32_t target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
 G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                      uint32_t syndrome, uint32_t target_el,
-                                      uintptr_t ra);
+                                   uint64_t syndrome, uint32_t target_el,
+                                   uintptr_t ra);
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aac99b2672..aeeede8066 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -16,7 +16,7 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
     g_assert_not_reached();
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     g_assert_not_reached();
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 575e566280..46a3b911ec 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -46,7 +46,7 @@ int exception_target_el(CPUARMState *env)
 }
 
 void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
+                     uint64_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -70,7 +70,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     cpu_loop_exit(cs);
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
-- 
2.43.0


