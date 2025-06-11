Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2930538njc;
        Wed, 11 Jun 2025 08:57:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHPeeM7JTkPqcJve0pM2QBnxSEAhCg5Bwv0oz7p7wh9QmrJxmUn1HydSIOETeprYgbWoRfKLxTyD1m8A==@linaro.org
X-Google-Smtp-Source: AGHT+IH7lH5xapCVxx+dgEaXuiWl9Z94V7u1ppfCQudLzi0t59/1UO0UuL7UpT9JmB5P4/QUEsnU
X-Received: by 2002:a05:6214:29e7:b0:6fa:fbb4:6408 with SMTP id 6a1803df08f44-6fb2c31e3c6mr69455156d6.7.1749657466041;
        Wed, 11 Jun 2025 08:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749657466; cv=none;
        d=google.com; s=arc-20240605;
        b=J3zIcDsTKTIn/WnZJ9HYec2bamtsZqZ0ualkIIt6Mx1kVfdwUo86p50GvplYgpKWv+
         wrjYZkAV58wEepF9aWcLc8hhvpNKwYkwwlCEkJgV/OcfzCPUH9T7nNnME2Dfz+Q14Hpx
         KnjEwpeCFNTqsY3zqBI/F9nPynpEI+SFTwBgKCIdaktjEOHSwZM9DM7VkoWfW/+akk88
         c4FVnXrZnOYdufKlJv3F3rHw6xH3KLVwEdYabtVYsQnsA7OfYvnPIWfQCOnFPmHTHQNn
         RbYQElb6EDGyQvta4+kxqxNukOTfMSZAL7OS0vqOQEd1Nw2BHgF0jNyAgd5lwT1099uD
         xFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Xv+YKIbXPdaBORr+a8SklbJ8+GCC6E/h6X47RzIVrw4=;
        fh=BSTR0mN5riEHgpfDGU+Y04a8hUWGOTfFmwR91Qdx2Nw=;
        b=A8IOgyZnzWj/SlWm80DV63zSge37y9DnVOC70bC+RbXrKSokTPJ1P+bF2ypf2sN8w7
         vFWAxu3Y2Axz+uB5dU5CD01f2yf/tgdBT8gImzUWu2ivdbJAuCPsDwCxm+cKA4paLYtE
         /8jeS7FZhGK/ut8bpVUldR/CuAvlW2R3Krl5hLIxINbW326RulMy3tEIMZnsy7BcHuyU
         VYRb0Koohzf+dMnP/MjfOaZO3FhWWuR9ESSkjum3WnHQxeEwIcjMgnVXUTtk2Z1T/Wrh
         HL4hsgFcedOk9s58YPW+Ob+k7ddnlAWzL6ci3LABVlvJ1UknxzN9TOnRwMvXxJJrMDa3
         XEdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b2616fsi135324366d6.285.2025.06.11.08.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 08:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPNpW-00016E-3u; Wed, 11 Jun 2025 11:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNpT-00011B-SW; Wed, 11 Jun 2025 11:57:32 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNpS-0008Rv-1j; Wed, 11 Jun 2025 11:57:31 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHVf3421Dz6GDnf;
 Wed, 11 Jun 2025 23:56:59 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 0D3561402F4;
 Wed, 11 Jun 2025 23:57:24 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Jun 2025 17:57:23 +0200
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <maobibo@loongson.cn>, <mtosatti@redhat.com>,
 <peter.maydell@linaro.org>, <philmd@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v13 2/7] hw/core/machine: topology functions capabilities added
Date: Wed, 11 Jun 2025 16:56:13 +0100
Message-ID: <20250611155618.351-3-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611155618.351-1-alireza.sanaee@huawei.com>
References: <20250611155618.351-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5IlMxYQ2X3kt

Add two functions one of which finds the lowest level cache defined in
the cache description input, and the other checks if caches are defined
at a particular level.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 hw/core/machine-smp.c | 52 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   |  7 ++++++
 2 files changed, 59 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 0be0ac044c..a4d79e0aa4 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -406,3 +406,55 @@ bool machine_check_smp_cache(const MachineState *ms, Error **errp)
 
     return true;
 }
+
+/*
+ * This function assumes l3 and l2 have unified cache and l1 is split l1d
+ * and l1i, and further prepares the lowest cache level for a topology
+ * level.  The info will be fed to build_caches to create caches at the
+ * right level.
+ */
+bool machine_find_lowest_level_cache_at_topo_level(const MachineState *ms,
+                                                   int *level_found,
+                                                   CpuTopologyLevel topo_level)
+{
+
+    CpuTopologyLevel level;
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I);
+    if (level == topo_level) {
+        *level_found = 1;
+        return true;
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D);
+    if (level == topo_level) {
+        *level_found = 1;
+        return true;
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2);
+    if (level == topo_level) {
+        *level_found = 2;
+        return true;
+    }
+
+    level = machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3);
+    if (level == topo_level) {
+        *level_found = 3;
+        return true;
+    }
+
+    return false;
+}
+
+bool machine_check_cache_at_topo_level(const MachineState *ms,
+                                       CpuTopologyLevel level)
+{
+    if (machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3) == level ||
+        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2) == level ||
+        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I) == level ||
+        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D) == level) {
+        return true;
+    }
+    return false;
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index f424b2b505..b24da305c4 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -55,6 +55,13 @@ void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
                                   CpuTopologyLevel level);
 bool machine_check_smp_cache(const MachineState *ms, Error **errp);
 void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
+bool machine_check_cache_at_topo_level(const MachineState *ms,
+                                       CpuTopologyLevel level);
+
+bool machine_find_lowest_level_cache_at_topo_level(const MachineState *ms,
+                                                   int *level_found,
+                                                   CpuTopologyLevel topo_level);
+
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
-- 
2.43.0

