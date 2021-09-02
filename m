Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp149835lfb;
        Thu, 2 Sep 2021 04:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymWhc1HzmWRk4GNt1bkbSGnbYTD3y44i8pOjvpOAxe7NiiVb+VIsyLeNlirGwCR6nrV2fx
X-Received: by 2002:a67:ea4f:: with SMTP id r15mr1396137vso.26.1630580958866;
        Thu, 02 Sep 2021 04:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630580958; cv=none;
        d=google.com; s=arc-20160816;
        b=IjlGKnDTGxtYumqtrPsqhyjQI8fbzoAZJI9q7/O6hG7OU4vyl8OpzLQrTUai6AiT+a
         VtORNMEEhTdvm2rOZ/oMEZpop/cY4oku52yiCFsdk6BlWwb/NUb35rjfCS2PQaxCT7tB
         NPzUrte4eCnKdK5RlQ9bAL2t2obCk6QsxTlkrdkirolEejAdPTO05OML4EpTegLg0Zzo
         AkPPhKHhqqSRk0LGOCogrNlmDxvAGXkn7Dy0u4BFZjXzClPFWx7azgOVu6zy+3JNQ1NQ
         OJcpkvKGC4TEF7l0c+gnUpGbODd795SSj2HO2I8KvBBSIuyCICRESaOxfaXkqUwVY6HM
         j+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=U5sy2zOq1/+qfafzmb4raFMTgh24+6h0uEJhxyCCkSI=;
        b=u+Zns4VSZsNu14BVUmOIlN0DDjC1yd4UtbFHa754jBNu37x2KIh162D2QiSwwmbuqu
         Kkq8cPm6BmI0tl/mdtC3xSdOGPjkBV06rXGsf+ENkOyyhtMst2ttW6yxtiBcnjrEjLeH
         /8kCTZ1ku0RiT1fZoXxpWs1GMkGrES/9ocSGNsdhiyx8UUe1uomvtYsxCIoefMtPxYfI
         HlbeqX5l/oqO96iCbIK7s2p2/8AWfrwgIU3qp17HaiN1M/bcZbHxGRtMICWOLlBjLRqH
         N0YRAiYlkTnWeIyob1XNMpi/F8jmq7kCiuuYrldT1ecp8npcUrUKlGPDdIducW0vS6TT
         A9tA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25si473893vsk.18.2021.09.02.04.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 04:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLkas-0007xu-7l
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 07:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVa-0006zA-G1; Thu, 02 Sep 2021 07:03:50 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVV-0003e1-Pb; Thu, 02 Sep 2021 07:03:50 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H0dGk6GHsz8xfN;
 Thu,  2 Sep 2021 18:59:26 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:03:41 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:03:40 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v8 07/14] machine: Use ms instead of global current_machine in
 sanity-check
Date: Thu, 2 Sep 2021 19:03:23 +0800
Message-ID: <20210902110330.18036-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210902110330.18036-1-wangyanan55@huawei.com>
References: <20210902110330.18036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tlq32czAl0Z0

In the sanity-check of smp_cpus and max_cpus against mc in function
machine_set_smp(), we are now using ms->smp.max_cpus for the check
but using current_machine->smp.max_cpus in the error message.
Tweak this by uniformly using the local ms.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0df597f99c..1ad5dac3e8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -881,7 +881,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     } else if (ms->smp.max_cpus > mc->max_cpus) {
         error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
                    "supported by machine '%s' is %d",
-                   current_machine->smp.max_cpus,
+                   ms->smp.max_cpus,
                    mc->name, mc->max_cpus);
     }
 
-- 
2.19.1

