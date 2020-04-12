Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3147987lfm;
        Sun, 12 Apr 2020 15:55:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmheTEzUo60qTqrScEiqbhZqYbnmC8C6hmx9y1E/k+uNa9pRJXwB7Qv9jEkTt7hUCkX2Uz
X-Received: by 2002:a05:6214:17c8:: with SMTP id cu8mr15138419qvb.178.1586732114698;
        Sun, 12 Apr 2020 15:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732114; cv=none;
        d=google.com; s=arc-20160816;
        b=Ef2E6kbGe3vkJCOegDzBWcSUYlxZ/vSel0P1lGFYGbUjICFjmE1m3w7A8/MzxQKYAZ
         OEOI9iLFfUg1hj4yb4r2A63XD+9XV0tqVAQNGOo7GDlGLYmjWMF6j9RyfdlsDn3zSzc+
         5pYkZIn1jynaT9n8z25jcAsgIzfzl8X3Ehhkhq7XxLfgdJr6N4+16HNUL3DOJLMEvmCJ
         bsDuJtm+YxAtYRtw5qG8Fr7O2Zu+pCDDotIDvX+q5r3SxPk1X1Fpt0ymCmj27sCeFYU0
         n2p0EzHRqZurhgEHK5N9I5eIeK0w9LQI9W5KkwLY+Hbx63yBTGTju7j5/im6+w3/B//n
         58zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+O8FSNw/XveJvWULa4+Jfl3G5r6TBg2LXwiWGWDolCA=;
        b=MSfIN8e8/KTuJIhzwn63P6v2seoSqjOUdSW/CFzQ6JMMrrNS9VpMpmgPXHPqyzuGeX
         C28N3vHUMaNsk3sS9ptqrBovqw/wYYWz7bwEV6jLymRGxyCkRHnP4O9msT+44biKJP65
         5Gbi4vLiOI2uGsLJqQ6LeI9ZGQLLC+vzQxkjm0Kdsvn0Ju+rM5SYUTj4UcmWSiS0yP7R
         X4hddERqwR0DSyikrIi0NLV1NrY8oxQz9xRF1Rc7qeV5CyqC+Bn0OxYRNPOkIlZOiplf
         FBylcKrTdkRH0UJFDPsDBiThJln1i1QO9LBG0AznuWm2j1xjA0mtXMWXHdLok1Dj46DS
         gloQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JghYvfP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si4909506qkb.287.2020.04.12.15.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JghYvfP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38189 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlVS-0000zD-1Z
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ8-0001au-A4
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ7-000669-93
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:30 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIz-00060p-1b; Sun, 12 Apr 2020 18:42:21 -0400
Received: by mail-wr1-x442.google.com with SMTP id h9so8535752wrc.8;
 Sun, 12 Apr 2020 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+O8FSNw/XveJvWULa4+Jfl3G5r6TBg2LXwiWGWDolCA=;
 b=JghYvfP+OE/gAaq/k+cmw+2Cnl+0TTmOt8CBP/wmQxsJlyVf0LD4yuAuTnaqH7E3sh
 gKBJK18MKq1hOPHqbQ0z7G/6xjnUF4pOu1jZ31vWP42WkDuXGr7qkK5H80E0okppPU9h
 OGjA2noOGYb3H02VQ6W3c0xiC6X/ZCopm23cocS/K+EjZS/Wu3Y36MZ6rmY/uLJruDTA
 HqB5DGm7XAYgoUzcZ/ktwSnoDBzVd7qHbPLnMcuq75XMeULNER7wyhfm38wDttEL/mqW
 bRQetBsR+Sj2uPvuStv3YPCwtPkJ1L2vY49CDQdOTLjnr7fYgq8kmnt8Rjdn1IQ+ToNZ
 YrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+O8FSNw/XveJvWULa4+Jfl3G5r6TBg2LXwiWGWDolCA=;
 b=edadRrr9M6/DhanRZYuU3zSM9ckRcRaQX4oiF1raFLlRmGGb/uQXQmdxPWS3bFxDDI
 qgK3+kmpzcmG17OkPV1UMMvIOSa+TFHUcNZASlkQFcffaVn/89qO/xd8eqKhB8/4ZHDB
 uKkrGsw2B8CTTOnhXKjoQmR42BDVlMG/8a95sew+MQYdh4vdcRcUTcjyZvjVk18tIepW
 MZgKMG7M6udegEUeLJCPhQRZNU56JhAKTiXkIKF09uP9NgDFZv3i+7btGvfR4xp2NAIm
 ZRXvO1byV6AGE1tY3n/50CmlZnT+qAKxycAH+LES2dfbUNJ0qHgAI7S7qzQT5INy6633
 o7vw==
X-Gm-Message-State: AGi0PubWAbBPIOWh9ev+NGFju3hV+ebLyrfvGKL697az+MaBtHGVcKxQ
 3QtUNcSeIFbMTxacSVGFrzU/g4OEgXL+Hw==
X-Received: by 2002:adf:904e:: with SMTP id h72mr15645835wrh.367.1586731339864; 
 Sun, 12 Apr 2020 15:42:19 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 09/23] hw/intc/arm_gicv3_its_kvm: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:30 +0200
Message-Id: <20200412224144.12205-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OSx0XlFhmswO

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index ad0ebabc87..3d2c4e22f5 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -101,7 +101,11 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 
     /* explicit init of the ITS */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
+                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /* register the base address */
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
-- 
2.21.1

