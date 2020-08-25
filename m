Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3345104lfy;
        Tue, 25 Aug 2020 04:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOHa25MnP/Ebo34g+9iKbthqptzr2GkNwib7f8XaCST6ltVdjNlxlK+Zj3slA4mhkzJLNB
X-Received: by 2002:a25:74c8:: with SMTP id p191mr14109117ybc.151.1598354792829;
        Tue, 25 Aug 2020 04:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598354792; cv=none;
        d=google.com; s=arc-20160816;
        b=YosQHeU7p+tZGSC0+AttwtnYLl3/3DbG6PhjjvrMhaSJVgN01sPzFHIgj+sYtcdxCy
         /qHq4VEe+IM3ATUftldBSE1c3zH6vZ5Y1K4eKDIQnsZBEZmVWaMDsn3J1jkzHN+z/kQC
         yXpTM+Ze7yr+q79r5p1lg7DQOnnlehFhRE1uCsHcu4uHfIqVfTn3Wei5OqDP7efmwRdu
         0jUEIXpsECHMpJVvVG9ZV6tQZpNag48ygKPhU68XjNv2QtnKmFv/QFWizC+BTlntHxHy
         nguChwRBLvX96/loWfxAzZSrvL5Roc4oMkrCJ+dCcuDkYQA3+Qf7Vf47hj/aChx77cKZ
         zZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=gFtTC32iKa/QUA4SN+ZfPacfTE1d/dv3O2DWnKOrH+0=;
        b=UjFHLVso94/B3bZlnVps7K9kAAUuGBrfxfTiYhrnZrwOmcCYyYUTFjqMmq201BsYQJ
         6sM8I76bX56xWCVy0kFs5UtDjj5LrQ3vMgRlfFwwjxoERvCmfDMkcZjSypR0aH0P2ChY
         /4TmKxvVuRa5vsoW/tHpcDZ9VhExU5F/kHpmdziq0naqayf82ZFeXE1uNHfdh+BsOxyR
         0NvMtBAQ9aOQmcGtmEV9cWv5GygpmAjJyTdNjPXQBijQ7WpK99rJuZE0+z50kQH9zUiB
         +uHaa/LVvlS4H+HmY0qUOEG/vjRVEsbqcTEgDsZG3kU5wSj+7WSThtgu/tD5sXBHyNR0
         SeTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si20192053ybt.339.2020.08.25.04.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 04:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAX5z-0000UV-Pt
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 07:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5n-0000SQ-DW; Tue, 25 Aug 2020 07:26:19 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4266 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5k-0006f0-Aw; Tue, 25 Aug 2020 07:26:19 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3D20EAFCC1F1C16209A2;
 Tue, 25 Aug 2020 19:26:09 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 19:25:59 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 03/10] target/arm/translate-a64:Remove dead assignment in
 handle_scalar_simd_shli()
Date: Tue, 25 Aug 2020 19:24:40 +0800
Message-ID: <20200825112447.126308-4-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 07:26:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: xUmoG62oe1K1

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

