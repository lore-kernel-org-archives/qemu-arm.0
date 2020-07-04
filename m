Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3427606lfm;
        Sat, 4 Jul 2020 08:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfemXM5oO0ZkYUTSVGl59Htp8HWAnwRhH/Uo7kTwZOHl3PEZ4rhpCZ0MrpNNmL4+/ZVJkm
X-Received: by 2002:a25:570b:: with SMTP id l11mr67777531ybb.246.1593877637487;
        Sat, 04 Jul 2020 08:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877637; cv=none;
        d=google.com; s=arc-20160816;
        b=yqWA+uOlU6dTLZaqR1QjF+eYhEYyTSKZ/MkZ0yRGJbsIVzOjmFdJrbldgdB1lHuQE8
         T/fb2lhVynGyhciw3wFeHay90qxSoiSkoudq77AKVX0Jpm3wTHUl1p8mhK3UQIUR/Mpb
         xXAr0lO4BNdhFWO7IY8RX6v1lu0vkHJDNXbBefQ6VyV1C2A17Pmpt9rG4nIJxxO8XLga
         ElwNNn0kinGVzRchNrgUX3vdMfGjbc6Fm94ysIqQwPXFYvGBfb/me8rFGX0Du36aOFCB
         03TVSRr8so3LOrOGJJflSL121YupvweJBoUhl924vSjVbgVaN714WM6xLuOK42PGYUmX
         30jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
        b=yFjaZBJoe+8ZxAQ1tJ6qtaMsU9n7FE6fnfORJnkT5Hk+FACyN6kqgoBFr7GqjtS1TO
         ZeGz2GD4u53ZC7Ed/C5RnYY+fuBgPsku9X+xUkZSc1Zxz75F3sGZJTV7yfReckE8GrR+
         ish63WAzeq9Yjzvnr+bgYKeeoBTQVEGIMTQ1VV3pKpc5Px2sbZTP1/KpWupUAafhBh9z
         ZR/nff0FW4SmTh8+niQonZ0W7c52mUDix0TXx5ehSTinLwEaxWC915A7jzwyX/X1EpVR
         LgUPd+tHUsXjsnFJODyL/6VX9HM7OlXSIihWW2zLkf5lTsKQutxC4XQhCw+MYv+ZBeci
         ga9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QTvGTbU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f96si15638250ybi.131.2020.07.04.08.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QTvGTbU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkNo-0006Gz-Pd
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGx-0001ve-2b
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49294
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGv-0007j2-6H
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=QTvGTbU0FsA594nbpizQXCxVMsQeofTLwepRpExoxQp+2hOdJNxMbsl5+Pbnzo1hhKbvei
 Yu1EAO+1isTSs0V/IjI9WJ2Pedg/K0nuNny9adg1fWWrvxSkw20QAUYKzAiMtFttXk8RFB
 DtCUNIiOIGkqAayZJyKsSoZLx363CoQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-dRvXVh-IPHOgLYMzWClmvQ-1; Sat, 04 Jul 2020 11:40:07 -0400
X-MC-Unique: dRvXVh-IPHOgLYMzWClmvQ-1
Received: by mail-wr1-f71.google.com with SMTP id i10so35923998wrn.21
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=oVnbm3YjzrSPOUEUfNy3Mhl9wPjYyGq/S2f87rNip9DYd7jHoroYqFW3Z7ND3fOhSq
 18jLTh0v69ZVbMA6V85VimfBzD+bHEzcJBv5PXKqehGQ35zL99T7oLOhgkCM1Ef2CXRd
 5A/MFpE/8kFRm8OaqTOWvSrJUirrnG80S5Y4jAXIxd6cRGEMYVWzluZofF3uolHwYnBs
 LAKrUAfUR/RDcH2MF1Tmc4wVlfbTKEnFnfio2X8gs1fp2B40ck8nO45vOwLuECHfAENS
 oq7fmxZ0GzQa7qIC2wff+BP7IVENICKmu0PmaKUoSDcdiiX+U8jMc0vE1UCmhmyMF8p0
 JFeA==
X-Gm-Message-State: AOAM5327SED4Qv53uRelppmewd97RzTWM0nZqoBbrlv5UwuU7vlDHyKQ
 trDQNNte0fNVaTpIoGzuvH9+Ew5bB+QqGNAFmIUQ7icjGzzAP2p9hI8MUTANAEmAXnmpFPtEdr2
 gAEOQAvQ/cP2Z
X-Received: by 2002:adf:e44c:: with SMTP id t12mr13768460wrm.103.1593877205940; 
 Sat, 04 Jul 2020 08:40:05 -0700 (PDT)
X-Received: by 2002:adf:e44c:: with SMTP id t12mr13768451wrm.103.1593877205790; 
 Sat, 04 Jul 2020 08:40:05 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f186sm16650455wmf.29.2020.07.04.08.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 10/23] hw/display/vga-isa-mm: Emit warning when old
 code is used
Date: Sat,  4 Jul 2020 17:38:55 +0200
Message-Id: <20200704153908.12118-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ogrpwGCJCjii

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/vga-isa-mm.c | 5 +++++
 hw/display/vga.c        | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 7321b7a06d..3e62389b63 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -29,6 +29,7 @@
 #include "hw/display/vga.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
+#include "hw/qdev-deprecated.h"
 
 #define VGA_RAM_SIZE (8 * MiB)
 
@@ -71,6 +72,8 @@ static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
 {
     MemoryRegion *s_ioport_ctrl, *vga_io_memory;
 
+    qdev_warn_deprecated_function_used();
+
     s->it_shift = it_shift;
     s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
     memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
@@ -99,6 +102,8 @@ int isa_vga_mm_init(hwaddr vram_base,
 
     s = g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
     s->vga.global_vmstate = true;
     vga_common_init(&s->vga, NULL);
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 061fd9ab8f..d59a9c896b 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -35,6 +35,7 @@
 #include "hw/xen/xen.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_VGA_MEM
 //#define DEBUG_VGA_REG
@@ -2262,6 +2263,8 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
 {
     MemoryRegion *vga_mem;
 
+    qdev_warn_deprecated_function_used();
+
     *vga_ports = vga_portio_list;
     *vbe_ports = vbe_portio_list;
 
-- 
2.21.3

