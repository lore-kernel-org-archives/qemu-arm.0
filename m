Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1824BFF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:03:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaR-00049B-UW; Tue, 07 Apr 2026 15:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaO-00045Q-UW
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaL-0007LU-85
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-35d8e548a05so5886215a91.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591979; x=1776196779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=LsYzwYdfzupU9LN3b8Yk1SthAFKYnFU3WmziONRq48rOQOMhgl4Wi0TkTax1wekHR+
 A4zgmS7pHF95toctdJLMjOT/76JMasLtyEhUCv5P46akoKkeLrOCeBxFgN6UC4UvhCiN
 Xz93Di6JKwDFxMQttU6x07djHYETW3YtJxp3VHlNbzYX7fXqKm8wkeAskWGe0qqmGCNB
 zvUps5kOCz/K6UuA/Ui/4II1sslAbDSsINbtydqyCUp47qYERsCfJntvw/3/1F8+DLik
 O3JwqBLPexxv/xwTiMYmzkQ1cE9MqkfE7/EkT3ogT6ZUViYGqHXJ8u1V41H1+8XgzN/i
 h5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591979; x=1776196779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=i76A/qfCJj1eZPMqVmmVFi1QdBDF/sQHdxNSfWc3GWAaxq7JzOdDIA+YsE9H6oB00z
 gVrIkVykMZyMLxJi/gOlMJUnmxbrOtHwAWMHdEM1K44LZ+5hzelh4grX+g3/OUB0Rn7J
 41ts6u/yMEeJpr7c11Nbt/9vjx5TElO0q4M8fUBfZaE05yWaRO/3oK+S5ZG8kN5HR8vw
 fu7yawd9gkjYVmoTxCW61aRtgyz5NDbc5oW5YQb+mIbA2ukOtyZ+NhKeaYgveOCzmTgH
 pZ6/bagSoL5/nzhQjDZYZ3B9+VyxAyLNiszoASEQO5AzhsjqQZvp2NzR8nQ2eP5vJ21E
 822A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlwnXCaiHbPzzzX91UBF+uEg0zF7EYi+TbGZyp3L+30OVXlbKEVTMiuPqwj6zwvub0gJRgT3oetw==@nongnu.org
X-Gm-Message-State: AOJu0YyRu5wmGuOp3be8zwWM88XVGMh3oJvh1pngdhRPZMo0hojEWe3m
 ueHxUg3VM/nKsy0BKjCrIdiMCs9GNKPIWs7gCKd1qJTbkKAEL2EOdzUMrgNaknbc1b8=
X-Gm-Gg: AeBDieutmje30lQODmeq4r1ek9pbRCJOGwtpVsQUsWwIlt5zrEqxXDjTGpIAFoCumN9
 a4GzrKzl+/dM9J01OhfdXSrQ3D8H1i4jP7kNCYvPy59NbcoPcWLQ3PR4TYnvL/l3CsVjhQb3Q4b
 SRQn8sc7lgyAHzYRmXD0s3bKW/Ek5irNdBCtSXKG8Rnnas6fEQjh/TD9j8MSkCM1u6kcxVJYqjj
 KILbYfSiILiZQjP1fFUNOxU1ZewRNgYhjS82uBbsTQY4Tlu6FcmlDN1oNTLKRgOBas6p0BClkvj
 MFdImojKyv50rq7qmWID6528EFsYFp6T0SJFfRPy7+NuR/exzYXCNalJFPbKzCBQOLvgC4FVikX
 LT3uLJxER2vbC1RbE0XMiXV5jDzGM1La9EsDWSKag39rcfz3BxIrq0MsholqZ+ZMi8ISJhvJf3g
 C/Du66BO+vb4fg+255hWJSo1ZqInpu+t31LjO93nnlZfmejQlY92X+k7v9Py41ePS9U2iIuLFhp
 LBo
X-Received: by 2002:a17:90b:3842:b0:358:f0d0:1a19 with SMTP id
 98e67ed59e1d1-35de686fca0mr17141992a91.12.1775591978810; 
 Tue, 07 Apr 2026 12:59:38 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 09/21] target/arm/tcg/op_helper.c: make compilation unit
 common
Date: Tue,  7 Apr 2026 12:59:10 -0700
Message-ID: <20260407195922.196410-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Remove unused header accel/tcg/cpu-ldst.h that has target specifics.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/op_helper.c | 1 -
 target/arm/tcg/meson.build | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index aa14f15eb62..75ad53ec6c6 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -23,7 +23,6 @@
 #include "helper.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/probe.h"
 #include "cpregs.h"
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 70beec7a6c9..1fa26670587 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -37,7 +37,6 @@ arm_ss.add(files(
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
-  'op_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -74,6 +73,7 @@ arm_common_system_ss.add(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
@@ -93,6 +93,7 @@ arm_user_ss.add(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'tlb_helper.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-- 
2.47.3


