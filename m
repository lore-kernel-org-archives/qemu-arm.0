Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2116640lfb;
        Thu, 26 Nov 2020 23:23:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNvsAttF8x6FdQd1TlY0sHHw/N6rw5D3/nGetIaKLtBHKysYlHwQzTJ3qu1Kf63HXQWnCW
X-Received: by 2002:a25:774c:: with SMTP id s73mr12383076ybc.262.1606461826981;
        Thu, 26 Nov 2020 23:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606461826; cv=none;
        d=google.com; s=arc-20160816;
        b=UCjAAYU4xirkrXa/BRUW7X/KsVn9gSeTkOUrbQAxEc+numkay01l9nBwmDEA/9wh5/
         E9eJcOyRp3YGAs82QHToM3GPOIoOh5X37gH30O8viHknMesvXkcUW9gx+3tsOFkwwDTe
         7+8705X7IDV+hbMJtCcK69rlSv1RJ6umMTrgx9eHrwgn8Zcg12ffYCYzWOlzg2PMyDT9
         gLPbaZlno1A2CsSvK8UBiboxSKfcCI3N7ogAUihd9KOgKcxQdo/JbfhCYg/DSqZAzgLb
         iRdkPZXbgNxtXeHdRLrZHZooly6qyac6oOqYqfIUipc3Dv20HWQA55UC+wFou4o/L/zl
         fkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=JS8MOc1rf+4P2zlIabWVkzhUcRU1goOtpCHDVqIl/Ok=;
        b=V7Qhlbe2jD79ANPcDtJTrxaORfXG+T097UQg0Ky13E6K2DEUMnf+VSbn8KyukuB+cs
         csb8cj4fmpPSjOw1wMYxhhfm+rOpADJeuBO5cGJl+ypmLN/R2y/W+IaXa8jPQb8c/Nc/
         DLzamgHqTSlrtIFXDk526bYZ798NJF3t5NJ2PQj6eyKKqojy+C4IEh19xzngspDG6rPz
         nx8eTTtNjZoX4KvEfI8g1hn7mwLaLBlXKhsf1z7wY9uYyxfL4D93JiXcO1EHxDZDOA2y
         FMqo7F9ik9GHlskqA8ZqgmTiLMvuan3wGvQymuLLKY/xEE6qQK6WYMYfOSCYG7VNcP+u
         /0Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b205si7559185ybg.296.2020.11.26.23.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 23:23:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiY6c-0005dI-6B
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 02:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1u-0002No-I8; Fri, 27 Nov 2020 02:18:54 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1r-0007jn-Ka; Fri, 27 Nov 2020 02:18:54 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cj5ZQ1BXFz15TLJ;
 Fri, 27 Nov 2020 15:18:22 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:37 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 3/7] exynos4210_mct: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri, 27 Nov 2020 15:17:59 +0800
Message-ID: <20201127071803.2479462-4-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201127071803.2479462-1-ganqixin@huawei.com>
References: <20201127071803.2479462-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Gan Qixin <ganqixin@huawei.com>, Euler
 Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cimv0aR2Zf0K

When running device-introspect-test, a memory leak occurred in the exynos4210_mct_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 96 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf56b01a0 in exynos4210_mct_init /qemu/hw/timer/exynos4210_mct.c:1505
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #6 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #7 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #8 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110
    #9 0xaaabf6552708 in aio_bh_call /qemu/util/async.c:136
    #10 0xaaabf6552708 in aio_bh_poll /qemu/util/async.c:164
    #11 0xaaabf655f19c in aio_dispatch /qemu/util/aio-posix.c:381
    #12 0xaaabf65523f4 in aio_ctx_dispatch /qemu/util/async.c:306

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
---
 hw/timer/exynos4210_mct.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 439053acd2..7172ec425d 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1530,6 +1530,19 @@ static void exynos4210_mct_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void exynos4210_mct_finalize(Object *obj)
+{
+    int i;
+    Exynos4210MCTState *s = EXYNOS4210_MCT(obj);
+
+    ptimer_free(s->g_timer.ptimer_frc);
+
+    for (i = 0; i < 2; i++) {
+        ptimer_free(s->l_timer[i].tick_timer.ptimer_tick);
+        ptimer_free(s->l_timer[i].ptimer_frc);
+    }
+}
+
 static void exynos4210_mct_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1539,11 +1552,12 @@ static void exynos4210_mct_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo exynos4210_mct_info = {
-    .name          = TYPE_EXYNOS4210_MCT,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(Exynos4210MCTState),
-    .instance_init = exynos4210_mct_init,
-    .class_init    = exynos4210_mct_class_init,
+    .name              = TYPE_EXYNOS4210_MCT,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(Exynos4210MCTState),
+    .instance_init     = exynos4210_mct_init,
+    .instance_finalize = exynos4210_mct_finalize,
+    .class_init        = exynos4210_mct_class_init,
 };
 
 static void exynos4210_mct_register_types(void)
-- 
2.23.0

