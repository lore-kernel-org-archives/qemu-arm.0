Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D15FB5181
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:29:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wBB-0007nB-Dk; Mon, 06 Apr 2026 22:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAn-0007aF-Ix
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:13 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAh-0006z5-GD
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so3875024a91.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528885; x=1776133685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVeSwZbNgMxucNnmt+bVJO+rTB1zblJZsZHbFuDjPLk=;
 b=KD/b3fGFbRHi6miqhsy0emqucxGxRPbt2gf2M0ClVPTGXVdxIpihPVUC12C6BIDuXi
 FnTv41IeK92hQxJfgMdYR6N0ASfogZT34U2iiUGV5PoPnJn4iCKFRqfo5NPT+tDnCWh0
 8tPf1tZoQF/HrgYfuSnK9BEV8cmjiV1tiQCUFA6OTYX3jNbfX4b0f2qHJxgtQtVFb7dr
 VLJuwGbXo/FafrkoSV4kbzde7W+3nI+JrH7cnYkHgR50ozlB4NQo9kC7x8VvIHSjeW+5
 FzltT88f6KADA74wGL9YJvXByJrNb+2mniR/a2FsOblX6jJbO4MlFEIN/20yDMuJZga7
 vgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528885; x=1776133685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rVeSwZbNgMxucNnmt+bVJO+rTB1zblJZsZHbFuDjPLk=;
 b=FGYxckfQCSn1Ju8AomvpdO8l9aI0tPDdXzUQSbOC1H1t2SKRYFZCAmlfDnxF5MPj/i
 SEmbVksoget0YdWVt9hdrziWCaS8i1d3woRSZlXkDCWn2+4uk48oBjGY/TP2GGxHa8KN
 fXHsn35TePAiHF8npRlMYLPHMixgxhx7IKxVzLASNpulSSI8HW8uRhVr69B8veYNHFeO
 qJT8n/cxrnTWrmEv96SOFo/72jcHZwJNYRXRlLVTVxx54mq+mZGPiep3JOnpVJhRnb4q
 1e8bq2stSf5UKqSqcigdAMH8FB5IBgNXTAilTC7ZE3HaMr01jJPhXHeSZmkEyvguOZCs
 SHYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhVKBfrcD7tYDYHBK/1aZoRe5cJ/yipM+5x8dP4569m8X7epIqu9exWTY96IdhNP1g/gyJ5khs3g==@nongnu.org
X-Gm-Message-State: AOJu0Yzx15KMVKsz4lghrXM9+Veyrp4TmVcF3Ov27MMKntnoEYv5XmmB
 lRiSAa8D912VYmCKiTeKefSH99yManKusm2TjpIYQJ7oD28ujZYRfag97K6xZ3QZpas=
X-Gm-Gg: AeBDieuDH/eYZBG4XT+paow80HHjynAUArfGX9jRfbR+sxG8Eo5HLdAEcD2zqg50Pic
 jl3Z77KqVJxziwzm2QD+tLRbAAuszmAZ/eQn0R1UuJ9Dn8bzNtdvf+C1B9Fv5xcRdg9s0XdMTih
 W585mjPEDkDKRYQ43DG/whXaWWPy0+4vzvJRdYkLJcWZdNNCtHsv/X/lAqsKKvKq6DALH5gSfa8
 ebI5lC4kMDi5IGW1jsYwNASXLu63cAQ/hYhhigvcx9yHvET0ZD+nfZT3NnLfyFOcIH8J2/4/coW
 4Cu2IFuLvg7kuXc0JSnz309UOjsiN56fFLXPr4z4S5SklyTk2rxmEzRgUS1w2A9Rck07wU/fDC4
 bTM+CLI22xQ7jI258yltoTFqoNXUuRWD+HFAOzPOtCvnN1RgXADB9BQOG4+tpfo8bxZNlk2p+4c
 iH6+GPa41zMB8HBCdSTILbPcMK+kJ3q8HoJYnAT4rnaek/NnCHvCEQlR2q/uutKils5SMAjFWrS
 BQ4
X-Received: by 2002:a17:903:3205:b0:2b2:4eec:9806 with SMTP id
 d9443c01a7336-2b28182ca4cmr178832165ad.8.1775528885183; 
 Mon, 06 Apr 2026 19:28:05 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 10/20] target/arm/tcg/gengvec.c: make compilation unit
 common
Date: Mon,  6 Apr 2026 19:27:38 -0700
Message-ID: <20260407022748.57629-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1031.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1fa26670587..0740de92c1a 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'gengvec.c',
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
@@ -72,6 +71,7 @@ arm_common_system_ss.add(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
+  'gengvec.c',
   'neon_helper.c',
   'op_helper.c',
   'psci.c',
@@ -91,6 +91,7 @@ arm_user_ss.add(
   vfp_d,
   files(
   'debug.c',
+  'gengvec.c',
   'hflags.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.47.3


