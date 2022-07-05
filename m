Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4084510lft;
        Tue, 5 Jul 2022 09:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uGo+Yl50GTf0KtABUURjqwXT092mkCimVUnigrJC3H4i2U3qnL9Vx/irt/ypBGW2kIZofl
X-Received: by 2002:a05:6214:194c:b0:472:6ff9:4f6d with SMTP id q12-20020a056214194c00b004726ff94f6dmr33934690qvk.105.1657039119019;
        Tue, 05 Jul 2022 09:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657039119; cv=none;
        d=google.com; s=arc-20160816;
        b=XrIk4R/rg2b9GeFnGJb5tc0ACVunSpe1ZzD+nTPTd6T5qUNAwP+kbhslh89/nW82m9
         gc9e3IZIQa5QuqsZ3ESQAMNh0OdrdDGMl/t5Jo5PZikdMHo8IUGn+HKWg5N7WW+dt+cA
         njv7BagB16qzO+jlSScMm9e9Fnrf540k8DlmcySpc8cMa0WKhq27NxQFQ4yVqPVI5H+I
         hKHb8KtqYxxKHx2BfoN2ZaUqFHPu6xKRlMzlF9Y2IhecuuDkoy2zG6lc6EzwF35CgzE4
         IaEcwPPmFCUIUUidH7gCnEUAn8Owv7aVNUlxhVMq9Mv40SgvD9en4aoJ7ycCiXBMGFTe
         k/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k6frTgrdzk9n4SJYadeqbPUcUusGpMFsVosyyUO2YQA=;
        b=Jesdw8LrcC8Yv9oDimhNYe+tJqiJcMybu8ZJmVv51YBBC8Raji6eJ5w1mktoG5c3Ja
         lueoV4D5qp8VTTBf35sNxzjkxsCYhhXDwY9FWOc4sODKSC7gEpUhAde7EGlbo20Qr1dp
         1xVlO26vb/UsEXSc+MPQ1xaUUr/Jkp5vl3zLL67a/ZJteFYiiY+I0VUoscjTFWO7iPDA
         jzqSfiKMs8Op9lq+YqEVAsaTVSCnjC470YBgHQEUHbdw8VA6XGZ5cGXKeyStvvcbrA5c
         nt4iPUDqQ739W86EpD5lXyF0Ej4IXePOamQbknCga1KqvAkMlyC/oi0dIjqioHbJ1R0G
         r8Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZUqztZa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05620a0f1100b006ab986a6b2bsi24303918qkl.701.2022.07.05.09.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 09:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZUqztZa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8lZO-000531-5B
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 12:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lFL-0006Ap-Bs
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lFJ-0006F8-P8
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6frTgrdzk9n4SJYadeqbPUcUusGpMFsVosyyUO2YQA=;
 b=FZUqztZanozyq0zV3rZoBvL3dTeGhwUOK1l7GVfGYWq8MEwCaVfANqoaWb3ZIstFIzkylu
 odZpN8MsvbJiDS3C2MSr0RVdWm7im4BbzAvD2o4plorbzrX75ZeXAh15U7UA6U2dA7aokP
 Y1XxOZ/jDgc2SY4iShhbJ2gLwc0viPc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-r84Ew47JM32GuF_7w5bUKg-1; Tue, 05 Jul 2022 12:17:35 -0400
X-MC-Unique: r84Ew47JM32GuF_7w5bUKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1693E805AF5;
 Tue,  5 Jul 2022 16:17:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94FC7140EBE4;
 Tue,  5 Jul 2022 16:17:24 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 qemu-arm@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 18/18] block: Remove remaining unused symbols in
 coroutines.h
Date: Tue,  5 Jul 2022 17:15:26 +0100
Message-Id: <20220705161527.1054072-19-afaria@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Fm8nmvDn/J4J

Some can be made static, others are unused generated_co_wrappers.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c |  6 +++---
 block/coroutines.h    | 19 -------------------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 920ba0dd1f..bf63f187ef 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1358,7 +1358,7 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags)
@@ -1691,7 +1691,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
@@ -1739,7 +1739,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn blk_co_do_flush(BlockBackend *blk)
+static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
     IO_CODE();
diff --git a/block/coroutines.h b/block/coroutines.h
index d66551a277..3a2bad564f 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -63,17 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
 
-int coroutine_fn
-blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                       QEMUIOVector *qiov, size_t qiov_offset,
-                       BdrvRequestFlags flags);
-
-int coroutine_fn
-blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-
-int coroutine_fn blk_co_do_flush(BlockBackend *blk);
-
-
 /*
  * "I/O or GS" API functions. These functions can run without
  * the BQL, but only in one specific iothread/main loop.
@@ -82,14 +71,6 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
  * the "I/O or GS" API.
  */
 
-int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
-            QEMUIOVector *qiov, BdrvRequestFlags flags);
-
-int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
-             QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
-- 
2.36.1

