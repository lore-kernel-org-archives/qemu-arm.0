Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp518785lff;
        Thu, 5 Aug 2021 00:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9Ws9feYb6qEr+M7TUxgUPa3w4imli/i2lUUq/pW2QgJ3quTRiQnC+EyKEpjqVxwNdMseI
X-Received: by 2002:a05:620a:1537:: with SMTP id n23mr3384627qkk.420.1628148746278;
        Thu, 05 Aug 2021 00:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628148746; cv=none;
        d=google.com; s=arc-20160816;
        b=BmFEq/qIN7tVRhIEW3XYWKzjYZe9L01IrJjulw3e3qRAaF3w7GXs6Rt1bRU28Hiw3E
         7/KYFUP3tSxMMIQ/G9TsXkSaksXwR+W5zr52elX3vtlkCHRPM16qd1PK8Y13jOPt/LmN
         00AhJmZWi63NyWnHyp2Fevt5gCkZbJk/WF6wT8Bny/jCmPCqhz8432OQtUl6wiMtFJQn
         tp2mkG4Q/QOwwJ26ipMLhoRndmU19Qcu8HfzFUZJqae5OGx8H8buTd0zxGROQQ8vV00G
         ZxRd6xp6jGEaSZerbeQJgxvlRVnt3GG07XjopAGzheTfnTZuSFCoNLmzb+UQcVj4RRbi
         CquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=ilggXwHYqiUJ94rR5Y7CFhCsACVqK9Q8FChsxhyZaJY=;
        b=Y+/70Lv91aL6uoFgWv0WiwFxdwmAT1WhpPVRVFBxjCUuRhNOvoxQ5II307qFVN9cqg
         jRoGUpnM9Yl/WJcP9Z09hdASCy7tR43Arb3hKRwWwnW1pRL3azmOp41yAPJlAjdqIEti
         Lpcyfz+znJFt4EXAQWl6bF1V0se85ZmuArSDKryUwYX4kGjHLIODc3E1/nq8RFqtTqFS
         KpV7HLrVtiY3MbPng7TFNozih8kHZZ4KNRCmoJD9hTpw7dg8XYFDX1uaSSBizZuKmH8m
         EU33QG6OoL0l87mR5Oo3jVHTUksdvXK0EfM+vK0WPXKkhPmYNfNV3A93S72yoFgAoXPb
         Vd5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20si3918720qkn.198.2021.08.05.00.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Aug 2021 00:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBXrd-0005bP-6J
	for alex.bennee@linaro.org; Thu, 05 Aug 2021 03:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqH-0002om-Dv; Thu, 05 Aug 2021 03:31:01 -0400
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225]:38058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqF-0004AL-PG; Thu, 05 Aug 2021 03:31:01 -0400
IronPort-SDR: t7kPtLeXG7HhoOVaVEQcY1AymVc7h8VJqRroK5Cp4fMmLu3XF1/05b5Kox9Cmicf7K7Rp75x7F
 xHxl/d4GRUiCi3Jc872TWsuGdLSVf5jib4uk/Ih1vK2uCGknFJ4MInZuxijn7AafQG/6ZSDP8f
 rdKFY/C0A4lhn1fOp/6qGHADygMIvfCgSQyS29JgjbOHNovEsKD7Idtd3EF0UJ/XWSvo6fEQt+
 k0rtG196sTw6qYdKSUYu2YQ2AGzPP1vg2MXFq9lyNK53uZqsyvOOJfDX1AGxPQ2WT10uYSXOW9
 DoZV700RtX5fx4WqoEiZMmBG
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="27055467"
X-IronPort-AV: E=Sophos;i="5.84,296,1620658800"; d="scan'208";a="27055467"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 05 Aug 2021 16:30:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B7246DAA0;
 Thu,  5 Aug 2021 16:30:55 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 953B5E0B92;
 Thu,  5 Aug 2021 16:30:54 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 6FF98400C23C7;
 Thu,  5 Aug 2021 16:30:54 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] tests/arm-cpu-features: Add A64FX processor related
 tests
Date: Thu,  5 Aug 2021 16:30:45 +0900
Message-Id: <20210805073045.916622-4-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
References: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: neutral client-ip=139.138.36.225;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa10.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r78ij3fOzMFk

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 tests/qtest/arm-cpu-features.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..979c6f82f8 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -472,6 +472,9 @@ static void test_query_cpu_model_expansion(const void *data)
         assert_has_feature_enabled(qts, "max", "sve128");
         assert_has_feature_enabled(qts, "cortex-a57", "pmu");
         assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
+        assert_has_feature_enabled(qts, "a64fx", "pmu");
+        assert_has_feature_enabled(qts, "a64fx", "aarch64");
+        assert_has_feature_enabled(qts, "a64fx", "sve");
 
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
-- 
2.27.0

