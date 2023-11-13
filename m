Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1595632ejc;
        Mon, 13 Nov 2023 12:15:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDq50PB3KxUfE6PhhBtoRGZs9yLc5uPQIjf0JAPbdKV+A2Ocu6EqSUJwZmiVpsu1AdWsz+
X-Received: by 2002:a05:6a20:8f29:b0:15e:707c:904 with SMTP id b41-20020a056a208f2900b0015e707c0904mr6623412pzk.24.1699906511582;
        Mon, 13 Nov 2023 12:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699906511; cv=none;
        d=google.com; s=arc-20160816;
        b=b3sitM2NQ8EizdTb1nrok7IvZG3p+0e8VFyjGGfrz9EXd2oeKdZW3jLuAWAdWUOTHq
         TY91kxtSIjbRtX/P11uR0gu9ADd1puRzjWP0uUABQ8st5gXSNrU6PYTQN1xwnICHkyOe
         ScS9j8fcN9p8uQaE5vvYiHZCCwNtSUDuODeYR+1Ky9qGYRk10Rv5HvL39MKci0o4Xbuz
         JjGpseKmtsXHB7QsR/sRBz0dnyWK+Po0iv1RrCx2lWWlREQK3U/ynVLW3YesWkSjSZF/
         0OI9IHv1xZNRafnoWzjhg1YJ0F1wIo+yhwTsaYk7M12Q/Kz0ATLZfCZds4gbJ2T/z7Xv
         DD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=XiEkVw5DJrsqUvUt2++Yzq1rE5vJ2iH2aXMzr2n0Tto=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=HmVAu+NSjjiqzefu86AY4ISalprs54SAC1sSmFgM0MTbIhbPcK1r66SWs53Ng8dDF0
         lY+3TTrPVhq6BKZv57e694g1IRgLPL8zSbWOO9Qi2LNff+6FNnLm1L5/QS10wXmrglo5
         I1Y3IMaJbPX2BXd68lU5rFIV3zsAzH9kiqtxcxbxkKSq7LiTK5wfCIMrxJ6YEh2Z3KBz
         AsR4v/yEKQLnoRcH9sshKCvOyOjb+fzLKC5pi0RG6Kc0bwlbWAd0hnpMqbqtxWdOK2xt
         wuFTNKGq1tzBU5ijUdkj0P5ObxRyP+RxHbE+NdmT2Fu/RQ4dPPrL2C40Y5o+trTKoGcw
         E7Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id f9-20020a170902e98900b001cc49532e84si6010963plb.634.2023.11.13.12.15.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 12:15:11 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4STgXR2V3Bz6JB5X;
	Tue, 14 Nov 2023 04:10:31 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.147.128) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 20:14:49 +0000
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
Subject: [PATCH V7 7/8] gdbstub: Add helper function to unregister GDB register space
Date: Mon, 13 Nov 2023 20:12:35 +0000
Message-ID: <20231113201236.30668-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231113201236.30668-1-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.147.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: B2HKsGZlXKpA

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
