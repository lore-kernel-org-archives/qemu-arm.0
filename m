Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175290lfb;
        Fri, 3 Sep 2021 04:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLNcCyhecOcrA8qbF9vfG+eMAek2bYLszX+q1hRk8JPglpSkyKcY34hQQP4BHh2akNNeqf
X-Received: by 2002:a05:6402:2210:: with SMTP id cq16mr3401031edb.348.1630667359469;
        Fri, 03 Sep 2021 04:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667359; cv=none;
        d=google.com; s=arc-20160816;
        b=z6r7RjD8esiuiAAo5SNMDMy5KhHGoRALu4bxaUGHSMSIgaKExX5aZyAIEESz7aChGK
         2O5qVxmW4CvkBnh0T0HtHn6Hwf2QypQiyPSzUi697rAhDG/jaxRiF/oGTTJGB2gj92OC
         YaPwD47L03RLEndv8R8cJhsERFn2H6Jn+8EHgijLmX3GwMrDJFUgAQubWjq45RmKIuQ2
         t5bBFNQ4hKeQaKWW1AJNYK8GPDd2k05kHX2eLz/qpvaLL8IJsNTtpsnVQ0X41fxl9CIZ
         mB8gH1RUkVAyTw0yTVyNvuLrBvFk1sKql67ZdEu/JM1JqCozvV6c+DWi+Yup8J5/8sgr
         tJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PNmQn7pp74t94Lr73ldUSMDFHfSQgs8qkh8r7R4cWBA=;
        b=f/RoNx6rGWFDjBMITgJbuQqWJu+aWKIyaP/NIJ0nSBO9hyVJ4TWDI8mRGqfoSgjmIB
         kC29i5Vsb+tZmjU5zuEl0E7mZs7MgRcq7eGLLWoWGmTKEjeb/7RSHiwgUjFUNNYW2t2+
         so1xmW9AAYSBmTsn/7IQ46vX7Qy1DZ/6jsPVOprh0Qwo7cON7+4y2HWD1RrvO7VyAUsD
         o+HVVKmH8GnM2To0vy5U5TXrEy8z1iEC9S/HAWv4IXH7O3p+zA3qw2wzTUJUxDf+xSOD
         U/wA6KD62WsrAuR65W/7r/hInJ9pNxdgf4QbJXpRrgVXmB3hICV18CzmEK3eGz97lJ2/
         RkBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OPFGc6av;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id 6si5199725ejm.251.2021.09.03.04.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OPFGc6av;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNmQn7pp74t94Lr73ldUSMDFHfSQgs8qkh8r7R4cWBA=;
	b=OPFGc6avkdVAKor4APa+KJ8kHQfLCiqr5f/wf1rMVF9HTCUz/ZLI9YlV9hXkm+47rPDPeZ
	SQ9JZ2qxwPztqC14SvaVnAc9LCIcnj77IprH7cHVJNdNUgiONowj1AwoXFVEOKXy98Ueji
	LZBZrYNn53p5zlHvvQ7hazbQIDMMZEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-t6PIE9ZxPL-VQKl7mDo-mw-1; Fri, 03 Sep 2021 07:09:17 -0400
X-MC-Unique: t6PIE9ZxPL-VQKl7mDo-mw-1
Received: by mail-wm1-f70.google.com with SMTP id s197-20020a1ca9ce000000b002e72ba822dcso2518292wme.6
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNmQn7pp74t94Lr73ldUSMDFHfSQgs8qkh8r7R4cWBA=;
        b=t9AUt4AFKOVp9KGSRAcpJASShro3YpltL27rLmhFmJWloSyRx5uWW4pN2vIyxtDZOL
         Gy6sP1oJ/BDOpzh5kscHTDzHgQw9qlvsAbHDMvrlAB6ADu/dtNaHnAxfWyNYf6TOscAU
         nhGhUBxVSe1mOSyPEZrMpWzcZuHENvBwreUZmUTgrzHkZz+nWvj+QzNiBzdaQOFJnXYk
         71MBg39pUFwaTmJEIsL4JG1cilD64bvPTHrjUtThi9gCpaqRP2Roxx1/mz2qNJTUzf8B
         eVA+pCz/P67didOBdVCxzBSv6PwSB7BA/Bvq84FLxq58Ii7Ek0wYMn/+gI73YiT0Tc86
         43+A==
X-Gm-Message-State: AOAM5305VXEteZkJGp6bwpPBJdPqkY8Fwise1Tw/hQBAMYKH1c0qah0N
	rgx90r5BYEagBmnkVYL1nTklzKyx0aOF1hoLfa9c6Td2dyg5kyJDE9osifTIPxRrk4d0PvE4lY2
	8yvJj/riQVuYrM+DG
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr3413351wra.245.1630667355844;
        Fri, 03 Sep 2021 04:09:15 -0700 (PDT)
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr3413326wra.245.1630667355660;
        Fri, 03 Sep 2021 04:09:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id k25sm4751451wrd.42.2021.09.03.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 23/28] tests/unit: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:57 +0200
Message-Id: <20210903110702.588291-24-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dOfXm8DwV5yg

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/ptimer-test.c | 22 +++++++++++-----------
 tests/unit/test-iov.c    | 26 +++++++++++++-------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
index 9176b96c1ce..23efeb04a57 100644
--- a/tests/unit/ptimer-test.c
+++ b/tests/unit/ptimer-test.c
@@ -798,64 +798,64 @@ static void add_ptimer_tests(uint8_t policy)
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_count, g_free);
+        g_memdup2_qemu(&policy, 1), check_set_count, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_limit policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_limit, g_free);
+        g_memdup2_qemu(&policy, 1), check_set_limit, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot policy=%s", policy_name),
-        g_memdup(&policy, 1), check_oneshot, g_free);
+        g_memdup2_qemu(&policy, 1), check_oneshot, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic policy=%s", policy_name),
-        g_memdup(&policy, 1), check_periodic, g_free);
+        g_memdup2_qemu(&policy, 1), check_periodic, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_mode_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_mode_change, g_free);
+        g_memdup2_qemu(&policy, 1), check_on_the_fly_mode_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_period_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_period_change, g_free);
+        g_memdup2_qemu(&policy, 1), check_on_the_fly_period_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_freq_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_freq_change, g_free);
+        g_memdup2_qemu(&policy, 1), check_on_the_fly_freq_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_period_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_period_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_run_with_period_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_delta_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_delta_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_run_with_delta_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_periodic_with_load_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_periodic_with_load_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_oneshot_with_load_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_oneshot_with_load_0, g_free);
     g_free(tmp);
 }
 
diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 5371066fb6a..19ae24adb70 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -173,7 +173,7 @@ static void test_io(void)
     }
     iov_from_buf(iov, niov, 0, buf, sz);
 
-    siov = g_memdup(iov, sizeof(*iov) * niov);
+    siov = g_memdup2_qemu(iov, sizeof(*iov) * niov);
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
        perror("socketpair");
@@ -350,7 +350,7 @@ static void test_discard_front_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, 0, &undo);
@@ -361,7 +361,7 @@ static void test_discard_front_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -373,7 +373,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -385,7 +385,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov->iov_len);
@@ -397,7 +397,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, iov->iov_len, &undo);
@@ -408,7 +408,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within second element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov->iov_len + g_test_rand_int_range(1, iov[1].iov_len);
@@ -499,7 +499,7 @@ static void test_discard_back_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, 0, &undo);
     iov_discard_undo(&undo);
@@ -509,7 +509,7 @@ static void test_discard_back_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size + 1, &undo);
@@ -520,7 +520,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -531,7 +531,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov[iov_cnt - 1].iov_len);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -542,7 +542,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -553,7 +553,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within second-to-last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len +
            g_test_rand_int_range(1, iov[iov_cnt - 2].iov_len);
-- 
2.31.1
