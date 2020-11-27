Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2117657lfb;
        Thu, 26 Nov 2020 23:25:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6bH4loebosEdqfzE+u1sBd+sP+4CsrKL3ZpNsimSJpxwZ0xp/tOK/H1G9gWXwQmtFqaEK
X-Received: by 2002:a25:d287:: with SMTP id j129mr9068846ybg.289.1606461940480;
        Thu, 26 Nov 2020 23:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606461940; cv=none;
        d=google.com; s=arc-20160816;
        b=Iipw4qyWz4RHM1I6czmOZN/wySMS2FRVoE7B9EiKk6jrDj8kUZUR+ASCirOp8crRCk
         nx2nb5kgD9B7kOFPBTWForWdfPMvwv7lMBXDqpgWjP/mPCza8ziAdk0Qf3s2YbVCDFU9
         FEJ8Wn85ndBrEQcT4v/8JNLcUzlcjYjgBcYqhDmJf6zSHkKN36IfW059UlWf+TcH90OR
         VeCn2POEWsMVSodgATXqR1Ep4TjaTm/YwHCt22wsr4q5m9TI3D71aUQyQqP+ddJMkL5D
         eAbMI0S+vz6YlwkPFswOWV1HBTL8/sleEWA1qaIDswmY1XXK0x8IqBXpFPK024/O/kRy
         B04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=sVKMEmthZd6PabCHyp6gqRgfddDRO+KJhcuJYvRLUWU=;
        b=u+CAxLlndgtUwCtbq0Wl14D5wOoaXvIBI9N33zR9OvcY0rMVXAMpZkcZEoANWg3cJ0
         9CH2LXCUAoK9Y60gJteaH2utTyqy+R/7nvmChwdui1UnYoANTl8AfN934FcK0snU56gX
         J0ore85dGxbTZ9DXLLEbMMUjRwspgi+v4LCknIZRt1YyQNqSIGGy3ehnmzOtN35csCsx
         1c6AZQmjnG4q5xOJTI59MburT4nF0bcbeOYY9QlPDkSAtdMKoGFyDVdogCZXnU8sv6Yr
         D9d6oBSBM3V/nXaGjuPdQtUUg0iPWiP4kovqTpAdLlyewzvO6RSKkpTDOP+k2ZtZAmw9
         a7sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si9722381ybe.117.2020.11.26.23.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 23:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiY8R-0007rW-Pw
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 02:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1p-0002Eu-RE; Fri, 27 Nov 2020 02:18:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1n-0007gv-Uc; Fri, 27 Nov 2020 02:18:49 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cj5ZB4jvbzkZVH;
 Fri, 27 Nov 2020 15:18:10 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:33 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 2/7] digic-timer: Use ptimer_free() in the finalize function
 to avoid memleaks
Date: Fri, 27 Nov 2020 15:17:58 +0800
Message-ID: <20201127071803.2479462-3-ganqixin@huawei.com>
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
 Antony Pavlov <antonynpavlov@gmail.com>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gm2Vrkh0mpQ5

When running device-introspect-test, a memory leak occurred in the digic_timer_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 288 byte(s) in 3 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf5b04084 in digic_timer_init /qemu/hw/timer/digic-timer.c:142
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
    #6 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
    #7 0xaaabf5b40e84 in digic_init /qemu/hw/arm/digic.c:46
    #8 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #9 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #10 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #11 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #12 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Antony Pavlov <antonynpavlov@gmail.com>
---
 hw/timer/digic-timer.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index 32612228da..86075987fb 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -154,6 +154,13 @@ static void digic_timer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
 }
 
+static void digic_timer_finalize(Object *obj)
+{
+    DigicTimerState *s = DIGIC_TIMER(obj);
+
+    ptimer_free(s->ptimer);
+}
+
 static void digic_timer_class_init(ObjectClass *klass, void *class_data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -163,11 +170,12 @@ static void digic_timer_class_init(ObjectClass *klass, void *class_data)
 }
 
 static const TypeInfo digic_timer_info = {
-    .name = TYPE_DIGIC_TIMER,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(DigicTimerState),
-    .instance_init = digic_timer_init,
-    .class_init = digic_timer_class_init,
+    .name              = TYPE_DIGIC_TIMER,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(DigicTimerState),
+    .instance_init     = digic_timer_init,
+    .instance_finalize = digic_timer_finalize,
+    .class_init        = digic_timer_class_init,
 };
 
 static void digic_timer_register_type(void)
-- 
2.23.0

