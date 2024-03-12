Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1553827ejc;
        Mon, 11 Mar 2024 19:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1BtyPs7KJHHwT+OsdM4NOeiybxTZHiQSsYqEDmTODQWgf1k3t7c1ScDRZ3azLv9MPIbU+usU2BvZdwi/w4FT8xRldmP+W
X-Google-Smtp-Source: AGHT+IHpqS0EFEKygRWUNglH5E80bML48FyJJ97Dk2wcZW9YZwCqTdjgIEEu496oEUPySenNc8Cn
X-Received: by 2002:a05:6a20:9147:b0:1a3:11cb:9219 with SMTP id x7-20020a056a20914700b001a311cb9219mr8260573pzc.6.1710208972597;
        Mon, 11 Mar 2024 19:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710208972; cv=none;
        d=google.com; s=arc-20160816;
        b=W/UtFbVJgi7tRFW8/q63cDDIBqwq1JECycDQoNav+fRTTNOstFiVuX3tNeJWmzqXTx
         L9TJ9QTFXZV0f7rWgCCeU+oyggTSVdOkHu+1q2Am/abiD5OHjgjSc+4HHfuG5DG5APhr
         +KtEx1rRIEeLWm0hqGW71UXGHHKfaLY33735u/i8MWJLbsCWmAH2dKZVzgdiSEjF7TDj
         uKKOmKUpT6dv1H+K8HcTgTdAGHXoq8aDVyAk4fBFFoVyUyi5D/patFLDAPCBZD1XpfId
         HXEBTWakL1o31jAPozO7aTj5YIWLIU2kgaFXlnj+YSBz8Aa35HKJ9VnN29sD/Lvk0xcM
         OLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=gxPEmOjI1IPxhv8GQqPZpEbShAewc4HU90xsgp6vrG8=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=GQY5Syo5iZYsRv5+FTCeC2qXda204Fb8dP/P4fzS6+H88BrY9NS2GGziuZRKAEgC8o
         7jh6hGG/pA2nVHZyF6K0rtJWNNtz/VAYtB0J0/aFxEVS4DgGTKilUCOVDIczQdbg42Gn
         cn/EN0OlEu4Slo4JJW7kpDkGoIOCAQDRARGpi5dh6g/3DIUKl5tkvxzzIUdw4UvLm0+Z
         D7417PfyUKJVaQzRIeG0dwNmfqNSXeSP47PEtyTIAuqXsuw/oacuJEUWtoUQWxyd7mrD
         3Q2C24Q6vsRG90PHO8zONCXCoNwD1Veagjii4ahHoDuiR6ubszj4aNuPgs0PmLd/SzNF
         susg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 4-20020a630b04000000b005ceb19326e3si5995973pgl.251.2024.03.11.19.02.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ttxjv4bF8z6K6MR;
	Tue, 12 Mar 2024 10:02:43 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id BC92A1400CA;
	Tue, 12 Mar 2024 10:02:48 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.148.5) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 02:02:31 +0000
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
Subject: [PATCH V8 7/8] gdbstub: Add helper function to unregister GDB register space
Date: Tue, 12 Mar 2024 01:59:59 +0000
Message-ID: <20240312020000.12992-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20240312020000.12992-1-salil.mehta@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.148.5]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 5ZgDYDQi6ZPe

Add common function to help unregister the GDB register space. This shall be
done in context to the CPU unrealization.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 gdbstub/gdbstub.c      | 12 ++++++++++++
 include/exec/gdbstub.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 17efcae0d0..a8449dc309 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -615,6 +615,18 @@ void gdb_register_coprocessor(CPUState *cpu,
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
