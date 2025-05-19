Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4217347njb;
        Mon, 19 May 2025 09:04:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKfQa6DQtiYG1wgcWhyQh/vFO3oOu6tO1QrNT8SJaov2ImK6F+h5JMA8lxfRpS1j9RkesPvy5sFnqj6g==@linaro.org
X-Google-Smtp-Source: AGHT+IG7ILlm7tSpbi1nxIlFZiTwclmqHJox/xnYc0zrKxtax1av3ZSkKiBedluvZFu49JgjgsgJ
X-Received: by 2002:a05:622a:410e:b0:48e:9e05:cede with SMTP id d75a77b69052e-494b096f3c0mr252645091cf.52.1747670661286;
        Mon, 19 May 2025 09:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747670661; cv=none;
        d=google.com; s=arc-20240605;
        b=kAMkvTVBmQ1KrSOKh0xSaZlEKBJEfe6sijiagG/JqEr5CuXGyiV981SLt2JLuneqXS
         kqO4tinHdPkwy2UpBKiw1Byd6qESZu9E1ZrZVZ5iUfYdKjgz/diBca5Or/ho4lmFui8W
         3jmbrw2nvLsfPHEq9dWSy41rtr+0iaMK0Ut23F96PIs084tz6hqwjHoDip+m7eExEr8m
         YODxdbNwtHdJR++tcZshvskci6qS1sxc5TIZ/I5Y478EFQ5m116IK6UhZPdq3wIUdYq0
         oI77W2l8odi2scJTbubSbjHHNBOYsTdC1die/YwZW1ZxE6HEWk2tY/JOWsRyY9wTkh4m
         lk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=GtOQJ85XEURurEBw4ZpNG5WUJsWTmOmL0MkFEvlZeRE=;
        fh=7CBlhCm8rPguwA6q+glmdL309TG5LEE0NmARedT2V+Q=;
        b=GHo2LdZsL51XfLaWPr+XsgKrneVetrrrKRhI1300dxxdPkNcq3xkMJ4XBxXAoxEOFM
         rNKKdV48B2SvAckDrxE90upPZ/pCoSUdecQfC8rhVyUpRW50vOLpqET6GKTrYqEJO2cj
         hfIFyqAzHAKF124EIB7iuQEkV/9XqRm8cznJQ0HWV/KmhLYEGzpXxk1eeR+hNog2+/rv
         Ry16pboGGh5Bqh6qodOHX675nxFZhbcHur7xmmElzZkIfg+Esa6L1PyRBF446xk5ZciJ
         hDs2bMskgubF221NSoWRKQXYqcclHs8L0ZN/AojvIS6lvFGKiHS4QjU+R8c8YeKxwlOx
         fLbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae560701si87006751cf.334.2025.05.19.09.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 09:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uH2aI-0001a8-Le; Mon, 19 May 2025 11:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uH2aE-0001Vm-GB; Mon, 19 May 2025 11:39:18 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uH2aB-0007Wv-TR; Mon, 19 May 2025 11:39:17 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b1MGY1SQPz67j7Z;
 Mon, 19 May 2025 23:36:05 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 8D9AA140276;
 Mon, 19 May 2025 23:39:10 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 May 2025 17:39:09 +0200
To: <mst@redhat.com>, <imammedo@redhat.com>
CC: <qemu-devel@nongnu.org>, <anisinha@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>, 
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <shannon.zhaosl@gmail.com>,
 <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v11 5/6] tests/qtest/bios-table-test: testing new ARM ACPI
 PPTT topology
Date: Mon, 19 May 2025 16:36:31 +0100
Message-ID: <20250519153632.537-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519153632.537-1-alireza.sanaee@huawei.com>
References: <20250519153632.537-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: j8virBGfsSpr

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

