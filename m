Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1686218ejf;
        Tue, 16 Aug 2022 02:51:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4dFSGB5GW5648WNLDKTgakid7juTGGoHIKWO3ROzrwL2Hc6a7SlYDdQHuGiX/WtJwlOrqC
X-Received: by 2002:ae9:ef0f:0:b0:6bb:1e6:cb69 with SMTP id d15-20020ae9ef0f000000b006bb01e6cb69mr9074281qkg.275.1660643480020;
        Tue, 16 Aug 2022 02:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660643480; cv=none;
        d=google.com; s=arc-20160816;
        b=usK/6ILYKfR/1YKUiAyxFQqwyB6xblPA5eKjPeqeumle9ijif2EQA66ABdJaqMrE9P
         7zeCQaAmaYJ6cmv7JKKBg+4+TDU4eac1u4+fORo23TYx7BK2+FbQ/dmQwdHs9lSlgpmv
         eW8z6Aw4qrq3gQ+E/c4ntKcREPWj1tUqIqSIjTRy6zDMQG+Cc0HRtRY6UQjDvZs7npFH
         1pKSFOCzvevklpm0AJP5KVM1FX4d65HdRVJisO7y+MyuHvCkLXTTbSVsNKZtsYM37sou
         hv72Bnc/O1mu2fKK9HgaNlQcZhG1ra6JffdKY3siFCxknwEnn32C1oOff0pwo5K2Y9ZE
         48Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=8VBu0JktVgSLQ8BBldfsJpmmi4HJF/zbQDAkLyo/fRE=;
        b=IY0kG9Rgc/q5HerqULMT6IaqZYj0Qdp5vw9M/S4l+2C1VTh+eeKCf1Q9IIABvPGp4B
         hoI0E49rRqcjY8Tg+pYEgtRNjXw3LsbEzN3E0vMVfq1og/ZGjJ7jR2RxPbt4VUsi0kf6
         xeh1KmBjyvuHCAFJ8LJF7mllea9tePce2Pf21+UahZIQAyuUvwZ7xHeLSehy8xkyXZ6f
         5AUdbk6JnEyf0iQ0+gI52hRAFs9ah8JOgNcupLHnek3/6aQ5haOEuZ0+dBuKT4umiNpM
         1iaR0S8MGaQC9uosqDJ1hxHsoP9iZhckER8AmCS1aKE+IAlERxLofE9sk2p1DAxCPklp
         lO6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a056214194900b00494c6ca52d0si492675qvk.85.2022.08.16.02.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Aug 2022 02:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNtEF-0004wR-H4
	for alex.bennee@linaro.org; Tue, 16 Aug 2022 05:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1oNtDH-0004CP-Mn; Tue, 16 Aug 2022 05:50:19 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1oNtD6-0007fA-Ub; Tue, 16 Aug 2022 05:50:19 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M6RCV4HYxzhYQn;
 Tue, 16 Aug 2022 17:47:50 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 16 Aug 2022 17:50:01 +0800
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.224) by
 kwepemm600016.china.huawei.com (7.193.23.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 16 Aug 2022 17:50:00 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-trivial@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Eric Auger
 <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, <wanghaibin.wang@huawei.com>
Subject: [PATCH v2] hw/acpi: Add ospm_status hook implementation for acpi-ged
Date: Tue, 16 Aug 2022 17:49:57 +0800
Message-ID: <20220816094957.31700-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.224]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600016.china.huawei.com (7.193.23.20)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhukeqian1@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Keqian Zhu <zhukeqian1@huawei.com>
From:  Keqian Zhu via <qemu-arm@nongnu.org>
X-TUID: UaJQzrMg+IwL

Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
causes segmentation fault with following dumpstack:
 #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
 #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
 #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
 #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
 #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
 #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
 #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
 #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
 #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
 #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
 #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
 #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
 #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
 #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47

Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/acpi/generic_event_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index e28457a7d1..a3d31631fe 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -267,6 +267,13 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
+{
+    AcpiGedState *s = ACPI_GED(adev);
+
+    acpi_memory_ospm_status(&s->memhp_state, list);
+}
+
 static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
     AcpiGedState *s = ACPI_GED(adev);
@@ -409,6 +416,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
 
+    adevc->ospm_status = acpi_ged_ospm_status;
     adevc->send_event = acpi_ged_send_event;
 }
 
-- 
2.33.0

