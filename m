Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D712D10FCAC9
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:22:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8185-0006gP-Oo; Wed, 01 Apr 2026 15:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w8181-0006Zw-ET
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817y-00032M-7F
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-35d90833cacso32715a91.2
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071280; x=1775676080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=ECIbN4EE1Umam2UEw6Qmq84v8UUgMS1WrVEhVR6Hg9ArUGa/DO0X2gSMjD82IykefZ
 NZgFWJjtGrHzNYedQ9+T/nWqAglI7Mpdv0Zmj9cvwINrCCZuSpiCkJ0nNIR9hFHbzQsK
 rR2rAjkoH91ycjXmXvabSil9h/ksSGN5gGT9N/V5uWaX/oQwfIqdUcPFQFONIrJ5UOdZ
 85DSZ7Ui1l9e6IhtYbJki8SFS22dFeo+Mh7Tzsgqe1wgBAE73JiXoHmVaI8TyK4I6R1s
 qa0zDN8cpY4n1JTyuyNFUUn7m2GeSy7g4b6/74rI6fSFEHUgtbzvy2kUxZSZR5s6bhOs
 K+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071280; x=1775676080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=h6HIHwsO/h5O/DPtKZ/o4eULBwzOvNeqCHeQ9U2oFKjOVd6bsTSABKFzy2IarjWvze
 hKPU7/I6AjYWVycWVPozxKwg3gB05UWbt4/mJpnkNOf8QWnzm2/0Orh/aVy+znwCfrv+
 HJ3bOg6oK4vwPneg26O8PnPKKprFg1wNPhIOItWnCiuhQYPdKeCaxeLdYL/20ISNNgfm
 diuaA9ctB0Vhs/VpafXy2EmhRH6InPhu9MGe5VUGN/eN7IdG/DALQ2PUK5u0pm+prhSO
 5wBTORvCmHR/3VKJ/nqj7OnPPxdnuUHKH2GjvA9N8HWBZZkVZNGJ8Ur3EWDwLdYyospY
 7C0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEO6y7dOg+rtstef4eOXbrf8faDcXNpwz0w0HxcSC+SVXch6JfgqQUJWMztAy5OnCJDI48Q/eMOA==@nongnu.org
X-Gm-Message-State: AOJu0YyvT/fSRzyDQGBHrbyV3T/5j1evkLSgZ1G51c7xpk3TNWMq6g36
 07vBlNowNSnc37r7pw4rC2ZIHTocHiSHO1wKbmflopDePydJFORVKNA/Ce91wow4FOQ=
X-Gm-Gg: ATEYQzwNT/27Eho/N7qbG8s/f5WWuXx6QwquUSAJwF2rZB4fagRmO9D4iNE/MZTPnFM
 0LB2vNRV0rw+GgVkYkA6yNUb7w9ZCvCW6p/rK77BKd9vpLKAcVvhUh2+7AtRudgLxhJq6rwYhYt
 xFjmHlT/n+Ps26+RiA1Ux77Eb6fOrbO7FRMUuMtaudoalxuGZPc6/sEV1PtIJE1fKE8jWFajA7X
 7flOYICkL8dwDViIbFPIPt8+gxIN/jTieT4pYc0zJLLz2fmUm8JvupnSSbxhoW8uTA+h9tpRrMz
 P9LTTAEGuegBnZg0DVvRFaCADd7GepqWQ2iGeb9aVHcEmIiUDZKaWy50EP6mNpCt7wahXT2BAdq
 eWjF1Y5h5+cx5gYWB9/Dv3XGSAnox2TcHtkCHouDh7MhWGNf7U/wWLnkLUB6SYfvuGH3fatKx8U
 dAS2RDd6iieg52QqH8jTsIVkpxqNH9EImWpPaBZgdbrGlECZIF0o33hyLp2sakWIDVZ/hW4cPLH
 33x
X-Received: by 2002:a17:90b:1d0b:b0:359:87a8:e65c with SMTP id
 98e67ed59e1d1-35dc6f4a22amr4495196a91.17.1775071280291; 
 Wed, 01 Apr 2026 12:21:20 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 09/12] target/arm/tcg/op_helper.c: make compilation unit
 common
Date: Wed,  1 Apr 2026 12:20:54 -0700
Message-ID: <20260401192057.1182724-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102a.google.com
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


