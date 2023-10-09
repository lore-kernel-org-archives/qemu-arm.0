Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1898229ejb;
        Mon, 9 Oct 2023 04:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoJVxpACrfB+23pHRVoluFB5YYQFkPnydYbf/NJ1PcX1JSgA4AYRN2TlqLGbjZz/9siU0q
X-Received: by 2002:a05:6000:60f:b0:329:6b3e:d87d with SMTP id bn15-20020a056000060f00b003296b3ed87dmr8084147wrb.42.1696851137667;
        Mon, 09 Oct 2023 04:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696851137; cv=none;
        d=google.com; s=arc-20160816;
        b=U7Hn+QlYuXr8Xj+4V68/am4e+GmckwT+p0eY1pO4Kf5QJ7qWqU1cdVZDZmizgCN7IC
         /pUvKw5IV/k3y9cIdGLXRAW7sFtJMK4Xfln1cBfhnxEY4Oti7iauvUDZR0Rr8pPpw/EO
         AjTKYgXsZUU8MmQoc1MwCaZR4Lex++XoIcpgyFE8v/VBG1Dgw2Giab9/sypx5fgxv5u1
         5BX42qET9zfmEfyvQAVM1LnIDQ8EwgM3Hm/HaQyhUaotd/6LtrSeRDUgdum61DxZ4DN6
         6oS5R4Uzytn9x805l6EhGvOE5MtLkLVXHaCQN4N+RgU21/j5UMaA/9NncXs4bUckFKJe
         rTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=8KAwlBL7A3xg1qzJ8TYkQypj6pzUm5dnu/gcoO9nkUg=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=EtiTWQqxO/Imq5/9KKAqcpU2DlJIER+WyhEGcdQQOkdek7iyM2E+lQQft6wWekg2tu
         BQ/wry3/AW5xm2f6VHkkcmT9rnxEFMKVPkV7ImlqdkUn0tW9JzhZODhPztPUghJjcq5d
         oE8DGjzOl7UzJpw+d4K8f7bpCKlwm9eih/1NxUC/wax6PQvS0fs4EP7X6+2SPtnGgV8x
         6V/SfvCMfWHiG6Mcgbv82vbp4RvpXAi1shj1hEJF9fdFuSQ66JBAOMkiQ2y2ol9WKlm0
         8d4Nt/HFv81LDaTuwqs5ubP+OhgOstArnmQj3P2/YT2MyiEd5znMUVtTSdxErA7xLvOP
         mMKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g11-20020a5d698b000000b00325ed6dd8ccsi3514802wru.209.2023.10.09.04.32.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3xdB5dbxz688yX;
	Mon,  9 Oct 2023 19:29:18 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.154.91) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 12:31:58 +0100
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
Subject: [PATCH V3 09/10] gdbstub: Add helper function to unregister GDB register space
Date: Mon, 9 Oct 2023 12:28:11 +0100
Message-ID: <20231009112812.10612-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009112812.10612-1-salil.mehta@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.154.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: HtEYznWLC1jA

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
