Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6105633ejc;
        Tue, 7 Mar 2023 07:56:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8z26RdV7jEasTdxT3BZD1M/1/8i68K4zlRtJkhFDAsxjLZIh2es9J0+oiv4H9Y9PwIsOrM
X-Received: by 2002:a05:6214:2681:b0:56e:b4e0:1bfc with SMTP id gm1-20020a056214268100b0056eb4e01bfcmr26331365qvb.11.1678204592364;
        Tue, 07 Mar 2023 07:56:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678204592; cv=none;
        d=google.com; s=arc-20160816;
        b=WAxKG5Czr0R0r2BUJcnM0EhuQvqRWpmlFnRNN0aX6a3H5aaPgLI3jhNoo7vXFExR3q
         Cn50v5blYmp4X14ofOdPDzII+i20wGmsR55iOSDLHIxtGHhLxl6/R9V29BuyMgUaiyzD
         4LutUQAfSv3yJD/lMy3JoOmHDkHA5WgK4+o0VT8g7fNEdygZQ7WwY1ZoVxstViWXFg9S
         CyKmNiWNMV3IymAJQ9aHhmMqpnOWI8we+PAib2224n+DLaEe0kBEhx/N8cw4mEWCCIka
         JufWi/RGW+0l580y1aLhwZTF/Va965rASMjz4Q5KAT4CnIwi5kuIeOdw1t3oqwxefCwe
         37UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3q+YWIqDjDk+O7j6550NJFFNrYrEsAKpQzlIvmxSvqs=;
        b=v+wyPv1WJaSLk7sN2HShcf0i8f1WiTyWEPC7Rd/+Z4CkhKKq93gX0NgYR2qcuD9tui
         aUIpHAGE5dmSqNXGQZb4VLuKIo+oLywGTuppYOphd8JijHldACWQ/clTJNobOo7m8y6u
         r6k8VUiKfqa7CXHke5F3QhDf2D2I/qIZ1rtP+EoBdHUK3cRJbTJIFf+bUqy8MfaUT/VP
         GcDsi9GlpHEvCOpfKPyPQZrAtHjHakYWRPYSHw1smbAgLHVNbSJXmEec0efVzoP60AFl
         /QHl9gPXNBDbqASIW8zKS+UtpQLSbytY5WIZR50lanEk1zYEipGQdrDnzrEHHLCtD7de
         h+ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm50-20020a05620a1d7200b006faf3549450si9408894qkb.493.2023.03.07.07.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 07:56:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZZfU-0006JR-He; Tue, 07 Mar 2023 10:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfS-0006IT-3Q; Tue, 07 Mar 2023 10:55:58 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfP-0000RC-C9; Tue, 07 Mar 2023 10:55:57 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWKmD5Bk9z4whk;
 Wed,  8 Mar 2023 02:55:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PWKmB6R7cz4xDh;
 Wed,  8 Mar 2023 02:55:38 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 2/5] pflash: Fix blk_pread_nonzeroes()
Date: Tue,  7 Mar 2023 16:55:25 +0100
Message-Id: <20230307155528.3655534-3-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
References: <20230307155528.3655534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=rbq/=67=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c0GS4qglSrvq

From: Kevin Wolf <kwolf@redhat.com>

Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
of reading directly from the root node of the BlockBackend, it reads
from its 'file' child node. This can happen to mostly work for raw
images (as long as the 'raw' format driver is in use, but not actually
doing anything), but it breaks everything else.

Fix it to read from the root node instead.

Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c
Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230307140230.59158-1-kwolf@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/block.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index af0710e477..9f52ee6e72 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -39,8 +39,7 @@ static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
             return ret;
         }
         if (!(ret & BDRV_BLOCK_ZERO)) {
-            ret = bdrv_pread(bs->file, offset, bytes,
-                             (uint8_t *) buf + offset, 0);
+            ret = blk_pread(blk, offset, bytes, (uint8_t *) buf + offset, 0);
             if (ret < 0) {
                 return ret;
             }
-- 
2.39.2

