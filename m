Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2987183njd;
        Wed, 23 Apr 2025 05:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaAILsUoXeT1uHzED6Gy9XHR7FUAmjDM8RXjhbQ07Y4mauuNqud9CD1gM9QBxalGkitOuN6Kldmt5m3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGVI5y3V7H/lLE+Pu6tthQPBXslps8mHZ6ueMrRbgJi6CxtoTDUZcNaix7NQTEATMkONR+L
X-Received: by 2002:a05:620a:424e:b0:7c5:a681:1b42 with SMTP id af79cd13be357-7c94d8137eemr422463285a.3.1745410210942;
        Wed, 23 Apr 2025 05:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745410210; cv=none;
        d=google.com; s=arc-20240605;
        b=iowtB5VN8ZyEu7YdbxGXyjG4f8xF56VFiJhM/EAo5UFqThA1ufnLtVb8HBJquKbs+9
         ZWb2TmIrRv4xOig4WQid7vK9YkKmXwLYnDKDy6vPOWcgJh9N6RJaLv+RXjhtRKkQYZbx
         cJCf8LUf8as5nEWrGXU0G3twuFu/4VJ5idZI6bascSCJjFQ0ZKhQJT5Ax+KLnIfLDwu7
         /QUEnXmGYifeXOGRthqkjd/eoz3Z/Q8IG/2Bepv8aSTS78ll3NkDJVN7TYA9XxvMjX/2
         yZ8r6156SUBzsx1gtQW7uebwxoPtwr9JK04Na2AkYqzdwBow3WhLgLzK5BoTEZ02u6Op
         ZZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Fdnz2ERacnmn3mwmhzz42YqMCzHdPsr5KE7hzLq4igs=;
        fh=iB51S8I7QmchTsaekNVL8oqE3kB8JUH5eJccl5sOqHU=;
        b=ezhdSlM5TRAd/C9jrQ+7FAMaf4nq33yhPAlQpRk4a0QK8d61Tn5C9MWWa9T31Qo5DS
         IuZfSbj/6Dyy0V+9+azUvzOpbzavHtU988g5KnIFg3IYBcYaLwyU/m3GItPE1MStyARk
         0QhvErhtviAwrdYwrXTQhBiphwam0jzB8qndhPchDvlgeMI+hG1KKZ8eC6Ma7ZtQ2QC0
         T4QQuqwxmdQsFJzkxrHrJPYSX3J9rJyXrJZ3bDGMimBBt2T90rT4EBKnwlmzAmXlYNNG
         4KHEgJqStecslTzJvre9nkpL/XfcrgzAMWO77nkgR7N724xRZhi2r1mS8Mdpy6153cN4
         sZrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925b7e973si1393615985a.251.2025.04.23.05.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 05:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7YuX-0000DS-8P; Wed, 23 Apr 2025 08:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u7YtF-000877-7L; Wed, 23 Apr 2025 08:07:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u7YtD-0000h5-43; Wed, 23 Apr 2025 08:07:44 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZjHnH3PjQz6M4hs;
 Wed, 23 Apr 2025 20:03:31 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id D614514020A;
 Wed, 23 Apr 2025 20:07:40 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.28.126) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Apr 2025 14:07:39 +0200
To: <qemu-devel@nongnu.org>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <imammedo@redhat.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v9 5/6] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Wed, 23 Apr 2025 13:04:56 +0100
Message-ID: <20250423120457.1042-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423120457.1042-1-alireza.sanaee@huawei.com>
References: <20250423120457.1042-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.28.126]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0Z/RiZRX+Bzn

Test new PPTT topolopy with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec43536..6bdc25f4df1e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2142,6 +2142,10 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
+                  "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "
                   "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
     free_test_data(&data);
 }
-- 
2.34.1

