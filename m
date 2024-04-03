Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4485346ejv;
        Wed, 3 Apr 2024 03:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBubSnJ0IJ3gii/oMlyEqHfHbWMMM/OOu+qRi5o2qRdI79IeihcaW4tSGbSGVP1vQABrs7COeZeIgd0seTCL67t6ITaUg4
X-Google-Smtp-Source: AGHT+IFRZkXPReffilz8D6HLPLmfNpiredhdqmRiH8ku8v3gtuIBEc8kkTeDTy/NQ3GEJ2AvH7YX
X-Received: by 2002:a05:6214:4007:b0:699:13fb:65d0 with SMTP id kd7-20020a056214400700b0069913fb65d0mr6807278qvb.18.1712139682073;
        Wed, 03 Apr 2024 03:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139682; cv=none;
        d=google.com; s=arc-20160816;
        b=heqHp5fSh4PFK+jxiFYFEUYuOHN+wQa42tzwGA3zrEpkwsiVUgnuI/z8mhXpOVQtLz
         WCBDnZHtMtR96vm4tZAotY14xUflcafHh5N/sv8kWJmmOJl0dUINDYYTIzfw0+FScn+s
         RS75KWtmpIiy6IcpwExI3tXwk2Hh7yTJdUHFx4yVzgHMset4+ekc1r+zjBPU6N6SCOil
         lpHcRuGTFGtmsioE5rdbSW20zXo8MLupXuliUfi2HAqJX41qPqkKIzhnZhL4klNnU0pb
         ooXs1BAVAB/ktVb9DcfR/wycQP/Vze6dhN0lHhNV5LJXZQyxByNsWKEQQ8XoRdEbcjS2
         0bdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7+CkH2sAC8NKkG7RpWbt4+5J0vqIU16z5lht9wCK9q8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=1Bkav6BDQL6zDG4UFE6oQe+wi5ig3wsrzAzFkvykEzvi5T5JHHSMk/1jNhH22k+5AN
         VemZCUCKKazlxByp7tfOVo/8Jes+SelBNJtNV7pWxIWiMVN1VnnNFe0MCqyAz2MormW5
         DipHHXjnJEbFleYwBHvy7HiELQufYNfRlUCQ5+H+dEAoMY2ubrClKsXCw3J0gajIe4Fe
         UW6PET0rZMguZSwyOzoSn7uZGjy4GOaswYG1W2UKT291880CmfzAuceFm+7mbSo7Ykmw
         sojcNU7rkL/jUyAM6Y6X2Q4tX6sW2eNPPyHl+JtTczVYvcdycVEMKpQcQ1h8K2aOrNIa
         onOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a0cda0e000000b006992c5d554fsi218633qvj.546.2024.04.03.03.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rrxgv-0000s2-DS; Wed, 03 Apr 2024 06:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgr-0000na-4c; Wed, 03 Apr 2024 06:17:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgm-0006by-39; Wed, 03 Apr 2024 06:17:56 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8gf80LlMz1GFmt;
 Wed,  3 Apr 2024 18:17:04 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7F18414010C;
 Wed,  3 Apr 2024 18:17:42 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:41 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Wed, 3 Apr 2024 10:15:51 +0000
Message-ID: <20240403101611.3204086-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZfV3/CIvqiI7

Add support for FEAT_NMI. NMI (FEAT_NMI) is an mandatory feature in
ARMv8.8-A and ARM v9.3-A.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
- Adjust to before the MSR patches.
---
 target/arm/internals.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd3da211a3..516e0584bf 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1229,6 +1229,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
+    if (isar_feature_aa64_nmi(id)) {
+        valid |= PSTATE_ALLINT;
+    }
 
     return valid;
 }
-- 
2.34.1

