Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564606ejj;
        Mon, 25 Mar 2024 01:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJOPNr3cKcZWx2c8gMRVMcc3k9lMbr5m4QPT5OyBGiYaIMgucwFLPi7pAM6RwqzSeRSD3oT+zKQl7xBaipt9wFRwRlIr86
X-Google-Smtp-Source: AGHT+IE+IH+T3wxluPgEuqCVHGKVsU6MlGslh2tzT+9BX/caoVwJMOlTYgWoza+ZTBp62HLfD2Ty
X-Received: by 2002:a67:ed0e:0:b0:476:d846:d00c with SMTP id l14-20020a67ed0e000000b00476d846d00cmr2967786vsp.15.1711356880619;
        Mon, 25 Mar 2024 01:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356880; cv=none;
        d=google.com; s=arc-20160816;
        b=lm7JMdPi+CE4Q4IaqDb6NHEFEis1FLMrJNT75uT+YJaWMFrDTJM/jeCVqSVLuEySfx
         sf7wWzOOo/FC/CCVxgme7CE1EMrtxLKcFprE98081BT8svuW1TEHVO/q/QdPp3WNwJ00
         ElEVrk2Knn+RzmmmmCkgBh8ElOvoWEb00hv6tU/k6zMh8q5VbV/T+i2sz9S8nDgkLD+n
         QlAOtVLzWVmuIuBOdGMfFPJBfewWrrSt8o/JWGn/1YwFh6hzoDDDlYQ1HSHuFskNEGnX
         SWE+5kqqjGSlotRErpa9MJ6xgjZOjquKo7Y7X3CBYxRK6c/u2KLUCPPYmuWUdiH8syuQ
         q5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7+CkH2sAC8NKkG7RpWbt4+5J0vqIU16z5lht9wCK9q8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=IefgHY4O2tz2Vc/WRhd1hq1SInyu0xUXhPUr9W1JoJgsCAPktTvFrjMK0XKUqwALR7
         LDJUqz+TlVrVQidIDzr++J3lAHtDVWwSdB6B6Ra4pxBrUqVMeI707Qnd9nsOkADIMFts
         g0eiXGJ7WrpweIeXdsWzzdP3nQcBTCy/8ecKgCOZw7OyxgPx2WSOQxcQXRNk7kvJUixe
         YbU7iK6P2zdHjqznURlweOM2d1VBFEmFln+tZXV15JuBVvOhSAuO4kjwKTo4hXqG0gKR
         yq6qI1EZP0sdIBpGCvlc4zy7/NczWy8a0j7coQ5KS6LztXpJCBJa90l1w3pv9asva1mN
         x/sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05620a113500b00789f242c63bsi4802223qkk.715.2024.03.25.01.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4Y-0003Rk-PJ; Mon, 25 Mar 2024 04:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3o-0002zu-Ix; Mon, 25 Mar 2024 04:52:06 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3k-0007Ne-Jp; Mon, 25 Mar 2024 04:52:03 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4V36790Ywxz1QBBG;
 Mon, 25 Mar 2024 16:49:25 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 743DE14011D;
 Mon, 25 Mar 2024 16:51:47 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:46 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Mon, 25 Mar 2024 08:48:34 +0000
Message-ID: <20240325084854.3010562-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q+SOuiVB8QSR

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

