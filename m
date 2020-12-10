Received: by 2002:a0c:db0e:0:0:0:0:0 with SMTP id d14csp1074898qvk;
        Thu, 10 Dec 2020 05:50:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzltUjODWOfL/ZLIzQop5tec0xAj/qc304uCudUtwEhadzABbaVoMWySJqZZ14J7gr/Rk6u
X-Received: by 2002:a92:5b9d:: with SMTP id c29mr9507586ilg.91.1607608254386;
        Thu, 10 Dec 2020 05:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607608254; cv=none;
        d=google.com; s=arc-20160816;
        b=cXdDmQa53ZfM1+jcn9/NKsvWJLJgkp2uraP58iEJxwJxAh9YzakRDBeaRurDfBy1ij
         r/P2ziWtIrlXulVsijzcmcQ5efcjnD+8/hsD+6KQMMB7aTQ1beflEU3uLr0nq/7+Sdvu
         1B/hSJZb92iFCRoVFDsYBldWu4P9Jc9cdBv6W6Ty2y17H5AgNgq+EkbLsQ7MFZD/zQnr
         ct318inVnWvb46xhEPzr+Ubd0tYUj18/xqs96J7KUhuxOuG236OeTIc7zh3AqOQPbok1
         gKMOPYa9PsL7iArUjYi+o5lNq99eotVl4xgJU0+OhFpyZIiHby0TDpHaw4KQxIXECW26
         YnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=UPLHk9PCXdFlionEQtiO0kTXHb3i/E1vdNJvbkD9DzE=;
        b=a85sPmQsXPJgOQAYawZ+jRi5qSJP5MmxoGoIVxHqCVWASXI8tDA4/BCy5SY6hNX4nm
         D+mX9mPtdOPvQtBs+D3hOy6v1KqMCtyiAlQQeu679v9EfqZkenyHLXF55UwV4UXoYmbM
         1KpEDII5l2MfB0GZN4Fk/fe6vWV27qleSOPUYTk1Bvxdpz2lecpQLlmVvHH6cjJh1v+N
         xhxiuH4Exj0PKGuSN2x64VMLoXRwtRouFnqkuelSfhvDDcTAAcZUAMuffzphnc75jf07
         KrU8rXYE7OrE6brIVT/25qyPcYgq1pFomeknjq+ckNfSbJFiWZut/u1mBBwxxPH+b0XY
         spYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NlJWsN9Z;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id x25si4303365iog.28.2020.12.10.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NlJWsN9Z;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49262.87103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMK7-0006rG-J8; Thu, 10 Dec 2020 13:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49262.87103; Thu, 10 Dec 2020 13:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMK7-0006r8-Fx; Thu, 10 Dec 2020 13:49:35 +0000
Received: by outflank-mailman (input) for mailman id 49262;
 Thu, 10 Dec 2020 13:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMK6-0006qi-1z
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:49:34 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0b1dd360-49ae-47d2-93a4-9ab387acf17a;
 Thu, 10 Dec 2020 13:49:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-nqVUJhY8NMCkTQFWY4kjLQ-1; Thu, 10 Dec 2020 08:49:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC6A6800D53;
 Thu, 10 Dec 2020 13:49:23 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5511D19713;
 Thu, 10 Dec 2020 13:49:10 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0b1dd360-49ae-47d2-93a4-9ab387acf17a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPLHk9PCXdFlionEQtiO0kTXHb3i/E1vdNJvbkD9DzE=;
	b=NlJWsN9ZQl1y5xFXt1IMrt+nS8p59zoCaIRnx6+hdsg5kUGkBf4wjC3vLZAdsodqS83wbl
	SlcNiaL/LGpOZC7gbMsfRsj6uh3u18ZNK5WrIF9CzeEd9tLuDypnM3Co7yj/ufSDM0YxF+
	7H5WJmRhYfieh2AfEPkEj1mOPaQEpxc=
X-MC-Unique: nqVUJhY8NMCkTQFWY4kjLQ-1
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 05/13] tests: remove GCC < 4 fallbacks
Date: Thu, 10 Dec 2020 17:47:44 +0400
Message-Id: <20201210134752.780923-6-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CXbGiSd4EYHv

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

(clang >= 3.4 advertizes itself as GCC >= 4.2 compatible)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/fcvt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 617626bc63..7ac47b564e 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -73,11 +73,9 @@ static void print_int64(int i, int64_t num)
 
 #ifndef SNANF
 /* Signaling NaN macros, if supported.  */
-# if __GNUC_PREREQ(3, 3)
-#  define SNANF (__builtin_nansf (""))
-#  define SNAN (__builtin_nans (""))
-#  define SNANL (__builtin_nansl (""))
-# endif
+# define SNANF (__builtin_nansf (""))
+# define SNAN (__builtin_nans (""))
+# define SNANL (__builtin_nansl (""))
 #endif
 
 float single_numbers[] = { -SNANF,
-- 
2.29.0

