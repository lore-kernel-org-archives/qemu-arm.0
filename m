Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EA4CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OI-0000D2-8A; Thu, 07 May 2026 19:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OH-0000BZ-1A
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:25 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OF-00010Y-EY
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:24 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7de4be15125so1174507a34.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197462; x=1778802262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xQFL5qnJbTCMuaEBPieq6VTwctzd/ZwaJ3ywMslF2Q=;
 b=JjYitrDE+6ZYEEBaFrt1WsgAz4vcYVmdJK3Hvi4JWxCj6OBH4qkRTz2364hVRVMDok
 dpOF7vFVuOIPz6m+k88GlC6ZTgZb3gP1jcPgmnS2foRlvLG9gJBzjcPjkoN2kXVsVJ7/
 djCcgmyaaMsRg/xMSypmG644Blgx0ZN7k52OOjUdegbsDl/8POondO2+YtPzWI96GcfI
 yCQnLNLId4hqUwyPuu63BkVBTZ6MxFzEDXliUJXzd4aD0S59q7cWg36EbT5J/joOGrQp
 eBJV/kgseBjMmDf1MZex8kYoZqb+G+Dh4pY2uDoCzIVfjAcSGOevTpA1+nuDbr3ButzV
 GsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197462; x=1778802262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7xQFL5qnJbTCMuaEBPieq6VTwctzd/ZwaJ3ywMslF2Q=;
 b=VO9VDkHxEdPiNEnvZSyKmUK5fU2jmoxqbgaaH6M+Bt5+J0EQR4iDCYeTcYM2eRofzf
 6xRyAF61Aly35LPDaGa14CKhLWpkLSsrztU/Sp0qmxAkf2mw1ydF0/EwtqIOuTcatnw8
 oOZBODRn8wSnP+yufHLoDROlmARl64k/ySSKOxxai4nTZPFHFf7rKPwiN5sj9P2YnBDo
 7osJz1tD8B7ZQEpZQX5FQ0qurMeVwQAl4EzgBvCm4GjwOsaTnScenTKVm56N7QSJ6vSr
 M2Dv9xjGgZeXjkbjlYYsSDt0jVniL+O3H6N9xNNgYdMzlA4fmEPPhf/LqFw2eEh9+2yk
 lyvg==
X-Gm-Message-State: AOJu0YyN1bO56VVDh9QuT0TzqJvFUjqRWSLTvg7ELs+ZkbDJowUcDQid
 oU4yIQwbNoGx4BoFTQkQ8SQOBOsFfVKEAH+5LvRnUmsg4Ynk1f1ce4E4JBBEL5VkeQY=
X-Gm-Gg: AeBDievA72KvWVspbtYQi+SvbULxaXLh5hdxIxwvU8WheXW1lFBJ8JkvesA+GaVuBDy
 MORsooSCPj/71XxKJ7zDv6U4iHMA0mAvei0pXIK/M+TWuFnI26HAbXmCnZqzfOBgh8I0g2xzdBn
 QIc4DGossLXlnXIs6DTcoUspCRJVZDJSoKBxXHoin5OIB1VfkyZ6CE6iTY4hD69MKoXxDDC71by
 /13JsQ8GTiCBeWbfhwvIc4mFNsmt389gERCNC2cfgm9hn7IYMlyamEWsHnnQv/q7xIP8ALErrF6
 pwD2EBU6ms4UH2x35X5GYSxSPZwiQQfnJk3mzzAtyFMUZwgvRRT2lWqDE1B6WUTphOl0fCU1dTW
 pwRIwOm13fd3rVEgJa++QpVQK93ziX/ajXOWJRx2YTzJG13/pP58Z2dhJUXeKETUZdSojnbqBD5
 xKRHBwmeQpHR7PzYZ5Dl1xJzzv/8uxG2sTrQK3m9ViLW9gBQ==
X-Received: by 2002:a05:6830:6005:b0:7de:4198:7a2f with SMTP id
 46e09a7af769-7e1df0d2b55mr6576257a34.16.1778197462262; 
 Thu, 07 May 2026 16:44:22 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 07/60] target/arm: Update HCRX bits for Arm ARM M.a.a
Date: Thu,  7 May 2026 18:43:20 -0500
Message-ID: <20260507234413.643512-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
 target/arm/internals.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a632584a4e..6376ae1ca3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -258,7 +258,9 @@ FIELD(VSTCR, SA, 30, 1)
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


