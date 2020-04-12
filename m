Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3151462lfm;
        Sun, 12 Apr 2020 16:01:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLeKKLJJF9CAc4C4AM2lhfP3TvqeSVZ5TKCzFbjXpSgViM42xncc0X+/iXaZIRAYP4wXAxb
X-Received: by 2002:aed:25e2:: with SMTP id y31mr2849460qtc.325.1586732460560;
        Sun, 12 Apr 2020 16:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732460; cv=none;
        d=google.com; s=arc-20160816;
        b=iBTNKhv9k5jAVWWNBDUxwZIakhLZoXl8+C6Xi3aMDBMRaCDt/TNE1/Ck+KegzZ3244
         Fr2hzY6hfhPDIBVuWpZ+fDKcj7rbxlhgYJDsgc0+GoRFf4GjeImgV1s5iWR1Ow3/kVhj
         C1zqZ7utSamG3IJVwBxdY9deMkzfGdJ98tNKQ8zxVfIg2Bw4KiYNJmgmTt/C2lSa99B9
         URH0MvBAJxfAdrPC4ok9RK52pYFKbrAUZ+oA3/NwcAAFHFulUraxbVZyyFGusvCLYN5U
         9zx2V016pB9AgURaOG0ahv7IBRVNg51K0+VUaI3fQL8o/4CFU9u3SyfAP37VwoyL7Q33
         1G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7dngg6q086SdAwClXoi/Rsl8HHPolX2hkbDutRMMkyU=;
        b=wbPAHI2G6ZiyaWo3D4gVaVYU3UIkk/Ms7kHiKqGD2sRbiyoPgvJyKBvZbsPfl2rInb
         7fLJXDyS6XzHT8nvIcdiTLYnJ+9F6B+lmzZ4Q2TCQULtUOljxu9rH61rE1YH/iIe8OmS
         kT8NV0457cjt3cmN6zYAYvxqnSCbshKJ15WHvoa+CdpYqAJ4G0ul7GmdCIG4uxeCsWeJ
         IbazGfGO8sT9hnSkdgRzeUR34Y0SKvaX44//wmpEJhbqC6o/S8po2QQQaEGDnj8bLoHa
         SGqWTdVPEt12aun8SozO59NFilHpc5oEWkNvjqSics4uWm9MWKRYOf1XfDQb1q1Sqz9L
         dQlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pNAolLhF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z54si4958417qtz.178.2020.04.12.16.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 16:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pNAolLhF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlb1-0003JI-TL
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 19:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIv-00011H-H2
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIu-0005yE-FB
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:17 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40840)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIu-0005uF-8M; Sun, 12 Apr 2020 18:42:16 -0400
Received: by mail-wm1-x344.google.com with SMTP id a81so8367843wmf.5;
 Sun, 12 Apr 2020 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dngg6q086SdAwClXoi/Rsl8HHPolX2hkbDutRMMkyU=;
 b=pNAolLhFwovIx8wy2XfNJdAfOikbLSS9WvAaniqx00H72xuF3mUuRBb/rFqJSU88RV
 oToqDKR4CivuaQRLHjVg2/dcMuFc7gdDw5C2Y2v6qPHT2itSnC4lEq/7/Bk/mQnK8US3
 epjnXNaWy073XrwjDBYSI9hmVHYGGfOL89OqrHh1FwpZDZto4XaobvSdOGN6SwUsl2tA
 qzkQ46eE24Bpe7LN9MNebWmQCYADh+ENmq+D79hdH1E9mn00/VtbFGCg9Hqovb8s/cR1
 WRxqD9NcOMGKLx5zmtxSb1Ryid41/WdGmzMJOVZyYp48aiYacVZDVbzOtWiJSDmEdWVI
 TDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7dngg6q086SdAwClXoi/Rsl8HHPolX2hkbDutRMMkyU=;
 b=GHf+gH2KIlHTn4tlqRpWcuGvGTkx7x3vsWW3XLb/iGcimLwWGU3f85olVKvHOQo8hw
 TfkYL59VfFBmRQO3J7akEG8DftFh0/hYSijc39o43AnjU35ifGOFzQW1BqGIexYweaUE
 wmc5EMt8876mjxDQLg6Y+4r9Emj7nSy1lR3b4DkjnL0Q7v4ltKxrPgODC1FNzU5MwBI7
 N+aNMzTWiQKtG1sLtEBDiBw4R33muw9bGsSz7Q5ziCKJ61GQkOuJQVQNCtNVP2EcMIvk
 f8hRnuLCWC67X89Ivs5YQjOHt6zT6OxXvrRGbN1xsU5pev+/6wJ22cHyyo/SL0bHgf0g
 tZRg==
X-Gm-Message-State: AGi0PuYRqNmPHU2jkrhUeVNMBnaeG6gZoFy5FWyIcMaTwfVO6Lu8a4BR
 UKv5PX5x/Ldz6jlWq9wvhfeFyj8HU7ZEGg==
X-Received: by 2002:a1c:a7d7:: with SMTP id q206mr15060615wme.45.1586731333155; 
 Sun, 12 Apr 2020 15:42:13 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 07/23] hw/riscv/sifive: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:28 +0200
Message-Id: <20200412224144.12205-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
X-TUID: AXVIYhBJpPZv

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/riscv/sifive_e.c |  6 +++++-
 hw/riscv/sifive_u.c | 24 ++++++++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 0be8b52147..6d4e141ff7 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -156,7 +156,11 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *sys_mem = get_system_memory();
 
     object_property_set_bool(OBJECT(&s->cpus), true, "realized",
-                            &error_abort);
+                            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_E_PLIC].base,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e13ab34de4..b07526aba1 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -508,9 +508,17 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     NICInfo *nd = &nd_table[0];
 
     object_property_set_bool(OBJECT(&s->e_cpus), true, "realized",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->u_cpus), true, "realized",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     /*
      * The cluster must be realized after the RISC-V hart array container,
      * as the container's CPU object is only created on realize, and the
@@ -518,9 +526,17 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
      * cluster is realized.
      */
     object_property_set_bool(OBJECT(&s->e_cluster), true, "realized",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
     /* create PLIC hart topology configuration string */
     plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
-- 
2.21.1

