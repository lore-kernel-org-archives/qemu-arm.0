Received: by 2002:a05:7022:c43:b0:7e:eb73:5b3b with SMTP id ej3csp1476864dlb;
        Thu, 13 Jun 2024 17:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9rat/cQ9YuG1Dluc4FRR6cSbUBTXUJvNK3nXUsNypmroiEMUHs06VbBMugtpE22/OEXjNM4yUtOrMRd/8aMkgzNz/ZhyT
X-Google-Smtp-Source: AGHT+IFGZXC+PsjTV1msP7Wi3S7bvabchRhf2SlZKBLkrcH70uENak/Nhfv3BX2oIByL26LLpXjG
X-Received: by 2002:a5d:64cf:0:b0:360:83ee:9844 with SMTP id ffacd0b85a97d-36083ee9b22mr51f8f.15.1718324422542;
        Thu, 13 Jun 2024 17:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718324422; cv=none;
        d=google.com; s=arc-20160816;
        b=m97ze5unhOnBhIzytzXGTTLd4E9Je5ftkEUIyD0o4CuDsK5VFGaGqaR2JUT4Yqy9MX
         NIud7LUkAZQ3qASqhKtAzltSMcFnADU7FjTi+lr9n+faOfpzdGQ78E056dBhwBK+y8GF
         1rM1pI/MYU2fUbFxEnpmXNvNpnro5bECiL80NkWFJSRzDIlzxzKmbbu3ftSf37w8y8x+
         NbGEo3pJ6K+aGQylL+QFonW86oOcHXgmJnMdeSBuM1Z4O+rVXviH3EYX16b89vYZ9TuD
         mFKmwTIFvtWndcL34QR+h6DPmW1NX5UWqeDN0LFWjCj0lzZRhlfhU2XJsMMnvWop7caE
         YKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=0WunhJNZi3PqNB869tBtSDMqQ/41cwjXIohhpfE+DLs=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=sN5rP3J6Unk0OsMclRq5wR72gSET8NX9NOmKXGPpTmejv7x98zB4nL7UGDhZmukbOH
         tX4vw9m0o/0ZhmXM+pR8Si/OFaCAP/9giSUFWf7oxkNi2WPGgL4SJBqIcQDq1vcJffah
         NYxXwvKf18QhU97pkUVE++te7BdsgAOYJQQ0keZyxbPa9zSAoQzyOsxs6DZmF2gU3a0+
         cWnIqur4E3mER1iZUnNlhgXVEgGFkVICnCBICBw0Z4UfBK8F0uzR039pPkg9qh6z09Md
         uRY6ULvUlugaT8+wsrDw65o78wFXFHjyLIIUYFFrIeNGVHf+QHVFCOVICUWkGXhH8nr5
         g4Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36078d817f5si1046379f8f.229.2024.06.13.17.20.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 17:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0g0L2mDyz6K61G;
	Fri, 14 Jun 2024 08:20:18 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 521B7140594;
	Fri, 14 Jun 2024 08:20:21 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 01:19:58 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 28/29] tcg/mttcg: enable threads to unregister in tcg_ctxs[]
Date: Fri, 14 Jun 2024 01:19:44 +0100
Message-ID: <20240614001944.203038-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: kxby4x9+3QWH

From: Miguel Luis <miguel.luis@oracle.com>

[BROKEN: This patch is just for reference. It has problems as it does not takes
care of the TranslationBlocks and their assigned regions during CPU unrealize]

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
 include/tcg/startup.h           |  7 +++++++
 tcg/tcg.c                       | 24 ++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index c552b45b8e..b6d7911a87 100644
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
index f71305765c..dc35b24de5 100644
--- a/include/tcg/startup.h
+++ b/include/tcg/startup.h
@@ -45,6 +45,13 @@ void tcg_init(size_t tb_size, int splitwx, unsigned max_cpus);
  */
 void tcg_register_thread(void);
 
+/**
+ * tcg_unregister_thread: Unregister this thread with the TCG runtime
+ *
+ * TBD
+ */
+void tcg_unregister_thread(void);
+
 /**
  * tcg_prologue_init(): Generate the code for the TCG prologue
  *
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 34e3056380..e5bbe8dc07 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -761,6 +761,15 @@ QEMU_BUILD_BUG_ON((int)(offsetof(CPUNegativeOffsetState, tlb.f[0]) -
                   < MIN_TLB_MASK_TABLE_OFS);
 #endif
 
+/* TODO: vCPU Hotplug: Need to come back and fix the TCG   */
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
@@ -810,6 +819,21 @@ void tcg_register_thread(void)
 
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
