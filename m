Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4072866lft;
        Tue, 5 Jul 2022 09:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twj093KgEUdh2w8VWOdZ9aSm/Xuj12aMepCrD8rglBvadqJhtgErrXXOgB9WLTJgR7jV5g
X-Received: by 2002:a05:620a:4446:b0:6af:1d31:c257 with SMTP id w6-20020a05620a444600b006af1d31c257mr23878930qkp.399.1657038051701;
        Tue, 05 Jul 2022 09:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657038051; cv=none;
        d=google.com; s=arc-20160816;
        b=doCMzASUsbXBejGsLHdMB5hAVN7zbTQsAsHeaCO25vy5fku5/TPaCTLaWnbWclQ2zC
         x4XN4wQFn1a+vddpawRcD8hvOztfq9Br9+hqyQG7CypoNC5O9w9ToikfltIn1dw/RBHW
         1XACx7sDtxMB7Ex0BUTLv5eFDTMd9gVny3J/cfL6sFutvMwsaaCoUvx1ikGjkN/S7j/f
         kiPH6U6yC8aasr8quCHESEPgoeSI+dKnXupRqNeTlzkhVENPWGLb+dbWzNWjw7afPmSc
         xWZV4/naD25CO2qMqB8CJ6gWbJPcaIMgSs+B6h6risVSLTgQP/u7YBlc7Gz6SBqDfPdW
         4ZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x9BnXYkM/2BZIzBOwkUwBHSQXk3bgPQU+QELMrfNR5s=;
        b=V2ZnlFDtXNOvam2a/oc0jrGJhrBfX7CGVA6PLrP9nL6UEFb6Id16+GUiXmhEs4J07h
         1ZNRfzcC7DHgYzpllUF2GmgZn4EuO5hDY/cYjXh4BSbcnRbAIrZ7GpJcu+qPsMAWBIU+
         5CduxkvokgCCuAvZ3wKz79dew8kbkV42vZriVNKg6YDUKAPjAQHW/jcGDNS6ELM/nzw9
         /tOi5H1xzwUDUZkO8yCyM1kw1jTH/OyhKcIDMhZOQuW1tyBKe/l4e5Qh+b7HuhYY3BUE
         9Ng92jcsm+nuNOVOmeRgGY6JFtkqGBII9OyWr6EBiexYA15eXb58TaWsiQtldp1t75++
         wbLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MqsYRRHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a37ea0e000000b006b263cd9f07si6222525qkj.735.2022.07.05.09.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 09:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MqsYRRHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8lIA-0001ME-V6
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 12:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDh-0003kP-VZ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDg-0005pa-C2
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9BnXYkM/2BZIzBOwkUwBHSQXk3bgPQU+QELMrfNR5s=;
 b=MqsYRRHyOZHT7ga1hoq7ocvceE9xQMHWxdgG6VGEmCKDSEmfNgApdNYrzFvMi1rfmMqFUO
 +YJoPZy0lUSwTECiJ+B4Qnake9/y52tZVS15ogpkm3Luit53o/fK4aE74mcKlG6PhHayaa
 CxP0nPj1iG9/UcbiyaDSlhmKBvn8G4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-CgV3yE5YOVGMAuEFrhjT6Q-1; Tue, 05 Jul 2022 12:16:07 -0400
X-MC-Unique: CgV3yE5YOVGMAuEFrhjT6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE312811E84;
 Tue,  5 Jul 2022 16:16:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 758AD14152E0;
 Tue,  5 Jul 2022 16:16:00 +0000 (UTC)
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
Subject: [PATCH v2 04/18] block: Make 'bytes' param of blk_{pread,
 pwrite}() an int64_t
Date: Tue,  5 Jul 2022 17:15:12 +0100
Message-Id: <20220705161527.1054072-5-afaria@redhat.com>
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
X-TUID: 0lGyQF0MVkm+

For consistency with other I/O functions, and in preparation to
implement them using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 6 +++---
 include/sysemu/block-backend-io.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 16a0093c52..5b9706c443 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1567,7 +1567,7 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
+int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
               BdrvRequestFlags flags)
 {
     int ret;
@@ -1581,8 +1581,8 @@ int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
     return ret;
 }
 
-int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
-               BdrvRequestFlags flags)
+int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+               const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 357534e3de..6630316795 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -102,10 +102,10 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
+int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
               BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
-               BdrvRequestFlags flags);
+int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+               const void *buf, BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
-- 
2.36.1

