Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A00DC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:13:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwQI-0004oV-ID; Sun, 27 Jul 2025 04:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPQ-00020y-Nw
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:05 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPP-0004lQ-1W
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:04 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-234bfe37cccso28438225ad.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603622; x=1754208422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7c+QA7GWNE6I5/69pcOioZrB3w1TEGpVruYf14/lg8=;
 b=rpPY6Yo1ZwLqGGSu7uNiGnBvy0tswb3kHhGw9z6u5DqIDt2TSPNhPrCOgN4gMKtmc1
 cBxlO/foOqhyEwON0feOP79GUvuA9GMqn+auWx0voiCRXRUu/g+yjF8py6vm1xbL7CtD
 3CF8uaMX7bj/JicMNoggDAiOEhqImt06+Z8raePWOd69JM8LZYT2pe1QYjzxM/QbzdkK
 Oi6FCirJiaQzmZsVqrKEgEFIbC3FaCVEOCjkEdeeWjPyjMkR5IVGlF6lsn9wBzGGiz8A
 AlmWpKAedwGhv+c77i6aWhOKgM+A1VC8voVZAhh/KnXDVA2Mn92fz1+255/JPNotXwgI
 mHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603622; x=1754208422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7c+QA7GWNE6I5/69pcOioZrB3w1TEGpVruYf14/lg8=;
 b=Ut7hL8AgzE69LdZdDIl2p3LFM/7frTjBZx4gc1792nx0/e0d7z2v9kH65H/r5EgsHr
 5K7vtyU1XawZ4iat4pLUmM4JEgnpPJC9hDuT+p0xb+FY05OxH3aTPGDVOl/F8Bmm2DwI
 8JzISTc3vlhOsC6ofmTCVBMtr/3xgD/8Ho1uyZaHV6m5lD4xPNI0gvhlo+E95Qzk0Gcg
 MwuPAJnJkratpgJzXAOdtleeTtLLyoWpAIkCnvQZwgw3LsGGUr5pIHdCASquY4QSCpYl
 7dtINAhqOyarf3IqUcYuc2JeAAjf0cdyPuhxYTgcZpvfrZ+Gc7wfMS2IzH+JHWQNlUOs
 1nbg==
X-Gm-Message-State: AOJu0YxoW/hSs5beiso6FIr+IP5kHdNiHDVOi57UmBMRbr75gaQrGupj
 tQcp8bVRBl/pgSlc7q7Amqb+1gBHMjA1QHE+a1Gxdr8K62kRrVUcOQC7XAXCiDRxL/9+r+uuIkY
 SwgGZ
X-Gm-Gg: ASbGncsGOs3xNTindpi67pwfAF8A1GT/+0upEcd+2/jtj0MQR9bN1itycfoxsvRG+Nd
 oVrglVr0lr1QYCPbSvjVOSNj+npPNJSHPrlWPR7vXksx2lPJLvEM5jtqgFJghjU7zzlpRy6xnf1
 k7OCscmAXHfKHdR7JpuA6RO8ljQ6IRk/8MBxOqOH+RJxVXt9dMJd1/b1EdJjmdNbYHgb57YRpSP
 BJQODKu5qEPcFfdZ+aDpuDN2F2oKMlXh2UMnnet6EhIx1i+MOyrDDmIEg5X3M+EGzlJ9PjF9qjB
 Gy1HJRZHu7lGRTZg8QR4iUhAmCqtwbCsEcSApTt1z0e3fsjum5eyqBLS2BLKiqxGg8eGNEnDvBe
 JoZjdskVG5y5Pyc0SaFSmu/pt8zSaRKDaQaY13vMDv+v1BWQ+t/bCy+itEBSNfs43sEut0ZbOP9
 owQzH9U7Q+Fg==
X-Google-Smtp-Source: AGHT+IEwyg9SGUhFgm30Es4mhpzpXYNuR+cmqe81WbPYpzx6AKQ8J1wJRZTvJjqL5jgrBSb0J7ZlCw==
X-Received: by 2002:a17:902:ebcd:b0:240:1f25:d455 with SMTP id
 d9443c01a7336-2401f25d734mr1628395ad.50.1753603621694; 
 Sun, 27 Jul 2025 01:07:01 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 53/82] target/arm: Emit v7m LTPSIZE exception out of line
Date: Sat, 26 Jul 2025 22:02:25 -1000
Message-ID: <20250727080254.83840-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f6fdfaa551..e787acfc66 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6885,11 +6885,10 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
         /* Need to do a runtime check for LTPSIZE != 4 */
-        DisasLabel skipexc = gen_disas_label(s);
+        TCGLabel *fail = delay_exception(s, EXCP_INVSTATE, syn_uncategorized());
+
         tmp = load_cpu_field(v7m.ltpsize);
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc.label);
-        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
-        set_disas_label(s, skipexc);
+        tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 4, fail);
     }
 
     if (a->f) {
-- 
2.43.0


