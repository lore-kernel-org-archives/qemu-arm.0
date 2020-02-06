Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp812490lfp;
        Wed, 5 Feb 2020 17:21:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBYMgcjwBwqPu7QY0rlPMeSENIcuGhd9T/05ch/AtRVzJpJ8YciOh9Ni4MqBRDuzf9XgCL
X-Received: by 2002:a05:620a:201d:: with SMTP id c29mr460066qka.91.1580952078542;
        Wed, 05 Feb 2020 17:21:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952078; cv=none;
        d=google.com; s=arc-20160816;
        b=mfveQ/PTvv0RJXN6O00weLdjEF9uHkDEH3VedGK0/4TAhLQGesaXGcnO583DRMEwSj
         4Y2vZUPXYY5SxHMBm9qlThz3oTY3sSZD03EcEiV+BgFXPAhIFCSxwcaxmqV0SMJxGEKU
         Vcmg2MisATy2FjLdT93RFfWGNgz9uj3CnfS/SV2tjblyvV6wIDVRcDf5cBaJJGmFnMqb
         k+G36ZkhC6yXgRDR2mnpYn7vLp5Ffx6HMPtFlA2a2wB1xYIYIMd/k2sekIPernUwgM2u
         mZHSW5ZONU5XcRF77Ci6r9A2Iqz+6GcOJEV2Sk7r1fB7bKxz9rP/pvtDIAr34KpWvuCb
         d20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i+qx0RUWdCwdD1mrdUasvrUyqSxfDdWxzzEP/v8L4ms=;
        b=PAmyTA79H11ZY49QVp3OixuxJMDSmg3yB/f+bkRH6mgzL581V15JI747iYATazjdK8
         YletyGaMQurFMP/CQok/9VhyUoREx30SprWkpt1a+O38gPLJvP7Ih0eiQ7SkMvoDcN06
         WXkZSgKFSy8+RX0L9laKRGRu3F0SlXJy/tJ6ohJvjrGpeVZuCpoaYMMZSBgAZf0Wl1SE
         6Yza5bD3ljpFKSV+JdLnEZjcYZQNpn/LFfwXLVMMe5LZ8ypDw+1NdzK3r28tTNAnoz0k
         wMDXgUoajkytN74pUO22eHm5b8cIMwFroM598OK990+m+tRgkXPWJV+LsfjeAxk2nQRQ
         M2zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ffnts1uE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si697593qtp.76.2020.02.05.17.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:21:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ffnts1uE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVr4-00044L-0Z
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo3-00008y-Qw
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo2-0001pI-N5
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:11 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo0-0001Y7-9J; Wed, 05 Feb 2020 20:18:08 -0500
Received: by mail-wm1-x341.google.com with SMTP id p17so5061860wma.1;
 Wed, 05 Feb 2020 17:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+qx0RUWdCwdD1mrdUasvrUyqSxfDdWxzzEP/v8L4ms=;
 b=ffnts1uEq5g7Lf+uRsN26sMj2pItEHhMPXIa39PB2ZjoAt2rBwdeX3m7CKclXl+EQk
 8OpYTIqAJX1F5J7F1GzxTxr/6SMiR7TZr9YndkrkEsKF5SZN19gtynRTsSpoYm7BIPB3
 izK5t3kLx8v6ufj/QD0cQtwiq0na5hwPXP1+UonuG5YZOHOhoIn5D43kjCv/IcDPS9p8
 gy5ZNEHwwU648OK1xXXOm4R2NwLhmjrkeOqpUK7n6WsLShMOYmq5SAdd7XjQKCIB7voI
 UGCSahPoXzkzdVKcKhch4A2fMXJZTkw2aB7BJNTC8+Pw3Lua/7QeGVshsEIr5cmBJAr5
 bhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i+qx0RUWdCwdD1mrdUasvrUyqSxfDdWxzzEP/v8L4ms=;
 b=GwSLe6uvpAzkVd61QoVQH6wz5cu3IOSGHEZE5WiFV0gUmJdVsoi2gGmmUoc414VdXZ
 21erM09IGYnIHCcBqCrLZXwCuC3s3Qfv/zzD5BZZYMZjpcMpLnD8lvItIVMQk9ybyp/x
 PnvMxAduEx7gEhWwtcxKqGqO21ACXaYYNjYm9GPlw+Fx69stXlmUDJ4yBL8hJnjtRiHV
 Yxj5THwLNn/JruRz4DRgVWLhNm3geSPAmlbXdnbgP5MrliIV2KAFcv8Bb9rMmpq4u6Sm
 LFuAaw0HTRw1coyrFDK4/wRf13FCwoXgq5NPnMB0HtLrLi4dDL1QQuRC9f3yrkZb0H/h
 YDdg==
X-Gm-Message-State: APjAAAWWWAvMySOjLKmWLm1094Fy7LynyHydZbYzl2XIH/2R7nT6H8n7
 z9j1yLkLtdZUErLCbgso336si7ip
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr650354wml.182.1580951886969; 
 Wed, 05 Feb 2020 17:18:06 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/30] hw/arm/raspi: Extract the version from the board
 revision
Date: Thu,  6 Feb 2020 02:17:29 +0100
Message-Id: <20200206011756.2413-4-f4bug@amsat.org>
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gzPWgTbWq8Ng

The board revision encode the board version. Add a helper
to extract the version, and use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>

 hw/arm/raspi.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 3b892bb509..13d41dfce6 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/arm/bcm2836.h"
+#include "hw/registerfields.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
@@ -36,6 +37,28 @@ typedef struct RasPiState {
     MemoryRegion ram;
 } RasPiState;
 
+/*
+ * Board revision codes:
+ * www.raspberrypi.org/documentation/hardware/raspberrypi/revision-codes/
+ */
+FIELD(REV_CODE, REVISION,           0, 4);
+FIELD(REV_CODE, TYPE,               4, 8);
+FIELD(REV_CODE, PROCESSOR,         12, 4);
+FIELD(REV_CODE, MANUFACTURER,      16, 4);
+FIELD(REV_CODE, MEMORY_SIZE,       20, 3);
+FIELD(REV_CODE, STYLE,             23, 1);
+
+static int board_processor_id(uint32_t board_rev)
+{
+    assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
+    return FIELD_EX32(board_rev, REV_CODE, PROCESSOR);
+}
+
+static int board_version(uint32_t board_rev)
+{
+    return board_processor_id(board_rev) + 1;
+}
+
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] = {
@@ -163,9 +186,10 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
 }
 
-static void raspi_init(MachineState *machine, int version)
+static void raspi_init(MachineState *machine, uint32_t board_rev)
 {
     RasPiState *s = g_new0(RasPiState, 1);
+    int version = board_version(board_rev);
     uint32_t vcram_size;
     DriveInfo *di;
     BlockBackend *blk;
@@ -191,7 +215,6 @@ static void raspi_init(MachineState *machine, int version)
     /* Setup the SOC */
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
-    int board_rev = version == 3 ? 0xa02082 : 0xa21041;
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
                             &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
@@ -215,7 +238,7 @@ static void raspi_init(MachineState *machine, int version)
 
 static void raspi2_init(MachineState *machine)
 {
-    raspi_init(machine, 2);
+    raspi_init(machine, 0xa21041);
 }
 
 static void raspi2_machine_init(MachineClass *mc)
@@ -237,7 +260,7 @@ DEFINE_MACHINE("raspi2", raspi2_machine_init)
 #ifdef TARGET_AARCH64
 static void raspi3_init(MachineState *machine)
 {
-    raspi_init(machine, 3);
+    raspi_init(machine, 0xa02082);
 }
 
 static void raspi3_machine_init(MachineClass *mc)
-- 
2.21.1

