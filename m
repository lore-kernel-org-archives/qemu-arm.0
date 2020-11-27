Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2119602lfb;
        Thu, 26 Nov 2020 23:29:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZUgEGJ7ua1aKBzjPrgdl3XvFmSo+v3lxxBIodjvOnKE1dxtBJ3SCUj/Ndxpk3tmF20nzW
X-Received: by 2002:a25:390:: with SMTP id 138mr8461348ybd.28.1606462147847;
        Thu, 26 Nov 2020 23:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606462147; cv=none;
        d=google.com; s=arc-20160816;
        b=l6UCb2C0h6Tnck2xJiazqqYO75h2rjZljEjW3c9zj3FK3IuWWzX2n0KV3Vk5xxEx39
         c9KooQb5FDaesivWB6kBuRuN22f6Nyu24UQeiBQbtYWE5A/hHPP3xLFPlpW4b6ga4h6y
         pBEJdSk3kWjoqK/FEK63l3OeX/ALgZCwyjuPeOEbPrl8YUe+fkpulABhlslMxT88ufeN
         zmjOllxsLSkJ5+CRKkZ5rhuO51IDKu2i7jbuFmNL+YCOi8VcfIGfjuvCbUKw4ZxNjg2l
         eynojUDmn3YLXDeTesqAQY/WG//AF8E2dts3D2swIOVRmRaSbYTAYcteose6bdGRDTRT
         rYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1m72dkgmlwwSprrXoM1rcEMXSOc1nGiS3WUa1ywsO3A=;
        b=rYyPC6YXOAmGciaAZQ0l4OdWv1dQqtoab4r/VC+Cq9ErwdpC4mX7gKIGhJu3pXM7Fe
         /1Q0/R530Zx4/CJPDUpJzik70oqD2iFF8OSIU0zeNBNS3EGOGeq/+J+DmYQH53R7jKBX
         QFggGqW9Q3u9BGQKfBJ/yBjvV1oouLDZ527mgrfhUZ9SRaXW2/y5GE/fEv5dbI9YR0FF
         wEsIvBpMRH2IH3WIrjmoFMCaCL5zfr08U+LEVRcbue64t/rdJdwQ3RwdEFahcwLoxjaT
         sss/JtcV/H2M/wlRWldhjXZwjHmqbAc3Va11he2+6tlLF25y6CWMCE6g4sG/gPBoIClT
         feCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si7412635ybl.102.2020.11.26.23.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 23:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiYBn-0002n9-6s
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 02:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1x-0002Ta-TY; Fri, 27 Nov 2020 02:18:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1v-0007ju-Tj; Fri, 27 Nov 2020 02:18:57 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cj5ZW2dByzhjDw;
 Fri, 27 Nov 2020 15:18:27 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:40 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 5/7] exynos4210_rtc: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri, 27 Nov 2020 15:18:01 +0800
Message-ID: <20201127071803.2479462-6-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201127071803.2479462-1-ganqixin@huawei.com>
References: <20201127071803.2479462-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Gan Qixin <ganqixin@huawei.com>, Euler
 Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tVT7nI3lNQ5v

When running device-introspect-test, a memory leak occurred in the exynos4210_rtc_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 96 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf57b3934 in exynos4210_rtc_init /qemu/hw/rtc/exynos4210_rtc.c:567
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
 hw/rtc/exynos4210_rtc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index 4c97624478..2f667fb010 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -584,6 +584,14 @@ static void exynos4210_rtc_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void exynos4210_rtc_finalize(Object *obj)
+{
+    Exynos4210RTCState *s = EXYNOS4210_RTC(obj);
+
+    ptimer_free(s->ptimer);
+    ptimer_free(s->ptimer_1Hz);
+}
+
 static void exynos4210_rtc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -593,11 +601,12 @@ static void exynos4210_rtc_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo exynos4210_rtc_info = {
-    .name          = TYPE_EXYNOS4210_RTC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(Exynos4210RTCState),
-    .instance_init = exynos4210_rtc_init,
-    .class_init    = exynos4210_rtc_class_init,
+    .name              = TYPE_EXYNOS4210_RTC,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(Exynos4210RTCState),
+    .instance_init     = exynos4210_rtc_init,
+    .instance_finalize = exynos4210_rtc_finalize,
+    .class_init        = exynos4210_rtc_class_init,
 };
 
 static void exynos4210_rtc_register_types(void)
-- 
2.23.0

