Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93DFFF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:03:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaR-00048q-MO; Tue, 07 Apr 2026 15:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaM-00043I-MR
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaJ-0007Ky-AN
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:42 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-35c1d101355so2184137a91.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591977; x=1776196777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EDjkncN0A5+3a5tlX7QauSsXmI5/2falsiVKhMVXUw=;
 b=ZkF7PQKIV4dS9B/VcuLN6x70cRwncVD7Q6gmRlt4oaARVgbWJA6qg5hPQT+m0bTQtY
 3BKlDlylisUUPOfAsT8bVyho9CvAvZi0KJbB3saW6VYmZV4pUrdYSdntKvepfla5F2ZN
 KWfiCGeBN6Zb2x8oSgR/g4PJyqu/UFmxpmgY65/LrQtD8MnIhsLlMZ5BYOO+f1YZRNDi
 MnGjEja+xELiD4KV2uXTpLZXD6vfphpZmPos0LzCWlpxuyBOeX3XuZZgsGzWPwqQkGJl
 q31Zk35zNcH2jmxk9djP/7qBLOGhwKr3hE0p+NEduS+uRNzZHagCs/2YqHRXTxo7a+SB
 z3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591977; x=1776196777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2EDjkncN0A5+3a5tlX7QauSsXmI5/2falsiVKhMVXUw=;
 b=YtWsjEzW3bn9Ik1WibgHxqs2rEpXcq/+UYhkLY4gHVlyELTX/tnCPzcVfYxXuMvQ8s
 rRQuUFetxK1l+aGD+O6IU24yCyEARRTmpSemNd8cFBfzHFID/j3RUVX6vGYWAR6Ka8di
 CUY5wPfjPtNUSZGWfCKqiaE62wcFtjMb0C9ZYeZePzl/PRe9j7rJby88gf3ITS/HMmF7
 nLmJawyQYgqp3yDnGHOGtKA75DGr/xrPp0LtwkGjzg0X2ZRc4aXF0Sr63MFuhUsHucUb
 HrRGdkg020O8ZYiyd0+B4AxkW6PiddkqYT3t1IrH7QAMRlGZy9c6zPdwclsmUIC+Y4lI
 RSnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTagnnKDvnvxk+pmbGY+aGq3PAh1jiu6ObywHNsVo5mMK86712pqsaOPdlndSLXV24Q1qgwXc87A==@nongnu.org
X-Gm-Message-State: AOJu0Yz+2vpyJXoqtDMYQTvMEWwYNsh7OATLJhP9xrD3ysxM6uLDiEQh
 FaAKY9xt1YFojwPltK+/bliDlN3pjGwxMnrpEvzB6vrF3GjQErfnsYBPxZ3FZNMuJcM=
X-Gm-Gg: AeBDievI2J985Qw5+DdKJXJAuBsPi4oz+bYwj06F9upykWWepc17NH9DPw/US328p6g
 Ipj4KgjdzcTm7gU4I5QrIB9gmW2uXoQ9TN9N5sflKMICO8MobYEi+G3zSEykXKKLaYvZrQXTA2x
 4up2y8tRwxo4u7pIzWbcju2QnAMF91enkz7bBliywJtmOAT+IEN6rPwNTq2/HTf/fduXWfyQICx
 Wdi6BZ95JOksRgrWwXzaTlms0Nh7VZqPWK8kBJI+juYrwpNDqCL0upXGGGrP26kSbGNzYUgQ9wg
 GfAns+rzerU3PSzWDHP2c9mUTeakv7Q6uVZW2SUh4WZ93qWKT//NBp4/XM1TVnsxtmlIsLhBtU/
 uaefwiMrgPPkDce9eS148jG/J1co6FwD4IfuYbKRa2N3NQmRgq2rUlCVu1L53buxMJECtLtGxlr
 ZMaLHYrSmisdav+nKDoR/WZRtCDqSHkAZo34vaHeVOFmIXezY0wD1vX9oKRhiTOTErqJF2CWF6g
 ajO
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id
 98e67ed59e1d1-35de69aec1bmr18239240a91.28.1775591977121; 
 Tue, 07 Apr 2026 12:59:37 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 07/21] target/arm/tcg/translate-mve.c: make compilation
 unit common
Date: Tue,  7 Apr 2026 12:59:08 -0700
Message-ID: <20260407195922.196410-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1029.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 8d9112f6da2..89c3b476822 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -16,9 +16,10 @@ neon_d = [
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
 ]
 
+mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
+
 gen_a32 = [
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
-  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -34,7 +35,6 @@ arm_ss.add(files(
   'gengvec.c',
   'translate.c',
   'translate-m-nocp.c',
-  'translate-mve.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -65,6 +65,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  mve_d,
   neon_d,
   vfp_d,
   files(
@@ -75,12 +76,14 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
 arm_user_ss.add(
+  mve_d,
   neon_d,
   vfp_d,
   files(
@@ -88,6 +91,7 @@ arm_user_ss.add(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
-- 
2.47.3


