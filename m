Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2836540lfy;
        Mon, 27 Jul 2020 06:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziTRBu7XqoX3uhL1O4jRg2EoeunWUgRimPPHdrXNsHJP+Qgd3WQEv3YZ6mSMhSm3Kt4R6z
X-Received: by 2002:a0c:d98d:: with SMTP id y13mr20670418qvj.203.1595855030241;
        Mon, 27 Jul 2020 06:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595855030; cv=none;
        d=google.com; s=arc-20160816;
        b=vTP6VQ0EJLMtZ7NYvPPWbHno15zPQOMNT1udw+20uwEQxfOnldd8tMUK1EpBftuEWI
         8YPM4y92SFQwIX5FTJ2iN8Ub2Ac3+XXOIIme/hkNqhrTQS6VownhXcTssoag1fhxD+TP
         EbTNAkMwSAZbDopbhmRfA3l5Y/XAZgX6sVqVufNA/YOwjNvLP46xsQnTd73K/bJAZSjw
         +CZRj/CJLhGv11a1kD1/ujRsIwxIYBhBZkydWq52ZKnzbWrdNotZj9W9eoZcHmfYxK4S
         Tx9Fki/DzLTxuECIrrqiSN2b5TNcoGe3ni465+8HPxq8VgDinPmLIL/GyBZcTyiEW7OO
         0lpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=9XJ4GAyikVPk6VQ4qHJ0LDHEWptAppmqqhvUqTi7ju0=;
        b=Ro/mJb01UNXW42/tLT1My95BPYNEYXn7axe2lPgpDIsvc5KwloJn4xBPMQiKdrltu+
         HcOOfg9DWhHrZNYP64Ogd07ccvVuBAld9YnwqjOGaHdSwb/8oafo1KVWOCmLD64Eepr1
         VbMpmv/9NtPN2l4DnIY6DT0ZPKgv9vo0+Fva15mSQGQzu+TZo2SZy4QzHFeqBHVdSWLP
         dXZf63Cydq7p4oGkMablx6n9MAHO/Coqrq/WSO3mwiDuxb9nCRHpx1A3IX5Q4l5S2p8W
         WIad92ss4KWEdH57OEHvX86v63YkBhZg6A1bKYWUXb0uVm/9K1YFYVGTCxs7DnVc499d
         Zd3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si1492876qki.304.2020.07.27.06.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 06:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k02nF-0006Sv-KD
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 09:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1k02n6-0006R7-Re; Mon, 27 Jul 2020 09:03:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4159 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1k02n4-0003eI-HC; Mon, 27 Jul 2020 09:03:40 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C22D3F64D3A1EA21647B;
 Mon, 27 Jul 2020 21:03:24 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.22) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 27 Jul 2020 21:02:53 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH] bugfix: irq: Avoid covering object refcount of qemu_irq
Date: Mon, 27 Jul 2020 21:02:25 +0800
Message-ID: <20200727130225.32640-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.22]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 09:03:25
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
Cc: Thomas Huth <thuth@redhat.com>, yezengruan@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, Li Qiang <liq3ea@gmail.com>,
 "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X1+EA+b21a7G

Avoid covering object refcount of qemu_irq, otherwise it may causes
memory leak.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/core/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index fb3045b912..59af4dfc74 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -125,7 +125,9 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
     int i;
     qemu_irq *old_irqs = qemu_allocate_irqs(NULL, NULL, n);
     for (i = 0; i < n; i++) {
-        *old_irqs[i] = *gpio_in[i];
+        old_irqs[i]->handler = gpio_in[i]->handler;
+        old_irqs[i]->opaque = gpio_in[i]->opaque;
+
         gpio_in[i]->handler = handler;
         gpio_in[i]->opaque = &old_irqs[i];
     }
-- 
2.19.1

