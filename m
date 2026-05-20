Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A7DCD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:29:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPleD-0007UU-JT; Wed, 20 May 2026 14:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcP-0004LM-Pr
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcM-0002FU-IR
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bccb978bd9so37303765ad.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301561; x=1779906361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUXVONoe8IwMkgOU4fg5iX+I5AZGpysKKoOGKzNezec=;
 b=XUC9F4VVHKuyZ4QDiiHn0+t40PivSDtMLKb9tl6h4//p8HZAkkgqDn9p51kSwyIiAP
 3yySbDO2YFnZ7SIoP3HA8EJHDYBelYf25hyFdcTl1WPSpljxLU/sbsRBp6Z2QHMg1ot5
 Q+YaWJuGe24k0tyN8ExseBBPrKBSUsfWngQRcQAWnzSaj6fhKCnvGJpudUv7k5XZ3DVf
 6w156Git7eUqm16MpPs0MwOQyQRBlezpyoOXFT8hzPqu33LvIZH+bjkL5opSVx4AQRHj
 l9TT1kFL2Atvq7+88LHnzP/tRIGZVXbRW8gxzYwJFw4zu9uhM9a1qw+CSql5OiTzHZ24
 LzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301561; x=1779906361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WUXVONoe8IwMkgOU4fg5iX+I5AZGpysKKoOGKzNezec=;
 b=aGDTPfheEFPb+6850SfIunyXa8RRq4fRpIAQqaXpP7io06auGI47xKuKHcHopWtZ9d
 AZCHjagmiy3O7n+dlB0P1pG7hyV/eTdqeBHF+BjarzTZhY0d9z6m0qwL8TNlgyeVNa7p
 sazt4gLJQU5v1PzqYoN0LesFNV3vMU21ZS3k8hhqrgu88pOz5A+N9GCTxxjnMvq86yQG
 m2EfCIFbLhfxtbOItCl+BXkjhoFk0R6jE3Lj9alagT9WOk2Z+x2lvFtfeZSg99E10njH
 SvQ2tQnOw0n9xvaMzVh3hjpriZB53Z6hjL3LAWiWOpdDjC+Hm9cVuaNDtXrfK8H5y/Md
 gO1Q==
X-Gm-Message-State: AOJu0Yxqrq2cEkCPoPLMOOguBr2g9fYJocMl1/DWU/n7zlpLIIpLADEx
 47Xl2AyHQV/CuLRYLZkC/+5d6pCVt2exLZu7aw7TxfMiOBV3yLPhkJwZTqyMJ/DXKgA=
X-Gm-Gg: Acq92OEKVkixAvHsMnjdZzoJCZkOwdveugCUqdTWq/3u+34GFBlBy0q9HNCQMktPEWO
 YsZtC0STgDO1T+uw1mR7iVDkH9gj1CSuwzu1PukSyjTi5d+swug0U6cZq2zd/tleRI2yR1UsffH
 7gGyKSnE/KiTMk8BU8HN5drs1BormVFC5/1QBiqVyuQdoSJ7nBRkw9qYIHc1/00Gcg31wk+0xbQ
 2vQknOKzxuSE6b4wnMzGlOQ8NUyH2SrrlVTW1QvLGUxjPL48fxA1kWIjxkDHWaPwtM7ldyBrrgK
 ipBuVSR6eV/lGhKZsTon2UDYVmlVwVSDxIm4nH9CfSDX9DA7HmLv0x27nB0Lbr9ewP0kmmOo1Fr
 Xx1c4oeViO5RJoqmgRxCD5Yk7pCqDVc2+8k65HNUjeAiyrWtqpB2NDP1OG2eoQCcNu6OohaRhZV
 IGeqwUfSMBlwpDBSs3HsQP30gfyB+MuDskKQG72Bg=
X-Received: by 2002:a17:903:190:b0:2bd:e021:6dbc with SMTP id
 d9443c01a7336-2be9d404eeemr5357165ad.2.1779301560976; 
 Wed, 20 May 2026 11:26:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:26:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 63/64] linux-user/aarch64: Implement hwcap bits for fp8
 features
Date: Wed, 20 May 2026 11:22:12 -0700
Message-ID: <20260520182213.872945-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 3af5a37776..0934524be2 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -218,6 +218,20 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
     GET_FEATURE_ID(aa64_cssc, ARM_HWCAP2_A64_CSSC);
     GET_FEATURE_ID(aa64_lse128, ARM_HWCAP2_A64_LSE128);
+    GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
+    GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
+    GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
+    GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
+                               ARM_HWCAP2_A64_F8E4M3 |
+                               ARM_HWCAP2_A64_F8E5M2);
+    GET_FEATURE_ID(aa64_f8fma, ARM_HWCAP2_A64_F8FMA);
+    GET_FEATURE_ID(aa64_f8dp4, ARM_HWCAP2_A64_F8DP4);
+    GET_FEATURE_ID(aa64_f8dp2, ARM_HWCAP2_A64_F8DP2);
+    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);
+    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);
+    GET_FEATURE_ID(aa64_ssve_f8fma, ARM_HWCAP2_A64_SME_SF8FMA);
+    GET_FEATURE_ID(aa64_ssve_f8dp4, ARM_HWCAP2_A64_SME_SF8DP4);
+    GET_FEATURE_ID(aa64_ssve_f8dp2, ARM_HWCAP2_A64_SME_SF8DP2);
 
     return hwcaps;
 }
-- 
2.43.0


