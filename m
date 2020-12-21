Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4596102lfq;
        Mon, 21 Dec 2020 04:20:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+lxGyUgAEvovPejpgKNUiAmbKAuIOYZ5E+KMNWy2AvmHZcUeWcE7CGEtp1EcmKNnSwMLH
X-Received: by 2002:a25:25c7:: with SMTP id l190mr21555059ybl.177.1608553201067;
        Mon, 21 Dec 2020 04:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608553201; cv=none;
        d=google.com; s=arc-20160816;
        b=smOciYBoMO7lWACYncTe2r+a8zO5Hz2VD4B/ovo08Hs8QmLq30qHyIENq0pfWjcYwg
         vB0KHO6+Lfa8uCnM/O2Z/G2XD3g0pC/Dwop4jRCRZhzzN1OCFAlgHJACwsSDIahHcsdo
         9hJTJnCbaTDX2sRQCYjR5vT6P9oYj0d/beba4KbyoyBLvsgGKfn3KR6d+odD0ZJh5PxH
         R5VmgTaMdmXkBB9njNyvy/HQGVo/HOkKV7wyapIAoO+hfMsIOMpU98C65eNZTcEIp0+9
         yZRq9AjyR8S1m2bFbGr8AE6ur/W1PWtgvtxjB+zRzup6iWPWH34xNJI9LS/DIaGoyCNv
         DYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=RknZFEahSRbZi/H/lznrE+6ya5TxfeGBsEuO1L9ucTI=;
        b=CVx+OwdFHU3a8b+8DWmx24pT2deSKkoLhRvY4tQUkYGcWoJw+Rko25RYh6g2D6G7/g
         b/+NPWVygklWfE6IuAA5cZq6zKzmpvrR+x/xfJ+9pe9i8EusoBYSqAQiPL0yF1uDyVK2
         tt1wrMXqSMqN0rNH6ukKep90OMHHUJ2EvWPFNLq57MZs6nsRJLld0hMo3x5EqxPI2p+f
         YCsJxG8qtm78+WyRbyPvaaUDasQlbjhuSv0K/OtQ3/OTQYuwu76fg8CA89zoZS3yichd
         4MbL81+gjgAWYUUtb7MRuk+VrSKBAJIl6iIDuOeT+pG+Zl2zBG6RC+grrS7P4/vBwKwn
         QNow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si15204857ybp.485.2020.12.21.04.20.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Dec 2020 04:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1krKAS-0008FH-GU
	for alex.bennee@linaro.org; Mon, 21 Dec 2020 07:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1krKAC-0008Es-4B; Mon, 21 Dec 2020 07:19:44 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1krKA9-0006jv-Qy; Mon, 21 Dec 2020 07:19:43 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Czz604rV6zhwKc;
 Mon, 21 Dec 2020 20:18:48 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 21 Dec 2020 20:19:22 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>
Subject: [PATCH] Docs/RCU: Correct sample code of qatomic_rcu_set
Date: Mon, 21 Dec 2020 20:17:45 +0800
Message-ID: <20201221121745.27156-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tRbrHpMM4sQQ

Correct sample code to avoid confusing readers.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 docs/devel/rcu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
index cdf002edd8..2e6cc607a1 100644
--- a/docs/devel/rcu.txt
+++ b/docs/devel/rcu.txt
@@ -392,7 +392,7 @@ Instead, we store the size of the array with the array itself:
 
             /* Removal phase.  */
             old_array = global_array;
-            qatomic_rcu_set(&new_array->data, new_array);
+            qatomic_rcu_set(&global_array, new_array);
             synchronize_rcu();
 
             /* Reclamation phase.  */
-- 
2.23.0

