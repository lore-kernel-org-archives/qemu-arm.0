Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1753265ejb;
        Mon, 20 May 2024 16:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiVb7EveSa8Kw4j6WUNt9965XaNU7lc6ahR9ZavPwodtaWd+2U+kH80NfhaazJ+OG0sSwK8pzcrwdfMSRpHSPMSggssysx
X-Google-Smtp-Source: AGHT+IGxhSEJIhCJT+R/PLCC/uEsUKKmuU1ANTvEDRz91/rJACEvPdCbmYtTjWM3+yrn/90u8tth
X-Received: by 2002:a05:600c:5020:b0:420:1592:da3f with SMTP id 5b1f17b1804b1-4201592e454mr167604545e9.11.1716248167576;
        Mon, 20 May 2024 16:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716248167; cv=none;
        d=google.com; s=arc-20160816;
        b=G3JgjJFxhW0pCCD3DEu/CQhZfKROI3CpHKnEbqgxen2RBOXh5LrGCYOx6dFNttAxJk
         GSd/hLlqahzuQruoh+XquDUIoMHtuLsJLlgcjr5VfljTWNJ7Qm55EOGQOPkGhqkjmoGE
         07VUOpyclMUyiJj8c3IyEE/somtQ0nHlt/RFUipmmo+kdvBOQtFP2Y6fEZscbb2YoBS2
         R6aeZVhLQ5wuPFKFHgt58huqC+1eQCTtUiEWi5RbvOkTbTKrd94RJ1m5+c2NahP5QTms
         3/dlJdb4+tRCShSgIys5yG5MtGRlvIpZh855Mpp2JFd40r6hJrqruRq7yMA0fUxEns/P
         6KyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=eZraRWXWqU3ldPOOQ/gTW1eW7uZF66L/ky8P0jTeHlI=;
        fh=H0Ocb1F6OX7lJ2ZIq00L95YQd0stuI+T6mW0qgz5F80=;
        b=E6hNwxiHwZgA0N8pB4p7ioJvRtC3xYa7BANafdknVH46yT8B+AKkAfbBWCPkifH33t
         LU7t9FEYTqGKx5vO/DLIfQvs/SulkwdjT0NF8fg4xJl6ib01Gwahxk+mDJchRkyqeiOU
         CdrW1/CTD+CESkrDQOx4397PiXOxQjnaxSF97Kl8RZWziiWy1pC5uFMeSPDtjptvsPiX
         +bA0JUwEqvkzjzJ5qCfWixPDTIvjDIofdY4GfGZ2ByeOR727xhL6ImYmFRz63CpSRMEA
         L3HwIeHHcmRPilH+KU87n279BJnPRUlWAWEABpRM0AD/Os6cWLzMdWALwQHWX4B4Wokr
         rWVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3502c0fd91esi14791164f8f.1056.2024.05.20.16.36.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2024 16:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vjv7V68rKz6J682;
	Tue, 21 May 2024 07:35:18 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D8C31400D4;
	Tue, 21 May 2024 07:36:06 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 00:35:44 +0100
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
Subject: [PATCH V10 7/8] gdbstub: Add helper function to unregister GDB register space
Date: Tue, 21 May 2024 00:32:40 +0100
Message-ID: <20240520233241.229675-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520233241.229675-1-salil.mehta@huawei.com>
References: <20240520233241.229675-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: N94Uot+GcEG7

Add common function to help unregister the GDB register space. This shall be
done in context to the CPU unrealization.

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
