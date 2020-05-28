Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp487492lfc;
        Thu, 28 May 2020 05:42:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTa6Tute1AvR1i/uRwj0LKafNDGy/v5cVJyO7hjwfmhW0ZZ4TaYdcYTqm2ErEsWGkLTqWH
X-Received: by 2002:a05:6902:72c:: with SMTP id l12mr5185366ybt.373.1590669779298;
        Thu, 28 May 2020 05:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669779; cv=none;
        d=google.com; s=arc-20160816;
        b=IvnUsIZ1UdjeFki5VJam2xsZLDY5oSEAsy0JBX69+W0Jqv7ee9EK2YGbwPeHjQ7vvO
         K4qcLod4hIGfe57OqJ0brCDBVcQiSXgs+MpHm+b9iQjSoqBi87zf3EGKVMUmfwFdpMP7
         qdbsdwj+zl0aKjkF8/VeQ633GOm8gPXkDsUaspjP2ghN/uvhaxy+XHdkZQ9Yn+lg2hR5
         +OkUOrLQ1R1p/6QyL6a5nWA+KP2faC4+SY+HmG/PWrEoa4H4BQYH73nqgYDaXzyeRoNu
         UVVdZi2EgbXHfIJ/GxzSzWeROk972V28lpvWpRMO+gzwFXfi1fRPw0t7p4F5y3nSDlQ7
         6ZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qCserRm6LGGKnOhbm/aA4nJ9cIaPvBWaUlZ+xbYriKs=;
        b=OqyAzT8639k0wHXm+gcDa6L80Mz75jgkGB0EqVyLXh8X+blZuhDk50V2fKs6G77cAD
         5uhFd6vcXI8i4WLSTduMq2WKUt2TVycpLP4F+QKydg+//XGTG85MRlh7cseJ6JPX/eZh
         A9YU7olrLFKFtvXz5SpkIWEZe3u1JbTqYn2ins8/BmEev6kEh69sfN3z4DRrSFQPJvcM
         14wzzWN7dbMdaKXUuNvgXJTg7tyxgIBOpwAwTIS3zvC2Q1cIfOEIncZq+lH5biBjHO0r
         +JrlHvAQF/5hsMc0LSaTbMZ7jKA6MKUmLUTxQpiN5BuztFTYL/fEKfrFYekXmoYS5VJe
         3bXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YUlMa7Al;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si4803437yba.200.2020.05.28.05.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YUlMa7Al;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHsA-0006cD-LW
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlu-0001fk-NX
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:30 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50483
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlq-0005Be-Bm
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCserRm6LGGKnOhbm/aA4nJ9cIaPvBWaUlZ+xbYriKs=;
 b=YUlMa7AlcKG6xNRecTbLgvsB8KNCZ+hVFp5VdokXpdIn5RlxqE+nO53ElU+dbn5XWy35y9
 dsAu73+tO+IGZrmJKUrwmRe/Iv8Qbu5ipAFvtJz4ir7MKY4pC/ApvS5RRfvnn02Fmdu6nv
 n+xwb28qUC0b5QvUN1wiyb471IiqPY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ZDQLi1kENzqir-b0k2G2xg-1; Thu, 28 May 2020 08:36:21 -0400
X-MC-Unique: ZDQLi1kENzqir-b0k2G2xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1845EC1A0;
 Thu, 28 May 2020 12:36:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45650A099A;
 Thu, 28 May 2020 12:36:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 24C2F9D73; Thu, 28 May 2020 14:36:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] sm501: Remove obsolete changelog and todo comment
Date: Thu, 28 May 2020 14:36:09 +0200
Message-Id: <20200528123609.27362-22-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 06:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YoBNyZ5k71iK

From: BALATON Zoltan <balaton@eik.bme.hu>

Also update copyright year for latest changes

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 1392cad2ad1315a5a50409970e0af061821462e6.1590089984.git.balaton@eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/sm501.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index e7a9f77de7bc..edd8d24a76c1 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -2,7 +2,7 @@
  * QEMU SM501 Device
  *
  * Copyright (c) 2008 Shin-ichiro KAWASAKI
- * Copyright (c) 2016 BALATON Zoltan
+ * Copyright (c) 2016-2020 BALATON Zoltan
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -40,23 +40,6 @@
 #include "ui/pixel_ops.h"
 #include "qemu/bswap.h"
 
-/*
- * Status: 2010/05/07
- *   - Minimum implementation for Linux console : mmio regs and CRT layer.
- *   - 2D graphics acceleration partially supported : only fill rectangle.
- *
- * Status: 2016/12/04
- *   - Misc fixes: endianness, hardware cursor
- *   - Panel support
- *
- * TODO:
- *   - Touch panel support
- *   - USB support
- *   - UART support
- *   - More 2D graphics engine support
- *   - Performance tuning
- */
-
 /*#define DEBUG_SM501*/
 /*#define DEBUG_BITBLT*/
 
-- 
2.18.4

