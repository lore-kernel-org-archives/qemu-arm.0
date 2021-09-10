Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp911908lfb;
        Fri, 10 Sep 2021 00:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy9pIjSfapOJZQ2BomzEBnmHaPxLK1pH8cKGz9+EFHePe01v06oepyyUM+B2q4XFWmdWNf
X-Received: by 2002:a92:bf01:: with SMTP id z1mr2058169ilh.155.1631259518747;
        Fri, 10 Sep 2021 00:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631259518; cv=none;
        d=google.com; s=arc-20160816;
        b=f5SeGYjAoZH3PWKlOpldC86pf7sMiM5YWQKs8ZnEh3BeZ6+rRDYIYoQ+yFGjWRtIkn
         gKBpIfNmNUaJK+Mg1bbt55wXvr0rS/Ve7yUg1dlnJ7pDYLNX4w81ewsVBTWRRRpU5ATW
         DCP/DZkOhvAhVzkld6r6HqZmYdrzY2lu9Ts/U/KYs9gjmlmcNxJDVa0uCz2OH2MWWZU5
         /mNoV22iYaUH5E2dvoxfINJp2aChD1LY9dy9Li4cK/0V5DPDdI/bj5Ms9/KIdpj8odxy
         V72G2rw+ZbLpkc1LAvV9FGc2xdrbg2ULnqeXz4aeWItWFnBqklJUHwyCmxqGOpXb+dyp
         8rSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=7l8+m4p3rmyuCVMbMZgaWlPthBxeD+NXgPmDOYtx7rU=;
        b=RHHNNPupDwZjmjo1LgYxqIgrxRx09YAgQ7A9lCGrAv4pFH6OM83Yn39J6pMa4pUelr
         6uUJ2exIFYRtWcdRZ8cRIfR6fsgRzAiM/5R6aAaCb152reGYSPXO/gtUliVbmaWAa4mh
         /YlYEqsUZjRjqU5FbOtF1CCVUeMKfaia61H6qAiQhp87yY16R6iYiQFeE6Vr1AM3f2+X
         XA+cb9uXbMeWWPdTMUAyF+4jb2TX52Rahgl69lOeCYok6n7QFLgDPvIvQwV8cSe1pjOU
         T0Uxe5tu0Q5vU0835qn71YQoEPnYggMqHF+o/nRm2bpMLSBl9tBCv9zuS/AKfPmPelGc
         qEvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h30si4045083ila.1.2021.09.10.00.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 00:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOb7O-0003lh-3u
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 03:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazs-00059X-VL; Fri, 10 Sep 2021 03:30:53 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazq-0000yv-JC; Fri, 10 Sep 2021 03:30:52 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H5S9b345GzR5Wj;
 Fri, 10 Sep 2021 15:26:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:45 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:44 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 12/16] machine: Remove smp_parse callback from MachineClass
Date: Fri, 10 Sep 2021 15:30:21 +0800
Message-ID: <20210910073025.16480-13-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: axYEswNY8ygq

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
2.23.0

