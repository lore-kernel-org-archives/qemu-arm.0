Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp182941lfc;
        Thu, 16 Dec 2021 05:01:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymuHRxl57/sWp6S7gc36sm4y8h0o42a46hEYjzg2ylkvH7sC7u6pErD7iKt+nS5+6axkhb
X-Received: by 2002:ac8:5842:: with SMTP id h2mr7049893qth.244.1639659665278;
        Thu, 16 Dec 2021 05:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639659665; cv=none;
        d=google.com; s=arc-20160816;
        b=HBh/1j6Aqg+/W8eGDl0FCTrnwyfkgZq5FvUUTdLZPnRZFXIQztq7LT/UcVk0PCYTbD
         EogzooO1MJyT+tLvDHkZ37algcKlqvr6OGUJtye1NzAlpzFUfNYq9aUY3AFSsUWTVaNK
         Qowy1Xdokd2Cm/83Zo0q82HFnfMo7TgoWIP9+c8KM1O8podDIyz3r091riGubkjPSC+T
         rEQYFpca2sa0Nd8fPrt2N70NZt+CDnU3F9YUm7Uote6tz4J9I8D6I6KlQIx6KTLjEFkr
         QZjI89mQv3S54BUF5NmX0+0kLUH8O5Oue1HxTEaVATeBsTAWNIXB7mArOqOn2jEsL2XK
         jUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
        b=Jrk9oY2Dc3Ov8+19BVIOfH60nNuERz0qJ++yLG02k220aDAUB1FODA+ayMgyFdMwWB
         QWiQkCqxB7HDfRe4EXsSklSzzxVt9hgrSEJQvcWXhQojnVZQZWYhdFD5ZMY4mYcZnV23
         iuQHRJ8dAo/2z99I3gKlk1VBhfKOeWRwyHhLej/2s3XN/X4oIiGpXpZ4GUFCtTSAWLIl
         DKkEqicXPytERbDcLcYsx6rlebzU6TT0VGn4lZcyyucg0Rv9TrXGqxCJ+dWKhijUujeE
         huWrwaw3P+/ZaygpfQiMhniuCq9VDUYkD1MS0FKTsHTjPUhdKG3CFORP15wdTc2QVCwT
         hfzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nDl8Choh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si2596242qkp.253.2021.12.16.05.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Dec 2021 05:01:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nDl8Choh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxqNc-00072I-GZ
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 08:01:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxqJp-0004Hh-RL; Thu, 16 Dec 2021 07:57:10 -0500
Received: from [2a00:1450:4864:20::332] (port=38714
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxqJo-00022Y-5l; Thu, 16 Dec 2021 07:57:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p36-20020a05600c1da400b003457428ec78so501757wms.3; 
 Thu, 16 Dec 2021 04:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
 b=nDl8Choh8DT97eJ2VeA9y9HQJGGeAEjn1LMwGajemIXC5ZW5O+A0B25sq7i4bqY7nY
 ib8MEzxOYPx33ozpkfq9OX21ne1nhbve5128gPqHRrh4ff8J6UQXxx/plU2e4gopEpBI
 DISI3sYU0eWhSiXQKEdgWwMSBswJHKUqtCPj6cW3JUZ/B055mXRVgpztvkUIrfKHA7Zn
 ofcSUFeiAo9Do1QF/HM8tIQP4N3fGXWATv37VG3Jb7c/ZJ5mvw8Ox3f0oJ4e46H96AX4
 G6U/75kuKLA2C3nnmVkoHlB8x+EGT1KBKt93Igs8yvLB+d17xUUZ+hVadkWedYfIwSK5
 64BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NsGkgLg/FTwpFvrnErxAcsQIbF5SaAPwAKaBC1NuFFw=;
 b=wau4pIHAj1p6oZvtkgIt1ZDbjAp9uIc6i2ZYaWOeyXKiJ4WKna46mMD9u946yawWyT
 NMuH2ZfMGDMUQeQ0TqR22MJVuT0CjsICcCi3bg3vlNuHxJbnE9wY8h53hJxYD+/yqRGA
 2iAiDI4I+JGhlohwasj4cX3RahQsWlRWoxzz0vik3etSRfOhrWyAj0anAL4hBR4iofOU
 K85eeh0HXyijp0bVq5j+Q/Lg7ZPg8YSHu5Xfj/F9EgL3ZB9y6He51hbmxDq/fpz7Xq58
 7RdxfEjGfQdh62eLjNdL9p5RhTzMgkCTk/y8FDd32vkqywmLKmNRFh6M65MGr0SR5Hcc
 hdvg==
X-Gm-Message-State: AOAM531k6c571olNxAFfB3m6w51tuHhzu5uLtFvIeg53Gco6omawcIOR
 fIkCIB7PZGtAfmEWBWLyORBCh+jhhMU=
X-Received: by 2002:a05:600c:4153:: with SMTP id
 h19mr4989725wmm.142.1639659425651; 
 Thu, 16 Dec 2021 04:57:05 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h19sm4771585wmq.0.2021.12.16.04.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:57:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/arm/musicpal: Fix coding style of code related to
 MV88W8618 device
Date: Thu, 16 Dec 2021 13:56:46 +0100
Message-Id: <20211216125647.805544-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216125647.805544-1-f4bug@amsat.org>
References: <20211216125647.805544-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vcj6K/s+JTnl

We are going to move this code, so fix its style first to avoid:

  ERROR: spaces required around that '/' (ctx:VxV)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 2d612cc0c9b..6b5310117b8 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -309,13 +309,13 @@ static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
         return s->imr;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        return s->frx_queue[(offset - MP_ETH_FRDP0)/4];
+        return s->frx_queue[(offset - MP_ETH_FRDP0) / 4];
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        return s->rx_queue[(offset - MP_ETH_CRDP0)/4];
+        return s->rx_queue[(offset - MP_ETH_CRDP0) / 4];
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        return s->tx_queue[(offset - MP_ETH_CTDP0)/4];
+        return s->tx_queue[(offset - MP_ETH_CTDP0) / 4];
 
     default:
         return 0;
@@ -360,16 +360,16 @@ static void mv88w8618_eth_write(void *opaque, hwaddr offset,
         break;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        s->frx_queue[(offset - MP_ETH_FRDP0)/4] = value;
+        s->frx_queue[(offset - MP_ETH_FRDP0) / 4] = value;
         break;
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        s->rx_queue[(offset - MP_ETH_CRDP0)/4] =
-            s->cur_rx[(offset - MP_ETH_CRDP0)/4] = value;
+        s->rx_queue[(offset - MP_ETH_CRDP0) / 4] =
+            s->cur_rx[(offset - MP_ETH_CRDP0) / 4] = value;
         break;
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        s->tx_queue[(offset - MP_ETH_CTDP0)/4] = value;
+        s->tx_queue[(offset - MP_ETH_CTDP0) / 4] = value;
         break;
     }
 }
-- 
2.33.1

