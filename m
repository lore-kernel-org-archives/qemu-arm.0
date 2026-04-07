Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CDE10F995C
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXee-00053O-AZ; Wed, 08 Apr 2026 14:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAXeZ-00052Y-4w
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:29:28 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoT-0000oC-4n
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:26 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-35da9c0c007so5265591a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600544; x=1776205344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6du+WyZftkpSSaxLWG65RGyUVCyinpyoeqYIOhYC6lY=;
 b=WkB6ogUyxeg4MARzjN5m+3JNZJZrm/Wf7dfKQTrM3jRSapYUkN4x7sxBQmgA1EhDeW
 At1JRb2rp9K3XSCbOKPKfxceJ6qKGMONLqUMrBXpP22ljYnxh78PXnYaWi5sliHoi12p
 HG688ypxWnE2iEcPHpRk8Iy/0AZwycO8DOhccy4YYsr3dsfT00oXhV7mZRtXOzVGUzKz
 ZnRVukDJ6WwYWsgCy/VND5FxGXB/dG06Q3RaKG+yf5rgzz1d5uLR+RDWs2acqzgSQpUB
 WiPPzhWB20AutvacktBWIULAmwbZKYbVHq9LVAJe97wRejMTMzjr/sX/YxV+MpaCnT73
 26uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600544; x=1776205344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6du+WyZftkpSSaxLWG65RGyUVCyinpyoeqYIOhYC6lY=;
 b=U9ryhO1wb6s1zYgKJFBqTlEVeBiFdoCP/7m/Wk2M2rBAy7qyl378D8VT/ZLGv4h4Tg
 r/k69wc0jpT/qWKruroz65L6fpMh6IzEHPFZ9pL2q5/0QsR++MvEnmYilpdUmKqKqQXG
 Caw2e5l9SOX0WNISa3WyJA2WpegzzvCnciERRLszetYU6HISUZvx7MQR/laWNkV/QiVs
 QAqiy0Kxt/vecYTFzlOBHBmvVVqT0Vkyntq8L8VJfO7gF0cL1vfOHuJ11ocgz2FOxgdI
 mpAxPR0ul8hEtNhC9xZ6wwnxNCcI+GSx55/GNqKKlITFyHtyuauwvsdauG5ZfRrHJRrf
 w+Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa7RXTXmqvrTO9HkZghtcuu1z2P8ogeyLeqNBS2W22sEwCE3LojN0w5q1rL81TXsEPXW/OHA0RfQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywq6zX8PbA+GDAfk+JIij3SX98xKprWuxYOLbFvkMhy9dvo2P/P
 uW9MlxuSIHJcmFLj8zgA9YwlKR8DG74Y39boYiet2zh40GnHRTixdXzH9yNt4LIPdfU=
X-Gm-Gg: AeBDieulFD4zrN3ieu8QP9Lwi3tX+NYXOyfB9p/5s+F8V5nDZl6X68uLSbNnS+o1yUy
 IwiDQO3mYZjGc1Hdt8lQDTmi2537PqwQEYMTu2446Q6UyB2VBrcQkRMC7tut7W1NICF+WPfdWPT
 DZkZTBUaqkvn9UcB/aJBDK7eqnBH0mmeZPEl82+0UgI9ZmD02KtGOhi9sdqihhCty7aB0bpt46T
 ZEtrCgQYOACDTDZG9Fc+QXNRnoSNLBEoBiG3UQljdnN8FSGkk0+jJrUIUor5sy5P/TLoLsEk6zS
 6/90EHp/U4e3ARZOCn0/L/SF4ifnrmd29oheDz06xq7i1WNhXyk5DgDNLjJGnqDMoCTe6oqA7t2
 gb15q2KGgx3WRZVHveNudGu+WROga4bhc/frokkrQIq2Bcwc3iSz5Z6ZX4ZO7MpHieODqCmVgZX
 DjmGFCu/gUSfGgSe5fhjeFjm5gT5vlBCDL7jx1BDnUAqUt2vkpcwCm2eFP4M66hj5ocgOn1rUBW
 Mr2n4CIOYkjjWg=
X-Received: by 2002:a17:903:3205:b0:2b2:4eec:9806 with SMTP id
 d9443c01a7336-2b28182ca4cmr220394245ad.8.1775600543710; 
 Tue, 07 Apr 2026 15:22:23 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:23 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 08/21] target/arm/tcg/translate-m-nocp.c: make compilation
 unit common
Date: Tue,  7 Apr 2026 15:21:55 -0700
Message-ID: <20260407222208.271838-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102e.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 89c3b476822..70beec7a6c9 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -18,8 +18,9 @@ neon_d = [
 
 mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
 
+m_nocp_d = decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp')
+
 gen_a32 = [
-  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -34,7 +35,6 @@ arm_ss.add(files(
   'cpu32.c',
   'gengvec.c',
   'translate.c',
-  'translate-m-nocp.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -65,6 +65,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  m_nocp_d,
   mve_d,
   neon_d,
   vfp_d,
@@ -76,6 +77,7 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
@@ -83,6 +85,7 @@ arm_common_system_ss.add(
   'vfp_helper.c',
 ))
 arm_user_ss.add(
+  m_nocp_d,
   mve_d,
   neon_d,
   vfp_d,
@@ -91,6 +94,7 @@ arm_user_ss.add(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-- 
2.47.3


