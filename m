Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp450184lfm;
        Sat, 13 Jun 2020 14:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIJ9wNz884wRc+H6GiCPpoHCDm5jKov1NkewAEyd+UiU9+kYw6yWCRZYFEu2ncWhOUqT/a
X-Received: by 2002:a5b:785:: with SMTP id b5mr32190931ybq.96.1592084731250;
        Sat, 13 Jun 2020 14:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592084731; cv=none;
        d=google.com; s=arc-20160816;
        b=csbqak69H5td9JlesByfAfatunnGDDMXHmeYfnjsGQWzyMhdc/XLrRgBbWVdN5XHTl
         58C7ecJV7MYBJ1UC+8+alzyDxOz7FYouJ322abRCUVaVgU8dKMLx7XYAzmjjO5pF6dx4
         yy+8X0t31RBK5a5AympEzeiMSH2wzwLulH92eMULKd0CuOis8RH3zJCwI5vz0tXZwzl9
         wIBp/S3RscEbJ+Ni2rWD1lQtSRLDIpt1oJbhhoZbe8M+DW5UF3tGZn38xoqcCX+3BC4L
         e8H9SmK9HQA8odxtsxNtvUNxKJPNW9JkqNDERwYfRC7JxGtbQ8Y9huS/Z18vfUlrHwLk
         7+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=vDfQ16HaShTvjLVdbnzqdAtaXLJf5iPQTpXwn7a032c=;
        b=c1BI1VAsSFc+30NKq/MUDOs54zt3DQ0uuCC3NWnk4o2crHZfcE+9XX2b41OJeOysxv
         1wy8O+E+j3kn+lZhkYCf37cPCIKzLrPGZZip/N5/lLuupfIRieqdiB3g+4IHPFnSV8F5
         JqZms6nsl+9FasmgoX7w2O+MCL/YzzhUmxRiTRBDVrHrFdvo5uExwYHv6MyjGkgrjH0c
         ejOAHgid/F201coc9v4w9/H1Jk35aAdhBJJifinNznkZz8NTSryZ7fO4bE/245tONSyn
         rbOK92JtG1m6TtwpkHtAHcDt12pjWVPM9n9rYNmtpr8PRpg/a5fXuYPFtdikhB61u0HW
         V68A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i131si9161923ybg.369.2020.06.13.14.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkDxy-0006Y8-L3
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDxA-0005IW-Fe; Sat, 13 Jun 2020 17:44:40 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3774 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDx8-00036Y-LS; Sat, 13 Jun 2020 17:44:40 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3F683E6CF56D9F5BF53F;
 Sun, 14 Jun 2020 05:44:35 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:44:29 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 03/22] arm/cpuhp: Add common cpu utility for possible vcpus
Date: Sat, 13 Jun 2020 22:36:10 +0100
Message-ID: <20200613213629.21984-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PjT6mCPfmaB7

Adds various utility functions which might be required to fetch or check the
state of the possible vcpus. This also introduces concept of *disabled* vcpus,
which are part of the *possible* vcpus but are not part of the *present* vcpu.
This state shall be used during machine init time to check the presence of
vcpus.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 cpus-common.c         | 20 ++++++++++++++++++++
 include/hw/core/cpu.h | 21 +++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 70a9d12981..7cf900289b 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -23,6 +23,7 @@
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
+#include "hw/boards.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -82,6 +83,25 @@ void cpu_list_add(CPUState *cpu)
         assert(!cpu_index_auto_assigned);
     }
     QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
+    qemu_mutex_unlock(&qemu_cpu_list_lock);
+}
+
+CPUState *qemu_get_possible_cpu(int index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const CPUArchIdList *possible_cpus = ms->possible_cpus;
+    CPUState *cpu;
+
+    assert((index >= 0) && (index < possible_cpus->len));
+
+    cpu = CPU(possible_cpus->cpus[index].cpu);
+
+    return cpu;
+}
+
+bool qemu_present_cpu(CPUState *cpu)
+{
+    return (cpu && !cpu->disabled);
 }
 
 void cpu_list_remove(CPUState *cpu)
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 497600c49e..d9cae71ea5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -419,6 +419,7 @@ struct CPUState {
 
     GArray *plugin_mem_cbs;
 
+    bool disabled;
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
@@ -802,6 +803,26 @@ static inline bool cpu_in_exclusive_context(const CPUState *cpu)
  */
 CPUState *qemu_get_cpu(int index);
 
+/**
+ * qemu_get_possible_cpu:
+ * @index: The CPUState@cpu_index value of the CPU to obtain.
+ *
+ * Gets a CPU matching @index.
+ *
+ * Returns: The possible CPU or %NULL if there is no matching CPU.
+ */
+CPUState *qemu_get_possible_cpu(int index);
+
+/**
+ * qemu_present_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vcpu is amongst the present possible vcpus.
+ *
+ * Returns: True if it is present possible vcpu else false
+ */
+bool qemu_present_cpu(CPUState *cpu);
+
 /**
  * cpu_exists:
  * @id: Guest-exposed CPU ID to lookup.
-- 
2.17.1


