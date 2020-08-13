Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp276841lfy;
        Thu, 13 Aug 2020 00:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyttVzDjxC4Z9piqQ65Gf+dFZXhEHQvQsAkhuXnAxPWjQh5E1hDo5ChypYdnIWFGzZ+F2yP
X-Received: by 2002:a25:dac2:: with SMTP id n185mr4776682ybf.396.1597304341023;
        Thu, 13 Aug 2020 00:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597304341; cv=none;
        d=google.com; s=arc-20160816;
        b=XpgIaSbB9H26mFNqw+nFhz9KRX6rFQ+tdnJTsCIfZ6arKyZ0dBVaAa7P4pYlbUteQ7
         h1yadklk4i7ZB3JLHMVEK0le/STuS+vsUFGQNJNHSPvD4gtsw8Yp6jfoT0KyJffscDHA
         bycR1Oao7pHPIvTb9JGL7r1i25PfE/N0Aq2H+SvMMvb2XUiPsIINLcqqjMRWXi0cW21I
         eC8I7108a24b6YCY/uzZZBodEgtUu9KlxNhXFmiK+NTQt9287fWr1HKT7zCZ10QjoTdd
         6ziahHJaCQE6f0SzcFXLJnsaaF/eURW96eSpGpwS8T0nmge+a86BmviGTxMsWvrQe9+P
         8f9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=gFtTC32iKa/QUA4SN+ZfPacfTE1d/dv3O2DWnKOrH+0=;
        b=mOUeiH5W9ATe4EIhSZ6QCQBIH9vH5kHNAPWfju3UEZiE4sl8kitt6IzGH5cPa6P0Y0
         bH4n9rcS3cliF1/TAlrTLw6b1gbHmZxhzOjOGo7ykxTAu9jTRNkqrjGEgIsVbECU6/9M
         EI4LjplVvAzN2xC+d5EFk4JXrnOjh+ZhLpZew/MwW0588+MiAokkbDqQzn5by2VXSjCC
         AkjtoRiGH+Vn1G5wsQEOdgE1CEL9T0iUaQSUt2HTg/C5cURwBdeN6wxK4l312BsTl0wr
         d/xNlNrtIZLY2BRNlsEMYkMwjYRbYppf/9hJfCuYUHZLVO6JvKglPm5LPr/nTyZDEUqO
         okug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n67si4938498ybc.317.2020.08.13.00.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 00:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k67pE-0008H8-9I
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 03:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p3-0008GX-B8; Thu, 13 Aug 2020 03:38:49 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4233 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p1-0001mc-3c; Thu, 13 Aug 2020 03:38:49 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EF14BCB1AF3474EBED6D;
 Thu, 13 Aug 2020 15:38:36 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 13 Aug 2020
 15:38:30 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 03/11] target/arm/translate-a64:Remove dead assignment in
 handle_scalar_simd_shli()
Date: Thu, 13 Aug 2020 15:37:04 +0800
Message-ID: <20200813073712.4001404-4-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:38:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 pannengyuan@huawei.com, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L8pLJAP3uIzn

Clang static code analyzer show warning:
target/arm/translate-a64.c:8635:14: warning: Value stored to 'tcg_rn' during its
 initialization is never read
    TCGv_i64 tcg_rn = new_tmp_a64(s);
             ^~~~~~   ~~~~~~~~~~~~~~
target/arm/translate-a64.c:8636:14: warning: Value stored to 'tcg_rd' during its
 initialization is never read
    TCGv_i64 tcg_rd = new_tmp_a64(s);
             ^~~~~~   ~~~~~~~~~~~~~~

There is a memory leak for the variable new_tmp_a64 "s".
We should delete the assignment.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 534c3ff5f3..c83bb85e4e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8632,8 +8632,8 @@ static void handle_scalar_simd_shli(DisasContext *s, bool insert,
     int size = 32 - clz32(immh) - 1;
     int immhb = immh << 3 | immb;
     int shift = immhb - (8 << size);
-    TCGv_i64 tcg_rn = new_tmp_a64(s);
-    TCGv_i64 tcg_rd = new_tmp_a64(s);
+    TCGv_i64 tcg_rn;
+    TCGv_i64 tcg_rd;
 
     if (!extract32(immh, 3, 1)) {
         unallocated_encoding(s);
-- 
2.23.0

