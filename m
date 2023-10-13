Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1416166ejc;
        Fri, 13 Oct 2023 03:54:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbVmBAYm0eR7itfsAZTbZ3h0W8qBpxlhrcDDvhwGKfLj5Ghzb34GnIkVmtXhwMq8dHFi01
X-Received: by 2002:a1c:7414:0:b0:405:dbe2:df10 with SMTP id p20-20020a1c7414000000b00405dbe2df10mr24496048wmc.35.1697194484862;
        Fri, 13 Oct 2023 03:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697194484; cv=none;
        d=google.com; s=arc-20160816;
        b=y33u2dvYRtJUmrnFoW81zcWJesfwwfZL7KptmMU5UaFUHz/T2eMgtThZaeEQJbGmyF
         VFwi7Vny2cKwTMCdHUoW9oRvdjB1DO22c5Iv+GOeN+wyxT0yyVddEKuYdheF4xnzFBMp
         ZVXpY44JkTiqFnNG/Da51ncvhCklVCB2JvVQKfgSI5jdFewUMzNxD2+VcAQzmS5iRYZv
         1SNXCswZr0kTfYPuelsk4tsh6MqnOJVWia3xJsdKohwT/rOjKR4tSYsx9oaVda10bPeP
         iaZg72/2/O6o8ks31hEWsmxKWmwqG+y4TJZPLSn+DBWUyrok4QepeOrwBCVXXh0xzoYZ
         w0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=SREhLnhQ0U613eO9g9mKLBx7JdpXyuLbjMgSE1OrfVw=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=i5w+FlhvkNB9C/UnWlPQgAbJ8cLQ+K6renVziA1RvoeFJg+BBgzQE0sZViHKIcAtQ3
         PDXIi3sw4HTVONImDCXLqlJm6FitOH+zBqnNimz1fDWQR7H3D529rNVnHcZnEqkLejwy
         Zh1YOJb+lbrmoL/h2rj5fTsi+a0cmZUoDXK/fa2L5cZHnhcBl4uZUGrBZ+CpT7Lmkhf1
         6J41BmnQx8uGX8YXS9pzlxN0rmpxGyXQUxuA7WVEwJoq1x8fDk8orL0obZDxjWjSuP+E
         QVtUZx3+2LZ3n0gbZ2wLltr98/SmgtBx9kEdlTqZW1weGWSJth+T1x0ekOPpsf70GWLs
         oqCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m18-20020a05600c3b1200b00405336eac58si1000022wms.43.2023.10.13.03.54.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6Nd04pvHz6K6FX;
	Fri, 13 Oct 2023 18:52:36 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.247.32) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:54:27 +0100
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
	<linuxarm@huawei.com>
Subject: [PATCH V6 9/9] gdbstub: Add helper function to unregister GDB register space
Date: Fri, 13 Oct 2023 11:51:29 +0100
Message-ID: <20231013105129.25648-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.247.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: I6MEwB/B7vH4

Add common function to help unregister the GDB register space. This shall be
done in context to the CPU unrealization.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
---
 gdbstub/gdbstub.c      | 12 ++++++++++++
 include/exec/gdbstub.h |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b1532118d1..7bd6d45857 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -498,6 +498,18 @@ void gdb_register_coprocessor(CPUState *cpu,
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
+    cpu->gdb_num_g_regs = 0;
+}
+
 static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 {
     CPUState *cpu = gdb_get_first_cpu_in_process(p);
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 1a01c35f8e..3744257ed3 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -32,6 +32,11 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
+/**
+ * gdb_unregister_coprocessor_all() - unregisters supplemental set of registers
+ * @cpu - the CPU associated with registers
+ */
+void gdb_unregister_coprocessor_all(CPUState *cpu);
 
 /**
  * gdbserver_start: start the gdb server
-- 
2.34.1
