Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp110520lfb;
        Tue, 31 Aug 2021 21:23:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBkJSxFO5QsCMLcDh9ZfxpTNIBJwlJY+WL5zNiZnrLoZoa8Os0D4bRRBMr9+89DWDC8M6B
X-Received: by 2002:a05:6638:1613:: with SMTP id x19mr5942963jas.77.1630470228152;
        Tue, 31 Aug 2021 21:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630470228; cv=none;
        d=google.com; s=arc-20160816;
        b=qthxGSQ91oHxU3gdQe2F+t2vjiHFS6QKAw9iNxiU3vjsLhONUeOvVfv5ClgjaSWVg+
         MWZpNv+/YJqqqqiIxOvYU+aI8IwS5kD5x/QDhPUgc77Con/+PSIXZJU+BrmSLP4EMotX
         BjIRWRY6S8F/qtrcTU8mjq52hAmYxm9M6DXBqzuxPIP2fHlE3oKixCXs+5cRDf69c6il
         AidIWcKUg2tSxP5eM5o1IP7An2cXpOZnG2Hk8DeOJuM5Xu50I6V70ofRq2l0fMm2nQFP
         +zYKwq6/AiQc+9/t0xTyi2sILpRXhxUN5wJl/+FTHxm/J0FLGJ7R30ZaEcs9Cpuzqsc9
         YWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yGdGZvxrYlY/3/cqMJj5yr6YPJrDB+CO8qjQORCnAl4=;
        b=Ns0IOioQlkWlQpuHKfld9lkegezdNEQTz44dqTIblRUPRoL7l4u/wTvGCof6YRCV8a
         DyZUGhYwWm4k1wIh+icoOsedbkpfrBS8Iwwd21anT+bicGBV6NTtPWMB1LgPlHTu9ir+
         hDVPPbTVMUvCwgoGtL7BDYVClViI7s2gDM4Rdo4vBTCdFqqZajsL5UoUCGmfGNsjIKRR
         fRkLhYsXLTWFXvYd3k24K/qXpbclr83dLnz5JoWaLnu+vRWAWWZ5i5NTGJURF0aFni7+
         xdK4QgKaXmbc7dsfDkW9iCkYhjUcVH+6bhAV7kEdk1L4cV3PuispMOde6SZSNvnm5Sd0
         zOiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="DyphrGL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si20841590ilg.50.2021.08.31.21.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 21:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="DyphrGL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLHmt-0004tJ-Gg
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 00:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHjB-0006m3-TE
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 00:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHj7-0001yL-Pm
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 00:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGdGZvxrYlY/3/cqMJj5yr6YPJrDB+CO8qjQORCnAl4=;
 b=DyphrGL/rbu0HxMo/umI86kUuvJvnnD0FLnsgdLIpN0OO2OClxAENVRf19iDp7yq1HPZ1P
 4+styW3Po1H7cXPkUw1I/BiMCH9LTLBQ8DXDVERRYiskLiyIT4j9Sc03vrvqecEo+vXFp5
 rmzRfGrAWSg/5nCheBVZbng+swT7STE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-iT_Gkn0yOpO-JbbezCGSYA-1; Wed, 01 Sep 2021 00:19:51 -0400
X-MC-Unique: iT_Gkn0yOpO-JbbezCGSYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74736189C446;
 Wed,  1 Sep 2021 04:19:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3E471001281;
 Wed,  1 Sep 2021 04:19:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 77FC818009F4; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read() and artist_vram_write()
Date: Wed,  1 Sep 2021 06:19:03 +0200
Message-Id: <20210901041903.3111086-7-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
References: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0MX7VPQQqZDy

From: Helge Deller <deller@gmx.de>

The CDE desktop on HP-UX 10 shows wrongly rendered pixels when the local screen
menu is closed. This bug was introduced by commit c7050f3f167b
("hw/display/artist: Refactor x/y coordination extraction") which converted the
coordinate extraction in artist_vram_read() and artist_vram_write() to use the
ADDR_TO_X and ADDR_TO_Y macros, but forgot to right-shift the address by 2 as
it was done before.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extraction")
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Sven Schnelle <svens@stackframe.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YK1aPb8keur9W7h2@ls3530>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/artist.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index aa7bd594aac0..21b7fd1b440e 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1170,8 +1170,8 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
     }
 
     buf = vram_write_buffer(s);
-    posy = ADDR_TO_Y(addr);
-    posx = ADDR_TO_X(addr);
+    posy = ADDR_TO_Y(addr >> 2);
+    posx = ADDR_TO_X(addr >> 2);
 
     if (!buf->size) {
         return;
@@ -1232,8 +1232,8 @@ static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
-    posy = ADDR_TO_Y(addr);
-    posx = ADDR_TO_X(addr);
+    posy = ADDR_TO_Y(addr >> 2);
+    posx = ADDR_TO_X(addr >> 2);
 
     if (posy > buf->height || posx > buf->width) {
         return 0;
-- 
2.31.1

