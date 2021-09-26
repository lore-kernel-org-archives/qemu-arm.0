Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2791669lfp;
        Sun, 26 Sep 2021 01:52:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/AxxVVoroNpR57x4L5R24FVOvdSkI33KVVCit2fGxf6TCFCFWhdHPcJKfOuteRNMnXVwP
X-Received: by 2002:a25:730f:: with SMTP id o15mr21295917ybc.189.1632646340228;
        Sun, 26 Sep 2021 01:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632646340; cv=none;
        d=google.com; s=arc-20160816;
        b=mP2JVuN7aDkK4wh0EuNEQmHy5oYMFn4qZhE+4lAJRr0JEP1zSIoizX4h7+d2uPhVV9
         GHusSLaFdZzdeCDTEb2KZHJIfM2QRcVQY2strJnrC8DFgOg1IWAjFTkSsOvEkiWa4Qk4
         xGL2zkCajJIFjrxbD+Dz9/GGyG66WjzCUiPeZguhRWxPONuJxj0mSKW3TU8qUXoNRzGW
         AmaUyjq9lSOil+V11vaWkIE8sXeFG7pgAvT9WqlzwZYsTnhfO97Rd1nRDhbTOU0FvCnJ
         OK4A9qRWcB6MOs9An0e/kukjsWGuVm6+XKnYlZtGtjGiGbIBuDDF4BYjvs5a6/Ewlsde
         Jvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=oL0WhzDIeCPNtbrxGULpQjph+Fk1v22kp37RNN8s0ew=;
        b=kmWQg5OA0vUZ1/fKeUfKFGuQe5nEjQqRz8neRlB5/wKeCmxo56Fx1dx+XCVLxpQb8u
         UVS9GPDwKb87jv/hk+6zBmfM7MEPBrPwTBxZ1g+8xVlDYs4wjaywfOEIrtnICU9tfVqh
         lapzajv4BoHN8vjm4YrQbaY55smwZxblKMT/Bs/ELDbC61fD8Do1FecHunJMxkQ+wkGr
         HeoirdAhVkUIt3DSs8VnrhNo9tiFdLOFmkmruvyhwlY6Pvgh8GPD6XSLinVj7AyRR5ad
         izJqNDDRoBA5YrBq5bDuReFJjugm2vCIjwAkv1oXbAVCur9m7MWHLN95pC2tHm9rz5io
         sDZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si13303894ybn.316.2021.09.26.01.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:50268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPtT-00089z-J7
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnb-0006Cg-Fr; Sun, 26 Sep 2021 04:46:16 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnY-0002bA-9A; Sun, 26 Sep 2021 04:46:15 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HHK4x72W3zRXnB;
 Sun, 26 Sep 2021 16:41:53 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:08 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:03 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 07/14] qtest/numa-test: Use detailed -smp CLIs in
 test_def_cpu_split
Date: Sun, 26 Sep 2021 16:45:34 +0800
Message-ID: <20210926084541.17352-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ysS9IYKQofg

Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
the preference of sockets/cores in -smp parsing is considered liable
to change, and actually we are going to change it in a coming commit.
So it'll be more stable to use detailed -smp CLIs in the testcases
that have strong dependency on the parsing results.

Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
based on current parsing rule. But if we change to prefer cores over
sockets we will get one CPU socket with 8 cores, and this testcase
will not get expected numa set by default on x86_64 (Ok on aarch64).

So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
logic change.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index fd7a2e80a0..90bf68a5b3 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -42,7 +42,8 @@ static void test_def_cpu_split(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=8 "
+                         "-numa node,memdev=ram -numa node");
     qts = qtest_init(cli);
 
     s = qtest_hmp(qts, "info numa");
-- 
2.19.1

