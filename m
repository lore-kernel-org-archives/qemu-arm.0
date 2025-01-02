Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9616731njk;
        Thu, 2 Jan 2025 07:23:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8H5+8fqfPJK37ex2KkOXYOEHWdj8w0w8p2W2TRVQDBnblkAx+IeEX2CBgG/QLWPZMVsOjHK5Lh4A74A==@linaro.org
X-Google-Smtp-Source: AGHT+IGVLZpVPmY6RHjPJrW9xpFvcL/1efI6yI6j8GQdr/uViScAkvv8p3fbS8N8EUKiv8MsxJ/J
X-Received: by 2002:ac8:7f94:0:b0:467:5367:7d09 with SMTP id d75a77b69052e-46a4a8e15aamr698422471cf.16.1735831415542;
        Thu, 02 Jan 2025 07:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735831415; cv=none;
        d=google.com; s=arc-20240605;
        b=Tkjk3a7Ui6Li41Ph4UsxPL238Cyokj/uxuJXlBf0Y1joulLDHdfgWYxmYvc1P75pEv
         Ue6rE5zz2pHLhbh+q3EotFeBSGMaWqfuSX8a1uhbcyHbCOk5iFvnPtyFQmrbtBY5oCy3
         yDu/OpPOEtxbKt1/r53NEDmkC2/yutBuaj6ELHyrg4akdsY/MAt27qIeTaMKom1tWQiI
         gh0d1OfX4W1webNsCKT04vhompRdi9utFM0KRRfaqsis6SrAVQiLcTu65HppVgcZqs3W
         pRQe99t9KPndQe7wZCKAKtNtsdUNk9iRCPD7KJkdLtnvBrGiUOShtOUkWBaXP00hGAaC
         +UDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=buuCmnfe7hPjVogaQhJcWLE2gS2SWKOnAFI0i+NS10s=;
        fh=3SOh7oRf8ZAjcQS1l/R73yHW85MB7PHhEzRWSpnyrno=;
        b=dogy6z2scMPTVkj5eS/1a+Njhd1/dKDQZhYbCMu31wenu47Vkuvrsy7oqLROeGG50V
         vg/Oly5/i0Xy1jah0cOF4YPNoAQsktYq1Ytc9V8WlzifkNzWN77vSIwNx6gVHzFZ4UfD
         36uY6vKH9lLB0T4vUN3+4QcoNNb1KThVldReVmIj1NGtq3EEzrW8GH50O4SpiQy+mweE
         F+u9B0tHiwi2a8PlfFItZjcqjSRNuxNYC5BrbbGfwc6yAtGfZHGEGmzWDwXzWLiFx0U/
         Qia7WRIx4kGjDieX45yHO+JZQ85YpoCMjIvQPC719vqllK/rYo8mraFUcv3a0fBdEOdj
         6rBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebbe0f4si320062671cf.380.2025.01.02.07.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 07:23:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tTN2p-00048b-6o; Thu, 02 Jan 2025 10:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTN2V-0003wG-RS; Thu, 02 Jan 2025 10:23:15 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTN2U-0008Vj-CL; Thu, 02 Jan 2025 10:23:11 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YP9Rv0p2Mz6K737;
 Thu,  2 Jan 2025 23:22:19 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 2767C140A9C;
 Thu,  2 Jan 2025 23:23:08 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.73.182) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 2 Jan 2025 16:23:06 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <robh@kernel.org>, <sarsanaee@gmail.com>
Subject: [PATCH v5 5/6] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Thu, 2 Jan 2025 15:20:11 +0000
Message-ID: <20250102152012.1049-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102152012.1049-1-alireza.sanaee@huawei.com>
References: <20250102152012.1049-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.73.182]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: eRl6UA1EyMMD

Test new PPTT topolopy with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 6035ec2c61..f0df03c43e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2141,6 +2141,10 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
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

