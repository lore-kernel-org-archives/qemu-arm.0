Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp297625ejc;
        Thu, 19 Jan 2023 04:38:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsg14tcMf53V2ht+DYL5VwL89QynIhXonvfZnJOqbCcbDnqUfmM7y/Lg4CV0n91IF006F3r
X-Received: by 2002:ac8:478c:0:b0:3b6:3c0a:82e8 with SMTP id k12-20020ac8478c000000b003b63c0a82e8mr13635430qtq.1.1674131899480;
        Thu, 19 Jan 2023 04:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131899; cv=none;
        d=google.com; s=arc-20160816;
        b=gJEXzhMMcFLbbJ2C781EeyrrXxgsr3njPV/3SUDrh1SWbiSDvNLC3zAeyHNtftRUyT
         gfv8Gb5OGfep9GmwTqoo/kMfQS1hUijc9O/VyBTuY0+un//KjgDXLKOZ2HJrO32weZ/f
         uA+bBtDWvN4rI93n+AI0BKU/OcIs51JW6oVBlB+3LwKlj/wjHMqfzxeB/ZUw5rtJEJPw
         uQEFywnHS3fJvOquhT7vKX9olFHnK5PfqBerlZWXZDjfnrvNr1m8iNVHUDOSC+tJWXud
         o+rlgGFBt39wMQxRY3DvTIbRhv+OqexuU6utjapWUYERGPTh05EU3sCbot/sALKpCgfJ
         f8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=DBawcJGUj58E0/EAkTX1QXn1/aTLPasY2XjbqIEJbtQ=;
        b=azuz2RNHYqzqCRrsifh7Mb2evnXyW8n3JDysr1SqTw+cRQ3rRaIBD/BVTEbYDUZFHs
         gAlnMitjPQvyoyoLxbNc2e9gXOdJDl0N+VLKOjZO7gKbDW7ZU5q2XJ+zGoVUCWieiRZ8
         /mmg8Wo9pp/3kfsODGb71U180VP3tHKS5EIygPgGb9G0teIaAp5smv+8jrum6kh7KDLp
         oJiNhzg3uAN+JTZFsuWtVm5g387x1bj4d8O3CdxuncGwQZOQ+zgJldX9v/L2FPEhLssR
         8yaJ6E/Om+3x22HoK8n29UFWSWSkxRRP1gN0sXcknLCt3O2DrZchaFn5czu2tj2mmiWF
         b/qA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv16-20020a05622a4a1000b003b686091c78si3328103qtb.570.2023.01.19.04.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:38:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU8c-0006L8-6J; Thu, 19 Jan 2023 07:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8W-0006IV-6J; Thu, 19 Jan 2023 07:35:20 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8U-0007VR-DG; Thu, 19 Jan 2023 07:35:19 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXd0XvQz4xZj;
 Thu, 19 Jan 2023 23:35:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXZ4fNcz4xN4;
 Thu, 19 Jan 2023 23:35:10 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stephen Longfield <slongfield@google.com>, Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 03/25] hw/net: Fix read of uninitialized memory in ftgmac100
Date: Thu, 19 Jan 2023 13:34:27 +0100
Message-Id: <20230119123449.531826-4-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: HKeArwi1OTIm

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
2.39.0

