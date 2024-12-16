Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2376287njb;
        Mon, 16 Dec 2024 09:55:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgdygljFO3qfyagYe/C0RgMHHYJ1MC8MM7ril/j7N/D2OK6yHcm2WTH25CA4FIo8YOzVhlbiKlrJAy5A==@linaro.org
X-Google-Smtp-Source: AGHT+IEe0pGbl4xMDPszvOpnXXpIwa8azsT2CtonIp/EB2k1baXCsvG1u7h38SpSVPZFzKldFF4Y
X-Received: by 2002:a05:622a:8f1c:b0:467:73bf:e2ca with SMTP id d75a77b69052e-467a582be46mr206905211cf.46.1734371700566;
        Mon, 16 Dec 2024 09:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734371700; cv=none;
        d=google.com; s=arc-20240605;
        b=gbsNHRYIiaDF6o94M59WZPm+NqS+7QE6z8JgK2av5CPHI2dKVhaSbh/B0vYr6VO61d
         4RqSoGY5CvDJcz7p11cs+DWo4hggDJmB96Dc2ahUA0p6AlYLSLp+51M0aOBKqT1SOg8s
         wr0QM7LJ7HKvzQbXF9zSH5vX1PcQa17v3b0MHxXo0BNRE1N2HqH7pXQVdZIEOBXqXckd
         HBC9j6UwlnyqyRHBZBB17re/G+YXWoM3Dix9X84zXG1KubhO+D6klvULlsyntTx/7d5p
         MRsLY8OWm76N8A3RIwK8jIzP07FKOE94NuBQC9TCLsVnFYnGAsJittjc7HJOLPvkom3b
         C82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TYgD7L/exeyZzuNEPqHD5zwKDk23qif4iIr5G0iJK6I=;
        fh=c7lTQ2T/jPhEzE80GPIxSP+9lCsnxripCSj/Zu0zUXM=;
        b=EByt+1ELQe8HtKHdp5AD21IaGIoPu3tqZVvcEo/Y+ruymTThXTmY/FpAdbjeXwVnFD
         H1KmXFNCFQqfGfvvwWrbOAE/+cea6yB7w6iVe9a2tTmfyYdYsU9IHz0KO4y3QJblGcZv
         aQgLk79XXlc54bnS6d9X9daNiVtfV/GIVsd14/gcS/H0W0h2TZmse+BQg6ZtUUbwDr7Y
         9/CpAxVMqQ/HbtDtor9H+GXVhUYHqAjlgJ2gdb71MeyFWeyBRhbez0ZG4YFwxxA3hOyy
         s+8IaxWDvq37hUJNbXDCQ+I3MnmJk0cZ7vkmqybkdyxhEu2dUwAl5/LzSzdaS0rHI3+F
         88bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2e94270si75897521cf.314.2024.12.16.09.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 09:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNFJ0-0007QI-DX; Mon, 16 Dec 2024 12:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tNFIx-00079t-F3; Mon, 16 Dec 2024 12:54:51 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tNFIv-00066M-9D; Mon, 16 Dec 2024 12:54:50 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YBnYc5vXYz6K9ZV;
 Tue, 17 Dec 2024 01:51:16 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 8487C140B30;
 Tue, 17 Dec 2024 01:54:47 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.64.21) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Dec 2024 18:54:46 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v4 1/7] i386/cpu: add IsDefined flag to smp-cache property
Date: Mon, 16 Dec 2024 17:54:08 +0000
Message-ID: <20241216175414.1953-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216175414.1953-1-alireza.sanaee@huawei.com>
References: <20241216175414.1953-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.64.21]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-1.13, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U5m2bsiO2MMV

This commit adds IsDefined flag to the object and this helps in avoiding
extra checks for every single layer of caches in both x86 and ARM.

There is already a discussion on mailing list to have this flag. A
patch that enables this flag will follow later.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 hw/core/machine-smp.c | 2 ++
 include/hw/boards.h   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 9a28194676..5a02bbf584 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -371,6 +371,8 @@ bool machine_parse_smp_cache(MachineState *ms,
         return false;
     }
 
+    ms->smp_cache.IsDefined = true;
+
     return true;
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index db2aa2b706..2883a57084 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -373,6 +373,7 @@ typedef struct CpuTopology {
 
 typedef struct SmpCache {
     SmpCacheProperties props[CACHE_LEVEL_AND_TYPE__MAX];
+    bool IsDefined;
 } SmpCache;
 
 /**
-- 
2.34.1

