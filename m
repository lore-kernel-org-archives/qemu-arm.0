Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3568105lfm;
        Mon, 13 Apr 2020 02:18:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypIznYU6bVhih6XqX15U7ha1CnauKTX8lrJIBxa49gLWAaajlOJdK7WcAoMNyGDQL0Aopd2G
X-Received: by 2002:a37:6191:: with SMTP id v139mr4089106qkb.469.1586769534105;
        Mon, 13 Apr 2020 02:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586769534; cv=none;
        d=google.com; s=arc-20160816;
        b=CbyMRK/gpLV3rfGd46T1Kp8jdBfOejKNQgqp15b2ASm2C2+KZuVSCd4JKhtBEchJnh
         ydRQoVzikincZ/huVSrmmSr9e7ioUOw0p+9mNsFeU0f/d3OrlifO9V549BIuzyjD+UJX
         gT65JQ0Y4OYNwWHHw2toZgb5MJ2Qo4L+WwStUDMaJuM3XGYn78uH01uEPao/ady4OBQi
         FScoVMx68KpQ8XBIFXUJ2Yuj9Tx916y5JiBDYSngmxinyqkAKGo/o01gZjmJVNLpXidJ
         cSBbZYaqA+eXCRoD1jIhMKSFMODNQkb14S43ZdS5Td/6snRAc8UZn8T+jY/ABShnJC0B
         3J6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=74lrm29DdlxF/q2OO2seXpWT83MaDVmHxfdQIOB03Io=;
        b=JpbkN02qHG7ctzP6tEWYKgxCrhPublfABJmp6L5WkT+G2ry7AoyXKVgRbam5pgZOsz
         aupCYO4zlVftnh4zYflgT4lqprId78Rqw7kNGHOHzGV2Wkdq4fjbG7hthspUVXDo9FMu
         4p8ulVys+MPnJYiwTDk+nIDy6hRZ9q1v25AWlj4mI6XWVxZCQz/Yv/uZnu9xTaYTjCfi
         L/35b9cdy3pZmhUP4FX+uX/6T732MM5E4W6mEO31A7CDRfBNjLkkO6MJ2SPY2x5qZ20b
         mYYhwa8jamsHcJ89x2bWaJQG+/vC1j585GXUAPILfLUpAma+mQZytttG7aDHVEUzNw/N
         1xeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si3408185qkg.66.2020.04.13.02.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 02:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNvEz-0001hO-Il
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 05:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEi-0001SS-Jh
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEh-00062I-H3
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37966 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jNvEh-0005zM-6Z; Mon, 13 Apr 2020 05:18:35 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1C765453D2D92EB224A4;
 Mon, 13 Apr 2020 17:18:27 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Apr 2020 17:18:19 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 3/3] Typo: Correct the name of CPU hotplug memory region
Date: Mon, 13 Apr 2020 17:15:52 +0800
Message-ID: <20200413091552.62748-4-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200413091552.62748-1-zhukeqian1@huawei.com>
References: <20200413091552.62748-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GSAwznrjbKEm

Replace "acpi-mem-hotplug" with "acpi-cpu-hotplug"

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/acpi/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index e2c957ce00..3d6a500fb7 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -222,7 +222,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *ow=
ner,
         state->devs[i].arch_id =3D id_list->cpus[i].arch_id;
     }
     memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, sta=
te,
-                          "acpi-mem-hotplug", ACPI_CPU_HOTPLUG_REG_LEN);
+                          "acpi-cpu-hotplug", ACPI_CPU_HOTPLUG_REG_LEN);
     memory_region_add_subregion(as, base_addr, &state->ctrl_reg);
 }
=20
--=20
2.19.1

