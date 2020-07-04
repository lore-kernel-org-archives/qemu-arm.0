Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3426771lfm;
        Sat, 4 Jul 2020 08:46:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH4T7MkkTcJ9gO2PR0g11HUT5rTMi6z7xf9i7Sq7fJhO/mDkE4vqmfaco0IRL+3BQW/j5v
X-Received: by 2002:a25:2e43:: with SMTP id b3mr66978010ybn.190.1593877563123;
        Sat, 04 Jul 2020 08:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877563; cv=none;
        d=google.com; s=arc-20160816;
        b=Kq9FOz8OPxlYcMBURl2TciCwJoGx8gZnZxcaeNUrS+2ATSs/ne58tiHBZpjjapKyoC
         X3oSmttCCDsa/uIQixCUoTG9/GtiR5INX3957sa1KX2X/IR5q7JFUJ/u8v0s58PmlSYi
         ou1GPSavZUF3GEP4vlgcFXUjgB+DMOaOKQAJJBlxN5K0q74nLipyYNWTBEg3MipX5n9Q
         Ld5EHN5i+v+QDI51agUdrYHZa3ShxYA8m3NEVAfBy1xFl1p1nyqeUPMi196lP+BSsErJ
         stqW2QEpe/FZgawuBbJTnM5Z8axXVvp8cNadTS7tzEFI6oUNj3MJCrpZN04evnZh6oBo
         wVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
        b=Jcs2PgqGS4uNRRmiHSTZvUiZiOQA9XP6iVwogLzdzpXN0NqkYtUIn8n0Urbn+Sp3GL
         tC+/mDNvfBjUc1gmsRfls5n2lIk+y0HNXHYRa8MBytbQVoMC9q4hqZ5al+51FMhENt0U
         IrzMUbZT9ka6e296VQAOwyq3/RgU7HY3QYLeEkpHhpMkB+UDE1WhFMZqMRxXD06b05kP
         1w0BvySPRpdpjd18qvTe2Kk+PaG2OmiNSQPA2yHEHe0XNq9+9xTT3Zlx9he11/Pmxe13
         NQdQYPuxjF7IkfB4riMYue4vhOyXgDIEHmKDjjAUELWpO3sJ4IAPiNmBb580OfZ+FtBv
         XjfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EklGo+n/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si209627ybg.373.2020.07.04.08.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EklGo+n/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkMc-0003EW-D1
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGu-0001p4-8T
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38139
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGs-0007gM-Ci
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=EklGo+n/WnsSnP4RjPQNewp1EUQG6IfrToSDa9IY0SGXbCeFYXuSELk8OdGuaxxFIGDv9n
 pEJkO/sjLXdR7vmI06WWc0C8kKlTZsbM1TZ3+c80iaUIahNWhjWrTm/fl9uU6o/eyb/mA+
 UV53MJ+eA4qkJwZmrqZ/7yuve5EALe8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-rRzjwLM-MIODWwvpYqQjTA-1; Sat, 04 Jul 2020 11:40:01 -0400
X-MC-Unique: rRzjwLM-MIODWwvpYqQjTA-1
Received: by mail-wr1-f69.google.com with SMTP id w4so33991421wrm.5
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=XIvjYqJXaYR4941jvv4Zi+b9533JPUO245Qom269xukzmDVP05DWHXHM4GpbORMz56
 o+mS8sxhWtqCS0Sthd3NRZmaOuJOsFTfbEVWICYrHZX8/V+d96uGyI5wj6HWFZR8iTHC
 z+NNC+bxta+rGiZeSsHTcSnSyNr2Xq2z9S6LvKZLEFbZOT8GKfXpomMh8uuBDOjSYuPL
 P1DXrQpOSmmSwtiRyqtD0xJQgvgIRykXPoJ3d8iOHxam3ohFH51t9SFJ/Ghzas/ASow8
 jtr+Ov5V/E3QE3MXVoAHEd9F8QyntoiYcDeElOf/a6XRdLrMXNDUQNJFkMGW8tZZFuS9
 RREQ==
X-Gm-Message-State: AOAM5310XWcqLtIw9LnknkUiVDKP/LdUneACvcknYnuFX2qUzNgyWXO0
 f/nyJAzi54NiSmL7KQub86vRgsHY3S7qHK2SScNj2qAw4Be8G04hk3s4vonnpljQan+2jVrEeYq
 fdsv+KauD3PTx
X-Received: by 2002:adf:e701:: with SMTP id c1mr42222360wrm.350.1593877200718; 
 Sat, 04 Jul 2020 08:40:00 -0700 (PDT)
X-Received: by 2002:adf:e701:: with SMTP id c1mr42222337wrm.350.1593877200575; 
 Sat, 04 Jul 2020 08:40:00 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id n14sm17970909wro.81.2020.07.04.08.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 09/23] hw/display/tc6393xb: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:38:54 +0200
Message-Id: <20200704153908.12118-10-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
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
X-TUID: 5WA9B7qVKelz

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/tc6393xb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 49a676d1b0..e4900e9502 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -21,6 +21,7 @@
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
 #include "sysemu/blockdev.h"
+#include "hw/qdev-deprecated.h"
 
 #define IRQ_TC6393_NAND		0
 #define IRQ_TC6393_MMC		1
@@ -556,6 +557,8 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
         },
     };
 
+    qdev_warn_deprecated_function_used();
+
     s = (TC6393xbState *) g_malloc0(sizeof(TC6393xbState));
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
-- 
2.21.3

