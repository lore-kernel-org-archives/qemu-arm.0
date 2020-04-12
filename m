Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3149495lfm;
        Sun, 12 Apr 2020 15:57:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypLmLygktzRvm14EO+3pQZG/YmrOINrBI+chlz+aVIMrNZuI/AY3dRMVV2hqFk1lBQoUfkim
X-Received: by 2002:a37:48a:: with SMTP id 132mr14358165qke.390.1586732268290;
        Sun, 12 Apr 2020 15:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732268; cv=none;
        d=google.com; s=arc-20160816;
        b=hq5SJT6JYtO/5iPQNSAJ72rYkHaAEchKbO1Y3r1QD09GtJWhQ/Cpmh6FBRRrKPlEAi
         BxqW32DLu292vjwg77mu0cAzIAXEU/0oX2G/ZWzcccOxNvVAd9UCZzGmg17e2Kji+cyq
         tPMo10LJlDqlYwJ3nbr9O+WUnFKpcwzfNXq9kPZjIIq3aqnfzaOTFzYZxyP79GtT90YI
         pqwber5CtCiLPfR2yRzPA3xEq/tdYTG8r0jGXgSQ4SNoQo9581y0X7fPix+V9iSzH1uU
         ZCAOK9Qf4wF25EVu25ZIoeqGQh/T7U86lMyygAYAmDiieBE9KuHT0QpM24FYC1VzHuUP
         G9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=74G8KHhadiGPyGitkFydcSDSAs1meyukZBFpYk9pD6I=;
        b=srrTUmSElMwNymXyq3hVL9ppB+ZFTpQBcmn/lI/Q/PI7YdesFof8FZgLb5/WJ5zQgK
         qnCopaCwBYy3M1oOuv8rIanKPdNbx46CDBiuPmCkGKU0VfY9oLB9JOFFh+s0EcXtb9TZ
         rcQEBGrrO6uGBfi5XpYJQNqnr0K+2Jazhbt1J8aA6AsxkOByLq3YP3YA3jR0rNq8P6SR
         eSAf6HM2S/GQ8WLHti502P2ctqhGta/aoFUqHzi5iK4/ZdKKrQvR0Vhdj7hS1ii6081G
         dj+AJovuoX1/PjIqEcFXCXz8BdhfRtTMAgdD2JqgnBrLWpxOKiZv9Qspx75CI0i/ZifZ
         xwQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dPCfqUi+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si1505337qtn.367.2020.04.12.15.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dPCfqUi+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlXv-0005Eh-0R
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJE-0001fe-PV
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJD-00068W-Eo
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:36 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJD-000686-9L; Sun, 12 Apr 2020 18:42:35 -0400
Received: by mail-wr1-x444.google.com with SMTP id d17so1634792wrg.11;
 Sun, 12 Apr 2020 15:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74G8KHhadiGPyGitkFydcSDSAs1meyukZBFpYk9pD6I=;
 b=dPCfqUi+fQcBEG3K/WPUk56J0LAaObHIxDG46h8wY4ZNxJLUwgj0NWwAwtUyFExGA5
 r5+4rSPzbfX1aAnLWCYcyKaohy7boPLvXOAepLJ662xZIblElg2FuJbH9ri897tTWZt6
 6dX5pQ1pFJrNZCtU/FRBwVhqd3WEKQzg34n135qBqGR6o/WT66bm/AhG31Mp2g7nVTy1
 SFvZGg+UwXBXaJM28hgts6+00mKiW6O1ivAvRJWYTbL2x/xGQq/FTarhAjFQggLC9JcG
 E1hW5iuN9t/c0S+zX8j1T48TCU8lERf/8j3iJAPh68RiIHQKW1o0OtQD+wO7zRQZOinH
 ipyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=74G8KHhadiGPyGitkFydcSDSAs1meyukZBFpYk9pD6I=;
 b=f772oGezS01RVlhSF2S1PMy8ic33QAldzotRBNvP+GFoFMN+ozuJrnXwSj3nVmHTr7
 ZnBFtSRCaGs08sJRJFW2z6jpHeQSIjKcyTE+8ZU1CYN2WccB0jsHElf2L4Bi0oqczUrx
 agOXqU77uLNMW/9NUAYdJPkNyaxZzufHCPLBlmDTgZ3LjTFCgWo5rnotOtLRgj0q2aD4
 3HMl2JpS36Lr7h7MbqniK1Uow47OkDLszbio4AO8uTiijP0lKUqd1j+6pjTjMUTuDD5W
 3ommnp8/IJ84YS7y7PqLrB6zlqDo+q1AzUwxd1A6M1nTHG/dRIsAST7On7O0wS7F+G6d
 bNIQ==
X-Gm-Message-State: AGi0PuZ+kFCw8pkKLWlEwrYmVYxBu40oG60WuzXIZWQrfFbX8TxEWGGI
 UviXaCoHSmmY80ID6CC/wUGR0S7qxqFj1g==
X-Received: by 2002:adf:9441:: with SMTP id 59mr15577538wrq.211.1586731353887; 
 Sun, 12 Apr 2020 15:42:33 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 12/23] hw/block/onenand: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:33 +0200
Message-Id: <20200412224144.12205-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-TUID: 9GeKU4g3JGRD

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/onenand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 898ac563a3..1f68dba28b 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -810,7 +810,11 @@ static void onenand_realize(DeviceState *dev, Error **errp)
     s->otp = memset(g_malloc((64 + 2) << PAGE_SHIFT),
                     0xff, (64 + 2) << PAGE_SHIFT);
     memory_region_init_ram_nomigrate(&s->ram, OBJECT(s), "onenand.ram",
-                           0xc000 << s->shift, &error_fatal);
+                           0xc000 << s->shift, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     vmstate_register_ram_global(&s->ram);
     ram = memory_region_get_ram_ptr(&s->ram);
     s->boot[0] = ram + (0x0000 << s->shift);
-- 
2.21.1

