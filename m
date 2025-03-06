Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1283400njm;
        Wed, 5 Mar 2025 22:07:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9RvfDG1j/nqbZUk5bRDWxJEvrCvuz7uD1QvBKGUWJMumJRYUhF78ASstvleR/UFojtLkEFhv3huAk6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGlJ6hDTRvls6G2qVC/x4UkdoWOXYwc1VsZOZWw3ueWpFj/WjLwZWwY7Mrp9FLX8EU9z6pK
X-Received: by 2002:a05:620a:8908:b0:7c3:b7cd:986b with SMTP id af79cd13be357-7c3d8bd3483mr1003141085a.9.1741241247405;
        Wed, 05 Mar 2025 22:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741241247; cv=none;
        d=google.com; s=arc-20240605;
        b=BB19BaiS7xsHXXX0ziYLThF8szSse5yi3YRudQA7N7w0rzn8aPZOIlXlmJIWAPvXEJ
         2YY/p7ykomjlJRh0tK1fpg6IbVWjzrbD9JkRn3zEemyk1FYSnd3BN0sUUj89QTeV9mdK
         pO+0I3st8gcMu0F9ap3tX8rM0JFuY9U0LwdNXJ0E12oh8Tl4nFrd/8Y3YMLaDK66hRYm
         QPeVLet/ASo4zKruVDswY6OYalfNlSoIZATjNsUR5SVRio+gsohFg/DZl1fU+ImY8Hs2
         jJf+aoObevdw0qUtTqCRz+yWfvNchG+RPJnVp2waufFt8Mm/CQ/b59oAS3a5yhb7L2Kz
         yKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=GtOQJ85XEURurEBw4ZpNG5WUJsWTmOmL0MkFEvlZeRE=;
        fh=0fAOdSjQv2x0RtOeWxHNS2tjJ6G6B4ms5PFLA9mBK/Y=;
        b=b8IC3uthj47MM2sj1wpdOyJPfjt3U35ExzfTqoJkuX389tYxvt9+mJ7JkODpquUKDT
         Fz5Z/xznylLwiHA6T5sh3aCkK+XtE/v7AJI3EaaAxFJwNE4+osue5LovZncIvxVr/kwv
         ummMltTLRlPb3HijQgp+X7+O2YaCZ7X6KVMLvaCmm+m8ZSJP3z4P1DISFKvKp5OvWtJ4
         yikNM9wg1CuKMg2qxjuRBzTexmjL45EAVAeShrX/uBzIQDM3PXCDsoHERManutvRPfYs
         /FAgYKDwz31Jo6UswhHk5lH/mnB1sH5NADSlL+xI9jJo5yQ/FWIz1OnSbIdj37/itKjc
         KIOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5572f7csi64077285a.605.2025.03.05.22.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 22:07:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq4Nz-0005mD-8Q; Thu, 06 Mar 2025 01:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tq4Nx-0005lU-CW; Thu, 06 Mar 2025 01:07:09 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tq4Nv-0002Hz-RV; Thu, 06 Mar 2025 01:07:09 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z7f4l3x1kz6M4g6;
 Thu,  6 Mar 2025 14:04:07 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id B8E041403A2;
 Thu,  6 Mar 2025 14:07:05 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.96.233.98) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Mar 2025 07:07:00 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <mst@redhat.com>, <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>,
 <armbru@redhat.com>, <farman@linux.ibm.com>, <peter.maydell@linaro.org>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v7 5/6] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Thu, 6 Mar 2025 06:03:51 +0000
Message-ID: <20250306060352.907-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306060352.907-1-alireza.sanaee@huawei.com>
References: <20250306060352.907-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.96.233.98]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: LfvuOQNt8oLg

Test new PPTT topolopy with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec435..6bdc25f4df 100644
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
2.43.0

