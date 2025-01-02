Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9615901njk;
        Thu, 2 Jan 2025 07:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUokH2rqxrHqauEkjk8K5VR+nRi0uyUHbU1jZSyz/2LnRXMnLhPn0t0oLIvmcIj4mR4GvncLWOL17BjCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGvMdhSARkDZrLjFFC1YrH7fHiZtjmLtE971aXGaBGV87G/oOx84nWSd3+Vu9Oo1lJ5UXUr
X-Received: by 2002:a05:620a:4399:b0:7af:c60b:5acf with SMTP id af79cd13be357-7b9ba6ef9bdmr8923008385a.10.1735831329098;
        Thu, 02 Jan 2025 07:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735831329; cv=none;
        d=google.com; s=arc-20240605;
        b=iB1hVFChJg61QzJwvr1stm+uowcx/yxbpu3p5KJ4XUnUNVRVI7s92OCuP0zo+Ic5kw
         RnQkfESZX5pi6fdkdj56PHR6fg/IcHOuTXsKkmhjCQ/4ypmUEPILoIyNldv+Wrl2rCEf
         zbXWW6YdLtyBb3oCk+D+u5R/aD11PCXW6+nC63mfz/okyZgq1PellNOoRLFvA5wAEDwL
         6YtgtEVlbtzSjv4xtB/vaJXSbX+x+LWgjPb1hVWpLJD1xPs0Tb3w66elHtmlSk9LWpQq
         5xyZFrz9h9gsotLsV2FT5p9ulZtaQY92Ti2bZwdyatghs5sQLm7reE8pbo8e6shUFfDr
         1tEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=T7Eankj5oqHZZifInGArnkMVTz5eVNOe7xiVANfYbVI=;
        fh=3SOh7oRf8ZAjcQS1l/R73yHW85MB7PHhEzRWSpnyrno=;
        b=PfOVjIYxKVkevEOnefzM0lT5t1uBeVPb7DrjfV8znApflfUXnlLm8rDLCLYouNZKNf
         mcMEFuLzEIqRkhslf9YYvKWIK3FRPvsBqLMqcIuGJj7DAnOOm1Z5z7C6M87T1iTF34Rv
         WGH5f2QTMSMcQgvwyI0hCajvKbQ9yzF56uN49rZKFMHFrROU9D0L8MlyMGC7eNdrpW0q
         XL8EZhsuruKB+rRBtYE9R3fNFIqikhgKAW3egIZiLamWM6biX3E0nISGORUvlrsaI4D8
         4jknooeaFJhoAocPp+/A7keWXBb4ZFoi3Y4CwLk9xrLxi/yOwP4aC1wNpk2UDVo2JPrY
         Cv9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac53e2f3si324316285a.611.2025.01.02.07.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 07:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tTN1Q-0002Zm-R2; Thu, 02 Jan 2025 10:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTN1O-0002Qu-R3; Thu, 02 Jan 2025 10:22:02 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTN1N-0008KK-Ey; Thu, 02 Jan 2025 10:22:02 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YP9Ps4gt2z6M4y9;
 Thu,  2 Jan 2025 23:20:33 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 96AA1140A77;
 Thu,  2 Jan 2025 23:21:59 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.73.182) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 2 Jan 2025 16:21:58 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <robh@kernel.org>, <sarsanaee@gmail.com>
Subject: [PATCH v5 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Thu, 2 Jan 2025 15:20:09 +0000
Message-ID: <20250102152012.1049-4-alireza.sanaee@huawei.com>
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
X-TUID: 7gw4V5vF8q0J

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..ba2a8180e9 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

