Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CB1C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:11:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEzl-0001dV-BV; Wed, 30 Jul 2025 18:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwe-0001in-6K
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:44 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwY-0002ea-Q4
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:43 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2403ca0313aso3078845ad.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913197; x=1754517997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9Jt2nnjSdWUZl5mAbqo93xKPN/u158eZmI9MYg927A=;
 b=E8+AxWweCIMYOIuLSNdp4xT8Z6ka2mJ7ASyx+jZOpWAez2YUzeIznoJHUg7tw5QiSI
 PJgZ1GC8LOAW3Tnc70vVZ6Y2UXePPfNzjR8aneiUjw1S5+ZgzZpAEW3QeFEKbXkv4Hj1
 Gs1/X0izx0iMwkLasw7JLb4lY5mTp3pi2yY89O0VbgCkz794PEhWdK4zsJPyAKRTNJoV
 LswHkKeEhXujs1hOIYe585e+b/MrGfZuVZjJ6eWIXRbs10Sra8gjCFTWVLRIYZZp4RSI
 tPPb1+t4G96SiJ1Oz9i6qZAIIz+rwm+1WcQvhroQm3w4VUqIu1EJCPyXxa0+5uBu0zvt
 eGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913197; x=1754517997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9Jt2nnjSdWUZl5mAbqo93xKPN/u158eZmI9MYg927A=;
 b=lsyri9OYzwJIZrN0i3+1ilRNToRwreqV7YLl7ACoKaDAEmtgqLFm2FAHOA5FpEpkyt
 BpviiQVi1kFrZQuA0zR3jrkLzGcMf82auTHd2UVGzgGwLaWL4esaIsL02J8Sae4Y6SQM
 HfORMqYkyZ57hsKJYem0VwUYMgomthAUh8mZ8alpqzicuLRPOx9gQJLiUNtK7nDq9ljd
 2h68g1GOI1SmazInrTNfQYWkcoUcuKLrzCVEzyxTJzsbgvwGU0n8TPwRYgeF72BA70li
 lLB4wW7SlThlMyb3d6MUrDi1zMhiRdPla5z8w8kYlmOcP2pDvjuFkeOe+dcIGfv6qRLx
 0vyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkp2brmfFIOKXSzcLAjHXziw0u5rMMkkdrzJax19KdG5SqzREemEMs8b3Dq89WQSzzja2c8mKFSA==@nongnu.org
X-Gm-Message-State: AOJu0YzzMCiatdWma8xlwDf0veLGghz/JffFnYD+Mbv+2Hi4Lk++CNOB
 G7nA+aA5Ea5b43+FyKgg+/QUTMuBEevsrShKmeJ4mqNMD0eD7KX9qH7+IDo1he4jKBw=
X-Gm-Gg: ASbGnctX3qj8Pq7cEYJl6gLD2qQVv4iKBrnmI1wfYV5hw8Rv5UExZKbad6iKarV8ebz
 QWvmoiVLuapWuCqbNOpee1g2fSomO0YwD2oHV2BqkoUDcB+Ivcea/tMBKxQCxM55HcPHjIarHL7
 XZqW5nIZs6JFcGlN1NseGfhnC4FhAyM7w4ODYUNOqbXQNrSpBK2h8NcusCGan4bTwSN67yoC+Om
 cFDndYiIQDfAZ8sGGtSe0E9gUiRoFI6pID0C7ADZfVYvXhWMSH5azCTRon4TQgn8k7XpADK+a7f
 68iy2JW0iykdiN+Zh0xKv66bi+3vwpsMQAL3z2ts7G22T8nf41/f/6fSthkYKilxXIEf/WfCf3M
 ZPBsfohSuAnJafEYOAzZFBxzYP8NQXkvA
X-Google-Smtp-Source: AGHT+IGDX57VB0I9QpChqVGeyhjh+hRxgaejT8za47l/v+1e6x5YM+ZvCahPZ3jmijncowPJN4d5SQ==
X-Received: by 2002:a17:902:ea10:b0:234:d778:13fa with SMTP id
 d9443c01a7336-24096b2364dmr64741585ad.26.1753913197120; 
 Wed, 30 Jul 2025 15:06:37 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:36 -0700 (PDT)
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
Subject: [PATCH 10/10] semihosting/arm-compat-semi: compile once in system and
 per target for user mode
Date: Wed, 30 Jul 2025 15:06:21 -0700
Message-ID: <20250730220621.1142496-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

We don't have any target dependency left in system mode, so we can
compile once.

User mode depends on qemu.h, which is duplicated between linux and bsd,
so we can't easily compile it once.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index bb0db323937..99f10e2e2bb 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -12,9 +12,10 @@ system_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'stubs-system.c',
 ))
 system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+  if_true: files('arm-compat-semi.c'),
   if_false: files('arm-compat-semi-stub.c'))
 
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_USER_ONLY'],
                 if_true: files('syscalls.c'))
-specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
+specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING', 'CONFIG_USER_ONLY'],
 		if_true: files('arm-compat-semi.c'))
-- 
2.47.2


