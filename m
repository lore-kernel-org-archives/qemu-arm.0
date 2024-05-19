Received: by 2002:a05:7022:fd07:b0:7c:9548:a19d with SMTP id up7csp4598448dlb;
        Sun, 19 May 2024 14:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0Y5FvL4JK/y+BJ5Fzltm+DBEE/n1Oo2IFw57fibSUPZBOtb+xG7+m+o17yqidSJKeLSmclf2UisU9z6FZCo2Em6jW6vWN
X-Google-Smtp-Source: AGHT+IGOlr+sdrkO2ZYMitdCSLQ4yZ7A/2bfMYIb8QSnyte0D6mSqjEU0/VPxBdF9GgE+R+W6dD7
X-Received: by 2002:adf:f1d2:0:b0:343:ae9b:36e0 with SMTP id ffacd0b85a97d-3504a954dabmr19021370f8f.43.1716153015057;
        Sun, 19 May 2024 14:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716153015; cv=none;
        d=google.com; s=arc-20160816;
        b=QRav7xP6IIuzC8aLHgQuLB2jQ+FxAw8DH8OwgKsfvPifTLu0XEXkzKkhzznHgsTz/R
         i+EJSKppLubb0fknzRtQhCChqATpfvovefhJyU2a+pIY2b3Mso5JnybZbC2WocnSt3dQ
         mNJGOhJ7whL/7cvGU1/m2KI/UoTNaTELLKp1TtjRC1TuFvnYXqXl7VR7L23+YNFGpG4T
         fmF8GuDfA6A9+8NCeIN/hvIM7IEUWSHXaWzIfspwn5LRvQWo4AeBjKqd1E/s+A2IQ0tr
         BqJZiLWjl9ZO7v4qtuomM2XKF7lrxw6ziDk5dSSOkJuxp+qbD8DQi6X3YjMHlwga7EEG
         i/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=eZraRWXWqU3ldPOOQ/gTW1eW7uZF66L/ky8P0jTeHlI=;
        fh=H0Ocb1F6OX7lJ2ZIq00L95YQd0stuI+T6mW0qgz5F80=;
        b=yO1byazfEPXrViKD5xZN/b7ieShA4hFd2K2TpUl6BPtcLvL0UqK/WHROHpuThUyjng
         XyzzsswEeSjCAXMYOklq46huSNUIFfUbV1J1Yikdrv2fQ3UryN5AJDI8PT7d/FKyN2Yt
         7SQQ71m+YM+Bo84eWsJ+XnjGZg3DIu66aBPqg9CeX5gTj/XYAE7/0RWr0QgQLdzkO/GH
         +5qDFME+wNq+Pq3TxOwxfIEt38pUwoPxVMTUObZotkZNKp9X74vL3hYfiqYIK0e+DADV
         TTgMryoKEqDnQPq6Oxof/URjwBGts7mPXY7hanK9ZGPdSurgwlki+ZI5LZ5qx3JTXdSI
         4MMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3502c0fa060si13514924f8f.889.2024.05.19.14.10.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2024 14:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjCtV289yz6JB6F;
	Mon, 20 May 2024 05:06:42 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 0627A140B2F;
	Mon, 20 May 2024 05:10:14 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 19 May 2024 22:09:53 +0100
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
Subject: [PATCH V9 7/8] gdbstub: Add helper function to unregister GDB register space
Date: Sun, 19 May 2024 22:06:19 +0100
Message-ID: <20240519210620.228342-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519210620.228342-1-salil.mehta@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: fYnCuxu44DQs

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
