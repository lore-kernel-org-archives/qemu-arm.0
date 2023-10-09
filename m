Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp49262ejb;
        Mon, 9 Oct 2023 13:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrU3DhkjutBnqNe/FIGrPIIXdqRk6ZNivDIwRUlxDNnl/JHLAA8b5TEE/8dWltaT+H5Jc7
X-Received: by 2002:a7b:cd85:0:b0:406:599f:f92c with SMTP id y5-20020a7bcd85000000b00406599ff92cmr14835489wmj.20.1696884004402;
        Mon, 09 Oct 2023 13:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696884004; cv=none;
        d=google.com; s=arc-20160816;
        b=ClH1gSkYLO7A8Syac7Ai6stgY+yFRhLkFgu0ewljPhdF16dszda5VsNHv5kxJShp63
         MdC60LPnLXnF2nehFqo/EVBKpc4NxEOutOvv4TgwdVRIX/oW7DIbELZQLuafTbp3H10W
         7Crt8PiWf2cUSj6sSqg8E0hu6Q/c17DfGQ2jARrYdQD0v2bB7WeFc7x9GOWem4rOnZKV
         Mq+o6P3LdZEV4a4MZuFXrIhJxakDajl+SjaNVuQrJySZmBvKEsDmxO/xr9iTV5i4Xegg
         td8h1LZjIMseBL+AYvAanAdF8H9du1WYyybGMr4aOc5hig0X+IVIRzJtnEqa8Gake70f
         KPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=8KAwlBL7A3xg1qzJ8TYkQypj6pzUm5dnu/gcoO9nkUg=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=WbHYcYTdUUsZKF+fJPlg3TvKIQAKHBy8xQ8l+ESPLiYqvX2Pk5ABY245JCu0QlFusq
         uugAPS/NW2p8Mv31sG4X2dzp7cwZbfOsbiJib96QK96Y0mrvpEU0cx6qOidaWV5PgQ2L
         lRxA+TfB8wBmOefIbizXae5VnyT3U5J+szdfGc9FjpvP3G0ZyvafQz/p5zJa/H6tQrFr
         enQZZIYROS7csKhrdP1I8zJkp2An/5A2zwan4CKK+0o326Ba+8KVZcZIwV2BhbO/Edob
         I6xPpbZT/krgGbrv2SYGOC+R1akJ8DN2CRMmx8LQr7yAeQ5bU1YpwlJL0R5w04gllpWh
         QbbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id w19-20020a05600c099300b0040653ab52d0si6777099wmp.26.2023.10.09.13.40.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S49pR3rrnz6K6xF;
	Tue, 10 Oct 2023 04:38:07 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.175.116) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:39:41 +0100
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
Subject: [PATCH V4 09/10] gdbstub: Add helper function to unregister GDB register space
Date: Mon, 9 Oct 2023 21:36:00 +0100
Message-ID: <20231009203601.17584-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009203601.17584-1-salil.mehta@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.175.116]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 7fyaSdMvhDqA

Add common function to help unregister the GDB Register Space. This shall be
done in context to the CPU unrealization.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 gdbstub/gdbstub.c      | 15 +++++++++++++++
 include/exec/gdbstub.h |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 349d348c7b..97b89e2d00 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -491,6 +491,21 @@ void gdb_register_coprocessor(CPUState *cpu,
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
+    cpu->gdb_num_g_regs = 0;
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
