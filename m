Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320352ejv;
        Sat, 30 Mar 2024 03:34:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb4ROPL+nVJ6d4EjiNPIUew9x/SJjPdcpJgbLQaS46+sdWX1Ihs3yARphnbSrx6JoS2va/VII3fq2b+y7GhfK3kCYnDoTI
X-Google-Smtp-Source: AGHT+IGOTJETnu9wpEzF0LpVLPw4GDwoqjGL/J73rg5m/cEN4d8fO4dIbR2vkKTWZFMQw3R3lOqO
X-Received: by 2002:a67:f286:0:b0:472:d4df:a69a with SMTP id m6-20020a67f286000000b00472d4dfa69amr3477136vsk.9.1711794896213;
        Sat, 30 Mar 2024 03:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794896; cv=none;
        d=google.com; s=arc-20160816;
        b=pt1MMPRh0jy1hxtP56dvvmSQbD4VQQlJvWDQWsEUhD3bkxiKIgAelRJPek/+EDXrEJ
         zuPuppTfdwrVy1RiQyvqPdX0Sg1KCJQS8dIZaL38O/W2Hhe4uT8aMrxQDbX/LHXx0wjE
         Y3AmikUMzrxndjwsOC9ngErPQ+QNLdFokW3VN9xwCSDcVWVD08OC0UsJ5FuSQH5/GQ27
         HvHHp/4pQBPyQAU8KPzWIlnXg6rUGzwFstgBMoQcJj4TWOJktkwZ8FAKlj0By4F2kdJk
         qfVCotWnnEqkL5rcQnyZ2gH1RiVZiyLeamvF428CeIv7VXY/0YiZSYSVAjL+O9wbq+Xp
         CzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=yEk7zJForD7AOdV3HbWkb4qouCLIYsgpljTQnkh09yQ=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=aGWo5oQh+Yc5YwMDD7KbniqP57lOvL6iJVVC3i/Uij5aQVRrMt/NrL3S+hVB01exWK
         T9D3xz0XBNt5jR77TZhWGTKyxHNeBI6pwhhNeK79tzFFtmpHbhO0dHDFL4pBIzYZ5q0z
         QOrpMV1jqPPrlkNcIWvtPSy5ymB7ehqHciwTGdXCp1bqQP2IW2ADK+nTn0uBswkAIt+M
         QGJjhic7VioVBxsKEwP4bVhBjMmukDzOwSj5qXvL+knNcthIVA0cN4MCPiS7RnfyUUms
         mIvKDNCDRD8AoIKUzac6V9git4yCZlS0Eh6V/b5dQhrSi0DE/vH4yW0nd+Oo7coU6YIg
         0+Pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a056214004d00b00696b2538509si5417287qvr.68.2024.03.30.03.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1c-0000Ro-Uv; Sat, 30 Mar 2024 06:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1P-0000OC-88; Sat, 30 Mar 2024 06:33:12 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1N-0000rE-6S; Sat, 30 Mar 2024 06:33:10 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V6D9X0XdDz1wp4k;
 Sat, 30 Mar 2024 18:32:16 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id AB6AE1A016C;
 Sat, 30 Mar 2024 18:33:06 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:33:06 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 20/23] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Sat, 30 Mar 2024 10:31:25 +0000
Message-ID: <20240330103128.3185962-21-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
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
X-TUID: CmOWqZ0w2t+q

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
index a7bc44b30c..6a2491b2a6 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1042,6 +1042,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -1080,6 +1081,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
         if (isfiq) {
             fiqlevel = 1;
+        } else if (cs->hppi.nmi) {
+            nmilevel = 1;
         } else {
             irqlevel = 1;
         }
@@ -1089,6 +1092,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

