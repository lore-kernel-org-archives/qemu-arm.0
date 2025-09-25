Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C8BCAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 02:57:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1c9I-000207-HX; Wed, 24 Sep 2025 22:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1c9B-0001z9-Vd
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 22:55:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1c96-0002Z0-5w
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 22:55:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso376770f8f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758768946; x=1759373746; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/w1oo89YkX4j56P5P1/JI5beHjfC7oSHrKTDCe6IzA=;
 b=qyu16QSsr6nWsVpF8lLOfRkQcDCotD0D1gaX2UBqWas36GL02cJEWMWFdGFEhQXhK5
 k0qPB+BTDRqsB6wgVA5OxChPs78Iinyg+N3I2UXEO3J05ShhdDJjF/Zn+uLhDybF0jH9
 xG0LNRuh1gMnb/VvunI0tTmeaCBdAWJV7QsgIbmF9B4K4ArVsoZKJTjed0Fi1Ykh6CP2
 ZwNFzqz0wsMLqQ6p/r/yfjeSkk0WmmMm87atcFGHUn27iUc4WMPt7J8fvGnQyPSJk2eB
 bQlBm+SEOMXLM1d9/BhZ45Gvj5oGs/oqXIjHQjxYXObVsIaWXyprWjJeMZ6BRe9/QvEt
 29kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758768946; x=1759373746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/w1oo89YkX4j56P5P1/JI5beHjfC7oSHrKTDCe6IzA=;
 b=woWhn8if6mOmCmiVbc73aHQpVKT6LNFV7VWkqD3Qe2FTIk2AwccgkouVN0YthHvL1a
 j1ZHnMCfT8U7YQXDTKnR8c20nIPdREj1fjv38uNr96U6mbuDtwM1ZbZEKXy8Ij4qH3x1
 6icBIjgNfxGlXGd8DafrPaLwriNcDG9FvipIaaaRU0e/cqlKsC+oQeY1ngrfCwiD3JZK
 eNVXGxHDoiYt7I6VPVKHQUCWhsna17pVMB4b6l5SBSGpvZErYx1Q4iBLTdjtbrs7nfYp
 tE6Dtg3vmtFYnXF8YjUWpNUcmecDPVXRg9uy7bB84LTKsth7uSQnnqSUj3AT0XO/3R7J
 GUog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJDIselhRfoP57GK5w5B1Nlrf1CiHExnD3UZpRIrXJ/28olUWx/e5d96lUI2YJ2NeKSi7d4Um6EQ==@nongnu.org
X-Gm-Message-State: AOJu0YzN+/EjF/MT6gpo/QxTS9a7uONnCvb112aa1ua/efo1Jc7Tyax+
 y2wB0YUAtV0nD2tr6DUMqSdJwLHYiIpNO4TvbohhcAp5TbBUnEDZvw4rr50Zj1gAKuU=
X-Gm-Gg: ASbGncv10x/EJBMG9rnXJbRagdMk15bAafWgdlYPnIwIf7D1W6Pi7zaX61QBKQLMAf3
 MzGenVnyrsPIBMc+m0+/bBrH0xdDMo4+UU68if5dCcRWUx6Ohvdt/0W4YCt68XvGSubSUnBm86I
 SjuEKV15G7+UJp8mCcLgV4pTl556QPp0tkwgaFuRBU51dDfPknguRMV6OvK2z+ugvSXGX9Z20Nv
 Ue8x0HS8D1CDtzrtvy+g6QMZabbJqfqbBXir3Hu+fN690Xtq09uCNemyOX0kDrlMcLbctVF/hHo
 oFn2XL/6yfTM4428q0s7Z3HUnNDemvgS0UdKdtEJLA6imc79DzsNXCRT2GqSPCndYAwKPZsRt+c
 AH67n/B1MCctx/6XtOqr3xfnGMFghYCO/wtFBjxtblmaJX7jW/rSuRQKW49tgc7DvwWI1dwXX23
 46dspjLY0=
X-Google-Smtp-Source: AGHT+IFsxdr+JXwJOUOGoHMw5I7UtgpECL0VwfTynMbpxTSApMyG+EeEUGFd6VlFOMXeXu/NxlYvXg==
X-Received: by 2002:a05:6000:430e:b0:400:818:bae9 with SMTP id
 ffacd0b85a97d-40e4b85103emr1755260f8f.32.1758768945684; 
 Wed, 24 Sep 2025 19:55:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fbb27sm924338f8f.4.2025.09.24.19.55.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 19:55:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 4/4] accel/tcg: Use cpu_is_stopped() helper to access
 CPUState::stopped
Date: Thu, 25 Sep 2025 04:55:19 +0200
Message-ID: <20250925025520.71805-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925025520.71805-1-philmd@linaro.org>
References: <20250925025520.71805-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops-rr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 2fb46439971..f84342e0449 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -197,7 +197,7 @@ static void *rr_cpu_thread_fn(void *arg)
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
     /* wait for initial kick-off after machine start */
-    while (first_cpu->stopped) {
+    while (cpu_is_stopped(first_cpu)) {
         qemu_cond_wait_bql(first_cpu->halt_cond);
 
         /* process any pending work */
-- 
2.51.0


