Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E68E9B250
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 12:10:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vurFC-0005Yh-EA; Tue, 24 Feb 2026 07:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurF8-0005XM-II
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:23 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurF5-0005s2-7E
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:21 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b8845cb580bso826636966b.3
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 04:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771935017; x=1772539817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRvKEquHoRhR9FTtoJbDGwgOdmk9XFImG/i1KpW6qVc=;
 b=YkiLoTJxU05iGoGtoTXut76udDURfSW3EnubDE0sZ7DZRksoN2icUhKqvP22qTkPqH
 shjTj2sHMH2BBejpbwBVf9JfN0eeGdwbWRMdy0RJhU/7HFM+L/V1M0z5SHgXTxnUTXwj
 x5Q06H9U7gEGYdsFZF8WrwTkq2yZbRaaINB46HMRSVANN0Wksiayc8fahHrGlhp+l1qL
 iyRcfVFntLx2fCF3CpmzSbrKUWpUykLoe6PVnaQR/kzdKts0ePEYCiBInHwdpvW9qh6M
 sbbusHFyd3Kpkgu+ShzY1ylvzQ8NRjUdTn9lnM99uDSJt+xqIpzfK98lv6xtC9dYp1EF
 0fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771935017; x=1772539817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IRvKEquHoRhR9FTtoJbDGwgOdmk9XFImG/i1KpW6qVc=;
 b=KWFY9NHH0xGBwwKWEdGXqVsC+9620ADzX3Xhk/sLnStqtW1MdeFAZJBp+fdncKIOWG
 K5htGaIrTRkec5pzvto/qNtcy4+0C4hDKwDFBlD3549zr+z69gWOhrQiSD++D/lFYkij
 of163KewobXza6UyMrpMK3zdxpGSe4BC3CT+3WSXDora8/9jIqDdCCn5CrN1retE4YWm
 02ysZk8Wxl5kTqeia9JmdaxabfurJQU5GF6kmx+mGMrYXnSORhhwt3RNf/8rc8VhwtH2
 LSffFVhoPxaw34CJ1GbXXZAIQa7FQW1tbNvYmmgcaO1aGJaJa6Rka8WQKCA2ppRST+hw
 qhzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL0k6rl+BAiJOrAGzhF83g222Qjp/kT+jJF1XnKDOKjye/g/7YiERfjSMbERG5IqxSMEM0Gl9UxQ==@nongnu.org
X-Gm-Message-State: AOJu0YyxjD42JoORD1B1Do0wRaSPhECIT0Go62i2+UZdC3dSLAb+n6I4
 KQkqj+JTKJdqbKSlz0YK1qpYTpHn8/yYPQz9HaHArUH3QGvoW2y3fgWGeLNE3Xh7ln8=
X-Gm-Gg: ATEYQzw46Qrw74HhEOTA0Ts8rDPYRvoFHGm7Fr49SqxSFVQPet1v4TwbcfTBcY7DXyP
 0UQjfRdxLAAHBwFAnJrZkK6gnR3PCrkA1gt/Jj5fZtdvlzz+GYf/WRY6TFEGbLNGR78Z0MZfK6A
 HE5cmzHR6rXT3HqEHLnDCkrDzCv6wBUxzmwhT8Dt5NnYSALk090Oo2s9fXPwwtPWZiILPYlde+Q
 0QTtbZ04sbGlAg26J/FtEXhPQ7oW3Kfl7bQYtm81iw+1KH+4H6vNxWnt54tybFQSlUk03mfZqJD
 hlgHCPgYT5YdLrTL70wZgLqO9L2imdscquEavZq2tJJG0pXsF/cccHcj2kUykr+aBchqihNhzoW
 ErZugG2cdMPg2WhTemSKFMejpYAsW+2712t6fMQbpagDzi9UqbobbQJM3EBazAFgSDlHoMO5Icz
 YRJKq7ZDb7YC1zwYqEJgc8vAo=
X-Received: by 2002:a17:907:fdca:b0:b8f:9283:f3db with SMTP id
 a640c23a62f3a-b9081b5e4c9mr735760666b.53.1771935016752; 
 Tue, 24 Feb 2026 04:10:16 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c5de66sm428690066b.10.2026.02.24.04.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 04:10:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A64365F8BA;
 Tue, 24 Feb 2026 12:10:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/8] target/arm: set the correct TI bits for WFIT traps
Date: Tue, 24 Feb 2026 12:10:07 +0000
Message-ID: <20260224121014.279248-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224121014.279248-1-alex.bennee@linaro.org>
References: <20260224121014.279248-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

The WFIT trap should be reported as 0b10.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 4d708635068..aa14f15eb62 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -448,7 +448,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
 
     if (target_el) {
         env->pc -= 4;
-        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false), target_el);
+        raise_exception(env, excp, syn_wfx(1, 0xe, 2, false), target_el);
     }
 
     if (uadd64_overflow(timeout, offset, &nexttick)) {
-- 
2.47.3


