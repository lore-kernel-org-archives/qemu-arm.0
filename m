Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F6CAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:25:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWbw-0007Gk-1w; Tue, 16 Sep 2025 10:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWab-0005yD-3I
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:25 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaT-0008JH-St
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:24 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-267fac63459so131505ad.1
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032567; x=1758637367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZH0mjB8So3ur3KXNJMzLcfZFHoI3w+OVbUHK09CkjfQ=;
 b=ri8/oyhVzcYjI6fJtE1HND5l+cMhBbLAJ2SwUZFP2rPA/Juia/8zVIgmxlWd1y03dJ
 cDB64/JoJa2pkpOgki1BTEWaj6DI0xYYq2lWDrlRUYzSfA88MJfiRZ+RItj6ttiAY4Ir
 H1TnT9Z9m0xNS36I8AHeYxD+5GaxGAmaUUH1utXH8trdYzDO9214rXhaAvQPvDcHCE4+
 v1kF5iB2Nc/5UyOmKS06VvRtFcd7qmCAlRjoI3e83s07KmmKBKLl2z7Zyv8WxiDu08HG
 AuRpNfbGb4axRq2vW0J7GK+v92vOw13w3onDAloMMHz0pd3bLmrBiqbiEXTEoqisIJfA
 L5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032567; x=1758637367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZH0mjB8So3ur3KXNJMzLcfZFHoI3w+OVbUHK09CkjfQ=;
 b=Rt5J97IURZxoDhIekOxw0pma7c4OpDYgft7s3XlJ1JhJ5KFf8YKv7zpdxnOhq7zB7D
 IpsRl0+AVrY0Njp2pu7dPxV/C2m72mMI9OSBaP9z2LR6OIV4ZsnzQFIZpa5pCUWHRu/Z
 /cC0D0W+lbJV/0KdzCr4F7LnHer2XAvX8f+RFKFnqWfoT/COpGbgq4FCAm1k/AUzZzyC
 tBStJoBmtzoxQB1NIT5FkHmy982nKfvCjdZKCUoRbIWWziO6A1VuZj0xgH3m7ak3RAsL
 8J+e+4YCL4o6qi5009o128zbQJ/S46xH6erbuxhayIPgtnfhtkK2P1KntvPNvN/HG91i
 I82w==
X-Gm-Message-State: AOJu0YzNh0KxPNHlwiW/0Kw3M4vWVg1OSQwi59kRtas2JZhWmvnAiLYh
 0slOitw6g6qBO7CHPxBfIdE9vtMhrlajpa/ejhlcteTwRRVEh6dTK20M5wkZQTmLEXY=
X-Gm-Gg: ASbGncsoQAXgWOhbCzK2etxSQ/5PNKn52i2nW9hgx8w/rnaxynvsO4AI/+Q3CRPw1qT
 z7as7XvAzgJooGzsSrGgpYZnvvure1QhEcHaX8lpX5VFftYh3Vr5DhB8h/18tRbl5YknxQFADDg
 fcpjQQ34P/eDQuzgbw42UOjSyHku1LEljX1OTjng23ZIJkbw+bMr3JNCxM9QWW3czLL0vjmYBGd
 i7AsIQ8Q25DHvttarZWsXmUka7QnXELPHv96Kev3DHIoK2jQt5hPlWLdpsvNC239TkoD8tsnE7N
 C/q0fefbW87pdm1MdnCgReHBOFiWogsgG4oev132FiNOMpTXsX5OX42gFKuWMcyvOkR8Pkg+2T2
 1jd06FfrqobyRa/Znd3zCt4bZb/qfRBoSqpWRvew=
X-Google-Smtp-Source: AGHT+IG+v3H3/O7Wr4EKQVM8edjAxAdCdo/aABxMlATr82uHWyL3hoOKbDN+lOcn/r4nSc30WgXFuQ==
X-Received: by 2002:a17:903:478d:b0:264:8a8d:92dd with SMTP id
 d9443c01a7336-2648a8da428mr133255525ad.20.1758032567416; 
 Tue, 16 Sep 2025 07:22:47 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 09/36] target/arm/hvf: Use raw_read, raw_write to access
Date: Tue, 16 Sep 2025 07:22:10 -0700
Message-ID: <20250916142238.664316-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Reduce the places that know about field types by 2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 99d8672b9b..694584cc13 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1153,7 +1153,7 @@ static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
         } else if (ri->readfn) {
             *val = ri->readfn(env, ri);
         } else {
-            *val = CPREG_FIELD64(env, ri);
+            *val = raw_read(env, ri);
         }
         trace_hvf_vgic_read(ri->name, *val);
         return true;
@@ -1435,7 +1435,7 @@ static bool hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
         if (ri->writefn) {
             ri->writefn(env, ri, val);
         } else {
-            CPREG_FIELD64(env, ri) = val;
+            raw_write(env, ri, val);
         }
 
         trace_hvf_vgic_write(ri->name, val);
-- 
2.43.0


