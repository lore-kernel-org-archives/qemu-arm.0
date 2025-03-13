Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp758365njc;
        Thu, 13 Mar 2025 00:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW32dNzD2Pj/M1vAhjkmJyb5U9ncd/j6F1l4abG16lgGcS/sw9+RF76mmqejte31gJwlSm+DrF80fC0eg==@linaro.org
X-Google-Smtp-Source: AGHT+IHekiuK+7Ntx8W5suAd/7aDhH7oNitipR45jy9nGxTtV0EcCe/xcohefX9LNPZLR7wwIKvP
X-Received: by 2002:a05:620a:26a1:b0:7c5:658a:e580 with SMTP id af79cd13be357-7c5658ae997mr1364389185a.51.1741850205029;
        Thu, 13 Mar 2025 00:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741850205; cv=none;
        d=google.com; s=arc-20240605;
        b=FD1CUYt+WSu4aJqXfU+Mbes3d6SiifGaWvfW77shoVCkTklAUfVkNZ7eGYTlesLoP5
         V4mXe7e4tIzcvk1jp9ZsDmHuZX6GM4VjGrCPx6Bea9L3CQAQIqty7IiERT3IPB5RRRhQ
         I9isNNQD6XKRe1vgwXZx5AC6ljFKDzFTbyewnEqkWbzAtUSwZylG3yI8kHiheIDd8Gea
         FKiqdPDpLbuRxSp1MdGWcQwm4sMSwDJOTwm6GALgZTOqkxC7KSVoAFiWNtJGqaAmeZOq
         B/n4oiPfIjvcwmUed95Hx5W1VEJ8lLztQtGyz8mWgGjScOB8c/HZFYQ69F+gNrtAF/fe
         6arQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:message-id
         :content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=zjV1R+gX9epgHZnV7KEQ3WSuudTlpgPTKZv+aFGcet8=;
        fh=Y6491rFhbW+ThdGAYvBdUzBHN3wlmEpy4KQSmFkoKH8=;
        b=Zbt/5UUjagU4yg77n/PKOAcF2e1p60/eUIGKVemdcPRXmEiYPi8++QxdkKuQKGelcn
         Xfb56WlKx40stOGPiiU/79SC5pY51TKby30mURlKIOLkNzVfFCiHXmaubreN0ab3IxRR
         3k5lh2JcAw58P0sWR9/CcZlpxwWthTelC/0DYt0l9JsrMm3R7zi9VAQqcpI4FzZgWi5U
         BXxAWvUO+hH7w3VqVdXcdKWGDdQS5zPvAQfGs014UQv7KueWdRB7G9BYAwTZcwpYsxmN
         Y4LcEHqADIaev3ThJEJ1m8mlXmlctbYwtoZxt9w4kUTrHlO+ftqVnJvfKBOmK+z+VWB9
         l9DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=3YXSVvoD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d18c5bsi106610085a.537.2025.03.13.00.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 00:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=3YXSVvoD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tscny-0003qr-3K; Thu, 13 Mar 2025 03:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tscnp-0003oj-SO
 for qemu-devel@nongnu.org; Thu, 13 Mar 2025 03:16:25 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tscnn-0001J0-VX
 for qemu-devel@nongnu.org; Thu, 13 Mar 2025 03:16:25 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2240b4de12bso15039675ad.2
 for <qemu-devel@nongnu.org>; Thu, 13 Mar 2025 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741850182; x=1742454982;
 darn=nongnu.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zjV1R+gX9epgHZnV7KEQ3WSuudTlpgPTKZv+aFGcet8=;
 b=3YXSVvoD2DE7qafrs6P3QMUVeSknztw2PkWEW8h6fJKwq98BqBFPvGweOjHYIenYNX
 CuB+3nqfnM3laFxC/WpGSXF3k8WNu1zL9trqlvQKxnELTr0Q0ynNuMwRffxTOgaLBI9d
 YmgIyMerzChUiEiAoWA03cqW68krsoA1LLH4ZgZYuNeC6f9jexPghN8CPTaXXdrxUNn7
 jR/ysmF+XQimrEhvk+P/cLChmcjex4t9LPeW8lEbnyoY6qaL4bbQcsZtpwz9qu5f/vuN
 4lO6XZHmP4GSnCV+jAuZBYqjbwd/cgm3ZnMK/ZCXI9Chb+PCcJ0v0r0FbNHyJwRShxkw
 3hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741850182; x=1742454982;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zjV1R+gX9epgHZnV7KEQ3WSuudTlpgPTKZv+aFGcet8=;
 b=PdZya2RuPCdB+ptEa/ypONurQYY415HSxnekeiAzvokYbBHSi58odzRxtRzrwRi5wV
 WcnoSvqEpjLFwjYcXbz6xTp4vPIUJaTduT0GlzVo69sl88PekagcVzUIO+KbKN9ICORi
 hTWIpm3rra4ejmQz/M+FU0GvcynPf/efHxhX/79UJ9XIQ6B8pxOHv3dQcPyOmnSsXFYx
 ALXUP9m3WsIeVptKWKOlheVuzB9S+uS5vbUvvi5ft529uYiJamzwJoZSVLKyOSvYa7NJ
 2K/P5HcyGkcTameyNHNcZcNNL+8waiUlOtGGfcB3z75LadJJZdrfHurcs8zrDACDXBsr
 b5kQ==
X-Gm-Message-State: AOJu0YzKIF1HNMbGfZfMx3Sb2wdRG0OaC4bDCZQVSxsz163Uu41kyo/+
 38prYEhwcjwJb2vNFgws2iklhCzU/pNFtwogXK6f0xtf9vX/FZoz9fKNKVE+mMB7mDnKaM38VNJ
 RHpI=
X-Gm-Gg: ASbGnctL8JVaUcoJ7hXX53CbDlB+dzpil2wkwlZqNg6+0Vqk2/hBv4kDxGeVNVAY/kR
 NemLcbv2WsUYYwrFGKVphfCv/wx090/soLOlw8nCKgSDD6q5YIyv+UoJ3LLkw5ZTX8ZfgdO9KY1
 J+i9wu3ckNHHIuqcpeeqg2cax46gOIKPmr5S99GVf/PLmXnWWgGnkDPZzrhDyZk+f9VTsZBe0yX
 oXf8jg74qkda2g0lCxYGWap5liSAba1waN95rKsQ+PRuOiJgghv3yJPhkX3F0Us8veokl/++1Py
 THKVMiOUzXjiyC05geL+Jta5fhSLNJ3JrjmJOiD75gUMs4vA
X-Received: by 2002:a17:902:f686:b0:224:5a8:ba29 with SMTP id
 d9443c01a7336-22428ad1f1dmr373956525ad.43.1741850182277; 
 Thu, 13 Mar 2025 00:16:22 -0700 (PDT)
Received: from localhost ([157.82.205.237])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bd53aasm6743985ad.247.2025.03.13.00.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 00:16:21 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 16:16:17 +0900
Subject: [PATCH] target/arm: Define raw write for PMU CLR registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-clr-v1-1-2cc49df40fe9@daynix.com>
X-B4-Tracking: v=1; b=H4sIAECG0mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nj3eScIl2zRGMTC2NDMyOLJHMloMqCotS0zAqwKdGxtbUAsDkDX1U
 AAAA=
X-Change-ID: 20250313-clr-6a34831628b7
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l1TkezcQE/Lx

PMCNTENCLR_EL0 and PMINTENCLR_EL1 clears written bits so we need an
alternative raw write functions, which will be used to copy KVM kernel
coprocessor state into userspace.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f0ead22937bf..30883cd3a989 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1907,7 +1907,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fgt = FGT_PMCNTEN,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
-      .writefn = pmcntenclr_write },
+      .writefn = pmcntenclr_write,
+      .raw_writefn = raw_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
       .access = PL0_RW, .type = ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
@@ -2033,7 +2034,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fgt = FGT_PMINTEN,
       .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
-      .writefn = pmintenclr_write },
+      .writefn = pmintenclr_write,
+      .raw_writefn = raw_write },
     { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_R,

---
base-commit: 825b96dbcee23d134b691fc75618b59c5f53da32
change-id: 20250313-clr-6a34831628b7

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

