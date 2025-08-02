Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338F2C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:32:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLhu-0000Gf-IZ; Sat, 02 Aug 2025 19:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLh0-0007J7-1N
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:12 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgx-0004yb-Ro
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:09 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-741ab3e03aeso293429a34.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177466; x=1754782266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Utmv5egIEVGewAwFQzpT1Xl8BddTKGqUYuRm1k9B5kE=;
 b=jh8xzOL+AGN3hKXnI89YJgsGQmjm4Bge3ao/XU8W6CIpCj2LVqd3UZPwMWMqEgi9vA
 oMNODRcU18bz0xXaIv3RFbOrcNZQEYRd99bqweNCC0GKqPd08nBlIFz36MtQOTce7a9u
 hW/nAZYw3iIhbztF3Fk41GUuv7Jb3S0xtI6WzhD35f2iQc9SAlu/M2qf2hi/krh48bUu
 1mbEAfHNBG6a0Sa+8awKmawLORVZHAykrdxI7syvaKS1eeeh/cndo+xck+uY1uNOTSUD
 N0JebC/vRwPulbhayeGEGr7EcfRRerSW/V04r9MvbqIHsnyPpS+Z8HSrsswMQermXrPx
 kwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177466; x=1754782266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Utmv5egIEVGewAwFQzpT1Xl8BddTKGqUYuRm1k9B5kE=;
 b=Leec9n8HsN+RsIYyJCFL9pnjRMssHgVubqX1ngH+FwYSs0UIZbYbKiI6b7iR7zM53c
 6xKwadf3NrO2oxxOQVtIPN0KwE9s14mgfLEogOIso50mhOorEMyVauIcJSxk3pSW49ye
 Uriy6ttKXOEFz6fPr22pCxBBjeCaAmfESS6epJosVTkBJGfjHAnmYoQquo9SZadtlGOq
 hF1lzzyviiZUhP5stsUAsJsDB0x9npkf2py0podpdlR9MG13V2PisWNdWGbFziQQ+DWl
 +TkfwDbwsZkH/TNC4NAZMp6jU/JyJ3SG+0TPffZvcgTGEE2vZgtwole8UifhmoMXuuqE
 vLkQ==
X-Gm-Message-State: AOJu0YxI/fBppdY4GhI7xCB9mtsuqsJRUJcuBBmkiBJzMA+3enGeRlQ3
 d8lxi0sKRg0Rc2Yb7NVNpOP0/bo+r4YOtSAGabOTaGa0K0n9uIp6WM3Y7vWu6zPLYF0=
X-Gm-Gg: ASbGncsmQULQXck9QM00TpcKpvPRbUfGLVcI5k2wS1KcGeWAvHYByXbWaShJYRiSwhI
 bVheEopnlpHWdV1S0SDff+1LxADyK/IH1YT4QYymhLgxzUM6Ihi30AaqbQR8wTOyZa+1Th7LTtP
 LhiI6oioq+Yv4krliXmcKglBCLRm0A3UhEanhSjhB0umN2hvZCv/jvZW0KlXw+pFOhN7khGmICm
 QHRg9EuS6ZVhl9I4Ckl5Zx+RYTO3oLFQGDkXeWvS2sFW3tuN44889RmlhZFIly5z66gn0LlnV1a
 EvhUuEe6e3Q1zIjtz2JMKHnvt1EjGOqTP+BmazY07FzZkeBQgL/cAz1tFGtGoV9V+qA5dMZQo9C
 Q6nJd78Gmd4nMnG3/SIpD0feglm8DNpJxuVSHGRk47Jp3TM4MM2xsMexedMbJ8v0=
X-Google-Smtp-Source: AGHT+IHyCyAtiHzcpgMb6WUmfZ7Gv99xpJPloxAC24N+9KY91NH+LNFauyv/7y2VWOzfQIqNMTzr/Q==
X-Received: by 2002:a05:6808:2182:b0:40a:fb27:9e8d with SMTP id
 5614622812f47-433f022ca16mr2830647b6e.15.1754177466343; 
 Sat, 02 Aug 2025 16:31:06 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:31:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 14/85] target/arm: Enable TCR2_ELx.PIE
Date: Sun,  3 Aug 2025 09:28:42 +1000
Message-ID: <20250802232953.413294-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc6c82b7e2..61ba9ba5b2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6202,8 +6202,12 @@ static CPAccessResult tcr2_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
@@ -6211,11 +6215,15 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
-    if (cpu_isar_feature(aa64_mec, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_mec, cpu)) {
         valid_mask |= TCR2_AMEC0 | TCR2_AMEC1;
     }
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
-- 
2.43.0


