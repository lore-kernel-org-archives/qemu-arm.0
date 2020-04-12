Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3154478lfm;
        Sun, 12 Apr 2020 16:04:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypINC6Om0pG5UAke2SEu4Wju6t6SdaTxajv8y+vkTcZWjjb0ozSuOIkklDA86B8hUf+UToL+
X-Received: by 2002:a0c:b582:: with SMTP id g2mr15046169qve.64.1586732657837;
        Sun, 12 Apr 2020 16:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732657; cv=none;
        d=google.com; s=arc-20160816;
        b=q9HK4FrVreOZETv+z7uZeGTqYg2bWScxAFF7F474x+iBuOHLfGssQAJwtEkrniy5BC
         e/NmoLxeD3/RkfL/r1OKp6ZBXRHoSeMMB+W5ykZjxDNIU2QsPopE5ceNzvWiuT7adfg9
         vIaYp1it8n5qrxYygrFsed3hbxAmvGjkvTPKEgg+K4TaUWYkMW2uwBpvJp96iDjMXDMH
         XXDsQDuqXAMsQvWsEEEaAxS131syS++lsmtMfldyVtp0jtF9cKnMVQtj+XI7a6rQ/J/y
         t81GOpUtjPuzJ74vDYc7obwADdxg85HgJaPOx2B09+4dlkj4iOaKxkSWLc6ODszhzhRI
         NPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N0E+d7bBUYfONWd9t3x+rqRRRnhm3na+/bNuaZR/bws=;
        b=GIEWv13iqwmdv1aNJh9nmT0ZNY19RWX/2v6TKE1SArVRMIPZVymjVjFlYzuD9tE7kW
         fwa1Ww7HbPKZMI9E8qUSld9id17KIQkWASF9b64jfJ8O6PKwt1smv2ru85HbInDAx7Oe
         Qt0b8ra7BtIhwpIHg+UzxNEH69+nwQtrcVgLz0G3/toiKRCAioizYmauBntYwHx7lLKz
         csip8TA3UxYl7pyAMSE6ndoHSX90wOt+TfJNzrJbEcYHx3B0Pb8FYSyCiYG0VnXgtSSG
         BYJr4NVAIya1pxlxsk0QqHhHbGlYe+ETqf84bGbZI4ivwglpdogiZ9lrZJ4ubojZzczR
         u8IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TXzR3CUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si4751393qvu.162.2020.04.12.16.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 16:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TXzR3CUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNleD-00025q-AM
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 19:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlK4-0003I9-2P
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlK2-0006Yt-Ec
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:43:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJp-0006R4-CI; Sun, 12 Apr 2020 18:43:13 -0400
Received: by mail-wr1-x442.google.com with SMTP id a25so8572455wrd.0;
 Sun, 12 Apr 2020 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0E+d7bBUYfONWd9t3x+rqRRRnhm3na+/bNuaZR/bws=;
 b=TXzR3CUFbWGYmHC4/zzLDdvd2w4OlACatu8wYiHZzAlaXc3zyUndgf8jLU39pvT8tk
 FBWtdmnfkKKxn3pLN6t3uGWqqAkqoa/OwLoUcjsagQnnpy236JBMk2cSjKV/LauaIo4r
 w75g5GEH9OCME1plcfyOC+ZzbfaQ7o7Nx/75caa8RdcsI1ELv/NLeDvfg6zbrfeRSkj3
 p8MdED05vqnh4UdR8X9DUeiafdumM+PYPBHm0uJf9JYWSYuUT2MFfaHIfZ4pPUhogXZ8
 eTubcNEK0SoUThiHDZpn0yKFZDfvvhyufq25+IRBGp6Y69Dc6wTiLFH/qkzhHY34E6TI
 5x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N0E+d7bBUYfONWd9t3x+rqRRRnhm3na+/bNuaZR/bws=;
 b=rWao2I3PtC5//EMudhd3uVGo332ETULN3QkfqyKt9rJdCeR8Je53LkI1nmL2+RDgGj
 SZdEemsdpiv+RbavfrKjLLuyF4Y5je04OsOzAL/iNy8OOSnJ1MCp3UD07Z8xhvmZFv8U
 E2Jhhb1/Ejc+XTIq0uhP9shi3iM5Lo+zaskx7E8RkyIN+rt1G8FGPxYFlpI7fGSwejuV
 s9Cpz4Z2erDrI6+KLNXeotKTrlRIPlGgvudBF/M12WKZMkviWjfjcXioc08gbuQWhW7V
 t5bUuddoDgoRCtXTDvPpywUx0ZeS9I5NLkGk86ROV3NuVoCFK6ViIU8VRSSnoaGNzpXl
 PA9g==
X-Gm-Message-State: AGi0PuY+WdlbqLBvEZ4UGKjj0sk1UFu5gy/8o4BvseV+yx3VI9Qjm9o3
 UEQB+55fEFCzE+7ENx8NJJcudABRrNEeKA==
X-Received: by 2002:adf:f98b:: with SMTP id f11mr15742291wrr.259.1586731389248; 
 Sun, 12 Apr 2020 15:43:09 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:43:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 22/23] hw/riscv/sifive_u: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:43 +0200
Message-Id: <20200412224144.12205-23-f4bug@amsat.org>
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
X-TUID: bK7qcu3Y+h/R

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/add-missing-error_propagate.cocci \
    --keep-comments --smpl-spacing --dir hw

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/riscv/sifive_u.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b07526aba1..b6c27bc970 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -574,9 +574,17 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, false);
 
     object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
 
     object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
 
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
-- 
2.21.1

