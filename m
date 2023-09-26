Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp995653ejc;
        Tue, 26 Sep 2023 03:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaoDDWRulrkKogrJQQTVrvBK5SVLl+jJ0xBu4JZNRx2r73L7Gu8pzj7gAdmbVeB+SA/TMe
X-Received: by 2002:a05:6808:1795:b0:3ae:24bb:3825 with SMTP id bg21-20020a056808179500b003ae24bb3825mr10248929oib.8.1695724732563;
        Tue, 26 Sep 2023 03:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695724732; cv=none;
        d=google.com; s=arc-20160816;
        b=SdEdm0RMFoeri4ij2RZLKbyU4bJDaKAhgVS8IpG6qXePNeCj5jZ7wTn6g7pKKD3GMe
         lqVh4QbDhb1XrLtMcab7RKjtcXAuVnRd0GFG4o0fLzLk0SHq/rdUP2wYgc2w81RvTnPH
         3sLhUH6afoUKrav0eaYASoQdufv7xxB/jukfnlRLWXK62MCwEHombS1/lu+HWKl2sITT
         OPypzYqKpjrtbw49Jj6TRtVs2ttbFUcujUBYduteLyDkkp/Gy3beJHn+LK1F5WJkhGNo
         exEtgNnzDj6cZ83l0V89jxsoo0FvvliPS0Oywj4ldWdTqi5M8iFsu789IRc4D0iYxy9D
         IkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=r2XyOZ2aXAk13zrZQGLkqWeoyiI2X8PNNpoWHdkFcyQ=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=dicP+Cv4FTbxQljP7LAU2NGfRaj1Z1gJge+BBC4baZsdLun5xIFNnD1utOWBZhB1fh
         5cYQ8szfVdwAcmC9H8Q0gk0s8w9m1cosmRRt1ZwnP1AK2FIsbKr1jZnJUUb78HtS04Do
         ZoPk1n76ohiWcV0p0ycMgLUI++y/P+cVwmp97hHJuVoT3fQjKPXxS9uT0zwnM3hvUids
         esHzggeB65Hy+2qemaoU3iu5O1J8p96o3SQ+ojxmTiGHFHVAHLrfeWg/c0Ghi9M9uOpQ
         9A8eseJQbwZMpqg0hkUpm6xN4mX06BcfRvBMwIQjeHV6PhEKfycVT+gyp1xbv6QkOE3c
         WEBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k184-20020a6384c1000000b00563d791d978si12270844pgd.750.2023.09.26.03.38.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rvx5V3z5Pz6K8jp;
	Tue, 26 Sep 2023 18:37:34 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:38:30 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 36/37] tcg/mttcg: enable threads to unregister in tcg_ctxs[]
Date: Tue, 26 Sep 2023 11:36:53 +0100
Message-ID: <20230926103654.34424-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926103654.34424-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926103654.34424-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: ShjopiRN0iR5

From: Miguel Luis <miguel.luis@oracle.com>

[This patch is just for reference. It has problems as it does not takes care of
the TranslationBlocks and their assigned regions during CPU unrealize]

When using TCG acceleration in a multi-threaded context each vCPU has its own
thread registered in tcg_ctxs[] upon creation and tcg_cur_ctxs stores the current
number of threads that got created. Although, the lack of a mechanism to
unregister these threads is a problem when exercising vCPU hotplug/unplug
due to the fact that tcg_cur_ctxs gets incremented everytime a vCPU gets
hotplugged but never gets decremented everytime a vCPU gets unplugged, therefore
breaking the assert stating tcg_cur_ctxs < tcg_max_ctxs after a certain amount
of vCPU hotplugs.

Suggested-by: Salil Mehta <salil.mehta@huawei.com>
[SM: Check Things To Do Section, https://lore.kernel.org/all/20200613213629.21984-1-salil.mehta@huawei.com/]
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 accel/tcg/tcg-accel-ops-mttcg.c |  1 +
 include/tcg/tcg.h               |  1 +
 tcg/tcg.c                       | 23 +++++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index b276262007..5cf9747ef2 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -127,6 +127,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
     qemu_mutex_unlock_iothread();
     rcu_remove_force_rcu_notifier(&force_rcu.notifier);
     rcu_unregister_thread();
+    tcg_unregister_thread();
     return NULL;
 }
 
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0875971719..6c1cd2a618 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -785,6 +785,7 @@ static inline void *tcg_malloc(int size)
 
 void tcg_init(size_t tb_size, int splitwx, unsigned max_cpus);
 void tcg_register_thread(void);
+void tcg_unregister_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ddfe9a96cb..6760f40823 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -742,6 +742,14 @@ static void alloc_tcg_plugin_context(TCGContext *s)
 #endif
 }
 
+static void free_tcg_plugin_context(TCGContext *s)
+{
+#ifdef CONFIG_PLUGIN
+    g_ptr_array_unref(s->plugin_tb->insns);
+    g_free(s->plugin_tb);
+#endif
+}
+
 /*
  * All TCG threads except the parent (i.e. the one that called tcg_context_init
  * and registered the target's TCG globals) must register with this function
@@ -791,6 +799,21 @@ void tcg_register_thread(void)
 
     tcg_ctx = s;
 }
+
+void tcg_unregister_thread(void)
+{
+    TCGContext *s = tcg_ctx;
+    unsigned int n;
+
+    /* Unclaim an entry in tcg_ctxs */
+    n = qatomic_fetch_dec(&tcg_cur_ctxs);
+    g_assert(n > 1);
+    qatomic_store_release(&tcg_ctxs[n - 1], 0);
+
+    free_tcg_plugin_context(s);
+
+    g_free(s);
+}
 #endif /* !CONFIG_USER_ONLY */
 
 /* pool based memory allocation */
-- 
2.34.1
