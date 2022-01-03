Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10167491lfb;
        Mon, 3 Jan 2022 00:49:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTAK9wMbU/9i/74GqDn0AB3q6F3NQt7G5RHdrqZ7XyOvqz4mEbLkKh3hsLvtmPff96aDTU
X-Received: by 2002:a25:ad0e:: with SMTP id y14mr51401535ybi.63.1641199742189;
        Mon, 03 Jan 2022 00:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641199742; cv=none;
        d=google.com; s=arc-20160816;
        b=Ek00vGaSq4z8B9+jbDE180jsx64DC6epKd2N3VeVYqT+DG94d4MmvKbgEriPy7Fb+X
         WtCRQRLJ/3ZlAESB6mA5PcpIAeCa0SQX1szpTCoyIXkPp5W26lAaVDv3GEW3gaH9ektX
         r3Cz9xsGXzFAn20/Xg0Ku81wh+GXMJiVP1Oqfr1S9Rw2hkCu9Y5cmsNQPxv4JfICqQFx
         7v/lfkutktqmoSQzBThyFQxD00AAAkGbBDUx+6bpLN49RH4ix3SDZ86viEEAlXWFlAhD
         +KireI5UjzUFMI9LE8nINA6LjORzR9QFBgEJjTqybNT1sG+LpEyAkM+zqJwXzlIGKyUx
         T1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=J/wuiWW5G0o9+usXREMXSg1yCX1vOEGYoIBWB08Dgrk=;
        b=WXmYOAjy3dcSMsu83ZQWxxlc52eiTaSGj35W/Cn9v3jGFVVS4MIH1Nxk5tvplOktIL
         z2Oj8LhG2MXVgVJ59kR06q0jmj3Ip9HFgYlJ8Nr2Crotm5HFTriff1+fKoFTj9YJEl7N
         kZ6mLrtJMGAgtFovrZRRe7g6/WywStDfcwDOIQz8dsu+d/I1glMfG3Z/B4ou6OEndCII
         ACjKv5jOA4fjy57dfu7ZHqTNUHSpogG7Okvn4kpbYxmtoac9LOsxGkv1J8sbpS3/S6Xb
         r5itcPy/eAW+glqUB6knXloswN3CBoaN3Iby2rc1lyW84yezWZq0pI1vxifx11oQbVMi
         DR8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j64si25325068ybb.162.2022.01.03.00.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 00:49:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4J1Z-0005xx-LF
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 03:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzW-0004J1-FP; Mon, 03 Jan 2022 03:46:54 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzT-0006S9-Qc; Mon, 03 Jan 2022 03:46:54 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JS8Rv33zWz8wCM;
 Mon,  3 Jan 2022 16:44:11 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 16:46:43 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 5/7] tests/acpi/bios-tables-test: Allow changes to
 virt/PPTT file
Date: Mon, 3 Jan 2022 16:46:34 +0800
Message-ID: <20220103084636.2496-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220103084636.2496-1-wangyanan55@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: 9Jptnr1KIGNX

List test/data/acpi/virt/PPTT as the expected files allowed to
be changed in tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..cb143a55a6 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/PPTT",
-- 
2.27.0

