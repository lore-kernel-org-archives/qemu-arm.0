Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4077881lft;
        Tue, 5 Jul 2022 09:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+JPKUNx6wvtR5srP3vxKrZpEvb7dHKa1sxdTPfjh626IxcpDvV4KW5qpSG7jo7+ontyNe
X-Received: by 2002:ac8:7f0a:0:b0:31c:c5da:eb57 with SMTP id f10-20020ac87f0a000000b0031cc5daeb57mr29326080qtk.437.1657038554418;
        Tue, 05 Jul 2022 09:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657038554; cv=none;
        d=google.com; s=arc-20160816;
        b=Qbw7K+7iS/rSqdiih/BF8aPnXpPrvhUmJU2BH1FIPZev9W4VxxB8kxnovMFAMAB3d/
         lTt5DCNFLVCtymJMQYzWbhK0WD4AX3kc0NJkJQfiYpAeKLwp9c2U2Q34nFr/0xF+n3Kd
         qndgFOrXoYzvZMYyOfmvDrZZUMCOiXrmQPECL2QIKLdKj1OoDQJ1N+I0IfETye681LR2
         D3zxTOMBF8K0m1ozFnwXzFxQzJBEESSdvPutTKfHShwKHLdOhP/SDJT8qbHRCNBYYmNX
         Wx17qXGZm8OY+PMctmTMexapW+k2VjP1YnEjbtmRaxhjDXPygVWKRWgf7DkgzPJdOQuJ
         ArjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MMBX2D3AxzNFZPdHEsTMziSicAD/tBubwQAQs9ceL5Y=;
        b=iRN0vpWxGim3qqcaQ1kVr6CLx/8WRq6an/JvSW0wUrfs9B6cRdkCKQysy5qFiwfD23
         ws/ZkCE6K7Cs37WfagH8Qj83HHpz+E2/K4dY75i8mtz8OUI5qLhN1UHBaqk4boIRYkzw
         1Z1X4+EkLmgQndwkYX8WAgxX92LGZoUt6+XDAqES2UsOB0lvSdKnsqkzOHpCLyYV6Gew
         yKYBUsag61PC2ZovB9P6TtNM/Cl7QRmf4o7a5qeujcFnNrwap69NY3zqbf9vFSnBGpcy
         I/XBw8d99Sqnz9oN2UDiBuhcorbJa24V+Tkon77lgeU0Tn8dHrZxqtB8s71VO/yiKdYA
         8YQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJW1SgRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020ac85acf000000b0030515db5fa4si20525952qtd.136.2022.07.05.09.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 09:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJW1SgRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8lQH-00008v-TG
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 12:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEL-0004m6-I2
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 12:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEJ-0005xH-RC
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 12:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMBX2D3AxzNFZPdHEsTMziSicAD/tBubwQAQs9ceL5Y=;
 b=AJW1SgRQAMY5UoqJjNOJkr+Ry+RH7gB7elX3zYsgdfXqWYceOo9rb79oI/GcUawjTQySTf
 4UQKycqGuZ4+fhjKuXqAS0o/cIWQ+cc56dv+cdlFmmGK5p4iJ1fdvKZKQRMbH+8gJa8kKk
 6AikOyfQ/3Av676+ChVuwss8E3fIn1U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-YIX-Sc01NgCjvRywCLwsaA-1; Tue, 05 Jul 2022 12:16:48 -0400
X-MC-Unique: YIX-Sc01NgCjvRywCLwsaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22B84805AF5;
 Tue,  5 Jul 2022 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2147140EBE4;
 Tue,  5 Jul 2022 16:16:41 +0000 (UTC)
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
Subject: [PATCH v2 11/18] block: Add blk_co_pwrite_compressed()
Date: Tue,  5 Jul 2022 17:15:19 +0100
Message-Id: <20220705161527.1054072-12-afaria@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kMV5PfZVt42g

Also convert blk_pwrite_compressed() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             |  8 ++++----
 include/sysemu/block-backend-io.h |  7 +++++--
 tests/unit/test-block-iothread.c  | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ddb1d4e179..cc85558813 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2324,13 +2324,13 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf)
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0,
-                            BDRV_REQ_WRITE_COMPRESSED);
+    return blk_co_pwritev_part(blk, offset, bytes, &qiov, 0,
+                               BDRV_REQ_WRITE_COMPRESSED);
 }
 
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index c64207cdcb..d129e2bed3 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -168,8 +168,11 @@ int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf);
+int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes,
+                                               const void *buf);
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 274e9e3653..3a46886784 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -198,6 +198,20 @@ static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwrite_compressed(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    int ret;
+
+    /* Late error: Not supported */
+    ret = blk_pwrite_compressed(blk, 0, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -ENOTSUP);
+
+    /* Early error: Negative offset */
+    ret = blk_pwrite_compressed(blk, -2, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -377,6 +391,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwritev_part",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwritev_part,
+    }, {
+        .name   = "/sync-op/pwrite_compressed",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwrite_compressed,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.36.1

