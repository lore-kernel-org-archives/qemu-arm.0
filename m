Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23FBCD6E52
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:13:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSr9-0008RM-Ej; Sat, 30 May 2026 19:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSr6-0008Pk-Ui
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSr4-0007ND-Ur
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:36 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c857d04cc99so496943a12.0
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182752; x=1780787552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMKShQuAK58R/9FBdHpTIimQtn7JKRLF6OWG4SPVFxo=;
 b=gfZuloeJCLDjKRQeaZ2qA9sGwjeSSCzCF6tBbQR4S8oiBmynN9mRVjFc1Wp2RYvPaz
 F3m89MStkosDwcmPihwH9YHMz27goEmtskgaX4SxQiPeibDnwLXKjcj6LrWO5E64qnaG
 alwcg0PhuC687xX13txo/EEiMmH+trq2EVctyLQA8FkhF5YWMdkAmyY/UYdktlxBgLVY
 9meYZhK7L0YZGB0N6NBYrNeByaaaiIBpEcKMrYwfjUFK1GNjAn3Wamj3DrUP/UoA+9du
 XUwFy1t1BhlXFVok4uEBpUf+o4/xP5rTWVJnhl0SnlGQuvaUaDiWWgDLeTWXL/w5eaCl
 YKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182752; x=1780787552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mMKShQuAK58R/9FBdHpTIimQtn7JKRLF6OWG4SPVFxo=;
 b=bMjqH+C6f/svKe8GbLRXeWbujMSaPk1N9Y7fsSOev/dvZNQ+EZ+nasdSzDLT7uWjcx
 aob7i8ZETHhssjcdRiapWOMHai14WOjahTCSCvG/KhIlSYVewZJkPQ9h0Qin1YumnGQH
 lKlgOgd68yi5LfkescafoVksG3pb7CtoEFuB2+JxXpV3Y/zyCP7stCkRpcV1oTH7tPOH
 ZZzA7Rt5J38KJ4gJJLqWWsQ9U8ibRtvc6KJzLVoJyx43Tt66sgEv6U5fZ6HATYfffvd9
 aRR3PJ8GGS7hyS758GLFaEfOAJjt1h71CT9Ku7MpvPvQghKlenx3HpdZnmvvBKJSls1Q
 Ex8g==
X-Gm-Message-State: AOJu0Yz69bMTMfKXR7FHSfoQ4gnB8+XVf1x/+ryIK6A/xt5CWe1Csu0f
 FzqTpkmBbtzyFj6Wus/3u+QmwBSUxeZ6YdwoI9uh9j7AddW0Dmu9AeDfA/YEluoFz5U=
X-Gm-Gg: Acq92OE1eNXu4MJU3t3U6h1auJP58XR7KhQENjgC9/FtZ77jCude5nTuA1n8rXISyhJ
 3ty0fzo6hSBj1POz0nINU0Y8raoftRd6ec7Kiwvg656KA6A3NZC1d5TdDcLexNIlc4mzXKwQmcl
 /rjoHRxS3F379YHALZvge5wBgnkWNWSpPpwH9+h6l9PTunAGE2M0i1QvZrFsHMTA/RE2o8AqZW3
 IQJ32AxulsWHvdwL9uHnEbnP+qZhW953kNb8jGTaFCpR+RPYxtWoxqxA+OHaA50EV5n0SxtZDm3
 Tl8tw7nvx21oftSd2UmEJeklyJmZWYyJjKMoOVG2rY5AmGM8AVCZilK7pd+1AQIkx1Yu4wLw85C
 p/ZLA5miO2LX3ytZqiFKb14zwMEDy0rzuwZef7RWkSIgsEqR5uD6eTPoiWhEenKvDr0i6Rpe1I9
 VW99+14oLFJB16JYlm1gBv3QXPhHF84pwiWKPm4lQ=
X-Received: by 2002:a05:6a20:7f90:b0:3b3:9f4f:2e54 with SMTP id
 adf61e73a8af0-3b40fddfc1cmr8980296637.39.1780182752367; 
 Sat, 30 May 2026 16:12:32 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 02/41] target/arm: Set e4m3_nan_is_snan
Date: Sat, 30 May 2026 16:11:50 -0700
Message-ID: <20260530231229.400441-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

The unique e4m3 nan encoding is SNaN for Arm.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b75c6a6622..77133b8b4a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -308,6 +308,7 @@ static void arm_init_fp_status(float_status *s)
 {
     memset(s, 0, sizeof(*s));
     arm_set_default_fp_behaviours(s);
+    set_float_e4m3_nan_is_snan(true, s);
     /* We want 0 for all other settings. */
 }
 
-- 
2.43.0


