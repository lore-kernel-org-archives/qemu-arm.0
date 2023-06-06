Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3672525ejb;
        Tue, 6 Jun 2023 11:25:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kJ41eRpJLK2TsROcsxPYgod+wtMazco4hSAVqfmH5jrr6EFw9VNSqzxxUzyPHy47R0SKN
X-Received: by 2002:a05:620a:4cd:b0:75b:23a1:421 with SMTP id 13-20020a05620a04cd00b0075b23a10421mr606956qks.55.1686075944169;
        Tue, 06 Jun 2023 11:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686075944; cv=none;
        d=google.com; s=arc-20160816;
        b=hKAOYhXucAM3NF37Xrz4n5bP50+zZt12LHqJ3LN0hlJGYcTR9Pl9fQPltZKfzqgSGP
         iwJwgS8FFEBvi8hYuAzcUS7UP9gQveRl92gp3yQfbB8Gd8Jp7Fo2Z7F/Y76BKy190PeR
         gCPXqOALaOtYYz16bv7WlIwo8cjAN2MPPUD2nYutYl9zH+jyXBK1/FB2Yz9BPCwEoPu2
         9KfqBi0PLciZ++/HGW7x2zRoQs5rvUPOY+yEwje0oNTYIpJmsg/vHeQHVvFN5suD5Ng6
         qembO/DDwWtgTDBfcEB0goG4wylKjD3bdlI+0cPqFOp5svT76rrbYX+zJthwEDxfyKfd
         4kdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=hkarFlll4QheNZ7Px2BXQ7ts37OVRw4UGlH9q2lLwTI=;
        b=NngojaDZE8Hvx3tD3KCOr9Z6b3wxR1SWtedVpqPaqZR8SjX0sAuWhkZI5rTzQwOBbc
         UR0MoDDPoLzjEXP1FD2yGsghZ785RWOomOQPnwmjgVXaHlTWPxGhQ1Kp6D+hALzGdA71
         IFkRNX3PDSgAXT1NEdZuLrhR+5W9cufY7Lsav/RryMEc24aojxQl4x9O+YiJIP8ogNYL
         NL6ABkv9wwq4svmz0zz/3QMzhGbQqDXryM6tEuNMbQruHNd2N/RLf0GzPIP9Hv/NCitw
         ZFzyBc4B3/VUEb+ScH+cMwT2YLMDGVy6pIZuAYbl9FKV7Id3Krz60ZtC6qA4J+luPob1
         eCwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a05620a100600b0075d538b03easi3924865qkj.535.2023.06.06.11.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 11:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6bMJ-0000j3-3U; Tue, 06 Jun 2023 14:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6bMG-0000hr-I7; Tue, 06 Jun 2023 14:24:40 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6bMD-0004ZI-KZ; Tue, 06 Jun 2023 14:24:40 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id B0F94260B85;
 Tue,  6 Jun 2023 20:24:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeE8Kim353ih; Tue,  6 Jun 2023 20:24:32 +0200 (CEST)
Received: from applejack.lan (83.21.93.182.ipv4.supernova.orange.pl
 [83.21.93.182])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4B5BD260AA6;
 Tue,  6 Jun 2023 20:24:32 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 1/2] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Tue,  6 Jun 2023 20:24:13 +0200
Message-Id: <20230606182414.637467-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
References: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V2EUAR4yUhxj

From: Shashi Mallela <shashi.mallela@linaro.org>

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

---
 hw/arm/sbsa-ref.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index de21200ff9..1520cd598c 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -65,6 +65,7 @@ enum {
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT_WS0,
     SBSA_GWDT_REFRESH,
@@ -108,6 +109,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x44081000, 0x00020000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -409,7 +411,20 @@ static void create_secure_ram(SBSAMachineState *sms,
     memory_region_add_subregion(secure_sysmem, base, secram);
 }
 
-static void create_gic(SBSAMachineState *sms)
+static void create_its(SBSAMachineState *sms)
+{
+    const char *itsclass = its_class_name();
+    DeviceState *dev;
+
+    dev = qdev_new(itsclass);
+
+    object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(sms->gic),
+                             &error_abort);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
+}
+
+static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
 {
     unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
     SysBusDevice *gicbusdev;
@@ -436,6 +451,12 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    if (!kvm_irqchip_in_kernel()) {
+        object_property_set_link(OBJECT(sms->gic), "sysmem",
+                                OBJECT(mem), &error_fatal);
+        qdev_prop_set_bit(sms->gic, "has-lpi", true);
+    }
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -482,6 +503,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -788,7 +810,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
-- 
2.40.1

