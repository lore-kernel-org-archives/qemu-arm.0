Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320253ejv;
        Sat, 30 Mar 2024 03:34:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDaKWdScvvg4hpnbp729AASMMuU18OwR/++ppB5MbX8UVmPEO69D+k7ARLKyo0KI/eW+6FqzYy9laE/9uwtSwBfdWn1J/s
X-Google-Smtp-Source: AGHT+IGJXfZb5CF2Vy/PXLdnPH5f/3RnuG3b10qy6X3arUsvtclbzBge2QEw0y2WiYYvGy6CR6lV
X-Received: by 2002:a0d:db52:0:b0:610:89fc:ab27 with SMTP id d79-20020a0ddb52000000b0061089fcab27mr4568851ywe.51.1711794878059;
        Sat, 30 Mar 2024 03:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794878; cv=none;
        d=google.com; s=arc-20160816;
        b=kkMBIMrTbaC4bEsjCRvtEucX2lumY5nW43/D94Uk76EtRSMFqLeMuckcD4d/Y6hKgL
         W90dyQ7vqhfMOvYsT11Rob0lO5ZlAeqRyHHPMISd/dNhdodI+jf7now/Nef3BtivMcRn
         OpPRpUCY4NZ7hxK123SqDUzrg/t8yqgP/cMSeJqgyzE4jTsh0ffAzhKNGCR+AwISPjlP
         7l4CFf8/FDMZR3RRM/unGSjldCUca+xTjMcS3oJUu5TanVN5G1M0qOkmFxcakv4TwcDI
         69o5ToAJ3rbW4UCh7UQ7uIH5jrHlkakKv/15ILqa5DtA6MJUtbsLR91wC+YIqU4mAm/d
         84gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7+CkH2sAC8NKkG7RpWbt4+5J0vqIU16z5lht9wCK9q8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=MIXt15PkDpQDEMAXalcYnh74auDVI6vDZO6fPwmYj/t/SXXtzB5RBqK5R/zYKQOtks
         kcZ5xpjgvLktPedIzbjLxvlrzTggkwBwGmYZ+IlCWZoQtYscP87jlQFVc/xHqcVfxkd6
         iyBwgd6sxuzGNnvr0Oh3dUTZMffAEo4UVx/mdobGOboyIIUasS4QonMKTvVaLTd8CSO8
         sJc5GcR3RJOkADRXydYrm5sMsmUZ0fKkuwE+x8k3kIs92/6BgOwSCfP1YVSxn41tkg0O
         j+WX86nB2G4Pf4xc/7l7ITokvJT0YR+ch9m6qZaPpSNwBJBVQdjIXEd2guXYDsTeHRaA
         zGMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi31-20020a05620a379f00b0078a683dabf4si5449069qkn.699.2024.03.30.03.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1I-0000GX-CU; Sat, 30 Mar 2024 06:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1F-0000CV-8I; Sat, 30 Mar 2024 06:33:01 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1C-0000jH-Hi; Sat, 30 Mar 2024 06:33:00 -0400
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V6D764M1xz1R96M;
 Sat, 30 Mar 2024 18:30:10 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 15A591403D1;
 Sat, 30 Mar 2024 18:32:53 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:32:51 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Sat, 30 Mar 2024 10:31:08 +0000
Message-ID: <20240330103128.3185962-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
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
X-TUID: MUNeMKT8ENC2

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

