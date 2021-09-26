Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2791926lfp;
        Sun, 26 Sep 2021 01:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziBtGgmiWGxmJTftE38PK64qVcXhqVTFn113h+JacT4EjtYsd8tUjZg8Sgv8L5fOGqEL0u
X-Received: by 2002:a25:2a57:: with SMTP id q84mr23192152ybq.404.1632646385079;
        Sun, 26 Sep 2021 01:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632646385; cv=none;
        d=google.com; s=arc-20160816;
        b=UMTtfPA//lM78QSinc7r3N4D3UKGgYMluwXcuaiavufEHgVokp5EjkuoqOGO0OlDth
         WGOpn2qPs+iOQktWH3ExEDtelyGYixhw9aQjZU7nqbty514OnbR8AkpW2cVy5wbnSbSD
         CZxVUv8FLvwBOlLSG3VHkVhYc29bzyZmruQKKwR/vGyGN75hlyFtbiL2095bOwqVf6cO
         U5ZN6WOw8hxq+C2CQgxHF5qWaH36ZGX7fzK804dUV8GTf6z1JZB1Z5uFbDcKPuJ4GWVb
         eOMM7+AxS8lCApIMTUXz86Oy063oh/2OWnyfTtD5loakTtMC2VIhEa69G0oWGnovN/QQ
         IUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=OEN35ln02mPxE//8DwJIGxLTmXnijD13nYkkeuRwOeU=;
        b=hCP5jSjVE0gO1Pl/1Of91Tg474OnYN1QwSUBZMd9NriWtOj/d270yCyM32GH97Ck+Y
         +GgLk/o70/2gAVxx5hkIyaNa6Oqqx4Ltwajx/6lYwdT1ocOX4TMbCqfUdgpMFj8k9ihU
         cLm1OFJBnTziD5cT+4J8ft2DyATUgQZRzLkP6rBIIIwuhWDRHUUZdhTq6Xc6DxaMYy11
         LhtL24rFOA+ZlFzGmuZMel2YtX3VCgsv/kF4ErsIWgx8KBRUrFGtW7BW+wGr7nogAilA
         1UwlpXfjjuepGhP/PVjnb/ONrVXcAQugQfYyY2tXWk4dIIY9VG1YQP82t/JO/zcRM+vW
         1y9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si17737755ybs.70.2021.09.26.01.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPuC-0001Gy-FX
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPne-0006Fr-U3; Sun, 26 Sep 2021 04:46:20 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnc-0002dQ-Hz; Sun, 26 Sep 2021 04:46:18 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HHK8S2fJcz1DH4N;
 Sun, 26 Sep 2021 16:44:56 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:11 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:10 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 12/14] machine: Remove smp_parse callback from MachineClass
Date: Sun, 26 Sep 2021 16:45:39 +0800
Message-ID: <20210926084541.17352-13-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7P16av/Gxb0Q

Now we have a generic smp parser for all arches, and there will
not be any other arch specific ones, so let's remove the callback
from MachineClass and call the parser directly.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c   | 3 +--
 include/hw/boards.h | 5 -----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4b5c943f8e..ca7ca68ae3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -937,7 +937,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                     "CPU topology parameters must be greater than zero");
     }
 
-    mc->smp_parse(ms, config, errp);
+    smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
     }
@@ -966,7 +966,6 @@ static void machine_class_init(ObjectClass *oc, void *data)
     /* Default 128 MB as guest ram size */
     mc->default_ram_size = 128 * MiB;
     mc->rom_file_has_mr = true;
-    mc->smp_parse = smp_parse;
 
     /* numa node memory size aligned on 8MB by default.
      * On Linux, each node's border has to be 8MB aligned
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 72a23e4e0f..fa284e01e9 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -177,10 +177,6 @@ typedef struct {
  *    kvm-type may be NULL if it is not needed.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
- * @smp_parse:
- *    The function pointer to hook different machine specific functions for
- *    parsing "smp-opts" from QemuOpts to MachineState::CpuTopology and more
- *    machine specific topology fields, such as smp_dies for PCMachine.
  * @hotplug_allowed:
  *    If the hook is provided, then it'll be called for each device
  *    hotplug to check whether the device hotplug is allowed.  Return
@@ -217,7 +213,6 @@ struct MachineClass {
     void (*reset)(MachineState *state);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
-    void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
-- 
2.19.1

