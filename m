Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp391174lfy;
        Thu, 13 Aug 2020 03:37:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4YIuLcjx2NGmughRR+cA6VxN0sqlAbzFcvfEAmNGs031fu2lMvyZ4B3GGht/D3xvE11kb
X-Received: by 2002:a5b:411:: with SMTP id m17mr5754762ybp.492.1597315038960;
        Thu, 13 Aug 2020 03:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597315038; cv=none;
        d=google.com; s=arc-20160816;
        b=QLvSyFF8og+lJdQXZAd4Z41wBQ/XNQO24KQfDAOyZfsxExN7VJcGkydUizM0a7LupO
         ZLIYQ1WrF3lFMeRNGO4AmtmKEE62CXiAgzgWYlj51bJ/LXmfcggNOAO5+f2zgMcNJQ9J
         DTrWQVrIvF9OlYoELIIis2C/jj+05oggqK5FzdCe0UN6OJnMDjfeFQ3n97mz2C621fLJ
         9DkggbmgA1C0wLzutPHXcUzKUtCBqYt5i1EzSMoSAV9maxD42ewlYypjSzD4CCdazzVL
         We3tGnOjJZVriKxN273d0Zjl38M04WgV7PdZ05HdLIT0AMjj3MIhvEq68Xs7RLM9Ti1x
         hyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=1x8TTwetddITN3bdfRXu5UbySzzkoS1lZqQNWkjRQ3k=;
        b=e+wWnt0cfqwwhSYhKxdR9QVkYp9+BQXOUNi4cPIQ3tt4Ha3rGSQfMDtUwIS6DIgGn9
         6FgYbcLpXR/pI0Ws3mUWck7vSyBXyv+ik0N6n31AT0QvqJvC/9yfc+h+wff3KQddkPbr
         uAvmeT/+8YNWMs6LMUG+SSsB8O+mVj7wjQ4U202XWtNfMvQiJHnHqvDWlTxa/zP/KbvC
         TBRnZS8Ma/rwCu6Ti9Amf6MZHMIECA4u0/Pwt7UQaWzdV/FjJi5I761F9QysKagJYmnW
         2MLo6kvYWganHiJ3rTdIrWh/G1AnAtQWNBRPdmJdim344XFHeRTRTsV98URBJNxXksCj
         a+Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si4840054ybl.5.2020.08.13.03.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 03:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Abm-00087Y-Ac
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 06:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXI-0000IB-B1; Thu, 13 Aug 2020 06:32:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4188 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXF-0006qZ-HB; Thu, 13 Aug 2020 06:32:40 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 378D9D8E5E5DE70B5005;
 Thu, 13 Aug 2020 18:32:32 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:23 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 9/9] target/arm: Add more CPU features
Date: Thu, 13 Aug 2020 18:26:57 +0800
Message-ID: <20200813102657.2588720-10-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1W8BiuZxzx3q

Add i8mm, bf16, and dgh CPU features for AArch64.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0f620e8afe..9e2ddbc3ed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1319,6 +1319,9 @@ static struct CPUFeatureInfo cpu_features[] = {
     FIELD_INFO(ID_AA64ISAR1, FRINTTS, false, 1, 0, false),
     FIELD_INFO(ID_AA64ISAR1, SB, false, 1, 0, false),
     FIELD_INFO(ID_AA64ISAR1, SPECRES, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, I8MM, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, BF16, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, DGH, false, 1, 0, false),
 
     FIELD_INFO(ID_AA64PFR0, EL0, false, 1, 0, false),
     FIELD_INFO(ID_AA64PFR0, EL1, false, 1, 0, false),
-- 
2.18.4

