Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136718njd;
        Mon, 21 Apr 2025 22:28:51 -0700 (PDT)
X-Received: by 2002:a17:90a:d44b:b0:2fe:b8ba:62e1 with SMTP id 98e67ed59e1d1-3087bbc2988mr23312662a91.28.1745299730800;
        Mon, 21 Apr 2025 22:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299730; cv=none;
        d=google.com; s=arc-20240605;
        b=JF06evrfm7fd40hpQs2vbtzQk04VhSmqVG+Y3k/zTnxdM5bl6bW58fqNAZLwroxdwf
         fbaN8hSRUO/GXnLEtoBTOXbndlL8eVYv6XXIg/FgFFT2JXTk4h83U2NYjFBg9kr/a4Dn
         3r20vNG/BWo+5Eje/mDS45Bzip+vyLUv3Ih9xC2cZhODCPFzZ+vjMkjIljFKHasv4Zt9
         AMjjtQDgSYtrmWN2r1h1sKB37i+mZBuPTu+Wlqy31HZsfdNziPeTML0n4xMMb08vCCOm
         ERY8AxDtAv85QZ7i8Asd+arLtDTTvln8kTwSS8b6DHWq49hWbKp/XxQrlZeGaxiMZHVC
         xcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N77jI1TJkHkxuSuEB7FQGv9pn4PKhNEGgbsGxqAnoxA=;
        fh=WIimXV10oNQVSWoHfbYJA0XVFb26tXCpGz8DBOio8H0=;
        b=Ein8nYPQHR6ytn0TEKi0UBR09aQEpy+XE4vOIFx46Ean4p3grMomSY+mAzvaLGc30t
         5jZoLJ/f4Rf1V11dWnFA2feK9HDYz4TD6andQJlM3o9B+swjWzh2ZmG4cHF8HAjoDEBQ
         Ov16fzJQb4dvLN4+cLmz9oM5fhCArpL1R1nL3foRWp5wN+9feHl3PgueU8LccXOtRZ5i
         1xKeXa5+mSCabYZdQCrPTWBbKRe+l6LDAFNVoEWO8U61pu7napQ09IkPY8+jZRz+EB/G
         oVD185lHukOOaeHJ87w8pyvcYnv9dXIWL0nvi+08cmFK8U8mt/PhYIVvRDsdBsZ2dceZ
         kQvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6msGNsA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d87519sor52076195ad.15.2025.04.21.22.28.50
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6msGNsA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299730; x=1745904530; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N77jI1TJkHkxuSuEB7FQGv9pn4PKhNEGgbsGxqAnoxA=;
        b=N6msGNsAYYt3IF/HxS+XqyDl37HvIji6K6c/kuqBrRbpfrNWZB6kOxdVLamKLQPjim
         cUfn4VQFKr+qgMc8OBEB4UWITuPlxIwtv1QkjXCDbBraVu5qO9r3x6WKJQmXFqJecokN
         xEINWC70H11hbFRpmYMZyepxlY5LoEgStnKHUYdDjCmFfZPoA+nXn/0tLJtaQhzFNK4q
         xtctVv1WpZVRygJojjGoo43v9BjhEwf2g+/raWXWoID0sCMlDcRF8YFF5I/oYfqfccQR
         BvRrlcw33hQ5qxNZAa/79S3MaDtONlkRRO4mj1Gc8a386im2K579Zs2ZcRyDa/Epf1Tp
         IIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299730; x=1745904530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N77jI1TJkHkxuSuEB7FQGv9pn4PKhNEGgbsGxqAnoxA=;
        b=CBEiSK8uRVugzhP7yqoAQHTTnQk3A//ImHiFw6b5N+BNhn5a/0UIH4a1L8muwIPSFh
         wmxc09b1mgZc7Kdp34JTlIM0OTjKkSrvevr2gpCfRcLRmIm5Jn+1W/SN9fxlyEQ84IW3
         yvD3yiR/JjKqR04P4LuVje69aZXGiQ/BgTbDEYEE8z3qmGrMFSNJEtWdbFsLA7iUKyIk
         kC6IF0UsL2btjoZGoIbwx8oyM2VFYieWys5m5etpUKGSn9FKBj7jqEwvMhuRW5Z9lo4b
         BdwAXnxlNHa7+Ezmjkh2MFqUOQHlsnCR9KGt5036/ZnL9l4IG12tidInkeyYRvCbGBJ+
         z5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUstgFnl0PB675Kb+O2tiKYt4D+YpRvgems9CNLRc/0jEQW4OCV6L7Ng0UhWeA53rZVMMzOlblE@linaro.org, AJvYcCUz0deGSLGmPYgKrsc3fMv1IGaQRV9KcKPp7umzAg3szPjMvh/T+4Vi6fgxq2ZizZCAhnx+doHEA7GPJgt29r3ddLw=@linaro.org, AJvYcCVDnSLdv7o8e/ghELAHv1D9qA3/OywIOP53D0hy//27RaFe9LM9aGxGi8vTW9YEBsC4wIMDQDc52wbz4Age@linaro.org, AJvYcCX4xFVWarwFADD6hcH10sP62b7taPEmNm4WSMTUm2cKhg4UC1Sg0wSAV8CrhZLvCZDRaSRLZJk859t5Ua/4/4S0KA==@linaro.org
X-Gm-Message-State: AOJu0Yy1eT+wIR5y44wtcuL6EGkVUSwMxyjQXTBUHsU9G1HwIdA+Umb4
	kNCwNzBtDdu8bewyE6JdiDmaUlRGjcmBAxzFxSKdGAYki5Sfl3Rm
X-Gm-Gg: ASbGnctldnHNWgCFa7z6x7uyEmgRcqcE/Wau4w+Tde5kzBSDRJcm3QplODmSL8Udkj3
	qfG/CDp+5riQtcbbLAbc6BzxMX1/tmLjVJQYY/ant95CnDk+ylzYHwKocIcB5mqiffgw2HSNm82
	vjMb2lNZVrpZZbq2nthoXrooWqRVsZpbpxpeGSSoa4IqNAGuIKGyUXec42C5Sj67cogyFgMK0Sl
	07j36HI+zsE2tLvKofKMi0B2vNPINbc4EInPLCIdeQINHgwo+YWQiGgPTm2h4VOz7OSX6tl9B/s
	s+EzO1D2q4LAWt3M3p9VvQLw0xH4H5c0L/CcE0CCiZ7MZLwnLTTrzIhZ3CwnF0tfhhaCww==
X-Google-Smtp-Source: AGHT+IEzO/OjrHgYHWrum/0TCfoaM8O8Mfn1Scpmvq5a7CT1HGi/VbS6op7C4w92p+94XfsgeUi2hQ==
X-Received: by 2002:a17:902:e808:b0:220:c34c:5760 with SMTP id d9443c01a7336-22c5361b398mr186284245ad.51.1745299730025;
        Mon, 21 Apr 2025 22:28:50 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:49 -0700 (PDT)
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
Subject: [PATCH v2 06/20] contrib/plugins: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:10 +0900
Message-Id: <0fcddfca16ca8da2bdaa7b2c114476f5b73d032b.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wX7F0R//HLgH

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

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

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

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
