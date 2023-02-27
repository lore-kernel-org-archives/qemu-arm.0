Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4298783ejc;
        Sun, 26 Feb 2023 21:46:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8XR3eLCyzSTUgZRPNOMVO4cA3YzZR+TJ5Jtz08F7zFlaoSJSUs7AgtPTEEZtMsDoSGWw0t
X-Received: by 2002:a05:6214:2628:b0:56e:a4b3:4ed7 with SMTP id gv8-20020a056214262800b0056ea4b34ed7mr47871203qvb.27.1677476766930;
        Sun, 26 Feb 2023 21:46:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476766; cv=none;
        d=google.com; s=arc-20160816;
        b=DTTdUWznngfLes6TAlWWjbZBYVYam2xOkzK2lOGx5v9E5FT/nmaiF+dNOE11HAsjmz
         qhYPS6hNDZsmjh/loIlC+bt+Np3sQI8OnaUsryGeNUz4/nTANKg5B9VLPrUFHoIie4qO
         r9Defso2JIpDBth5K2DBCEtYpgWul7xux6X4GVBM6Ev2gG4nMm2AqJ6AAYoIqZF9Bi4/
         b7WMleS3wWnRDpkKzECMZi0XlZFMHo+VBAoguxr9uSjZIQv0QJcAzi4QHPgFDuth8T8x
         VgfoP2Kgr5KhZUMNPYJU4HXdTl2vdGjp1MPTKsmlu7T3u1QJdH/QFWwLiWWwnSl1CJ6b
         qQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
        b=CTSJ4MHWSi33XQXTpzSquqkh889dBmEMcpNdjhVVXD0ikFVIxWkXIcy2iOV9OPyRNP
         7bZvqp5qBGytd0W3jOqG7qX74sHYNQS/a2QWXdKnq84D94kmlw2VnnWlA7WM+ZdQkQTR
         BKyuA4WohtqDQPjs8f6wyglohJJXpfPb/D8nVGP406kAO07Z8FWueF0zP37rpQLfZtRN
         0sC5ctPK0L8GT2WSPKR+n5+mDJbFY12jxCKG+hKw56QA8a4qXphFbGqYKvLZmg+4ktvo
         Sa25066pRFjDCVsiU/cpH5TxJgRO0dKNl9VC72j6ntGeLxKqjpq3xLaO37t9Nn0PZWHS
         s1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWlI378s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020a0cca01000000b0056ea3b8621csi6336024qvk.71.2023.02.26.21.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:46:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWlI378s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW6T-00062e-BQ; Mon, 27 Feb 2023 00:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5d-0003I7-K2
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:23 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5b-0000PK-Bh
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:21 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p6so4693116plf.0
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=SWlI378sWwI/K1RgeozMlwyvCYHMg6xJrUh53vXgBqgN1fvT+a6cNl0coTpmhFFjAY
 sYeoqh9thGGdU7ofM0GSYxSMuT+3zGuvEM5tN0c9B5c1sx1fsxf3paXzzOM8Z/2DAJBi
 HSbL2BbZmsyjAkMUvhXwC+2WOm7h8lI/59LnEkmGNhP+fulK+2C82mLRy2Uxy9492+f9
 Hgu9z3VZDjlCLpK79qliJpRtt6/tbf6UedKZPu8YclDot8fn84zkq+R1IWIAtMScwlxN
 ifPLzQ7AZeot3MM9rstQkCIWr8WlQr/dgC4uP7K49acpYSOtsw94pMfPrc226IF1DnIz
 tNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=R2PLWxU7LjtMbCyfXV15vjMe9KEdxSU/neqxLSMaom2xuHs/W8GPdzNdy3WMFwQLql
 gXRyHUl8Ran/GewGhCV8gZCW2OD+FhnMEYZSN4Bb9TwjYWxTPSuYiMuQV2nsqhuS88l8
 XhG1pmhDdi3Jqb0jQrCALK9sD7Wnv0Jpb9UOfb+QYShFQ1cQJ4E6jMGOw/3skRgG7yOp
 c8Bzdi3Sueekd84oduSz4titIYWaQKoTQUoGAnlA2SVrD33PcdUBRxs7sG98Hli4iSzk
 pPcFhYej99+QHNQSB95UWhHlN1Ai714IadNZG8oLT3kKPd1stECy24OnNCNCT2wvGrDr
 ihLw==
X-Gm-Message-State: AO0yUKVTC39qQQGdJgVNU3OapmaZo36k2i/1GxJU3Dw9u8WLbPQBDX5K
 XYfDXPguFEkC8xCzSCekhqWn+Q==
X-Received: by 2002:a17:90a:7a8f:b0:237:c7ed:8f4d with SMTP id
 q15-20020a17090a7a8f00b00237c7ed8f4dmr6495971pjf.15.1677475818072; 
 Sun, 26 Feb 2023 21:30:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 46/76] target/mips: Drop tcg_temp_free from
 vr54xx_translate.c
Date: Sun, 26 Feb 2023 19:24:35 -1000
Message-Id: <20230227052505.352889-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ykQznwwYESKy

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index a7d241e4e7..804672f84c 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -49,10 +49,6 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     gen_helper_mult_acc(t0, cpu_env, t0, t1);
 
     gen_store_gpr(t0, a->rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
-- 
2.34.1

