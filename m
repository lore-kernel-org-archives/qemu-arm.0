Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5375791ejb;
        Wed, 21 Dec 2022 10:32:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtlU4bt3R4kvLDhYNg/FDHYxsnSnunQflRDsRpCzB1iXenv18FRSJ8DwQRwJ23GBQL4T0qJ
X-Received: by 2002:a05:6214:3d9b:b0:4c7:830:c6d8 with SMTP id om27-20020a0562143d9b00b004c70830c6d8mr3404834qvb.0.1671647549081;
        Wed, 21 Dec 2022 10:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671647549; cv=none;
        d=google.com; s=arc-20160816;
        b=RyG0hyhA2xj0IYxn+ZEZspV2ky2IvmnF4AhEZVS38Txm1kzYtOio+hAtgsiEQYpZNP
         KTCfAKdGvzjmoNO1Y1p7WwlA4PVFpDC8rGMWW20OEBNDNhLwKZkBp9AYZR02KrR9QEL0
         DaUWoIDBgMhq14yUBEC4069XszsDXhJnXXIWOgD5kO3cVrPSPkk/RwrP32nO+VA3FaML
         D3m9IE3ypbHUvL9NeCsT+aAafOrvr4jQHijPdyB2VFiUk5gKmwZHFqr+Qyt/2bQrF6oO
         UACP0qnnFO1q5wlwCNik1i1Hv9hiojx60/8CuYJk/Y8GRJquKJib32OBr1PB7oJOZsAf
         MEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=7B07ofpcA7tRmi2XyukXiykSOBgmFs9jsO808EFWmoc=;
        b=hpE6G5FAC3zDFtEb3qzE+1Iwy9lCpsK10lK2/0PBlzY7BF35ni5BVpsZZ7e0Pf+zYN
         4N2rK/rs1x3/zVMm7rqyGkSI4lo5UprqLmICEExUJqQGWyBPeKtjCSyXNqMp1dKFPjqa
         zXhfBQpyHOmFuT03bgsRjKq/IiMHwh+ou3eTpyVHz7O1Chuhy8qe2/RdMV99b6CNt7KT
         aDek+IUKUIWz9Z57hhdNUY3qi0MXQxFpxKHGOo2R4RDCJ86g4+CJa8JBvNvAb/c509gY
         LJ1RHMEtAK5LIvmQNuSDTqR6FKlz0Gkl2K2ieFdYKVuZj6/q7Jt3x4qmUfgtjH20gzI2
         gU2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HffvBwOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a0562140e4700b004bba3652dccsi6337101qvc.106.2022.12.21.10.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 10:32:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HffvBwOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p83t1-0002d5-VZ; Wed, 21 Dec 2022 13:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JFGjYwoKCHcngjibadZgYbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--slongfield.bounces.google.com>)
 id 1p83sy-0002cX-Uu
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 13:32:14 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JFGjYwoKCHcngjibadZgYbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--slongfield.bounces.google.com>)
 id 1p83st-0001CY-6U
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 13:32:09 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 k7-20020a256f07000000b006cbcc030bc8so18493599ybc.18
 for <qemu-arm@nongnu.org>; Wed, 21 Dec 2022 10:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7B07ofpcA7tRmi2XyukXiykSOBgmFs9jsO808EFWmoc=;
 b=HffvBwOzn9pt2EFwA3DAnXUC0M+MJA9E7lUI6pFdhnkk01HmcWxFkZwhiJcBiOWF4b
 zQWt++wQW7yiVfKESw+MfCbGaqMtV+yFmdIkhKFo76Iazoq2FQipKjv/BsZKrnoehTJl
 oXJTigD0vjMbGi8qvLHgY5jLTrIhflGVkBiAvebsgZ+GLLOpi0njif3IF5/Phy86DIAW
 RctxcTNGepROHrx1+w/fCVrEYgt6fdW0OdO7GTDXaVnmrDya1/08OjOlZ2+ch8aHp2hn
 rh2BseiLtWBNk7cdls1+1r7BwWskMs5D4VASZD51iNrjbrDP6dsNyZ2ixb0jOFtTSuiF
 nXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7B07ofpcA7tRmi2XyukXiykSOBgmFs9jsO808EFWmoc=;
 b=qr0lOnkx+DYJNnfzyseVJITMdEJZIiLTsDxBk+bqM67w3HW/9JTTx6CG9rjfBUcDAo
 N90JcswamwXh3hBizeksd3mbVLw1kXr49yzQ7xjqL9v9qjjsjlxeghNAh+0TEfzOGVKV
 gdftTh8ap0WEcnD/Ni7mMUOMRyfhi4FrhDs+O4gqcmV4oTtts2rYuNhlUF8D5DgAZfJT
 nOVZVU2CctJd5X+Z33NUpVqScUDasCtX1pK+qa5fY5aVbjcSQjDWll4u37K2zMdluddx
 W0QKPoqdogpdglbv9IRSw+xjnpfjZuPlrjivj/3RJaVI8U7881cLYur7z/sHdXlb6FLr
 2KUQ==
X-Gm-Message-State: AFqh2kpud2YE58KhKiR5oPmh2BvR1w1trKmQ4Rv1dIkqJAUlU0lVUNKw
 VxcIC+QQtw/rZRzL3mpeXcUaV+qu2EUzYCPh
X-Received: from vonneumann.svl.corp.google.com
 ([2620:15c:2a3:201:82df:1739:d438:9992])
 (user=slongfield job=sendgmr) by 2002:a25:d88e:0:b0:701:a966:d3f9 with SMTP
 id p136-20020a25d88e000000b00701a966d3f9mr272924ybg.262.1671647524759; Wed,
 21 Dec 2022 10:32:04 -0800 (PST)
Date: Wed, 21 Dec 2022 10:32:02 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221221183202.3788132-1-slongfield@google.com>
Subject: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
From: Stephen Longfield <slongfield@google.com>
To: clg@kaod.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 wuhaotsh@google.com, Stephen Longfield <slongfield@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3JFGjYwoKCHcngjibadZgYbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--slongfield.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: W9GOJ7D2mRxj

Size is used at lines 1088/1188 for the loop, which reads the last 4
bytes from the crc_ptr so it does need to get increased, however it
shouldn't be increased before the buffer is passed to CRC computation,
or the crc32 function will access uninitialized memory.

This was pointed out to me by clg@kaod.org during the code review of
a similar patch to hw/net/ftgmac100.c

Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
Signed-off-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/net/imx_fec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 8c11b237de..c862d96593 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1068,9 +1068,9 @@ static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
         return 0;
     }

-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;

     /* Huge frames are truncated.  */
@@ -1164,9 +1164,9 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         return 0;
     }

-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;

     if (shift16) {
--
2.39.0.314.g84b9a713c41-goog

