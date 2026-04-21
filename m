Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DEBF588C9
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Ry-0008Is-80; Tue, 21 Apr 2026 01:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RB-0007xX-2M
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3R5-0006MB-LN
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:16 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2b24fcc2b5dso24159675ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748449; x=1777353249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfNScWpB7q780oJkpTFR+sWvykva2u51oGRZh7kaCOI=;
 b=FgmYs3HEW5cP3ayJXgJx5SzQOk4qYhWFagEab2sLGBrtOSqlLunL75WnjVRYbGB9Xh
 tWYYP/6USXaEjKCh9W5gy3QvgP5BCJNRwoNZDzPDima1giXfzQl7b4pn9RCNZ2orVZeP
 Ye8IEpC7wrGAKeGYDA0GNLqotVGMNzxUrQGXrrlLhF+gJebZUZsAKdEqcHEml7+Eloup
 97tolVXmFxDVlKGqXQdNEbHKLKPasb+IAv0QZd5ogUuhTqKJdvd6WIl3hBTLODh9/CJA
 uu4OkEit+Sba66wHHu3Xxk06gKOeogcTw5JqUDIYkHscyPIBeQHYwNSBZqv1U+Qeijpl
 hBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748449; x=1777353249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VfNScWpB7q780oJkpTFR+sWvykva2u51oGRZh7kaCOI=;
 b=Ipi/qdrPlv8LllyaJwqU7MoDx7o3gZkQbyHDztBdyGeC7gLTvWd5/U9GBk1It51WKl
 kiMqUR6+sCKJdIESp6e9TOykgajHAo5oX1S1UIQRqrnzQ+2+Rbu1pPaBK2aXR0tkKcIA
 mBL2WChZeJKH4onz4SY8ysjc7VyMit6CM/oIKv+kOlc5YqdT4BRrlRn7r+0+iavEKTmS
 PqMF7LgazDk+eyj7VVDF9w1LbG9NLQAFaRwGCSJ+LBsVZSJJ5nycVFVJ0jrTBldN6yQ3
 KIntOE8D+km7OSaHFYFpDKJW+D3l16ub9WIpVjFhC4RcF/NKQYzAwLPu1aj6lBNnehzs
 heXA==
X-Gm-Message-State: AOJu0YwM+R2Spf/4pbtpbPkTHWwpkG7b5Xfz9ODt1gfvPBiqi3fikk2+
 CLiVsDpAS71mQLj794h66O4N97L3gQ/IQ5pTEYx0p30+VNnx2yRSAdHdxPQM6hHik56joBYF8+D
 zH8ETQKw=
X-Gm-Gg: AeBDies5kMKimU4dUyjuzw8WGbPttV+bfmYIAFBJORA2yQ6N8W1iQnsu8XwTKaUWG4K
 brBA8JjGqlPqBm8LY22vED1O+RGWodoL7JI9hl6yNQtbZFo5WwZYY8I0miwzsnoUFxhhf8BJ5hm
 W1pRdCLqQj/t82MwFbJi74NMuv9GKSPehn7zzUiZ9qO8St5pZooqaf2r9/8MBjUcZQCcm6l/3og
 o6H82kJEYAJA1pDd1h1YvhxjRoF1ZdnhSqFJ8bl0ojBw690WwGOPQ/u+e352nIIe+fo4YDDigzk
 wPmkSObVlbxQZFDtSs+KLke5J7uUXPhbej//+Jup9Z7/giCamudh6q0hggxLqtnfrhQ1QJGOLzz
 bBVpbsYuiwgeeq6hJC0BWe2QgfKx/IqYtjxSEy9xB2EwhIiVD/elCxuK5mb5GMrIQWMsCGGAjqy
 5IgynWPs61ml1Ve+eVUwKIyFIOfayHn3kvnynan947
X-Received: by 2002:a17:903:b8f:b0:2b0:7225:d2c0 with SMTP id
 d9443c01a7336-2b5f9fb9d4cmr164504445ad.30.1776748448752; 
 Mon, 20 Apr 2026 22:14:08 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/37] target/arm: Update HCRX bits for Arm ARM M.a.a
Date: Tue, 21 Apr 2026 15:13:16 +1000
Message-ID: <20260421051346.41106-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 85980f0e69..b0f6bfa62c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -252,7 +252,9 @@ FIELD(VSTCR, SA, 30, 1)
 #define HCRX_TCR2EN   (1ULL << 14)
 #define HCRX_SCTLR2EN (1ULL << 15)
 #define HCRX_GCSEN    (1ULL << 22)
-
+#define HCRX_ENFPM    (1ULL << 23)
+#define HCRX_PACMEN   (1ULL << 24)
+#define HCRX_SRMASKEN (1ULL << 26)
 #define HPFAR_NS      (1ULL << 63)
 
 #define HSTR_TTEE (1 << 16)
-- 
2.43.0


