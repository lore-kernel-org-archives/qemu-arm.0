Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1289358njc;
        Mon, 10 Mar 2025 09:25:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6Tr7Ikvr4jqJs35xZYrooeiSRq1MD9wnI5sMVjdpJZEDOnDYyXdRfSJMJYlhcUf2nYXsUR1hEljPpow==@linaro.org
X-Google-Smtp-Source: AGHT+IHXvnOnUJWc4scIECGQuICxeXQAgAzjDzU6CTKc2sjV+bAR4+CqQYXRMMhBNUayaD2r3hPR
X-Received: by 2002:a05:620a:2b86:b0:7c3:c329:792f with SMTP id af79cd13be357-7c53cfe9adfmr1226735785a.3.1741623944755;
        Mon, 10 Mar 2025 09:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741623944; cv=none;
        d=google.com; s=arc-20240605;
        b=TuXb2tm5zRLp0pmAcgOIVjvuC6vZPoN5dNogAtlTl9/4O+ZU4bMXOEALiqy+5m4VsB
         lY7WY0MP2Hf6YeFJgxENY5eTDwqdL9IRyMwJrS9ZDJAt4f65g2jTb0hUCzukhE8+bW8z
         t4JDamXahaai/pJdnZxQI0UVgOql3xkk+BeZMpaL49/5R+BKYUv17RXdyTN0w+y39cjK
         k7AD4lRSWhPCT43kv+lHTIv8EyihLLQgRZpeTetHtWM+mSQZCvyuHZalBtTaiDsOXlcJ
         v9SHjCxKf7iLdCe+O0rgIVc8dqh8mRPmqZ5bVtMiqZR8ew4C3sbQsHL+QTsf0Y6bz1aL
         YwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=la0XY0I94bDIZRS3aeaMhJ2QI5hHySO5Fb1NzbC43F0=;
        fh=0fAOdSjQv2x0RtOeWxHNS2tjJ6G6B4ms5PFLA9mBK/Y=;
        b=lNI45NGMyLXCKcgoqTSDD7upqIkXOtaxw1hOwwr06eyIlHKjT+e39fi6Rgp5hil4HP
         mllfnnAodqvvUbAKvSZnx7rn80H0URC62WtD79/EHrN5vpJOR/LCJahceCLMayVh3JRR
         gaGlZs1yssbBJ1cHeWZlx91MjOXu9gZQg8knBv7E0r0EuH1Ef8iIQ17C9o+OwBOAT/Mv
         z47Ra75uRHSsHT5SAzCseO5PA0M/l2a3fp0hG/np5rQjdDX2AdTNbkb4c1rNHkEy7m9F
         L1n/jzztrBo8zObxEoYrgW+mJCnxIBDOIiAGI37NnYQKDTrgZZkQJGustFAmN5ou8u2R
         g4wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5508f0818si255253385a.621.2025.03.10.09.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 09:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trfwY-0001cJ-67; Mon, 10 Mar 2025 12:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfwV-0001Zg-Vs; Mon, 10 Mar 2025 12:25:27 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfwU-0002It-9x; Mon, 10 Mar 2025 12:25:27 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBMZj0ZPJz6L4sM;
 Tue, 11 Mar 2025 00:21:01 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id B5BA81404F5;
 Tue, 11 Mar 2025 00:25:23 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.68.114) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Mar 2025 17:25:22 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <mst@redhat.com>, <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>,
 <armbru@redhat.com>, <farman@linux.ibm.com>, <peter.maydell@linaro.org>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v8 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Mon, 10 Mar 2025 16:23:34 +0000
Message-ID: <20250310162337.844-4-alireza.sanaee@huawei.com>
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
X-TUID: rGs8D6Mins3H

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..ba2a8180e931 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

