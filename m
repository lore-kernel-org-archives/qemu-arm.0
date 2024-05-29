Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp902050ejk;
        Wed, 29 May 2024 16:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZPfJ35mD808XBfDkNkSqNC+f/UvL9/jeq7xP7Czn+T1d7aGozaqqkMj9AKbO/gZbD0cXG33eJM16Yx4bn9yPnbpQ+vknr
X-Google-Smtp-Source: AGHT+IFiWt5q5jqTsa+ISBV34qUYcyeB7MuraYa9MXjAaCBSJcSCP6Ua/StNXnQ7xKtyPKXsLTHm
X-Received: by 2002:a05:6000:d4d:b0:34c:54c8:3f2d with SMTP id ffacd0b85a97d-35dc00c7055mr396165f8f.69.1717026368392;
        Wed, 29 May 2024 16:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717026368; cv=none;
        d=google.com; s=arc-20160816;
        b=n9kM8rudoukNNFMv0jxQQ8XLhdcaqu/PZ6gJfbNNY7t8ASGr2KAbY6Z94bU6zJe2I3
         2DfkudStl976WNO0irNTtJono82zl0LHvgXuLf/voaALNHYSR2wrNPu4lb0RYHzR9fo2
         kfx8tMAPBuWN6LhaIfOGvISmBqhSRLcHmqDJ7PSYB6kPlckqO/nolWFl2euR36aOGBN/
         9Wq8+9lE67Nh8iPHpudHKhxErNhY1o5RZP77pJFgbUUDAd/V1SjrpZdlbH9DP9vvXK74
         nCs3OeRpUZFkPyeD0opI9EbNvlW+CuKgzOwstntsw3hm+OE/7lqc6Dm9FtpEy5tD6yp+
         cLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Prs/MoDPhG8YIh1BRlc3S7ddcISogZyxxjZUeOw/dPM=;
        fh=CjFwyFzaCSmkOKy2YiKnMv5LVRyC5Im7ETbbL0XKxCE=;
        b=UWEZk004hz7lGKhiCVwggZZh293vG3UfqRK1qJa9m7eHhT81moqeQe6XcgPu3bBGz1
         nMTe0oGvyazYK/kDYTCdAm5Mb3HSC/1uu25VPuQvDMSwtCd7HYRcjqUWw0173JzCAFXD
         QPWznN4YI1cH1hgM/T4oey1z5Fan9P1lpFcQs6SM/RWUcN/fmO/JL4mHSdzG/8RhAqxZ
         /iLppBP+4TSYJmAdHfXcr0BFDffTq7PlN9bxCzMpjyhPZVoJ5YhrriWPN+WVI4Z9cYej
         f0VESjCTgpUgpZuDjP+H1pjGSjMWfF8URAZFufdQw2sAs526IyxvLIj2AqMu/YCLt1WB
         QvPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35770fac3desi5538846f8f.408.2024.05.29.16.46.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2024 16:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VqQsC04LHz6J9yK;
	Thu, 30 May 2024 07:42:07 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 5699C140B33;
	Thu, 30 May 2024 07:46:07 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.246.47) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 00:45:45 +0100
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
Subject: [PATCH V12 7/8] gdbstub: Add helper function to unregister GDB register space
Date: Thu, 30 May 2024 00:42:40 +0100
Message-ID: <20240529234241.205053-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529234241.205053-1-salil.mehta@huawei.com>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.246.47]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: gABOgI898OXe

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
