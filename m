Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3254005lfq;
        Mon, 14 Dec 2020 23:20:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3OHj1/RE41BZZY3roxXxmT3hQBXivNadLDfDtLpeCVTY01X8zB511V+1Ehrr4rf2r2oHz
X-Received: by 2002:a25:7083:: with SMTP id l125mr43065497ybc.250.1608016849148;
        Mon, 14 Dec 2020 23:20:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608016849; cv=none;
        d=google.com; s=arc-20160816;
        b=Dgt4bpl9SG5h3vfgMOgoINQbFEtn2EVgb6JBdtb6bBRvNJCFPLrNu+VtDbydQyxhhC
         CEy+BoWCgi30/rkjB1o6z/9uX+1PGNcyIN1tC0/JFqmO8SJa9P31oWmOdCw1TCBssGH7
         m5MjbBZU99mVvtUaYHiPHTSVWgy+Y8/+6Bo1AuMAXwpNsVDTK3gJqQbCF260fLCNIqQR
         mol8bHLOQzHimSgPy0v909RrwZHRolrpieSMbUFQXApkP8fn8gXjRBG5qY5iq6UGz3q5
         1BkAQDFuH5EYC2oXhupn2y4/+6vly+gphfqRRHauDw6U2jRoF0IvTyYmrSifGjfCkXo+
         pTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=xMmqd+mu1RoTrMqXS/5YMpOTeuHgGcIj4vkYUa7KVvU=;
        b=M4HQbJBx6ZwGIM1pq20q4cS3/tFUSda+xzhGxbgEBUrUdfdytPW/G0smIFT5AyJdib
         2E10k44o3OmyZElO2FrL4/H/lTgirEEyWSA1Uxhsc2vwThyN1J7+TmmAQdzwlD2vNjNa
         R8ysOKMCeyKPwWwdR5c491dhe86eJamI9Oxd4na+TVL50WHUd6fv4A8x9KE+C1EWVc6m
         IMIFA1K0zFo3ebdMmBN1QOje9LyJSs9+V4wREpeNU8OCoGthPL7B8ZG8M6EBcnM6mU1I
         b7EveAIj3plpW0dlwMxDC1G0zqTnrFrHZFrhej60yk7DS2K7WzXXs2sZ/oF+luBhw0Zn
         lgBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y63si19102267yby.344.2020.12.14.23.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 23:20:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp4dc-0001QN-Fe
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 02:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4dI-0001NC-Db; Tue, 15 Dec 2020 02:20:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4d8-0008SV-FF; Tue, 15 Dec 2020 02:20:27 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cw8lR607jzhsXP;
 Tue, 15 Dec 2020 15:19:31 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 15:19:57 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Peter Xu" <peterx@redhat.com>
Subject: [PATCH 2/2] accel: kvm: Add aligment check for kvm_log_clear_one_slot
Date: Tue, 15 Dec 2020 15:19:48 +0800
Message-ID: <20201215071948.23940-3-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201215071948.23940-1-zhukeqian1@huawei.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: puYc2IIl/I5B

The parameters start and size are transfered from QEMU memory
emulation layer. It can promise that they are TARGET_PAGE_SIZE
aligned. However, KVM needs they are qemu_real_page_size aligned.

Though no caller breaks this aligned requirement currently, we'd
better add an explicit check to avoid future breaking.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 accel/kvm/kvm-all.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c5e06288eb..3d0e3aa872 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -701,6 +701,11 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
     int ret;
 
+    /* Make sure start and size are psize aligned */
+    if (!QEMU_IS_ALIGNED(start, psize) || !QEMU_IS_ALIGNED(size, psize)) {
+        return -EINVAL;
+    }
+
     /*
      * We need to extend either the start or the size or both to
      * satisfy the KVM interface requirement.  Firstly, do the start
-- 
2.23.0

