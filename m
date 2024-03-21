Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp490789ejv;
        Thu, 21 Mar 2024 06:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhGfkPZ9oapUDMg881F2nlfYigFmDw1DEKxXHoU3vBGfuD8pEdjWP6PwjJfat1ZPVhgB65B1s460alGXobnCLQs0Q8y9K6
X-Google-Smtp-Source: AGHT+IEoSBnPnqIA4r470avOOrCOkpWgvJ+ZpIgAheOeSv6auSVBTfGdYVwTanuTql9B8kQpvpqk
X-Received: by 2002:a05:6808:1242:b0:3c2:4de3:2cd2 with SMTP id o2-20020a056808124200b003c24de32cd2mr2083393oiv.10.1711026788724;
        Thu, 21 Mar 2024 06:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026788; cv=none;
        d=google.com; s=arc-20160816;
        b=qkLC/QBsf7PoHHehqeT+OT5E/6HyKUM2G2v5VWrIXFhB3QgXCw+TYUAVTOiAUDnVwN
         vecZ06VuMTzJm8CW1DjzARndKN3oO0JSxMdUFsJQ9TMwRnN7ocFX6h2f4lI1zZRmlUV5
         VLhLnzCHDAWX2B8fNQA/032PNzsWptm3nQ9dEfDgA9WEkeWIIIAtdzF5jFQZNN8CrkTp
         g2YRVd9bao+y5dymY5aUnawkgUaPtQ2GSFXGkxkd5xAm9cmzq+ryw80A7AMnvEqIwFLt
         Y2SONc7/DoO9DbtdwB+wWpFjgc30R6InLMU8Rzz1WfOenAoxI9rgP0HGsvWLf7HUUqdY
         yAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7+CkH2sAC8NKkG7RpWbt4+5J0vqIU16z5lht9wCK9q8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=OqB+FkTOJZ8mSPas1LIz/jlAudEmuxzUY3KJKMgoKUEQq6F6HhmrZ6DE/AfUsX8RMz
         JToiLiTWKZaXvjfOphiHVQEHNyq8+4bRDbLitADsFdyHN8a8pjtB4Gck24RiggllnYGQ
         q2mjDxKqC6xdkxnvDmhJfQEVKcN0GaHa3HQdSxufWPis7xN1+wozTW+yn7TxJUJCp4Kh
         EvTQ0FnXULOHyh2nBDrOqGfj1dbUUegKf6EL/xNzfVpumqeDRzf93acBR9fFc/9zoXbF
         +gRCyxS3hwReN1HouFakmco9AUUs3UdBPOAeU96B3eQEPv898CwBY/6YjqqZYnTxRX1j
         P43A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a144a00b00430ec9e6b59si5290360qtx.98.2024.03.21.06.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rnIAr-00078c-Fi; Thu, 21 Mar 2024 09:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAp-00076o-2U; Thu, 21 Mar 2024 09:09:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAm-0002oR-7G; Thu, 21 Mar 2024 09:09:34 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V0m2q5hCdz1xrhT;
 Thu, 21 Mar 2024 21:07:31 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id D2BBA1A016C;
 Thu, 21 Mar 2024 21:09:25 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:25 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Thu, 21 Mar 2024 13:07:52 +0000
Message-ID: <20240321130812.2983113-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
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
X-TUID: uxe3GjM/KAIx

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

