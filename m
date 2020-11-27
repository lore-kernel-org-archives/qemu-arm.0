Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2114427lfb;
        Thu, 26 Nov 2020 23:20:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuXWu+fX9291/gPGJiZk1gg3QHJ8fqgZdCpW2oL8dr3SWyG6nv6hXKYygN6myVNNZmXS8B
X-Received: by 2002:a25:d606:: with SMTP id n6mr8721720ybg.360.1606461602270;
        Thu, 26 Nov 2020 23:20:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606461602; cv=none;
        d=google.com; s=arc-20160816;
        b=ew6XXA2667lMCJMR9fguPhCwhFIUDEqAEP5NcblWJ6htkADD/j5PqZv6UeGygtF36p
         Hin8f2bRpjlnrxGjOYP1qjJabXIifK1AxJHCKvOMTWnJ9Yl6KG0gp7ARQxk0tqv3BW3i
         M+tE+NbA6PwEMspGPW2HuEAMFK6njL/Llz1hh8es5JJxKQ2JQq8aZb02gpqZ7gtpcqrp
         LY/DJPFZ5VZHf2+AicMwjlyo9HcSqJPIZBFfg6xWsRs/n2glq/3HD3rxEr5Ca6WxO7om
         DYUOAKUO05QsFhBOVzoUI8dlqtKVqSdKTTduxyurMZsF6iLN9+Ee0r8PKzp0NnJinK6r
         HVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=FWOannr2iuTDZ0ZncVsxJfUm9KuOYTu+vWazTc7O7SA=;
        b=lekE/UNPC+oFwiGDKsOeWhKXaaiWVL7Jx6cwfGG8H+X/cS7Fxo8bcKiOsN5M8qQrgJ
         lI3WA/EW8SLb9PheRAnHHm0+1IhGi7McrlnHaaifmY8JdVHpwf//XOw7V9/osw0QGhT5
         K/UFf9kQKRoUq49MtmXuOH0rja5jdsfd++N55Is508HNNfQR0y5tlc620+fMhFPh/1l3
         vhc9/4EA/kzM40bHFiV50EFOe9AQjDg9tumPQWpGhEPTaY2TJIdZmuU8ezEhU+z2IeM4
         bP+efY7TTE0Uyq7jCzCOh1rAQo7nxXw3ycfK+P7mbZpOvX4vGmjlMq4iQYnwjLv4lsWD
         eseA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h125si7716947yba.281.2020.11.26.23.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 23:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiY2z-0002C3-9r
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 02:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1m-0002Aq-6q; Fri, 27 Nov 2020 02:18:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1k-0007gu-2Z; Fri, 27 Nov 2020 02:18:45 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cj5ZB4vSkzkZmR;
 Fri, 27 Nov 2020 15:18:10 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:31 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri, 27 Nov 2020 15:17:57 +0800
Message-ID: <20201127071803.2479462-2-ganqixin@huawei.com>
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
 Beniamino Galvani <b.galvani@gmail.com>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ru5dbB/C+IdB

When running device-introspect-test, a memory leak occurred in the a10_pit_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 288 byte(s) in 6 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
    #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
    #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
    #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
    #6 0xaaabf57415e8 in a10_pit_init /qemu/hw/timer/allwinner-a10-pit.c:278
    #7 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #8 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
    #9 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
    #10 0xaaabf5b94680 in aw_a10_init /qemu/hw/arm/allwinner-a10.c:49
    #11 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #12 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Beniamino Galvani <b.galvani@gmail.com>
---
 hw/timer/allwinner-a10-pit.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index f84fc0ea25..be211983b0 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -279,6 +279,16 @@ static void a10_pit_init(Object *obj)
     }
 }
 
+static void a10_pit_finalize(Object *obj)
+{
+    AwA10PITState *s = AW_A10_PIT(obj);
+    int i;
+
+    for (i = 0; i < AW_A10_PIT_TIMER_NR; i++) {
+        ptimer_free(s->timer[i]);
+    }
+}
+
 static void a10_pit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -290,11 +300,12 @@ static void a10_pit_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo a10_pit_info = {
-    .name = TYPE_AW_A10_PIT,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AwA10PITState),
-    .instance_init = a10_pit_init,
-    .class_init = a10_pit_class_init,
+    .name              = TYPE_AW_A10_PIT,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(AwA10PITState),
+    .instance_init     = a10_pit_init,
+    .instance_finalize = a10_pit_finalize,
+    .class_init        = a10_pit_class_init,
 };
 
 static void a10_register_types(void)
-- 
2.23.0

