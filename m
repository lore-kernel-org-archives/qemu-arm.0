Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3148187lfm;
        Sun, 12 Apr 2020 15:55:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypL0yRKoMipDmNv8UvV9izc16kWpBuKqaO6CpUghUJtxXXIJUP41hVfDUYOoK5S1QCoaTf8x
X-Received: by 2002:a37:4d88:: with SMTP id a130mr13228695qkb.443.1586732134295;
        Sun, 12 Apr 2020 15:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732134; cv=none;
        d=google.com; s=arc-20160816;
        b=in78dHs76M8CM0UXYYu5fV4zRBDh6u6kVTJI5yEeNX/1Sl9h4PksbSF5UYmHDAU9GY
         rl5p0m1RufDJap+HtUCjd3RVmRwdMGqKQK+7GdX1DpH9XkAvkp0vla5938gMniOtOV78
         9wmOp7QCPovjK5kDps2SadW0Qf4DgyYbwkbTeJ2BABu8AWlpvkyAYEaDXMaf2boILP2J
         XYQU7G12vBpMr51KmBO3PQhPfSjF4fnRQX6w2x1xYITlJSORBcRHvrz5TkwlpoonF2ZZ
         u+PpEcJjLoRvbTAckkCK58NwR32GnkglCg8uXHMf88JUqcB897FMyHUWGmOvoFvu8idS
         AwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
        b=TL35F50uvIgFHeBs9cacLhWMd89K2zw1vvesQn9q6cvgaHpMhTOTPi69il83qeT69I
         9/225Qe1iCeb6EgxmKOSd7k2fznTfZa12uEN1jt6Eo5I0I7Y6HHYq/fb3RXGKMxkT907
         UfAUnvuDPArgVmeF3d4aBineAlc5d8oHTMGqsvb/CBlOIxpqQln7/d+pJp1Gr1RYCcrn
         O6AgEb5EzaP4sh//EAWvgaCeOiDMReS8HEBCz9+BXwrY8f+fVjrf0h3aMsax7Nc/PV5U
         3nXXS8Ga53yTeVtGue7F7V21rP5BfX3UR8+i3ei52f0ko5j3xQKYEEdPpq6+IpqR7pN2
         +iAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=siCEjIHD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e54si4821063qtc.237.2020.04.12.15.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=siCEjIHD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlVl-00011R-LS
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIy-00017x-0E
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIw-0005zw-Vo
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:19 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44375)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIw-0005yo-Pd; Sun, 12 Apr 2020 18:42:18 -0400
Received: by mail-wr1-x443.google.com with SMTP id d17so1634141wrg.11;
 Sun, 12 Apr 2020 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
 b=siCEjIHDD7HMxh4IxS5LlIjGg2cHeis4GeHzcv0NZEd05t+44glLDFXzjnhEgGdKrK
 QNFLZuYqlDaOYEAwR8wPyuaQ/MzSzcAvI1MK4eODswr/M1mFJOqJcrcig2XYb3EqsD7/
 XNGH5dq8cxwQUkrGO39iUEmIzGNpZtIjTlkGzQD90aigcGn+AniKHUmTsCFY4/mm+9vl
 l6dWLyhK+3sjpBVLN2MDBwv/mu/sQv0DM441GyRbWnlvbsrf61jm85H8n/TIZYGYHQ4t
 DJG5dtAWoZgx1h4M+vwYr27SMW3LTCAZLxfRzVLVcceL4vtv7LM9mQyZqznXrdT0a9R8
 KfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
 b=WZNW50qhgNXh0JEVBldTQpQ1u1j/i30mG85DPCvQrkUn69H75fZT9hAXGt7BjNw6B1
 9F1QcbkWE+fqE5itrsafU2TL2HLDEcGZFT08HCY4SU5mTWw3d1YUAAFEAh4J/fgVfqIF
 tkZ2qaQfLDiAoFoPUFTNiwLSn8bPd10pq63AtV017Hckc9AuGnbwMLh967o2XAn9J45r
 DhjzFuAmJzM8kGVNqZbdga9FMUTr8ywi/t9j3ahFpuw4KXGHEm+iTxFr8WObCFuy7ofO
 Mpll3Ex5Gizte+vyI1HypWbSbovx+1wIasJGQsua5sgJAuIqSKeKEWVQoX2+r0FXAKWd
 hH0g==
X-Gm-Message-State: AGi0PuZ/APNgr7i6II4vMgoFsSZdMUm08D6d8olwfQWuxCCLVHqFHX1S
 KDAk0nTJxxdauhrNLwN3hcnlJLXMV1gdgA==
X-Received: by 2002:adf:f986:: with SMTP id f6mr157751wrr.221.1586731336548;
 Sun, 12 Apr 2020 15:42:16 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 08/23] hw/arm/armv7m: Add missing error-propagation
 code
Date: Mon, 13 Apr 2020 00:41:29 +0200
Message-Id: <20200412224144.12205-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-TUID: xmuYxzg45G5Q

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armv7m.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 7531b97ccd..249a7605f6 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -168,7 +168,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     if (object_property_find(OBJECT(s->cpu), "idau", NULL)) {
         object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
         if (err != NULL) {
@@ -256,7 +260,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                 return;
             }
             object_property_set_link(obj, OBJECT(s->board_memory),
-                                     "source-memory", &error_abort);
+                                     "source-memory", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
             object_property_set_bool(obj, true, "realized", &err);
             if (err != NULL) {
                 error_propagate(errp, err);
-- 
2.21.1

