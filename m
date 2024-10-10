Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1433770njl;
        Thu, 10 Oct 2024 04:21:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwVjEUftpkHEKQ26I2zfJtPfxdJsu9yryTYz5P8DNtNZcFZuHu+kC+myE53sV5ktQ8OujX6hWgkA9GJw==@linaro.org
X-Google-Smtp-Source: AGHT+IF6e5hivMoraL/jgrb5JDZzdV8THf8iW/ZsD9lXXthKMGhqpP71IbbCf/Xq2kSc9R/58XPb
X-Received: by 2002:a05:620a:408c:b0:7af:cf73:d77 with SMTP id af79cd13be357-7b079524befmr960259485a.39.1728559281752;
        Thu, 10 Oct 2024 04:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728559281; cv=none;
        d=google.com; s=arc-20240605;
        b=atnZq5eAbkwHiWTBGF0hf9ryQspgfFqkpt0ilrJvayaGlAVrn+Ehb3AEt1Ndclx3DQ
         irUHrF69Y1nqTL0dI+SkPcYFN27QErEAKHreK37soaukxXPn6+Q9DxvRV/TEeYz4UjO6
         YWjHsg8Xw3xoAFMPrFHAH1ckZulqHRtYjCJ1RaTyUu8e1+UTem7yhMBMkth46XphgWYA
         e522A6Y/877YU7TdjrG7FPRSGaYb8dCG6GekCFfUS4p3NVMI1D84WW/rQWTJbpPaQM1e
         ag0RH1p2cZGnFzUsgLCVajEAoEcvjy0KLcEMkStLYhPtYEcokIThEJaZleyYPl/PlH/M
         UwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=pxv4NMRwUfrsTqMfyUpuW/W9JC2Z6yNOHhUaU6WubXA=;
        fh=rWf9XuWQsI9arb3S/1QVkVJRzitX9+a8CSyR5OF0OEQ=;
        b=UYyoExt8PLJL9W6yjGYLGiXp5WkNf17wlM84O+suMEgQW3ScFP1pfbI+/TI6rddUVo
         kPGA5+otT8lUtOeRbjHHPGLlmLDMhTGdhpAYnSSwUlqBJeqRqihP1Yaayl8GisPUwXvk
         YSvwlrJGc/lYz3Mkxd500gWmm9dRuG0m0X7tkrA5cyCw0TWo06E1LtDyiGJ2LoMcJFgt
         yJ04m/WyiO+0m+e70Bej+X+oUg2BPlbKj9U/dKheUn+tornKJxA9qk3tybIAOfZ7gdDc
         pPYUl+JEGdB+yye5VLQU6WZP/wPuo7WDfNBcBNhRki66WB9Cpcjm4Yu3jSk4GrjqToQi
         HSPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149a694asi118024785a.477.2024.10.10.04.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 04:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1syrEE-0003KL-Jy; Thu, 10 Oct 2024 07:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrED-0003JO-3U; Thu, 10 Oct 2024 07:21:09 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrEB-0005JI-Gn; Thu, 10 Oct 2024 07:21:08 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XPS3v4hjyz6K8xn;
 Thu, 10 Oct 2024 19:20:43 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 170F8140B3C;
 Thu, 10 Oct 2024 19:21:04 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.126.168.143) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 13:21:03 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>
Subject: [PATCH v3 5/6] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Thu, 10 Oct 2024 12:18:21 +0100
Message-ID: <20241010111822.345-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010111822.345-1-alireza.sanaee@huawei.com>
References: <20241010111822.345-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.168.143]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KuQiPOQHItNY

Test new PPTT topolopy with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 36e5c0adde..65219f8823 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2020,6 +2020,10 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-M smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
+                  "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "
                   "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
     free_test_data(&data);
 }
-- 
2.34.1

