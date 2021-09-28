Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4493065lfp;
        Mon, 27 Sep 2021 21:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk6dXcotkYJlOW3lBioASo/AbhPk35RB3o5qwFSRv/IT5s4avpZG1XWtVR7IeG4HYIyzGG
X-Received: by 2002:a9d:7116:: with SMTP id n22mr3340737otj.56.1632802015973;
        Mon, 27 Sep 2021 21:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632802015; cv=none;
        d=google.com; s=arc-20160816;
        b=od+e8WqK+nBHmP7cbS8YzmpIye3HjKu6MjwKlPm4z2wZX9dDhP4nnH0DLr7Gx9o4wG
         dkmnixUevtM0w/uM4jjchh2QmVb0RMI7BVDccv9KFrMq/qnC0qKhT2VGQ75YyYMCyBeG
         oM5Zwv3N9mRFqrfv3drkvR3fBd7qZhU4epBjE3hpDKgJde5rpH6AyKrbw/XBEtD0pB66
         y9NiK5UC0hM+jkJz9o1aQQuN5NYiAl+Ucg1Dr/L9et8Hyz6CF6WvWn3xsHu7Gs06OS/+
         oz+zEkjF65TquHK3kd1054oxjH41E6Pz+w91RwlTOJuX9/qd20sBmUVdC5S1059Wa7EN
         6uMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=x95znSM1RpkG6WQIlzdVD4LfJo+Cc6ChnffRP2morME=;
        b=PWgVr70IWDRSQ11HzK/biinYOk2bwBhJv4AEQmHA8rgnT4aeHSKCmPPV8A7DqEPnnr
         HusTLBro1dcsmiPHizSInO5UjqQroxKTPilWQxh/AdBFaueRkoA85zfgxdLmQsWLJE14
         T7K3ksDtzuYh6uXEoSly7tt+0Fw2myJS8UxLtWH9FhbKk1Mri9JKSfzZWXY/OoFXJb/8
         sgbkMkL9N1iJW4IaT0Yq2YiB7hd/LrEWnkFzsUcsc58nxgU9dK/h0rCzb854wx3PpLHY
         B5qquBY4wG21RdLyHy1CQAk5UietBI+8GhGk6A66COBbq4X7Iml/DT7nPZTmfWdgRD4R
         RarQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si11514941otn.99.2021.09.27.21.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 21:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mV4ON-0004T8-C7
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 00:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4G6-0001id-0k; Mon, 27 Sep 2021 23:58:22 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4G0-0002MM-22; Mon, 27 Sep 2021 23:58:21 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJQgB6LG7zW86N;
 Tue, 28 Sep 2021 11:56:54 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:12 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:11 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>
Subject: [PATCH v11 12/14] machine: Remove smp_parse callback from MachineClass
Date: Tue, 28 Sep 2021 11:57:53 +0800
Message-ID: <20210928035755.11684-13-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210928035755.11684-1-wangyanan55@huawei.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UWCO32pebjLp

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
index f5dadcbd78..23f77201eb 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -918,7 +918,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                     "CPU topology parameters must be greater than zero");
     }
 
-    mc->smp_parse(ms, config, errp);
+    smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
     }
@@ -947,7 +947,6 @@ static void machine_class_init(ObjectClass *oc, void *data)
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

