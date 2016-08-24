Received: by 10.25.21.156 with SMTP id 28csp115945lfv;
        Tue, 23 Aug 2016 21:24:43 -0700 (PDT)
X-Received: by 10.200.41.88 with SMTP id z24mr997039qtz.127.1472012683758;
        Tue, 23 Aug 2016 21:24:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a31si5098844qtb.7.2016.08.23.21.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPk3-00039N-6s
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:24:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfB-0007IF-F4
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPf5-0004dx-Kd
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:40 -0400
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPf5-0004ds-G1; Wed, 24 Aug 2016 00:19:35 -0400
Received: by mail-qt0-f196.google.com with SMTP id q11so198965qtb.2;
	Tue, 23 Aug 2016 21:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PIsDltXtUETRDZ9GQ2f4/uflPk17rcMbPKv05p1WcYY=;
	b=Fb/MXOWC8C1U57KUzYOd/8Gm5IE/bCdctsfuIrIBK8fhSZGiVR7RUl2uOMueSumoTm
	7hrfZZ6V2MXpcyumv0hHPo7eWgErNkiTBVPElgNOnPql8KLHSheo/dSK+2DSx1ip9wHl
	LdwBgo0n0X2Y+BdVxU6jBzcgzuh7+o50y60dbyGn9erlCtmJj4Gne/S4fvkvZVNeWG/s
	6NMia6A3nwfIiel3dPOjXhFlvipwS/NKphWL3CHJb5X2ov6oClozJiK/5OAEkOhr6llD
	LZa+gMEqe8T3lLtgfi+vMMkHKTNoNRzWsXGgMTuGkj39/CvMSzjGOxAPa62AtSTKJ3/m
	Ggvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=PIsDltXtUETRDZ9GQ2f4/uflPk17rcMbPKv05p1WcYY=;
	b=YuZVgxdM1kl1jAN0A45k5x44fFsE2XSKyPRhYhjr9+7Mj9qUTSfbc/djRkNuynkhY3
	0u2Bq0r2kZby6/ow5OO/czdPelA3gubrXFTgTc9DWkg/NjE0Tn+7DclTaEeU2pbijx5E
	PESV+9AitsBI8+7T91O6B1cYDwWY3ksY4EO8pd2/+11pZuQZ2Zb5rr6AK4sE/LyejQTF
	NnFpleUvTSBEdrRbl+BvlAs+qdcn2zwg1qZRj9QkIrLPUDmklQjwkFedlVnpH6ODn5QX
	BqHFV8dZbuZYrv0++6scS/Aj1HSrkhAEkoE0Iqkljm4M4sieAXVBjzhYgoNYheD/5F79
	01Pg==
X-Gm-Message-State: AE9vXwPSo/TO0HYJhPyOlfiIV4s0bLtsofwD/OlD4Bhn6aRS7R7/ehWchpHl2HhIJTev+g==
X-Received: by 10.237.49.5 with SMTP id 5mr1056601qtg.136.1472012315131;
	Tue, 23 Aug 2016 21:18:35 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:34 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:54 -0700
Message-Id: <1472012279-20581-3-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.196
Subject: [Qemu-devel] [PATCH 2/7] cutils: Export only buffer_is_zero
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, vijay.kilari@gmail.com,
	peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fYhEr+4Mq1Kg

Since the two users don't make use of the returned offset,
beyond ensuring that the entire buffer is zero, consider the
can_use_buffer_find_nonzero_offset and buffer_find_nonzero_offset
functions internal.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 include/qemu/cutils.h | 2 --
 migration/ram.c       | 2 +-
 migration/rdma.c      | 5 +----
 util/cutils.c         | 8 ++++----
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 3e4ea23..ca58577 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -168,8 +168,6 @@ int64_t qemu_strtosz_suffix_unit(const char *nptr, char **end,
 /* used to print char* safely */
 #define STR_OR_NULL(str) ((str) ? (str) : "null")
 
-bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len);
-size_t buffer_find_nonzero_offset(const void *buf, size_t len);
 bool buffer_is_zero(const void *buf, size_t len);
 
 /*
diff --git a/migration/ram.c b/migration/ram.c
index a3d70c4..a6e1c63 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -73,7 +73,7 @@ static const uint8_t ZERO_TARGET_PAGE[TARGET_PAGE_SIZE];
 
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
-    return buffer_find_nonzero_offset(p, size) == size;
+    return buffer_is_zero(p, size);
 }
 
 /* struct contains XBZRLE cache and a static page
diff --git a/migration/rdma.c b/migration/rdma.c
index 5110ec8..88bdb64 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1934,10 +1934,7 @@ retry:
              * memset() + madvise() the entire chunk without RDMA.
              */
 
-            if (can_use_buffer_find_nonzero_offset((void *)(uintptr_t)sge.addr,
-                                                   length)
-                   && buffer_find_nonzero_offset((void *)(uintptr_t)sge.addr,
-                                                    length) == length) {
+            if (buffer_is_zero((void *)(uintptr_t)sge.addr, length)) {
                 RDMACompress comp = {
                                         .offset = current_addr,
                                         .value = 0,
diff --git a/util/cutils.c b/util/cutils.c
index 1c8635c..621ca67 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -327,9 +327,9 @@ static bool avx2_support(void)
     return b & bit_AVX2;
 }
 
-bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len) \
+static bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len) \
          __attribute__ ((ifunc("can_use_buffer_find_nonzero_offset_ifunc")));
-size_t buffer_find_nonzero_offset(const void *buf, size_t len) \
+static size_t buffer_find_nonzero_offset(const void *buf, size_t len) \
          __attribute__ ((ifunc("buffer_find_nonzero_offset_ifunc")));
 
 static void *buffer_find_nonzero_offset_ifunc(void)
@@ -350,12 +350,12 @@ static void *can_use_buffer_find_nonzero_offset_ifunc(void)
 }
 #pragma GCC pop_options
 #else
-bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
+static bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
 {
     return can_use_buffer_find_nonzero_offset_inner(buf, len);
 }
 
-size_t buffer_find_nonzero_offset(const void *buf, size_t len)
+static size_t buffer_find_nonzero_offset(const void *buf, size_t len)
 {
     return buffer_find_nonzero_offset_inner(buf, len);
 }
-- 
2.7.4

