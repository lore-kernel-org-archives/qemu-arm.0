Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3432978lfm;
        Sat, 4 Jul 2020 08:56:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKtEo5KGgK3iwPzgwTZuTBeS6qqdvOQKbuGLO1aguZ2Fq6+XDtb5PJuyjn/60s8wCLG0Kx
X-Received: by 2002:a05:6902:102e:: with SMTP id x14mr10522735ybt.461.1593878184972;
        Sat, 04 Jul 2020 08:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593878184; cv=none;
        d=google.com; s=arc-20160816;
        b=nTGEfoVzqZ5qP6thiHCsmrlJ6kGZJJ5laA6YanVUYjWuRWAcuEeevcs7yoSU2e+ZaP
         hdf1d/eORMmf6V2BWssrj7B6MAiJUqmJoLtbDcH9aLMbVSVRy/QWQmgFkxlAvlKPiaoI
         5VTGTzRCdtF9mrbD0ARltP/gcThdQp45nL0JqqyZKikw15O/Xqz9rCVe6W4nu/disR9J
         1sQpW+MJ+cE23LZpS9v1JGpQdCuZJhQdU+AIJnXZtyJKKSr89m9IrWbpGRSWR4j5/nhk
         x2JDTlCVrXIMe+GtCRomCz1U6H88aFAhLdlLgkVd2lvcl3o8KczXRjbsag+sIcqVE9WX
         4yAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MU7ruh/10BWYTVNZhg+Fh18ywKF1bn8cc3b/vsMMid8=;
        b=oOgAJn7al+VF8dBdGLyGyaPcAL4UrMC97WK9VlKINJ7AzxI6Vn0vodjaGBUC6MadMV
         frUQs8ZmfKhqWJUwTRYas/Typq6Vc3WWuBNSbMBWzmBpWRgEaXmQwIhVrHMsgbOPsmUz
         wsbFIQcjqXYJb2Jgo19v0ucVWWIhLpKlqhciU4BHzxW+g7BBI1mnjf/pSeTEwcqryZ46
         K8RBZBPxEXQJBnwI4cdsEqaziBh9Zkl+6sdDGxygTsldcIrQEg6aJkbUsJBKEATYMip4
         /GAW0evtGl8TJom8pyK2ABtDKRGwtMCx9FtFBYYcR5kq8VpsYNIBghCxmK7mOnv0ZcG3
         onuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MlD+IiGF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q201si14240927ybg.121.2020.07.04.08.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MlD+IiGF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkWe-0005aR-Bw
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHr-0003FF-9X
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:41:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50475
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHp-0008NS-9B
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MU7ruh/10BWYTVNZhg+Fh18ywKF1bn8cc3b/vsMMid8=;
 b=MlD+IiGFwJd5pYZTH424mgv2PfEOcDa5WCvoZI4hrk57QGLbNLDDffFzF9aJf6Mb4cxe66
 Ee5+58CEwu1yWh75ek9Hu3XvlfViAQiC015r6BHHSfN1n3WEmNT8EJpEr9ZHRuzYO0oEQ7
 rY+WpeByaY4UiR21MFIWR6oBHXvok34=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-GUrjB2VWPraKQ_zcJaJBTw-1; Sat, 04 Jul 2020 11:41:03 -0400
X-MC-Unique: GUrjB2VWPraKQ_zcJaJBTw-1
Received: by mail-wr1-f72.google.com with SMTP id j16so30650587wrw.3
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MU7ruh/10BWYTVNZhg+Fh18ywKF1bn8cc3b/vsMMid8=;
 b=m0+WwyAqCaKne1yetzxJ/HQcc3acIEoD3Vv+pc+yt4vH8MHvF2N3DGGSHLWT9c3TDE
 NScfUv0NWwy7xiUljRKGpGc9RTcKaKE353kDoY7PlSrOwKOznjmkDaoDd8daVyioJpjf
 OmQLpM+r/QTdynqo1F6y0mYEUlegBez4iW7ZUOh0uddwh4WTg7WANY9gt4w09sirgafq
 c1eO6VyHkhe0lXPVJd24dYVv9Tcb1CFV3FJ1hhqXKE3nKrRZ/c73Kk59Qy+9H6b/Fg4D
 RKEATMLKuAHfwPdzlonK+lAw05XgPGRoSeiokAa5yr26Q17gfDCyV7+ItuGb+dCK9lR6
 w7bA==
X-Gm-Message-State: AOAM530Ja8C8Tc86jmFkDm/jeMS0c5pxmP6b3GCeEZJPRjSpKtrmt1t8
 DVP/qUu1y4AvyBpMCowYmvf3/uBEtoL5JhIJjtRty3xjeP8KVYSfUUjHrzf7TeSuV2cwAkerTFJ
 z++G5uQdX2Sl6
X-Received: by 2002:a5d:698e:: with SMTP id g14mr44409191wru.301.1593877260078; 
 Sat, 04 Jul 2020 08:41:00 -0700 (PDT)
X-Received: by 2002:a5d:698e:: with SMTP id g14mr44409166wru.301.1593877259854; 
 Sat, 04 Jul 2020 08:40:59 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id b62sm16727187wmh.38.2020.07.04.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 20/23] hw/sh4: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:39:05 +0200
Message-Id: <20200704153908.12118-21-philmd@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
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
X-TUID: VI1KKHXqsEFp

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/char/sh_serial.c | 3 +++
 hw/intc/sh_intc.c   | 3 +++
 hw/sh4/r2d.c        | 3 +++
 hw/sh4/sh7750.c     | 4 ++++
 hw/timer/sh_timer.c | 5 +++++
 5 files changed, 18 insertions(+)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 167f4d8cb9..9366a23dd2 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -31,6 +31,7 @@
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_SERIAL
 
@@ -382,6 +383,8 @@ void sh_serial_init(MemoryRegion *sysmem,
 {
     sh_serial_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(sh_serial_state));
 
     s->feat = feat;
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 72a55e32dd..c90fbf47bb 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -13,6 +13,7 @@
 #include "hw/sh4/sh_intc.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_INTC
 //#define DEBUG_INTC_SOURCES
@@ -444,6 +445,8 @@ int sh_intc_init(MemoryRegion *sysmem,
 {
     unsigned int i, j;
 
+    qdev_warn_deprecated_function_used();
+
     desc->pending = 0;
     desc->nr_sources = nr_sources;
     desc->mask_regs = mask_regs;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 443820901d..5b4d383a86 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -43,6 +43,7 @@
 #include "hw/usb.h"
 #include "hw/block/flash.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 #define FLASH_BASE 0x00000000
 #define FLASH_SIZE (16 * MiB)
@@ -187,6 +188,8 @@ static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,
 {
     r2d_fpga_t *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(r2d_fpga_t));
 
     s->irl = irl;
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index f8ac3ec6e3..82549139f9 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -33,6 +33,7 @@
 #include "hw/timer/tmu012.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "hw/qdev-deprecated.h"
 
 #define NB_DEVICES 4
 
@@ -757,6 +758,8 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(SH7750State));
     s->cpu = cpu;
     s->periph_freq = 60000000;	/* 60MHz */
@@ -867,6 +870,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
 qemu_irq sh7750_irl(SH7750State *s)
 {
+    qdev_warn_deprecated_function_used();
     sh_intc_toggle_source(sh_intc_source(&s->intc, IRL), 1, 0); /* enable */
     return qemu_allocate_irq(sh_intc_set_irl, sh_intc_source(&s->intc, IRL), 0);
 }
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index bb0e1c8ee5..d0740b2ae6 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -15,6 +15,7 @@
 #include "hw/sh4/sh.h"
 #include "hw/timer/tmu012.h"
 #include "hw/ptimer.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_TIMER
 
@@ -200,6 +201,8 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
 {
     sh_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (sh_timer_state *)g_malloc0(sizeof(sh_timer_state));
     s->freq = freq;
     s->feat = feat;
@@ -320,6 +323,8 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base,
     tmu012_state *s;
     int timer_feat = (feat & TMU012_FEAT_EXTCLK) ? TIMER_FEAT_EXTCLK : 0;
 
+    qdev_warn_deprecated_function_used();
+
     s = (tmu012_state *)g_malloc0(sizeof(tmu012_state));
     s->feat = feat;
     s->timer[0] = sh_timer_init(freq, timer_feat, ch0_irq);
-- 
2.21.3

