Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5181089ejb;
        Tue, 7 Feb 2023 02:08:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9cZgOq/r5Y6/Uw1kEd3VNFCOtFgUcoT0Lkcrapgkzx3xZ2dpS0qwb3sY8vO05ggHdck0zs
X-Received: by 2002:ac8:5c0a:0:b0:3b6:2fbb:1f8 with SMTP id i10-20020ac85c0a000000b003b62fbb01f8mr3990405qti.61.1675764524357;
        Tue, 07 Feb 2023 02:08:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764524; cv=none;
        d=google.com; s=arc-20160816;
        b=ldea5aE4JozzC0+ee0/9wcNiXMM78j2VHXlASqYUIs98vqkU4uCxAfY++WFqLXBige
         WkyzPX7DcttfCvKUcSNs54Np2DrwvoR7UuGAwVSh+FUwQ121+MtRupSJIRBaLVdyIJEf
         drsaIAoEu+yqY6BIXSpJ6IFap3ywfsBy1Pk9AY6R06ZxsJCaqwbW3ioQLiMjLo3Wlfeq
         109v5spCsAuythIfaAUgcL/w+YwJtpKE9kDBgUBKbZmEO98VqS4g2RKhnX5EzLAni7Zx
         ECPoh4WY3ojNJCljWX1xk8PRgJw+mPwrITgbyVLXoYiotYaElDxP9MHTSqSPwLiWnk1b
         6nbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9Q3Lf7eLw6jQZ70RewShWWn30NK5fETkMerWKS+2d7c=;
        b=GRMuCFkcC8qP9DTI5rtdjQhw/Spa66zDkUqlW1uFIXR0n2L6Sxs85V3eIhZIj3H85Z
         DzLoXq1YSWZGDPv6kVJbAQQr6n2W71W9V0AZIgqS5Nky9ZDITRofggiQX1VhkItIRUzA
         aM/zv0k1yyBIIBrQ8QvNd3YUXh2eLeWuOywFdy+AGPeJ9r0eLJcsz2K0OwQH0dhMA5B7
         X6qqhhg0Qu3oYvVqhk5zyKCC4mfr+c+aS00e2ekxvbm+LLzj4pbcMvW5/R2F0YMv5+mL
         IAW9pWuZ0IuyQQm5jtwC3c4EopoF0yLrE75YmZ0ChrqWcN/cSXc8aSX0a9VWsBZhOfKm
         aCcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020a05622a041000b003a81d7834cbsi10184225qtx.430.2023.02.07.02.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:08:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPKtv-0000Uk-Tj; Tue, 07 Feb 2023 05:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtV-0000PL-26; Tue, 07 Feb 2023 05:08:09 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtR-0002Mp-Bb; Tue, 07 Feb 2023 05:08:07 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zN24BkZz4y02;
 Tue,  7 Feb 2023 21:08:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zN01W77z4xyf;
 Tue,  7 Feb 2023 21:07:59 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Longfield <slongfield@google.com>, Hao Wu <wuhaotsh@google.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/25] hw/net: Fix read of uninitialized memory in ftgmac100
Date: Tue,  7 Feb 2023 11:07:23 +0100
Message-Id: <20230207100744.698694-5-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: El9TJMN9rnrs

From: Stephen Longfield <slongfield@google.com>

With the `size += 4` before the call to `crc32`, the CRC calculation
would overrun the buffer. Size is used in the while loop starting on
line 1009 to determine how much data to write back, with the last
four bytes coming from `crc_ptr`, so do need to increase it, but should
do this after the computation.

I'm unsure why this use of uninitialized memory in the CRC doesn't
result in CRC errors, but it seems clear to me that it should not be
included in the calculation.

Signed-off-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20221220221437.3303721-1-slongfield@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 83ef0a783e..d3bf14be53 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
         return size;
     }
 
-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;
 
     /* Huge frames are truncated.  */
-- 
2.39.1

