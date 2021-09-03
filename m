Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516378lfb;
        Fri, 3 Sep 2021 10:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD5SqkjiY3tzauLSZzhBgLb92uPO26J2Rbb5hXnrQuK2F4RXaVL9JkBgS2R1a3jgkqKW0h
X-Received: by 2002:a17:906:314e:: with SMTP id e14mr29827eje.165.1630691239089;
        Fri, 03 Sep 2021 10:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691239; cv=none;
        d=google.com; s=arc-20160816;
        b=iflv3KoCb0JyWUQUZmmgPQ0ObTgTAUuWjeTe7i2iQ7ayY6lt/H/6HkH3ZrjvD9fpsN
         UG+ZTL3RD7gr4izGClYmFLCiu1qq2csg8315xiEdqgumYe9YRXInTYvar4+GiaAs49Ru
         YlI7eoCP5iBmfGq4hbt3bL2zkPDB3tGLHXgoL60av7QrbBBE4RjgKujJfShpx2sBr4Yi
         Kk95dA5QnNSg3+peE6ajF+t/m5Xn5gLcwD5VXWNP+O+R1BNI0E0YyF5a5x1GAFZoGqdK
         5Hcetz4Z8f69x63mz09w0Z66WoirqtLFatRrZzQG4izXfxpOfv7TK5Bm/L1lSQ+drPBy
         Agqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Opy48p+U/1m19PPU36BLWzc0HjoV+sfbnePbr/WuVoc=;
        b=UxFJMpbMxsW/VtKycleNd6rTbgLJmJH5G+T8NyQb7a5xFMvlGzk/B1bISPPI/EQ2EW
         1iINaf3NxE55u8o+BXfa6CdBDMGUYQMYSA8iqIei8bHaijfGO0xx7aWNFbVAlE1drgYC
         ic/k0TasivyD2Y/SxRWViDdOPBu2GKaUWQxyzzepqWFGQdYV2ioSo9FsEEG7EFIUl/uv
         5P1PfWl687j9lvqHGhUaDHJxrIYnFlS7drpuNcy7SiTG4hyBaC7rxsrHn23sjeLtGDWd
         TOo1QPoHy0I+dMtcMgPP+nQQyskBT2j80epIxhTzJW5oOwSZHpKS46DeZqkLsVcAtR/T
         0vhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1OsbebQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i11si192075edb.471.2021.09.03.10.47.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1OsbebQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Opy48p+U/1m19PPU36BLWzc0HjoV+sfbnePbr/WuVoc=;
	b=T1OsbebQV0TbWEzfkHEcCSsRmGrv++LToSoYkAya/rBG5zg2/+GskmttXVuvGZpCBcq7TU
	h7cDXaFGlIhhOLWb0zarZhkYJbicEM0p5n1QC5UI6L153tVTYe2xXTKhgF4/Bg6j59V9uO
	ExFNdBJ68EWr/l6rhBNg1TCpFqrtqkk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-WK9JJY5bMCSOrYSommjNdA-1; Fri, 03 Sep 2021 13:47:17 -0400
X-MC-Unique: WK9JJY5bMCSOrYSommjNdA-1
Received: by mail-wm1-f71.google.com with SMTP id r126-20020a1c4484000000b002e8858850abso2158826wma.0
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Opy48p+U/1m19PPU36BLWzc0HjoV+sfbnePbr/WuVoc=;
        b=O5RVjNDzHaHg/QuNHLkbjdD8vJkhDQKDm2G2Ca218WwlQW4Z1cGT0xA73aXtAPdmfR
         A3o4EELXOMxyuKvMBHSc7Ej1fO0wOiuW+Q/Ur6Uey2FMMy1r8mGYxxG3kfULY1zpu2ga
         Jt+EXJgY3rwtdonF7eQB/bJAfuET62hXwwYCf5IOFu6qYMrBgvsEiOzB+SKewCNOcRVW
         jyg8uRQnMsk5PSvIhxdse2xvTrB8v71yfoh3gRTdBigtXHMtcQeVxjYIz1cf8KMSYE2v
         VCJY+Pr+c7CyUtHuxDeG5tYvtzgu0ZZUoAIJELIH0avcyzznpAwqXJbLhNK0lCyNLjIy
         sZBw==
X-Gm-Message-State: AOAM531orE73BWd8dNlDsj4uduIQAH6FbTnM33vjfXtmqLgoKo0fQfKF
	6JNcxfUyftII75li8h/IbKJ3kJ6Srdfz1bU6bKNySSAQWs7e8BCjJrN0YF0dHJX1/7cPfo3O3hL
	M+sa4WYwMSJH/UEe1
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr28863wmm.19.1630691235635;
        Fri, 03 Sep 2021 10:47:15 -0700 (PDT)
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr28842wmm.19.1630691235390;
        Fri, 03 Sep 2021 10:47:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id f5sm19441wmb.47.2021.09.03.10.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 23/28] tests/unit: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:05 +0200
Message-Id: <20210903174510.751630-24-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: crNgvAgCS/Mj

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/ptimer-test.c | 22 +++++++++++-----------
 tests/unit/test-iov.c    | 26 +++++++++++++-------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
index 9176b96c1ce..9ba5ffe273b 100644
--- a/tests/unit/ptimer-test.c
+++ b/tests/unit/ptimer-test.c
@@ -798,64 +798,64 @@ static void add_ptimer_tests(uint8_t policy)
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_count, g_free);
+        g_memdup2(&policy, 1), check_set_count, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_limit policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_limit, g_free);
+        g_memdup2(&policy, 1), check_set_limit, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot policy=%s", policy_name),
-        g_memdup(&policy, 1), check_oneshot, g_free);
+        g_memdup2(&policy, 1), check_oneshot, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic policy=%s", policy_name),
-        g_memdup(&policy, 1), check_periodic, g_free);
+        g_memdup2(&policy, 1), check_periodic, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_mode_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_mode_change, g_free);
+        g_memdup2(&policy, 1), check_on_the_fly_mode_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_period_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_period_change, g_free);
+        g_memdup2(&policy, 1), check_on_the_fly_period_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_freq_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_freq_change, g_free);
+        g_memdup2(&policy, 1), check_on_the_fly_freq_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_period_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_period_0, g_free);
+        g_memdup2(&policy, 1), check_run_with_period_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_delta_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_delta_0, g_free);
+        g_memdup2(&policy, 1), check_run_with_delta_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_periodic_with_load_0, g_free);
+        g_memdup2(&policy, 1), check_periodic_with_load_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_oneshot_with_load_0, g_free);
+        g_memdup2(&policy, 1), check_oneshot_with_load_0, g_free);
     g_free(tmp);
 }
 
diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 5371066fb6a..aa679b56131 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -173,7 +173,7 @@ static void test_io(void)
     }
     iov_from_buf(iov, niov, 0, buf, sz);
 
-    siov = g_memdup(iov, sizeof(*iov) * niov);
+    siov = g_memdup2(iov, sizeof(*iov) * niov);
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
        perror("socketpair");
@@ -350,7 +350,7 @@ static void test_discard_front_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, 0, &undo);
@@ -361,7 +361,7 @@ static void test_discard_front_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -373,7 +373,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -385,7 +385,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov->iov_len);
@@ -397,7 +397,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, iov->iov_len, &undo);
@@ -408,7 +408,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within second element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov->iov_len + g_test_rand_int_range(1, iov[1].iov_len);
@@ -499,7 +499,7 @@ static void test_discard_back_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, 0, &undo);
     iov_discard_undo(&undo);
@@ -509,7 +509,7 @@ static void test_discard_back_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size + 1, &undo);
@@ -520,7 +520,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -531,7 +531,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov[iov_cnt - 1].iov_len);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -542,7 +542,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -553,7 +553,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within second-to-last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len +
            g_test_rand_int_range(1, iov[iov_cnt - 2].iov_len);
-- 
2.31.1
