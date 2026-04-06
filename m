Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C4F46C47
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:07:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVk-00036E-Hn; Mon, 06 Apr 2026 11:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVj-00035M-7r
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:07 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVh-00044c-7F
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35691a231a7so2126091a91.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487904; x=1776092704; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVeSwZbNgMxucNnmt+bVJO+rTB1zblJZsZHbFuDjPLk=;
 b=j7WRKtqd5ezM+S+5gy9o3UQJrnGefN3IGD2vt0wEIZ4ya/ZBhdzbPT07fPaCPvhg9p
 U0qmnjiuNBpFSUa6cr9gXb/jnZf0AAf8KVvVqvJmdDqO2YRDpGqdt045mh5bR2zQKKsI
 jULwvjeAZO15PRtoIUUehVjrybmBhx6AQbhjDvFF6f8Zae+ThF8okJsQfYWRxa9DiipW
 mTdpDjFj/wr86miZu4l/Rsop0kbRxsQ0arlhuIO+mitt9rpxphl67xdulnIM9NvDYJvm
 TWkUU7+v7UkI3g3du6U55mpggwXVWAKYXHTitBJ5F+CtsE16CPZUD6O/UNj6Dx2aQcjH
 09sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487904; x=1776092704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rVeSwZbNgMxucNnmt+bVJO+rTB1zblJZsZHbFuDjPLk=;
 b=dgh3wNBHHfdv4Gs5Gki1sFiREdGYbNSLSckqG9OFyecV0TzYn+RxOT8NdKcUF735bB
 iHAtPjIHsd18Q1R0tkkkKhtJbdNj5E7AVWx1vMhTl3Nq6HrJOHp1GboR2nSXeToJnhMb
 8DBEXU8CSqFixDag2Akj2pseVY0N29ESfjAuMuHGBEmQmqCvCfAbAiQU3HXiKc70aEvJ
 mYJKXMG7LIZ4vmz73jdZKWQrAjElqRVSAGNx0p6kF9w4rDvj/nSvVQP1N9LWFf0r0o+9
 wlZcmj0nN5o/FSe/Ri9BrSQktR7weuvSqxaUaQ/bB7iOV2WT+VbrLdCeX754hJPKAiWH
 BJrg==
X-Gm-Message-State: AOJu0YzTDz5oCcE9VsizGbw8l7/+lJYm+iZKklxzTAIxFfL+Sou2NW/h
 loKOgBZDKVMpel/oBaPsDvu6xN/7EkZvOne8WJzuO7QbF7HN69YmdfijtY1LMeTmQw0=
X-Gm-Gg: AeBDieu8UypBuQBIiAh33euml0fDhJXItjadA93s7fxqAHbKi2OjpUdfWdXO0pnUow5
 22B5FhIzwgn/MCzWJimnL4a7IYlfwyM9CftkjCC/3r2uKqIqqpAeO+Q8HG0Dku+JXGHjkPhNSk8
 sOWNB+IlgZjr/Q8Uu4kQUnFuDvEZYOeG6oesqnM+vKBRb8+xMP1Fio0hjdjlfHSfBGTM1JoufJy
 zOhLvt25+66JkTJZuhSbIJ/IaO2CtjhUPA/T5887F4INe2Gh+nyISU7PZbUOpzWETewiMGCeNAO
 jmveadT9vNebTfs9i3/v+0eW3kgh4NCLT+QmPlsS9lG0YUPUp52XJXjH8VgYhTaViBo33nvFkJh
 3vYwUOb9UZa1N09NpwVojIX0LWIaiK4FcG7ict7QuR0Frue2NqxJ14BFnefXDYJFivbKrpprmKk
 tNydTpYfLffLs8cYPG7VpTscV0hRPyccVlwI+9aLZE3Wl+U6aHIVqu3ldFcdSIAhsPXvgglGtLM
 GnL
X-Received: by 2002:a17:903:b45:b0:2b2:54c1:2067 with SMTP id
 d9443c01a7336-2b2816f3dd3mr130959255ad.21.1775487903556; 
 Mon, 06 Apr 2026 08:05:03 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:05:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 10/14] target/arm/tcg/gengvec.c: make compilation unit
 common
Date: Mon,  6 Apr 2026 08:04:30 -0700
Message-ID: <20260406150434.407201-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1fa26670587..0740de92c1a 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'gengvec.c',
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
@@ -72,6 +71,7 @@ arm_common_system_ss.add(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
+  'gengvec.c',
   'neon_helper.c',
   'op_helper.c',
   'psci.c',
@@ -91,6 +91,7 @@ arm_user_ss.add(
   vfp_d,
   files(
   'debug.c',
+  'gengvec.c',
   'hflags.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.47.3


