Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1606244lfb;
        Fri, 7 Jan 2022 00:36:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+xM8xG8voJ4CLdubeG0H9qwaYEtheS96YE2DTbM8PW9w4Raou8UDCRkr6AJdGGAwaCOl0
X-Received: by 2002:ac8:7c50:: with SMTP id o16mr7023910qtv.258.1641544610862;
        Fri, 07 Jan 2022 00:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641544610; cv=none;
        d=google.com; s=arc-20160816;
        b=L0IHbAXQ/5haXnrs7WIW8omJG3HARrzPPRTc8i/jnESHsBhv8aykTrhJLs3MtZ5CCf
         6Izq1BPGdZa8ZE/hR0lVyan2e++YKMl579d0f42OFSZ8n0C7HBiGQWv3V77wxh/Qz8sb
         N+m5Kz0RuejuIJpszpEc46DD4quV4u6iESIQRTKc+n1QVvDyQvRzyyw/5dW07HH1dkFV
         t/zs/AaXWbvhVSE4/6UcaAGfuz+rJHfSr7Ao7TZAPy4ETtw6rUvTI6b75coTzpmbZ6m6
         uN/p3pjz5CkPh+fFD9VrqBGX3WuE8IxaD8NdFwbyOykLAPdq8TU1vjg4UTGIqsAcoT9J
         68fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=CvzTB2hbpXvULRtuiBnOqAypxQV7PztGYETlBwhV7LE=;
        b=COB29+tTsk2NjxR4Njp3sf4kwH4Cu9bk5phm/fgsCAFZKukLKDTGQkvTOmpkPULihh
         gAHkquuqsL9z3hlIX3ZufXb8oPMZfiNMmpdVHwlZfJIoSPAmMz3jIUi8gv0tBlmtCFic
         3F8y/PjpCsrso8OZmbvj6AxHEOXM1lfdqauliv8tXEhdN9xt44K/WK1s51mn5JYxignA
         9rrr0hGSffHw5cZIjwCJkZMynWM+mf7XyXETGZlU6fe9zQTCfHO39dnhokynLajfP2Ch
         tGKPNrTpZBKfOFCGMtTiOCgqnzUmjsrpR2G/qWN0vwOpJxPyrPDSlj4lE8Jt9my0RPK3
         RQ5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si1502437qvd.466.2022.01.07.00.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 00:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5kjy-00069b-Aq
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 03:36:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg3-0000NB-2H; Fri, 07 Jan 2022 03:32:47 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg0-0001fJ-O1; Fri, 07 Jan 2022 03:32:46 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JVc032Yr0zbjhR;
 Fri,  7 Jan 2022 16:32:03 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:38 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 4/6] tests/acpi/bios-tables-test: Allow changes to
 virt/PPTT file
Date: Fri, 7 Jan 2022 16:32:30 +0800
Message-ID: <20220107083232.16256-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
References: <20220107083232.16256-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: 8C4fMB/Lxm8q

List test/data/acpi/virt/PPTT as the expected files allowed to
be changed in tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
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

