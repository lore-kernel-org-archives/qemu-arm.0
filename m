Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3424669lfm;
        Sat, 4 Jul 2020 08:42:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGtAHzApIj/4hIQeyqFfe1sG96psT/gegslU+2QWCotZGYlVty8hD7O+ZsNfjYefgleWNY
X-Received: by 2002:a05:6902:4ef:: with SMTP id w15mr1982430ybs.342.1593877365810;
        Sat, 04 Jul 2020 08:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877365; cv=none;
        d=google.com; s=arc-20160816;
        b=KIXSHpu0P4aqP2vZHd1aonzlFLT70XyQQvFYMV6q363tnxA1Lbam6EXY8eN4OOiFcL
         ikZI3t9JKpDVEhM81jLuhtZCwsNjVbJ3u6XU7H/2sT4LLSLJGpNSXhedlm3gUrSarJvI
         z+Ta3Z8O+TZ3yIhDLTDRxShQwSmBd+fwdpOYA7egE6lic0ETyepM63MdqHY8EgJNUg10
         FOfHB+98GYiDxMkimtROhjMoAu2cDJ3WBoe3L7gdBl0oUp13DF0hO8aF6b9caNEyRgHh
         XhVvpMDDmpIHPfGE8ImGh1ZL3NF5yEefrALlB7j70H9ejCF3JcgHBBMKuegy3svsECu5
         YewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wUMsI8pPCoJLWJQxhYCjSGYgbzwxCwXM4hINsxgIP8Y=;
        b=hfvSQw4jcwDgvcvAkXQFNHtrchMsBlNvzaFWf88w2A5nkgaaYe5E5w82HaCIu82rTc
         P0RtFTOk4qlnHuNDgL6oQw2gW0IMzmwNKXn1AoR6VWadRqyJfGTx75FWUabQtsKDCZeC
         o9hhybqlK4rtSqFHdVVrCb2hRpg0GJJxXSEdkDfRmBXWNkm7lcT6kl/GdrY4REnMRldc
         5tie9vf69N1aiiWalSBsrQKjOpooHrUn+juRdxWHoNMhp6zg4TGwBltgv7emWH6HEGfo
         4dqWg6oR8C97RPOZCaWP6+n2s0+PFj52biih+frcz8J3nsy7AQEJzWnPGNfHoNLuuCr7
         I2sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h7KWcpfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r128si14325398ybc.354.2020.07.04.08.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h7KWcpfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkJR-0005gh-4u
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGU-0001FY-I0
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59929
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGR-0007Vr-0P
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUMsI8pPCoJLWJQxhYCjSGYgbzwxCwXM4hINsxgIP8Y=;
 b=h7KWcpfm9KduiEDZxR5gYa6nx79ZGGIqdfCoa13ugWsdMpkjWs2R27EESXegfbvsxBTR+j
 WTw0ki31XCNKiFr8EF115b52ZVh4oq3QtyF6UN9Bk0zCHAhZ/zJJJmP0rYrP9wIvgLOGLL
 NsrqxjPVCEqp7xGgY64EQrBXHzQ2yVo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-mZgsSfy6NECyKeplQ0uRTQ-1; Sat, 04 Jul 2020 11:39:34 -0400
X-MC-Unique: mZgsSfy6NECyKeplQ0uRTQ-1
Received: by mail-wr1-f71.google.com with SMTP id i14so35794900wru.17
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUMsI8pPCoJLWJQxhYCjSGYgbzwxCwXM4hINsxgIP8Y=;
 b=JsYM+6KVIEtD1qMbCdFGsdaOqCHFcQKquhOwkm44tfyama23V+wKIpKZ6q7+vj9KMw
 Q6EusTpYy+0G5O5eT9It02w/qiOViaqjExZr5Qi0p80aRFwORl4l51U0aAIgSYbU17ue
 /zWPJpZSeAqaJ3VhcTRaqr/FsbRaneKY0qpXTggtF7L2sfTJA9czmGBkg9ww8j8m71pK
 SfgCv2r48OdpsfkM4Eusk8X70lfPXOcF1FMWivOiAGrHCSzkgLBXDcL2YLZ5koupyTyk
 A9+MML+i9PB+OJ2yBQ0tzqvHkmib2MZEFMPAFByAf+26qt6NkL2uNNocjKUmP1M0x0KX
 qQNQ==
X-Gm-Message-State: AOAM533sJSL0JnqXs54zWeGZCADCCrMKwMKPAfZ9LHckaIgwRcGrd5gg
 sz6goHHHRenScXbTOk+juzgfjHDsyYrkcARTDodOG79B4QQQgfgX/EkaRWLcq5xF1+2pS9tE+jb
 jZkTqDXe3b1VN
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr43727427wrx.178.1593877173362; 
 Sat, 04 Jul 2020 08:39:33 -0700 (PDT)
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr43727419wrx.178.1593877173151; 
 Sat, 04 Jul 2020 08:39:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id e5sm17685316wrs.33.2020.07.04.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 04/23] hw/arm/pxa2xx: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:38:49 +0200
Message-Id: <20200704153908.12118-5-philmd@redhat.com>
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
X-TUID: 2BTY+OKDrUO+

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/pxa2xx.c          | 3 +++
 hw/display/pxa2xx_lcd.c  | 3 +++
 hw/input/pxa2xx_keypad.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f104a33463..adc7263e59 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -27,6 +27,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "hw/qdev-deprecated.h"
 
 static struct {
     hwaddr io_base;
@@ -1768,6 +1769,8 @@ static PXA2xxI2SState *pxa2xx_i2s_init(MemoryRegion *sysmem,
 {
     PXA2xxI2SState *s = g_new0(PXA2xxI2SState, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->rx_dma = rx_dma;
     s->tx_dma = tx_dma;
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index ff90104b80..cf6241ff21 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -20,6 +20,7 @@
 /* FIXME: For graphic_rotate. Should probably be done in common code.  */
 #include "sysemu/sysemu.h"
 #include "framebuffer.h"
+#include "hw/qdev-deprecated.h"
 
 struct DMAChannel {
     uint32_t branch;
@@ -1011,6 +1012,8 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     PXA2xxLCDState *s;
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
     s->invalidated = 1;
     s->irq = irq;
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 62aa6f6b15..6de1e9e4bb 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "hw/arm/pxa.h"
 #include "ui/console.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Keypad
@@ -316,6 +317,8 @@ PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
 {
     PXA2xxKeyPadState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxKeyPadState *) g_malloc0(sizeof(PXA2xxKeyPadState));
     s->irq = irq;
 
-- 
2.21.3

