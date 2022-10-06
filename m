Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp619486ocb;
        Thu, 6 Oct 2022 09:53:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fA8+/Tx1eZWGDLxFlM0yae1sETbYrzf9MAugeQ40W2AnUFjlkQFTOE1JDh1hRRbEv6qUO
X-Received: by 2002:ac8:5dc6:0:b0:35c:dac8:a146 with SMTP id e6-20020ac85dc6000000b0035cdac8a146mr868938qtx.615.1665075212899;
        Thu, 06 Oct 2022 09:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665075212; cv=none;
        d=google.com; s=arc-20160816;
        b=k6fVMAx0ueg+MbJdZ7YFj/AAKHh2AehS61FwV90t1X5493seQgRMPUQSC0Qtn3yECl
         Se839kw9QQbw7/nd2BsA/vXpRbYaUxTKVdlOMPm7BogneC4EUYJnZWoStEllOQMDfBNV
         bvA5PLTHaSXfa/dVHIWT3zCX1YlHrUO43Y/fg7SrOce87syvfm7JJaGPzHmNZMryYc2r
         U4IjUiF+sfF0bMcJ9GB6jRXS/s4MsDn0M2oxELJoZFNQTih6u9rdbKA5O5nH7Bf+0QuR
         g1yCF1ufR1tyz4LypkB0eUaDqAxo6YQV5KiCbpd0ktN5yAHIqd8Z0a8/C6wY/6xcgDXX
         0/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FvTigsGHy4bOPpaKG5ayhy8aiJm7kwertg4WzQRnVDU=;
        b=d7p1exkK3Q2Q9qmD2G3xTAu2XbpowauF83OBUiFNUOK33iD3tXEDKI0TFTIA1wlWbL
         ZU25EbKePEZJr/y6rHdaDDzebkK4WsbCAHT1Tws23n+efAVBV7t4pSSCQyjUTG0zgOvO
         kdxi1BOJEiTpqmQWfPr48HahX6TaTmwZKgIZYoN8DRIqLY6lLn4BUHAbYvbUAhu3Ng+s
         /ZugMQrf2FbbwF5zk8aO9LzpQBWRBr5tY3IOhW8PCOh0lCmDV4y2eMF7TCGzwbJo1pQC
         QdW6MUtuvu6kBv4YWMuXZV6pb0ASxH4p+KPupBLlmG1BrjzJgd3yWT20r4dRcLcmQUr4
         4Q4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6cCMhoV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a05620a254f00b006cf8490faadsi8053176qko.430.2022.10.06.09.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 09:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6cCMhoV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogU7o-0004DB-EJ
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 12:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStw-0003aE-R1
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSts-0000OB-Lt
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvTigsGHy4bOPpaKG5ayhy8aiJm7kwertg4WzQRnVDU=;
 b=A6cCMhoVVslMMfrBMO7bjjjFErmTMx002ZLff5rHHg16+O2Z7oSeFA3f/3A+Pca7+BKOne
 gormofZ6BcLqHOqyHyZSicLwCk3iTOViyjBdyEj7zBAZNjVnmqS97LEvm+dtETsklwg2tK
 ozZkpII8o6ZjL2MbdRJWuLK8Q6CkNnk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-4k0NM966PZuQ9TagpyIlLQ-1; Thu, 06 Oct 2022 11:35:01 -0400
X-MC-Unique: 4k0NM966PZuQ9TagpyIlLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3163185A7AB;
 Thu,  6 Oct 2022 15:35:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8DB2166B2E;
 Thu,  6 Oct 2022 15:34:59 +0000 (UTC)
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
Subject: [PULL 06/10] dump: Rework dump_calculate_size function
Date: Thu,  6 Oct 2022 19:34:25 +0400
Message-Id: <20221006153430.2775580-7-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NJnA9rPg+Sjq

From: Janosch Frank <frankja@linux.ibm.com>

dump_calculate_size() sums up all the sizes of the guest memory
blocks. Since we already have a function that calculates the size of a
single memory block (dump_get_memblock_size()) we can simply iterate
over the blocks and use the function instead of calculating the size
ourselves.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Message-Id: <20220811121111.9878-7-frankja@linux.ibm.com>
---
 dump/dump.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index b043337bc7..d82cc46d7d 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1548,25 +1548,19 @@ bool qemu_system_dump_in_progress(void)
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
 }
 
-/* calculate total size of memory to be dumped (taking filter into
- * acoount.) */
+/*
+ * calculate total size of memory to be dumped (taking filter into
+ * account.)
+ */
 static int64_t dump_calculate_size(DumpState *s)
 {
     GuestPhysBlock *block;
-    int64_t size = 0, total = 0, left = 0, right = 0;
+    int64_t total = 0;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (dump_has_filter(s)) {
-            /* calculate the overlapped region. */
-            left = MAX(s->filter_area_begin, block->target_start);
-            right = MIN(s->filter_area_begin + s->filter_area_length, block->target_end);
-            size = right - left;
-            size = size > 0 ? size : 0;
-        } else {
-            /* count the whole region in */
-            size = (block->target_end - block->target_start);
-        }
-        total += size;
+        total += dump_filtered_memblock_size(block,
+                                             s->filter_area_begin,
+                                             s->filter_area_length);
     }
 
     return total;
-- 
2.37.3

