Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4077139lft;
        Tue, 5 Jul 2022 09:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tN+vvpTpUFY/+ifz76yhnjT3jJd2fPd5jAhE/vscecuRzmSVGocPu3zMj964KKcYE8dAWt
X-Received: by 2002:a05:6214:e42:b0:470:5138:a496 with SMTP id o2-20020a0562140e4200b004705138a496mr32826218qvc.100.1657038493269;
        Tue, 05 Jul 2022 09:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657038493; cv=none;
        d=google.com; s=arc-20160816;
        b=NUMTGv+EqAEIU54jViqTMgI3KkRnaR0AHEEhLwq2HZJVexq4tkDNRRp8QTqEma5CPS
         T1AJ5Us/XPg0QHEOwECGS9/3bGedY4TMhDiZTJ5SMHmaNJVdXJscIlf4d0I/I5DfW9pL
         ud77RPLXa4cnzEbMmWuNBwwTmziE3Ntz8+fkwGt4ppNJBkMSRsk/fdmObm6URF2GJvmA
         aj+Jz/MnwizDsrjbyEBrlZGnFUQ7/YT75jFsnZJ/w0h5eRMxL+Q1/SXHR0o3U4iWPZnz
         WR7XM4b5WT9SqYsbQG973NRUbVQ2YLBS5XWh1ChDvBPEJPu67pDADD6pX1UBiA6/fUTI
         mfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XPlxjSlgg4LjdkETGI4j9CGFdwg8O7yWt9R9YSzC6QQ=;
        b=N4bOZfUtxV6z1SB4W+T2XGLvGmOCdAQFA9NeTIiv+yx3OxrbqpUQGfzCVW6cffc/kk
         cizF0ikUWfV2Ea608s5L5oP+PkHpRoXFV81lqIwlzykBY4Sz0DhygWRK5nlujENBRrJY
         vH4bK40XpflSDF6XjZMfOlZUxyjby30P6ZT2fW9hAiZiyaMOKHik1CjdsVgmHne1DoaN
         ZXyXLhFNP/yrp7EBxo6O2LXCLgsxE8MM+E/tsFBXoPYrRenlE6Tpz6n2C/plu/eKeau8
         VvUwgMfxfUp5H0UllvXoXeqbGlMYUJ1v9c9uQAsASZlAGDZFhqxjsVQg38k+kDKuMPjO
         +EcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bklXeFNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020a05621421c300b004730be465adsi797368qvh.87.2022.07.05.09.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 09:28:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bklXeFNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8lPI-0006tt-Nc
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 12:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEB-0004i4-Ug
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 12:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lE9-0005v0-Hq
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 12:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPlxjSlgg4LjdkETGI4j9CGFdwg8O7yWt9R9YSzC6QQ=;
 b=bklXeFNARlkcSwVFMeWcxwY3QMtPInFssnQS2VduRI8a5yT9jvQxSwN6SfDHJakCIlpP/I
 dB+IWpaNB30sk9xC1QQMr+9XvFPsDZd66F7YeabOxTqg2020OEZx1SMBAH+oo/kR39OR1V
 C96aB7BEDkP5aFrF/UXctG6kC1cxc9E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-flA4GdcUOimJA07mFFCWIQ-1; Tue, 05 Jul 2022 12:16:36 -0400
X-MC-Unique: flA4GdcUOimJA07mFFCWIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6867C29DD9B6;
 Tue,  5 Jul 2022 16:16:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E574D140EBE4;
 Tue,  5 Jul 2022 16:16:29 +0000 (UTC)
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
Subject: [PATCH v2 09/18] block: Export blk_pwritev_part() in
 block-backend-io.h
Date: Tue,  5 Jul 2022 17:15:17 +0100
Message-Id: <20220705161527.1054072-10-afaria@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: A2yDbYB7v/CL

Also convert it into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 14 --------------
 block/coroutines.h                |  5 -----
 include/sysemu/block-backend-io.h |  4 ++++
 tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
 4 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 3920e1f45e..35bf35aadd 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1407,20 +1407,6 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }
 
-static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
-                                         int64_t bytes,
-                                         QEMUIOVector *qiov, size_t qiov_offset,
-                                         BdrvRequestFlags flags)
-{
-    int ret;
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 typedef struct BlkRwCo {
     BlockBackend *blk;
     int64_t offset;
diff --git a/block/coroutines.h b/block/coroutines.h
index 85423f8db6..94fd283f62 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -107,11 +107,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                    QEMUIOVector *qiov, size_t qiov_offset,
-                    BdrvRequestFlags flags);
-
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 29954a466c..31ebd8b6cf 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -121,6 +121,10 @@ int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, QEMUIOVector *qiov,
+                                          size_t qiov_offset,
+                                          BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 2fa1248445..274e9e3653 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -183,6 +183,21 @@ static void test_sync_op_blk_preadv_part(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_pwritev_part(blk, 0, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwritev_part(blk, -2, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -358,6 +373,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/preadv_part",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_preadv_part,
+    }, {
+        .name   = "/sync-op/pwritev_part",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwritev_part,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.36.1

