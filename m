Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A3EF8A15F
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 11:13:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDKea-0005rb-FU; Thu, 16 Apr 2026 07:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeX-0005oy-0Q
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeU-0004Bx-RE
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so5330677f8f.2
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776337973; x=1776942773; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eVGzGoRJ05drDuKHfFYMYPcHhmNWrBssZ8qHB4Zhj5M=;
 b=crUIpbwLUVi1uAuvjPSXckVYLOHHXq2vr8zsQ2FJsezPtjhwh4NUL9MblJ4NJtnKOZ
 rnZBrIk1it36OG+/paAwUrRh6fxgsRnb/bLfH65v7R6+NmN8s8yfU8SeFDkRtTaTo1+M
 QucXvkPjjxcRjyrs0WjdpVQv6F9mwlKPDaNMBTsVuI40bwIJGAi5eJgD6Ftln6qk9I/Z
 DdmM+YZqh1GA4mutgCZfFktQe8SRNSheUAqEDL3roF2GpL6wul8XxOLJfxfpaBLmZ9a1
 hkATJZu++SREGoLUBds9da5bB/FwfR8GiYLSgb/v48mM5X3AQJVe46VsyMsw6oAcOmCg
 wnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776337973; x=1776942773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eVGzGoRJ05drDuKHfFYMYPcHhmNWrBssZ8qHB4Zhj5M=;
 b=qfPiQcac+YEFbV1xGILX+sgO9YyCe0NtV6qiwP7QOiarBpKPjZnWVh2UOxYfWudn8t
 K27czY83tT2LC8r1FOK1QiMKeIW6PB8AWpxATE/KkG/bIUFiPCGO9ceRvLHLY5JBYDpi
 OYTpCv932VyvYF6rlZxTt+qQcXMeUa/IBocwZWm2c8iU+DcOdvzLS0zC5tKFQc2IxECY
 nJ+IzTybx6mIx7hC+uw16ZUD1Wec+nHaoJrsVYlC1dVryp1lqPDRuRUlSIhEUHEbny4Q
 4ch9IYuQwJgf9cpP0z93CsTAsIBZ5InvUcixaJP7+AiDu1cPtnqgX7IpLZeXjxRIrwSI
 CfUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8P8hFP+3aTMKSAp9Bkc/bD5jPBlzxKcTEs2ybNR7hYDwn8V3zY/GNTbc7xfygmnmBXNLQDaAkf/w==@nongnu.org
X-Gm-Message-State: AOJu0Ywk8SHLkzzG67/s7komJdkaIcc8qhhIq1N+krvki7Cl78LlKSxU
 xfy87xZoel3x41nBw3qT5GGGYoE8+zx/L3oxfwvmKNpwqrEKCgq3BVXELMkjJP5y5B4=
X-Gm-Gg: AeBDievIQWLsLocFSCAY85eM83pb7wul06kJ5x1Fla6N+l92uKdBht6a8CM+FyGnUG1
 5103Soxp5TGf4iRBwYDoqXEBOzD0ExzlnYS1BBR51H/M3dcDvz8+wGBrmZOw0WqUU4K8Ug0rLku
 6l6giQbUApSZkaTFsqSsk8/YRR8mCFQOqeZbMR3v4bIXETDSs/DYBRPDaU3eSyKvf6v8tm2jA7G
 0H4eSCahGJiDGh1+cX3BraUYqhEhm7L3VaQehTtTqsKzfRqj50wi2dzBfT17scdRpU8C6Zf4Zb6
 LtU2pQC+k5u3i1k6OEMuwZ5wx/0MnQUxXnMohUZcc+wiNtcf8GI2+DlLIPK0eojmcugqQwL5hTm
 o9F9RV6MyGXe0nZXSKANwtbUvE1heFDbRlQggHSTh7/Xh3+LTDjQdy6we9JgKA6GCIwzMR2pOM2
 uVA9r7m+0GXfvxfDS0BDIjX/I58xe26ScNpeyF
X-Received: by 2002:a5d:6acb:0:b0:43d:71f4:7ed4 with SMTP id
 ffacd0b85a97d-43d71f48099mr20169433f8f.15.1776337973240; 
 Thu, 16 Apr 2026 04:12:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:8f74:d82:f9ec:90cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead2decafsm11513078f8f.0.2026.04.16.04.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 04:12:53 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 16 Apr 2026 12:12:39 +0100
Subject: [PATCH 2/3] target/arm/ptw.c: Add two new spaces to the granule
 protection case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-jmac-feat_rme_gdi-v1-2-d9fa0781ed58@linaro.org>
References: <20260416-jmac-feat_rme_gdi-v1-0-d9fa0781ed58@linaro.org>
In-Reply-To: <20260416-jmac-feat_rme_gdi-v1-0-d9fa0781ed58@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42e.google.com
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

This makes no functional difference, it just marks out two cases for
future use.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/ptw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7b993bb5b3..d4b63a365a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -510,6 +510,11 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
         break;
     case 0b1111: /* all access */
         return true;
+    case 0b0100: /* system agent only */
+    case 0b0101: /* non-secure protected */
+        /* System Agent and Non-secure Protected are GDI extensions. */
+        /* No processing element should have access to these. */
+        goto fault_walk;
     case 0b1000: /* secure */
         if (!config.support_sel2) {
             goto fault_walk;

-- 
2.43.0


