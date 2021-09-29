Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5492560lfp;
        Tue, 28 Sep 2021 19:58:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuRFFAlbtMCK4HnJfA4GZGHp3D1Pl15BI84VFQn43bV21bo7AGeTgzpLdnziVUdor3UR4D
X-Received: by 2002:a6b:b242:: with SMTP id b63mr5954698iof.133.1632884338696;
        Tue, 28 Sep 2021 19:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632884338; cv=none;
        d=google.com; s=arc-20160816;
        b=PjXAu8vpB5MLBeeo9q1KWpo+dEZtQW6Zbndq9zIIPqCLm0ALoA3Y41Oju2S0Hu5VzL
         UuQ1zLy4XKCQ+xsD8o5szbbjO1HEiblR0jtV4xFLF53DuZLr8RluuTMqHzCGczAwjnoR
         asGYsZ475vF9Kf7MfZ8NTyPKkqGEIRubJFqcVFUKlET15sFzT/1m5YzR+lvP7IqRz8uS
         1fxnsi1PyfzYUiFrwXxaf/k5XFd4uI/dHvsl84SjP3JkdBWxOQWZpQCbT409JCVzlp01
         rf6+HsGGtqJSVjvhuDUzCLRy2f9NdYnB5LcvrXa6vkoB/cBspt+QNuWbyhWFQReYANGA
         W/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=skAfVaVRDPlUgjt89w2g1U1D0r7qbh8//fIuhtB1dMY=;
        b=XT5A9cMRGVgZ3vEnM4BR3v1pq93KchjpJgE17UudtAkAt5nQv8MfeAtmuDztHN2eOT
         YGWd3xhLFBjw33L2kCUBMSFBZducpEkT/kEko6IBGIKyiAixJZV0d8qYYNIo53w/8CTQ
         H0wKOEC7RY5ZTJMfn6TX/gjUeFsdAyA+4rI5ChLPtr24Nizx+XCjdXSIafqZd5n5mhGo
         hDWs5tNLJEbVhf1+9NDJ1NOdjUi2ZL6FZLc6MwMVr1aQwEQV43v04VlUzrAz5mmKYupQ
         t246hcJtpnyUAXMVtEOl7lEI9iroEpEsPptNwV8qccsCiOhqDSfCWi9zOKrAm32iSbI3
         JqYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24si1124078jan.84.2021.09.28.19.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 19:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVPo9-0004z6-QZ
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 22:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPnu-0004yM-MQ; Tue, 28 Sep 2021 22:58:42 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPns-0005m7-9s; Tue, 28 Sep 2021 22:58:42 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HK1JK4LjKz8tS5;
 Wed, 29 Sep 2021 10:57:37 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:29 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:28 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: [PATCH v12 01/16] qapi/machine: Fix an incorrect comment of
 SMPConfiguration
Date: Wed, 29 Sep 2021 10:58:01 +0800
Message-ID: <20210929025816.21076-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210929025816.21076-1-wangyanan55@huawei.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ITqNb7uY7/IS

The explanation of @cores should be "number of cores per die" but
not "number of cores per thread". Let's fix it.

Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/machine.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 32d47f4e35..227e75d8af 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1331,7 +1331,7 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per thread in the CPU topology
+# @cores: number of cores per die in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
-- 
2.19.1

