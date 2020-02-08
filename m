Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1924516lfp;
        Sat, 8 Feb 2020 09:03:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzA9KdJ3xhXTZdK3BU3c3ve7heTk5+KwIL24xwD1vg/BWGqsYGGptprwv2C2eNM0F+0ZMBO
X-Received: by 2002:ac8:3fd5:: with SMTP id v21mr3436177qtk.345.1581181439480;
        Sat, 08 Feb 2020 09:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181439; cv=none;
        d=google.com; s=arc-20160816;
        b=gYiYC+LjhrbCJ5qbyq4gmiLzyiy8svfUxHehAMduKg4wVIRQrWdNOFxuPS0qIMEGiU
         Ln1GfwMvbR2tBup/dYXnk7as/ePDKB44vfmrfFm70I6dYouTmyfjrjFOUHLA+zBlpZAk
         hHIlKmBWzJfk9vh+fAxDgibesTTIctz2fVUyaVk8y61L8EU3hTqJiYdLKexLtcIai9Mw
         mNWJIg0RgPLqcInMejHzq3VtkmFfLisyEyeo6Ns/4zluGbESkIu27XORXllrzSgfrXSq
         FbEnKhktxm943lRq25s7q/Qr+CPk0O7xR+vXvzFlmNsSgdF1L+fSVkHR5JRlilolseRP
         s0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+Rp+SKpFYOJ3Mi9QveQx+SuJfuhrTxn0ecf+GdPK71w=;
        b=i40xkvVmMUx77Q8u/Ii+SxrbdZ3qXViAuLUGMQvUL35hHDREaq/zbC1gf718cNfHdM
         DdRYBDbKRX7cGX1P3PX/AHmeqSgwtSXogTEcPI+ykEhrFptmO81eXdGAH8dtc5rJAu7c
         nWt0nvb8e4bwQgs5ditgbKP2NFMJIBnSNwejYZv85Y4fMPKNhiLzo5RKDJZGaeRo8ltZ
         7UwxC1Avv0GuLfXkXx6hgnP1NoXdevzIgQJA96g+XQExusk3TJAPykq1Pbf2MY+MljUI
         AqEcgbiBehYK2MdhvcuE+qf92xsnd8HXLrUixPIdX4N/ssl7WuoSCTDfq2clyJOcjD1g
         orAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iLCCIwv6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si535126qkl.94.2020.02.08.09.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 09:03:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iLCCIwv6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TWQ-0007zD-UJ
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 12:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ5-0006Hw-NQ
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ4-0001s5-Jk
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37287)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ4-0001rp-Ce; Sat, 08 Feb 2020 11:57:24 -0500
Received: by mail-wr1-x441.google.com with SMTP id w15so2500107wru.4;
 Sat, 08 Feb 2020 08:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Rp+SKpFYOJ3Mi9QveQx+SuJfuhrTxn0ecf+GdPK71w=;
 b=iLCCIwv6c368Mp9aWasGLDkPRD6pgTk82heR7ixxQC4JHOpD6yt1eErSwTmVT7Yc0a
 yMjUReDK5K1JUXANiWaHxnLup2dYkgXSS7mZTOmtxLr6yLWTjI6w9PsDhooDLmOfXTCG
 S5sTqnqqZivgA12MZ9bCdzfO1oecdG3mU6VZP6+6FDn3LsJcFWN93m7XRCKQaiQmYhS0
 Xv6O9uM3t8DYUCJyK0d+CR7MMCuThHrm0Yfb2OAa7ucsjPJ85TRb3uXyGm/28g2R0Ozn
 9ANBzYaxzD6GiAIqfbmvGKvQ5RtVL6eH4DdBD79W0pxrg++jnSY68ndLTy6uas3nV72h
 N5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+Rp+SKpFYOJ3Mi9QveQx+SuJfuhrTxn0ecf+GdPK71w=;
 b=RSonXk8LR5cInhg+koA+8mBa0Bdh64zrEDmXaJaKBe2n5vDuFAgK6VK35ECDyfdUNI
 R7vEPuzSpVa8urY1bcePa342qiohqloMikuQUAS3cRc//3/5kycUDj4W46w528m5+wAj
 67M/Qv+S6//XfI0IR8+FhzEp5FTGNoJXNZKtMLpNoLEmDblpEOcX0qw6FqocyyXSWa10
 NtxgbIdqncX84U+gtq78Siv7Uvrwk1mcCp4PXg3k0QO9hHqFY/pRIyl5LE7qwUH/Fanw
 /GXP1jWz0CDVz0miJK/z6OW0jKxezN+AXrmTYP/Ah2HP43wudl2XO3y8AcBP6qCVUavD
 WkbQ==
X-Gm-Message-State: APjAAAU/Lv1YVc4cOGbMY/VNbDJPBo44lyU1//2mPtHEY4gV/015On11
 xkrp1KfoHfsO5lXiz+223myRLDnP
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr6221682wrv.426.1581181043242; 
 Sat, 08 Feb 2020 08:57:23 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] hw/arm/raspi: Use a unique
 raspi_machine_class_init() method
Date: Sat,  8 Feb 2020 17:56:44 +0100
Message-Id: <20200208165645.15657-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jKjC0hRFovAJ

With the exception of the ignore_memory_transaction_failures
flag set for the raspi2, both machine_class_init() methods
are now identical. Merge them to keep a unique method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/raspi.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 0537fc0a2d..bee6ca0a08 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -294,7 +294,7 @@ static void raspi_machine_init(MachineState *machine)
     setup_boot(machine, version, machine->ram_size - vcram_size);
 }
 
-static void raspi2_machine_class_init(ObjectClass *oc, void *data)
+static void raspi_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
@@ -311,41 +311,22 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
     mc->default_ram_size = board_ram_size(board_rev);
-    mc->ignore_memory_transaction_failures = true;
+    if (board_version(board_rev) == 2) {
+        mc->ignore_memory_transaction_failures = true;
+    }
 };
 
-#ifdef TARGET_AARCH64
-static void raspi3_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
-    uint32_t board_rev = (uint32_t)(uintptr_t)data;
-
-    rmc->board_rev = board_rev;
-    mc->desc = g_strdup_printf("Raspberry Pi %s", board_type(board_rev));
-    mc->init = raspi_machine_init;
-    mc->block_default_type = IF_SD;
-    mc->no_parallel = 1;
-    mc->no_floppy = 1;
-    mc->no_cdrom = 1;
-    mc->max_cpus = BCM283X_NCPUS;
-    mc->min_cpus = BCM283X_NCPUS;
-    mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = board_ram_size(board_rev);
-}
-#endif
-
 static const TypeInfo raspi_machine_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("raspi2"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi2_machine_class_init,
+        .class_init     = raspi_machine_class_init,
         .class_data     = (void *)0xa21041,
 #ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi3_machine_class_init,
+        .class_init     = raspi_machine_class_init,
         .class_data     = (void *)0xa02082,
 #endif
     }, {
-- 
2.21.1

