Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp913274lfb;
        Fri, 10 Sep 2021 00:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+iPKJljEsBjdL91/CO6I01Vq4e4SyG2ZNZydQ6gZnvFsdU4MqNkrZxSRETVUHDyLpdOyw
X-Received: by 2002:a05:6e02:503:: with SMTP id d3mr5649978ils.107.1631259658946;
        Fri, 10 Sep 2021 00:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631259658; cv=none;
        d=google.com; s=arc-20160816;
        b=llfPlkIOJikQISwunTqkF+NXtjgudRTBh0MKbxOqjRDuzGvIuC/8LO2nnf3+pHYBrU
         a6H5qODgJpVghN7bsmRd7rYguAmg9gji5/zTSYImEf9n2pBSOXjy+0MBShAiD2FKI7jl
         IDkflmIGs1GdrDSQyYBOXa9LkCHPU9wEfZqNP4xNoSCqLucN2cqSjojeAV8YU5pQSw3I
         GqDLz/ZXjYftkRYvHvuX6qgA0Dyi0SDL9hTXnW5wpAK99L++W+2w/96UUcUW3ODu3kZP
         TdOS7I2Jd9vGXmaIU+cb1andRerHJnzizDfYBT2NDHQWUIyShSvSTcjFi/EOAHhIUp4d
         yViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=u/FjuUQjQW9vYqRdwIHjivBphNRpOtzmqeSPVMQJ+ps=;
        b=exfcfYlBomDCpNhlbJsQiqci4rdHpDHQ0pgZhLqCjWpS47rlUL7oG/yzM7xyh9mBOs
         CFTEp2iMAFWl0bgUw4ppNcbw9CJmPRk5gIbVfutUel/qMkjqVENQ17ecUwJusTa/iWRE
         JsQ1P8ZHZKjItiXVkVc76WYIqNiTrzGo3B7V0VcwHXUXzqlApjDZNj7Dmiz579Dd4x0x
         pStt0xwtvHCZPn3mF/Eain7jfm8j//sILNUrVEARr7J77xxAR1WGnvfEoxjkOZhAkiEK
         poTK79Af+LJbgQ8zaRh4/uMIKyEsgOxB7V+gtq+ulIjGPAZK4T6qbO0RSym/SbIsCfX2
         uCBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si3924968jae.22.2021.09.10.00.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 00:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:40344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOb9e-0000NX-9h
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 03:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazr-00055a-Rl; Fri, 10 Sep 2021 03:30:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazp-0000yf-1P; Fri, 10 Sep 2021 03:30:51 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H5S9b1Kr5zR5W1;
 Fri, 10 Sep 2021 15:26:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:41 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:40 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 09/16] machine: Use ms instead of global current_machine in
 sanity-check
Date: Fri, 10 Sep 2021 15:30:18 +0800
Message-ID: <20210910073025.16480-10-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
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
X-TUID: jSXis6cqbTkv

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
2.23.0

