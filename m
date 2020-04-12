Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3149909lfm;
        Sun, 12 Apr 2020 15:58:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypL/dEjlWrLf1HhCoeMraho6/k/7QvcNZnCy3/BcAWnR6jrZF3nSzTSdY7vuzlFg+EZob2nz
X-Received: by 2002:ac8:6919:: with SMTP id e25mr8902742qtr.151.1586732312042;
        Sun, 12 Apr 2020 15:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732312; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAJw7aC9pavSNAPVWj9h3GsBG4Qx59gHK2F68Nz8JScMbi4fujv58UALrgQpMMJa92
         B6dKiVhv3aJW+ZwFZ9dJuLdQfXf7KBFBqpGNurfvRgfUxv8FUP30wnUrn5SoykUAY17l
         4Wr2fNjfRfBHAul23bI1AFol5gKOQEAuo9BBkBMrMJAPl/QztxZZk8Bau/ISB0Xj3e7O
         mPNfsetbJOj2msr+YuhR3YaZByyNT9OazGsksr390/GWfBu4U08TMBYBOMAIvGpBNT6m
         uU/nBqkD2FZLey24OHMwoW67U+Qis8gajP998FotIUdMjZRGqfYs6agVUGDCfNEpqmLX
         cs/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+bsGyQcFnOKVG+Bd26nlz77NXbYaghgLj/LaGKCq2kg=;
        b=GubQ9e9IgjE2ge2T+lVhK72FvwjgtDcc7WavjWSnP5o2CFG1+uQifRQtbPXm3sR4no
         ZnZI5NmmZjgxJX42tTqZ/aLdCUyg4bP3jWgOCwWO9clTZAdadsLm26PaK6TMq11xttbP
         sWuSAZH0/ZWEweEtwfV3Ow3/8RSFZp+byOpLWSvquJknlkNhieX+ariGLGL0g/CjyiuR
         3AspFBZlpxfFeibfo7/6gb3QJWfpnQPX419MT2lm2VWqtHw2Enp8uha1if20o48Pc76m
         FT4hRyLWPJ5LAtQGaS9Q/TijeVl1tEd8U862jl57iYA9JgB23HgilSyR4M9Yht9jhntj
         pgNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eX1sHVHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si4839712qtt.391.2020.04.12.15.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eX1sHVHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlYd-0007Gq-GT
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJP-0001lQ-9x
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJO-0006CR-7Z
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:47 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50925)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ5-00064w-QH; Sun, 12 Apr 2020 18:42:27 -0400
Received: by mail-wm1-x341.google.com with SMTP id x25so7955571wmc.0;
 Sun, 12 Apr 2020 15:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bsGyQcFnOKVG+Bd26nlz77NXbYaghgLj/LaGKCq2kg=;
 b=eX1sHVHFuIK3nQOfDgpUI4eSHXXSXBdHrE2Z9B+eADHZ/Su7CQv7no+3Wm1oDu5hjP
 uCALayhitW3NdTg6VSgUDQdfK6Y6s0GIhAqQkRWrTm0lKZei3Pb+0iPWelRSp/ddF56S
 un0GGUF1lBg6V5w7dZtxOD5W7ae2uW9uLdqHMjpCewfzCJ2w3aF3Xbcix3QmliMISYeO
 dIx7VVZwCr5dZfan4td6wq8ay5fTtmOOiasgVZpML7BdJ7pBD5YfxWHMEfWH3vhocesW
 1dx0ennI7jU/H8qAkANDAYyv0nCvy0pHlJ+kq6Zs5jpzoKQfwMQ5xIf1BsqQirePWXFE
 Ds1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+bsGyQcFnOKVG+Bd26nlz77NXbYaghgLj/LaGKCq2kg=;
 b=uYMPnm3B3B1Mir5/sexGlx1lPoXXNmYjdt9J63nFU0l6grPN5T1P1LmLTpzRNEw/mx
 h7JhuDriK/rbM6jDCevHoZAdVpTjVf3actX1q7P/c3oGYp2dP0Kc4lSaD6GQePwzvkEw
 VGyAecasjY9U2y29OETJiann8/SSEa0U3eennYB0wxxMTptVE7kw+McYzlob58JnaOUt
 uuMfD8jU0eNhH7ty6sHTB/JXlD0RZXHIXL91H1ddV11vzCjELR2+w4qL/RxxMLUjzpl0
 iLQ4Mz6vB568Ckahw7GeMIk8KI/coCfjSDBpz7e5rOT1iupdYHMY0pFVGKKePfFxopiZ
 O+ag==
X-Gm-Message-State: AGi0PuZceENVL/QrxzPVZAiDr0tKafoFO0kOtm5reaWllj7QQeyGprbN
 pyFBk07c8vuymFXVu8n4nHVC/A1mHd15HA==
X-Received: by 2002:a05:600c:2218:: with SMTP id
 z24mr7938056wml.82.1586731346690; 
 Sun, 12 Apr 2020 15:42:26 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 11/23] hw/pci-host/pnv_phb3: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:32 +0200
Message-Id: <20200412224144.12205-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-TUID: r0eEGsTUqYOo

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/pnv_phb3.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 57d717ed23..a9029f5a02 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1008,7 +1008,11 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* LSI sources */
     object_property_set_link(OBJECT(&phb->lsis), OBJECT(pnv), "xics",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(OBJECT(&phb->lsis), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1023,9 +1027,17 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* MSI sources */
     object_property_set_link(OBJECT(&phb->msis), OBJECT(phb), "phb",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_link(OBJECT(&phb->msis), OBJECT(pnv), "xics",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(OBJECT(&phb->msis), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1034,7 +1046,11 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* Power Bus Common Queue */
     object_property_set_link(OBJECT(&phb->pbcq), OBJECT(phb), "phb",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(OBJECT(&phb->pbcq), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.21.1

