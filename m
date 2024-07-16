Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp100720njk;
        Tue, 16 Jul 2024 04:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+/Z8LpuZ/MHdEg5uJ8MnVIWBtFgsRCifoDzuMvX63aeKKBD6hX7QvuT2cxPxKqbXb0SNVTM7jEUsZNeQ0L2LWSoFzuTjo
X-Google-Smtp-Source: AGHT+IEHZI3GIg20R9ubk+CcplY9P/Wq3uyONU8uAvMLGzLjV7cGqmOy53FvOnZAvZRW8SJ7JKD0
X-Received: by 2002:a5d:6612:0:b0:360:866f:5083 with SMTP id ffacd0b85a97d-368274eb83cmr1154737f8f.32.1721128665852;
        Tue, 16 Jul 2024 04:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721128665; cv=none;
        d=google.com; s=arc-20160816;
        b=YWJr+b03pmPRoWf+LZE59x+geE6DTXr48Esbr+NqOdSLIN9P8NMACPO5DIV3CeaS79
         WrgqNTDny7VpGY1d8GspafAIu+mWIk/guAtYKzxZUktR/79df5xxqzcEMnXT0kdSBFVc
         QSAQKZeCLg8nlS+iwfBhMqwJXKPEmo9YSVoSIdBZKABky+dMHijksIYgW5+eYYkoB4mI
         sbutUP2I3KSJR45trQ5AQYBegSrUBPoHLW8lQQBX3kxnaAKHKGfjkcsM7hkoasaICizQ
         TcWcBO3hYWSb6TY9EhSYnHPd/9VbTzzP6WmdXbMl7NQkOh0eksFPFWXwjFODS7KdZ9WG
         r6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=lr2K/OOfkNC3eW8FE/b5qXlHw9lxPyN1QeMYlNPFJqo=;
        fh=CjFwyFzaCSmkOKy2YiKnMv5LVRyC5Im7ETbbL0XKxCE=;
        b=dEPFzFayKICO/YQ7iUnbYty4HZ//kFTFMmk4B62BsIbMUrbzZLf8kHKpqJHgbxzkAv
         0UIU3T6g+e42uvNfyO6tLqU4AxMCuJMmUrNieKRkKzpeYZH8+FrMXpoFdg+2EsfjIP56
         mCMXTF72eo0UYUw26dpxBH9ShpbW+KqD2QAK8b+4hTxQ99OjK00fPNOkm2W0pV31bwOA
         eFyrFLInpiLpYTkjSDOFRkav3o90PwyZ7gOvoqzL+PQLaavoVPNa1398dBy6QTS1UEWx
         LvHqElEGuBWGxIvmzVlNRs+ilZBvN6eKXATsjEo0t0hXf96NvUcv1iQ0Fv8S8915m+yD
         Kdng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3680daf6b32si4111049f8f.385.2024.07.16.04.17.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2024 04:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WNc282wfnz6K66M;
	Tue, 16 Jul 2024 19:16:00 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id C7191140119;
	Tue, 16 Jul 2024 19:17:44 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.92) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 12:17:26 +0100
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
Subject: [PATCH V16 7/7] gdbstub: Add helper function to unregister GDB register space
Date: Tue, 16 Jul 2024 12:15:02 +0100
Message-ID: <20240716111502.202344-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716111502.202344-1-salil.mehta@huawei.com>
References: <20240716111502.202344-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.170.92]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: OrOIARhicRon

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
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 gdbstub/gdbstub.c      | 13 +++++++++++++
 hw/core/cpu-common.c   |  5 ++++-
 include/exec/gdbstub.h |  6 ++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

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
index b19e1fdacf..f6d62df34f 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -281,7 +281,10 @@ static void cpu_common_finalize(Object *obj)
         g_free(cpu->plugin_state);
     }
 #endif
-    g_array_free(cpu->gdb_regs, TRUE);
+    /* If cleanup didn't happen in context to gdb_unregister_coprocessor_all */
+    if (cpu->gdb_regs) {
+        g_array_free(cpu->gdb_regs, TRUE);
+    }
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
