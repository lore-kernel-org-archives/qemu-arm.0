Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA874C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEzu-0001q6-K0; Wed, 30 Jul 2025 18:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwc-0001dd-Ua
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:43 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwX-0002dA-2i
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-24014cd385bso4018655ad.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913195; x=1754517995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t5MOCh8vZ85TyUX2Kr+LHdMr3zhcFbFlGuu1sgPE5wg=;
 b=RG5emM8YEy7KmmVSCFPt8rxFJW7qiyoVZpmdWCp4Q9FJVEfD1ECJwOm/8En2zwqXv1
 iCfi+cMDWJghZXiqgSLIQZvYwApwFv+tYDICvr9uLhm4RLUqdiR/EgsJ272qMdJQk3Du
 464vJ6nEW/yW1+fe+rkdbRjPsaDRJnbTfmpGllf3tbiNHB7oV+Klpi9WHqh3ngPW6I3j
 NwjO1a8ijbE3dxKEdEAZR6eIwqK9YUqG2KLmVOdg/egiyTtLhLCUI+vaL/tAKTXdHRY7
 n4WZcKzTeluRHCMD0IE9QIrUMDDp8z+as5gcWba/cI32rHMnWsjOrkt6ZflDKwzwmEMp
 Xo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913195; x=1754517995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t5MOCh8vZ85TyUX2Kr+LHdMr3zhcFbFlGuu1sgPE5wg=;
 b=Hpo/f8D/fAIZ+6LraksFuJ9GNrdP3IH0pY+0VB1HMa0LmZ1VAKC65VrDu5UNidLEPy
 /aJt9REsfxDhIavBuk+oMbw+rDEUr2GIk424gp2pWoUq1Bx+v7i6npmUfOOmzx98lqNH
 vIgLvq+26wz2zl8qAgvs7J4iAWZR8vdAXzRxxyNHRBMPDR/Sc+36Ocbk/ONYekh4v+jE
 flBQGjrXWY6FujXvLWHZbGnkz2AH5gDLDFvQaBHchQM/Cmy/jilNOo3yxdLSwlUr13ok
 0xs5YCATYizVl1Y3NkxJKfxkRrDSoADbzc2HkYBdeCsKTvlnQTEURLQB/4Dp/MaCzovM
 Nm7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhxwwA/s69VDdY0F28Uk3y0bxyr0btXhsOWwhjiI1bRLBzPrOIbavWwqlinIShVpZcOSwFRpCQxQ==@nongnu.org
X-Gm-Message-State: AOJu0YwjSk4Dl/FSXJ90nA4MA0mgiVN2DQXEijptgAhyvQ0GPcnS0jRU
 ICe0YmWnFTmnYsz6PALT+k6SynGVGS0hv0SjUH6p2PGE3+05mqgUc17Mmj4IiVaPUbg=
X-Gm-Gg: ASbGncuYpaSKW/G2GEO1oDZqB55aq64cdo1rTgh1zGtBINkHq5E6PTJwC+dc4w3VmtF
 C3plqkpuF+1o+eWgb8u0LujlnW1Tcrk068/A2HJkvRcYF0fp4jru/Pd6uggxybZG+Q8OpIzlWIF
 MULBxd3t6/pHuaccmFabiUrHFnIS7eF1O44VN8Ia2WwzLH4AcRfxjHFmiTFxEHxjHCgBHgDCuln
 KGhPKLpZww6Fm7bjgRbARWMcQl+4cQSIB0GshqDwCmTA87ETFnvi/hbWWRwvVIMWB2EDESaAQU8
 AAVtCa6ZGECSXJ76ZDphxHQQQHkOTipKgXm+nc/nX7BqXKbiMMRMSr7tdm3LF9bVOR0gazeOzEj
 c5JpJsMrPbcKpJP0Mp7ENVA==
X-Google-Smtp-Source: AGHT+IF1HRNCCD7zRktuNXo7omeQUVfwXTQJyCef5uTGpBAFnihPPCxSFKsuYupnOc+fpQUlejtg0g==
X-Received: by 2002:a17:903:11d0:b0:240:2281:bd0e with SMTP id
 d9443c01a7336-24096a72dacmr70431405ad.2.1753913195279; 
 Wed, 30 Jul 2025 15:06:35 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/10] semihosting/arm-compat-semi: replace target_long with
 int64_t
Date: Wed, 30 Jul 2025 15:06:19 -0700
Message-ID: <20250730220621.1142496-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e3b520631b3..715a22528ab 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -502,7 +502,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ISERROR:
         GET_ARG(0);
-        common_semi_set_ret(cs, (target_long)arg0 < 0);
+        common_semi_set_ret(cs, (int64_t)arg0 < 0);
         break;
 
     case TARGET_SYS_ISTTY:
-- 
2.47.2


