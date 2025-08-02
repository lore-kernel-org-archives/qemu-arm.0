Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A8FC87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLjK-0003kW-90; Sat, 02 Aug 2025 19:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgk-00072O-Uq
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:59 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgi-0004vy-8e
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:54 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2e95ab2704fso2742040fac.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177451; x=1754782251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pyV9I1ab5c29rW3qcGtq+wHa18CtHBS8e6ckAGh5og=;
 b=ltYlW/hfaE1XZA4PUlT3M3SVDenRhUlW4X/xnNJ69yxi1C1mdG4FQPBqbhjnOEV+PP
 xCSVed0UKRCg6btAPzMFjrGsOyLdAp97DsGSch1Cv3RK+kEy6+DUBdPmiYWM5nuqIsB3
 EwFu1I0dbZ2+vPV0O2AkuBIeBmMkecWl/cl+x3NQwSnFgqF36vtMX54a+cLpt3foz/X2
 GSfuECkk0v54mpjJTYW1hzGiHw9CuAFjNspXfXS1OCgL+1ogSgki9rUvUSwm8UaBhZfT
 uis8xFovE0V3WTA1wWe3ZrgK477CWRmdk8emiTg9THkbHaGoKmW0doxz/XV2kRp7GnFO
 658w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177451; x=1754782251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pyV9I1ab5c29rW3qcGtq+wHa18CtHBS8e6ckAGh5og=;
 b=lEA4Y+CwdkoWj9tR8xGY9SWgwuohi6LW3uA08FELyNbGdtPI8TSNJUKwmVmrmJBuU4
 xzRMUvORvENx3rmWJibwOchCQoBhbMLKUAVgZ8ktwAngAwCvE2YcXwiX+tQqovwds3/J
 KJ4pgERzjW8yWuvtU2muRN1+CbnTmp7g1iP/r0eCCBHtKj+VZ3G6lqNQtsFeO8n4/P9b
 nrP2f5yHMyXHhEdA0HYLxYP0v+Pm1yHx6pta6JXoO1zd4Vxh6qMCvV79CzAnOGSrZZjk
 BII6SdJWVohGhcaCTVLzblHoqY+QWecGpeXkt2w1mmJS11NGMhvPQMi0IOiX+MAVuNnF
 2Shw==
X-Gm-Message-State: AOJu0YwqAoRRQIudq6EtBcg4QB6Cu4DNz4GubcWfmvrGoD3dzegPnAXr
 C7jLDh/BnsqFF1+/B3gSOA2QwcAv+30deW/6zAQz98/exXhHH8sbXzDCp0nw2UzyJJznp+7y/1K
 37avvUec=
X-Gm-Gg: ASbGnctkV9OrpqwEIwaCgi+apFDv/xdJCQGwQ0o8kKoXC4s92JERK2hMipS3H+Lv583
 c4iKGfceruq9O1tZzsGRPYBbH4jUJz6jWZp+qZcCHYmpwND9f3zJIERFtGnl73lNCCYT3H3N0/+
 cXrkWXGs7WbpzhSeY+LIx1rxk+bt78VBO3CDpI4eVcN+AStDZZMVVEbb5PTc+5S6wCCPpFgNdtu
 3MWXXJXi2UTwr8vXC1NL89o2EUrBpZ6FzHTn3Uj45hCbGZPPHEg/CdezSbuUyxFTSa9lIxCNvw9
 vCcp+S38cG609iZLkeIs2oAVqNmcYwz6iLCAruft3G37yeHf9WeEE/KmpWeOZ0EgE5ufrHFa0Zr
 Qwqmj1/RqtWiqxuMRHELdPoRkA5Ysk1rVNMCidB2y/m5HcLpcbmKA
X-Google-Smtp-Source: AGHT+IH56x1gpC6ohR//suvmXWYZsOVjvQwT9pWymmz/BRTYFIzVmhJ6B1AIeKTVTdh56cqXNSGPIA==
X-Received: by 2002:a05:6870:3516:b0:2e9:9e9:d94b with SMTP id
 586e51a60fabf-30b67cbad99mr2688884fac.39.1754177451134; 
 Sat, 02 Aug 2025 16:30:51 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:30:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 11/85] target/arm: Remove outdated comment for ZCR_EL12
Date: Sun,  3 Aug 2025 09:28:39 +1000
Message-ID: <20250802232953.413294-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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

The comment about not being included in the summary table
has been out of date for quite a while.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20b69a12df..dc6c82b7e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4566,11 +4566,6 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0, 14, 1, 0), K(3, 4, 14, 1, 0), K(3, 5, 14, 1, 0),
           "CNTKCTL", "CNTHCTL_EL2", "CNTKCTL_EL12" },
 
-        /*
-         * Note that redirection of ZCR is mentioned in the description
-         * of ZCR_EL2, and aliasing in the description of ZCR_EL1, but
-         * not in the summary table.
-         */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
         { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
-- 
2.43.0


