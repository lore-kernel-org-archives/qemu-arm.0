Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AFA10F996A
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:30:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXes-00059n-Mp; Wed, 08 Apr 2026 14:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAXer-00057r-0P
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:29:45 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoT-0000oP-UX
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b25cf1b5f0so36709655ad.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600544; x=1776205344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=M2MSunQvcXgNjwTsdXQ+5dh8SHre+uV+QOmaibdnTZATGmKIJvepUyKrRbmbklyQTI
 JtjWDFsP9AuZlblTH4Saz0nCvxicGCLjQ8OWMaKm2jMFPho+3Tn+libxMsxKuYeNiWJn
 t6vnR3UWIuBpWNFoUe8R/m55P8VX5Yvu0vKIJgAKgFcn6Gr+X81ohM5qMPYB/mvD031Z
 a+/ut2qiUCIvTpz5PQVwY9iQPCp8qMawaIfcQxnk7AQbHuMk4dJmMU8C1sC4XIm7vNRQ
 UMIa+RAASJHWPE4XO0o+mXAOGC/YfmSh6vO2Bpm9dAPHquGT6sdMP+8PMcXmpGkxm6IA
 NbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600544; x=1776205344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=qve2eHeHUbaIe2jb1So5h4czv2wf/4GHSdRLxdleiKYaf3P/XScj57cNIPlX3bkphw
 BTnP+iu17dFvwzBJw9vBTs5vom1/0fyDWxljtbC5/6rP8Ss6JePCyefPLbDBMfDbAa5h
 uLmJTcICGjVkz4zp72ghxZk2sLXz/Lk2Qosts6QMqjab6qme3xdjbIAInQrpiQ/difzg
 4hjrtM7VZxiwqEwWg+XdgNiaYrARsKKWDWrrZs8PDG9CibvQqIOrPG+LyOmGWNdyia/A
 HZaMzBX8O6S7zp4jWssvLrkr/TN4kUg9rBY9/8yLVb/0PflQ+CA5PL0ifRQEo09XtaEE
 MObw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTVQ91CnqlyEnekJZYzaaSFplUuzDCP3rBllLrv9H68UEx9l6Iplf7K9kFW5n++OJXpZRZG4XWMA==@nongnu.org
X-Gm-Message-State: AOJu0YzEb2pcajoCClQ8bU9ATzWA1Q+n4tjEc33tidUAklTbBn1ZkWAs
 C8ui4pCPIOMJKVJvyB/RJUCu6XFgc2v6tulOzxB8orxlQpdoaeXTEpmrlhJPE7s3jDs=
X-Gm-Gg: AeBDietbZHAnMPr2myYf6ARR8VUx69ok6iF8KlpMt/b+HiIoBGqRTIs45d3zu8D8+YS
 Iqj11hQx3nZr/cFVl1NeRr978vU2mjvn1uUJwINNY64C0WPSsqBnsLc7cuwUpZFDzAuCDBfQJag
 IfpqF4kE1y3WsKhWaBrhZwy4O/6pbfGSioo91EIUVfl/8Qtvphl2wEmDwa8r1xH9z3i4vGNWb/y
 hkpk4drNpjlHMQRqjnaExpDekbUeRUlykAGzmM8OGt6FQuJImue3tIz7aCOGpWJqcqCOjOnfTI2
 pkqySDYnWOUWXNhTOXkp1gj7JDOZGSAsKVc4DhgHTLSG/zUX90vnwlI9CdLPgXBvo/vpamvEhgw
 KWxIkFii4A4559SWQ2/DEExFrneafCHYykmEVc1uJKwv8SS/vdxfmrC/ZDSWDQuAs/tjfTZ6TSf
 SVCXNgUbkzpF4higSsbwIgxM6GA6YUN59CkmcLI4OjZCPp/VSTHA/63KoU4+NF1OL9EYsezyHmg
 y33
X-Received: by 2002:a17:903:40cc:b0:2b2:9f9f:fe6b with SMTP id
 d9443c01a7336-2b29f9fff92mr117408235ad.40.1775600544497; 
 Tue, 07 Apr 2026 15:22:24 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 09/21] target/arm/tcg/op_helper.c: make compilation unit
 common
Date: Tue,  7 Apr 2026 15:21:56 -0700
Message-ID: <20260407222208.271838-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x635.google.com
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


