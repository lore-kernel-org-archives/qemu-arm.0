Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3152500lfm;
        Sun, 12 Apr 2020 16:02:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypIb1CqC3RTwVu5HPGqLWy3tlMKyj4kRhhlQxloysF1s55vErq4R+Wb8Qe6NwEF7dLhjI03O
X-Received: by 2002:ac8:664a:: with SMTP id j10mr9179200qtp.167.1586732519992;
        Sun, 12 Apr 2020 16:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732519; cv=none;
        d=google.com; s=arc-20160816;
        b=S9/j3hIgTo9IwLKw0oGsWcySYtt5zq8Q6+UyTtjIFGzPdkhnOnjJbMam7hZB32UV4k
         LLcv5jOC3RDjh6ZYNec2C1Vkcu+LoYnhJaq7ZacsEcvWVPRc6qazzXO9XeAAMXZD6n83
         DguEYMbc2Vojvt/Lr9pC1qt+vDxFFKZCM688yy3SR+JfcjrbUqRJxniulDtLjBNnZPgm
         ARdZBGx2kupQA8apHiOSL6tv7oZX0tMdO3Ina3kCFK3rxDv67FQbxHEh0vQa0FFU30lE
         geOObFQWC1P9va/wxF6iCqebSqFUoo6hpcA1I9mpCMh1uBXcEaZ7lMFlsyqzrMRQzEXf
         Wh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tmj0eQ/jXEgx8kgOc8dKTvgUtekWQN1v/ToBNcJYlPA=;
        b=k9nNNiiFPxqHHBBetuzsjOMl3iLlK+9RSO/6WB+ApByHU7ULs+K875fQx1IIxfmqsc
         CkeAAUvyXbJbzsM0LWujk4rMN3oMYYvx3wWfo+hiDz0qkwe8OZ2kQ1E7cG+uIc+ioZEB
         SIQ0v55vwZRu0RgdU2XYGTXjoJGsJ5bCmKCRrCzN2oJPTTTE7stF+ka2OFEeotFyBQwv
         Zclu1ouLujUR0tmtnizqizLZkR42fVl9Jxbogq/L8gL8/Yy0a//rbY2VL1IIcjohrD+b
         OUjnDtwqR9HfQBAGO4gyxRZtqQm2Oes+OlDxE9j+2RkI5dCYaTxrHKqrDH6m//jCoSZ3
         05OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OB+27OH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si4661381qtp.253.2020.04.12.16.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 16:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OB+27OH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlbz-00063C-EW
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 19:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJY-0002Cf-MH
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJX-0006KD-Lu
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:56 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJO-0006C0-8l; Sun, 12 Apr 2020 18:42:46 -0400
Received: by mail-wr1-x441.google.com with SMTP id j2so8531138wrs.9;
 Sun, 12 Apr 2020 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmj0eQ/jXEgx8kgOc8dKTvgUtekWQN1v/ToBNcJYlPA=;
 b=OB+27OH38nTPemyz5GLpHLn+gLiy1+2phP1VkwRHRb9clpZasalIFwXgdCZOiG0T1S
 kXDxK6p7cs6uKkmwWbFOZ2JVfZS0c+DAdojdrDHkU+IyGLMwlbhRK4D+un6iFEqe+UL1
 Uw1oxQvhYTBMtYkub0PXN8BOYbT3KmUqOEJCl75A3lfl1wgU3rkCLmeY40D02nlC1rM5
 nroWb2zoX44Zf/9KZZg+ndGUb2zkr0ZniUbtY7LAFB+DveoI/HXephWZN/Huw3sqDUMJ
 UPNJRgYquq4hoSNevkYSB19Akbxkj/qWFb0MAbDHU3LGtzdFguVgqcgD7QY7EB4VgqRD
 GwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tmj0eQ/jXEgx8kgOc8dKTvgUtekWQN1v/ToBNcJYlPA=;
 b=Jq+/vyxzJaNnMARJnsTzPywNAyxnfrXMrGNlkL3Mm1Q7kkuJIhKhwvdOGagDoVxKzx
 DkfTh81gAkW77Yz4c0kcCcXQmbXR/rGxFxpr9SIe2mf0+ePos86n1fYPifTz7VNjX3XF
 8V1nDK6CQmZwzCCxDH+XR4cc/I8ge38UeB4ri8ZLUqfAxxVTY5+8XGt68hSUDtla5UUV
 F43Xv+x4y51cadFUNINAfW6DwniehbDj6tuUIqKtidHWu/mDyg+iQxOGc2TjCby8WAQ/
 9Gw3u4x/61Fh2xQU3X5qCT3QcP+5fBDJR707XoF03EDbvGTBhptJgcU1RuQpcxRInLAb
 ES5g==
X-Gm-Message-State: AGi0PuZQSKe4V1s5nJRqzd3HAx/H3Ia/Z/Re/tGuPobrx2BN+RYStsrP
 BkgICM7suxfRU97GbrsvdYo5J31mWxOL0g==
X-Received: by 2002:adf:b1c8:: with SMTP id r8mr15633926wra.218.1586731364735; 
 Sun, 12 Apr 2020 15:42:44 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 15/23] hw/arm/fsl-imx: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:36 +0200
Message-Id: <20200412224144.12205-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-TUID: NrmsYQkLIpar

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/add-missing-error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx25.c | 8 ++++++++
 hw/arm/fsl-imx6.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 3d87fe867e..69d8645dcd 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -271,8 +271,16 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
 
         object_property_set_uint(OBJECT(&s->esdhc[i]), 2, "sd-spec-version",
                                  &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX25_ESDHC_CAPABILITIES,
                                  "capareg", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index b3cef5bb57..c254294a70 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -343,8 +343,16 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
         object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
                                  &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX6_ESDHC_CAPABILITIES,
                                  "capareg", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.21.1

