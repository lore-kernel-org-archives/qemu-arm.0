Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3649109lfa;
        Sun, 1 Nov 2020 21:47:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYyDSnU/xvOUpOpcQnGFI5nb02JajhmsDcwym3QWLuH92o994J/VoDuTZoayZHjwcixwCf
X-Received: by 2002:ac8:3857:: with SMTP id r23mr13333699qtb.236.1604296075466;
        Sun, 01 Nov 2020 21:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604296075; cv=none;
        d=google.com; s=arc-20160816;
        b=EglhpWrMo0OV1pPBJNViZ34GWUC8QNGlFz/x/6rMoLsAT3RFwtMJdMqv1k3WoRYD6S
         Ys/MmfffV+S/ZLrXGTp8Ejy1b7vkDxdNAeVnlGZx5+kaj/ZZsihLBXT70zk/Szsqluj9
         r5R2UQSHsGqXh66uH2PsBpXYfo3WDF52+bebrp5ZCOYOQoxrv+tNQ7Cc+sw8tyry/Bb8
         YPcq1vAMukcFGPJ+HNnAZFvAFKoC2z3CSNtF6FVeDcuR3M4+ed7m/uPKK6QW00eAyyAH
         +sumaEE6EpZ341noK3J2YohOnuvoCXCctME3YSHNiYPmUSS39igQD9Hu1aktPBAhLS0Y
         gnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=oivt7Ddd6yCq75ViDsARlNpbIkiYJwBDnxK01CIHkyQ=;
        b=eUCZbVZGLXUEyJMjpaLHrfwJbYO3g88Y+KPGcAyp1kzWmRCQuzO4H13sCT8rP7rQtX
         bI22IRghvSdlvBx2honHtU+JiVEDUFWKpCbdh5cNiyVnA9UAMvlP+7KjNT3XPb1J68Jk
         /a0+ckbfBbOsN7xRXZ8Gtx4XPcRAIdf9AKOEYctbq9sQPTv9khSoNY+yB6IZRIzR5xQ4
         37YY2BboxbxzJxZQJm8aEdEL3+m9iDO0cgsCFmRWu8hc1Gto7ojJR0zvSU8cuYesHzHl
         KjWGott/0bimmVv1X8M0fGz0Kw+Km2TFUVNKI8MTdYGz1TpYbfLmAfn4vG5BjRQ7IO4q
         ZrjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v63si8404694qki.187.2020.11.01.21.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSh8-0006xY-Rn
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdK-0002Oo-Dr; Mon, 02 Nov 2020 00:43:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdH-0001EP-A9; Mon, 02 Nov 2020 00:43:58 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPhfh3hQxzhd1W;
 Mon,  2 Nov 2020 13:43:40 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:33 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 01/10] linux-header: Introduce KVM_CAP_ARM_CPU_FEATURE
Date: Mon, 2 Nov 2020 13:40:46 +0800
Message-ID: <20201102054055.686143-2-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102054055.686143-1-liangpeng10@huawei.com>
References: <20201102054055.686143-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=liangpeng10@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 00:12:49
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Pn9LDUT4Yy1

Introduce KVM_CAP_ARM_CPU_FEATURE.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 linux-headers/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 43580c767c33..146eaec35d49 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1037,6 +1037,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_SMALLER_MAXPHYADDR 185
 #define KVM_CAP_S390_DIAG318 186
 #define KVM_CAP_STEAL_TIME 187
+#define KVM_CAP_ARM_CPU_FEATURE 191
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

