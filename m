Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp683120ejb;
        Wed, 22 May 2024 14:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYnjwpmSHLvMRMqogYr3sSC7a9tcPNSmmDxHnrbJmTEWKtkPq1hYvBrkiXx1M88hXjbkZ7HDmzGmMfG7g6xotVCZtiLXlb
X-Google-Smtp-Source: AGHT+IERdydGLPVxjfR6vK24wl3yU5ytzb4VU9toBFh/vsJSB4DvmocO3kyiBLToTd0KbEhaIdko
X-Received: by 2002:adf:fc03:0:b0:34a:a754:eb48 with SMTP id ffacd0b85a97d-354d8d9562bmr1914400f8f.48.1716412464271;
        Wed, 22 May 2024 14:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716412464; cv=none;
        d=google.com; s=arc-20160816;
        b=jLYZgXTzLfnmnW3tnaYfpC3MGPCAtGzML4gPngjHGZLv97la1Q4Pno8LoGeSpLdhJo
         c5bmbxtpnV+fcVuOZQGZsfmz0xFdelDmQB/VYmqaA01ZCjnnYXwhF1wH81pX/EAy/EO7
         ArBieQjF/T7CnRJTZYW87Uu9YEEGiy5h99/2kr4tNhAKIL6akagr8J0eRoQ9OUFoi45F
         IvXb+o9BMugbOpA4XkD3ptKq/R5GUKKvle3LV80nH3NlmwtzH0fNRJsZdi3boklZK2+i
         myPknjl554FIIuMZtwUOeLJ/IOGtzl3SbRaraT0dQSDkL9YwjL5EnfLspxaI1ZosFmdD
         0O1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=pYXhnQ4UWkQ7wFS6R8BfGdIwRZEiTw05+Prg9/TV8DM=;
        fh=H0Ocb1F6OX7lJ2ZIq00L95YQd0stuI+T6mW0qgz5F80=;
        b=Tg2LtY07/r6wlpyDlwYINa2V/fxeuVxhV/ipDILbhnOT6FpHvykhUZRnEx7D68JS3o
         6SteBbK53vSEbLDAC/QeiCLaSFW/p+vgdJVb3pEVhdxRAvbv/nktEPmw4NeoM5a7uNZZ
         G7wYj5w+WqqLhk6Ql09/SaoFAwCdeFp6x6UmTR9cHa2Xif2gi3coRlN5dONCyUrXMXCW
         G42attey4fLqIcng2nfHOY9Kp70MflNTL1HNkx99zwTAG3gBectqkxRGfCsFm3IRxTzm
         NdTfPSh9FwezXmF5bUqPLSfHHdD9oCWGZzg9rFkouOjj7qrjJ9YmHnS+7IV/LMWhs4uN
         5K0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-354f19049ebsi866927f8f.291.2024.05.22.14.14.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2024 14:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vl3qk6rmPz6JB1s;
	Thu, 23 May 2024 05:10:42 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 35D1A140B18;
	Thu, 23 May 2024 05:14:23 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.48.156.123) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 22:14:01 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Shaoqin
 Huang <shahuang@redhat.com>
Subject: [PATCH V11 7/8] gdbstub: Add helper function to unregister GDB register space
Date: Wed, 22 May 2024 22:11:10 +0100
Message-ID: <20240522211111.232114-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522211111.232114-1-salil.mehta@huawei.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.156.123]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: PxRfh4Ndgy7R

Add common function to help unregister the GDB register space. This shall be
done in context to the CPU unrealization.

Note: These are common functions exported to arch specific code. For example,
for ARM this code is being referred in associated arch specific patch-set:

Link: https://lore.kernel.org/qemu-devel/20230926103654.34424-1-salil.mehta@huawei.com/

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
---
 gdbstub/gdbstub.c      | 13 +++++++++++++
 hw/core/cpu-common.c   |  1 -
 include/exec/gdbstub.h |  6 ++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b3574997ea..1949b09240 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -617,6 +617,19 @@ void gdb_register_coprocessor(CPUState *cpu,
     }
 }
 
+void gdb_unregister_coprocessor_all(CPUState *cpu)
+{
+    /*
+     * Safe to nuke everything. GDBRegisterState::xml is static const char so
+     * it won't be freed
+     */
+    g_array_free(cpu->gdb_regs, true);
+
+    cpu->gdb_regs = NULL;
+    cpu->gdb_num_regs = 0;
+    cpu->gdb_num_g_regs = 0;
+}
+
 static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 {
     CPUState *cpu = gdb_get_first_cpu_in_process(p);
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 0f0a247f56..e5140b4bc1 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -274,7 +274,6 @@ static void cpu_common_finalize(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
-    g_array_free(cpu->gdb_regs, TRUE);
     qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
     qemu_mutex_destroy(&cpu->work_mutex);
 }
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index eb14b91139..249d4d4bc8 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -49,6 +49,12 @@ void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               const GDBFeature *feature, int g_pos);
 
+/**
+ * gdb_unregister_coprocessor_all() - unregisters supplemental set of registers
+ * @cpu - the CPU associated with registers
+ */
+void gdb_unregister_coprocessor_all(CPUState *cpu);
+
 /**
  * gdbserver_start: start the gdb server
  * @port_or_device: connection spec for gdb
-- 
2.34.1
