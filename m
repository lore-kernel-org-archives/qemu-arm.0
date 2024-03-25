Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564165ejj;
        Mon, 25 Mar 2024 01:53:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaz1gNS4wRMf84wY5fu+f53O/2wzmP3Q8T8R9qVshEtM9S7JJJDApF2WNDlDbBzZTdXbiFQmRNUGWIhP3yS3r+uNDJ/k1M
X-Google-Smtp-Source: AGHT+IGqsBOlT1Y4jnXSNKkqB4JLcUFJT78lWof9LZlawDH/bhUYo95Ak43YtZYe8JIFC3yiORKk
X-Received: by 2002:a05:6214:d87:b0:696:80a5:7754 with SMTP id e7-20020a0562140d8700b0069680a57754mr7159024qve.19.1711356801517;
        Mon, 25 Mar 2024 01:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356801; cv=none;
        d=google.com; s=arc-20160816;
        b=heYgbuCeRFnjYWt8JaU2G9naYgLn8lAgcLaDmuJgtJBycR/11sZWksRML0qXVJGS9W
         NvVs+lGKH7jiOVpXHc1Bwh7YX+YW6syu94LPIHJIfhcIgWw7Ry7Ru4FngFv5qLiprb+N
         s9zqdn/4mQK4ycdGrWLX6B44a78J1U+AngUplGaMDWpe+siyNRMhKQSrDxY1MES/EoDk
         D+ELRWnAvEYEMZt3iagt9o3YpQB8/cL6BzpcExo7womSA336dIwQX68MwjEzpJIN5r2s
         hju4zzM1nsWPH92aQnQv/WZHaCyHKXHJonUQ9SfwR7A9h62C0XW5irJpZtaWbeSSL37S
         GB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=k5he3KbuU0aQb3NIxw0v2uFa5DVp1OaW1YAk8IXb+vo=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=si5sPqFYI2hEG+E7lri78pUcUiGSTdO0Iz0RCp/HPYHF95ciEKU50Gm9Dbf/p6cKPz
         guv7T91mnNMJfIAadN1jeLBitQPoJb2AoubzuRBgHJpNV1ue2cSX/La9zHMc9fRxrgtJ
         rNPflANK5eSbzOaJMEJAHyE9U5UPKetXjKP9MmuVPXOxJMdCSZIBzNzqx+pxhs5cUDAZ
         M+ojdaDm7wTk8CS1qxncq1A4nr/RXGk4RBTg2OW3rtbsVlMKji1XPtgKuGsLTiMRACTl
         dZ4/FWI2X8RtZxyyTpl4IoXDFfgx0yKlxGExl+IGV66XAZjun7sj0kTqLAfoaTsUg+y3
         MX4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo1-20020a056214500100b006967e455b44si3898832qvb.352.2024.03.25.01.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4U-0003HX-6p; Mon, 25 Mar 2024 04:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog40-00034Q-HE; Mon, 25 Mar 2024 04:52:17 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3u-0007RI-Ts; Mon, 25 Mar 2024 04:52:15 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V367F29b3z1R83k;
 Mon, 25 Mar 2024 16:49:29 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 58CC31A016F;
 Mon, 25 Mar 2024 16:52:07 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:52:06 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 20/23] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Mon, 25 Mar 2024 08:48:51 +0000
Message-ID: <20240325084854.3010562-21-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SQp3Moi5Crn0

In CPU Interface, if the IRQ has the non-maskable property, report NMI to
the corresponding PE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v10:
- superprio -> nmi.
- Update the commit message, superpriority -> non-maskable.
v6:
- Add Reviewed-by.
v4:
- Swap the ordering of the IFs.
v3:
- Remove handling nmi_is_irq flag.
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index e0dc76df2f..4cd84b142e 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1015,6 +1015,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -1053,6 +1054,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
         if (isfiq) {
             fiqlevel = 1;
+        } else if (cs->hppi.nmi) {
+            nmilevel = 1;
         } else {
             irqlevel = 1;
         }
@@ -1062,6 +1065,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

