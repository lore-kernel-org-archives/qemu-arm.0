Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3147162lfm;
        Sun, 12 Apr 2020 15:53:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNwu+qt+Zzxp9pXmSASYcpG2bheDJ7uCXe3Xvwrq65zDk27N1cIWq6UGD07d6ww5SgC0D7
X-Received: by 2002:ac8:33e7:: with SMTP id d36mr3967874qtb.33.1586732027229;
        Sun, 12 Apr 2020 15:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732027; cv=none;
        d=google.com; s=arc-20160816;
        b=UBE/2Lm+AVbQ9UvVsE27JzRkgK1hdAnmHmhr2rrevKovHp9oT2Ow7OzWmW5N/ypPcV
         AoZlZ5atcG1UQaMCIhJbRtCxn1lRIuUnDU47Foh+OdzgZEHgdEZaK/iVSCbWsA+KSLZh
         sJBIzmbXDHh5Plwr2+8rqzdUWZXu8PWnl1zck1OzJ7Puv5U+12iHQGQlQLQa0bdM68Ty
         JqpZI+R93mh/MlJ0PoUBQ0Pkopwx6DV28xz+xZH6HdyyZ88H0PgAPonfqRIrQhgMKO4+
         MYni73vS5Ram2b54BqG7Y9PLkigmDJqdC8I3fQFYPsLNWXkkwUIn0h2sx7d4yeL8K6r3
         PgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
        b=BGWHNwlww78AvbRPrqlqQVYZh/MhlszGP4BUP5GBiwTr0O/jnQ8ujASVop7F64G0KM
         zoeUIwZXhTw4bx27pxbXN36NJx5rWtd36OGxoPwbkHtBBtvc5QjQWUTIyqgDRQf5Fn+l
         ELnIe3NhFVvdxxgdOhkVQ3uRWZJ4KHET+YZKC+ZaeHGiQlKGDPWi4pftytV1mobuCn/N
         w1VlBtXtmuHVfA1M1X1KbXq2tyiuC7IfuMPjNMF1Z+HkgKXWfQKE14Lm8bKi6Vq9oCwt
         ix+BW0b76mYmsupJPXVUVHAtRULXt/F0qSiUHhhY4iMONTUibSstNeqii9S/9F55CUOT
         kHJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VwEg30j7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z125si4974869qka.82.2020.04.12.15.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VwEg30j7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlU2-00072r-K5
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49466)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIr-0000rS-AR
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIq-0005tG-8S
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:13 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIg-0005dJ-4x; Sun, 12 Apr 2020 18:42:02 -0400
Received: by mail-wm1-x342.google.com with SMTP id r26so8425330wmh.0;
 Sun, 12 Apr 2020 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
 b=VwEg30j7okioBqC5v8hh9XNEyUEYRALhR2q0/MnYPPK7LyE21JtGuoVyV0NXjAsDeE
 W0GWYtStFWWOKyZkl28oxnjsb+pz1XWK8VGcezDQtttU1Z2u4eW7JmomrUMR1yn1xd7V
 7TUs03mj9nF0gln12G0GI1j2sRegPQRLnT9sV8y5/ZYayK5iopYAmkss4rLodYk6oquC
 9zIXcsbvPzZ24mWl8pJ1g21LbigEV95opjpkBNSPTFSsv74W6D4h0A1egoFrSTogUnbH
 rY6YggXdoxYCgblP5ptbe3tCwVzNu8aitBsCiTyQpnjxL9jaxPnumnNLiglUlr1WYBOY
 YMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
 b=pk9yVtD4O0vmbl5a5fapNyE5mgLvk9WJamnTcsIl2Rz69c5zgftxA8QX3BtvVKUu96
 mTB+7fK+Gq5IPQRXmeUNFae5lnPJ2hyKjNDNN9i9rvU0Uu9ALsUfoRjZlDPcsgSltiAb
 YYHbXE1ZQ/pMpRO5soR6tjq+QLdbf7LsHzNsLPkIXz1F4MJa88UPOm+jpHN14FqqJi3q
 oX6M4ypD9znq1s6uJ8lpH0KefbC7uDHeE2F0/pJ958o24jSl4HDQcLaYWbzuHZ0X0y+N
 nUeqJ4z3VtmhXpc64x+nQWV7MYsSj0tZ+4aWimDyPb1IrhfvabPbegfocE/bQa5WtJrc
 OZHw==
X-Gm-Message-State: AGi0Puavvl2hGEh8msiyObLGOsOn1zPv9GG4EczDMCgjfCmwwHJyaTiH
 1d7SnUB2nGRVTU1pb6kndY82FMX2hITMbQ==
X-Received: by 2002:a1c:1f8e:: with SMTP id
 f136mr15479105wmf.166.1586731319651; 
 Sun, 12 Apr 2020 15:41:59 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:41:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 03/23] hw/arm/stm32f*05_soc: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:24 +0200
Message-Id: <20200412224144.12205-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
 Alistair Francis <alistair.francis@wdc.com>,
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
X-TUID: LrbCn4DFBgGK

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stm32f205_soc.c | 6 +++++-
 hw/arm/stm32f405_soc.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 76b0b0e9be..b1be4fde40 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -106,7 +106,11 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
-                                     "memory", &error_abort);
+                                     "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 4f10ce6176..2b8a84a695 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -121,7 +121,11 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(system_memory),
-                                     "memory", &error_abort);
+                                     "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
-- 
2.21.1

