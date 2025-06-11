Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1938826njc;
        Wed, 11 Jun 2025 08:59:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEwyDO15eyKsW8JBYXb4X/pcqoRBXjuMxgL54fK9zzzos1jZpLDiLWk2sIgaCpQ2qUT2JzGPZE+dZzlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEV4WXmcQr1M0ItNFUAzAlq7MHOdamQsXWVFbXZdpSnE9dTMs1AyixX1QsZwf6uofR9yuEp
X-Received: by 2002:a05:620a:1b90:b0:7cd:1b4b:e5fb with SMTP id af79cd13be357-7d3a88d4896mr556945785a.21.1749657585768;
        Wed, 11 Jun 2025 08:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749657585; cv=none;
        d=google.com; s=arc-20240605;
        b=H0LZSQ8UX/LbnzcinZhAgle6PMGQ7phCqHoTWdgsLozKIil/plDFUKS83qFoIrZ3zf
         SZDLQMRR1ZXVEh4pbOUsSNK+x847AWGJDKAD0+H8mDy3ZvREWWHiPIrgfvYfTu2IAIRU
         MzHoLMjd0ulWH1vgGn+3s5YPC6pbcN2+LQnkMognByN5CKmteQAyOoxLMNEdlWjCItCt
         PmEAd8u/yeV24QDxuKEpQiehBeaXydXP6ALvo8Oyc6G50m8YBCvyTvcfRKLXM+cMibCF
         Rzh5v/rk82+OEzWoA4nZzuprHCzCQ6XXYNDCUhT/TGXLLjLoxhpp6URzniVQgP5YJROX
         0f/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=phPU5hUgYbHttBWygx33Q7cvz8jehdu1ERqBgat3G+s=;
        fh=BSTR0mN5riEHgpfDGU+Y04a8hUWGOTfFmwR91Qdx2Nw=;
        b=VtfbnhIxfnilN/Vcysq0NiYOTLTpEPFuvY6EJpDw/aeUIqMhyGnupQaiV6fK4LvXHM
         lg2hD+xnKOS4usUCa1lTWJLDHBz1iKuCr0V3VscE3mcHUMscefxoVNEPZ1DiYCLpx03r
         c20tLzIY38L1cvkMMW5ClDK0pcvov76NRGXgwfwlwilcF7hX6zfkUOiEg31NAIgBYOCW
         ubXWtjlaTFpTW5niH8atx8aZH0Lo89l/OagdY+iq2jmXDVoqoZuYkdLT8aF+s/wiuQUg
         LSZge2IX7UsE6A+vuaMtXD55QA3MgdDn4OernikKijbdwuAWo/9MImVMzIqoOAqv834e
         a5rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d2669bff43si1258427285a.560.2025.06.11.08.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 08:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPNrT-0004vK-J3; Wed, 11 Jun 2025 11:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNrR-0004tr-JJ; Wed, 11 Jun 2025 11:59:33 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNrP-0000Gp-WB; Wed, 11 Jun 2025 11:59:33 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHVhT31hmz6GDq6;
 Wed, 11 Jun 2025 23:59:05 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id E2882140144;
 Wed, 11 Jun 2025 23:59:29 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Jun 2025 17:59:28 +0200
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <maobibo@loongson.cn>, <mtosatti@redhat.com>,
 <peter.maydell@linaro.org>, <philmd@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v13 6/7] tests/qtest/bios-table-test: testing new ARM ACPI
 PPTT topology
Date: Wed, 11 Jun 2025 16:56:17 +0100
Message-ID: <20250611155618.351-7-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611155618.351-1-alireza.sanaee@huawei.com>
References: <20250611155618.351-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: Mgh0c5f0qaC8

Test new PPTT topolopy with cache representation.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0b2bdf9d0d..1f64c784a6 100644
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

