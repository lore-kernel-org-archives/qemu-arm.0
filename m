Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp636761ocb;
        Thu, 6 Oct 2022 10:16:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xuBm7yC8tookDf1+kZKuEnGuoFY19RVDkXA0qa/HhW5lVug5QdjiHO/nXh/gnBNQjrqZu
X-Received: by 2002:a05:622a:120d:b0:391:767f:22d0 with SMTP id y13-20020a05622a120d00b00391767f22d0mr1051400qtx.244.1665076586290;
        Thu, 06 Oct 2022 10:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665076586; cv=none;
        d=google.com; s=arc-20160816;
        b=SBKwGOBD0WnmLkoloO/bS87l+od+PqPFBCjcjAzgU7CwvYWjcpCI7WHuvg35Epr8GS
         xbxhDzRmo4jAy/yhK2YpOi9Lg63XGq27coiZV01gqxaLngTNAAtqTV+yqeUOpAU7Gr/Q
         a86KRw4A8DsPW1/yqO6HQoD8EijBa2ANaKaDbfCl/OErIT2iRr5zEdUNQaBJXpfghzD2
         /fiQVgiWNOTfzV8kSY95htmTjL9f8FofVmpTPmBpI+5LzBO8m0SuJjuN6bbiHE6LoH1Y
         aKyuGI80092YlroAGvFr/AV5FVxcsVvEsIcTwiyWNUFdBW5/HGnAtR5t/LJYn9XVbb7e
         e6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FsCG6Vbibx8F7grXqAa/TVuItjcWBuxcPHcrTOOH5pA=;
        b=BGo0BKmXFObWHv85rCHduHqqO/g4GCHuAp9u75YQj6H+fOTBkuJMyg68cB7ifetYIb
         172Pa2dxjgNTXMUbjk+pPfL4Hx0/8kO8bi6tBUpXa7AyIgxNdQmN8HPv590/JJGcS+x2
         +pUhiQvcIg2aq4e9mFML2FyA3oCmyI8hkEDhVWkHG7S6XGp90pA9s0LqU/RosF/tfd0C
         u4+Acz2DjD3if1Qe6Y1gjg2x9p4m3nHHAU3cNuQlRZF/j/qGk8RV6SYYkbkQgJ/hYGhP
         6G2rMVFHROuJv3jdhQT/Q2bRw6iAdLrjGGVQ7KeVEC5JmCGXt5+hr3xXcfwEWuUFe0B/
         1RRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TzTeBt4p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw15-20020a0562140f0f00b004b189f371easi3855851qvb.466.2022.10.06.10.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 10:16:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TzTeBt4p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogUTx-0005UD-KW
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 13:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuH-0003kP-Rb
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuF-0000Ts-Nl
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsCG6Vbibx8F7grXqAa/TVuItjcWBuxcPHcrTOOH5pA=;
 b=TzTeBt4pBEsMeyIbRVpFTItkTbvBawMtxlAImenBI6yiPfA/5qe5/byBJ1WvxIWUXIp00/
 2km4SGhnl5XPGF91+at5hje6QYd1nBOFeT3u+L9zGMr/XpzD7tjltjF70mkNddp2/68w9G
 DvJKt0o2k/yLayP8VnV2glQTbA5SqSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-wPXw8IouNR-5rudImpeRFw-1; Thu, 06 Oct 2022 11:35:21 -0400
X-MC-Unique: wPXw8IouNR-5rudImpeRFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD00A85A59D;
 Thu,  6 Oct 2022 15:35:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7DA40EFB2B;
 Thu,  6 Oct 2022 15:35:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 09/10] dump: simplify a bit kdump get_next_page()
Date: Thu,  6 Oct 2022 19:34:28 +0400
Message-Id: <20221006153430.2775580-10-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KzaEZh9uc0pi

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This should be functionally equivalent, but slightly easier to read,
with simplified paths and checks at the end of the function.

The following patch is a major rewrite to get rid of the assert().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 dump/dump.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a905316fe5..b55a497c42 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1132,17 +1132,11 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
     if (!block) {
         block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         *blockptr = block;
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
-        if (bufptr) {
-            *bufptr = block->host_addr;
-        }
-        return true;
+        addr = block->target_start;
+    } else {
+        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
     }
-
-    *pfnptr = *pfnptr + 1;
-    addr = dump_pfn_to_paddr(s, *pfnptr);
+    assert(block != NULL);
 
     if ((addr >= block->target_start) &&
         (addr + s->dump_info.page_size <= block->target_end)) {
@@ -1154,12 +1148,13 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
         if (!block) {
             return false;
         }
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
+        addr = block->target_start;
         buf = block->host_addr;
     }
 
+    assert((block->target_start & ~target_page_mask) == 0);
+    assert((block->target_end & ~target_page_mask) == 0);
+    *pfnptr = dump_paddr_to_pfn(s, addr);
     if (bufptr) {
         *bufptr = buf;
     }
-- 
2.37.3

