Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3178959njc;
        Wed, 16 Apr 2025 01:15:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d8e:b0:1fd:f4df:ab67 with SMTP id adf61e73a8af0-203b3b8b1ffmr1267852637.21.1744791349957;
        Wed, 16 Apr 2025 01:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791349; cv=none;
        d=google.com; s=arc-20240605;
        b=PpBZiCty9NFxiEDowmWPtvahRHu8RWVFGFkl8i+2EoyWCeY1SFiY8u516tnG6irEJv
         BV1aSN6isIIUCl0EL9I2AOl4wo4GfDFQYdm1c5uH2udVvoyU/Lzfd6JDUpCzurMVkxDv
         EHAZd9BzeUZDhNvPGpzscwWwgmSf9VahGGGvHqZBm3kKQvwun1nV+Xk2rqMmjNDbppix
         ZNOavHE53G6E7bq6qlFwGBfkbyyaXRHd6FrhW7v7suJ4gVOD8V6ORBm77CVqkn7kehlr
         MnW5oTU8j1SGjXV/u2+3cdnZifBA9UMVg1CD3p2prHtv5a3i+q3sdrT/U5791Cw6FWJR
         i4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YLS6yLiQ1Mf5QnPvZYo55MhWKQTC2OarW9pme0RmkFs=;
        fh=TX20cre+WcLxZXmL7tNDoIa6CTGSz7c1FU4nxmt0r/c=;
        b=GK35cCIYxAfjpCk0pLoPVJoava+tOot88u9tFhdc50plt+HvZNPPPwOTB+DENTHZln
         Ce4/3vUw/b8dTpj4ZIvNLNuo7/DvfB7oMmxio1RoEQGN6bVq675qsi7CPOzdrlYy7REx
         OSgzjlKaSDCjNCHt0NAwvj/YysidnRvJZsPiiGCHEivW8MptKB+rDc+5KuRSNMSF6MSW
         IpAGpPlEPWtkV6OdIRuypU2vnhXXKKe7mQvDzKjCTUi4Gtfz6504MAknA98nEev6nwDR
         m2GT8VWgVhzCOtUCjSynEgqR72GOC6Q7vbbrlmN+xSJEUxeeIxZSc8ClXbRSJCygJGBS
         qOag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Jr/E/Llt";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73c224e875csor628973b3a.3.2025.04.16.01.15.49
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Jr/E/Llt";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791349; x=1745396149; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLS6yLiQ1Mf5QnPvZYo55MhWKQTC2OarW9pme0RmkFs=;
        b=Jr/E/LltH3+OmmbqdkrNrDT6quNJqD/5UIWFDossLU9IZuyCm+LlreD/UsqAbpKDcC
         4rDNnWYQKyldi4u+3Xc1PtSB/cuzzwvfNJIP1XCN6Ab3TbyaHus6k9IqGa4hHAgnQ0/E
         S1Purmtq2PYHG6hLIS06bCvyHUnh8j03RcwX7RpwCljfhSXM09r5R2Ysro9JEWvUadTw
         0nnc+ObUG54P0pG0kfIK81ZzM2GHGBs8VMINPqXuGVVaXiHgS3DrQe8B+dluVR/Qz4S/
         Y7+I7Yn3WI7L2rPVub/bJaVqjQxi5Lcg7uRB3av5oeKaJWk0VyLJ5DSbxzs6Q44ma8m9
         gaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791349; x=1745396149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLS6yLiQ1Mf5QnPvZYo55MhWKQTC2OarW9pme0RmkFs=;
        b=YSCm4UIHpfog9osMoBYcV1tKdjridAClfqOy2d3AbOPHinXm88STecgMXOmqwv26ZK
         wiuABD51q26q9QjHTWlnVpd9NX30WgDru+EkvEJPstx2VnxF7jdkmZ/fktTNYuI+DRVM
         044Z/nDYIg2HJWO/FW5ONDTh4EUQxJ019v15YPexmYtjxnV+8TY/N8Kb+wB6V985z9Y6
         CzHwMHvwlQmdKL+CF6YQr5qdvvVPiI8oE6Oc05mNQLU1gmXQju2MjUCerGP4RQxs6H9Q
         cxm2Gx62OVX3vwcH/HqCXRm4V8TD1lBe+PyJGoCrkHlljA/wLOxlwiZpOB3/GbYzy7gX
         VC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/6NM7ZKxSN+9OsTvacPfXfuzfy2bdfdZT+SSl/AfGZv2JsoFZtCM3nxl9FvO2z/K9DHhEoeJ+@linaro.org, AJvYcCVie3XSLOGbeooGdbwkt91nJekLvrRcmRP2yiTru83e19R+vXTfdbEyUS3U89hrfQbngWe/pUAd2kPPIh6l1WYWyA==@linaro.org, AJvYcCWLgrpBLfiNZLcnqOpKdLaaDc/1R3q78LOhZxv2mWyc2hKb/WqYQHmugmDVXL7DHsjugPY/JSjEHvKFZ7vYqGTdHR0=@linaro.org, AJvYcCXKNZiG6BVWS7x+pUi4NIJtpQoUrxPCBwD7aNBDeeDbnqFINfK4OXtEgfOzqMvSEpuFMv3cImQaUeXtRPSy@linaro.org
X-Gm-Message-State: AOJu0YxSo/HvpIKU5MVNDb+QM2J41jZETWIOyTm7seUiJk/luW2zK+A6
	ZhovRkSxysg+7pnH4Tc4afOBeoTH6bGR5OJJPJWKIb3v0yoWbKMq
X-Gm-Gg: ASbGncuT6UEV4JP+ExGaHc9Ig38ltSyTXi/HtJN+z6F7Q6ShHSfkQUZ74CFTLOn4+a2
	LIZRkogs+ygPgaDpLOVhVOXlMRYnZFmceNkDrGV7jCNSzOAEYJ/3pqv3Kz9wpVPe279aOpfhDcD
	Oro8c6slVbOOQS5wxFyM22SZb6xNMaf6Qu4T8uUFBuP4ZO1NiIj4XaFlpJWCbP+zUArNirTqTzj
	sK/EGZHHCNOi/4kkZXC+A7cHqJLXynqTZX3he0hdJ0z94MiT9XPoxbeWMXKOI4kvMu2F2Q9LSGe
	HqYelebV6LcWjSXmszO9psxrPsopTauDiRBqwyp9kkTElaWyo+q2XDuu8Q==
X-Google-Smtp-Source: AGHT+IENMKjfdhGzf7kqBp8NXUGixVOGLTQfJgHI0y0GI+HSpVK6nMqsODrZOEyt9kh+1JN/MlNNWA==
X-Received: by 2002:a05:6a00:4644:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73c26e06d63mr1106371b3a.7.1744791349159;
        Wed, 16 Apr 2025 01:15:49 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:48 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 06/19] contrib/plugins: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:11 +0900
Message-Id: <7f24174c2659cc61b29e707686ceb9c58833e93b.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GJs8b3QrWhsI

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_list_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 contrib/plugins/cache.c     | 12 ++++++------
 contrib/plugins/cflow.c     | 10 +++++-----
 contrib/plugins/hotblocks.c |  4 ++--
 contrib/plugins/hotpages.c  |  4 ++--
 contrib/plugins/howvec.c    |  4 ++--
 contrib/plugins/hwprofile.c |  8 ++++----
 tests/tcg/plugins/mem.c     |  4 ++--
 tests/tcg/plugins/syscall.c |  4 ++--
 8 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 7cfd3df249..56508587d3 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -576,7 +576,7 @@ static void sum_stats(void)
     }
 }
 
-static int dcmp(gconstpointer a, gconstpointer b)
+static int dcmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     InsnData *insn_a = (InsnData *) a;
     InsnData *insn_b = (InsnData *) b;
@@ -584,7 +584,7 @@ static int dcmp(gconstpointer a, gconstpointer b)
     return insn_a->l1_dmisses < insn_b->l1_dmisses ? 1 : -1;
 }
 
-static int icmp(gconstpointer a, gconstpointer b)
+static int icmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     InsnData *insn_a = (InsnData *) a;
     InsnData *insn_b = (InsnData *) b;
@@ -592,7 +592,7 @@ static int icmp(gconstpointer a, gconstpointer b)
     return insn_a->l1_imisses < insn_b->l1_imisses ? 1 : -1;
 }
 
-static int l2_cmp(gconstpointer a, gconstpointer b)
+static int l2_cmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     InsnData *insn_a = (InsnData *) a;
     InsnData *insn_b = (InsnData *) b;
@@ -645,7 +645,7 @@ static void log_top_insns(void)
     InsnData *insn;
 
     miss_insns = g_hash_table_get_values(miss_ht);
-    miss_insns = g_list_sort(miss_insns, dcmp);
+    miss_insns = g_list_sort_with_data(miss_insns, dcmp, NULL);
     g_autoptr(GString) rep = g_string_new("");
     g_string_append_printf(rep, "%s", "address, data misses, instruction\n");
 
@@ -659,7 +659,7 @@ static void log_top_insns(void)
                                insn->l1_dmisses, insn->disas_str);
     }
 
-    miss_insns = g_list_sort(miss_insns, icmp);
+    miss_insns = g_list_sort_with_data(miss_insns, icmp, NULL);
     g_string_append_printf(rep, "%s", "\naddress, fetch misses, instruction\n");
 
     for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
@@ -676,7 +676,7 @@ static void log_top_insns(void)
         goto finish;
     }
 
-    miss_insns = g_list_sort(miss_insns, l2_cmp);
+    miss_insns = g_list_sort_with_data(miss_insns, l2_cmp, NULL);
     g_string_append_printf(rep, "%s", "\naddress, L2 misses, instruction\n");
 
     for (curr = miss_insns, i = 0; curr && i < limit; i++, curr = curr->next) {
diff --git a/contrib/plugins/cflow.c b/contrib/plugins/cflow.c
index 930ecb46fc..b5e33f25f9 100644
--- a/contrib/plugins/cflow.c
+++ b/contrib/plugins/cflow.c
@@ -98,7 +98,7 @@ static GHashTable *nodes;
 struct qemu_plugin_scoreboard *state;
 
 /* SORT_HOTTEST */
-static gint hottest(gconstpointer a, gconstpointer b)
+static gint hottest(gconstpointer a, gconstpointer b, gpointer d)
 {
     NodeData *na = (NodeData *) a;
     NodeData *nb = (NodeData *) b;
@@ -107,7 +107,7 @@ static gint hottest(gconstpointer a, gconstpointer b)
         na->dest_count == nb->dest_count ? 0 : 1;
 }
 
-static gint exception(gconstpointer a, gconstpointer b)
+static gint exception(gconstpointer a, gconstpointer b, gpointer d)
 {
     NodeData *na = (NodeData *) a;
     NodeData *nb = (NodeData *) b;
@@ -116,7 +116,7 @@ static gint exception(gconstpointer a, gconstpointer b)
         na->early_exit == nb->early_exit ? 0 : 1;
 }
 
-static gint popular(gconstpointer a, gconstpointer b)
+static gint popular(gconstpointer a, gconstpointer b, gpointer d)
 {
     NodeData *na = (NodeData *) a;
     NodeData *nb = (NodeData *) b;
@@ -138,7 +138,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     g_autoptr(GString) result = g_string_new("collected ");
     GList *data;
-    GCompareFunc sort = &hottest;
+    GCompareDataFunc sort = &hottest;
     int i = 0;
 
     g_mutex_lock(&node_lock);
@@ -162,7 +162,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         break;
     }
 
-    data = g_list_sort(data, sort);
+    data = g_list_sort_with_data(data, sort, NULL);
 
     for (GList *l = data;
          l != NULL && i < topn;
diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index f12bfb7a26..98404b6885 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -39,7 +39,7 @@ typedef struct {
     unsigned long insns;
 } ExecCount;
 
-static gint cmp_exec_count(gconstpointer a, gconstpointer b)
+static gint cmp_exec_count(gconstpointer a, gconstpointer b, gpointer d)
 {
     ExecCount *ea = (ExecCount *) a;
     ExecCount *eb = (ExecCount *) b;
@@ -79,7 +79,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     g_string_append_printf(report, "%d entries in the hash table\n",
                            g_hash_table_size(hotblocks));
     counts = g_hash_table_get_values(hotblocks);
-    it = g_list_sort(counts, cmp_exec_count);
+    it = g_list_sort_with_data(counts, cmp_exec_count, NULL);
 
     if (it) {
         g_string_append_printf(report, "pc, tcount, icount, ecount\n");
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index c6e6493719..9d48ac969e 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -48,7 +48,7 @@ typedef struct {
 static GMutex lock;
 static GHashTable *pages;
 
-static gint cmp_access_count(gconstpointer a, gconstpointer b)
+static gint cmp_access_count(gconstpointer a, gconstpointer b, gpointer d)
 {
     PageCounters *ea = (PageCounters *) a;
     PageCounters *eb = (PageCounters *) b;
@@ -83,7 +83,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     if (counts && g_list_next(counts)) {
         GList *it;
 
-        it = g_list_sort(counts, cmp_access_count);
+        it = g_list_sort_with_data(counts, cmp_access_count, NULL);
 
         for (i = 0; i < limit && it->next; i++, it = it->next) {
             PageCounters *rec = (PageCounters *) it->data;
diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 2aa9029c3f..42bddb6566 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -155,7 +155,7 @@ static ClassSelector class_tables[] = {
 static InsnClassExecCount *class_table;
 static int class_table_sz;
 
-static gint cmp_exec_count(gconstpointer a, gconstpointer b)
+static gint cmp_exec_count(gconstpointer a, gconstpointer b, gpointer d)
 {
     InsnExecCount *ea = (InsnExecCount *) a;
     InsnExecCount *eb = (InsnExecCount *) b;
@@ -208,7 +208,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     counts = g_hash_table_get_values(insns);
     if (counts && g_list_next(counts)) {
         g_string_append_printf(report, "Individual Instructions:\n");
-        counts = g_list_sort(counts, cmp_exec_count);
+        counts = g_list_sort_with_data(counts, cmp_exec_count, NULL);
 
         for (i = 0; i < limit && g_list_next(counts);
              i++, counts = g_list_next(counts)) {
diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index 2a4cbc47d4..a9838ccc87 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -71,7 +71,7 @@ static void plugin_init(void)
     devices = g_hash_table_new(NULL, NULL);
 }
 
-static gint sort_cmp(gconstpointer a, gconstpointer b)
+static gint sort_cmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     DeviceCounts *ea = (DeviceCounts *) a;
     DeviceCounts *eb = (DeviceCounts *) b;
@@ -79,7 +79,7 @@ static gint sort_cmp(gconstpointer a, gconstpointer b)
            eb->totals.reads + eb->totals.writes ? -1 : 1;
 }
 
-static gint sort_loc(gconstpointer a, gconstpointer b)
+static gint sort_loc(gconstpointer a, gconstpointer b, gpointer d)
 {
     IOLocationCounts *ea = (IOLocationCounts *) a;
     IOLocationCounts *eb = (IOLocationCounts *) b;
@@ -126,13 +126,13 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     if (counts && g_list_next(counts)) {
         GList *it;
 
-        it = g_list_sort(counts, sort_cmp);
+        it = g_list_sort_with_data(counts, sort_cmp, NULL);
 
         while (it) {
             DeviceCounts *rec = (DeviceCounts *) it->data;
             if (rec->detail) {
                 GList *accesses = g_hash_table_get_values(rec->detail);
-                GList *io_it = g_list_sort(accesses, sort_loc);
+                GList *io_it = g_list_sort_with_data(accesses, sort_loc, NULL);
                 const char *prefix = pattern ? "off" : "pc";
                 g_string_append_printf(report, "%s @ 0x%"PRIx64"\n",
                                        rec->name, rec->base);
diff --git a/tests/tcg/plugins/mem.c b/tests/tcg/plugins/mem.c
index d87d6628e0..ca4e8883dd 100644
--- a/tests/tcg/plugins/mem.c
+++ b/tests/tcg/plugins/mem.c
@@ -67,7 +67,7 @@ static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
 static GMutex lock;
 static GHashTable *regions;
 
-static gint addr_order(gconstpointer a, gconstpointer b)
+static gint addr_order(gconstpointer a, gconstpointer b, gpointer d)
 {
     RegionInfo *na = (RegionInfo *) a;
     RegionInfo *nb = (RegionInfo *) b;
@@ -94,7 +94,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     if (do_region_summary) {
         GList *counts = g_hash_table_get_values(regions);
 
-        counts = g_list_sort(counts, addr_order);
+        counts = g_list_sort_with_data(counts, addr_order, NULL);
 
         g_string_printf(out, "Region Base, Reads, Writes, Seen all\n");
 
diff --git a/tests/tcg/plugins/syscall.c b/tests/tcg/plugins/syscall.c
index 47aad55fc1..42801f5c86 100644
--- a/tests/tcg/plugins/syscall.c
+++ b/tests/tcg/plugins/syscall.c
@@ -180,7 +180,7 @@ static void print_entry(gpointer val, gpointer user_data)
     qemu_plugin_outs(out);
 }
 
-static gint comp_func(gconstpointer ea, gconstpointer eb)
+static gint comp_func(gconstpointer ea, gconstpointer eb, gpointer d)
 {
     SyscallStats *ent_a = (SyscallStats *) ea;
     SyscallStats *ent_b = (SyscallStats *) eb;
@@ -197,7 +197,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
     g_mutex_lock(&lock);
     GList *entries = g_hash_table_get_values(statistics);
-    entries = g_list_sort(entries, comp_func);
+    entries = g_list_sort_with_data(entries, comp_func, NULL);
     qemu_plugin_outs("syscall no.  calls  errors\n");
 
     g_list_foreach(entries, print_entry, NULL);
-- 
2.25.1
