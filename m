Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4077794lft;
        Tue, 5 Jul 2022 09:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tiU0c1aTcgL6Ro+Aw9XnOyp4n9uz8h2Lv5pPFAe6gAXNPjinIQb0/jNvGnwfmA6G4vo3YV
X-Received: by 2002:a37:a656:0:b0:6b4:8116:de71 with SMTP id p83-20020a37a656000000b006b48116de71mr3683608qke.691.1657038548364;
        Tue, 05 Jul 2022 09:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657038548; cv=none;
        d=google.com; s=arc-20160816;
        b=Pay1xZDdpVuK30hYCXPd0ytlxk6XCN2Tmj9AXNLbaRRWjmm7o4iiDjIHV9MCyI0iz3
         hBNdEFwX5NwTkiqx4ZxCUiC10K8z7FD/K/KTw0+NieYKys8VlPhXNi0TBnrezoaNeZ/d
         5MVZw+oAjq8n4qSy6MH37vAEvpx0Hb29EqYDiicGymZ2e2KTHeKCOwNcmVrlMCRNs6gq
         GT8r/l3ZP8S7B7R9I6sDpmK+wRrgTbxBeTINoVmWeEPJhTW3ibOKxWAD/09SbtXHxWky
         /5MuGDi6Pl4493iHinLVsqln/sfv382z9rAD/fCx/a3UnLQLO1jVwb8A62oKpHcUSAdD
         Hclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yrczt18CIsKinv0djEnp9mUn3Lte5uVnCr+kSFyKa5M=;
        b=PIpqKrkQpxSuRW095Daj09SLBkhfKNktPxk8E7H/jF21l+rW3aSPHCuuQbkPyorXml
         gE6cyC5BYE/vf7/xEzVOgioBYUBzQeJVjZoSO2sx6emvU4p0D5pwbh8oaBM9xbaC0iqC
         GAvytqArfa11hhMMVa9dqeKBXm07M+LAOz5Y2/+BT6G/r2/ygsjXZrilD3Y1lqyBZeRT
         sxP4v2W271eQWFFpJZRB3j7LzeqaWS7nV4kSBobaLH3uVfi+qxvOMMsQ6LskOFwkCwkH
         Omb5koEsKXJE404sx8g2XxTITiuccOjxfT7Wb7n7iU7xMcsZNx/d0FAO0SIjnO0XCstV
         dhLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gdtkQ7JA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020ac85a4f000000b003051e3db850si19250773qta.509.2022.07.05.09.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 09:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gdtkQ7JA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8lQB-0007Nc-RX
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 12:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEN-0004nN-QB
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEF-0005wg-MY
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yrczt18CIsKinv0djEnp9mUn3Lte5uVnCr+kSFyKa5M=;
 b=gdtkQ7JAqlQHUvbHFa8fvVAOWRVGm55pBPPXjwy+yoGnPtr3pzEmjrrVKJhtp4/Blm5/wG
 GTdkWTJroKSzpJIta1D2fTABPT9m0E5KYIvHSb6TBj87jySxTeix6EjFeooSHjVwFQAAgN
 MUme3yyLlEGTjrvl7YMW3CpiuWNPBTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-O0KD5JypNgmuMg1Sir-xoA-1; Tue, 05 Jul 2022 12:16:42 -0400
X-MC-Unique: O0KD5JypNgmuMg1Sir-xoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49AA480390C;
 Tue,  5 Jul 2022 16:16:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C67131415116;
 Tue,  5 Jul 2022 16:16:35 +0000 (UTC)
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
Subject: [PATCH v2 10/18] block: Change blk_pwrite_compressed() param order
Date: Tue,  5 Jul 2022 17:15:18 +0100
Message-Id: <20220705161527.1054072-11-afaria@redhat.com>
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
X-TUID: 4X1S0EH1eSzy

Swap 'buf' and 'bytes' around for consistency with other I/O functions.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 4 ++--
 include/sysemu/block-backend-io.h | 4 ++--
 qemu-img.c                        | 2 +-
 qemu-io-cmds.c                    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 35bf35aadd..ddb1d4e179 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2324,8 +2324,8 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int64_t bytes)
+int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
+                          const void *buf)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 31ebd8b6cf..c64207cdcb 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -168,8 +168,8 @@ int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int64_t bytes);
+int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
+                          const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
diff --git a/qemu-img.c b/qemu-img.c
index df607a2a2e..7d4b33b3da 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2114,7 +2114,7 @@ static int convert_do_copy(ImgConvertState *s)
 
     if (s->compressed && !s->ret) {
         /* signal EOF to align */
-        ret = blk_pwrite_compressed(s->target, 0, NULL, 0);
+        ret = blk_pwrite_compressed(s->target, 0, 0, NULL);
         if (ret < 0) {
             return ret;
         }
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index c8cbaed0cd..952dc940f1 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -631,7 +631,7 @@ static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pwrite_compressed(blk, offset, buf, bytes);
+    ret = blk_pwrite_compressed(blk, offset, bytes, buf);
     if (ret < 0) {
         return ret;
     }
-- 
2.36.1

