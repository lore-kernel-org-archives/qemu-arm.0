Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4195889ejn;
        Tue, 25 Oct 2022 08:24:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM581zD81k/AAO1qDMECQUKS/+qqtok7r5COppPT2mmFZrfwMTjp+9VH+1L2CPSJHbwKgDIm
X-Received: by 2002:a37:34e:0:b0:6ea:2cef:131f with SMTP id 75-20020a37034e000000b006ea2cef131fmr26910284qkd.554.1666711454301;
        Tue, 25 Oct 2022 08:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711454; cv=none;
        d=google.com; s=arc-20160816;
        b=GoahTabPPJKaPWp41/Dn17UO1ezQMS/SiU/HrbzRmMbDzD5N6wvBRjuBN+Q6TlJ3Jf
         h4VWs32oeD9LqndlJR4TrE0zDs0htZobqXyiQP6RtmYpBE1udZEyKe5qWIbaVTqRTHC1
         nszgjyMeoVGll7Ajkx3GvlffgsIV2YaY8bAwBuDPV/TpbtqPxTsOcTrwtK6R/B4sfaVN
         xyvQJhvMq6eG1s+dACxpbRcVVB7tfJFA3AGn+OLglYMEnSWYYbucssZnPGUto/nShHjb
         BxUakA5bPqqQF8uJ0/tU0TqUSpCdRMw60NS58oOMh0X1jlb5WKAzaVhVtikvO1L0Jopo
         McjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3IjWr3Z0buMhJbtHWfv6UHrJs9Mn+IlS2im9lz5++jA=;
        b=Fd4gC83S6BxuysHxZ6QhbjE4s+oNfmHoaplLjiBzeTn8SXN2eR6qo9h2z618Vowkhg
         9p5FzJlFNF8bNmBktOlZwXzmyz/zH8AwoSIR9vRjMlOF5xHDUDimWWvOXo0R0Vcj2Iyl
         dXOrcDudiVj/tFz1DvFXUDPqH7r0IK9f6rzI0wFc93jihLlawY6RwZc/LytFELB/fJCb
         ypF3ungYNYWZdhFvHP0GknNoohMriEZFUpVt8AVtrWCmWDafwx8pqw7NYnirTtZLZlsa
         0CL0jo1a/lz1mM0Ob0lGWaOETgVV+FsucYbipekKhznx21WxMBU6RK9BTRYXWvSpkzly
         8gIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs16-20020a05620a471000b006eec0db0516si2020496qkb.651.2022.10.25.08.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onLkG-0007h7-RG; Tue, 25 Oct 2022 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkE-0007e8-3X; Tue, 25 Oct 2022 11:21:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLk5-0004sp-Ci; Tue, 25 Oct 2022 11:21:33 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbJ20rhCz4xGr;
 Wed, 26 Oct 2022 02:21:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHz2Hl9z4xGk;
 Wed, 26 Oct 2022 02:21:19 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PULL 09/16] m25p80: Add erase size for mx25l25635e
Date: Tue, 25 Oct 2022 17:20:35 +0200
Message-Id: <20221025152042.278287-10-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KS1UAAeCAwVL

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20221013161241.2805140-4-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 13e7b28fd2b0..637c25d76e37 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -232,7 +232,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
-    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
+    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512,
+            ER_4K | ER_32K) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
-- 
2.37.3

