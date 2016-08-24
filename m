Received: by 10.25.21.156 with SMTP id 28csp115896lfv;
        Tue, 23 Aug 2016 21:24:37 -0700 (PDT)
X-Received: by 10.200.45.108 with SMTP id o41mr1103929qta.100.1472012676981;
        Tue, 23 Aug 2016 21:24:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j70si5057417qkh.207.2016.08.23.21.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPjw-00033Y-CG
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:24:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfB-0007IE-E0
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPf4-0004dg-4G
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:40 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:33399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPf4-0004db-01; Wed, 24 Aug 2016 00:19:34 -0400
Received: by mail-qt0-f194.google.com with SMTP id j37so201094qta.0;
	Tue, 23 Aug 2016 21:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D/06Dl0Jv+NzsRedPl96IMqFe2+Cp6XRnb7GFYJSFIU=;
	b=uASl2FZqM8ggwvfaoBFpCzJpRkwMQ6R6QM0FC0OeEmaiuQgoeRo4jW57NkALlgEs7K
	mZjFhQ4vjbnEOSlJtWNM8+vfa0Bs0C+nLoBQQOjY0n9OJ0WYN+KVyFeOJjKHvILR0G45
	biDxF2NfpqwnFnoaC0tQPUAS0IrIX6wL5JgkMeXmszrtS+P1sbnT8B5n//70tuE7EAzA
	guUuUlm7tacAFNGSNhz4slRzO61HTwHgOX6Sz6c5tN5jTfIfOYh0OnrnnT4xH+v7ikEH
	716L2vfFy4MMzGhx3JTRlnLqdJ8fdn0nsgVTiEh09U7LQIMmWKkPd0Hz8mlsngRnn2uF
	MNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=D/06Dl0Jv+NzsRedPl96IMqFe2+Cp6XRnb7GFYJSFIU=;
	b=NQMMolpxSS5OjFm9Sey3m1GRmKPT4os5UvLKf0rYe6FGHhpFY6+fQTd+SJr0VpXSHO
	R0a8TLiIoV6gXdCzqbhJ7XmsxEfXSe/dn+1Am1G+1H7ijRu0ILPUKEO4b1u38mBKDNh+
	UnA6oBbKL6tAC429F418Goz5ed02/h7ZyzIZ3CBCr97zUFBlFUpVAiJ+0YNNeD7sg2Fn
	iE7HBkeKfQxDQrTAcOSmjJ3YZWexQBL1+reIvKRVPThfRKDYofvSIq6wKU8oWfitqoSu
	tvS1O1+LyVc5VtDrY12MPV9NQ6cvAxLcnCn6m0K49f38jD0k7IEeisSBkCfQ8rnuFuyu
	QtzQ==
X-Gm-Message-State: AE9vXwNnejvsb+kXAvr27RwllxB+YjEf0hUIynLbSvK2+j5v1t4UNZCvrAOHrJouDjY9QA==
X-Received: by 10.237.33.111 with SMTP id 102mr1081228qtc.56.1472012313716;
	Tue, 23 Aug 2016 21:18:33 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:33 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:53 -0700
Message-Id: <1472012279-20581-2-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.194
Subject: [Qemu-devel] [PATCH 1/7] cutils: Remove SPLAT macro
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
X-TUID: mYiA6OSMY7iN

This is unused and complicates the vector interface.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 util/cutils.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index 7505fda..1c8635c 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -172,7 +172,6 @@ int qemu_fdatasync(int fd)
 #undef pixel
 #undef bool
 #define VECTYPE        __vector unsigned char
-#define SPLAT(p)       vec_splat(vec_ld(0, p), 0)
 #define ALL_EQ(v1, v2) vec_all_eq(v1, v2)
 #define VEC_OR(v1, v2) ((v1) | (v2))
 /* altivec.h may redefine the bool macro as vector type.
@@ -181,7 +180,6 @@ int qemu_fdatasync(int fd)
 #elif defined __SSE2__
 #include <emmintrin.h>
 #define VECTYPE        __m128i
-#define SPLAT(p)       _mm_set1_epi8(*(p))
 #define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) == 0xFFFF)
 #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
 #elif defined(__aarch64__)
@@ -193,7 +191,6 @@ int qemu_fdatasync(int fd)
 #define VEC_OR(v1, v2) ((v1) | (v2))
 #else
 #define VECTYPE        unsigned long
-#define SPLAT(p)       (*(p) * (~0UL / 255))
 #define ALL_EQ(v1, v2) ((v1) == (v2))
 #define VEC_OR(v1, v2) ((v1) | (v2))
 #endif
@@ -270,7 +267,6 @@ static size_t buffer_find_nonzero_offset_inner(const void *buf, size_t len)
 #include <immintrin.h>
 
 #define AVX2_VECTYPE        __m256i
-#define AVX2_SPLAT(p)       _mm256_set1_epi8(*(p))
 #define AVX2_ALL_EQ(v1, v2) \
     (_mm256_movemask_epi8(_mm256_cmpeq_epi8(v1, v2)) == 0xFFFFFFFF)
 #define AVX2_VEC_OR(v1, v2) (_mm256_or_si256(v1, v2))
-- 
2.7.4

