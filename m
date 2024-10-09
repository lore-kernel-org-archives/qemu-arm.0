Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp597177njl;
        Tue, 8 Oct 2024 20:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2JixQiL5XPB8CYz4qQdu63DTAAtiuAZSlOwmuSmT6DndC0DvT4I+vK/oc/hWFdXn97vq1lo8BvxXwHA==@linaro.org
X-Google-Smtp-Source: AGHT+IGjKjIuIT45x5OZ3GCCP8jn1maZZzYkbWJgT9kgYpmpMg7IaQH3gzvdibaQCkAEYNaanQjT
X-Received: by 2002:a05:600c:5021:b0:42f:8e2e:c00a with SMTP id 5b1f17b1804b1-430ccf03b60mr4947065e9.2.1728444525951;
        Tue, 08 Oct 2024 20:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444525; cv=none;
        d=google.com; s=arc-20240605;
        b=HxAQuLpokCaND32coxQ+rV1IFrWCOjabO1NO5qcPgRf07a1hvbb/o2QRiu+Src8sEf
         Kr9Clk6R/V9LRFJUP1dLz7Z9Mj2X+LZ6XuuPegsUUpJHGXTCHlWjim8weQAFk2ib+nJL
         sfbwegCmopZy7z2iMM3i/fM1P+VMezgTve1itjVLzH+ZcZF7GKz2bVeKFhBSYvZp1Y5X
         W4As43v4baKL2iL0daMdvFbA3oou1P1ErO2j8FERzUSPvEfRZcxQ4N/vq45Ob2AVVjUi
         0bfqdJZXOR3XGhGAIbgpq54Gs+iZ+WZnm/i+3ErgriVFIoqQObn2ulw8dF0niLMV6yUQ
         ykOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=RlqgnZBYHb161FI85jYOQtg7EwDnfhHunQC9Bbrsmso=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=hrkGUEdyB3OsYGsm7DI50+UTuJsh/crElG1bD0tlmrZdXQ0fUO68sPprRL9ColdMFa
         NGfOpDd5JfD7l+SOvCYogMcB4CI0N+GH3USRx8g71NBGAJnQc6ANzXF+pNNBY1Gp5KTT
         Dr/mOm0xjDEx/ABgWJKsoWzydQMLmlkBMtmqL7xV6zBeybIF3EWHJ7k5b1IGfv6lRq3y
         lLcE799ZN4REcIAcQ4VIdT8zygg8HZi0F6M6SnQ6wCfGMpFUbsipTU+RyDL/mj2traCN
         KWCNcMz1PK643LYgRFgJwjKnNcEFOMqc1Tdi9A5qK20eAZnax0M9qcwDrHfy5mpvLzce
         i3JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1699ae59si3901932f8f.891.2024.10.08.20.28.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:28:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdcJ5BX2z6K63T;
	Wed,  9 Oct 2024 11:27:28 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 2AD6D140114;
	Wed,  9 Oct 2024 11:28:45 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:28:26 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 28/33] tcg/mttcg: Introduce MTTCG thread unregistration leg
Date: Wed, 9 Oct 2024 04:18:10 +0100
Message-ID: <20241009031815.250096-29-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: me2i7M6n0Ffd

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
