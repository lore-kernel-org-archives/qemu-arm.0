Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp818320lfp;
        Wed, 5 Feb 2020 17:27:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYUo6hw1gAbHLipSUEIfIUNa1cyBLyXot+KcFRxu3N6PaEXSdIi2ghCxJW8WukO7x8mUMJ
X-Received: by 2002:a37:7d01:: with SMTP id y1mr506260qkc.452.1580952472196;
        Wed, 05 Feb 2020 17:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952472; cv=none;
        d=google.com; s=arc-20160816;
        b=dUCwWMc+23dfpYKhG8sYarvGpdPNN/CI08j8Okiv55Apxo9RIm2cG8S4MweVpIXTQy
         PUP24Y1X2x4isu6B4VZgXiIigNpPeWwYVfAC8+rGOrYNrruLT9IOE0CpC7pDyAjySIvo
         mYiByhDvodE8JHdAqHthqPd6odOtwedrkz6/oJo8K7RT179ZVz5Ug+4+t4GSlhh3MeZ5
         FCyfA6U10FyLkkg93Ezd0j+MVGAh5opS1cC8uLFxL/5k4UMDO93CBXPxDRhfggKWBV+M
         MBnfG6g6YkIzk5DMy344gMsyx2HL7LouZxPNlqzJnUzeZfDBZjgO1k8v6EJntc5jGiq2
         9bVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rQmOHgOI+RgkOPwFIK/xpNJ3XvDpycIgclU+wSqLCT0=;
        b=lyzIWGFNuQUY8f+e8wZJ6i/qKemOd93tMCtfPc61hMV0NnP0Rme2BR0ccWzM6Efff4
         Z7/ey2SeEqoZv82umeZooUDFm1AUI05YOUr88C29pjllL3eXF0Q1d+C8+CkL5XhMGrvv
         3IwYNjFz+F2ZiQ4NqnqDnhgPYMVQ5jE/0Q9MIaWeGaXafOJxhmJ6+3WIFgXjaHUdni0N
         HqtSlUDLZCuRyaNKN6lQaOCW1/fMTYcFeKhHVP6L+hbt/gquHfucMdI+qkew3qi6/uVz
         wJZSjwN7Z+gGeqOBSBvSETHO0EShNdpf09WrnkN+AoXSRzyeucOSBS6BUuIbdL77n2hy
         3wsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZesKS19e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c84si804045qke.323.2020.02.05.17.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:27:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZesKS19e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59295 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVxP-0004hZ-Lz
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoN-0000jd-6c
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoK-00033G-29
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:31 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoJ-0002xM-Rj; Wed, 05 Feb 2020 20:18:28 -0500
Received: by mail-wm1-x342.google.com with SMTP id g1so4472302wmh.4;
 Wed, 05 Feb 2020 17:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rQmOHgOI+RgkOPwFIK/xpNJ3XvDpycIgclU+wSqLCT0=;
 b=ZesKS19eWq5MK0nAAMdsUOfUNqjZHzfFpfmjMR45YQj+mMPwyHDRqfry+1LjCNZwkT
 LvGvT4FEVIMiKfHyDBUXvityBPd3/nrp1U+MaH3B7yRiNDDQOIfLZU7PgGafzZ5RfjSW
 YVlLv1IbX6dSbmwRFedrh/p4rDiAlvwaC11szo9e69DiO1+rfQi2jtSS2LEIKIxBdcc6
 cEXhNhO4b+N6p/AGUnnFp1tCAdKc+joep8M7RQub/taFfzthNxvsVnnIKHCJS88Rki53
 B/M3Pmck1ZJoPSmoKDR6xC88onL9dD4ZVOWdiV5RXeqBVDpDQYaTRBYGBQphAJmf5zpq
 OZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rQmOHgOI+RgkOPwFIK/xpNJ3XvDpycIgclU+wSqLCT0=;
 b=aujt+R2imGDdP+A///AZGbg9hEwFJtHXa85Hw4y/ywHr3B4MgY57jsSzvai0AFMrDR
 0O2hK2uNE1X2AXGZiESm0lE12uQq1lXhNqVDv3VY8kzWCYd9wWkEzlHg7soEBq1hsZYY
 WGb75cfKFsXybDRP0nKA/R4JlzN4+aI7ZYk1quSbHD3LFnL8iA2CN8zMTZ4vQkVckc6U
 iVq3SwUEmsJypzrXtCT/rwLzpE8/ndEy6kpLwqDKf638V9+/b3dSkYMJz9Ctha+Kndy1
 9VtkQJOfSbLFKqYMHoeYMAxQlK9VqBrq1RWJ8qmAHB7rQ+GUiPLu7jcerNtNSRtleB6H
 DxMg==
X-Gm-Message-State: APjAAAWcxbhfspng/WK6ul1JlQo5d//j8olOVFe+ypkJL/nySlhGX94n
 lvyicbkSs0rN5PNkCCRY/kICvjpR
X-Received: by 2002:a7b:c109:: with SMTP id w9mr630872wmi.14.1580951905661;
 Wed, 05 Feb 2020 17:18:25 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/30] hw/arm/raspi: Use a unique
 raspi_machine_class_init() method
Date: Thu,  6 Feb 2020 02:17:38 +0100
Message-Id: <20200206011756.2413-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gQ1EO6xxM/k+

With the exception of the ignore_memory_transaction_failures
flag set for the raspi2, both machine_class_init() methods
are now identical. Merge them to keep a unique method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/raspi.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index a104393cb2..8fe07db47a 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -293,7 +293,7 @@ static void raspi_machine_init(MachineState *machine)
     setup_boot(machine, version, machine->ram_size - vcram_size);
 }
 
-static void raspi2_machine_class_init(ObjectClass *oc, void *data)
+static void raspi_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
@@ -310,41 +310,22 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
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

