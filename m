Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp324797ejc;
        Wed, 11 Oct 2023 12:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRltrgDCZUxztsDfS9xO9k/jsTMEBh1gaCo6S10PIhyjTIcNk5Qi4VLyYKVL90gTPDElCK
X-Received: by 2002:a05:600c:2146:b0:401:daf2:2735 with SMTP id v6-20020a05600c214600b00401daf22735mr18577991wml.31.1697053646051;
        Wed, 11 Oct 2023 12:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697053646; cv=none;
        d=google.com; s=arc-20160816;
        b=B2yDyQZ+P13xeko6l85a1zerAtIgKq4IBg4IoEQQANUFOiQbllO6tg7yUIitMd3AoC
         SVry5Vi7gl685NhoqgOaEc+5hFOimRpnvEj4RtiylNKMB+Px78GmQYA/QMT8K12oJI7S
         YhXHpxppEoY5KjmreDHNnKGCiu+ig8+Wo4ZXnBRDNq2zpjPRBkudqMhpPW5K+gb+r4mo
         4DqSMiMkOzI7jiCFwjK8+Frh40F8KeS2MgC/7/Nd0AaC5mf1j2XovohgGQX0Emf09hSV
         l9rhwDGo94h92mmSc+7zVHDi5ksNzAE4ZtoRzRmhlZjVcDyP6tRET1AxChOup52U6Qx3
         +KEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4aRSjkxyBxigc9aTJyz7ndKyIj/4WoSyfYdhBJMDvqg=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=OW4mnfkqBG2Eo0SypmB3OgIW4qnwCjmUHOwReedgIRylYfbYGR31dWqaUOGi8jyd0U
         oOl4VOuwSBn6RZtOzY5s8G30q5kq+KOVCDIEyMPQHioPbMJ6ebkfNNt0IRoc1D2VNINO
         IHI2gUGoOQYL//BLod9dvZlHTFnnpvAju0tuS/Wx8qK4edRTpCkutsNwXvXYlg3HbAH+
         DxMSwczWJWvDGCdusce7GonIoPJHugLM7e1D1vMvPjKt5n04/44KK2HLoV6HEC1HQImy
         x7WO7dxzoux5gl0eNFbG8wPyem6Z+MlrIRdQdJx9sf4U31al3ZDEs3Th4ipGNkQWMycq
         ZoTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id iv7-20020a05600c548700b00406467a3a52si7948509wmb.160.2023.10.11.12.47.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 12:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5NZb0dHMz6K7JX;
	Thu, 12 Oct 2023 03:47:03 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.169.226) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 20:47:06 +0100
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
Subject: [PATCH V5 9/9] gdbstub: Add helper function to unregister GDB register space
Date: Wed, 11 Oct 2023 20:43:55 +0100
Message-ID: <20231011194355.15628-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231011194355.15628-1-salil.mehta@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.169.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: NCg+49vQAlDw

Add common function to help unregister the GDB Register Space. This shall be
done in context to the CPU unrealization.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
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
