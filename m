Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BE910F284F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:51:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AOp-0006Gl-Hg; Fri, 27 Mar 2026 12:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOk-0006Bj-QQ
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:51:03 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOg-0005HP-2Y
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:59 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c06cb8004e8so971548a12.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630256; x=1775235056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXy9rBoaCMMTOp0VTinfarPcqqyC5TJjKb/l+a6N0ps=;
 b=NXeF+ks4DGhXqCyr8VEh7BQFID6rFr9pq2OYmzCXDDXD0YcYJhhoQyXy+v/yMoEvEz
 01qUwFZ5XcyUwp8Qy7O+S7+v05fwYAABo+YzsRmFczQvdyj2KDH616B/akV2VkxmloIF
 8PrS/XBWw0kTQAwfxYGBkhdrRdZ059OvmnAzUYKQzOJwCEbdr9Zjf0GXTlbGU5Ttfgog
 WIyYyBumDdHtzv5ueKgytnMTcVyjlm1diA8XBuYB9p7c5+MOcLUaJeMEz591A/tzcCz/
 4zqgxuYIty/2pPbvJ0XH0xlEwoeEZfrZ81HHZ/JIVR8nUsHXHqc2ONdZ3CnCZ0fJQC63
 ZKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630256; x=1775235056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zXy9rBoaCMMTOp0VTinfarPcqqyC5TJjKb/l+a6N0ps=;
 b=kd9HnnhJWFFVzWEscX51y+wAwjAFw9ezddSzb6m8DKZTcjfFHzGg6lkyiTR7Yf9aFQ
 nJn1HMb3N1svJsZ+j/rqsGMz7wJzFLh5TeVe8oeEOL3IfPV4tlOF+aSlyxuo41mnmtdl
 4K/Cs4g94cEmm+ozioTAHi1inY21p318xCjZyYzVGQDtgBQhaMr0bvOAwbK/Sa+3EE79
 ZGiPVW7dHNnPjmpNixgJGJgF4qg8IMzY2OLxl3zea7C+hvMdA2ufJZ0wFNeSjQzRueUT
 ntPLGaoISkL36RnnYBgui7JbXzF+8X+vYBtQAUD9QLY0IiGJQMIOhqBWN8skJxX8MhRO
 k7hg==
X-Gm-Message-State: AOJu0YzUP2SeiaJ2JEKoMgSqvYta9H5nEqBXHZknDUb/tlLA840XD2p9
 zJnxWZ4/+poWnuADBmlfaqd5Y3pPIkeCEl0YpMPfPb8g3pCNfWkTdmBhzJ/+5mqMyoyJlSc94Hs
 8Bu8cLBs=
X-Gm-Gg: ATEYQzwEGP0+xt4RIG6zLBpS6bjQ+rBBG3Cw5IxjDltBBU1nGK5jp32GCjjVCxweevS
 Z+ZiPz3IlmYSl7IRVxx7l6wpRKrqNdt6uFYgczpdYLBhy8xmfo5DMkQWMEL5wmsk5H4EN4IiGth
 16puiCCdJFg7sL0+Oc4tSPC8+NO0RCXfSM5uc9W8k3/3qY59xZ1y5DwiX13a/jc8YbRQV8jgbo+
 PNRj+Ueana41lEh91rEDGCHSofZoB96kI8/Vw+fCmOWf7YwFyDf6HGIqlDj3TGMlEAi+NWkc7Zv
 tYArW7L3zN4SMQ6W7hHxX6TamrpDx6Yah6hfPYsB9DDHXbP6YdP6zr1U/u597qi9SBtSiaMskva
 /tv616W2pbdYtCWMfcQ/LHlgBjlKN28VP+PMiG7jSfRl06yYziknWkautzZHo9F9nkY/3KemwsF
 kyYDUhQ+kuJehrjnwESMztdsENijoogdn4FBklFM+/676/l9JuUHok2CVAJgfpUO9cFUrzdzwMf
 7k7
X-Received: by 2002:a05:6a20:2590:b0:398:aaac:a079 with SMTP id
 adf61e73a8af0-39c87ab4125mr3880991637.45.1774630256486; 
 Fri, 27 Mar 2026 09:50:56 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 09/12] target/arm/tcg/op_helper.c: make compilation unit
 common
Date: Fri, 27 Mar 2026 09:50:39 -0700
Message-ID: <20260327165042.604105-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52b.google.com
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

Remove unused header accel/tcg/cpu-ldst.h that has target specifics.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index eb87eb63c1b..a2b944e81c4 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -29,7 +29,6 @@ arm_ss.add(files(
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
-  'op_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -69,6 +68,7 @@ arm_common_system_ss.add(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
@@ -83,6 +83,7 @@ arm_user_ss.add(files(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'tlb_helper.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-- 
2.47.3


