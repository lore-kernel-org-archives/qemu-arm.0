Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2886783lfg;
        Tue, 22 Jun 2021 02:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr9yV+xUuGJO3rq3gVcJYwXOUJPbcWnwc2eWzTvWI9RnFDn8CBm3jlBhMokoumRoipkBEW
X-Received: by 2002:a05:620a:1929:: with SMTP id bj41mr3141730qkb.479.1624354632851;
        Tue, 22 Jun 2021 02:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624354632; cv=none;
        d=google.com; s=arc-20160816;
        b=cIO3JCnsgCsatj5M3oN9C7GiVxz3Bxi2iCpZnj61JYviuRQ8wKNyV2P832J+cDzdgX
         xp/j3uzMrSnnEb0cDqfUnSU5TNOrsETz4G+9O9apm23DJOebBdbYIpASLu5MFFD5upQG
         86HmS36ghKSHaI2dh7Vl5XalhydwPCINg8CC8UsHRT9TIdJWcfZ/mSq3lau601MZNZ00
         hRUP8ROJFS+gtKzQDFLdpNbKKo46CN5iXORfbmv6xYh8SVTuQai/amNAfHTfqWoNFARK
         +nSsLeuzUBQEoBqPlXOtGtvSjkKzUxUSR9eerzCcNw+eX9KJMAyqfdNlcoK/em+wv6Mt
         WA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=BH8Qd3va+DjPFaUpAKfj+q6qWn8qrhzMFDiraQzSIMs=;
        b=aEUknCRVWCb5kwb4DYu+VbyypgNS+Hly0Lvs4/W+YQ1HQooljoTxBPCp9RI6BmaIrr
         Ukc6tBv5cmwjSGUSsPUmN7oqlR9wtGThxpsjotshB3zqkrIfoyLx3eHQWr1AV4yFqcQI
         gAlh0vAVG22n2O7xj+gz2+jZnuuWL7PeoJxg9IcimYEtMoyU1n1ma7NiJEDUbW2FDwUK
         cDW8/L83bquhT9V3mutm7aLBTVytXBwPENYuuT3UgeNA6WRflc37NsGDMrzwqYQSY5R1
         kX8Rzr8IjKdYI+hoqdlbwPNFQLZnyoraoRTcwmGT+6A4TJ/ZA8ooVe1To7B31/7D79vM
         IGIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci17si8001231qvb.113.2021.06.22.02.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 02:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcqG-0000Qa-7L
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 05:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnl-000315-Q7; Tue, 22 Jun 2021 05:34:37 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnh-00030b-U3; Tue, 22 Jun 2021 05:34:37 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G8Lk63sfcz72kQ;
 Tue, 22 Jun 2021 17:31:10 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:25 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:24 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 3/7] machine: disallow -smp expose=on for non-ARM
 machines
Date: Tue, 22 Jun 2021 17:34:09 +0800
Message-ID: <20210622093413.13360-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JLxSfagJ60ef

Currently, support for exposure of cpu topology to the guest
is only introduced for ARM machines and we also have an ARM
specific parsing function virt_smp_parse(), so we disallow
the "-smp expose=on" configuration for the other platforms.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 7 +++++++
 hw/i386/pc.c      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 55b9bc7817..23721bb77e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -746,6 +746,13 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+        bool expose      = qemu_opt_get_bool(opts, "expose", false);
+
+        if (expose) {
+            error_report("expose=on: exposing cpu topology to the guest"
+                         "is not supported yet");
+            exit(1);
+        }
 
         /* compute missing values, prefer sockets over cores over threads */
         if (cpus == 0 || sockets == 0) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c6d8d0d84d..afabfa0566 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -720,6 +720,13 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         unsigned dies = qemu_opt_get_number(opts, "dies", 1);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+        bool expose      = qemu_opt_get_bool(opts, "expose", false);
+
+        if (expose) {
+            error_report("expose=on: exposing cpu topology to the guest"
+                         "is not supported yet");
+            exit(1);
+        }
 
         /* compute missing values, prefer sockets over cores over threads */
         if (cpus == 0 || sockets == 0) {
-- 
2.23.0

