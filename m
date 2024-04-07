Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659590ejh;
        Sun, 7 Apr 2024 01:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULiBG2qe4PrJoPeUKYwFwXAMJ7osSQJ1sfK7EXBuUDX4LuL+jBnF1EM03oiv4rbKKkgE8nb6jNY7Cn5nBuUOKRKVxdUoBH
X-Google-Smtp-Source: AGHT+IFX5S1NsVLd7LiTzpTLBt/3qKbeBr2pGtEPphY30Flnc1iPQgKevfsJbFgropyarjdN78Y8
X-Received: by 2002:a05:6214:2466:b0:699:4064:82 with SMTP id im6-20020a056214246600b0069940640082mr7503906qvb.47.1712478143635;
        Sun, 07 Apr 2024 01:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478143; cv=none;
        d=google.com; s=arc-20160816;
        b=Hngbb2tdsyHnVqVeq2hfFWmDlM2xF7w8AT5s1iLjM1uSsUR3Yynf7bfyRrE+Fp7Vcu
         cJXLeErmFb+0j9pi0G3gJr5nhxVhgB4emhtl8YsxLgmTMgvUh0OpgNY1FQD2Q23rUElG
         TMBnsYuuT/yYFMTbg/GYMUFLIr7zPw7IeU1sYf1o2xaex1ylgNwO145gG/FMm9vadz1f
         TIwXkWXT5RQ1h3l1AphYe0Qt89Tth/82OZT8rWkyz1lNqMb2cbkROwU0oJ+lmuaQ0n0p
         oVGPkmJdGDkFrIV9ive84F+MvVd9xIevOCQKbBvR4Q3rSeHUKr7GWYlUW/9T5w381vmv
         NonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=DE3i9I4GjVhlAsGz+1NNr15EHTybCxRnpE1XObnr7ZI=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=wXY+L2dX/FmKgzwLG2G9sLbao0MT+rBF6gLCzCgqefms27RT/j7KFMAmYVMpj7cZEu
         9WByD3du0IzQsRrcXQYkP9o+RVUDuCQIk7trli5m66+oyLeRDVJdANPAUXwsnQY//ztb
         XtXKU44BC1IHjhdIg9FdDUQK58MY1wb00dk4GJyZluu9aBntm6T73zabn/c5flDKd1Vm
         g9N8gx85VB2Tb+3oVfgxATunSAvtmKIM3yUOlmRpEChBEAllRelLYL6dUHj9a/VqmpLh
         Yu949qqTReYme9xV9rmKrD8G26hknZwHqw7gqsYbSpNhHxHy9HtlQTMx/PZLvIAQZnwL
         udfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a0cfe8d000000b006992c797ab2si5823312qvs.551.2024.04.07.01.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:22:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtNlG-0004OR-6C; Sun, 07 Apr 2024 04:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl3-0004Iq-Id; Sun, 07 Apr 2024 04:20:09 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl0-00028j-TL; Sun, 07 Apr 2024 04:20:09 -0400
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VC4rB0qVDzbfPh;
 Sun,  7 Apr 2024 16:19:06 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id D2F5218001C;
 Sun,  7 Apr 2024 16:20:02 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:20:02 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 14/24] hw/intc/arm_gicv3_kvm: Not set has-nmi=true for the
 KVM GICv3
Date: Sun, 7 Apr 2024 08:17:23 +0000
Message-ID: <20240407081733.3231820-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hh5Yl9gT6mFx

So far, there is no FEAT_GICv3_NMI support in the in-kernel GIC, so make it
an error to try to set has-nmi=true for the KVM GICv3.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_kvm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 77eb37e131..00a383079b 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -805,6 +805,11 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->nmi_support) {
+        error_setg(errp, "NMI is not supported with the in-kernel GIC");
+        return;
+    }
+
     gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
     for (i = 0; i < s->num_cpu; i++) {
-- 
2.34.1

