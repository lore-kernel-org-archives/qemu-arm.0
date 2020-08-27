Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp459590lfc;
        Thu, 27 Aug 2020 04:05:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL2wprxfi5XzBMquW/gKIdFofNasvkEGsCIrRJstLtglzT326pLZtgKyq5Tnmgg5gKWZFY
X-Received: by 2002:a67:1505:: with SMTP id 5mr11051314vsv.63.1598526315446;
        Thu, 27 Aug 2020 04:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598526315; cv=none;
        d=google.com; s=arc-20160816;
        b=Lzq+Fm/4rXlNbeDXt/O9SJjWO21kQfSRf6ISFCZOLtV7IJwkW5ucMNbzw9Zk5h+ZuG
         ROC6JqlrU8SXMAPhcWj0gpCz54Jz4tEZ5O7e0F8AfmIAApOa4RFdVbncZivHPK+6yHJA
         DcrTY4NIjusCnwteVTqkQMOD84zfmJ/vGogt8Ca6OkgWGl+VqNtw3EmB7ei2OLUiDCSV
         EDvQpPR0uwCknCSzN7cuOdgGklbTyKb8ZlrnodU8n+rZ+h39SguxXiknhWRkQqyF66CS
         +En2NJq5+9yFkpm+dNGc7/LieaQlw5MiYp4uedA9UDo0ZPJklgnbQG4+uUQQecwsAp4d
         Uyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7cVyG11w/8+BZc8SG8Y6j4NjN5v3sRvqclDb9+qjVuM=;
        b=BseATcSVfYw/Fbvf0cKvk0/xkqhfL1vV1VkiZSxGGMP3Su1YIrtIP2DILUSB1FLAZz
         l+i3Y2ITA/ZZT7GMqZ+p+HTbVBy/LcUNYgI836RpqXBkSGuwKHHZb5pYkw3yV0j3ntDD
         hwi9C5rAhTnsRUut+QIJ7PBqP/C5Rhcmkpvj2YxhlKfLbwJRiviPJ0n01HYzyPHO0bj2
         ABrF2A+f3nQ6VBrRtxsbU6fEpyJON/6voj1DU8WYkJlQlI6y2CYzc5J8Zr839Uv7ESbF
         DxVSoeEkN7f+cxVhAbCfzxHyH5shLAWwsBoYdd/DM6Yvw+q8KsCoMYjiiq6I3icajN8K
         AkUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si163374uao.195.2020.08.27.04.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 04:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBFiU-0004SW-MH
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 07:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFi7-0004QV-Fr; Thu, 27 Aug 2020 07:04:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4278 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFi5-0007YX-Mo; Thu, 27 Aug 2020 07:04:51 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AAF88638985D7F1FDEBD;
 Thu, 27 Aug 2020 19:04:46 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 19:04:39 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 04/10] target/arm/translate-a64:Remove redundant statement
 in disas_simd_two_reg_misc_fp16()
Date: Thu, 27 Aug 2020 19:03:05 +0800
Message-ID: <20200827110311.164316-5-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:09:23
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
X-TUID: JHaimPWZVyhC

Clang static code analyzer show warning:
target/arm/translate-a64.c:13007:5: warning: Value stored to 'rd' is never read
    rd = extract32(insn, 0, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~
target/arm/translate-a64.c:13008:5: warning: Value stored to 'rn' is never read
    rn = extract32(insn, 5, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/translate-a64.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c83bb85e4e..47cce160d8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13016,9 +13016,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     fpop = deposit32(opcode, 5, 1, a);
     fpop = deposit32(fpop, 6, 1, u);
 
-    rd = extract32(insn, 0, 5);
-    rn = extract32(insn, 5, 5);
-
     switch (fpop) {
     case 0x1d: /* SCVTF */
     case 0x5d: /* UCVTF */
-- 
2.23.0

