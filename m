Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3146677lfm;
        Sun, 12 Apr 2020 15:53:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypK1Uyhna88mpkE6F1sCBsuvEnW5G6xHrSy74WVTB0HNHfIAg5DgMHXZe4bBWmnfKsj4CBUo
X-Received: by 2002:a0c:fb12:: with SMTP id c18mr14312891qvp.171.1586731980296;
        Sun, 12 Apr 2020 15:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731980; cv=none;
        d=google.com; s=arc-20160816;
        b=SEvYuXxp+eMKYYqd75guxY+Pf3SHuivR3/1+k7XQyEQP9ZshAiW9uhg1X/qE0V8K0v
         lD+aQ979VIMpLKBAH8joWMC8+kAmlLGg6kT6c7HBCZbvV8hzJaR4AZ9Qm1IM6YsQRSp1
         FhxwLG3sBHYfR8emiukWFhc2XrjYmLaHSY7W6i/N9jVRoMWxD8FCBdePXgIfqzp9BmSY
         3w8W35cf/vBplwycCxHtmL77tSTxsoKgEOQ6Anykq4JbhgEz/GbkJeT0IlDX3KUjqj87
         ok3+jYW490VeclBSisPOz7B4Rb9bXHToAOkWgIAB3b3eSizRQwAq4kdCWtfu67jK0G5R
         +U3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pmelmK+74hZzKF1Ju2OEtzPp85pYogzLjVOdCh3WjgU=;
        b=DWT3oOPqtGo53jeBXgsUgyfj5erVHmHuDXZHBNRO1v7FGfFZPc5J4X7Kn9hoqIPm/g
         qR0X3ix7kYZgZ9Euq3yH2THj/egLilEYrkY+96zbVCFsBSfjIO+osd+yAClZgHHBHX5X
         dRtaVQ39fONBb2II4/pXJSxbaiso0Rh5+ekpFSZuLkyZs9wHsD1XFmkPptBb8giJgKYz
         efIHuqF85dXZQSUqGOHgmCdOTtCbj5dWJUhTGW0iREFLivNEfi46HWggvT+j1qRkVCbv
         ZngldMRvs5IiJOIKieX7fxSEnNQIkcgkQLEFAUP/kaNjNcDMKVoE0NvtF8KK5y8Qvqn1
         HyUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L284uUWQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s196si1953167qke.378.2020.04.12.15.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L284uUWQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlTH-0004xF-Ly
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIm-0000dt-V4
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIl-0005md-Se
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:08 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51409)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIl-0005lt-MX; Sun, 12 Apr 2020 18:42:07 -0400
Received: by mail-wm1-x343.google.com with SMTP id x4so7944028wmj.1;
 Sun, 12 Apr 2020 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmelmK+74hZzKF1Ju2OEtzPp85pYogzLjVOdCh3WjgU=;
 b=L284uUWQdVDPw2IQ2bd+/tlSTLI4vyVysyhHVO3o6dBMbjorw3dxS650t6mPU/Sl9+
 Ws4husx/2DpuH+8AomDjrRuDsjdSP5xXAa8LABnXECWRdMifV7lFadX2h+zhHVSjlPj6
 n1yD9LVt7g2SON6evL3IKLQ1YfyQkCD0PrS43BBWiP+VUosrFZBeIyvn+ahjdwrIs/5Q
 oSf476BWlPve0N04a2TgHt+/j77cFI1dgyZN84fBwhaCwZF0qwEaIM3Huqt4Ba+o7dJD
 5DCq4/PDwsFQsLVL9+9maOtXFE6tPfQxyp01ggprGh0ziE6muPUQjWR0jNGETD6iZPHi
 6opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pmelmK+74hZzKF1Ju2OEtzPp85pYogzLjVOdCh3WjgU=;
 b=qaipCUWVPclV7QlfYKH/36JhS1yJnENdmxDck6+8quq0CTXCxPxxOjQuHsZD/cWNba
 u5OFq8E6ztyQ8ONVYttYKj/qlHp1hni31QsPl+6WDIGyEBc9duWS+/KQ1rLBl/3QH72Q
 UbgVWteWW8vp/ujmmrL2CMV2m0dw5V15Q5m6KTMzg/Hy64TynqfFWEJgIPhi7PjLipBs
 QEBZswSvLDugDWNEQyqchbEehm5dG/b8+M9S20mpLCAh1fSzL68ZRFogosCHApgzafeC
 IdsEO5HFw2VBB2iBzfe9Sl14n/vn5KrvVgpoDmJgAaS/YuWJ+pgXG6nBRTfE/Fl+6Hh7
 ldLw==
X-Gm-Message-State: AGi0Pub4Z2000MaUB67UB9HRR2UEVYJtaDmWtvNmbuX53+bB+yUQw/HL
 unBJb/9Au0XZX8TLN3ojMn3d12NIugjZqQ==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr15866438wmi.88.1586731326418; 
 Sun, 12 Apr 2020 15:42:06 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 05/23] hw/arm/allwinner-a10: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:26 +0200
Message-Id: <20200412224144.12205-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mOM5TQtRhaVZ

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/allwinner-a10.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index f41395734a..db70aa2b88 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -158,14 +158,22 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
             object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized",
-                                     &error_fatal);
+                                     &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
             sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                             AW_A10_EHCI_BASE + i * 0x8000);
             sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                                qdev_get_gpio_in(dev, 39 + i));
 
             object_property_set_bool(OBJECT(&s->ohci[i]), true, "realized",
-                                     &error_fatal);
+                                     &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
             sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
                             AW_A10_OHCI_BASE + i * 0x8000);
             sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci[i]), 0,
@@ -178,7 +186,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->mmc0), 0, AW_A10_MMC0_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc0), 0, qdev_get_gpio_in(dev, 32));
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->mmc0),
-                              "sd-bus", &error_abort);
+                              "sd-bus", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
     /* RTC */
     qdev_init_nofail(DEVICE(&s->rtc));
-- 
2.21.1

