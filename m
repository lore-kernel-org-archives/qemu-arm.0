Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4075913lft;
        Tue, 5 Jul 2022 09:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFJVE63J3cniRlI/5daqWfDtz7EiJ7mfY3cmK/fYtkLWGwxDBtDtLt5FrLWMPVPhv2YGvg
X-Received: by 2002:a25:9191:0:b0:66e:7852:1571 with SMTP id w17-20020a259191000000b0066e78521571mr3515468ybl.176.1657038361083;
        Tue, 05 Jul 2022 09:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657038361; cv=none;
        d=google.com; s=arc-20160816;
        b=k7zzR1Jqcg4bP0LydA4arVbn/swX8H6A+WXS4i7qiiZ/WvL9/U+trInqhCbdwy7x6Y
         eVsysOLplW0IQ5igZguw25aImOxSEOjGdWrzGKvR7s+FAQg0T4R0Uu6Yc+XdsEA/5a58
         q/NTEsG+mv+avHHU1//E3DIsFPMjeUWWniyN15nO/k2gBoo/GCzrYacsbNVzcKEjZRgw
         Np9EMNATvaHydgb0QoYTGPITDlqVYld6Go29nKGNR5bnMegP/I+FHd8+dTer7dkqpiDD
         ymAmvtBUsb7UC9/rdJ9O7bIqmx6AYtB+Do8scw23MhbQGLvchXgIk8IKt96EmoZHyMPR
         4MjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VvTeS9qfyADGoBU9bM9GJBaeSu4vGZX6iRwEsCNqzq4=;
        b=Nh6mb8fq9L3C7sWDkEbSloPUm5zoUk32w6SVHa7V9U145U2JauLosLbA4DYnTFLzaC
         Ifrr5VGgHyws99zWoNjQXmwUiQ4bek7lDqHUsMVB6l+kPGu5P7NDMgAxMpRq/S9mvb26
         k8tjlZqwBQEqn3X/9QkYdeBUlI6XUcu8P6hbIPwc0FuFs7Qf1LhaaEu+Uq+mfqOd9XvT
         JXEwMKLkIbskQ6lxtsSpSUE6++Z0MDj+PEkfArKK3zUhpfuIRuwXOPQr/AM2GPaJ+NTC
         HZuIjhhDiYXxdEKnGLZS83i4c1T9D7D5YYmNAmhgxtQLuy5ITicLatsbXz58CwKN00Oy
         atyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dCyILIGP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e205-20020a25e7d6000000b0066e2be88f9asi13637466ybh.535.2022.07.05.09.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 09:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dCyILIGP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8lNA-0001ZJ-Cm
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 12:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDt-00048I-Vn
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDs-0005se-B7
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvTeS9qfyADGoBU9bM9GJBaeSu4vGZX6iRwEsCNqzq4=;
 b=dCyILIGPx+F+mbme7QkhhRfN1DIYnqm92gXCqcJddlXNHCtGnc581aU7sAajZXdc6j56nr
 6YvV5Y2pBIMpJfXQU3XdXhsVTm88qxgx2CNZcSfzGcU9Q3EQ3k0KyDF7VWaQltCsBJHYd8
 WQBJAIgJDckxlAXO82qpxOJ8rzh9DpU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-Melyja-bMz2cP7FTapaegQ-1; Tue, 05 Jul 2022 12:16:19 -0400
X-MC-Unique: Melyja-bMz2cP7FTapaegQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8312185A7BA;
 Tue,  5 Jul 2022 16:16:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 854CA140EBE4;
 Tue,  5 Jul 2022 16:16:12 +0000 (UTC)
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
 qemu-arm@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH v2 06/18] block: Implement blk_{pread,
 pwrite}() using generated_co_wrapper
Date: Tue,  5 Jul 2022 17:15:14 +0100
Message-Id: <20220705161527.1054072-7-afaria@redhat.com>
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
X-TUID: 80k9iydCnibm

We need to add include/sysemu/block-backend-io.h to the inputs of the
block-gen.c target defined in block/meson.build.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 23 -----------------------
 block/coroutines.h                |  4 ----
 block/meson.build                 |  1 +
 include/sysemu/block-backend-io.h | 10 ++++++----
 4 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 5b9706c443..c2a4c44a99 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1567,29 +1567,6 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags)
-{
-    int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, bytes, &qiov, flags);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
-}
-
 int64_t blk_getlength(BlockBackend *blk)
 {
     IO_CODE();
diff --git a/block/coroutines.h b/block/coroutines.h
index 3f41238b33..443ef2f2e6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -112,10 +112,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-              QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/block/meson.build b/block/meson.build
index 0b2a60c99b..60bc305597 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -136,6 +136,7 @@ block_gen_c = custom_target('block-gen.c',
                             input: files(
                                       '../include/block/block-io.h',
                                       '../include/block/block-global-state.h',
+                                      '../include/sysemu/block-backend-io.h',
                                       'coroutines.h'
                                       ),
                             command: [wrapper_py, '@OUTPUT@', '@INPUT@'])
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6440e92028..0804ce1c1d 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -102,10 +102,12 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
+                                   int64_t bytes, void *buf,
+                                   BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, const void *buf,
+                                    BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
-- 
2.36.1

