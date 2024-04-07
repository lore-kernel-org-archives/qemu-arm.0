Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659273ejh;
        Sun, 7 Apr 2024 01:21:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3nIUXp+3eDKWYU4FCEEEewEvhF9CBvmk30NcUL6UsKv8qpsPx26JPeU0N1H/WMF5cDSBdAwmumFLuRsNA8oHzEH7VuTuZ
X-Google-Smtp-Source: AGHT+IGbivKcZC9BdysorQJDwLfu6FI0hiQjazMXeHoaU+PBFG3v/mSFGjYalnqD0XZxBuJ6Ul8J
X-Received: by 2002:ad4:5cce:0:b0:696:ae27:9d4a with SMTP id iu14-20020ad45cce000000b00696ae279d4amr8025159qvb.52.1712478080201;
        Sun, 07 Apr 2024 01:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478080; cv=none;
        d=google.com; s=arc-20160816;
        b=l3+q/8nfCsZOr1tFW04fBQb1qfnfawjWgud/MhXmp6Q3qwDeggu2u+2fX2hIcmTc7W
         S3+mHdZUhMxldNryZp9jpFhYU4pCqJ5w1AAqRF2o9TaoN0XiaWScgsbau2Qs7kjAmPcu
         NHljLmYpcw66nC/AAEunprRsQ3EbFbcPMP/EvN7PDXn2RFOuNj+UFMwMOwnSp4HKv3Kx
         TyBXAu2trftExoTZLfuMaKo34IOI0VBvTZw5E4+qlcRzOdDGJs2NON5hgMrO9tEc3/2D
         f/YRTQqze50IJ9p9Q2EU+g5ajeBlJnP3pV9QABeSXV9XzR/XXXmFdfC0xF/uIIChbvFF
         YuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=s1kM6v0G3IhhZMz3Via/9VRyDA7mZKjHttOyMr8uOMI=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=PuhqFe9PbuAKH1izNViu4wKbQhimIDYRffOVX6vSlmPRbi1COu4h6avXlpDaRfdgkT
         0/IdIINJYQd4KzW6KflukQpzFbavFTKZGgykA2u1y9yq9sIUUXNPFhlzvyUxEjvj46MI
         sN44JkYwImie1GyWDXx0RPz+Trh9A8N+ztN/FIE5716DNEVl07HJtvZRlxLAQSYTRDFZ
         hLKU6+upoaOBohm/RXx4Sf4YxCE0GumTCmVacLHvyhTJscw1m/6PsLm5KnEFO4NrNbV+
         X8lqu23qogqp2WViSuC+YYwMSri/8KQGfCxD/ENnf1yKfLLa85CMUyVa2Q21hHcl7WFn
         V+DQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do1-20020a056214096100b006992b6a1403si5621725qvb.401.2024.04.07.01.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtNku-0004Ee-QC; Sun, 07 Apr 2024 04:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkq-0004Bc-Tc; Sun, 07 Apr 2024 04:19:56 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkl-0001zk-JZ; Sun, 07 Apr 2024 04:19:54 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VC4pR16P4zNn65;
 Sun,  7 Apr 2024 16:17:35 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id DCBB9140154;
 Sun,  7 Apr 2024 16:19:47 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:19:47 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 03/24] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Sun, 7 Apr 2024 08:17:12 +0000
Message-ID: <20240407081733.3231820-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
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
X-TUID: pqg93jNPZ8Mj

Add support for FEAT_NMI. NMI (FEAT_NMI) is an mandatory feature in
ARMv8.8-A and ARM v9.3-A.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Add Reviewed-by.
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

