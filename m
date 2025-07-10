Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F394AC83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 18:23:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZvvD-00086H-3G; Thu, 10 Jul 2025 14:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZvFP-0004g4-6L
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 13:39:59 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZvFN-000848-DF
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 13:39:50 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-40af40aeef6so429534b6e.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 10:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752169188; x=1752773988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9CYZ9n5k9l7POoIDGNaUbl9BdeCS6jIWeYnafKn6NI=;
 b=XYuQqhTACKRpdNDeFQymHOAe2iTNkK4GBzRGKctbMeVc3PdvjVEuRIUYkcsnDqhCwf
 /onR+9KJVI9Or27kKaLR11SJUu5JBCgLcY9ADYSqC+2I5cJuUHiv1+ex7gV1NY++GM9B
 agaOFZ6i1wng7fMdUeKvdXn/RrVRKYV/HnlNvk1LXgrbFurJIttybXW4F5UsBHZIbyCv
 B1tLBfdg2HHMm1hbfafleVYD8xbNKD/lalhX4I4TYXBle/xtIpqLi8yIMxx4LVtGDOB9
 TrSSNWL9N4oLvgoDxsRrV7TjGMybb3X7MJ3JYT5OSIsT+prd/AmXqudqJ0FBKKV2MOqk
 nkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169188; x=1752773988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9CYZ9n5k9l7POoIDGNaUbl9BdeCS6jIWeYnafKn6NI=;
 b=Rlt6K/jD/IEhb8L9iZ04lbImnryJEFRt8keixFWT1Hl+Q9TRS1NpsNwZV+7HsSey5q
 vma0RLF4DuUl9KlDvr+HKbEZTIwgLDwCMZ6A+5S01uG/kTlPkMJ6xwKed3rZmmM+h22u
 iFLzdqcpH13NNboqBbEXqkNupqAGYJ5Y5sxYZyJ5AMhTb8UHBGUDCSBs7U7VAtzQNx1k
 zKyYlIBkzlxvEuRTJk+VOdEQI1FBmA+tJ0apGXUhDIdjdP6o+APqwL4bvifUxDEe1z0h
 /eBp6TU6mzvI4OQjBK2ssnUP7iBCjceCsz4dfDcf0yiuuH91eDAAoID4ja1kCPqT9Vre
 Z4jQ==
X-Gm-Message-State: AOJu0YxmvSiYvxWqvqOf0wlZNiYlNzxjxXvtR5PPjprRMPYT1za5V8Eo
 RWuNo4D4sFCqnRwa9c7ZZnYg8DKES8+L3C0YGSJ6a9fG8eDuMKIGzmnGJ1X1XHnfpd4=
X-Gm-Gg: ASbGncv01epesDOk5LjcfhQBGmF9mfkZU+a8suNf5GT7jeSE+0GY0Pqr21owu6QYfl0
 zsJRRdYoyOzjnORS0Sa/2fCf14FFE4xK/h9HmL5cXTCqpYyAvAwl14RtSYUnERb90SfdYX3T2cx
 z3PAp0vPgnStoAJtDPuC+hgT0g8LFqLrHSHliDR8GvLQCQKroDBUs18pOnvMRCt3RvVHICgOKB9
 eg03o1xxkB5qfvuf3GWPNuvZgefnUDJrOxX9/ZGSsMn2NWs92FrhykVAuuluqAK/nH2sHER9bJ6
 3eO+NlZ8oH4zbBoL+sXG0HmV7rrODcL8649qSn/qw0qnl49HQNcgaaeHJy0WtclIWKXbPg==
X-Google-Smtp-Source: AGHT+IF9slB041sEKJdWjcrPFPdMpXu/jbe0Mf/PbS4Tf66C8LlgbagREvVJ/bIEBxq2lt/pqmMc+Q==
X-Received: by 2002:a05:6808:4fc7:b0:406:3a0c:1801 with SMTP id
 5614622812f47-41511619648mr322601b6e.20.1752169187866; 
 Thu, 10 Jul 2025 10:39:47 -0700 (PDT)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73cf12b58fesm274539a34.59.2025.07.10.10.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:39:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] target/arm: Remove helper_sme2_luti4_4b
Date: Thu, 10 Jul 2025 11:39:45 -0600
Message-ID: <20250710173945.115428-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

This function isn't used.

Resolves: Coverity CID 1612139
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h     | 1 -
 target/arm/tcg/vec_helper.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index d9565c8069..0a006d9514 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -1209,6 +1209,5 @@ DEF_HELPER_FLAGS_4(sme2_luti4_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
-DEF_HELPER_FLAGS_4(sme2_luti4_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 0603db0909..bae6165b50 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3526,7 +3526,6 @@ DO_SME2_LUT(4,1,s, 4)
 DO_SME2_LUT(4,2,b, 1)
 DO_SME2_LUT(4,2,h, 2)
 DO_SME2_LUT(4,2,s, 4)
-DO_SME2_LUT(4,4,b, 1)
 DO_SME2_LUT(4,4,h, 2)
 DO_SME2_LUT(4,4,s, 4)
 
-- 
2.43.0


