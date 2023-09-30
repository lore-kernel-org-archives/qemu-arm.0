Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2585ejb;
        Fri, 29 Sep 2023 17:23:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMPVbnZQkW8M1D+87bJeqtP7BwRF6orMhFdb8cSQ/eASbs5HBbzjhuK5oTt0FrsabPHp6y
X-Received: by 2002:a7b:c448:0:b0:401:bd2e:49fc with SMTP id l8-20020a7bc448000000b00401bd2e49fcmr5576654wmi.24.1696033384302;
        Fri, 29 Sep 2023 17:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033384; cv=none;
        d=google.com; s=arc-20160816;
        b=N5BUkzMtcTysstYGOGecvWIjcsH7/FjybFThNmvKGqoXyAO+OUMo6CDjog6jalCXDM
         ThWiiSXyvnDCRmT6EFrX7+I05NVqsx3gPoQK44u3UOFHVNBmDiay3xw7mbvve4RpZUpV
         zrVHv2M7K753g6NeRNg/TDAJGx7jUX6z8KdbOGD4/PTB+MJsfJ+3L3a7VHvP3LahtmJ9
         qBAlKLXETvlgFpc20Kj75ypDD46oB5zqen1BDaso9SAxP8alBfgycb62x8D8mJbHO/lx
         b6xn2HnATiU9ITxcuelJwR6QwwcQxg0affqaD8uwJG7Y/StEpFuyloQqAU8n9kRY3/5c
         yitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=i0kEsZUAC34Hc0bpBDpvHYTjq5OZsk/lhNtbawsu0C0=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=y+9+qtv4rCUxsuJrk8fHULhZIunaHz+JXblysHY0WQz+WUO2Lso34MxNHc7hmdWwHd
         1HssoDyqkuIQYoXa/GbkD7cWUsViPbI9LcnZ7ZHHj+KCuNaZ3o6aS8ySg9PmMBehdNqy
         bOB7EIJcXP0DF31p+dBHJnnEF5F0iJCfqx+BObP8JO1okZ2wy0twq7amyuoVyN/ed+8z
         mhr7Wp3Abwo3QkbrhizwpTNjXYtEif0lpks5LAzdwwiqsAYm40i1aROU23f0vzbKqdIx
         nPD9DSh5df2fyDcgACGOh22NBIBUdMkSz1S7OToclcFc6kLy1jCLdwHiBXbUzM75cjAX
         hKBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id u8-20020a05600c19c800b003fe1f9a8416si1368901wmq.35.2023.09.29.17.23.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry7Dx6w2qz6K5tj;
	Sat, 30 Sep 2023 08:21:37 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:22:44 +0100
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
Subject: [PATCH V2 09/10] gdbstub: Add helper function to unregister GDB register space
Date: Sat, 30 Sep 2023 01:19:32 +0100
Message-ID: <20230930001933.2660-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: XmbYJRKeCEeN

Add common function to help unregister the GDB Register Space. This shall be
done in context to the CPU unrealization.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 gdbstub/gdbstub.c      | 14 ++++++++++++++
 include/exec/gdbstub.h |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 349d348c7b..89ac0edfea 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -491,6 +491,20 @@ void gdb_register_coprocessor(CPUState *cpu,
     }
 }
 
+void gdb_unregister_coprocessor_all(CPUState *cpu)
+{
+    GDBRegisterState *s, *p;
+
+    p = cpu->gdb_regs;
+    while (p) {
+        s = p;
+        p = p->next;
+        /* s->xml is static const char so isn't freed */
+        g_free(s);
+    }
+    cpu->gdb_regs = NULL;
+}
+
 static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 {
     CPUState *cpu = gdb_get_first_cpu_in_process(p);
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 16a139043f..7d1368d377 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -27,6 +27,11 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
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
