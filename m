Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp347914lfm;
        Sun, 16 May 2021 03:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4rSo0kbwOHYPrkXq6HJzZJaMBH81DSGLnen4OgaB/B7VF6gCEZfpdHptP++P28bH9V8ZM
X-Received: by 2002:a25:a3a2:: with SMTP id e31mr72467679ybi.351.1621161146730;
        Sun, 16 May 2021 03:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621161146; cv=none;
        d=google.com; s=arc-20160816;
        b=n27B31ayEMXilkxI1ufFpPs5wwKTQUn9ulFn79lCjeDA11rcls9Jq5UQq3Ymv5nZTh
         5RPexw7PLM42MglWIhz+/fAZpGVXd9jn+K5xhSmeIGSq/fDKfIUR+7vZPjXOA4evNS3S
         TW+O7YWpvlvk0EXjRCrG7HYT70x42xXxCf9Xl93D/w7UnOZaWEtISLJD7eHSBqKmi0WT
         cgX+2Ovv55pcngXpjvp1aY5mhGxF0Uo7/jF7wFAKtV/iWtbGcyh5FSIylolYznIqG3NB
         2IpWnuYpKh6HDMe0n0OM6qlgi6Lt4PLvkVJVVVmnyD/NCuGOJDSRGu03XKiDUZg/iAyM
         W99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=kgDipw2ILzV6kbN77kb4zaV1kCFkvk4kUoEwpIKN97o=;
        b=f8g8i1orr168SDmeJNP8hpjtemonrb8eGG/+lze8AmGcGJtHw1RN2IjqBeTeI0jSAr
         /Y1/bVQx8t0EtclY+RiE7Dx7166d6lJVHYz2qKFKvZEzmfIUbXDKOZyykcfqcDXOL0Ur
         X1Zb4rauT7J/Qv+EqlxhWegyXZfk+Y0SORFzvLQN3SCLUOnGOHjJqzELdVVWxHkiWRAn
         aGVVgCGgJb+DjoSb3lNm9QMfFIPWf3C7l20lwrjw/XB64afaZUrRLdoTug1fxcW+erNI
         fxChWaY525aa9UPm348hJAtX7fahoRuOuBzAhIQUqDL7wfu+k+3OLgGx7AdTBq+qEDQd
         2rUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si3672069ybm.258.2021.05.16.03.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liE4Q-0007Ly-1B
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1X-0001Up-Ve; Sun, 16 May 2021 06:29:27 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1M-0007Cw-Pr; Sun, 16 May 2021 06:29:27 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fjdh812cnzmgJ1;
 Sun, 16 May 2021 18:25:44 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:10 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:09 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
Date: Sun, 16 May 2021 18:28:55 +0800
Message-ID: <20210516102900.28036-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516102900.28036-1-wangyanan55@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, zhukeqian1@huawei.com,
 yangyicong@huawei.com, prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RfRzvSd+vTex

We create and initialize a cpuobj for each present cpu in
machvirt_init(). Now we also initialize the cpu member of
structure CPUArchId for each present cpu in the function.

This will be used to determine whether a cpu is present
when generating ACPI tables in later patches.

Co-developed-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e5dcdebdbc..50e324975f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2061,6 +2061,13 @@ static void machvirt_init(MachineState *machine)
         }
 
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
+
+        /*
+         * As ARM cpu hotplug is not supported yet, we initialize
+         * the present cpu members here.
+         */
+        machine->possible_cpus->cpus[n].cpu = cpuobj;
+
         object_unref(cpuobj);
     }
     fdt_add_timer_nodes(vms);
-- 
2.19.1

