Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783496njd;
        Sun, 27 Apr 2025 23:40:29 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:224:1d1c:8837 with SMTP id d9443c01a7336-22dbf5ea85amr161957765ad.19.1745822428745;
        Sun, 27 Apr 2025 23:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822428; cv=none;
        d=google.com; s=arc-20240605;
        b=KWthXmxhBGMLhXogtBzDYAKUN0cyUsK5fYaCbrSm6akkvZkB/cVkIz/ZzRn/FUdhlI
         cJW0xtfNZf8krakf7Yu2zvP9R950Ps6Au7LRzQ4YVTQte/WKPWQ/8NNGjPM0Qv3jnTJj
         6GdwUyMty0J5Yv7d0uSec5L57QR6DTiTSux+Ej6T0bdg6zUyIy+mUs9SugSJtyylfln0
         hQUfPwIOhwJtFZ6z94FNB4QIVdzjwOBhQZne3o+d0z5aYF3Sx4+LSvb8PQc1UkYC7Or8
         MhI1V4Mgg8JIuqXTWg/7cw2LJ9BURQ2cnJQexAGIb57R9RSmWpe0/J397rIe760Gh5ow
         9dUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=l4KoYLWG+bLIwoIosSyQfEMM4+zIu3Mc1lJmj7mkIac=;
        fh=5UywlR2brVQQCrxykFrZjNhePF+MrpulojpV0P8IqvU=;
        b=DvJ89MYUNvLNWa/C3Bidh8bb4QfHUTk6U1zhfCB4VqRI7PimrcIUKEl4wheyWRSyL+
         vLi4OjD6/AKoHJK2WWt4CHpnssC1Gzqemh6he1yDUnjr62HUqQ/rZ3OWzANoJqJEwCn1
         wJdZsNxboDKqAo7Fo+a3RBIsrIse7e6yY+ftjQNHkAD6EZ3krUKLj72LYXIUjlzTrPgT
         E1rcpKwKJlXB6J24J9fkRXwajNnLTLw8qx1X65KK9s7AG4aJsRccgHEIvoG6Y6eX6+1P
         Ue6M90oHZe7JbrczJD08oK3xcFiKCc5YxsFJhWARUM1siK14RDGn7zfbCaHNm8ghXrBC
         E85Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="gelOj/WX";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4d6e05dsor56940455ad.4.2025.04.27.23.40.28
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="gelOj/WX";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822428; x=1746427228; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4KoYLWG+bLIwoIosSyQfEMM4+zIu3Mc1lJmj7mkIac=;
        b=gelOj/WXs5wirQ4w/ff9QeG5dN+VfwF32r6Q2L87mVfXMP/U1FQB9cwbRNR9PQIiLT
         h9ISflVxHnbbHl84Bt6ya7TqEvCA+6v+yViPgM+ztUQ1fjtu0ka4ZLCjcdzGFmpZ1m2h
         t69kcm6gedI67xmnZ23umTwbDvERH/tvG3DR9UznVKw3PDKcFujA1gXSw0DmSWYBBxYi
         nunXAXSVTsRyhlOgVkgERPIiYDRL30zcajYeEdaRwXr9V8T6g1n0KuCwKUb14OfOu8eL
         AJhPs83y07qnZ8AFNM96f3RKL1IxA5TzoohFAlym1q4s/5kteOQA3fwo8A+qUHYy7XQI
         PCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822428; x=1746427228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4KoYLWG+bLIwoIosSyQfEMM4+zIu3Mc1lJmj7mkIac=;
        b=Q0St9YIOJUOTZzESQEnvD+RFGLWbyPJRG8uyriUhIlB+aacCWjY441d/Ej49LKlMoY
         4wX/q5pmfs6z6kRosi/L7MB1Qc/9m+/IUbBJfMF84AZTvclR5PrIT1Lk53tb9jSHpr4d
         MfXGcRWdE3FupTcYWUjKOZmjra6vJvx3D6yEjIBv6cnjrnyC3/5mpJ0IYMYdNvi+nDIp
         w5esS/zT4QloR7GwXLjXSo9eqTjkBXocROXWXIvgOaGKtbcPIDawHb7wpjAYAL81C/pk
         E9qo22nXTp2NbyzK1Pv1BrSxImWzKJ2Svm4TvV0edSWMK7Z/2D2WsoxkUcF05aO9oOVP
         WMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY2g5blvDyE9yWI3H14jgpUMDiwPLOK1UrYHQuMAI6HgIwr0h9UVN5F/0jShQz1xNbavUus+mBA2oHIz1T@linaro.org, AJvYcCUkwcJSTvyzu6kuoF4nU7TUnEGazrbbv/EU6euqNc8C+qxk9KZRoLp6L3otkGktkoJsQIhj23xlluwhI0LJwmoy3g==@linaro.org, AJvYcCWI3yNIuF7/7aEFtGMvBi7BU3TWlOBrKdokV+5Ijac/3NhtrdU1VTlBkltUFc2fMgXFcSYIaKDxdcg4A5HSQI7cSMs=@linaro.org, AJvYcCX5Gcyp90L6ROfBiR5c4p4EL0lkfziSOge8Ke3PPKMlENF/M8liYri0Z5lwncLFl23MCBrcWZR/@linaro.org
X-Gm-Message-State: AOJu0YxuRSNaS+6Fvw1JMr/FrdlRWCBdtTE04lUUHxtKCpIKKyHQUeTE
	3CJ0Kyy7HNfUjBmnEcAeuCjtix0KHTXGXFz+O3ug5Lk8mWO4q0m3
X-Gm-Gg: ASbGncsz18qbpdCKbLjFcJcrNLA/w1dPFR7xIT1rGnS8xoD0ZsKsune6LZ4GhS/spTo
	ePofgLVWnZmhuv130EYU/JkzncL0soaYZeiB5UJ65J415dgAo4MLRJ+rWrGdcQNnCuEhHlykWCJ
	QV8eXoix1g8cAFQDhiY0ED1FG+qL5TN8+/CwVRj+5VU08Cng1XKAQojAYUc/Fjgi5B4C3rcl5w1
	s2OGn0p9OCqPEyxZchMc0ttibGz60K1Q5vJFHw9THSKP6TvTXA5/0b42p0aNzOgtmLLvjWdKsD8
	6cv11R3Vs3hh+Vl9Aiqh66UHjNvdR/XdQbNaYg==
X-Google-Smtp-Source: AGHT+IEJbv93eh6nTpjZuH/I0Vi1B6hLrtMXuCMbvHNfvCXIiuIjQWpkE1nTDm3AmKAPMACUN8cl7Q==
X-Received: by 2002:a17:90a:d888:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-309f7dfdd54mr14235173a91.19.1745822428051;
        Sun, 27 Apr 2025 23:40:28 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:27 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 06/20] contrib/plugins: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:55 +0900
Message-ID: <cffa8259cc9bc78a5719a22e871fedbd9e80023b.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PDIaqgLkrAbl

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

V3:
- This commit is included in this series sololy to ensure successful
  builds. It has already been picked up by a pull request, so please ignore
  it.

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
2.43.0
