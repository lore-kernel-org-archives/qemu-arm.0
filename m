Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp481003lfm;
        Fri, 10 Jul 2020 01:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9LHDxVf4j4CX/1hZ89qkmXBgkAJu+vqu3aJISBpq0DvLeAVBepeyHIVXYmZbwnHTMDcXC
X-Received: by 2002:a25:54f:: with SMTP id 76mr23163857ybf.367.1594371490225;
        Fri, 10 Jul 2020 01:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594371490; cv=none;
        d=google.com; s=arc-20160816;
        b=qSSqtOm34plyIyNNBwX8GXVucvi8+SNZHhK7e3V+KK28flGj4wlzift9IzDU8O5pG6
         rQkUsVYQ5/XbkZZ5277pzyDoKtJv8etz5KX2qup+a4BMIoteZCAhD/swfhf96TqszVv/
         3AycYETyA4UjUJolgkVawQJqaqCpTJSxWeiNLRpdXhPBoHYyvDFZ91mAbwkxuTe+1ZtQ
         4fnc7snLwFMRB7bSfUcPNazUWtKkoVUTPMsIfCGJgcLRKlvPEs7s0Aeyrlf240+8G6l6
         GtFLRCaFMbxd2BXzpsf1dBB1DD59I4TplsuXar6Gs/EhV9QtRzsvLY0uEm7jbZMgcXD1
         KnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=6UuvXk6F+b+Tv3n3h9p2quCLU/54dxm2IrU0BRnuky0=;
        b=ITTLL62OGul815i8VLxKAohJCPNnTPwcZIoM1rgA2XGPCasYny2QLxdUWYZ1DOv29q
         Zit2CDMruTpV+6fkJ7YD3FVgR9UN05OEHF20X83PKPLzwbShQYANNHu/04OIwCFNUqvt
         Hw62d7h71TcLSLjMCJkSssIvoamiRazhmujlSqqOSXFzsuK+qx0GHuS0a/MYgJZ2iZJz
         FjtZunDCdYcdUsMmoZYVEZ08JbaHT8mg6VnfK4j8mdOJhXwgKmPWUluecIVk8CENNa53
         eHCqjSkqyXJ/z9rACxDbRf4D4ESDz/D3+79GSFNvPwUMEHdldVBXI6BzDb+rtFQyLbGr
         eMhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D/3BM+Nb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si5230381ybf.396.2020.07.10.01.58.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 01:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D/3BM+Nb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtorB-0003Uz-LE
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 04:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1jtoqS-0002vN-Qz
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 04:57:24 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39487
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1jtoqR-0000F3-C9
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 04:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594371442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6UuvXk6F+b+Tv3n3h9p2quCLU/54dxm2IrU0BRnuky0=;
 b=D/3BM+Nb1ESS3hw5jPxkyq5H43eiScWg30fbNwiS1rlXT6KH7z61AL/OllxZ0uYwMyrivr
 wN/pkrhwJ0vZRDhBZ+9v1SMpe52KzyPBoz07+ryoXgfnIdhzpIcrG9aWBq6R64Ia/KQIaI
 awuXMWEN4uyPJgvo7fKj7f1IiSUAayE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-0jJaHsoGMbWBjIj1jSPDjA-1; Fri, 10 Jul 2020 04:56:12 -0400
X-MC-Unique: 0jJaHsoGMbWBjIj1jSPDjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B781B18BDB;
 Fri, 10 Jul 2020 08:56:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.193.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F7E574F48;
 Fri, 10 Jul 2020 08:56:09 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/net/ftgmac100: Fix integer overflow in ftgmac100_do_tx()
Date: Fri, 10 Jul 2020 10:54:18 +0200
Message-Id: <20200710085417.638904-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 22:08:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Mauro Matteo Cascella <mcascell@redhat.com>,
 andrew@aj.id.au, qemu-arm@nongnu.org, clg@kaod.org, ezrakiez@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qVkmKbegwXkI

An integer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
occurs while inserting the VLAN tag in packets whose length is less than
12 bytes, as (len-12) is passed to memmove() without proper checking.
This patch is intended to fix this issue by checking the minimum
Ethernet frame size during packet transmission.

Reported-by: Ziming Zhang <ezrakiez@gmail.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/net/ftgmac100.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 043ba61b86..bcf4d84aea 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -238,6 +238,11 @@ typedef struct {
  */
 #define FTGMAC100_MAX_FRAME_SIZE    9220
 
+/*
+ * Min frame size
+ */
+#define FTGMAC100_MIN_FRAME_SIZE    64
+
 /* Limits depending on the type of the frame
  *
  *   9216 for Jumbo frames (+ 4 for VLAN)
@@ -507,6 +512,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
         }
 
         len = FTGMAC100_TXDES0_TXBUF_SIZE(bd.des0);
+
+        /* drop small packets */
+        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
+            len < FTGMAC100_MIN_FRAME_SIZE) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too small: %d bytes\n",
+                          __func__, len);
+            break;
+        }
+
         if (frame_size + len > sizeof(s->frame)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes\n",
                           __func__, len);
-- 
2.26.2

