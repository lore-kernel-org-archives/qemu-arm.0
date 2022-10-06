Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp612819ocb;
        Thu, 6 Oct 2022 09:41:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65EeCWT/d0HvPHPV+Wpucs+kr5nUDzrfJ38nnTI4GdoWzQR3Awmk+n6XskQr7gEF8sY8MI
X-Received: by 2002:ad4:5ecb:0:b0:4ac:807a:26e3 with SMTP id jm11-20020ad45ecb000000b004ac807a26e3mr828872qvb.80.1665074490180;
        Thu, 06 Oct 2022 09:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665074490; cv=none;
        d=google.com; s=arc-20160816;
        b=l+kWSaIF2NLiYKgzC/3q/5TH1q742yQwYSv7k6lLCRazyXbHuIsAwUyt2UKKYPv5Yq
         3aW7fj3t08aGp35v8BBwL5P7yfHrFrHH9ClqnHSqTv5kT7KNGhOLgr+uEaP+70Xgl3dV
         ytdAo0abDcLmjzPcBlG24dkWdP78V2sO03mP469fbiFXKLo4M76lConC4+0SSRweh9ZR
         g7vOsLj2pwSbsEsOjKcWQHsRRetn7n72c1llyf7HxOhwt0RrijjChGkMdRZpeMlxCjbf
         UGB7u+5m6V7mi2o1D55zg90oM7S7xZDG48peJ9Ii0hFHzboqTjy4N0sFlA+agGmvIbZZ
         5jTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QODbEEu/ErPvK0BeyIXd5lDo4uskdjchNK/jc3WZeCQ=;
        b=CshgOAl4m+WJBLrLJnEB73/jiJJywiRFKF3v8ku3Z7F0p7P9dLPOa9eHycd3qFCuPz
         BdxQaepEfKnSKg6yj4FRSgQ3Czugnm0mkTH4OuhWgGmgMNUW/rFR+UhX2BbsPuO5DJ+e
         kOTFmnwnamKvFoRd6Dm3zNqTLwVW3vy/AHmu6IIdasBWtZUU2tCNWugvYMtmSsBZtYjd
         taRk9DeVtxrF7+CJDdZFSD+LRpZPa++9yFFbA5ua0mA0HI3j675xGINhn9BT+1eQB3m5
         nW28MlpUidi7kBv/NwG9qNLq1AcOv6w4EGpbYRBf2HGNig2gfGTwN5qvcoN+GgdrcF7x
         y3Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RAWQWbuZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm26-20020a05620a1d5a00b006e19c3d2d47si2969920qkb.200.2022.10.06.09.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 09:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RAWQWbuZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogTw9-0001MT-Pj
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 12:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuG-0003jV-2Z
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuD-0000TQ-6h
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QODbEEu/ErPvK0BeyIXd5lDo4uskdjchNK/jc3WZeCQ=;
 b=RAWQWbuZIZOjr+z979gs9gJ0f1lcwU/Krt5QXygmJ6mgYt7Ic7IZ/aSi/crbpr1rBUt0dS
 q/WUXG318D1bYwkCbE6Tgy1ZLjNfAOJShRk/XOy8kJQVeTVNOOwns1czW5EhIUjzRKrNdL
 djQcNS+wsyc3xnA6Jd/k+pJluzXHO5s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-SrWhGXO_PtyefPEzFciL9w-1; Thu, 06 Oct 2022 11:35:17 -0400
X-MC-Unique: SrWhGXO_PtyefPEzFciL9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE77E29324A0;
 Thu,  6 Oct 2022 15:35:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9B534EA5D;
 Thu,  6 Oct 2022 15:35:07 +0000 (UTC)
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
Subject: [PULL 08/10] dump: Rename write_elf*_phdr_note to
 prepare_elf*_phdr_note
Date: Thu,  6 Oct 2022 19:34:27 +0400
Message-Id: <20221006153430.2775580-9-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 65lTGxQnH4Wn

From: Janosch Frank <frankja@linux.ibm.com>

The functions in question do not actually write to the file descriptor
they set up a buffer which is later written to the fd.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220811121111.9878-9-frankja@linux.ibm.com>
---
 dump/dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 8a2a97a85e..a905316fe5 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -260,7 +260,7 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
     }
 }
 
-static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
+static void prepare_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
 {
     memset(phdr, 0, sizeof(*phdr));
     phdr->p_type = cpu_to_dump32(s, PT_NOTE);
@@ -316,7 +316,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
-static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
+static void prepare_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
 {
     memset(phdr, 0, sizeof(*phdr));
     phdr->p_type = cpu_to_dump32(s, PT_NOTE);
@@ -364,11 +364,11 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
     int ret;
 
     if (dump_is_64bit(s)) {
-        write_elf64_phdr_note(s, &phdr64);
+        prepare_elf64_phdr_note(s, &phdr64);
         size = sizeof(phdr64);
         phdr = &phdr64;
     } else {
-        write_elf32_phdr_note(s, &phdr32);
+        prepare_elf32_phdr_note(s, &phdr32);
         size = sizeof(phdr32);
         phdr = &phdr32;
     }
-- 
2.37.3

