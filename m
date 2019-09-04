Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp988619wrp;
        Wed, 4 Sep 2019 10:24:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw98CuafBS88wMqUxWNHs1Q42eZTuPtbF5bPID4Xrj39bV8lhhdKmQ3T71VDCGpRXL/7pqN
X-Received: by 2002:aa7:cccd:: with SMTP id y13mr42815121edt.301.1567617846980;
        Wed, 04 Sep 2019 10:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617846; cv=none;
        d=google.com; s=arc-20160816;
        b=EihYumTAZ8vXJFlaWxyCAhJmt1/gLwi/UG+3QlawcOLszG4tJDDjlLQ1NHfUBb9qfn
         Xy1kBm3wPGAk8Epar/I/lfjNoSqdVRy1ncrCfYWsdTsKxdG7BBSDSplA1ibDVD3FJCvs
         jCoHk3ZiKFGck98Vf1SDkcrJ0qvwJl6gLlZJ7hx4MPwadRpoY4jmGLOLoTI97SI5ebqV
         Ytv9LVbCeR650Ut5PnePpu8LSD8veciIzGTlExptGjRnQelkYkkeLYVj3RqjmxdphyQU
         8wqCNlql06PKtBQHtutNM3PDvvn+Wt/f4gNNVAqbBWANk/ky8wDm0dsQJNt6HbKclh/K
         v/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=S7qhLshgv8PC8yoBGkMqEzXE2knLg4gMrxiA4d+K3Q4=;
        b=VSZdDG/e5zxWBopanb+vQt58qrHGF5eFzj4G6/XeOEu/2rsryeSu3btWfLm+kvUoDA
         sFv16dn8/TmPYI5PNiY6VbmvjgIUAmX+AMyYXzeghk6dqmX+WTEv2HKndZx0waLJYmKM
         eBdGDMP5/ZY/vlmzNoi3CQkViV5yUp6spqx4t3Mu+omOrn2gXeWdJsfdhUjWqXXQGipP
         4OsyMo9F1rlK/9Mc0AsYrtHR+HK4Qdtj+ziTpLGM3R6qwNvdw50p6yyNdQJ+BHR688YS
         0EBrpqL3p8HHPg1kn5jIfwMV4zJ4FZgPfniLsBia53Tv1+XRRSc6bPtL7j8/SSSJ1GWp
         31Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dGyo3sSR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si2807323ejs.4.2019.09.04.10.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 10:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dGyo3sSR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Z0n-0001cU-G6
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 13:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yqo-0001lf-0N
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yql-0007BO-Rz
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:13:45 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54461)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yql-0007Am-EV; Wed, 04 Sep 2019 13:13:43 -0400
Received: by mail-wm1-x344.google.com with SMTP id k2so4122799wmj.4;
 Wed, 04 Sep 2019 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7qhLshgv8PC8yoBGkMqEzXE2knLg4gMrxiA4d+K3Q4=;
 b=dGyo3sSR6uVtDir2QlRv6W4C/7BKr7vf0E/P/R5Hn4SRjQZ1GWlLhy9QRhIhMzIUZB
 izQwPHqe+gcqBElAT5hxOlkorLat4II+sM5Gh0Vgcu2WUwky+JK1gDzDXCLmRPi7leeA
 zcynqY2BObh8zN1IKSa7NxVtUknIf81gMd2K9qwTB8IQUjBNsYE23LWiK4NDIsTDYBVB
 IoIr2Ws3dF5KsI2S3Une0Go/ZPahwWsg1yq42Ynr3NqqVntsbWc4qyHNCmGhxZIurVDi
 z9q2sDDDyRy74iMnvVV9x5N7kZdQ+S/5nD8LnbzewYdgV0yKxp9Gmu1MHr3+unbqx6op
 38hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S7qhLshgv8PC8yoBGkMqEzXE2knLg4gMrxiA4d+K3Q4=;
 b=bvDCGagMDdahgpiONJdAS5PT7BwwNXDY8xi/tQNkGg10nMZvyCINMNjgrL+MUJO7Sj
 OEt2+RQ+7TN6YErPKphl9ZnzmiG8Y8ActoSeMIbi+0KiaRcCvHXtsfxq/66rmlNd3CV2
 RqTP+IFxj6NTzPDOz3ySp9W1hNRd1AGgZbvx3nuvBuH9ZrvPgUEHuQkGUKHHbGQxgNjj
 Ec9jUFPuMNZJl5mh6f1vgZMmNil9v5V2hpviDv1cyFo6Ry4YvZNgszyXp+h9FTtv1mAG
 WfiJRhQlsgxJHTLzUBMlVVwvDDDyh4xT0mRr+U7b6ejDfwF3e2V383JgIFvekqFDzs9J
 mqOQ==
X-Gm-Message-State: APjAAAWxNRhWS5JdMmJft1707mIHtkc9xslysXTAGv/2qSaxXQhsyiG9
 UrlUqAUpsfQt7TZMN8Xlfi4=
X-Received: by 2002:a1c:4b11:: with SMTP id y17mr5254736wma.2.1567617222530;
 Wed, 04 Sep 2019 10:13:42 -0700 (PDT)
Received: from x1w.redhat.com ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id p19sm2339512wmg.31.2019.09.04.10.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 10:13:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Pekka Enberg <penberg@iki.fi>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>
Date: Wed,  4 Sep 2019 19:13:15 +0200
Message-Id: <20190904171315.8354-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904171315.8354-1-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [RFC PATCH 14/14] hw/arm/raspi: Add the Raspberry Pi
 4B board
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MqwOTloWv/xo

The Raspberry Pi 4 uses a BCM2711 SoC (based on a BCM2838).
The SoC can handle up to 8GiB of SDRAM, but we limit it to 4GiB
(no 8GiB models in the market yet).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b4db39661f..59ee2f82b4 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -39,11 +39,13 @@ enum BoardIdChip {
     C_BCM2835 = 0,
     C_BCM2836 = 1,
     C_BCM2837 = 2,
+    C_BCM2711 = 3,
 };
 
 enum BoardIdType {
     T_2B = 0x04,
     T_3B = 0x08,
+    T_4B = 0x11,
 };
 
 enum BoardIdRevision {
@@ -56,6 +58,7 @@ enum BoardIdRevision {
 static const char *processor_typename[] = {
     [C_BCM2836] = TYPE_BCM2836,
     [C_BCM2837] = TYPE_BCM2837,
+    [C_BCM2711] = TYPE_BCM2838,
 };
 
 typedef struct BoardInfo BoardInfo;
@@ -90,6 +93,12 @@ static const BoardInfo bcm283x_boards[] = {
         .ram_size_min = 1 * GiB,
         .ram_size_max = 1 * GiB,
     },
+    [4] = {
+        .board_id = 0xc42,
+        .board_rev = { T_4B, R_1_1, C_BCM2711, M_SONY_UK },
+        .ram_size_min = 1 * GiB,
+        .ram_size_max = 4 * GiB,
+    },
 };
 
 typedef struct RasPiState {
@@ -336,4 +345,24 @@ static void raspi3_machine_init(MachineClass *mc)
     mc->default_ram_size = 1 * GiB;
 }
 DEFINE_MACHINE("raspi3", raspi3_machine_init)
-#endif
+
+static void raspi4_init(MachineState *machine)
+{
+    raspi_init(machine, 4);
+}
+
+static void raspi4_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi 4B";
+    mc->init = raspi4_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->max_cpus = BCM283X_NCPUS;
+    mc->min_cpus = BCM283X_NCPUS;
+    mc->default_cpus = BCM283X_NCPUS;
+    mc->default_ram_size = 1 * GiB;
+}
+DEFINE_MACHINE("raspi4", raspi4_machine_init)
+#endif /* TARGET_AARCH64 */
-- 
2.20.1

