Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1647632lfc;
        Wed, 20 Oct 2021 07:30:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykZBhRaO8DBTJgSvdVwthTPWLXlQq/Pvy2j4qS3HzollYKmUzjgrEWIgZh5XCQWCERgURr
X-Received: by 2002:a05:6830:1dd8:: with SMTP id a24mr211767otj.56.1634740259627;
        Wed, 20 Oct 2021 07:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634740259; cv=none;
        d=google.com; s=arc-20160816;
        b=b8XPy8EIO+4DctCIM87xyXeQ8LmmuDZDtzzYCLyjCyiS5OQm5M2K7W/J6vitNEnHdM
         /wn2kj8HXRQYcHvXa3lw7NuY+9DWbmDhZHsTmFaUjQ5Kr5RokRkWLsIRCtRkV6oLKq3h
         xmxGr7xiGjr1HmHnCbQmrOdDa98J/XRh4n/syjMJ9/lNmGekYcUFD8c/f3WwYlZ7oY65
         eBmSZsgix5pg+nhAx/Uc715FjKoxwIrGe8z5DlcpxSpqzP1OeNkCnZP14jeQucCi/n0k
         ZHX2mzaClSvTW52UMU949ch1ObwbFHZbfVo0hOsc14N2+6QHKICW7XoaKrrZp3t6kG46
         XWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Me9KvfjnoBO82WFybzVzMAP4YBBLFCBJoJqzO7oj0eY=;
        b=C+3V0jb+9fJwPJLFpFBfvkEr3gRFKhK2nzqhdAPeDJKdkcdi0eycInWa+XcDhcasPv
         4MAE+RHXZNMWyPHvorpTV11Welcj8wr/CKOQtEed/hOupHzAsZqjLPjpSk9o0wws/kAg
         jH043Hse8EF9hO+8QTXOnXJ/fq7Q3+uKj7DfLqlSEydXihrkHk57+4GnqKuxEJ0zKl28
         IXbZ7pw31uPCZ5NdtIo5HcPpGjXw+GxPcG2dtar5ftouueADuv7/ntDPLafnRTg+o14G
         tjMEJimoafA70g/dEF1F7PgpLTkLUyubTD+498hCGrz0U9NjXjKDK67Sitm0c9AzRLdt
         dDBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b132si2530598oif.31.2021.10.20.07.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 07:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdCcM-0004Qv-Rk
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 10:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTT-0006ze-D1; Wed, 20 Oct 2021 10:21:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTQ-0002Lq-Nj; Wed, 20 Oct 2021 10:21:47 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZCND2S5zz90MX;
 Wed, 20 Oct 2021 22:16:44 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:34 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:33 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Eric Auger <eauger@redhat.com>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v9 6/8] tests/data/acpi/virt: Add an empty expected file for
 PPTT
Date: Wed, 20 Oct 2021 22:21:23 +0800
Message-ID: <20211020142125.7516-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211020142125.7516-1-wangyanan55@huawei.com>
References: <20211020142125.7516-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MIdehC1mim2w

Add a generic empty binary file for the new introduced PPTT table
under tests/data/acpi/virt, and list it as files to be changed in
tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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

