Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp110014lfb;
        Tue, 31 Aug 2021 21:22:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxSP4MF2JO9jUjqL1KyouTecFlo9h2sdvuiFqY+VZGUYE2Qxv4C0Aw3DknTrvmaSPm/ura
X-Received: by 2002:ad4:5805:: with SMTP id dd5mr33028157qvb.62.1630470177160;
        Tue, 31 Aug 2021 21:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630470177; cv=none;
        d=google.com; s=arc-20160816;
        b=vTMreO0uG/vOqkID0IIbNU49hJVIAhp3kpwoQg1AjbaYT6R44FfxrDaaEYgstuquhJ
         EA5Ay2JK+ZtWqHsXHtezXi87TzcNoPPzpjyH135VuVKvVQPiu8c6Ssh2uZ8RjWNUdRfw
         +60khcPbBEFUR8ZMj0n8D9dFcmsvFe42tQhQiGxIV6rhgcEfPdftdXkwBSSi3M09j58g
         YhonnZVWB3R/kaA1yRiD3gAMOq1XAauuifsKH+rOJeDjO3SxBKQh0JiaXU4o+PxPGKy4
         7UXgo9EuwOJorRT95KT82mxw/mOHElSsQGxxo4DeNgQQyKGdv+5GRnF0vmA3TCH11rMs
         W26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GlqLQCxX0D14JNffkxwqSF7p12+i5tGsPk/VWM778Xg=;
        b=d40RHvlugpHEC7fRDJZizEH70S2IPP8iI2REyyThP2oeQtDsTrXiMpmC7jpgYLwjNq
         CQ227b2cc0KmhyvGfKyJhFbR27GU8Oy7dtS+rduNorPOgwrFDwcWqK4YTj7iFGx7e3SN
         ifVIk+CCUnkbsn1X2uZHV6HWvN+R/e/K/aeufA9m7XG08VDcyztwpBeE5ul/HqgpWiXS
         gjiKX2jvVhOmL6hzF8kj+h0kqa2OYHK/0ut9ILZd2PMKZwu5LcZhWjUDF+fxAERtTGPn
         yTpdGwJUWhPHg5+CaGcX2z1Ckr4A2fLq6f8OsBhlXy+LxX9oewXOxSeXIYEfs95tDcbB
         f5og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="H0/DWPCu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si14353053qkp.74.2021.08.31.21.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 21:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="H0/DWPCu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLHm4-0003pZ-By
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 00:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHjB-0006iy-EC
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 00:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHj7-0001xi-87
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 00:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlqLQCxX0D14JNffkxwqSF7p12+i5tGsPk/VWM778Xg=;
 b=H0/DWPCuvoHVxFSIDKcCY3+jHOOHmNxMJ3tD/GwG/fCPLIpT0tZX++iegtCnhBL/g7OHk8
 CGKTpwQ1vKpmPPinXykci9bvRO0raQ7832eHr9qmnu7WLDoqf+2cY9aB1WazGuAVP+SsIb
 5NNmhQ9Y8jBHQaKIwAIPkPOOse/NtgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-GtP7YkcuOHy6SPL1cacWuA-1; Wed, 01 Sep 2021 00:19:51 -0400
X-MC-Unique: GtP7YkcuOHy6SPL1cacWuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8122189C448;
 Wed,  1 Sep 2021 04:19:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B589660BD8;
 Wed,  1 Sep 2021 04:19:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D60D18009F1; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] vga: don't abort when adding a duplicate isa-vga device
Date: Wed,  1 Sep 2021 06:19:01 +0200
Message-Id: <20210901041903.3111086-5-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
References: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
 "Jose R. Ziviani" <jziviani@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r4iU8UGb6arZ

From: "Jose R. Ziviani" <jziviani@suse.de>

If users try to add an isa-vga device that was already registered,
still in command line, qemu will crash:

$ qemu-system-mips64el -M pica61 -device isa-vga
RAMBlock "vga.vram" already registered, abort!
Aborted (core dumped)

That particular board registers the device automaticaly, so it's
not obvious that a VGA device already exists. This patch changes
this behavior by displaying a message and exiting without crashing.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210817192629.12755-1-jziviani@suse.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vga-isa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 90851e730bcd..8cea84f2bea6 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -33,6 +33,7 @@
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 
 #define TYPE_ISA_VGA "isa-vga"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
@@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
+    /*
+     * make sure this device is not being added twice, if so
+     * exit without crashing qemu
+     */
+    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
+        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
+        return;
+    }
+
     s->global_vmstate = true;
     vga_common_init(s, OBJECT(dev));
     s->legacy_address_space = isa_address_space(isadev);
-- 
2.31.1

