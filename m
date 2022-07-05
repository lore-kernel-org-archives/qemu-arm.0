Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4074285lft;
        Tue, 5 Jul 2022 09:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uZ/MMYgtxucvSJUjFTIGGhUP8+idIQJ2uxSqV/EReLhGmoa9X2hthQOQexyqiaqyXPieP1
X-Received: by 2002:a25:cc51:0:b0:66e:4e5b:9e93 with SMTP id l78-20020a25cc51000000b0066e4e5b9e93mr10888378ybf.266.1657038188384;
        Tue, 05 Jul 2022 09:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657038188; cv=none;
        d=google.com; s=arc-20160816;
        b=SOzPPiuNw/mzIx4qItIg+B7F31HSDc8V84rqQA/WE5LfNG0La78IiekOG4QruRyzD/
         cMLyo6xJSRURBnjTfUfOycT2pk5dt//YksIIDTk+y+gSbs6ilfMg8bee5jR5lULHFcMy
         k3qV/U4LwFtkxqszZgv721d9stA7Fn5cxubYzcaOTgtJCqfyDNCNSaPfH/xmr+tITTap
         T07zjm8E6sDYTAHogn6l9QUKs777oyFd3QKsKMfmbzygEb/FWQroC+JgijskJOrrGPw4
         l6+Qrg58e+0Sl97fJuZc9JXRJMw2vDMtyTMsjk2P5UMndt70cjTv/Hfh4BwjEFN51Dg6
         x8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bc34mR6ZWkJuZtB8iI9zAZoXwXl2az8L4PTSRpEob3c=;
        b=XAYt7MQSYw/J4dfPQxLj+JOdqc+Mdd3jVsELdneIL6me/WbAw4Kyq/xINtSOQukRv8
         yrrCPw72vtEWtElUTh7Hs95vv0NUw3wbKl8Y/gebCqfJGi1UxW2JHjDdZnQqTi2heyGZ
         k/QOk6BcrhKhW3gqZb/y0miv+swzVkvfqltBcEgN7v2w7W/4pOvDvseDT04yIzu6gKkK
         hPud2QIzBevzhzqMJrY+yEf+7CoySpUUdVrlzJ/O+/ke8gGQK0bmp6GwFjk2PLiC84v5
         2z2SE+lmkGIikenlpMKVzmirCDsohAFuPPCLpCWnXJ/L2W+xkKQyCB5soQfRwGDIjKSB
         rWgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DugWo5gP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 134-20020a81138c000000b0031cb0347688si6412526ywt.15.2022.07.05.09.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 09:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DugWo5gP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8lKM-0005lT-PC
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 12:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDo-0003tj-T1
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 12:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDn-0005r3-2I
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 12:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bc34mR6ZWkJuZtB8iI9zAZoXwXl2az8L4PTSRpEob3c=;
 b=DugWo5gPWIOEJ88U7NS0xfAn1FbZyyQEcV8cCsIv/oLEmJdJrsBXfx8oqxGrPTO39k7GM6
 nVbY8O53SYYb5c8gHMakU0Y4zlj1GQWuCFfx3kKRJRDy9BG1N46mnlJF/DHYacsTAs+vKz
 3PQ7jqnBJC8f0Z7gssPrpkjLcLx+Sig=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-0XR0sUp_PqaKP9WSNvbw6A-1; Tue, 05 Jul 2022 12:16:13 -0400
X-MC-Unique: 0XR0sUp_PqaKP9WSNvbw6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0FD294EDCE;
 Tue,  5 Jul 2022 16:16:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CFBF140EBE4;
 Tue,  5 Jul 2022 16:16:06 +0000 (UTC)
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
Subject: [PATCH v2 05/18] block: Make blk_co_pwrite() take a const buffer
Date: Tue,  5 Jul 2022 17:15:13 +0100
Message-Id: <20220705161527.1054072-6-afaria@redhat.com>
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
X-TUID: MZyGjPZ0OyFf

It does not mutate the buffer.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6630316795..6440e92028 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -130,7 +130,7 @@ static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
 }
 
 static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             int64_t bytes, void *buf,
+                                             int64_t bytes, const void *buf,
                                              BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-- 
2.36.1

