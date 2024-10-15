Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2341090njb;
        Tue, 15 Oct 2024 03:09:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrZuGPCoO/72qnvPhPLLzI7cRz1xd3ShKaY0V4f2ix2i4Fe31IVw18r/woig2GNnvvnO5tnWjWfPOChw==@linaro.org
X-Google-Smtp-Source: AGHT+IFb2kkIGgRKAmKD9H1LgGbVBrjlP6UHp5pAdPuTul38ugmjB6w0KrEuBkMDqChlNrTp+aiA
X-Received: by 2002:a05:6000:4013:b0:37d:4619:f975 with SMTP id ffacd0b85a97d-37d5ff651fcmr13279197f8f.19.1728986965801;
        Tue, 15 Oct 2024 03:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986965; cv=none;
        d=google.com; s=arc-20240605;
        b=KNpQrS+F5VAiAyQ2t4tbY+p7aXLUZY3x1VXD8OkaR3FxVpavBkTtRzFs28zJ2NDOe1
         8dDFWxsWhgzLTJRKGT/L4ye6QD7+dV9Hx7jDXGLHol7EEDcbVm+29vhH+fTVBu+P9c2c
         tpqMBCiZJ17IyH5DpBQR4M7kVkWD0y8PyE5WGyH713Z0u1sF/bYGaZRKe66558ZONRGB
         MCVzsLjaCaflGeZeJeRxgnltSIwmLiagqZdq8WK8tu/blcM1iqTkWBwOZ4OUp9Mad6U6
         hRYMLt3O9p0wKDSkAvP/KtZPnFiDiF9fyHZ8D/04nzH4rCwZPD5QxO06d1Vot3E1zIQ5
         ziZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=RlqgnZBYHb161FI85jYOQtg7EwDnfhHunQC9Bbrsmso=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=XSN1yMYxREg20DXvbOEuI8eSdTOtuw2trEF4BZnugDEeLgtQqj+7oOaEX4rwzWQIx/
         oJaHhBD0DRN3rFYWATe3GP1EXbYdkcTE8VMDmfAmc/Ott/68nMqKf1qLKComWSjK9ly9
         ZhsFVmyOYOt8TYt/xhcXRIZn/iJTZ7i/K/8Uz7GaXT34aoCq4vrHqHQ+NtGsOQpYAoET
         R2QHv7beUr1kV8kwiAaTDqrOPJzFKMsUNMm7QBs7qqFful4lrx986c/Lhpj/xgjXB2EM
         g64wompOhjAQx9wDuDWtUU/NoxP2iQ1QF6BA431nufx6173ZqSOilSlVpIvmM/5hvmT0
         +HgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fd064e3si547241f8f.1061.2024.10.15.03.09.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSVDf3Bchz6K98R;
	Tue, 15 Oct 2024 18:08:50 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 93A68140451;
	Tue, 15 Oct 2024 18:09:24 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:09:04 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 25/30] tcg/mttcg: Introduce MTTCG thread unregistration leg
Date: Tue, 15 Oct 2024 11:00:07 +0100
Message-ID: <20241015100012.254223-26-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 8qq/XJrquLi8

From: Miguel Luis <miguel.luis@oracle.com>

Introduce the TCG thread unregistration leg which shall be called in context to
TCG/vCPU unrealize.

Reported-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 accel/tcg/tcg-accel-ops-mttcg.c |  1 +
 include/tcg/startup.h           |  7 +++++++
 tcg/tcg.c                       | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index ab2f79d2c7..4b26164ffd 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -122,6 +122,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
     bql_unlock();
     rcu_remove_force_rcu_notifier(&force_rcu.notifier);
     rcu_unregister_thread();
+    tcg_unregister_thread();
     return NULL;
 }
 
diff --git a/include/tcg/startup.h b/include/tcg/startup.h
index a565071516..c035d03f7e 100644
--- a/include/tcg/startup.h
+++ b/include/tcg/startup.h
@@ -51,6 +51,13 @@ void tcg_register_thread(void);
 void tcg_register_thread(CPUState *cpu);
 #endif
 
+/**
+ * tcg_unregister_thread: Unregister this thread with the TCG runtime
+ *
+ * This leg shall be called whenever TCG vCPU is hot-unplugged
+ */
+void tcg_unregister_thread(void);
+
 /**
  * tcg_prologue_init(): Generate the code for the TCG prologue
  *
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5e9c6b2b4b..3bdebdb332 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -811,6 +811,39 @@ void tcg_register_thread(CPUState *cpu)
 
     tcg_ctx = s;
 }
+
+static void tcg_free_plugin_context(TCGContext *s)
+{
+#ifdef CONFIG_PLUGIN
+    unsigned i;
+
+    if (s->plugin_tb) {
+        for (i = 0; i < s->plugin_tb->insns->len; i++) {
+            g_free(g_ptr_array_index(s->plugin_tb->insns, i));
+        }
+        g_ptr_array_free(s->plugin_tb->insns, TRUE);
+
+        if (!s->plugin_tb->insns) {
+            g_free(s->plugin_tb);
+        }
+    }
+#endif
+}
+
+void tcg_unregister_thread(void)
+{
+    TCGContext *s = tcg_ctx;
+    unsigned int n;
+
+    /* unclaim an entry in tcg_ctxs */
+    n = qatomic_fetch_dec(&tcg_cur_ctxs);
+    g_assert(n > 1);
+    qatomic_store_release(&tcg_ctxs[n - 1], 0);
+
+    tcg_free_plugin_context(s);
+
+    g_free(s);
+}
 #endif /* !CONFIG_USER_ONLY */
 
 /* pool based memory allocation */
-- 
2.34.1
