Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp4041151lfc;
        Thu, 14 Oct 2021 06:23:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUqFuHnDonnGPmOj5rVCHXve9CplyOTMj7Xf3Z4WkC2kvUwi7jmFHXRauQvCWI7rNOhEms
X-Received: by 2002:ac8:7319:: with SMTP id x25mr6461825qto.147.1634217819817;
        Thu, 14 Oct 2021 06:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634217819; cv=none;
        d=google.com; s=arc-20160816;
        b=SAlB6HV/53FfWrHq6ngAGSin23qHyZyOSeE+QRaoeaRBLUVogpqVX5xpZLU4g7eHx9
         Z0Ab3PDsqQwEATs7cRvuoAAAxnVrDPJDSs0pjwVUZR28nGpBqGyHcf3rfAGcszS+LKpi
         XpzFloWbJW2FJkLNCHwIP/1Xh1QJwLR9RPxVhW8IvdVxD7t1H3zoRMkW3HYqTVtSKqvE
         ak/cjMXf8kjxNvtNdqWJZLr64NreEQTF1l19IvtoxV/B/xW74ct3NGCvC9gfFeStkGI0
         JdLqDO2TGNVYIxQgU+7sZnL+gUzfrHeII0cGqH+OLjewukQf2I919a9fA+HdZ/QjL4Em
         8f8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=l0fyS/VH+nXZBTpkirk6VQtDP10YDLpr5vtvZGZseuo=;
        b=NFwJpOdpU6mymTCg4wysEqMkpEbBiC9lTlrq+t0PF4CLVN4o5SXitb0GZtb1w6L1/+
         6owdX/w9OW/7dDwms2V3G9KmBMp9xPK+Dt+rw/kD+T2aAFm5m+tYUTVdnmbtoTqzarZk
         yFso9GyiZoGI+k82ud3Pm5ZyX2C6EziO+R1Lxs+vAsGMvFqXJAjP7QB4fSKiVUJus5pV
         Y9huI/N4i7sL9zRZ7BSANdDsduwNNbbVCQM+rwtm/DS79wWCOjluhkg32wZLQ/lVLlwc
         X/N3RMEhUYuJsDPoam4BMtLaI0EC6AvWV9kPt9u4yugkmBamrnP4v0GcrwhkrmXFEmIv
         pUfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si1961810qti.404.2021.10.14.06.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 06:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mb0hv-00074O-4O
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 09:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mb0gm-0003b8-Cz; Thu, 14 Oct 2021 09:22:28 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mb0gi-0001RC-Hz; Thu, 14 Oct 2021 09:22:28 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HVVQp30G0z8tbJ;
 Thu, 14 Oct 2021 21:21:06 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 14 Oct 2021 21:22:14 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 14 Oct 2021 21:22:13 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v8 6/8] tests/data/acpi/virt: Add an empty expected file for
 PPTT
Date: Thu, 14 Oct 2021 21:22:04 +0800
Message-ID: <20211014132206.19220-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211014132206.19220-1-wangyanan55@huawei.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DtLu94aluKHO

Add a generic empty binary file for the new introduced PPTT table
under tests/data/acpi/virt, and list it as files to be changed in
tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/data/acpi/virt/PPTT                   | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/PPTT

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..cb143a55a6 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/PPTT",
-- 
2.19.1

