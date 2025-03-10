Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1290157njc;
        Mon, 10 Mar 2025 09:27:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9ADDOIu6mMa9x7HIvsu48XXVxB/5LPZSZz8RXsHiIS7Da7iS+6cNuabUtROEufSb9r1d35jGRrZK60Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH7OxdZMZ4E7Zy4V27zIKRjGBaGd70LzSk5gtSzeay2r25glmeqksUV9uD8cQvK2d6TFgIS
X-Received: by 2002:a05:6214:2269:b0:6d3:f1ff:f8d6 with SMTP id 6a1803df08f44-6ea3a6a48a6mr2423486d6.40.1741624026980;
        Mon, 10 Mar 2025 09:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741624026; cv=none;
        d=google.com; s=arc-20240605;
        b=IqrihJ7Ina2wwnLjigeai1/ppRYMXUtscZ3ysQ7osee+d9SKiIRBsgsbf9Dpiril7u
         k0UskEYod/U4rGbIGynjL0FPueebr1jbPhL4Cc4DIdtWFMfIpLMd+aVAxDBQZiCg6/I/
         dCcEAYzydV3grL5BbedWJ1XpDtwym/CXmPz77R+nM4Ycn3uUMUBJ2MPrFyrBmGDeJvBf
         MQkvyS8yG90vKcPDNeJNyqJfmIAydXK1u7IQfAXjrRErHy0nkWnMvDKL5E+YcKAc+JhD
         GPECdB5mPY71Q/SqUFRQTHy+yluHzp1n0w6N9cfzK72nufvevrpAHZ2apL/LVn0cDmYl
         gmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Fdnz2ERacnmn3mwmhzz42YqMCzHdPsr5KE7hzLq4igs=;
        fh=0fAOdSjQv2x0RtOeWxHNS2tjJ6G6B4ms5PFLA9mBK/Y=;
        b=Rm92QzwgHQWSEJq4ec2LOsZX1pbsq1yBSPBgz4JLTchwjlMqgJgu4Eqpzebix6tRgh
         fLdTRuZX3qwT1QitFckEX5T2sZ7KjGaGuxov4yviYyiR30ovrD6fbtmIGSb+Ok440Hep
         fhCwGzGluUttuNLXLbhBMzMP4FSP1M4JDieT37Hu+XOPrnx+v5ve2tnUfjyxSjSXdDCQ
         HZqysr7HkzOjNKo7xwumNQyuZtCnqFiC+QXEM5Iq6aN1DEXimmnlaGDxpwX2SEPrJe/s
         lYgiNUzLbvb0lazV+cZYqJ/VuLZ7Spi78nBxwebQUYXmJNOdkvDwODyXwyVoQH0oBTgi
         2L7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f70915dfsi90947246d6.148.2025.03.10.09.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 09:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trfxp-0003IU-1v; Mon, 10 Mar 2025 12:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfxl-0003Fk-72; Mon, 10 Mar 2025 12:26:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfxc-0002Mn-2i; Mon, 10 Mar 2025 12:26:42 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBMdV0B4Cz6M4GW;
 Tue, 11 Mar 2025 00:23:26 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 76A311404F5;
 Tue, 11 Mar 2025 00:26:31 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.68.114) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Mar 2025 17:26:30 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <mst@redhat.com>, <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>,
 <armbru@redhat.com>, <farman@linux.ibm.com>, <peter.maydell@linaro.org>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v8 5/6] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Mon, 10 Mar 2025 16:23:36 +0000
Message-ID: <20250310162337.844-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310162337.844-1-alireza.sanaee@huawei.com>
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.68.114]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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
X-TUID: Z6ZHQHMRFfG7

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

