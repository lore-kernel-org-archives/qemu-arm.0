Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp806797nji;
        Fri, 12 Jul 2024 06:45:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJzJxOhEWYakJjYAX74fZmtQaeK1XAHcoUK3W8/nY8tl5406fp/+ShhttgOgEydRrPrHhbeIQn1H8/NSgcskat3f+AX78E
X-Google-Smtp-Source: AGHT+IFAJ9jFateVdkSJd9cWR4xURqM8TPdwJUktni7DwPykqL6cEpNt0vrRJT5usuCxcBMIddu9
X-Received: by 2002:a5d:47c4:0:b0:366:e9f7:4e73 with SMTP id ffacd0b85a97d-367ff6e758emr2530597f8f.5.1720791918227;
        Fri, 12 Jul 2024 06:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720791918; cv=none;
        d=google.com; s=arc-20160816;
        b=Sm/Fb7KcBwu//lHn1J+T8LwfhVLPBgT4y+FpQ8l+46PcjS2g3jEcHytq1+BT6qkm0u
         wya9pWt+EDtPdQrQxTtkJs1drRcHRWeB9cR7TqAiuMPveRKPfy77m6eXe1EMHRbspsfM
         bM7nFI/vYhfan47hr52BRIIJ1D4KJEE9jSoBf0lDBlAgfbgmXXerojuZcpq9DWAwi9on
         gJ5QAgwjLCu6XGQOQ+iiEVEFXivT2xDiYRQ7vDH8cm1ebMp26WGALdwxwZ2sxoKoHx7m
         mmBxIXsdf8546Nf5IiuWoVHIG3cUvhJqyizOT4Hao1Um7E9VoC/dE7s6K2CY+huzCa0W
         +YPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=lBdXBzCJgmDUEJoCWadXYLQSyAGEz4jMthRR1IcPgE4=;
        fh=CjFwyFzaCSmkOKy2YiKnMv5LVRyC5Im7ETbbL0XKxCE=;
        b=u9e9FiWa4BUJLYxe3tyNzF5daXYg7K2bDSFozcX6FfA7ZChd3zZWaMDy/Zdg2RdaBA
         iDwnudjyCUdzMcTkuxEIOgeK1W/HZzKjdXpoKg2U8YXIjWdkYj7hIWja8e5G5H/EIc0h
         kmR7WzOQmDN5vn1dkqfJZ+5Pup5D8S8xz8itkAy6WYcEZ0vi4eZuRiVy01adDzCRoudy
         1dU9+tM72f0DM+9extVJ2JETP3J9PpX3GogO7YIhJhrdJ1kwJdjeVWSQBAvrf0kQxdyR
         wsehin1p7sTUgaiWNVRHuT9refwEMS9gdW9zzJC8F/8xSNdHMbwTD4oXxgM3VAS1dXeq
         /HUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-367cdfb5b6fsi5069262f8f.838.2024.07.12.06.45.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLCTp160jz6K6g0;
	Fri, 12 Jul 2024 21:43:10 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id EFE0B1400D9;
	Fri, 12 Jul 2024 21:45:16 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.195.244.27) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 14:44:55 +0100
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
 Huang <shahuang@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH V14 7/7] gdbstub: Add helper function to unregister GDB register space
Date: Fri, 12 Jul 2024 14:42:01 +0100
Message-ID: <20240712134201.214699-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712134201.214699-1-salil.mehta@huawei.com>
References: <20240712134201.214699-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.244.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: fIIcWm0/JZNl

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
Tested-by: Zhao Liu <zhao1.liu@intel.com>
---
 gdbstub/gdbstub.c      | 13 +++++++++++++
 hw/core/cpu-common.c   |  4 +++-
 include/exec/gdbstub.h |  6 ++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b9ad0a063e..5da17d6530 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -618,6 +618,19 @@ void gdb_register_coprocessor(CPUState *cpu,
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
index b19e1fdacf..fe5383b4f9 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -281,7 +281,9 @@ static void cpu_common_finalize(Object *obj)
         g_free(cpu->plugin_state);
     }
 #endif
-    g_array_free(cpu->gdb_regs, TRUE);
+    /* If cleanup didn't happen in context to gdb_unregister_coprocessor_all */
+    if (cpu->gdb_regs)
+        g_array_free(cpu->gdb_regs, TRUE);
     qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
     qemu_mutex_destroy(&cpu->work_mutex);
     qemu_cond_destroy(cpu->halt_cond);
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 1bd2c4ec2a..d73f424f56 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -40,6 +40,12 @@ void gdb_register_coprocessor(CPUState *cpu,
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
