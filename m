Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp810489lfp;
        Wed, 5 Feb 2020 17:19:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLpLu2+RvQSwPULXfKXYmOUOIzaaRUswgnZOpl4PLb8cgMVyk+898B3UR3WeITpb3bNINL
X-Received: by 2002:aed:3786:: with SMTP id j6mr592363qtb.62.1580951959369;
        Wed, 05 Feb 2020 17:19:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580951959; cv=none;
        d=google.com; s=arc-20160816;
        b=0taPg3VQVlTR2SYwjSDEM2GduAbmuTp35ju+9KkBuc8eJLMi1rDeYS19X5YePpReCY
         dfVCLkMhbP6uj4hz8PYBio14h3oenCGTk2JCe/eG+/k2mPbCp9JpeEjvRr3XZz/5wKvR
         gWvDkOVHrTq58OH1RvX3Ji3yKWZnyBF2lpgCh9zk41TBVx6QRlojDJJkmuAkgmxVTqVs
         WU/gevULLhWXL/vV/k9Rb/o4i7yyVgTCG5XCjmc2YOKWM5bTFKCN8EdR9omUoEkdVYfV
         s3cOIQdpa7AO7Jr5emk8xTRJySdXpjmDqlK0xudI8uEnYY8+AeZyDIgc1TDHriAgDNTG
         M/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4WczbDSImLLtijqx5Y5H1xU/l5A4G3al/zgyXMX6VZo=;
        b=AoKDL/SfiAA1TAmhsE+eK+62adsfLIW270Fn8utFhWukyYtZYR7QBXSGPHFq1aCbtl
         TWyz13DVSvM3bIcS6bDNcsrlfQikMUbXo1nRqhMiMrKVV11TXk/83/YcTVIRBMbZlsmu
         i88AXMyx9mhe9ctOjcJSGTsYt6TsSAfp0qKYIVWqDd8L6nMm3T5IKL2LphRcgdKPZhLu
         n4TbC7jmyfNmmzT+bhUNJBouRR4aoVL+ZGWXQbJnwoD91E4XQRuQSdY0BTJLMk1RQZO6
         67sid5/O4jtl9dccVc0JjqaQHVJaxN8oTYRODGicsl7fW8LUAQEt8spgmGQ2aMwZmYd4
         0tgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p7WH3EBP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e67si723376qtb.94.2020.02.05.17.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:19:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p7WH3EBP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVp8-0000e2-PP
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo3-00008O-Hr
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo2-0001od-HD
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:11 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38845)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo2-0001jh-A4; Wed, 05 Feb 2020 20:18:10 -0500
Received: by mail-wm1-x341.google.com with SMTP id a9so5038948wmj.3;
 Wed, 05 Feb 2020 17:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4WczbDSImLLtijqx5Y5H1xU/l5A4G3al/zgyXMX6VZo=;
 b=p7WH3EBPk/tvwrL3whPX3zmHC6R8L6Y0IO6etrq5XYvmr7idx/4k0aGodwU5X+sIDk
 GuUDO2aUnoHf+tOlgr3/M9V7qAZxL/7kr0fzfLX/kOPu4je7hk3mWCwOB837aa06j82l
 cp5GM01EEHeC9/xiyb5IDW7ORNEMzTY0W+V/MyzyWb79Wv93NWhOKi6du2OUw4jTkCrU
 /JgBe30P5vF5tlPmPsttKlz6zL3806mqQFY1meSm+JUsLfTIv8st6u8onNVqwS9FUjRC
 8TYIVkYCkeG5hdC4cP4N+tj6B66J8gboI8VW+oYALF9ncRyocB4fBeiz2QBtEg9fni6P
 ldtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4WczbDSImLLtijqx5Y5H1xU/l5A4G3al/zgyXMX6VZo=;
 b=ZwuKpFJnyCE46fspWF45hcPeHfpJqX8wq9fASlSCL3PlvuX+IXEBpKwxKvZ+EipU0w
 y92hdUewLV3wLyRrpuI9obBtFj/U0QFmeh51lSf6YORwPaZtiTevcYJyAWcz0fR/FPf9
 EOWl68lzm7Kh6s4T+gOm7vFv0lxUhwidOKCV9EnWu7Prr/AkFcDyIKyWy6mneQDTqGr8
 A4nVxAafXd5TXfwFxZML2nxl8MhPOM8nMI9cz4k+DW0foY6ra3DWu7ebR8q4t1c8prrq
 LWJOXKzc8L5SzTyBjTvNNuwROeQQ9ajxQ1VeJ0vbWJNN0cyGvXKJyL/8kpsGI3qeqMvb
 2H6w==
X-Gm-Message-State: APjAAAUGevUkTK8gJaZMBM2IeRNxdKD/2VKz3i01R6K9+oJ6+w7MKnwj
 5qsSm8MgY05VdUYhMR8lD+KEL+lG
X-Received: by 2002:a7b:c318:: with SMTP id k24mr685004wmj.54.1580951889166;
 Wed, 05 Feb 2020 17:18:09 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/30] hw/arm/raspi: Extract the RAM size from the board
 revision
Date: Thu,  6 Feb 2020 02:17:30 +0100
Message-Id: <20200206011756.2413-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WfFqT7/sx9r6

The board revision encode the amount of RAM. Add a helper
to extract the RAM size, and use it.
Since the amount of RAM is fixed (it is impossible to physically
modify to have more or less RAM), do not allow sizes different
than the one anounced by the manufacturer.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>

 hw/arm/raspi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 13d41dfce6..2f5cd32c5e 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/arm/bcm2836.h"
@@ -48,6 +49,12 @@ FIELD(REV_CODE, MANUFACTURER,      16, 4);
 FIELD(REV_CODE, MEMORY_SIZE,       20, 3);
 FIELD(REV_CODE, STYLE,             23, 1);
 
+static uint64_t board_ram_size(uint32_t board_rev)
+{
+    assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
+    return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
+}
+
 static int board_processor_id(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
@@ -190,15 +197,17 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
 {
     RasPiState *s = g_new0(RasPiState, 1);
     int version = board_version(board_rev);
+    uint64_t ram_size = board_ram_size(board_rev);
     uint32_t vcram_size;
     DriveInfo *di;
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
 
-    if (machine->ram_size > 1 * GiB) {
-        error_report("Requested ram size is too large for this machine: "
-                     "maximum is 1GB");
+    if (machine->ram_size != ram_size) {
+        char *size_str = size_to_str(ram_size);
+        error_report("This machine can only be used with %s", size_str);
+        g_free(size_str);
         exit(1);
     }
 
-- 
2.21.1

